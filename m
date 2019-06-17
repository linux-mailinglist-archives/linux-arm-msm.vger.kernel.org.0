Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1841848689
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 17:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728254AbfFQPFI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 11:05:08 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:47014 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbfFQPFH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 11:05:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=gTKlpQWOKMdvBizylMdVUX6tkK8otEUiw4iXsxTBGyI=; b=r1DA3A36l1XskVNbLdokb8dOe
        vb1sMUcPghIIeig26uHm4pz7UXXZYKREKoIdPoLOpqXT2Vr/aRzBuuFVCwQXZN/ZwQvmMrvNiltVj
        wt+u6FJFsW1n8YFaGiytRURJMV2k99PQwM98Sum5Wyf7mQrmUL3ejXLGdZhlSsLVUvp9k=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hctBv-0001tQ-6B; Mon, 17 Jun 2019 15:05:03 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id 9286B440046; Mon, 17 Jun 2019 16:05:02 +0100 (BST)
Date:   Mon, 17 Jun 2019 16:05:02 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     lgirdwood@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/7] regulator: qcom_spmi: Add support for PM8005
Message-ID: <20190617150502.GU5316@sirena.org.uk>
References: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com>
 <20190613212553.10541-1-jeffrey.l.hugo@gmail.com>
 <20190613212553.10541-2-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XUmrTyVHrg2/ImRG"
Content-Disposition: inline
In-Reply-To: <20190613212553.10541-2-jeffrey.l.hugo@gmail.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--XUmrTyVHrg2/ImRG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 13, 2019 at 02:25:53PM -0700, Jeffrey Hugo wrote:

> +static int spmi_regulator_ftsmps426_set_voltage(struct regulator_dev *rdev,
> +					      unsigned selector)
> +{
> +	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
> +	u8 buf[2];
> +	int mV;
> +
> +	mV = spmi_regulator_common_list_voltage(rdev, selector) / 1000;
> +
> +	buf[0] = mV & 0xff;
> +	buf[1] = mV >> 8;
> +	return spmi_vreg_write(vreg, SPMI_FTSMPS426_REG_VOLTAGE_LSB, buf, 2);
> +}

This could just be a set_voltage_sel(), no need for it to be a
set_voltage() operation....

> +static int spmi_regulator_ftsmps426_get_voltage(struct regulator_dev *rdev)
> +{
> +	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
> +	u8 buf[2];
> +
> +	spmi_vreg_read(vreg, SPMI_FTSMPS426_REG_VOLTAGE_LSB, buf, 2);
> +
> +	return (((unsigned int)buf[1] << 8) | (unsigned int)buf[0]) * 1000;
> +}

...or if the conversion is this trivial why do the list_voltage() lookup
above?

> +spmi_regulator_ftsmps426_set_mode(struct regulator_dev *rdev, unsigned int mode)
> +{
> +	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
> +	u8 mask = SPMI_FTSMPS426_MODE_MASK;
> +	u8 val;
> +
> +	switch (mode) {
> +	case REGULATOR_MODE_NORMAL:
> +		val = SPMI_FTSMPS426_MODE_HPM_MASK;
> +		break;
> +	case REGULATOR_MODE_FAST:
> +		val = SPMI_FTSMPS426_MODE_AUTO_MASK;
> +		break;
> +	default:
> +		val = SPMI_FTSMPS426_MODE_LPM_MASK;
> +		break;
> +	}

This should validate, it shouldn't just translate invalid values into
valid ones.

--XUmrTyVHrg2/ImRG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0HrB0ACgkQJNaLcl1U
h9B0uAf/cYrB30Ayjn0Man4vuddPN/hR/NlbKN1B86AvFrFe6mrHPSuIJUdydTG+
MtukGFvwCTrnDhnBMxcXeCGsgNrpFpPMcmvk6+5+PZH08FVYBBS6TzPOwTZewmjn
WVDr6XBug+yYu5+2KMTskQgnfykO+iqMYHx6UyqaDuia/pYCUMoVz+5TVG0KUOYJ
knWxItKJ3NGD1DlALPCk0K7+P8krq+e09mJME8OSi5HqywdmqxTtPlNbwRr5/YKR
2ZXAyo4eDjJTE5MowrnA2yEl1d3eKFH6oYBy7btNQF7U8669XprdWTdsTLa+yj0x
FC/y90cEdM7bE2QMxfyOs5aaBDGroA==
=xcfk
-----END PGP SIGNATURE-----

--XUmrTyVHrg2/ImRG--
