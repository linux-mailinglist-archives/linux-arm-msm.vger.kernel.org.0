Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 391A9449AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 19:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728470AbfFMR1l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 13:27:41 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:41150 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727230AbfFMR1l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 13:27:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=sPVppO9PYS7G7+nG5fnc2Y8BpX0OMOqRo5fudgsdyI8=; b=LIBmv87usk9CI4nn9Mh/gwFFh
        XZAUCoQrVaJbsKgf2zvtHjLnp8vCvAk40PE2YNdN9I7v3nemx5q2sXiC5YUC//rnV/hYcZILDwcAv
        jyzt6kGMTNY7t19AMXd5h3VnrxWc8TEzXNSdzPpghXyoI/rK6xZo3REeWhQ4gHNVgKmCo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hbTVi-0005Kl-Lo; Thu, 13 Jun 2019 17:27:38 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id 28A15440046; Thu, 13 Jun 2019 18:27:38 +0100 (BST)
Date:   Thu, 13 Jun 2019 18:27:38 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Nisha Kumari <nishakumari@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, lgirdwood@gmail.com, mark.rutland@arm.com,
        david.brown@linaro.org, linux-kernel@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org
Subject: Re: [PATCH 4/4] regulator: adding interrupt handling in labibb
 regulator
Message-ID: <20190613172738.GO5316@sirena.org.uk>
References: <1560337252-27193-1-git-send-email-nishakumari@codeaurora.org>
 <1560337252-27193-5-git-send-email-nishakumari@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="V7BlxAaPrdhzdIM1"
Content-Disposition: inline
In-Reply-To: <1560337252-27193-5-git-send-email-nishakumari@codeaurora.org>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--V7BlxAaPrdhzdIM1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 12, 2019 at 04:30:52PM +0530, Nisha Kumari wrote:

> +static void labibb_sc_err_recovery_work(void *_labibb)
> +{
> +	int ret;
> +	struct qcom_labibb *labibb = (struct qcom_labibb *)_labibb;
> +
> +	labibb->ibb_vreg.vreg_enabled = 0;
> +	labibb->lab_vreg.vreg_enabled = 0;
> +
> +	ret = qcom_ibb_regulator_enable(labibb->lab_vreg.rdev);

The driver should *never* enable the regulator itself, it should only do
this if the core told it to.

> +	/*
> +	 * The SC(short circuit) fault would trigger PBS(Portable Batch
> +	 * System) to disable regulators for protection. This would
> +	 * cause the SC_DETECT status being cleared so that it's not
> +	 * able to get the SC fault status.
> +	 * Check if LAB/IBB regulators are enabled in the driver but
> +	 * disabled in hardware, this means a SC fault had happened
> +	 * and SCP handling is completed by PBS.
> +	 */

Let the core worry about this, the driver should just report the problem
to the core like all other devices do (and this driver doesn't...).

--V7BlxAaPrdhzdIM1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0Ch4kACgkQJNaLcl1U
h9BvEQf/egUOCfKsMM6vyB+zbx/sZSo/l7Ffx+LPqI7wPhEmnDgX59uXuxu3/nDK
EU5U6q+g3lQxoiREaEnB1vQWdvdEHsd9Y9qfnMHzSfEbER7ZEGtRSuk78eBHKk05
f7p/STXzlhQ3clp9CcTMwKTaiESaCxGklC1031veOsUAAB/uSy93WrJh7lPLU35T
aVnjxgP3LVsN63YWUKyTh6F47zfbpPBbht3+qKhae5XNLdAK/OLjUt08US41eOHy
I3Ujlv94syz1hjB2kigh2Y0AUE7k2GEcW0pGjmOzGHm57Tw0dybGSDB2WnOOAnej
6plATXwprN3ILhOMtPpDFGusXGGefA==
=lIxx
-----END PGP SIGNATURE-----

--V7BlxAaPrdhzdIM1--
