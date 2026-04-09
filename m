Return-Path: <linux-arm-msm+bounces-102423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FJ9MlRb12lqMwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 09:55:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAC23C7542
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 09:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F224301106C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 07:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52BCB38757A;
	Thu,  9 Apr 2026 07:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XIy9PRhf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yge4DyP1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E066C38756A
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 07:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775721296; cv=none; b=JDGCvDBMBonMIJSBsKk4Of6fqCbakfi5uzlX+e/fTB5KXei0E3O9rXnWB5lnt8QCapF0shNfB91AQSSI2VxZI/5fDst/7KSTHP77xzPKv1AnRQdy8hpP5GeTBI0c9Onr0FMMnTEIMHlayoKEHn/yEIIPiPKET7J9wjZs3SZ0/Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775721296; c=relaxed/simple;
	bh=ktNl2mHB90IgtXgyxG/SSfnrzhO5Rtd1TTf+qPtuZ4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OVlqx3d+T4HMTLOnebBifnCDXQpI8wD/hTkt979X/9Y0PD86yxf+p/k1/Wgg6POYivVVRzTQ5VE+7Fr1xqCkMneU840HmkdPezGazLm1WLzPvvrtgafBrlVkBnRKF/FZnIVQJO0t+p3VzFfv7PCZRobyywuleSWVmNE5rCKWEBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XIy9PRhf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yge4DyP1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63958Kir3712896
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 07:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UZX5/TVRE8MhjSwrsl7Tfx6LDaNNM+dZtYnyCvbKY88=; b=XIy9PRhfknf2/7ie
	UfoKtaC1DODflqpObMIJKDh88TADi1aCwk6fyi7odDY+7KYPGTRzrKWngwBYgpf7
	JZ/xrYW5V40KZyedGAcHwiGvZWL3XFBhtD54uQX57JUzLhjVzN/jiCHO/chP9exd
	UAQ/BB+OhImdrCs1Y92+EXdjYvOZxRtqcb6qdYStKy2JwRQEhcmoGqqNzSBpvGQp
	k3J8IYoROyT5nxvpratk9bB63OjZB8DCmy7s6eeoiY3/N9vUM/R69CBtTOl+9Hvy
	QEjV4MgCdZrY+SH/QT1OKbjwjsUpOnuHkrVbJiW6S+Y0wO0l6YIe35NH74pSOmwD
	JFl79w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt74ay81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 07:54:54 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82ce0a9e558so723906b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 00:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775721293; x=1776326093; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZX5/TVRE8MhjSwrsl7Tfx6LDaNNM+dZtYnyCvbKY88=;
        b=Yge4DyP17MyaKzRWofP6VoCevWqSnJrVT6QS/T/FuRH0XP2aZC/vg/qSNEEX2kpaAQ
         08EIM47nM5YZgz7VsXD8HHFwN9Z8AyJbgoGmMkVjWcjaOz8XnD6zJvdzUQn395NZT5tv
         CydfyqmhwhtwFIRSzY2EUGULE1TA5pkFbx595IA8Fdxn4/j4xOYMGcxW8n3kjobnU60a
         Tw4fI3put0gPn9rtRdQ/phCn+0gggTjcAEpKOnxSbuHEJ6UC49pNdW+NNP/2j1kC3igt
         bUT0OAYuCtEkR5A8fG2AtbwG2uEgSTYpnkKVCQgRWEI2RTLwMtRA3wCLGc1QyLpGNPoE
         htUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775721293; x=1776326093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZX5/TVRE8MhjSwrsl7Tfx6LDaNNM+dZtYnyCvbKY88=;
        b=Snkv+UQfQvoNX5js3U8t+8wKmVGRpuMboI8LnUwjxkf+Nr8IPn8USYLqoJHZl6eJtI
         GiDkWPtqQAH82qxQXDU8v82K6O5cbZvPZt3wBDZkaxo7cC83nlIYDt9YvHdCHBV7nwJ6
         RaE/S6cFM2GmkuJAL+YOOMBiLWeWZE7bXnWFGyqrKz/G2QxPrIB8gpTZ+zaIJJw2REGB
         vDpgpSahsvAl/9pyLjRKmIPdOvfbUL7EMg4mUEh60e43IJCoiX4+VKnA3UoLQASp0Zu+
         AlJGdXFnpqY1evzT1m+bEE6X6xuWYJrtnyducIIsWT4YOocgY0IYvxeq5q4MqDx0A6QJ
         Ov+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3IGYR2YTxJWzJRMgHplUxoexhKutcndg+toh1FRoMChHttFMpy3qr0wrZKUYnizX/FSIUhnVvNs+Smuw7@vger.kernel.org
X-Gm-Message-State: AOJu0YzGcnJaaTh+QuwK1kvCpXNA73IckAYBvqqq1IoYI5cI4YSz4x3d
	MHJBOVR0U/lX/WPVPogXUo7yBvA+bFddqDsgSzG20Q3iQhB+nTxjtKw5BXiDR9GCFYN0KNrlH1Y
	YX52aweVA7ai5LIK86dXa3+IyWhTuMSHtMaAHfDT6qvPmVa+802VOJ4WwY7E8fWZFt0bh
X-Gm-Gg: AeBDiesVDtXF23hgPjhsv/8uws0nWQlcyknyT0RtYr5HVP9N1DP4rruwFl40LdbTmyE
	9OodH95zSu9MhHu54+KlAtDgeS7L5DO2f6+UtotlwnVsPY+lHRcBwxcaA5jW/I/2q1A4nRIrcd7
	uriC9XI1OfKqQHouDAM91z73y3uO57miPS/4visTxYMZuO0XDqxxOkmDf0GZjYtsUpMistYgdGS
	CkjjIaMKhMhe4/6JfcwrQOCBaY7w/eHjgcC3L+LQBVe9mxo5QmJQQwcWrokmNwKZ6sNikBI6KYc
	gVriEN3szX+HU/yIBfgTR08MQoM/lXa3NyaeL3POr3IkjiEhFq8LrEOdLKpeAgDSA93HMVyHheg
	fJ6OQ9X+3WTV26KBIca8vDqcNdNcRaO2PH2RMp3sqLy/XNKL2QQ==
X-Received: by 2002:a05:6a00:414b:b0:829:b55e:1b27 with SMTP id d2e1a72fcca58-82d0dbcfa64mr24256989b3a.53.1775721293311;
        Thu, 09 Apr 2026 00:54:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:414b:b0:829:b55e:1b27 with SMTP id d2e1a72fcca58-82d0dbcfa64mr24256973b3a.53.1775721292801;
        Thu, 09 Apr 2026 00:54:52 -0700 (PDT)
Received: from [10.204.79.79] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9ca1f28sm24147067b3a.57.2026.04.09.00.54.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 00:54:52 -0700 (PDT)
Message-ID: <2de300c8-02fc-4373-b56d-f6fa336bb84a@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 13:24:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
References: <20260409062617.1182-1-jianping.li@oss.qualcomm.com>
 <20260409062617.1182-4-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260409062617.1182-4-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TL51jVla c=1 sm=1 tr=0 ts=69d75b4e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=5ITuIF2ajUGMKyiTjJ0A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: erWIVj6bJqoTWKYTK69Gm4oxuHGySz9y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA2OCBTYWx0ZWRfX7Qss8H8aoiZ9
 4+Rj/H/M1G6I2bZePhedxcAeLC0TP5l6KRNpd+OYrl7e99r5rEvJvksgmHQvPC4eKDmHEjCtAq4
 i3dnSCSelv09lM2aeAwRBAKjz0/TR5Q4mHo//TJp0tgHTcakDj8cz/Px1CCZkQ+vkRpRfiHvBuQ
 UKyrDfUMEUIk+EBL7xFZqZedkilMTbOJ5AUKEQMGp0St+JjSf4JtVZdKAbdZnjiWDLq+F+FCL1T
 ABAIv8tR3zvAAMsbcWuIzXMWBvqmjmeL7JFQLk9yLRRu2UCDKWKcHZ8oizCDDjFM/rS++75tQL3
 SfMYk2kR8bA2CnWjhOTQRbvWGB3GkyxNnM7PKKBvT7O391yLhKjizAJpsuKaLed1niQJIQyHnNg
 e3Fc6N9GR2sTdavZlThmsz8gfdP4/tvCzDceL35hVCNNnf2t+MnYQ0fYqIDYUcv/qFe6cb/4tFY
 ehTFzXcPFj+QWhAjDaw==
X-Proofpoint-GUID: erWIVj6bJqoTWKYTK69Gm4oxuHGySz9y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090068
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102423-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7EAC23C7542
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09-04-2026 11:56, Jianping Li wrote:
> Allocating and freeing Audio PD memory from userspace is unsafe because
> the kernel cannot reliably determine when the DSP has finished using the
> memory. Userspace may free buffers while they are still in use by the DSP,
> and remote free requests cannot be safely trusted.
> 
> Allocate the entire Audio PD reserved-memory region upfront during rpmsg
> probe and tie its lifetime to the rpmsg channel. This avoids userspace-
> controlled alloc/free and ensures memory is reclaimed only when the DSP
> shuts down.
> 
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 104 +++++++++++++++++++++--------------------
>  1 file changed, 53 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 148085c3b61a..a67ae991c0b0 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -276,6 +276,8 @@ struct fastrpc_channel_ctx {
>  	struct kref refcount;
>  	/* Flag if dsp attributes are cached */
>  	bool valid_attributes;
> +	/* Flag if audio PD init mem was allocated */
> +	bool audio_init_mem;
>  	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
>  	struct fastrpc_device *secure_fdevice;
>  	struct fastrpc_device *fdevice;
> @@ -1295,15 +1297,16 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	struct fastrpc_init_create_static init;
>  	struct fastrpc_invoke_args *args;
>  	struct fastrpc_phy_page pages[1];
> +	struct fastrpc_channel_ctx *cctx = fl->cctx;
>  	char *name;
>  	int err;
> -	bool scm_done = false;
>  	struct {
>  		int client_id;
>  		u32 namelen;
>  		u32 pageslen;
>  	} inbuf;
>  	u32 sc;
> +	unsigned long flags;
>  
>  	args = kzalloc_objs(*args, FASTRPC_CREATE_STATIC_PROCESS_NARGS);
>  	if (!args)
> @@ -1327,31 +1330,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	inbuf.client_id = fl->client_id;
>  	inbuf.namelen = init.namelen;
>  	inbuf.pageslen = 0;
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
>  	fl->pd = USER_PD;
>  
> @@ -1363,8 +1341,25 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	args[1].length = inbuf.namelen;
>  	args[1].fd = -1;
>  
> -	pages[0].addr = fl->cctx->remote_heap->dma_addr;
> -	pages[0].size = fl->cctx->remote_heap->size;
> +	spin_lock_irqsave(&cctx->lock, flags);
> +	if (!fl->cctx->audio_init_mem) {
> +		if (!fl->cctx->remote_heap ||
> +		    !fl->cctx->remote_heap->dma_addr ||
> +		    !fl->cctx->remote_heap->size) {
> +			spin_unlock_irqrestore(&cctx->lock, flags);
> +			err = -ENOMEM;
> +			goto err;
> +		}
> +
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
>  	args[2].ptr = (u64)(uintptr_t) pages;
>  	args[2].length = sizeof(*pages);
> @@ -1382,26 +1377,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  
>  	return 0;
>  err_invoke:
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
> -err_name:
> +	fl->cctx->audio_init_mem = false;
>  	kfree(name);
>  err:
>  	kfree(args);
> @@ -2390,7 +2366,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		}
>  	}
>  
> -	if (domain_id == SDSP_DOMAIN_ID) {
> +	if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
>  		struct resource res;
>  		u64 src_perms;
>  
> @@ -2402,6 +2378,15 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  				    data->vmperms, data->vmcount);
>  		}
>  
> +		if (domain_id == ADSP_DOMAIN_ID) {
> +			data->remote_heap =
> +				kzalloc_obj(*data->remote_heap, GFP_KERNEL);
> +			if (!data->remote_heap)
> +				return -ENOMEM;
> +
> +			data->remote_heap->dma_addr = res.start;
> +			data->remote_heap->size = resource_size(&res);
> +		}
>  	}
>  
>  	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
> @@ -2482,6 +2467,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>  	struct fastrpc_buf *buf, *b;
>  	struct fastrpc_user *user;
>  	unsigned long flags;
> +	int err;
>  
>  	/* No invocations past this point */
>  	spin_lock_irqsave(&cctx->lock, flags);
> @@ -2499,8 +2485,24 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>  	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
>  		list_del(&buf->node);
>  
> -	if (cctx->remote_heap)
> -		fastrpc_buf_free(cctx->remote_heap);
> +	if (cctx->remote_heap && cctx->vmcount) {
> +		if (cctx->vmcount) {
this if check is not needed
> +			u64 src_perms = 0;
> +			struct qcom_scm_vmperm dst_perms;
> +
> +			for (u32 i = 0; i < cctx->vmcount; i++)
> +				src_perms |= BIT(cctx->vmperms[i].vmid);
> +
> +			dst_perms.vmid = QCOM_SCM_VMID_HLOS;
> +			dst_perms.perm = QCOM_SCM_PERM_RWX;
> +
> +			err = qcom_scm_assign_mem(cctx->remote_heap->dma_addr,
> +						  cctx->remote_heap->size,
> +						  &src_perms, &dst_perms, 1);
> +			if (!err)
> +				fastrpc_buf_free(cctx->remote_heap);
> +		}
> +	}
>  
>  	of_platform_depopulate(&rpdev->dev);
>  


