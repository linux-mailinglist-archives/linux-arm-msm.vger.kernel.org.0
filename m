Return-Path: <linux-arm-msm+bounces-103478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QA33AVfg4WkKzgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 09:25:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CAE417E05
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 09:25:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82BFA3007373
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 07:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC60313E29;
	Fri, 17 Apr 2026 07:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSuI4xNK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QNHXrNdt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1483832E151
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 07:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776410602; cv=none; b=gfnohcSuElM2bieXvvE0NRIC+fS7dReFd89+uw2EEjCHqeu+IKaFOi7b0rsg7eLayO5BYi9AwB2Fp7GgyJNPCBtj+T0/yepqyhiKMKFeN+sZQKoTd2aQQmh+BVOuE3/Zyh4d7fhacJMBB0vNZQjIqLc/Cg74kq9gQnQwvWx/rLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776410602; c=relaxed/simple;
	bh=zAO4yiZIspj/B9kX9m52ii9BBdRAiIgRVZAlZgVeJ64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A1VNwZdyaugWxm/lh5TF8Ba7Xw7B+B+r9+bU0FraPZ4KNtt9Dip3HMk2Lkba92vbgqmUHUZx9XG7E9DvNvEs07Vxxd1kQl5Ax5Z41PO+ZaeXjMpCez0pDgNsy1OSwbnVKCtXbyOOsGO6XFKUJNX+MAqry2wwe5D1G7K3GmoJrxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSuI4xNK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QNHXrNdt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H0g5g6869719
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 07:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	njJoLDDTMciPrudwZKOk2MghYIVD6S5mzTyqW4fpstw=; b=PSuI4xNKAwKmlDIb
	cvFoOa4IT4KA0EEWhdZR6Cj3HvFkW5Ap25EcMghv82WI0qTsE8sf8F9fRq0tR4p/
	FC3T+wy7MN6cEQs+fY+PjACYAim8+XBQ5HJexM2WvmmWUxcFO2ves81nm/VcB2Fa
	FBpb3xoLO6CjRaAKg7kc5/oPeGyTuFYyVwmWptLPj0q0Ko5asUPywPFn+bcJG9rp
	sjKdWUWvHYTT2aoIzPZcXjtiwjX4tHbtSDf3ETfRbZFM79/Y0u8L1w5hDHgwh8CV
	6IUcBD2N2FJGwExtqzLfNWBneUAZ4f2qls7Hj4nazcYnFUy4kSYxaf8fxCqdaMHp
	iHS+ww==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djvruc5gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 07:23:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b24a00d12cso4626295ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 00:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776410600; x=1777015400; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=njJoLDDTMciPrudwZKOk2MghYIVD6S5mzTyqW4fpstw=;
        b=QNHXrNdtv2EKCyB9A6vvm71glMjl96y3/FwAOkeEdov13LR6sAw/uBhnB5zpmvyd8g
         7kpmWzBYTKEQ2yBf7iSGo9MUFOUmXhsZWvzMlVh+/VwmBgmktU2NMqhx1hl0CG6WDqi3
         atTd2DunaHhgelBQBuLLrQwfeW9dVi5bnVAgnb3oN6PSQ2V+aMeUSn9sUzRNngJcxtpL
         fkdJ6dn9K3fQKXlwGgG7/ZfEYc+PQZkN2LL2px6MhU/4LivsU/HY8IVU8kvZsdebiSk8
         LPPstuc6+5CQJnpp3MH97kanVCL5GQkJvU0KZ6gYHna3IEi897xWvz6b2TiECUqvj6p5
         VIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776410600; x=1777015400;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njJoLDDTMciPrudwZKOk2MghYIVD6S5mzTyqW4fpstw=;
        b=Dx4qHcdp/82DhwIcr9ah3xmL/y90O9/YZ7ZlCnfD8psNaKg8JY69DhG+6swJFwdJQd
         z3TzZakCZOY4JRffT7BKBMNry2hiaVpxr35gP4a22N9/Xb0ZnotsPwOmlFMCI7XAyAR0
         7E+9yiKMqGe2KSEiTDe3wVBuZ/d1n9KRzePzZKXo1ORDQYM85YxuSEZ7jdQI9mCnyEpx
         rlbqWRxgKhLeWE4Q/FErLR5q8kr7ljkvmOULv8zEK5Byb4SfnZ3vyaFzs/HNzwwvPaj0
         T844UMvWzF7k9Lr6RFuIZo7xST9d4LIpNyjGuP1iyF4UR4esqJ1z1s9hYkFPQz2TuUVS
         gsIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+q53chspzTaBlkFNL0TRaEPpYoDL724PSCnbUvMsjhRo0U/ownMMvnXZpXss08M59YrI0EeRpIffWhteJF@vger.kernel.org
X-Gm-Message-State: AOJu0YxOxtooOpGjfXnNpNfXAlC1rg8Y6N0g0xiEfarm/t6ZpN/oLB/a
	sqizK3etBTyraBIseG9IdQVLOyls+i/ImLqEQmOPmPh6idM2YVRxOHzhhIR2XbHCxbWvcSKPLdd
	WuuvdYTpqZ+Tsn1tSoLxYrzNrXyTqzZKXYakuE6QRrZ8GZiD1pHJCwrILiKz8uMifU31U
X-Gm-Gg: AeBDieub8BjsX/r+nSADXOu6UfmoHzXFdIYdyu96dv7TvjsPAi3pNU0i69YH3YePbMz
	M19fxSAQhdNknW07q+jyCj3LUIUNJgqjNcUwiCKwODnk79XmRJB5ABMUUN6HXe1cXfA8E3hhaes
	3qQIWrcepgf/+WplaWh2ags8Kc73yEVeZP93cecJdOR9/TjyfJLCPnC8pG5eareVyfHIQBq4D1h
	WA/Wz82ud5dYr+SWdKvCyIBlWEymZZyu6uita57KwRxJ/OQS449IgC3ihNzUs/GgvFq8xwURX3I
	m7DLMS281M5nAveVJ7aHfMlNRGNm921N7hPxuO2vwF/RTPV1//39fx8QYKBqUVnF93rLNYMsR/O
	vR16FY8tV0VT7ThBkcrcSceADBO5/rEWvedMCBFssqyjF/Q1vs/tAKdxQGhjf5PWx
X-Received: by 2002:a17:902:d30b:b0:2b0:673a:7c90 with SMTP id d9443c01a7336-2b5f9f50051mr11957115ad.28.1776410599554;
        Fri, 17 Apr 2026 00:23:19 -0700 (PDT)
X-Received: by 2002:a17:902:d30b:b0:2b0:673a:7c90 with SMTP id d9443c01a7336-2b5f9f50051mr11956935ad.28.1776410599091;
        Fri, 17 Apr 2026 00:23:19 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.231.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab4cc47sm10964765ad.82.2026.04.17.00.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 00:23:18 -0700 (PDT)
Message-ID: <7ca67466-51d7-0003-47c6-9d0e6518745e@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 12:53:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH RFC 3/7] media: qcom: iris: add helpers for 8bit and 10bit
 formats
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
 <20260408-topic-sm8x50-iris-10bit-decoding-v1-3-428c1ec2e3f3@linaro.org>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260408-topic-sm8x50-iris-10bit-decoding-v1-3-428c1ec2e3f3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA3MiBTYWx0ZWRfXyDqwY6Kkkasr
 KB0F9ofaFec145vdv7zEaIVZ6yukrF/yVxxX9UEHMx2OHv83dV0Qc1bFRJI10/CMAB1Jr5bkKnw
 oVTHaMizGnDt/9PEVsPWqsDAL2VDvqHI5p13xCIqbBfZp4+92lGt2rwjNB/C/xr8o7Rz2NDAKTO
 9cNJNiPaK33v8lMfvBOWsGsfpSzDEvFd/lKLDUnAOu4JZ50LLo0fC+bRSj+DU/8p8a702Czo8U9
 YBBvSKX11ZKa66Km4xfZ/L1qlO4my0cUBVRCQb6SQnb48iCDPSx0hJkSzL+b7X8ZHT1k/hcEXLG
 xk7nkSEvJQQjFFUgraQp/xQzMHkOKOyF4MYTcV/9kbevzLlrgKK+5xQDZY18UVs2J1057ZVlW9M
 14tYfWxq+mkXrDKa8vRHFtDU144pA/JPDj/hDhsXHqvh1BjxByhF/UMzRjUL4ZgZ7kyedI9uste
 6KxxVNmKzJqSoBUIhkQ==
X-Proofpoint-GUID: znG8nfZ3k14Qk5Ps26pcNkYhqzvKRf6h
X-Proofpoint-ORIG-GUID: znG8nfZ3k14Qk5Ps26pcNkYhqzvKRf6h
X-Authority-Analysis: v=2.4 cv=GcInWwXL c=1 sm=1 tr=0 ts=69e1dfe8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=llJV7PLoYzplBNayqe3woA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=o9wjZkula7dpSB38lCoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170072
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103478-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 91CAE417E05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/8/2026 10:13 PM, Neil Armstrong wrote:
> To simplify code checking for pixel formats, add helpers to
> check for 8bit and 10bit formats.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/iris_utils.c | 12 ++++++++++++
>  drivers/media/platform/qcom/iris/iris_utils.h |  2 ++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
> index 26f51a0ccd04..c75dcb8e671e 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.c
> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
> @@ -40,6 +40,18 @@ bool iris_split_mode_enabled(struct iris_inst *inst)
>  		inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C;
>  }
>  
> +bool iris_fmt_is_8bit(__u32 pixelformat)
> +{
> +	return pixelformat == V4L2_PIX_FMT_NV12 ||
> +		pixelformat == V4L2_PIX_FMT_QC08C;
> +}
> +
> +bool iris_fmt_is_10bit(__u32 pixelformat)
> +{
> +	return pixelformat == V4L2_PIX_FMT_P010 ||
> +		pixelformat == V4L2_PIX_FMT_QC10C;
> +}

A similar check is required in the current first patch of the series. So
you can move this patch earlier in the series?

Thanks,
Dikshita


