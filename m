Return-Path: <linux-arm-msm+bounces-113424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TDJmDwNRMWplggUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:34:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A936568FF91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:34:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=acm.org header.s=mr01 header.b=2IBggzwF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113424-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113424-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=acm.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FD52305880E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48E62FF15B;
	Tue, 16 Jun 2026 13:32:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DBA2BE026;
	Tue, 16 Jun 2026 13:32:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781616727; cv=none; b=d55s5/PLPMHMrFzhNMium4EncEWCJbKhph5+g89J9SoUbXM12N8RarkxMMuG3k2m9KnXxkbQVWssTGKFH9bsWO4hq/SdbjOraFCV/9gYPUt55qzgKhm9d7H4XyuxwyDPK9UMaQyaYEa+rGZSKuo+5mxyEOUa4nQNL9DtM0BgqG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781616727; c=relaxed/simple;
	bh=jxOG0NzHsauXEs7z3nbLWa7qkGgHAS0glsQ0ME3e5cE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XwNb2mVf7tKMrJyfwzMOl4u1v6KDZX0o3HA4I/+8m5mamqEsoSY2VEhw0HV3+2/5zCAu1HFrfiG06hnwK9b2GN7uULQ7uF6usTnUihf8U2MCv8Mj2ZZYtb92OHlItyBpTuBAvglj2NwVvHJyWZLp5s20O7AA4PUcCjMl0dNCrA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=2IBggzwF; arc=none smtp.client-ip=199.89.1.14
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4gfnw602whz1XM6JB;
	Tue, 16 Jun 2026 13:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1781616718; x=1784208719; bh=4gM/vvwTYlyUiY3PTYetGs4N
	aK0ezXlkJGM5eDLgyEs=; b=2IBggzwFoPC2GoHdaM7+yEKWJWQXnDXJubqMh1yH
	pXP631Rw2XASUDPwBu41A8YbuOWXrdydyoBUJO04ihfRIF/57sIrtos8PY1tzqu5
	ldbtrS8VJgdBotVZCYG89i0xVa5mih/v5I4e+bZocWSy9p8bxA2zA5wPem+rC1mq
	4rP9SdfnEBdkMPQYgMjK8dFOOZtkK7Eb0LYlSBvJQNhnHcxd5uDtua9MgVP74qkS
	PQvtI265oGEMuB+CZsH1QyLzI1l4RBBLM1vc0vG8+DKZeMfrPT7D8jYDYiVGx671
	F0n6+sBxx6NRyctc4ZoYgJsho065F0cUrVqPtHsrq3q1uA==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id XuVc9N0bw-Vg; Tue, 16 Jun 2026 13:31:58 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4gfnvv0Z7Rz1XM31H;
	Tue, 16 Jun 2026 13:31:54 +0000 (UTC)
Message-ID: <ab8de800-0e16-44db-9dd8-377f92b3d408@acm.org>
Date: Tue, 16 Jun 2026 06:31:48 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: ufs: core: Avoid possible memory reclaim deadlock
 in TX EQTR context
To: Can Guo <can.guo@oss.qualcomm.com>, beanhuo@micron.com,
 peter.wang@mediatek.com, martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>
References: <20260616090654.421850-1-can.guo@oss.qualcomm.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260616090654.421850-1-can.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[acm.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[acm.org:s=mr01];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113424-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:can.guo@oss.qualcomm.com,m:beanhuo@micron.com,m:peter.wang@mediatek.com,m:martin.petersen@oracle.com,m:mani@kernel.org,m:linux-scsi@vger.kernel.org,m:alim.akhtar@samsung.com,m:avri.altman@wdc.com,m:James.Bottomley@HansenPartnership.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[acm.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bvanassche@acm.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bvanassche@acm.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,acm.org:dkim,acm.org:mid,acm.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A936568FF91

On 6/16/26 2:06 AM, Can Guo wrote:
> diff --git a/drivers/ufs/core/ufs-txeq.c b/drivers/ufs/core/ufs-txeq.c
> index 4b264adfdf49..3a2fb5329d27 100644
> --- a/drivers/ufs/core/ufs-txeq.c
> +++ b/drivers/ufs/core/ufs-txeq.c
> @@ -1059,7 +1059,7 @@ static int __ufshcd_tx_eqtr(struct ufs_hba *hba,
>   			    struct ufs_pa_layer_attr *pwr_mode)
>   {
>   	struct ufshcd_tx_eqtr_data *eqtr_data  __free(kfree) =
> -		kzalloc(sizeof(*eqtr_data), GFP_KERNEL);
> +		kzalloc(sizeof(*eqtr_data), GFP_NOIO);
>   	struct tx_eqtr_iter h_iter = {};
>   	struct tx_eqtr_iter d_iter = {};
>   	u32 gear = pwr_mode->gear_tx;
> @@ -1217,7 +1217,7 @@ static int ufshcd_tx_eqtr(struct ufs_hba *hba,
>   	if (!params->eqtr_record) {
>   		params->eqtr_record = devm_kzalloc(hba->dev,
>   						   sizeof(*params->eqtr_record),
> -						   GFP_KERNEL);
> +						   GFP_NOIO);
>   		if (!params->eqtr_record)
>   			return -ENOMEM;
>   	}
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index c084ccc72523..e7f104987c6a 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -2760,7 +2760,7 @@ static int ufs_qcom_get_rx_fom(struct ufs_hba *hba,
>   			       struct tx_eqtr_iter *d_iter)
>   {
>   	struct ufshcd_tx_eq_params *params __free(kfree) =
> -		kzalloc(sizeof(*params), GFP_KERNEL);
> +		kzalloc(sizeof(*params), GFP_NOIO);
>   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>   	struct ufs_pa_layer_attr old_pwr_info;
>   	u32 fom[PA_MAXDATALANES] = { 0 };

Modifying individual memory allocation calls is error prone. The next
person who modifies this code may not be aware of this conversation and
might reintroduce a GFP_KERNEL allocation in the TX equalization code.

Please use memalloc_noio_save() and memalloc_noio_restore() instead of
changing GFP_KERNEL into GFP_NOIO. Additionally, please add a comment
above the memalloc_noio_save() call that explains why it is necessary.
See also https://docs.kernel.org/core-api/gfp_mask-from-fs-io.html.

Thanks,

Bart.

