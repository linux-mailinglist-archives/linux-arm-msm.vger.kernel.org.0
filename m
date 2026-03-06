Return-Path: <linux-arm-msm+bounces-95844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GC35JbjnqmkTYAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:42:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 155A5222E8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C173531A5B74
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 14:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F0F365A02;
	Fri,  6 Mar 2026 14:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ql4OxffO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34D33A9603;
	Fri,  6 Mar 2026 14:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772807664; cv=none; b=A0aAa9RRNlygXYjcrgOFNZ+XE2UbRoW7kaHCASY8u3X/J4Mx0q36A7GYIdcHt/xab2QAyTAO4Ohe9wrwvFQz23Iq8Q8Xu+sF6Tphw9Vil2K/vtf28UZ0+63xgc6lxwGSJI4vDyR6hu4trpk2ezW416UyV0jhS29VRkDhMQDwx2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772807664; c=relaxed/simple;
	bh=KN/c1puIwrPuySCS9Z5SJ0m0+sc0zU7fO0fXfozJE2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVpFMAjId8FtY/jYLpF0OfkaAWOwh/dP3u0SyVn3m+c/w9myJ9K4b11k0d1kYZaWylrNrsGpTUkXjWP1C8Ax+93jAhVq9A7KBRYepZ1m2p+LW2uWK4kAQKjr1ixtWFB/rvBkbPoePXX/mBXVYb4JlPdZlUg9cFF+NnLyXskXMpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ql4OxffO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E7EC4CEF7;
	Fri,  6 Mar 2026 14:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772807664;
	bh=KN/c1puIwrPuySCS9Z5SJ0m0+sc0zU7fO0fXfozJE2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ql4OxffOxzNST2q2yixG+i2mgbirVumzzOwCko6Mu67EnRA63AlqdZio7X/ixEOLa
	 6faKXKSdAldXY0+Lu3dr+2dkIOtZz0d/HS5j/iVqVFJ91yLlrPVG91DqpRRzx/vMTc
	 qRQJe36egHo7+eexun6jtNfvmjw2XqHAjFUBlkCgKz9415JxPzsahUpfpLLKz79+7m
	 pqPpDB2Hyqg6Wz4e0h22C9qyQmMm/AGsn+t+4qPWKfSfUQc0YdtvpwsO13Ciy1rHDy
	 3l6q2Udi3bki6lqtgOn59jTykTM6p1Atn9h4gJq73VXmOySnF5ZF8hqxCnM4bYTzOR
	 hpO4EcPpN21uw==
Date: Fri, 6 Mar 2026 20:04:11 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	Neeraj Soni <neeraj.soni@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/5] soc: qcom: ice: Return proper error codes from
 devm_of_qcom_ice_get() instead of NULL
Message-ID: <k3pswjaxnptwbqgtrs7j3bsf7il6cxtfgc3sccrotb4tfjwi3q@d47blzsosoob>
References: <20260302-qcom-ice-fix-v4-0-0e65740a5dcc@oss.qualcomm.com>
 <20260302-qcom-ice-fix-v4-3-0e65740a5dcc@oss.qualcomm.com>
 <CAGptzHN=uiYoDC-LwmWcGc=bO6gYWmnr6DNiS+o0M_BS80QftQ@mail.gmail.com>
 <CAGptzHO+cXBib_cpD+GvM8riKVSKMF_1Y3DUJO6KL7HcM__mJg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGptzHO+cXBib_cpD+GvM8riKVSKMF_1Y3DUJO6KL7HcM__mJg@mail.gmail.com>
X-Rspamd-Queue-Id: 155A5222E8F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95844-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 02:30:02PM +0530, Sumit Garg wrote:
> On Fri, Mar 6, 2026 at 2:17 PM Sumit Garg <sumit.garg@oss.qualcomm.com> wrote:
> >
> > Hey Mani,
> >
> > On Mon, Mar 2, 2026 at 6:30 PM Manivannan Sadhasivam via B4 Relay
> > <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> wrote:
> > >
> > > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > >
> > > devm_of_qcom_ice_get() currently returns NULL if ICE SCM is not available
> > > or "qcom,ice" property is not found in DT. But this confuses the clients
> > > since NULL doesn't convey the reason for failure. So return proper error
> > > codes instead of NULL.
> > >
> > > Reported-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > > ---
> > >  drivers/soc/qcom/ice.c | 9 ++++-----
> > >  1 file changed, 4 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> > > index 833d23dc7b06..d1efc676b63c 100644
> > > --- a/drivers/soc/qcom/ice.c
> > > +++ b/drivers/soc/qcom/ice.c
> > > @@ -561,7 +561,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
> > >
> > >         if (!qcom_scm_ice_available()) {
> > >                 dev_warn(dev, "ICE SCM interface not found\n");
> > > -               return NULL;
> > > +               return ERR_PTR(-EOPNOTSUPP);
> > >         }
> >
> > With this patch-set on top of v7.0-rc2, I still see UFS probe failing
> > when ICE isn't supported with OP-TEE as follows:
> >
> > [    5.401558] qcom-ice 1d88000.crypto: ICE SCM interface not found
> > [    5.419482] qcom-ice 1d88000.crypto: probe with driver qcom-ice
> > failed with error -95
> > <snip>
> > [   18.662977] ufshcd-qcom 1d84000.ufshc: freq-table-hz property not specified
> > [   18.670193] ufshcd-qcom 1d84000.ufshc: ufshcd_populate_vreg: Unable
> > to find vdd-hba-supply regulator, assuming enabled
> > [   18.737665] platform 1d84000.ufshc: deferred probe pending:
> > ufshcd-qcom: ufshcd_pltfrm_init() failed
> > [   18.747141] platform 3370000.codec: deferred probe pending:
> > platform: wait for supplier /soc@0/pinctrl@33c0000/dmic23-data-state
> >
> > Maybe it's the "qcom-ice" driver failure leading to this deferred
> > probe problem again.
> >

Urgh... I completely forgot that the driver core removes the drvdata during
probe error >.<

> 
> Following diff on top of your patchset allows the UFS driver to probe
> successfully without ICE support. I suppose just setting the drvdata
> should be sufficient.
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index d1efc676b63c..a86980647097 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -734,12 +734,6 @@ static int qcom_ice_probe(struct platform_device *pdev)
>         }
> 
>         engine = qcom_ice_create(&pdev->dev, base);
> -       if (IS_ERR(engine)) {
> -               /* Store the error pointer for devm_of_qcom_ice_get() */
> -               platform_set_drvdata(pdev, engine);
> -               return PTR_ERR(engine);
> -       }
> -

No, this will indicate probe success which we do not want and is not safe all
the time. Like what if qcom_ice_create() returned -EPROBE_DEFER.

Let me just store the ice_handle in a global xarray with key based on node
phandle instead of drvdata. This will ensure that the pointer stays till the
driver is loaded.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

