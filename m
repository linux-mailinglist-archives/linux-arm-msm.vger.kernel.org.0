Return-Path: <linux-arm-msm+bounces-115374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6VcSC8eeQ2ovdgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:47:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C37616E31D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:47:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hHoJy0Gd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=g79XJbTg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115374-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115374-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38CAC30ED33B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724B43F6C5E;
	Tue, 30 Jun 2026 10:39:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5669A3F4DCD
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:39:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815963; cv=none; b=ZaaSBO2Ln0kycEBbejFmy6mDLHBbc8JvcW/PsfOJkALTa0iAJoZwW5tK8bROUCQWQhZnXcuzTGCc/enTY2DrxtH1LzE4oxc7wZG0iH4KUG/UMGFIKNV5vJ4ywqG+AfJr31vYak8QXyS6WSCDJFfwVAab0jiWxDSZijXG6Oo4oJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815963; c=relaxed/simple;
	bh=SSgV13BOWb5nS2Fpmd/8MZ5Xw/5W1uB5JUh+6AiJA7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2MPHSV8EIJf3JzSEKJW11Ipo10O8U0CHfrV1QIee7vkWmGf9T5W1Wst1hCGfi7UkpVvg40d6LSIt4WBQyp5IYkmzeHUXD8mwoLnpabokHTTj8R2JebmgXmjoUtBN2axRqRCJu/4TzqVATAmlOVbOfRoIbtXQ4B1F1/M/G4k1e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hHoJy0Gd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g79XJbTg; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mnHR1541498
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u+IixcZnrCq0YCBcT04603GxKzb/cwi1U8yD4nVob/w=; b=hHoJy0GdpI7sLRRp
	KdIXFy54L+WbOkJuva/pydKLahhMIbTrT7EOhyvxEcyKU+kcideHKBtKSLS4iOxn
	NCrfvAQXRkTUaKYfB8FdYIGkJGgR2uB7lui6QOOqsbvTlgPckoDLTgvQ3RmCpcUV
	KYxAGg/nARMOdXydXvycoyNfaNTO3wqtuNyn3C7UPPLZmwJRhuj/EY4icm8RjKwh
	0ZnFk6fM/DjAcUywvO57E6/taLYAFWB2yaVKu3Lkw2yl2v5Vc998/H1sHRI10Jqw
	JUY6sZb3/TOeczq3WpbwYpJ4TjFf8mRl+jpeZ0WTkW/o2vw4kXvQJ4L6gqcrD/+z
	AYx4tw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44wp1xwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:39:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e6cb57d25so3646185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 03:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782815956; x=1783420756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u+IixcZnrCq0YCBcT04603GxKzb/cwi1U8yD4nVob/w=;
        b=g79XJbTgTFexJZFDoRNQ60kIsPDQB77x3IpVj4bV8cdpumnkIBvHDeArnw7iSx37tA
         du9JlspbNAwjLM2xk0QIJWbJ5pvd1tYcdENbSj8iuO8KVT/VUCPOvdnmJnZtCqGcUAuK
         4oHU4ubHAbfkuIjEvSTEdP8hiPgX/teVp+aeGQMPXtRL60HI2xp/bAYsLv0RaeFfMai4
         K3OrfSJ6Op/thI8vIyoZs/Sz0Dx0AMsJE46bPCHvR7VbWmSKWqxrmu9yfmTk4TS6iU4+
         w/R2XnbBW9lhUbH8TuhEEsmv2K6h4Trl7ANvLc730Y/zKcPVCHiNguziK2M3caIdh8PV
         RuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815956; x=1783420756;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u+IixcZnrCq0YCBcT04603GxKzb/cwi1U8yD4nVob/w=;
        b=kJTGdAQxSMJOo4T88vewtSOR1/8ba1Rsd8NZYJLCAyS4/ogHGTcCrju72l7crHUID4
         wxC3swU5teNdc3bpY2QVa0onaac2blD8FXq1wbQWV0MWylQOKC+Mha/g/A++05CC/t71
         x0Uca5WXY8ceQrjUHrugzMrIgVVYVKniFx/tQ77BnN7s+YltRTvT7SCkBB9XvMpU/JcF
         wM+3II+MGUrRIrJXH9vVJmhEwYE2E/UvbzCnZQMPlMZg4e3j9nDRlNRUcr2i/fzJCZ+g
         KXkQZEOm5EmTdBZj7okAWMXxtiswuv5FCJTcfUlMq3UL1Zc5/ZDZ+9P8mK+LFMYgg9k4
         iuHA==
X-Gm-Message-State: AOJu0Yx7L9U/LzvcCArd4q2U85pE+BmuY5qBSF0Rn1h/gIVQF6As+MbZ
	ra1oiLwP5A3hRcJi6Ti5ksgYrY3lfsRF6hJRPOT2EP0l7xJB6WtoXP0jLmdT8Mbm8pN2zv5mX4b
	pzlj6J+ykBGcWxOzVNcHQPr6l2DpivPcqXTKgoHsgA4eDPBi3plPowCk1jPTJGTVN1XzC
X-Gm-Gg: AfdE7cnbC1zg2Zgt8VPrP8fizMLRONSN70/lTtqZkIA7ct3Wu6i0Edl4M0ZBPqOC5wU
	K8EjpAjgnjAKqDU79J/BZcTQlOPS9nGNQLUsmrP+qtXgUZlFMqtdV7sIabJ2pA8inmtMPc1/Rse
	7BMFvBZNWuQc4v8xzSSqI0fBHUkk6LYLLSW/+s7AvfhxEz6yUAHYCvYDLA/5/tVlwJ15ad4ha0n
	LsJhGkNLNeyZg6dUK52YbHJ6MRy6II4aTzOlU6ofU8b5ekT5pQnaDFaGHMO9ybP1osIk54x+wOD
	k8FrZERKkedq476kvBcfTdiygUd8Jd+KzYTjp73OokIsQf+l0qLmQ8igpu3wptJtjBc6tm5dhks
	G7tzXQFRIo8ChuF/Es/ziPWIo572Dnv+eG0E=
X-Received: by 2002:ac8:5e52:0:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c108197a8mr23711131cf.6.1782815956084;
        Tue, 30 Jun 2026 03:39:16 -0700 (PDT)
X-Received: by 2002:ac8:5e52:0:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c108197a8mr23710881cf.6.1782815955621;
        Tue, 30 Jun 2026 03:39:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f47394sm101229866b.43.2026.06.30.03.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:39:14 -0700 (PDT)
Message-ID: <1c5c6399-e4cb-4d33-8fb7-fdfde0b33e19@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 12:39:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] firmware: qcom: scm: introduce keep_mdt_buf flag
 in PAS context
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
 <20260430191253.4052025-7-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430191253.4052025-7-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 81z2pWFWm-CmrTVxyvU2jwpdQXmYW9Tw
X-Authority-Analysis: v=2.4 cv=AtDeGu9P c=1 sm=1 tr=0 ts=6a439cd5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=I3VYQ2l06oOMjfKrlQAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 81z2pWFWm-CmrTVxyvU2jwpdQXmYW9Tw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NiBTYWx0ZWRfX6vxGhOS4KUZn
 GXRwF+HO0meUZul6sU28bkagfUpFuGiNcAmY7PNMhWFOwytkK9Y1TAruLwmUrOiUDoy+Uwos0/S
 W19dcYopECyI1xQa1l9LhUA5tCBfizyQkzlRG9CuN0kpZhjQdBEimoT9iasL4UF3V+x5JIG2MgH
 uZfDd8kTRMrsI202Ca6cgnzKeBXM/DGGWKJq/F8VmK58SkARqTd9jlehxpwv527NZnDMqFZ/D7/
 4srejBeUDyNUokCxHdaXYZpl8lCsG265+cF590Q3Kr4i4un73Ve5xud8b9iIjwbsAAg5yePngy2
 rRhUJkbsLpgEVkjAIVcY0cTY+rMPD4mKgS0q8rLRHC72OBi1D8Zd+RX87UsO65q/9QS1dio5EhY
 QedLqsdwJJlHs3bp9BpxxQXs0KstimP+NpR42M+5WeqZtbzAoVG0/nqj27DQ40Z7ZZ968gEDsIq
 gaLG/vOk6geJ3m37cYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NiBTYWx0ZWRfX6nJ81irEnSoe
 5Lmy2jvMjeQelAQ6QZ/07Rguin5VlEmrBuCpzAuPnSo6JDaXFi1lqH1pRkceKdNVOvnnKfi/I4v
 qIu93lNiBOVIjsmpnhNzHjgr7Z11C8w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115374-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C37616E31D6

On 4/30/26 9:12 PM, Mukesh Ojha wrote:
> The PAS image initialization path always retains the metadata buffer
> when a valid qcom_scm_pas_context is provided, even if the caller does
> not require it. This implicit behavior leads to unclear buffer ownership
> and forces new users of qcom_mdt_pas_load() to manually release
> metadata, which is error‑ prone and incorrect.
> 
> Add a keep_mdt_buf flag to struct qcom_scm_pas_context to make metadata
> retention explicit.  Metadata buffers are now freed by default and are
> only preserved when this flag is set. qcom_q6v5_pas enables this during
> probe for contexts that require retained metadata for subsequent PAS
> operations, while existing callers continue to work unchanged.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

[...]

>  	ret = __qcom_scm_pas_init_image(pas_id, mdata_phys, &res);
> -	if (ret < 0 || !ctx) {
> +
> +	/*
> +	 * Some clients still pass the PAS context as NULL. Until all clients
> +	 * switch to qcom_mdt_pas_load() and provide a valid PAS context, check
> +	 * for NULL before dereferencing it.
> +	 *
> +	 * When a valid context is provided, metadata handling differs across
> +	 * clients. For example, modem clients pass metadata to TrustZone that
> +	 * must not be freed until the authentication and reset SMCs are
> +	 * invoked, as the buffers remain locked until then.
> +	 *
> +	 * Other clients free their metadata immediately after the PAS_INIT
> +	 * SMC call. Therefore, keep_mdt_buf should be set to true for modem
> +	 * clients and false for others.

You say this...

[...]

> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -669,6 +669,7 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
>  		return PTR_ERR(pas->pas_ctx);
>  
>  	pas->pas_ctx->use_tzmem = rproc->has_iommu;
> +	pas->pas_ctx->keep_mdt_buf = true;
>  	if (!pas->dtb_pas_id)
>  		return 0;
>  
> @@ -688,6 +689,7 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
>  		return PTR_ERR(pas->dtb_pas_ctx);
>  
>  	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
> +	pas->dtb_pas_ctx->keep_mdt_buf = true;

And you set it globally for all PAS rprocs

Konrad

