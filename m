Return-Path: <linux-arm-msm+bounces-89838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KK7YKNYacGkEVwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 01:16:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2676F4E679
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 01:16:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8585350C4C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 13:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72CA03EDAB7;
	Tue, 20 Jan 2026 13:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QCIqhnGo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3900E428487;
	Tue, 20 Jan 2026 13:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768915766; cv=none; b=KnzqMXko4bDwRKVBtsRS8PDrslmy3uly3rXvBFXELaFI9KasSeSM9oRd53zgkfUHdyY6GwMxA2e2LOK+4yqSo2LP2GO9Frpg1RC8wH+bByLmlxS8gBCFNMgjjMN8BnboyXWsVG2eNfTRE3xp09C4h/ywQuL5FYHIkFpNjo06nGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768915766; c=relaxed/simple;
	bh=SZGjB+tzhMCdedpCDZ6dZPPdv3MC5DnUC70Pro9p9zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R0qII4oYXU6CtHrcsqTvFVhlH8GzJoQaiW4oNr46AH+wFFhw4sJKPC6WmZkDRkR5vxANbSGcvwvH02s0DGefQ37EzMp97KJQd/ryQEU0lfOLkhak39dXljsjih/oTtoMCkhRTkjY6SmOPMfqx5c++McbozrpeQ25kwcRUSu9+TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QCIqhnGo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65CFDC19422;
	Tue, 20 Jan 2026 13:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768915766;
	bh=SZGjB+tzhMCdedpCDZ6dZPPdv3MC5DnUC70Pro9p9zo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QCIqhnGoZQFuktWd7lCUobZWKZc1NdtqdjWuGVj6NeToJV8QuGikwX2QCLAuT6KyC
	 lPA77993RpjuuHyB9Ka9FD3A7YbLZbJTvEutOVSUCBY6lqTYJxKHzh1YrHg0h8+Crb
	 9EsF7wuEsE86fyan6Eie+a2HE5OWl5PyXo1+uz5rBtfnsDFxeZ+JBYWOlOlsbccz76
	 ObQEgfsYtCi63EXj8WcHhXVgslRUQ8OL+LmJ5b43yuG6vRkoa20xRoNKsy5oPTgVem
	 VDPfb2QLCPfAnoGKy8hWL7Yc4v0+UdOXeqoulRM6F54YfF7J87SzBpJOBLVdenMp9G
	 8eNGTDxrwfUkQ==
Date: Tue, 20 Jan 2026 18:59:12 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
Cc: alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, linux-arm-msm@vger.kernel.org, 
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V5 3/4] scsi: ufs: core Enforce minimum pm level for
 sysfs configuration
Message-ID: <tjkfcmbdjsr5jieqjhxe57w4uhhpzqiwdidlenr3ytaifyijyc@ddocvrk6357q>
References: <20260113080046.284089-1-ram.dwivedi@oss.qualcomm.com>
 <20260113080046.284089-4-ram.dwivedi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260113080046.284089-4-ram.dwivedi@oss.qualcomm.com>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89838-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 2676F4E679
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 13, 2026 at 01:30:45PM +0530, Ram Kumar Dwivedi wrote:
> Some UFS platforms only support a limited subset of power levels.
> Currently, the sysfs interface allows users to set any pm level
> without validating the minimum supported value. If an unsupported
> level is selected, suspend may fail.
> 
> Introduce an pm_lvl_min field in the ufs_hba structure and use it
> to clamp the pm level requested via sysfs so that only supported
> levels are accepted. Platforms that require a minimum pm level
> can set this field during probe.
> 
> Signed-off-by: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/ufs/core/ufs-sysfs.c | 2 +-
>  include/ufs/ufshcd.h         | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/core/ufs-sysfs.c b/drivers/ufs/core/ufs-sysfs.c
> index b33f8656edb5..02e5468ad49d 100644
> --- a/drivers/ufs/core/ufs-sysfs.c
> +++ b/drivers/ufs/core/ufs-sysfs.c
> @@ -141,7 +141,7 @@ static inline ssize_t ufs_sysfs_pm_lvl_store(struct device *dev,
>  	if (kstrtoul(buf, 0, &value))
>  		return -EINVAL;
>  
> -	if (value >= UFS_PM_LVL_MAX)
> +	if (value >= UFS_PM_LVL_MAX || value < hba->pm_lvl_min)
>  		return -EINVAL;
>  
>  	if (ufs_pm_lvl_states[value].dev_state == UFS_DEEPSLEEP_PWR_MODE &&
> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
> index 19154228780b..a64c19563b03 100644
> --- a/include/ufs/ufshcd.h
> +++ b/include/ufs/ufshcd.h
> @@ -834,6 +834,7 @@ enum ufshcd_mcq_opr {
>   * @uic_link_state: active state of the link to the UFS device.
>   * @rpm_lvl: desired UFS power management level during runtime PM.
>   * @spm_lvl: desired UFS power management level during system PM.
> + * @pm_lvl_min: minimum supported power management level.
>   * @pm_op_in_progress: whether or not a PM operation is in progress.
>   * @ahit: value of Auto-Hibernate Idle Timer register.
>   * @outstanding_tasks: Bits representing outstanding task requests
> @@ -972,6 +973,7 @@ struct ufs_hba {
>  	enum ufs_pm_level rpm_lvl;
>  	/* Desired UFS power management level during system PM */
>  	enum ufs_pm_level spm_lvl;
> +	enum ufs_pm_level pm_lvl_min;
>  	int pm_op_in_progress;
>  
>  	/* Auto-Hibernate Idle Timer register value */
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

