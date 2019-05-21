Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11390257C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 20:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728055AbfEUSvE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 14:51:04 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:41260 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727990AbfEUSvE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 14:51:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=uyW5JgqktOeQEaUw+A116CMaNFtMso5q/Jn1XmiRdLk=; b=dDdIXaNASaq3WoLuurvMj9md7
        p/iCtcLueRbPFYhFf0qk0VBRZWlhE5Aqp7tYt6UcvEUf6Tb5msHtjIncicKr2PpEcj4FlFzAv/dwH
        uyMFgIiKCI/cZQ7iFeglH7xxmiEBlishs+UuXJv/3+LNnC3icSCCPBwRg7RQrMJYcBJCM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=debutante.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hT9qk-0000WF-5e; Tue, 21 May 2019 18:50:58 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
        id 8B8F51126D13; Tue, 21 May 2019 19:50:54 +0100 (BST)
Date:   Tue, 21 May 2019 19:50:54 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     lgirdwood@gmail.com, agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, jcrouse@codeaurora.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH 2/3] regulator: qcom_spmi: Add support for PM8005
Message-ID: <20190521185054.GD16633@sirena.org.uk>
References: <20190521164932.14265-1-jeffrey.l.hugo@gmail.com>
 <20190521165315.14379-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="C+ts3FVlLX8+P6JN"
Content-Disposition: inline
In-Reply-To: <20190521165315.14379-1-jeffrey.l.hugo@gmail.com>
X-Cookie: Do I have a lifestyle yet?
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--C+ts3FVlLX8+P6JN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 21, 2019 at 09:53:15AM -0700, Jeffrey Hugo wrote:

> -	spmi_vreg_read(vreg, SPMI_COMMON_REG_VOLTAGE_RANGE, &range_sel, 1);
> +	/* second common devices don't have VOLTAGE_RANGE register */
> +	if (vreg->logical_type == SPMI_REGULATOR_LOGICAL_TYPE_FTSMPS2) {
> +		spmi_vreg_read(vreg, SPMI_COMMON2_REG_VOLTAGE_LSB, &lsb, 1);
> +		spmi_vreg_read(vreg, SPMI_COMMON2_REG_VOLTAGE_MSB, &msb, 1);
> +
> +		uV = (((int)msb << 8) | (int)lsb) * 1000;

This overlaps with some changes that Jorge (CCed) was sending for the
PMS405.  As I was saying to him rather than shoving special cases for
different regulator types into the ops (especially ones that don't have
any of the range stuff) it'd be better to just define separate ops for
the regulators that look quite different to the existing ones.

> +static int spmi_regulator_common_list_voltage(struct regulator_dev *rdev,
> +					      unsigned selector);
> +
> +static int spmi_regulator_common2_set_voltage(struct regulator_dev *rdev,
> +					      unsigned selector)

Eeew, can we not have better names?

> +static unsigned int spmi_regulator_common2_get_mode(struct regulator_dev *rdev)
> +{
> +	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
> +	u8 reg;
> +
> +	spmi_vreg_read(vreg, SPMI_COMMON2_REG_MODE, &reg, 1);
> +
> +	if (reg == SPMI_COMMON2_MODE_HPM_MASK)
> +		return REGULATOR_MODE_NORMAL;
> +
> +	if (reg == SPMI_COMMON2_MODE_AUTO_MASK)
> +		return REGULATOR_MODE_FAST;
> +
> +	return REGULATOR_MODE_IDLE;
> +}

This looks like you want to write a switch statement.

> +spmi_regulator_common2_set_mode(struct regulator_dev *rdev, unsigned int mode)
> +{
> +	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
> +	u8 mask = SPMI_COMMON2_MODE_MASK;
> +	u8 val = SPMI_COMMON2_MODE_LPM_MASK;
> +
> +	if (mode == REGULATOR_MODE_NORMAL)
> +		val = SPMI_COMMON2_MODE_HPM_MASK;
> +	else if (mode == REGULATOR_MODE_FAST)
> +		val = SPMI_COMMON2_MODE_AUTO_MASK;

This needs to be a switch statement, then it can have a default case to
catch errors too.

--C+ts3FVlLX8+P6JN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzkSI0ACgkQJNaLcl1U
h9D4Pwf+N0VEAMaUrHu9DiDBqWU4jYSrQlR7BPtYN4DHzRzhYd/GSW4c1RhNMsz4
og7GQSz83ppbsfv22Sf1/2ivsR/0VihEhoOVduEnH2MJcowZwd4vUnNfTvOuAcvN
nN/THjD7Nz4GpP9QBetIwsInrafl+bbpMedq0fI/u6EsUSNOmoHnFxgJM8aXxYJQ
WzquUkwu8XTUi5UNspFDXXTRYmjfKAiY0fYSsATVZOZHtSCktsijI35IN77oxvSB
l2UT7XH3xXPQ7UyeF64U4Yp7L+NeYrh7eX6qZGb5NaUq1k/CiruEZK/OUkNkkNsR
sQWT5yGgYmgS2BOIlXy3SsNbouafeQ==
=vCWU
-----END PGP SIGNATURE-----

--C+ts3FVlLX8+P6JN--
