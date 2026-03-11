Return-Path: <linux-arm-msm+bounces-96891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2A0jH78RsWnbqQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 07:54:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E755225D1A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 07:54:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 40DF33010275
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6808A31690E;
	Wed, 11 Mar 2026 06:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="QN6TPNaN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m49217.qiye.163.com (mail-m49217.qiye.163.com [45.254.49.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AF824677F;
	Wed, 11 Mar 2026 06:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773212032; cv=none; b=KR3/E9tQJSY66OytL33l6PU+5mJWZYgMqeKEmewZgbyBFVz5y2yem65wnUJxeJrpYXRsWe9dQ4SsncdAVVcEK55gGXYs9nMYWK0qUd5f/fY3XqjlhTL5/RNcV6sqEPxT0aBhyUMX3OhLDPX8dfgSG3OktKLb4n4r5r9ED8iGGck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773212032; c=relaxed/simple;
	bh=dvY98tOX7ng/TE7Z7kfM3hgk3b29dl3+MpHn3a1mhS0=;
	h=Cc:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ftmOwiAFT7p7PIzpHvJX3UabIyJoV3fu8v54ISG3XWNeHvDC2S0Cm8ioEkZMoccDVA4egtvKXpJ2a9zPEqN3O2FzvhkvdtBP+AV5fvkyppO1Ju2ZVSP4vsRyValwmodmv0mGVfwqRefd8s6ARFXr3UJpuJbNXweGolt2SOj+36Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=QN6TPNaN; arc=none smtp.client-ip=45.254.49.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.17] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 368545e6d;
	Wed, 11 Mar 2026 14:53:37 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, linux-arm-msm@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 nitin.rawat@oss.qualcomm.com, mani@kernel.org,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com
Subject: Re: [PATCH v1 1/2] ufs: core: Configure only active lanes during link
To: palash.kambar@oss.qualcomm.com
References: <20260311060912.3139257-1-palash.kambar@oss.qualcomm.com>
 <20260311060912.3139257-2-palash.kambar@oss.qualcomm.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <a1822226-0881-b692-9663-c0832c9212fd@rock-chips.com>
Date: Wed, 11 Mar 2026 14:53:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260311060912.3139257-2-palash.kambar@oss.qualcomm.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cdbac240e09cckunme40efd031a7dc5
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx9KSFZLGh4aSk9MTh4eGhhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=QN6TPNaN+/O3x8rCW08sK36iv5wEAVJSfWcTNF+EpvuHHa6oMyoCJLp4pKQN0CuDtfjJO+euOvpxpx/GluODJkcunkTdBpi9kfzfmD+4gV5pPFbvxosxZC62FjOHCRARkdpbOYKprgm44c7E4yoZnU0ZvvsC4TIbjKOIzqZ0sFc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Zz6BdYhm4liL5OC0UKXb4kYkRuN17+JTehX0ZgMlp5I=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Queue-Id: E755225D1A4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rock-chips.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rock-chips.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96891-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shawn.lin@rock-chips.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,rock-chips.com:dkim,rock-chips.com:mid,qualcomm.com:email]
X-Rspamd-Action: no action

Hi Palash

在 2026/03/11 星期三 14:09, palash.kambar@oss.qualcomm.com 写道:
> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
> 
> The number of active lanes detected during UFS link startup can be

connected lanes(which is used in the code blow) or active lanes? There
are different primitives in UniPro context.

> fewer than the lanes specified in the device tree. The current driver
> logic attempts to configure all lanes defined in the device tree,
> regardless of their actual availability. This mismatch may cause
> failures during power mode changes.
> 

It sounds vague, how it causes failures, could you quote some clue from
spec?

> Hence, add check to identify only the lanes that were successfully
> discovered during link startup, to warn on power mode change errors
> caused by mismatched lane counts.
> 
> Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
> ---
>   drivers/ufs/core/ufshcd.c | 39 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 31950fc51a4c..c956fab32932 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -5035,6 +5035,42 @@ void ufshcd_update_evt_hist(struct ufs_hba *hba, u32 id, u32 val)
>   }
>   EXPORT_SYMBOL_GPL(ufshcd_update_evt_hist);
>   
> +static int ufshcd_get_connected_tx_lanes(struct ufs_hba *hba, u32 *tx_lanes)
> +{
> +	return ufshcd_dme_get(hba,
> +			      UIC_ARG_MIB(PA_CONNECTEDTXDATALANES), tx_lanes);
> +}
> +
> +static int ufshcd_get_connected_rx_lanes(struct ufs_hba *hba, u32 *rx_lanes)
> +{
> +	return ufshcd_dme_get(hba,
> +			      UIC_ARG_MIB(PA_CONNECTEDRXDATALANES), rx_lanes);
> +}
> +
> +static void ufshcd_validate_link_params(struct ufs_hba *hba)
> +{
> +	int val = 0;
> +
> +	if (ufshcd_get_connected_tx_lanes(hba, &val))
> +		return;
> +
> +	if (val != hba->lanes_per_direction) {
> +		dev_err(hba->dev, "Tx lane mismatch [config,reported] [%d,%d]\n",
> +			hba->lanes_per_direction, val);
> +		return;
> +	}
> +
> +	val = 0;
> +
> +	if (ufshcd_get_connected_rx_lanes(hba, &val))
> +		return;
> +
> +	if (val != hba->lanes_per_direction) {
> +		dev_err(hba->dev, "Rx lane mismatch [config,reported] [%d,%d]\n",
> +			hba->lanes_per_direction, val);
> +	}
> +}
> +
>   /**
>    * ufshcd_link_startup - Initialize unipro link startup
>    * @hba: per adapter instance
> @@ -5108,6 +5144,9 @@ static int ufshcd_link_startup(struct ufs_hba *hba)
>   			goto out;
>   	}
>   
> +	/* Check successfully detected lanes */
> +	ufshcd_validate_link_params(hba);
> +
>   	/* Include any host controller configuration via UIC commands */
>   	ret = ufshcd_vops_link_startup_notify(hba, POST_CHANGE);
>   	if (ret)
> 

