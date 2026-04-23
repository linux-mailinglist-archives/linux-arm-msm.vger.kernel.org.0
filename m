Return-Path: <linux-arm-msm+bounces-104217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHb/JZnS6Wm9kgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 10:04:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0D444E493
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 10:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8EA57300B9FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 08:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8CC1363C4C;
	Thu, 23 Apr 2026 08:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EF8vhpJ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DA333CEA8;
	Thu, 23 Apr 2026 08:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776931474; cv=none; b=NRoMb6e3xVFp57xYdVfKXB520J+1Gn/2+igVkXMDkuAXpScsAdSsNjwXnIknr41HeOn5ymdzN2zNeXnr7xZ81qRnbq5iE7qJNNlmbEZk26hkXilBtBUKCf3pNjSyFDREa3aCcBXYFTtptiorXNH85Qvl3WdIowYM65yU2GMvcog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776931474; c=relaxed/simple;
	bh=2JqOZbo+uciukmeac8eXcs3W7+CSHxlxiw/Cl9Zp8qU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLQss5XgS6iwADo5PF26evFglzQl5MT61CzW4hcXmWzaRSiKp93LTi5Afr5BcEbc3GcRLg4uzRgNjpasv8iClo+ZfCyE0DB1mYqyvoUibtjI5aUhGNmgtfiLXliMOoULA4beKkwWM4BnpdDgOkwoLb3QyH/wHFHQJwlohn+/Uw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EF8vhpJ2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 728E8C2BCAF;
	Thu, 23 Apr 2026 08:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776931474;
	bh=2JqOZbo+uciukmeac8eXcs3W7+CSHxlxiw/Cl9Zp8qU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EF8vhpJ23UH+iWSMkcbad2/Fn7TqKj4Juz4R/YGxQoMJtbrPny5LYpLrWWqN0Xa/B
	 MxqLQrsXm+WJRzZhqbplZhVGjbhALslaCJxnhZYr2rHXEz5ve0x50s7xfb5R6V+vWO
	 t4W+O0vT70KaajAFeSBcgzv4CSjByMczvUUPPcorq3ONyTe9eS5+5PfH/1okUdZlaZ
	 +8y+MBVWLe22nVTRar/TeSKyVwSs6EdgZw2ONErchxXlr9Gn8nE7ry8XilUcjIo1ZP
	 wxVlVCP9QDkdI8hQEOAnijdTUzHNylDwMge7ddT71aP1IbecCgvII8MxW5UKAsu5E0
	 x3dbC3S1MaM/g==
Date: Thu, 23 Apr 2026 13:34:27 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: palash.kambar@oss.qualcomm.com
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bvanassche@acm.org, shawn.lin@rock-chips.com, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH V6 1/2] ufs: core: Configure only active lanes during link
Message-ID: <we5guwh4bayq2fertkfsh27ykkzz4h2owzt5wjiezn2yzfjpni@77a3xpe6in2l>
References: <20260423055914.3566684-1-palash.kambar@oss.qualcomm.com>
 <20260423055914.3566684-2-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260423055914.3566684-2-palash.kambar@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104217-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MAILSPIKE_FAIL(0.00)[2600:3c09:e001:a7::12fc:5321:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rock-chips.com:email]
X-Rspamd-Queue-Id: 3B0D444E493
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 23, 2026 at 11:29:13AM +0530, palash.kambar@oss.qualcomm.com wrote:
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
> Reviewed-by: Bart Van Assche <bvanassche@acm.org>
> Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
> ---
>  drivers/ufs/core/ufshcd.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 31950fc51a4c..fe5bc85c6870 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -5035,6 +5035,37 @@ void ufshcd_update_evt_hist(struct ufs_hba *hba, u32 id, u32 val)
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
> +		return ret;
> +
> +	if (val != hba->lanes_per_direction) {
> +		dev_err(hba->dev, "Tx lane mismatch [config,reported] [%d,%d]\n",
> +			hba->lanes_per_direction, val);
> +		ret = -ENOLINK;
> +		return ret;

Really? If you had spent a minute in reading the patch after writing, you
would've seen this obvious mistake.

> +	}
> +
> +	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_CONNECTEDRXDATALANES),
> +			     &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val != hba->lanes_per_direction) {
> +		dev_err(hba->dev, "Rx lane mismatch [config,reported] [%d,%d]\n",
> +			hba->lanes_per_direction, val);
> +		ret = -ENOLINK;
> +		return ret;

Same here.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

