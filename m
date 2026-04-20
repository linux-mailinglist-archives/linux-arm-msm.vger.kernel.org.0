Return-Path: <linux-arm-msm+bounces-103638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMDkKFV15WnIkAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 02:37:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7D6425EE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 02:37:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 76AF43002B52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 00:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F410A2135B8;
	Mon, 20 Apr 2026 00:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="YJtM/wsg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m478512581.xmail.ntesmail.com (mail-m478512581.xmail.ntesmail.com [47.85.125.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325DC199D8;
	Mon, 20 Apr 2026 00:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.85.125.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776645455; cv=none; b=Ar6VQSD+8jrvtHYSWMWukg1ZOY1iNoT318+OpWmEt3s/ThNQfhh/eWras9l2R/9jcmRnnsqCFtP97sW4DyPgl5UpRKFQMoiQ/LoPJk1zKRNV6FovAYscxDd/HkPGF2BZFjMqIhQGbzECFu465UvmxbFXhVYZQBSRiCX0AwVFws4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776645455; c=relaxed/simple;
	bh=82LoJaO7/bhI1nypAyv4B/aC8e6AhPtiieXItvxqwMA=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uSLqGTVpK8IF8yYv0ah1IabQH5Qztv5I6YPoSlSmQLzhIxJmKQTtGmYJpxkFlt7kSQVva7DvTxV19v833tNl1kEF+4Dg9k+ZoIe/a5ZZ2OAaoByZMQ+6QNsHnBb2Y/3EwQpNu0wsjouRfltIfHQKzbhg/qUF2eeGEvR0z6gJBvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=YJtM/wsg; arc=none smtp.client-ip=47.85.125.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.17] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3b4d28c92;
	Mon, 20 Apr 2026 08:37:23 +0800 (GMT+08:00)
Message-ID: <e97a27bf-9fe2-efe9-3732-3661d0818af6@rock-chips.com>
Date: Mon, 20 Apr 2026 08:37:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: shawn.lin@rock-chips.com, linux-arm-msm@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 bvanassche@acm.org, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH v4 1/2] ufs: core: Configure only active lanes during link
To: palash.kambar@oss.qualcomm.com, mani@kernel.org,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com
References: <20260417045602.3042928-1-palash.kambar@oss.qualcomm.com>
 <20260417045602.3042928-2-palash.kambar@oss.qualcomm.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260417045602.3042928-2-palash.kambar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9da8520e2509cckunmc4f8bbd5667638
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHx1JVhlKGR8aSh0ZShoaHlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSktLVU
	pCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=YJtM/wsgHBDN0ZVvWxh5QFgohQVMkbFRCjeQVM+1dKo9W1b+tZ2BdF+8fUWbLityK4HR5URNHVFa0h4+Bps3RV+QT2jiokIGRYRfWA9szBTeaNq106h6PCYnHzEFfKVl11TDOnPAkrNsLWy2BPJKby7PslOeQksK2Vu5I1RSkaU=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=UcAn7LbRtK7z3CbWDE95r0BAoXQpjEJP1z7TvkCgurE=;
	h=date:mime-version:subject:message-id:from;
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rock-chips.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rock-chips.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103638-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shawn.lin@rock-chips.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,rock-chips.com:email,rock-chips.com:dkim,rock-chips.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AB7D6425EE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

在 2026/04/17 星期五 12:56, palash.kambar@oss.qualcomm.com 写道:
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

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
> ---
>   drivers/ufs/core/ufshcd.c | 38 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 31950fc51a4c..10f8d2b552be 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -5035,6 +5035,40 @@ void ufshcd_update_evt_hist(struct ufs_hba *hba, u32 id, u32 val)
>   }
>   EXPORT_SYMBOL_GPL(ufshcd_update_evt_hist);
>   
> +static int ufshcd_validate_link_params(struct ufs_hba *hba)
> +{
> +	int ret, val;
> +
> +	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_CONNECTEDTXDATALANES),
> +			     &val);
> +	if (ret)
> +		goto out;
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
> +
> +out:
> +	return ret;
> +}
> +
>   /**
>    * ufshcd_link_startup - Initialize unipro link startup
>    * @hba: per adapter instance
> @@ -5108,6 +5142,10 @@ static int ufshcd_link_startup(struct ufs_hba *hba)
>   			goto out;
>   	}
>   
> +	ret = ufshcd_validate_link_params(hba);
> +	if (ret)
> +		goto out;
> +
>   	/* Include any host controller configuration via UIC commands */
>   	ret = ufshcd_vops_link_startup_notify(hba, POST_CHANGE);
>   	if (ret)

