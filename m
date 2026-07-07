Return-Path: <linux-arm-msm+bounces-117160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tROZKFOkTGoYngEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 09:01:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1C17183AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 09:01:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=K1W4QIh1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=a2ZV7HpM;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117160-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117160-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 828E2301D770
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 07:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82401A316E;
	Tue,  7 Jul 2026 07:01:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321393BB9E1
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 07:01:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407686; cv=none; b=FJYIC8G6whjs5COJy/USsiLw14Adm4LKu73UMmMnUNStNif71exfxS/vdQI4D/+1AxZ4cLknkYCOolt0R/pQp3EoqMoxOLJ9Jw8zVuUUCJxXYVHvJ2Fty626ZOrlApngwthwFI/YoJke/3O48F5IymclcpKe4/25nhla5weYxZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407686; c=relaxed/simple;
	bh=mxgvNlWliZQCG6wCEEkgWX0xiqlvmiZJtHUI9NjrOYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hq6/6K14oo5b6whyQyQjNiV8HfHx8EnH3qJ/QtP7684Dvx/dAGDe8Z5DwgMxX2ZXbP2ctketno3FAlUznrlB/yXQAckoNNaz4vNV2tq/CLgG53/TugbBpksLPcW9hyHjEc1ncY3A/34g8urgEwQAL4PqZdv6VmsBneaLq2yg30s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K1W4QIh1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a2ZV7HpM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748oZW2669163
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 07:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dhLdgviZ/NZ7tpfISDWHNswmJtK4l1TkYgvgi9STN3M=; b=K1W4QIh1QJ02N3WI
	k+wITDmA8kNKXsE0YI9iFvmYjv77kvPPzOPjernwhDpnh/tE3HcYs1wWCuPeCxw0
	LY1pJ7w7z8lt2HpeTXnAX9yCrDaNgoRM4tzm7tk0nC9sY1h1sFSgcU55PckZaWz3
	+Xn8/brgAnHr/k9/u+KwN/iRDmod4AGdC2JsdEjYA8t0nbHh4Tf0Jn12nPtn4CTr
	QG0oN0Lw+qfb7cSVe4A6KnG3nMQB2+QtSv5+NPehw819bwD5pwCxAMqpnp3W51u4
	DPAbIFEtQNmPUYo7mh6ffvpZsvaCEQvxx2XPxEI3S1xMhULyeMwqQsHFlI+ESDKq
	FpTr6g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgvq8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 07:01:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cae455cf6dso53357405ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 00:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783407684; x=1784012484; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dhLdgviZ/NZ7tpfISDWHNswmJtK4l1TkYgvgi9STN3M=;
        b=a2ZV7HpMsuprJ/4g2AlydpRwtduabcX1EQYU6RNdNL4X5ia99FkH/9eKZvx+lbtGN2
         FEa5I0pfJOJavR9BIuprXMg1FDmSOGjp2yZ/oGp/hPIVlyP6DXg7FgtCwFKRm/gBdE0u
         8yG13A5iSf9SUBF33eK8UJfGGBfJBJJwQ7ZZ4AHDC1WOr8T5BZTCGYBiJz6Xnr7PCJ/1
         Tb5iE/Fja6cI20Z49ZGiWb6u/FcKqtU3+z2SLO2cb4OdlkqCSnveHynCaIruz2C4yBUv
         qUk/KLRTgY5Nx3qovMFFFjqcE7Eqz91Av9mgpnj/j4cPoWIQsaoKRKbUoFEaz+Dhptzu
         qquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783407684; x=1784012484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dhLdgviZ/NZ7tpfISDWHNswmJtK4l1TkYgvgi9STN3M=;
        b=CmI9VKXCHdUl6ffEjp4wx3DWywH1bkyyHpkYbnifmSoDxvkKUnRV4Ba71BRWr1IzyP
         7SgVQly+uWJsJkbE6uGttiG48iYjh14HGDb6bYK+Ps3d6zGBUi1NoGLZlWVc8vt6HUkb
         NsQ7NrC2D0XyfmjmFk6ooev1BDuFOqcQI0ISHY4peFIrZAQGS9XFW6FNiiexLn6L6VHk
         RYUCIr1PnVaLQaUdnnwoMQVtepsN+Kq3gqC0wb+fveDQfxr3c7PZxrXNHMecC11PuuJX
         xkEDx2ZhLE7Am/xkXLZ/FX9yxtJbqM+kKGfSpZkLKOjTlGZmQ1nd++Gqn2VR652T7PVE
         Hcpg==
X-Forwarded-Encrypted: i=1; AHgh+RqK73XyMDnutAqGWiAeyM/uxqyOlN5iXWIWOqA6F8QdJMnHV73wJkQQAg1njmFsgYdQeG2D2PIDeT0taE66@vger.kernel.org
X-Gm-Message-State: AOJu0Ywue0fVGtoA9XBrH4d/tdJf5jWuGRTEDGUALQB9D4eYnm5NbZA/
	dkUUAYG4cpkOGEMKXaGQ0DA4UTOmh3JQ2YeiCCrW7JI4zQp7zHlo2IMZne3Fhr6LhqCXO+WKOt2
	MM+qjhdRgoyR9/iqdQrOe3kCqxX1aXt4C8jCtha/yq6GpUPAlQXp2C8I3tVDpyaGnb5af
X-Gm-Gg: AfdE7cl0YYDtzp7qk3+glYxDQnYeAF4WfMeYdK5tqXkoX6ciQRPfxWVyxmm6QtWl0TK
	4SzW3slZcAPC+Tmhs9pTnMAM3BGq8wEDPo9J94DUkdbsENiVnkvuDVVpyyV9f3u8sd8nCq5y8IY
	+xTk8cz3P8Mcy8k+tmUiQBRikpma5q4WFddr9W5giU6UrY8AXhEJiGdPtNDB3q592ItLI9DkOMN
	9iERRLWVSssb73WUF/2U+Hk1CknF+byf5UegVNUx7nDcYRZY+yqjrLKsixdKPcAI4mf6Qk3lbgr
	rWmwlryFks8HOlxlRz1s+hNFhrpDbtjfK3vT45nO4z42qt1dXf+ww7uaas9bvKFIWRaMcQpOlqa
	6GiKX4/+5wuE3n6lZvIBgGa8GyDg5bzmEGpIxCFIe
X-Received: by 2002:a17:902:fc85:b0:2cc:6817:d9b1 with SMTP id d9443c01a7336-2ccbf076fbamr37808505ad.41.1783407683525;
        Tue, 07 Jul 2026 00:01:23 -0700 (PDT)
X-Received: by 2002:a17:902:fc85:b0:2cc:6817:d9b1 with SMTP id d9443c01a7336-2ccbf076fbamr37808145ad.41.1783407682871;
        Tue, 07 Jul 2026 00:01:22 -0700 (PDT)
Received: from [10.204.78.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bbaesm6346595ad.57.2026.07.07.00.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 00:01:22 -0700 (PDT)
Message-ID: <1e7d0b9f-380b-41a2-8aba-7ab25c6a8680@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 12:31:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, stable@kernel.org
References: <20260707061733.495-1-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260707061733.495-1-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kXujLwq81ZJhH2XfU-iAHCS0UVqU7Fr3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2NSBTYWx0ZWRfX5JRre03L5Xhe
 9QTB7u3GpNRl3ddSyQLegQQs90H05DTq9Z8MHaqHEGD7BdjdSnBdP7L1xcUdEcdEA6nwwo/w+o5
 Z0ivVWYlOPIHldF1t+4u4Ajg9SIIfsBzgOxjJsp3jhJtvmxVvQwFgtmc+QJbsdV83GzsXqaFyCQ
 hn/OH79jZgrI7uZnAVQY+bJ9XHQXSvVZHTrK7N2Xfv3rr5eSya2ccd19v+4abFd8fKg8GObfrFf
 SMNASYLCz66TqVzatiFrmQ9IeK8XSF6GXSeeG+D8ImZZnmVBywZkAPd61tFmetqD88/Ub5VCzJf
 JCpkck5LLmZELcfmYxccZGvXmF/AyfRVLHsLyMwf5E+iJJ7kW9yDgrLaleDC18gb+JTJSQA6X9Q
 e1Sn4I+iP+m/LAHsivhFvGlMI4/hdiCCOp3PlDVdLM5QnWb7KCEiSJIPEFt5GRgyCpC59ay2b43
 /2/mmEMp2iiR9ue7zyQ==
X-Proofpoint-ORIG-GUID: kXujLwq81ZJhH2XfU-iAHCS0UVqU7Fr3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2NSBTYWx0ZWRfX2gUFr0vJb9zI
 XAjAcBJTtoEhF5DWpERJ0dzkIlupifbTuiB4y0+3SMacQ5Fj6ydi76i6vMmOQVxRELLgE6tgfE9
 WAdcIPRYRQvCPpKZfzgmlVReJGyXRos=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4ca444 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HXEXjcvW3tC2QbQot0wA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070065
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117160-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jianping.li@oss.qualcomm.com,m:srini@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:abelvesa@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:stable@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E1C17183AF

On 07-07-2026 11:47, Jianping Li wrote:
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
> Add explicit validation for remote_heap presence and size before sending
> the memory to DSP, and fail early if the reserved-memory region is
> missing or incomplete.
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@kernel.org
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
Changes in vN and lore link to v(N-1) series would help here.>
drivers/misc/fastrpc.c | 119 +++++++++++++++++++++++------------------
>  1 file changed, 66 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index d86e79134c68..1ec37e6c68a2 100644
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
> @@ -1344,15 +1346,24 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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
> +
> +	if (!cctx->remote_heap || !cctx->remote_heap->dma_addr ||
> +	    !cctx->remote_heap->size) {
> +		err = -ENOMEM;
> +		dev_err(fl->sctx->dev,
> +			"remote heap memory region is not added\n");
> +		return err;
> +	}
>  
>  	args = kzalloc_objs(*args, FASTRPC_CREATE_STATIC_PROCESS_NARGS);
>  	if (!args)
> @@ -1376,31 +1387,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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
> @@ -1412,8 +1398,24 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	args[1].length = inbuf.namelen;
>  	args[1].fd = -1;
>  
> -	pages[0].addr = fl->cctx->remote_heap->dma_addr;
> -	pages[0].size = fl->cctx->remote_heap->size;
> +	/*
> +	 * Audio PD is a static PD and retains the remote heap
> +	 * information across daemon restarts. Therefore only
> +	 * the first attach should provide heap information to
> +	 * DSP. Subsequent attaches reuse the previously
> +	 * initialized memory pool.
> +	 */
> +	spin_lock_irqsave(&cctx->lock, flags);
> +	if (!cctx->audio_init_mem) {
> +		pages[0].addr = cctx->remote_heap->dma_addr;
> +		pages[0].size = cctx->remote_heap->size;
> +		cctx->audio_init_mem = true;
> +		inbuf.pageslen = 1;
> +	} else {
> +		pages[0].addr = 0;
> +		pages[0].size = 0;
> +	}
> +	spin_unlock_irqrestore(&cctx->lock, flags);
>  
>  	args[2].ptr = (u64)(uintptr_t) pages;
>  	args[2].length = sizeof(*pages);
> @@ -1431,27 +1433,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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
> -	fl->cctx->remote_heap = NULL;
> -err_name:
> +	cctx->audio_init_mem = false;
>  	kfree(name);
>  err:
>  	kfree(args);
> @@ -2418,12 +2400,23 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		}
>  	}
>  
> -	if (domain_id == SDSP_DOMAIN_ID) {
> +	if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
>  		struct resource res;
>  		u64 src_perms;
>  
>  		err = of_reserved_mem_region_to_resource(rdev->of_node, 0, &res);
>  		if (!err) {
> +			if (domain_id == ADSP_DOMAIN_ID) {
> +				data->remote_heap =
> +					kzalloc_obj(*data->remote_heap, GFP_KERNEL);
drop GFP_KERNEL from kzalloc_obj()> +				if (!data->remote_heap) {
> +					err = -ENOMEM;
> +					goto err_free_data;
> +				}
> +
> +				data->remote_heap->dma_addr = res.start;
> +				data->remote_heap->size = resource_size(&res);
> +			}
>  			src_perms = BIT(QCOM_SCM_VMID_HLOS);
>  
>  			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
> @@ -2431,7 +2424,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  			if (err)
>  				goto err_free_data;
>  		}
> -
>  	}
>  
>  	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
> @@ -2490,6 +2482,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		misc_deregister(&data->secure_fdevice->miscdev);
>  
>  err_free_data:
> +	kfree(data->remote_heap);
>  	kfree(data);
>  	return err;
>  }
> @@ -2512,6 +2505,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>  	struct fastrpc_buf *buf, *b;
>  	struct fastrpc_user *user;
>  	unsigned long flags;
> +	int err;
>  
>  	/* No invocations past this point */
>  	spin_lock_irqsave(&cctx->lock, flags);
> @@ -2529,8 +2523,27 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>  	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
>  		list_del(&buf->node);
>  
> -	if (cctx->remote_heap)
> -		fastrpc_buf_free(cctx->remote_heap);
> +	if (cctx->remote_heap && cctx->vmcount) {
> +		u64 src_perms = 0;
> +		struct qcom_scm_vmperm dst_perms;
> +
> +		for (u32 i = 0; i < cctx->vmcount; i++)
for the iterator use top-of-block declaration style for consistency> +		
src_perms |= BIT(cctx->vmperms[i].vmid);
> +
> +		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
> +		dst_perms.perm = QCOM_SCM_PERM_RWX;
> +
> +		err = qcom_scm_assign_mem(cctx->remote_heap->dma_addr,
> +					  cctx->remote_heap->size, &src_perms,
> +					  &dst_perms, 1);
> +		if (err)
> +			dev_err(&rpdev->dev,
> +				"Failed to assign memory back to HLOS: dma_addr %pad size %#llx err %d\n",
> +				&cctx->remote_heap->dma_addr, cctx->remote_heap->size, err);
> +	}
> +
> +	kfree(cctx->remote_heap);
> +	cctx->remote_heap = NULL;
>  
>  	of_platform_depopulate(&rpdev->dev);
>  


