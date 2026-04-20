Return-Path: <linux-arm-msm+bounces-103715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IOvJ6T05Wl+pgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:40:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E95428F0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 817EB301DCCD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71EE38F927;
	Mon, 20 Apr 2026 09:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FpaPZYBo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E7738F643;
	Mon, 20 Apr 2026 09:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776678021; cv=none; b=qbJ95faZh6yyezCXTTSC+EbZ5IGo0ymL/P0LD1eb6S5P4Nw9VYSOBcAU7M/9Y0rbDs3gSH6D/p9S156EqMnpXSFet4S8kb3eIOw2oY2LvgLHuN2HcyoJb1y3Evw9jPhQlNxtF927NMkYDg2atE615BxpXPq/HXUEvq7LoWUL0XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776678021; c=relaxed/simple;
	bh=mBkKacJ7t8sCYvYyIHYhWL9xwkM3ZtM5Ve9iYCYELwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VWgRagiBvlvSEcAmnn9TEsi5Yjtb5Pz8K28lcKezjg0aNWYi9MDHq7y4Px8Fh2eVeCedNtOLnFSh9aSPQ0hx+StcWyqq0aWNuDsjyf4jFhDgbkOZGH1VvMfTxhSuuHyAaX+Y9FCV6DsybDE7UnFCdzz0W/deZwUfS+r2lUEOz3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FpaPZYBo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 425DEC19425;
	Mon, 20 Apr 2026 09:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776678021;
	bh=mBkKacJ7t8sCYvYyIHYhWL9xwkM3ZtM5Ve9iYCYELwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FpaPZYBoMAYY3scBRi4Lsc9vuLYg4OGPI4BbX6ndnE0V5zaooMLZZaO2fgiF3lhGS
	 iV+pJyNT3W2EYm0GFEdhPcSbrpbuDI6B0r5AS7ZD4NVQ4TJxglV4mAGnQSu+iPcwu5
	 oXx5IjKSSCDE6yoH4UOPugNJil3cdj23rfP2ZkysB1fwMtu4dAN1BZuaF25F6YRxaM
	 qpkmZ2ZwKXfP4DOHJESHNxGXOesHWFkpk/aLqE2PU2A4JmAvmTy/QwigOnJ5bv7nGT
	 GzlNk8cPBoy1tyQx5gGvyzbtVUEHoBzBEGZFw3w3qT0RfxJwrmZQAs0sojt2bZAtxa
	 IPTfo9f7Spj3A==
Date: Mon, 20 Apr 2026 15:10:09 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: palash.kambar@oss.qualcomm.com
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bvanassche@acm.org, nitin.rawat@oss.qualcomm.com, shawn.lin@rock-chips.com
Subject: Re: [PATCH v4 1/2] ufs: core: Configure only active lanes during link
Message-ID: <zi5fjfyjwja2goouqesdpddyl243bjjpau232ik6fvvxed7kp3@egaolv3m3quq>
References: <20260417045602.3042928-1-palash.kambar@oss.qualcomm.com>
 <20260417045602.3042928-2-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260417045602.3042928-2-palash.kambar@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-103715-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 08E95428F0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 10:26:01AM +0530, palash.kambar@oss.qualcomm.com wrote:
> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
> 
> The number of connected lanes detected during UFS link startup can be
> fewer than the lanes specified in the device tree. The current driver
> logic attempts to configure all lanes defined in the device tree,
> regardless of their actual availability. This mismatch may cause
> failures during power mode changes.
> 
> Hence, Add a check during link startup to ensure that only the lanes
> actually discovered are considered valid. If a mismatch is detected,
> fail the initialization early, preventing the driver from entering
> an unsupported configuration that could cause power mode transition
> failures.
> 
> Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>

One comment below. With that fixed,

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

> ---
>  drivers/ufs/core/ufshcd.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 31950fc51a4c..10f8d2b552be 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -5035,6 +5035,40 @@ void ufshcd_update_evt_hist(struct ufs_hba *hba, u32 id, u32 val)
>  }
>  EXPORT_SYMBOL_GPL(ufshcd_update_evt_hist);
>  
> +static int ufshcd_validate_link_params(struct ufs_hba *hba)
> +{
> +	int ret, val;
> +
> +	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_CONNECTEDTXDATALANES),
> +			     &val);
> +	if (ret)
> +		goto out;

Return 'ret' directly, here and below.

> +
> +	if (val != hba->lanes_per_direction) {
> +		dev_err(hba->dev, "Tx lane mismatch [config,reported] [%d,%d]\n",
> +			hba->lanes_per_direction, val);
> +		ret = -ENOLINK;
> +		goto out;
> +	}
> +
> +	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_CONNECTEDRXDATALANES),
> +			     &val);
> +	if (ret)
> +		goto out;
> +
> +	if (val != hba->lanes_per_direction) {
> +		dev_err(hba->dev, "Rx lane mismatch [config,reported] [%d,%d]\n",
> +			hba->lanes_per_direction, val);
> +		ret = -ENOLINK;
> +		goto out;
> +	}
> +
> +return 0;

Odd indent.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

