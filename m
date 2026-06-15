Return-Path: <linux-arm-msm+bounces-113253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VzzDCPY9MGpXQQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 20:01:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D2968906B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 20:01:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PKhxQXz3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PhlO5cnn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113253-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113253-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09A96305592A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 18:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24AA4310652;
	Mon, 15 Jun 2026 18:00:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FBA30D3F5
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 18:00:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781546404; cv=none; b=k5BWcb6ieBnpaeMMOZBCvkGOMr9AcoGkWnneUxyIlt/sQ8DtuIlv8lsge43WmyNzE4tn85lBLSPpMYLNH9w3k7U7MrZJGfrFxLwcFM3+bVvokRc9ZBKKKoXB7POWuWJXdeJ0/TmshWuW3+KehRoiSNK12je3QDvxNYikFp5Rsx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781546404; c=relaxed/simple;
	bh=/T20fKjGztsJQ87ufRGpByOtPnHbRW+6wIDEKpP4RU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fu8dKDahJk17GQVVJzI8rGJd1nhSIQjG7IOqvCZLyaYUfxP18w+hP6NAi3/eK7t8gceOCwHdmdE+4DL4K/lqsF87TE2aBgHIM2WDMA3ltt1K6pTL/jhx3++o31ptprdM20xdej2DZjwEms/zTu+2GRoHu9BOUqsDtBdXYTeJ89M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PKhxQXz3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PhlO5cnn; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFhTQG414189
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 18:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kRsizAxY/r3NTCTR+W2kx0FDoYBEA1sH4F+4U3CB780=; b=PKhxQXz3nnsHUnf8
	q4EEOAjkBUdG2RJvlEBef1Vq81k1UVHwT6tjIUAVALR8nLqoIWhGpjlhjB3ZNXNh
	jmurSJWBWAYZV+txDx6clR8Ou4eAHIPKt0oineyD8cMvOwzUw22K410uShdPGZWj
	uXjOUZkrmJrVQ3lwWC1Je+9Ec9ygSgVV691tE/x46Uh4HDQaRjfHA4aDNLJFPRbZ
	y03eETJ1b7WEwIzoeHXopdQFl6XVkX44yf6AoDpwo4TJvoheuA6FMh15CzJPXVc2
	tpr7pcO64PwfBgbxVhuLePoMIhlHJXOhtR7a8Zoe6v0ekMue20eSX6/feJbev0eZ
	wdeDjA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter025pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 18:00:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d98b828c8so5764399a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 11:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781546401; x=1782151201; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kRsizAxY/r3NTCTR+W2kx0FDoYBEA1sH4F+4U3CB780=;
        b=PhlO5cnneut5WOwdfT7g+JtsPWrR9A6zjn1S3Wh3z+7m9Z3Qr1BtsYamTjOw0y7Y+D
         WutGcM05Gga4ZStjClI3EQDsT6yTCpDz+I1tR1xifCZwQEK9fWC6sJBSzFGlnyuR0Z1a
         0BypnkP8ypSZNUtEesoxDBdCetlX1S47/7EjdVtTqGzjomNI5QzhNltuL1b/psmxJab/
         OeawoAlQqmKFBz3KZu4IS8EcfiRzvaCMbzwHKJNYLEwXlWYuFG5PUdGITvnuTOnJw7QG
         wCABpGK6uzFRAEA9KhiVIRRkYm0Tc8WISn2X8wi9WFDheLBJ6U7v5tl8nkDuQnOTVUKv
         bsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781546401; x=1782151201;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kRsizAxY/r3NTCTR+W2kx0FDoYBEA1sH4F+4U3CB780=;
        b=AvsgV24nQ0pY37Noey2r7DFAgvlnJJfTAIWmMp6xIcGwMXz3/ScsNTKMBvZ8GJYQst
         5dHmGy0017IOZg+HTNFjFhHPF1EDm+gItrpRryABwuIytN2IrLjbt3zk0uSBVFLc76vA
         dt274FEUgzP0jLtAG/t0Wovub3SskJVS09KgZX3Rv2C9O0N4NjhyhnJgMVWAlZb/SQx9
         mAxdPhNwagQlIym5SNwKm9dMEco6tacAfsybHp5g5dDbsab2HswXgT8v6PksqzS3ecb9
         +MAPyXYJ2eq/+Es+Zm78YTNPRmRwJuaf6o7SfKzBWtkPeMBpwhYetXEtboymHlJ4yS4Q
         Kr9Q==
X-Forwarded-Encrypted: i=1; AFNElJ/PL/2cYcwDuiSSNrc4pSbfhBDbXVKJmWRbCYfX7zzyJfg4iePDOyk53B4vn9cuAT/OOi8I9/w3psgBAtqc@vger.kernel.org
X-Gm-Message-State: AOJu0YzyMUZ3/6Xh0R20zV90N9yBIdRK+ON1ID04omMieDhScHbxEpzV
	usvmKyK9+X2PKTsXzDCitrxcWBMPYp449namJNv0IFzlaGeydXwgXEG6EQtotriCnB/yKZNjLY/
	4tvnNtEuSR4gZ7Rpmgj6Q1eBlpDrQz1OpfMWWw908T0JEbiJYZH4kuDPG6Nm1d5wKJFX6sbQzoX
	aS
X-Gm-Gg: Acq92OH7R3Ce9Z++ulG+cAauccsUPTyvHDMoh8BiGPA0qsWyo3NVS+Gd9n1fHr+KIoC
	bX1o12tZhnus0uYrRs3p+ioKOhmybOME0XAz6x4mDCAs/bWXO0DAGShbOAU0lpHAx9LTbzXj0Bw
	23Qtb7sEttb3HfYhDLdx96DAbcjGTYZRUAAzNgHxZP/IUaFRkxwgUg0X3aUHBii78PP+nvDg86Y
	c4U0kkJwdAipzUELzm28nK2wQFp33sXhcS4e4zR88RuxUeyNW7L/c1FLtXODwsC4y4WYXSwE9BF
	U9TRuv3kmr83m+NZaFm0i0Klj1MJ5Zxb/LcD77hx90E3+GwxRM0Rs4AGq2WX6eGr8FAqU3wvCZT
	vXY2P+auPkqh+HrVgVKFDa1hIs11rg+McHumVZfxl83utu9fSeyH3GJye
X-Received: by 2002:a17:90b:4f88:b0:368:f0d0:1ce8 with SMTP id 98e67ed59e1d1-37c52840f17mr337790a91.9.1781546400518;
        Mon, 15 Jun 2026 11:00:00 -0700 (PDT)
X-Received: by 2002:a17:90b:4f88:b0:368:f0d0:1ce8 with SMTP id 98e67ed59e1d1-37c52840f17mr337752a91.9.1781546399936;
        Mon, 15 Jun 2026 10:59:59 -0700 (PDT)
Received: from [10.187.126.18] ([106.221.183.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521aa047sm316268a91.3.2026.06.15.10.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 10:59:59 -0700 (PDT)
Message-ID: <bcb9b9df-1cfd-ec92-a08f-5ea99a07bf83@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 23:29:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 06/16] media: iris: Add platform data field for
 watchdog interrupt mask
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
 <20260612-iris-ar50lt-v4-6-0abfb74d5b3c@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-6-0abfb74d5b3c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sk3jfflXZcdHgvei7zIq85Nf3RVuBxuJ
X-Proofpoint-GUID: sk3jfflXZcdHgvei7zIq85Nf3RVuBxuJ
X-Authority-Analysis: v=2.4 cv=UPzt2ify c=1 sm=1 tr=0 ts=6a303da1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ym48ABLkKUHSTpi9L/JoRg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dkSSNRsQlKXtGsl7zWAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE5MCBTYWx0ZWRfX1iz29zRRZhM9
 Nhdv8i0WvwH0yrqCOlKd8+qoFpEcp2iWthiYZGZqr4eulSR2fjNf1NxrycyZ+RZfFSx+p49MyEP
 aW7rWtLtKO19D04QOKFbFZHUu3eve+QDsWCb2FSP4x2fnuA3rY5qiLQrv0LwxZ5e/CardQ2875M
 I+5/XD+p0LCSz3H1ta/CieXTJLcssYaSJIFMt6q6Xdzy/z9kCWXzD6dsJSjzxngFa1WxCXLX+W8
 xaR6ThECd9EWkHnL8dKwctGrOEfb/gvtJtK2/Ft432bs7wfqeh6VpuyePwP9qE7l/dLkgxhzxkx
 oJcE6VrhYB12yI0NiC9ooDShBMh4Kbm2Ysxf3T/N3pPDwTg1JIb2qrjUinWd5mW0yajmmYfC+0g
 EsNP7lEb/YFPqQvz8STyP29KFcExKKI87PYAjmSIG1Wl2IAbcKbE39bTNUdCUMfjhWM1efuOMJJ
 ep8oILtXRcJizN2prqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE5MCBTYWx0ZWRfX+gTCotmPVonj
 /WrWveiJOnhbgoYi8QpMCKXz4bBt7Qw4nyFkPeI6+UcBdU2G5WCJEyMQ2H2LNFwnESYydGyCnFG
 /PS2osmgc0EId+1o3KY74LIwwvdMqzw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150190
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113253-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 77D2968906B


On 6/12/2026 2:55 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>
> For AR50LT core, the value of WRAPPER_INTR_STATUS_A2HWD_BMASK differs
> from the currently supported VPUs. In preparation for adding AR50LT
> support in subsequent patches, introduce a platform data field,
> wd_intr_mask, to capture the watchdog interrupt bitmask per platform.
>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_platform_common.h      | 1 +
>  drivers/media/platform/qcom/iris/iris_platform_vpu2.c        | 4 ++++
>  drivers/media/platform/qcom/iris/iris_platform_vpu3x.c       | 6 ++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.c           | 8 +++++---
>  drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 -
>  5 files changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 55a4fa356985..81fcb2854772 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -315,6 +315,7 @@ struct iris_platform_data {
>  	u32 tz_cp_config_data_size;
>  	u32 num_vpp_pipe;
>  	bool no_aon;
> +	u32 wd_intr_mask;
>  	u32 max_session_count;
>  	/* max number of macroblocks per frame supported */
>  	u32 max_core_mbpf;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> index 961dce2e6aa9..eeef453c583f 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> @@ -16,6 +16,8 @@
>  #include "iris_platform_sc7280.h"
>  #include "iris_platform_sm8250.h"
>  
> +#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
> +
>  static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
>  	.firmware_data = &iris_hfi_gen1_data,
>  	.get_vpu_buffer_size = iris_vpu_buf_size,
> @@ -94,6 +96,7 @@ const struct iris_platform_data sc7280_data = {
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
>  	.num_vpp_pipe = 1,
>  	.no_aon = true,
> +	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
>  	.max_session_count = 16,
>  	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
>  	/* max spec for SC7280 is 4096x2176@60fps */
> @@ -124,6 +127,7 @@ const struct iris_platform_data sm8250_data = {
>  	.tz_cp_config_data = tz_cp_config_vpu2,
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
>  	.num_vpp_pipe = 4,
> +	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K,
>  	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> index 74626b35d9cb..261db38a013b 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> @@ -18,6 +18,8 @@
>  #include "iris_platform_sm8750.h"
>  #include "iris_platform_x1p42100.h"
>  
> +#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
> +
>  static const struct iris_firmware_desc iris_vpu30_p4_s6_gen2_desc = {
>  	.firmware_data = &iris_hfi_gen2_data,
>  	.get_vpu_buffer_size = iris_vpu_buf_size,
> @@ -113,6 +115,7 @@ const struct iris_platform_data qcs8300_data = {
>  	.tz_cp_config_data = tz_cp_config_vpu3,
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
>  	.num_vpp_pipe = 2,
> +	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
>  	.max_session_count = 16,
>  	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
>  	.max_core_mbps = (((3840 * 2176) / 256) * 120),
> @@ -142,6 +145,7 @@ const struct iris_platform_data sm8550_data = {
>  	.tz_cp_config_data = tz_cp_config_vpu3,
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
>  	.num_vpp_pipe = 4,
> +	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
>  	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> @@ -179,6 +183,7 @@ const struct iris_platform_data sm8650_data = {
>  	.tz_cp_config_data = tz_cp_config_vpu3,
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
>  	.num_vpp_pipe = 4,
> +	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
>  	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> @@ -208,6 +213,7 @@ const struct iris_platform_data sm8750_data = {
>  	.tz_cp_config_data = tz_cp_config_vpu3,
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
>  	.num_vpp_pipe = 4,
> +	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
>  	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 375bcd923476..41498f94480e 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -109,11 +109,11 @@ void iris_vpu_raise_interrupt(struct iris_core *core)
>  
>  void iris_vpu_clear_interrupt(struct iris_core *core)
>  {
> +	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
>  	u32 intr_status, mask;
>  
>  	intr_status = readl(core->reg_base + WRAPPER_INTR_STATUS);
> -	mask = (WRAPPER_INTR_STATUS_A2H_BMSK |
> -		WRAPPER_INTR_STATUS_A2HWD_BMSK |
> +	mask = (WRAPPER_INTR_STATUS_A2H_BMSK | wd_intr_mask |
>  		CTRL_INIT_IDLE_MSG_BMSK);
>  
>  	if (intr_status & mask)
> @@ -124,7 +124,9 @@ void iris_vpu_clear_interrupt(struct iris_core *core)
>  
>  int iris_vpu_watchdog(struct iris_core *core, u32 intr_status)
>  {
> -	if (intr_status & WRAPPER_INTR_STATUS_A2HWD_BMSK) {
> +	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
> +
> +	if (intr_status & wd_intr_mask) {
>  		dev_err(core->dev, "received watchdog interrupt\n");
>  		return -ETIME;
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> index 72168b9ffa73..4fffa094c52f 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> @@ -41,7 +41,6 @@
>  #define MSK_CORE_POWER_ON			BIT(1)
>  
>  #define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
> -#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
>  #define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
>  
>  #define WRAPPER_INTR_MASK			(WRAPPER_BASE_OFFS + 0x10)

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


