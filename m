Return-Path: <linux-arm-msm+bounces-110797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPnXEmSmHmq3IwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:46:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B47E62BCED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 62C90302454A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 09:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C943D3D1719;
	Tue,  2 Jun 2026 09:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aZbzSY+J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfls4XXz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC743D16F0
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 09:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780393270; cv=none; b=P+AIhFhsYl07O0G8yMlxwGTWC4CRRKzHY5EUnqvlQ1AcK8KM3Zkvbu7nnr4n9bgnID1/KYMMqaGGingYuOUn7p18xLmU1+oWqLWnkS+lJDd9MyXQOz9hguAnOxjs8FpFC5fmiKIRj+laQ6T2lHw0Mcz2+uZozZ/kj8C69SvteFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780393270; c=relaxed/simple;
	bh=X4PRWbtQNeo0jFMupvsDRUKkIKU7lrhgyz070jxV2tg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tUR4c+GReipfWApH0cIA0WUN8e6IdaIgGl6ljon10bDH2wdMNS6HOYcx8dadPTNfsDmT5HMHlRP4oZw1hhZnK6Uk5bLPt4mWkek/qILbrRj08X+JQJGzEINeowf5MUM5hDuaCGDstPc1fYU8uVTsuPOICEVN4hxy8inYw04v+vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aZbzSY+J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfls4XXz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6527giec1638283
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 09:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oESplOGIONykfrvVga1RyEzgCLfort4w6L2n3L3CGBs=; b=aZbzSY+Je2M1WrLi
	kvRRVcmtzeV4Xv7janPqqotTd6cYY9pVwCmDrTk9GvNHE1TgUVepZyEomVu/++Br
	dMVcjqrV6dlAwxF0Fext7rWKdSESy98j8sjXnVEGOwZZ6h4J1PscJ7ZRZlBsmeNM
	lNBf0Z6KO3ACyYWuZf9cGexmpJoq8wyWC2tNC9tqAbRPb85JDGSD1kZON35/NQdL
	K1ingTcOtVEtjz/Fx7tKqNEqE1zC/bj7ceH5TWGZ8Ht3xphVmlAUlcvFSelc0ldY
	pFUEFd4lnBcYJyOmD60Qtiu5oG8zgCwKGeG8q2j9h3S2A8aD7JMCt54iA94WHnQb
	sMfozw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehu1cgg5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:41:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0bfcd629eso30037715ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 02:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780393267; x=1780998067; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oESplOGIONykfrvVga1RyEzgCLfort4w6L2n3L3CGBs=;
        b=dfls4XXzcqgvsj52+HhuPVrKS6Fa2VN49WUvBL4w9+9iXOYX0km5g35Fco5ymMhR/y
         rjQa6RG7GqYHV33jr151SKINHW2KPrXGxN4jCZwPlXu+lXo7ZKS9mB11psYrCE4K8puX
         XsD2xTw7Pn3SwnmtAUlFTkA8Y5kx/p5J8Ltgpo97o6MHHUGJRcPd/m23FYdV630PJ8hD
         /oUlfw1kd9XxsCqim3SM/vqXsTae74oT+S5ln9XQuUwTzCyxHDFYnc6f7v1exsD4Rkvq
         kP888+ku/wpYvc7h6VwxCRgUhSnVdFiJBufTsJNolxmcWWK5zwzoeYurLUHVii9x/Q0y
         KAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780393267; x=1780998067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oESplOGIONykfrvVga1RyEzgCLfort4w6L2n3L3CGBs=;
        b=nYQwbUAXUfNKD/fLEOdVc5ByKStE4DHUMrkFfLz2r4dyWa1wq3ImpCeUVP3Qg7t1Jp
         2Bczq7uBMa8ewKmJm/AjecQDloB2KC7wouOUSaFeEJF2Yq4B6yO1U+nQWHRVhR0OnGlT
         YwJyFJRmijHF5feiWQGCnbhNaVt3t/Aveuoc+J+slkIL4QmBDVbzdeR4WVaRNf958QDz
         yMEYy8oxTU1zdh4cEtX6vn6Udv2JAiZFfPBXRr0daS0zBaaLEC64uA8cC3ChI3vOWMNa
         fF++COfpZpdJD09l0IR4ImuUgQTLVN+uwXq8Xz0tgXTQw4Bxq0yTn1ZOSDzs12RY4Z8J
         wJhw==
X-Gm-Message-State: AOJu0YzRBXm5aZdy4U8RMIS30i3sRm7GcDtf3eokddwGdAlfJoJgSGzL
	soYWQWdoYTqmA+KeuxOTxRxYOb69FZCcHbP/vvGShA2KWtFjmUlBtphjYQXsR7aRyog5Xoc+bsw
	oDmz0Lbju3AYEgzqoxRW2H2zvr7IiO0zmIY6bq+zB2znoMLmVpmQRI+LpNlP+0pbqx+4R
X-Gm-Gg: Acq92OH7/+I6WvDuEM9q0LMhRv9J3SntAjRIUF8nc2OULCk5nG0h5g3tfLdBBKFRU1m
	htmM5R1J3bjQFNWfuCBm/UWMrSlD0j0+eg2EDJywLSC19dcM96tCgB9ZW97mjPOt7De+mpxcgTV
	VjU5GFYWZgWi8xORjYx+3l2oUPOfiYzS80lJ0bK9nnm9e947Uz5jspp5Dl04QYTTmi5q2psIHCL
	mHf4hD1CsTvomSRcFcIgl3v3hQeXkLZ/gagCdwCklc3HIa+wAdHwdMNNeD1+rKjoi6bIiUIFIDA
	Us5/1aR/9kjqHO8ZUtFmjaBFNhzMidORYWMGpRf9TKpkF7qJRgbJ73GuWCcE0WgFB0cC23l3azo
	iJ9Px/nCKFlGBYMmoqoXJg9NpjcSecGKpannfExy4XMcUi5tSHKkYvypHxB35coFOTg28THz/gm
	lGSy0yZffx3idaJGfASzxMeg==
X-Received: by 2002:a17:903:2389:b0:2b4:656b:aeb0 with SMTP id d9443c01a7336-2bf3685af15mr182356395ad.35.1780393266961;
        Tue, 02 Jun 2026 02:41:06 -0700 (PDT)
X-Received: by 2002:a17:903:2389:b0:2b4:656b:aeb0 with SMTP id d9443c01a7336-2bf3685af15mr182355955ad.35.1780393266399;
        Tue, 02 Jun 2026 02:41:06 -0700 (PDT)
Received: from [10.133.33.123] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd8cdsm124904775ad.22.2026.06.02.02.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 02:41:05 -0700 (PDT)
Message-ID: <e0efec0d-b99c-4b71-bac4-4c04f243c4f6@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 17:41:00 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
To: Jianping Li <jianping.li@oss.qualcomm.com>, srini@kernel.org,
        amahesh@qti.qualcomm.com, arnd@arndb.de, gregkh@linuxfoundation.org,
        abelvesa@kernel.org, jorge.ramirez@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, ekansh.gupta@oss.qualcomm.com,
        quic_chennak@quicinc.com, stable@kernel.org
References: <20260602071750.526-1-jianping.li@oss.qualcomm.com>
 <20260602071750.526-5-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260602071750.526-5-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hM2MterEIwGNC_p1pcrqnzjOQxSIMifG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA5MCBTYWx0ZWRfXzbgwqGwhqzFy
 Nexouj1g/8n4DW86xfk2S2LWZnHwLdoamjnKFY94IN5HpQlShCFD3vSNqlFtR03GcV0XW7xtvuv
 xUFUEiDwtb+Aen91uLy73cVKo8gJ/Ctsx03R/kMdPvZSXnXPr421CA/2l+1+aIKx/XQWudbhK54
 5hOe1LGuIE76Naj4ZSm7rCQbjXnWlMmGNk6FgwiNw0pWmrdRxCfPACGRH92q2J0meOJZbBa2ERk
 1U6Ey/dEUPSH2CFasiTPTRWVM1COvoDMoETqfskjdwg+8jxg2iJHOfaN/JmNO+xBsAij0dcI/NO
 KX/RdJTAN/bn2snfmePV+aocVwXSeoXrnJmFSknJhT05Nq59Bc6xsUoQczLk2Y5JURVAbmixCO2
 hqk0R2ZlM+7SQ39B0ozGCVDlZZ7dXxZ2+scfCSRvoOW++cD1WHMrGDg+zVQdIEQJ3eW4k1XlYnO
 5VYmR02oUek6GJiCWUA==
X-Proofpoint-GUID: hM2MterEIwGNC_p1pcrqnzjOQxSIMifG
X-Authority-Analysis: v=2.4 cv=O6IJeh9W c=1 sm=1 tr=0 ts=6a1ea534 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Hk-PcD55WIolp562rqUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020090
X-Rspamd-Queue-Id: 4B47E62BCED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110797-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 6/2/2026 3:17 PM, Jianping Li wrote:
> Allocating and freeing Audio PD memory from userspace is unsafe because
> the kernel cannot reliably determine when the DSP has finished using the
> memory. Userspace may free buffers while they are still in use by the DSP,
> and remote free requests cannot be safely trusted.
> 
> Additionally, the current implementation allows userspace to repeatedly
> grow the Audio PD heap, but does not support shrinking it. This can lead
> to unbounded memory usage over time, effectively causing a memory leak.
> 
> Fix this by allocating the entire Audio PD reserved-memory region during
> rpmsg probe and tying its lifetime to the rpmsg channel. This removes
> userspace-controlled alloc/free and ensures that memory is reclaimed only
> when the DSP process is torn down.
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@kernel.org
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>   drivers/misc/fastrpc.c | 96 +++++++++++++++++++-----------------------
>   1 file changed, 43 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index f46a8f53970d..33be8bed6a0b 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -276,6 +276,8 @@ struct fastrpc_channel_ctx {
>   	struct kref refcount;
>   	/* Flag if dsp attributes are cached */
>   	bool valid_attributes;
> +	/* Flag if audio PD init mem was allocated */
> +	bool audio_init_mem;
>   	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
>   	struct fastrpc_device *secure_fdevice;
>   	struct fastrpc_device *fdevice;
> @@ -1344,15 +1346,16 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>   	struct fastrpc_init_create_static init;
>   	struct fastrpc_invoke_args *args;
>   	struct fastrpc_phy_page pages[1];
> +	struct fastrpc_channel_ctx *cctx = fl->cctx;
>   	char *name;
>   	int err;
> -	bool scm_done = false;
>   	struct {
>   		int client_id;
>   		u32 namelen;
>   		u32 pageslen;
>   	} inbuf;
>   	u32 sc;
> +	unsigned long flags;
>   
>   	if (!fl->cctx->remote_heap ||
>   	    !fl->cctx->remote_heap->dma_addr ||
> @@ -1383,31 +1386,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>   	inbuf.client_id = fl->client_id;
>   	inbuf.namelen = init.namelen;
>   	inbuf.pageslen = 0;
> -	if (!fl->cctx->remote_heap) {
> -		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
> -						&fl->cctx->remote_heap);
> -		if (err)
> -			goto err_name;
> -
> -		/* Map if we have any heap VMIDs associated with this ADSP Static Process. */
> -		if (fl->cctx->vmcount) {
> -			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
> -
> -			err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
> -							(u64)fl->cctx->remote_heap->size,
> -							&src_perms,
> -							fl->cctx->vmperms, fl->cctx->vmcount);
> -			if (err) {
> -				dev_err(fl->sctx->dev,
> -					"Failed to assign memory with dma_addr %pad size 0x%llx err %d\n",
> -					&fl->cctx->remote_heap->dma_addr,
> -					fl->cctx->remote_heap->size, err);
> -				goto err_map;
> -			}
> -			scm_done = true;
> -			inbuf.pageslen = 1;
> -		}
> -	}
>   
>   	fl->pd = USER_PD;
>   
> @@ -1419,8 +1397,17 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>   	args[1].length = inbuf.namelen;
>   	args[1].fd = -1;
>   
> -	pages[0].addr = fl->cctx->remote_heap->dma_addr;
> -	pages[0].size = fl->cctx->remote_heap->size;
> +	spin_lock_irqsave(&cctx->lock, flags);
> +	if (!fl->cctx->audio_init_mem) {
> +		pages[0].addr = fl->cctx->remote_heap->dma_addr;
> +		pages[0].size = fl->cctx->remote_heap->size;
> +		fl->cctx->audio_init_mem = true;
> +		inbuf.pageslen = 1;
> +	} else {
> +		pages[0].addr = 0;
> +		pages[0].size = 0;
> +	}
> +	spin_unlock_irqrestore(&cctx->lock, flags);
>   
>   	args[2].ptr = (u64)(uintptr_t) pages;
>   	args[2].length = sizeof(*pages);
> @@ -1438,27 +1425,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>   
>   	return 0;
>   err_invoke:
> -	if (fl->cctx->vmcount && scm_done) {
> -		u64 src_perms = 0;
> -		struct qcom_scm_vmperm dst_perms;
> -		u32 i;
> -
> -		for (i = 0; i < fl->cctx->vmcount; i++)
> -			src_perms |= BIT(fl->cctx->vmperms[i].vmid);
> -
> -		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
> -		dst_perms.perm = QCOM_SCM_PERM_RWX;
> -		err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
> -						(u64)fl->cctx->remote_heap->size,
> -						&src_perms, &dst_perms, 1);
> -		if (err)
> -			dev_err(fl->sctx->dev, "Failed to assign memory dma_addr %pad size 0x%llx err %d\n",
> -				&fl->cctx->remote_heap->dma_addr, fl->cctx->remote_heap->size, err);
> -	}
> -err_map:
> -	fastrpc_buf_free(fl->cctx->remote_heap);
> -	fl->cctx->remote_heap = NULL;
> -err_name:
> +	fl->cctx->audio_init_mem = false;
>   	kfree(name);
>   err:
>   	kfree(args);
> @@ -2425,12 +2392,21 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>   		}
>   	}
>   
> -	if (domain_id == SDSP_DOMAIN_ID) {
> +	if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
>   		struct resource res;
>   		u64 src_perms;
>   
>   		err = of_reserved_mem_region_to_resource(rdev->of_node, 0, &res);
>   		if (!err) {
> +			if (domain_id == ADSP_DOMAIN_ID) {
> +				data->remote_heap =
> +					kzalloc_obj(*data->remote_heap, GFP_KERNEL);
> +				if (!data->remote_heap)
> +					return -ENOMEM;

allocated data never free with directly return.

goto err_free_data;

Beside, we also need free data->remote_heap in err_free_data path as you 
added new memory allocation.

> +
> +				data->remote_heap->dma_addr = res.start;
> +				data->remote_heap->size = resource_size(&res);
> +			}
>   			src_perms = BIT(QCOM_SCM_VMID_HLOS);
>   
>   			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
> @@ -2438,7 +2414,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>   			if (err)
>   				goto err_free_data;
>   		}
> -
>   	}
>   
>   	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
> @@ -2519,6 +2494,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>   	struct fastrpc_buf *buf, *b;
>   	struct fastrpc_user *user;
>   	unsigned long flags;
> +	int err;
>   
>   	/* No invocations past this point */
>   	spin_lock_irqsave(&cctx->lock, flags);
> @@ -2536,8 +2512,22 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>   	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
>   		list_del(&buf->node);
>   
> -	if (cctx->remote_heap)
> -		fastrpc_buf_free(cctx->remote_heap);

after removed the code, the cctx->remote_heap is not freed:
1. cctx->vmcount == 0
2. if (!err) is false

we should free the cctx->remote_heap unconditionally if it exists.

Thanks,
Jie

> +	if (cctx->remote_heap && cctx->vmcount) {
> +		u64 src_perms = 0;
> +		struct qcom_scm_vmperm dst_perms;
> +
> +		for (u32 i = 0; i < cctx->vmcount; i++)
> +			src_perms |= BIT(cctx->vmperms[i].vmid);
> +
> +		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
> +		dst_perms.perm = QCOM_SCM_PERM_RWX;
> +
> +		err = qcom_scm_assign_mem(cctx->remote_heap->dma_addr,
> +					  cctx->remote_heap->size, &src_perms,
> +					  &dst_perms, 1);
> +		if (!err)
> +			kfree(cctx->remote_heap);
> +	}
>   
>   	of_platform_depopulate(&rpdev->dev);
>   


