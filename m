Return-Path: <linux-arm-msm+bounces-102261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFhsMfH91Wn4/gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 09:04:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B633B7DA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 09:04:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3EDB3037E41
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 07:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5629C2D0C63;
	Wed,  8 Apr 2026 07:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E17awxVr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XYcmqIzN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BBF2367D9
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 07:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775631654; cv=none; b=XPdqos1tcJUu6nJgE3ZJvFvg0CfhiOauNkUDec2DUgbjRuHTh5i2ZhAsymuwc/JydqbXiut1FTGE+LA7GqX4vNalpYN1uFannHS90qXax+zEpoa0NRIjOsTsBu7w7nyF/JDmNpMWItzNqb4awUq0uRxmlgrYCEg3vnrtyE8wa5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775631654; c=relaxed/simple;
	bh=F07bRJfSVIRnWRjJweYq5Ebrxh0/Ai90PhDU/q2sxak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BJJ3qoPXH2+TdSekqKnylr96LDxq5ou/WvTr8tDpmJXYneSbPGJ5YLHBDtDmBqEaegb56SaDNDMdHZoTQA6jpgshmA3HQULNFXfEUTcx/4sRPAucUJHNzL/qyYg+MKE8LjvtQtRbcpRBDuJO6sQaqCsS2rNH9NsJdLzbty546to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E17awxVr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XYcmqIzN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6386KYmB250154
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 07:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4a0i5VPtdWqpRzBmc+ON8mGOkB7BWWZCejCS4ARgjgs=; b=E17awxVrz19IcgZi
	h5/Qs+3PFBjHPlUBZsMava59W7NHaD4CNC5DNqH2k3bz4a23Zvaa1I/g3IhQtB8j
	TVXCe1sWEaYlb8mE9WSc+5HrGPUYnMIo4Lf3sM8Nyifqm51CDZB1x0SRqNmetMlk
	iWcquy02Q2KzmujVU8Bbkkd+IbtOWkz6JWDMOpRusx2uwrn0a2W+Okxj1/DaEgcP
	G9LAJ7r5k3tRXuHGr4IgJmnbLOQhKa+NAK5gUSHF0e2Aa4I/LCqdYXTElDVriz+z
	HFrNCz7ChY3Y12mo7Qj0OJLcmajkVoGlxYiw42NnQXKpDq9aGl+3koP/SSDV/G0/
	viAlXA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd8x99q0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 07:00:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-358e425c261so6397290a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 00:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775631651; x=1776236451; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4a0i5VPtdWqpRzBmc+ON8mGOkB7BWWZCejCS4ARgjgs=;
        b=XYcmqIzNvwT19j4+0d6AqKdOtMkpkrzL3TV03eyjg0MUFU7RtFcTZpX7aORnZxf33J
         NXAIXTxRE2U4xgRqP6w1cOHBOKxeyPyTvQt8xNl1M07Xg9+COjvBv74rBM+m9k4TWNPa
         QY2bTQdLfK1IjUwcY8lqEQy0mz1YO50ceTtu1I5NeHKhOWRP+zQozB5OPM5f5FKfP/S0
         67tD9QxaYdmErAECwJgIc/8A5mKi4aADrE31Hze1rPwa2ebN50q2FGH5YU53gkHWSkqD
         KgGNRRlcmozFu1m8Ldbi9N36ryWRVzH7GZnqjlncucDF1yxuWxTZ2wOFj9SASCaYc7h6
         iGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775631651; x=1776236451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4a0i5VPtdWqpRzBmc+ON8mGOkB7BWWZCejCS4ARgjgs=;
        b=e4rfZGpmhk8IRkL5gu8JRIy5mMJ3ByJXNvyas1Xei9e4SssBookKZf25vy5H7mS95J
         aXmWle014j728Jsb/K+HFpwBblov7x+JtKtU2ib9TCIg6/F4JbHXEkcJc7/7wq1IBkTw
         Ug29mOoPaq9Ofx4yEDlELHELxphGSWokAkzu9RbuH2TsCRmz+3jpslQzuDaYrr+X4MJU
         23dAqvdjKkPxwpgeYZCHj8e3iaScGnAMJEu4eU4AFAnEKHhQubYAfu/DbOnVuuoxiKlv
         OFSbIpDD4utaZYglxFNO+I9jesloVIfAvIatGzniD/kAPh2nOS6BUoC6mbx8tdk6GRSo
         pNwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBhPbsqAxTITV0uvXUl6HqPQK9rMJXqMviEEeZpAeRVeaXM3k+1jJNKKcjkBq07LBObtgoceY7Mm3kuKQy@vger.kernel.org
X-Gm-Message-State: AOJu0YwpqfW1BLnI8KjkrH6TzIjdkx6UpIRe2H0kI4sZ8bPDstXE9FG4
	2bn2dEuQJJl0mL28eZDYRAZIk0gRdx5gCzwyiyakTlAiYC1kQk+Et+AEpfovKZKMzBinoyg9/BG
	gyCpJQXhUf2ny0s2forUukatx50iGr6Ho0HB6W5k+LE31CE/H/Bk2z89KQjk+VK2S8mIy
X-Gm-Gg: AeBDievjepuGTKhf2pcj13zMkwxMjC3WyH06QeOm54lu18xz2Bz+3OEs06s7yrwVmJI
	uJUAP81z1+N9TJvsA0vEydjAO60HafDFYt4mnkdZgNiBkOTBDZm/+D5jKW6xveVXEZuIIEO/uNj
	5acSLwuul6lGSxkOVQi3P0G0Q8zX+8GusaG9RDh9qDfVYcmC8xKMEOVFsJ4zW/fPl9SC+WVENyA
	/t2oAiVPXER1yMCvGZcLjGzC5IqUL0tAotgw7y7yEW/PJTtz/25amTVllVzpN92WyFg87/xT2D7
	uU+gGzkb6QnSScNUF44VxNn8feRB6oaaNmzcuhIMvOCNA0qUctwn1YvBUPtGqK5YoPVUk/y+40l
	aPWfIPQgm3YuD7mjuHk5I3RMQHape6KKkA0uALfkY7sGtHnGUwA==
X-Received: by 2002:a17:90b:4cca:b0:35c:29ba:bf92 with SMTP id 98e67ed59e1d1-35de6811cedmr18980626a91.5.1775631650878;
        Wed, 08 Apr 2026 00:00:50 -0700 (PDT)
X-Received: by 2002:a17:90b:4cca:b0:35c:29ba:bf92 with SMTP id 98e67ed59e1d1-35de6811cedmr18980560a91.5.1775631650144;
        Wed, 08 Apr 2026 00:00:50 -0700 (PDT)
Received: from [10.204.79.79] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e27aeef6esm857633a91.0.2026.04.08.00.00.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 00:00:49 -0700 (PDT)
Message-ID: <57bd3c2a-1654-4042-8a4d-b11c3c81fc0e@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 12:30:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        linux-arm-msm@vger.kernel.org, quic_chennak@quicinc.com
References: <20260407100508.1027-1-jianping.li@oss.qualcomm.com>
 <20260407100508.1027-4-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260407100508.1027-4-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Rr716imK c=1 sm=1 tr=0 ts=69d5fd23 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=yn8Y2jBmPE2GOrMSEv8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA2MSBTYWx0ZWRfX8SJLiDC/+Rtl
 t6KofkyxixAQ1t6zlfyCKPJizeeQYiOCyEMtV3Y1Y5Y7Fe7Kovc2USJd621Ql4RI3KOVlA4PvAs
 XwlvsYFQkLX/x4yy7rMKKSQfq3PEaHF9/7Io5SQeX/Q+yGy61muyGT9SGffBmjnYAzwcE02v7yN
 WsStlCAzY1MJpf2ds7da61rQprOdWu1az7qZznsbm3gCQmbv3y+KCQbazeo53WJFNzXb9NRJr10
 F5eICMjTTfEtxpwqEl/bpsYLc+XKb42dcXtktUR4sZ6N3VnbDxfst2QUxDRwFdK4TIPpu8DJpU2
 V8tUegPfXEH7/iHHWe3c3wYJfWyB5Dmh2R9YjoeAEtT7+WvNdIBt2+cZRRPqOnoMQrXyXIa9rS0
 KME6tntyMxsrXoHCcrxyIJwmbGnHPE+n9hNZxgaZLxIPn2rBJNBQ9CqMcboBDg8zXKusN8KDCTV
 O5lBHdTvIS2E+/lZEAw==
X-Proofpoint-ORIG-GUID: 59kULxwk3MCm-_x8oUmENQs8QrvcWHtQ
X-Proofpoint-GUID: 59kULxwk3MCm-_x8oUmENQs8QrvcWHtQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080061
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102261-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 24B633B7DA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07-04-2026 15:35, Jianping Li wrote:
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
>  drivers/misc/fastrpc.c | 99 ++++++++++++++++++++----------------------
>  1 file changed, 48 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 148085c3b61a..3b2dc6a9e886 100644
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
> @@ -1363,8 +1341,17 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	args[1].length = inbuf.namelen;
>  	args[1].fd = -1;
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
This call should fail in case memory-region was not added. Connecting
daemon might not be correct in case there is no memory region to get
memory for module dynamic loading and other audio PD requirements.
>  
>  	args[2].ptr = (u64)(uintptr_t) pages;
>  	args[2].length = sizeof(*pages);
> @@ -1382,26 +1369,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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
> @@ -2390,7 +2358,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		}
>  	}
>  
> -	if (domain_id == SDSP_DOMAIN_ID) {
> +	if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
>  		struct resource res;
>  		u64 src_perms;
>  
> @@ -2402,6 +2370,15 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  				    data->vmperms, data->vmcount);
>  		}
>  
> +		if (domain_id == ADSP_DOMAIN_ID) {
> +			data->remote_heap =
> +				kzalloc(sizeof(*data->remote_heap), GFP_KERNEL);
> +			if (!data->remote_heap)
> +				return -ENOMEM;
> +
> +			data->remote_heap->dma_addr = res.start;
> +			data->remote_heap->size = resource_size(&res);
> +		}
Allocate remote_heap only if memory-region is added for ADSP.

//Ekansh
>  	}
>  
>  	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
> @@ -2482,6 +2459,8 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>  	struct fastrpc_buf *buf, *b;
>  	struct fastrpc_user *user;
>  	unsigned long flags;
> +	bool skip_free = false;
> +	int err;
>  
>  	/* No invocations past this point */
>  	spin_lock_irqsave(&cctx->lock, flags);
> @@ -2499,8 +2478,26 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>  	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
>  		list_del(&buf->node);
>  
> -	if (cctx->remote_heap)
> -		fastrpc_buf_free(cctx->remote_heap);
> +	if (cctx->remote_heap) {
> +		if (cctx->vmcount) {
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
> +			if (err)
> +				skip_free = true;
> +		}
> +		if (!skip_free)
> +			fastrpc_buf_free(cctx->remote_heap);
> +	}
>  
>  	of_platform_depopulate(&rpdev->dev);
>  


