Return-Path: <linux-arm-msm+bounces-89355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4096CD2EDC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 10:38:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 33477300B012
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 09:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D9E357A5C;
	Fri, 16 Jan 2026 09:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9Uouf7W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ar3QrhID"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3748B357A24
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 09:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768556306; cv=none; b=ZnKAhoDaaWye02m526RmZC1mrTl/8T1cfExqDgv0HjK0jkzx5JHcR6ZBqL9/MPvQD1HTwf5FlpOqHFMmiOuL9X7GhNWgDae9DjmXK+ZGOhyQzziImld/kNObPtjfa70QQ+1Iz9P1Qubfpsilk9kVsUwfwwNmei6IZFbjWFnvZC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768556306; c=relaxed/simple;
	bh=DfVisQf62urS+nfEn1q9WIOlgdP6bHa0HeM9G1pZL0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bJXXYWJ5FFIchXwKd5BFduzM6MYHC2arPo2T9VVUfxZKMeclelgpPpI6ORKbMbuXRpgbrlcrAhoRKiU/1fbXbJnbnxWQQRCn8Ei4oDXAWfwTPxAv5g7wA0EnBtTeVV89l8zXHRBblMwoN2JIZ3g/FMoDiDUI+bVTLt+HfCBaZH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9Uouf7W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ar3QrhID; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G8Empv4100868
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 09:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qMa62W+p8IOSew9lvV0PO8b3C+Nq25+zTXf+BFVYDgE=; b=j9Uouf7WRl6PoZQ/
	qlWxaJZkc1/jRlDt7QbjkMCU61RydoMrys7TtqZYWUgIAekM3EHWB6pN4tatv+z8
	Rhj7MZ378gVypliuH3raaW9SvwcZ6O92m3lXZ/Zd4UxQcjfPr5dZIgDiS1746kv2
	EOJ2C0cIi3bBZ76YuIv5pNw4bU9sddrQ3zH7Bbod2zWHElFw3QN0SxjlreKiMDi3
	jKkoMnXh2HLkTW5zbvPUgpgMXbZHsapj85JmD4nBTU5pYVRVvO2DM3HZ3mnk2HQ9
	lNwkn140CmCpdTWf6U9sG9GW369pTVJjwiZRK4VMm19o4giQhqi+WC4diog8f7+H
	tkxwlw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9751msc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 09:38:23 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c52ff723c86so1114255a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 01:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768556303; x=1769161103; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qMa62W+p8IOSew9lvV0PO8b3C+Nq25+zTXf+BFVYDgE=;
        b=Ar3QrhIDWC+Pt4PyfvaHfJKvBrKc0Bp3tqhb3XaMmR5YtJ7BpECGwUtrJa3zD4w6e8
         5pRa8UUKsXwhky/foRnslGtl8QYjRi1ugmMc3mBZa5yvPbrCe7fm4xqk20srnfudmxMX
         1RtAgoR7maH02HTHfXr/4u0JOUVPapgaoNaaUwlV8hH0WE/GbTsGzpoHzn3j9hliV+aS
         0FjZxevIxGmlp2bm4yKB0qAw7jiDU/QtW3WeRoSzbHNdFHIyLymkC2wVMqs18MrpcVS9
         y6gTRszIv3Sd8HEcm4Gy4uLUSlq2q5Cz0kct2b39FujKieDK5ed5PysyFE4R/SjTOjIw
         E5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768556303; x=1769161103;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMa62W+p8IOSew9lvV0PO8b3C+Nq25+zTXf+BFVYDgE=;
        b=cwcxDTxZ+t16dYzY2BvORd+PMaLzltV2TIplOf/KPWjFapCHkQBP0Y+WPvCBOqL/Y3
         7RWIKfepTfcYjksWsPqoi7UCn9sutZt8KijjG9H27ekk3YgJPar1pBsRIiIAECCOLVr4
         61InwWK8jFlSr7RVEr+X4dqsPlXoH2Fr3U3SxmoOW/24uFO6xOmM8oE1K3XR3jH1LEb1
         iYwxZGsAeE9apMQBSI2idhzW0uasV42wR1LLP3LBT7NzDVhJBmomF7d5yNhOQvxAwzmU
         tP8q3LH7+DaOTBIWb/ZY4LnhhyyiyPzrPXi6LMBD5RoYc9uxIqiLMuNedhsVnx28TV5b
         uCdw==
X-Gm-Message-State: AOJu0YxjiCPrV8vf0VNf+BreO+07BUH8PTXDaoULitOlZ0C1OuNylIGX
	p0qZLdVgIrMRLQfa2OdM8+ZyZK6MaHZcON4rMwpWG3IqdyrF871Y9+6Ezi4HK1wv81f9eX9wG5H
	CeaoJCUO1kvxygYyOtmlMKPzJdvETi87afWNkfJAu/ktUIw2IG9EOYtJ3AAW+q3ZdFRoA
X-Gm-Gg: AY/fxX4AAsTphPSRpq3IENIhf3y2CgXnZl+IIZdd/cry/w90XxcXzRUnWzMcS326m3j
	hl0jF5oGeIoXZR21LI0asBFx4U+CofNzRmWd9aWqUD6BV2JGYdUzaUWpjbHmV38i5l96gYNB4eL
	trDInXgKOT7hPm/W4+NAJxrhjGzZKrbmsw5ilGd4sPmui+zXGMyHHaVLvzEH5NYDN5rkriYQ4uC
	Lnl+2oEwpmLBKX03NcQc/Vn5eZGupvhLgCRUZUj+/sK0fGLxGUmPja6kmAX14Xv1xlR6NnwD551
	LNiAp8PcG6rrOznSjT7e8RGfSvmA6JtoKLANXyt9TghUxEA54YPMPVQ8hAVo5GkM9vJu/E3Q/Nn
	fd2Xghmy4t0iWkrUEoQubvEADaBYxxXg8y2cWSYD6Aw==
X-Received: by 2002:a17:903:2f4c:b0:2a0:97d2:a264 with SMTP id d9443c01a7336-2a7188fd7admr18393245ad.37.1768556302641;
        Fri, 16 Jan 2026 01:38:22 -0800 (PST)
X-Received: by 2002:a17:903:2f4c:b0:2a0:97d2:a264 with SMTP id d9443c01a7336-2a7188fd7admr18393015ad.37.1768556302181;
        Fri, 16 Jan 2026 01:38:22 -0800 (PST)
Received: from [10.0.0.3] ([106.222.229.125])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9e85sm16315735ad.26.2026.01.16.01.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:38:21 -0800 (PST)
Message-ID: <6c1377d1-1a0f-77c8-3257-6fae1d5de3de@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 15:08:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 1/6] media: iris: Add support for multiple clock
 sources
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251210-knp_video-v4-0-8d11d840358a@oss.qualcomm.com>
 <20251210-knp_video-v4-1-8d11d840358a@oss.qualcomm.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251210-knp_video-v4-1-8d11d840358a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3MCBTYWx0ZWRfX/3tdHcGkPgii
 C9oPMDZxv2v+m+K3Z5c8UY3DbJ29weEroGzVUZp4QPWJhW7zlNiQfRgSh6a5Zl/hrLjSBVh4NSA
 wUwj9/KnlgyYrXAnho+POCcBInpSk2QD6ELMYlJJi6zdzs2kf/BiJc5gdrbixEBr99scfxZ4dy8
 UNKHBn6haDSOpIVrAzD2PN28U6EAO99a2BULDQ5nYUCx5etByCuHGdZHPhjO7M5NtV4rhd8Wy7i
 dVQU58i6mgG0MfDT0CvJzDIQDUeuhMTV5XYGvq4Rs3Pjia5RNFW88hg1M7bNrRCH1PD70x5TkjX
 Tt0dMIW+GDrAspaHTLvc8eAtw5Tm/ftSbJdHDwgnk1ilu3GLLUVs8BoPTI5M8KM637GrBp7LIcL
 UmrX5EOELsahbrUR/BVopMR9XGDOY+SpYXB8sxoIV0xKTBk6Bulzd1dkxp4Nd/u9Lj2G+r+/DZT
 P9V9/BJDGR3liW3LAEw==
X-Authority-Analysis: v=2.4 cv=Sv6dKfO0 c=1 sm=1 tr=0 ts=696a070f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=blWSk0AuXjsE0o78ys1YMg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=PpCmD9vaob51LmojhM0A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: PJmI3geL6dbH-2maMM0E_p9MJHfaAYyj
X-Proofpoint-ORIG-GUID: PJmI3geL6dbH-2maMM0E_p9MJHfaAYyj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160070



On 12/10/2025 6:05 PM, Vikash Garodia wrote:
> vpu4 depends on more than one clock source. Thus far hardware versions
> up to vpu3x have been clocked by a single source.
> This adds support for multiple clocks by,
> - Adding a lookup table
> - Configuring OPP table for video device with different video clocks
> - Setting OPP for multiple clocks during dev_pm_opp_set_opp()
> 
> This patch extends the support for multiple clocks in driver, which
> would be used in subsequent patch for kaanapali, when the platform data
> is prepared.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../media/platform/qcom/iris/iris_platform_common.h  |  1 +
>  .../media/platform/qcom/iris/iris_platform_gen1.c    |  7 +++++++
>  .../media/platform/qcom/iris/iris_platform_gen2.c    |  9 +++++++++
>  .../media/platform/qcom/iris/iris_platform_sc7280.h  |  5 +++++
>  drivers/media/platform/qcom/iris/iris_power.c        |  2 +-
>  drivers/media/platform/qcom/iris/iris_probe.c        | 20 ++++++++------------
>  drivers/media/platform/qcom/iris/iris_resources.c    | 16 ++++++++++++++--
>  drivers/media/platform/qcom/iris/iris_resources.h    |  1 +
>  drivers/media/platform/qcom/iris/iris_vpu_common.c   |  4 ++--
>  9 files changed, 48 insertions(+), 17 deletions(-)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

