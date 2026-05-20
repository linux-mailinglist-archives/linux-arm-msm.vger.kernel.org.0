Return-Path: <linux-arm-msm+bounces-108832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPFXAx7hDWop4gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 18:28:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ED8591F75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 18:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2DE73296E75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7547D33A9CF;
	Wed, 20 May 2026 15:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="on3k07kn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E422F8EA5;
	Wed, 20 May 2026 15:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779292754; cv=none; b=RZpK2ur3sdKfdwzzpuv8xWVavysxA+YMgxeavR1QI/dF+SeF+p+jfP14P/rkqGu+GJkLl3vpWawdo7OSQ6z0w8SjafsOpvgjPDEIGS9aXr6zwa8bHA/e2KBYwqRiVtrF2Rym4lwZwa/pEdQQVLZSGzbtp0Hlobpnt4gzFA72yUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779292754; c=relaxed/simple;
	bh=2wsxsWgHYT5xJRV0UmOOLFUhM8ySvl59t/cDFVkdCQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YPkjn+5Ec9O4JPv1fjejSh1YqkGIRcpmTPkEW9h4MMPG4H+nINGPqQPp6CcdYsx5owzgJqJWX/kR8TQfspzoB3ji+EnLtubiF17AuUV3ew3aymqCarZtoOWnIGPfJWBk1UypM+Wx/0ApP1kYo5kaVjwU91sMARkfHETOTThS4to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=on3k07kn; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F281F000E9;
	Wed, 20 May 2026 15:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779292752;
	bh=xxNEuOzh0HknREoocyLObcTcBnYkGVJ+mx+LdnVcPWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=on3k07knhz66o/a5W6evhRpZ6LLYPkmOLkT3Liy+aNpcfK9dbIXJ4TPqPdhjpZ3YA
	 ddaW3p+BWlPPFTrionrZehhIB0eXswuzG0fZStr/iCgUtTqe9sclQzL63yG3Nr3JBc
	 5cL31Q9Xta9mD/EVGhzP0aTDKX5HdHQLnxBrQEJbbDRMVwFqy+l+M2fGy1uzmm/1td
	 TaA3dbTfAgkv686UTYHbPm/7n/d45Ix0ybiOUlrKmAEZyG1oXMBbolmu2TMzVRWGII
	 fPSOdsm0NPtKUIR0dumP1EitusOxl/l+skZtI65GjOyVIpgnGnJYxBEMP+VgZxoTLa
	 pHC2iMrTTHuAw==
Date: Wed, 20 May 2026 21:28:53 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Ulf Hansson <ulfh@kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 3/5] soc: qcom: ice: Return proper error codes from
 devm_of_qcom_ice_get() instead of NULL
Message-ID: <o4goffqn5deyp2vta5xqqqzjkjdryl7dbhvnp5keijdihvhro4@damymrxz6zac>
References: <20260518-qcom-ice-fix-v7-0-2a595382185b@oss.qualcomm.com>
 <20260518-qcom-ice-fix-v7-3-2a595382185b@oss.qualcomm.com>
 <CGME20260519182807eucas1p11ec910d88283c3ebb2fa7e7bcbe3cbe2@eucas1p1.samsung.com>
 <8bac0358-9da0-4cbb-98ee-333b85ba4908@samsung.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8bac0358-9da0-4cbb-98ee-333b85ba4908@samsung.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108832-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B4ED8591F75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 08:28:04PM +0200, Marek Szyprowski wrote:
> On 18.05.2026 15:52, Manivannan Sadhasivam via B4 Relay wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> >
> > devm_of_qcom_ice_get() currently returns NULL if ICE SCM is not available
> > or "qcom,ice" property is not found in DT. But this confuses the clients
> > since NULL doesn't convey the reason for failure. So return proper error
> > codes instead of NULL.
> >
> > Reported-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Tested-by: Sumit Garg <sumit.garg@oss.qualcomm.com> # OP-TEE as TZ
> > Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> This patch landed in today's linux-next as commit b9ab7217dd7d ("soc: qcom: ice:
> Return proper error codes from devm_of_qcom_ice_get() instead of NULL"). In my
> tests I found that it breaks booting from the UFS storage on the RB5 board:
> 

Thanks for the report! I didn't consider the case where both 'ice' reg entry and
'qcom,ice' property are absent in DT. Sent the fix now:
https://lore.kernel.org/linux-arm-msm/20260520155704.130803-1-manivannan.sadhasivam@oss.qualcomm.com/

- Mani

> ufshcd-qcom 1d84000.ufshc: freq-table-hz property not specified
> ufshcd-qcom 1d84000.ufshc: ufshcd_populate_vreg: Unable to find vdd-hba-supply regulator, assuming enabled
> ufshcd-qcom 1d84000.ufshc: freq-table-hz property not specified
> ufshcd-qcom 1d84000.ufshc: ufshcd_populate_vreg: Unable to find vdd-hba-supply regulator, assuming enabled
> ufshcd-qcom 1d84000.ufshc: error -ENODEV: ufshcd_variant_hba_init: variant qcom init failed with err -19
> ufshcd-qcom 1d84000.ufshc: error -ENODEV: Initialization failed with error -19
> ufshcd-qcom 1d84000.ufshc: error -ENODEV: ufshcd_pltfrm_init() failed
> /dev/root: Can't open blockdev
> VFS: Cannot open root device "/dev/sda8" or unknown-block(0,0): error -6
> 
> ...
> 
> Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
> CPU: 7 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.1.0-rc1+ #12707 PREEMPT
> Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
> 
> 
> > ---
> >  drivers/soc/qcom/ice.c | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> > index 85deb9ea4a68..2b592aa42941 100644
> > --- a/drivers/soc/qcom/ice.c
> > +++ b/drivers/soc/qcom/ice.c
> > @@ -563,7 +563,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
> >  
> >  	if (!qcom_scm_ice_available()) {
> >  		dev_warn(dev, "ICE SCM interface not found\n");
> > -		return NULL;
> > +		return ERR_PTR(-EOPNOTSUPP);
> >  	}
> >  
> >  	engine = devm_kzalloc(dev, sizeof(*engine), GFP_KERNEL);
> > @@ -645,7 +645,7 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
> >  	struct device_node *node __free(device_node) = of_parse_phandle(dev->of_node,
> >  									"qcom,ice", 0);
> >  	if (!node)
> > -		return NULL;
> > +		return ERR_PTR(-ENODEV);
> >  
> >  	pdev = of_find_device_by_node(node);
> >  	if (!pdev) {
> > @@ -698,8 +698,7 @@ static void devm_of_qcom_ice_put(struct device *dev, void *res)
> >   * phandle via 'qcom,ice' property to an ICE DT, the ICE instance will already
> >   * be created and so this function will return that instead.
> >   *
> > - * Return: ICE pointer on success, NULL if there is no ICE data provided by the
> > - * consumer or ERR_PTR() on error.
> > + * Return: ICE pointer on success, ERR_PTR() on error.
> >   */
> >  struct qcom_ice *devm_of_qcom_ice_get(struct device *dev)
> >  {
> > @@ -710,7 +709,7 @@ struct qcom_ice *devm_of_qcom_ice_get(struct device *dev)
> >  		return ERR_PTR(-ENOMEM);
> >  
> >  	ice = of_qcom_ice_get(dev);
> > -	if (!IS_ERR_OR_NULL(ice)) {
> > +	if (!IS_ERR(ice)) {
> >  		*dr = ice;
> >  		devres_add(dev, dr);
> >  	} else {
> >
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 

-- 
மணிவண்ணன் சதாசிவம்

