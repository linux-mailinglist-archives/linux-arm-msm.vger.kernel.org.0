Return-Path: <linux-arm-msm+bounces-100234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDMgDKFOxmmgIAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:32:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 44516341C03
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 32203300D4F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1DE18C933;
	Fri, 27 Mar 2026 09:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="UbKKBBVY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m15596.qiye.163.com (mail-m15596.qiye.163.com [101.71.155.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1D3194A60;
	Fri, 27 Mar 2026 09:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774603915; cv=none; b=sv29aTatj1jgeciwlDATrSafB6S6vjijhDjE+ihIyWRu2uaO/XVFxRrPISHkTvSbYYV0bghBGRZteCNr1d4PKjGNjJT/p+MKVy1dk+ciqKDjm9ssEkL94BlgoVnU6729iqWYRhtnxrdaLNwgm+p+Wi4h9BU1GzNLcq/ArndfbCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774603915; c=relaxed/simple;
	bh=LSq2qOvurH57vNvb7cfd6Z43551iqhPubnnH8/L+SmA=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=c9C0qMR0gXkPY80aMX1ref9RdIbAwyJppLl+MZCSneG9uM4alT3Noy6uUdZiC1mf3afC4T1MHMtEUI3PbLRqVddglQ22ch9ZSo9Kj48DwBLC5SiqfMhU7ccKORmw3aWB0TvssGKFqvJD8jxU24wSwuzReAKs78HQPna8K9v9s4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=UbKKBBVY; arc=none smtp.client-ip=101.71.155.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.17] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 388d24ff8;
	Fri, 27 Mar 2026 17:31:40 +0800 (GMT+08:00)
Message-ID: <f0685a6c-25f2-293a-cd94-754326abcedd@rock-chips.com>
Date: Fri, 27 Mar 2026 17:31:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Cc: shawn.lin@rock-chips.com, linux-arm-msm@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 bvanassche@acm.org, nitin.rawat@oss.qualcomm.com, mani@kernel.org,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com
Subject: Re: [PATCH V2 1/2] ufs: core: Configure only active lanes during link
To: palash.kambar@oss.qualcomm.com
References: <20260327090346.656324-1-palash.kambar@oss.qualcomm.com>
 <20260327090346.656324-2-palash.kambar@oss.qualcomm.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260327090346.656324-2-palash.kambar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d2ea2961f09cckunmc35ea42fc8d690
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkweHlYZTBpPTB9OT09OHktWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=UbKKBBVYSvYr7y5isX6dkUsC8GeI+gcWnoc0IJCVAhpfGwNIkS9G79M/dIm2IWSsI/Dur7V1TnpatQvVWSI9sBpS1yYd4fJi3hIj2hvVfhKZZxbjakXu3nj8O5D7ue8rJQ2A71MvXMQtN9nPiY2wF4gyDN5ed4rNJfIfwIkGe24=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=D85q27XkqlHG1BI9gy+dipWNpX2TkG8IcWs0Wy/osfE=;
	h=date:mime-version:subject:message-id:from;
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rock-chips.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rock-chips.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100234-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shawn.lin@rock-chips.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 44516341C03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Palash

在 2026/03/27 星期五 17:03, palash.kambar@oss.qualcomm.com 写道:
> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
> 
> The number of connected lanes detected during UFS link startup can be
> fewer than the lanes specified in the device tree. The current driver
> logic attempts to configure all lanes defined in the device tree,
> regardless of their actual availability. This mismatch may cause
> failures during power mode changes.
> 
> Hence, add check to identify only the lanes that were successfully
> discovered during link startup, to warn on power mode change errors
> caused by mismatched lane counts.

The logic of your patch is clear, but I believe there is a slight
inconsistency between the commit message and the current code
implementation. The patch currently returns -ENOLINK immediately when a
lane mismatch is detected. This causes the Link Startup process to
terminate instantly, preventing the UFS device from completing
initialization. Consequently, ufshcd_change_power_mode() will never be
executed, there is nothing about warning on power mode change errors.

How about "to prevents potential failures in subsequent power mode
changes by failing the initialization early"  or something similart?

> 
> Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
> ---
>   drivers/ufs/core/ufshcd.c | 39 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 31950fc51a4c..cc291cae79f0 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -5035,6 +5035,40 @@ void ufshcd_update_evt_hist(struct ufs_hba *hba, u32 id, u32 val)
>   }
>   EXPORT_SYMBOL_GPL(ufshcd_update_evt_hist);
>   
> +static int ufshcd_validate_link_params(struct ufs_hba *hba)
> +{
> +	int ret = 0;
> +	int val = 0;
> +
> +	ret = ufshcd_dme_get(hba,
> +			     UIC_ARG_MIB(PA_CONNECTEDTXDATALANES), &val);
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
> +	val = 0;
> +

ufshcd_dme_get() returns 0 on success, non-zero value on failure.
Perhaps you could remove this "val = 0".

> +	ret = ufshcd_dme_get(hba,
> +			     UIC_ARG_MIB(PA_CONNECTEDRXDATALANES), &val);
> +	if (ret)
> +		goto out;
> +
> +	if (val != hba->lanes_per_direction) {
> +		dev_err(hba->dev, "Rx lane mismatch [config,reported] [%d,%d]\n",
> +			hba->lanes_per_direction, val);
> +		ret = -ENOLINK;
> +	}
> +
> +out:
> +	return ret;
> +}
> +
>   /**
>    * ufshcd_link_startup - Initialize unipro link startup
>    * @hba: per adapter instance
> @@ -5108,6 +5142,11 @@ static int ufshcd_link_startup(struct ufs_hba *hba)
>   			goto out;
>   	}
>   
> +	/* Check successfully detected lanes */
> +	ret = ufshcd_validate_link_params(hba);
> +	if (ret)
> +		goto out;
> +
>   	/* Include any host controller configuration via UIC commands */
>   	ret = ufshcd_vops_link_startup_notify(hba, POST_CHANGE);
>   	if (ret)

