Return-Path: <linux-arm-msm+bounces-76308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A77BC35E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 07:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0C5674E19F4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 05:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B5C218AD1;
	Wed,  8 Oct 2025 05:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOHpaPM5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F9420487E
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 05:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759900567; cv=none; b=qZ/nxJtPOkNYpBCjAaKX4gz4DT8oEb453CgdUbtnET6tEna+1i+2xdfE2JGIxgXT2kAfvsiSmyhHqdegHArZoPXD+V7gry3GbW7IaoO8R/c4Inhi5z6hCGZ1GDaXaVLBqf8Oe5S098++HbH6G3MYuAGCjNOiEeX/9P90G9kwgxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759900567; c=relaxed/simple;
	bh=Xk94Vuc6seJLdFlhJl0nzWNmxlsrdyIWoO3t0wdkjEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k3QmWwYA1ym4f2e6pAhq+trLPfoeeSNPzryQwLu/bPR7dpExedMPYZsf5v3cxBOQkX5yshINB3ht7mpQYPq07eWMuA8MpzWp22rtBLrR+zbA4a8XblvPcox1b9O8eNf39M1Jm0eXnsKexIVTg1fb5M7wVCvM3yavK944cKgCeDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LOHpaPM5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59803s2C012566
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 05:16:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zN3inemXqS9KNGoW5/uyVfSNbK9UhPopJTspFYvxv78=; b=LOHpaPM5Vf0Tp2cb
	fACNshV1ouHsFjzI5o50H3M2xZ8pCUMsYOcPoIKwpeUl0ImRUOGffZg4FkAYtUhV
	TVKpb/GJRRx4OrlExfio7NfBIfayAQyS4xd2v8MozB4xe2/5uOrJZHtcpK6/Blwk
	/QIMBRAfP7xX5QqOZXiExhQMfFw6UPBodmGPdpxKNE+2aeLavTNtAfqhM0LlBvXx
	61J40quY5u1S2wSUhui9/HdYnBvXJJZF1vVo9cq1nGCVlLhKWquHB0XXxbwB+GxP
	HNcAqelur5MjmEbG2G9QB6aS+Iqd6YGyNA5VWEOBfNVXCVl+GNhxZSY6KhvQ/H7Z
	JSHYew==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junu9d92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 05:16:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32eae48beaaso6926725a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 22:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759900562; x=1760505362;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zN3inemXqS9KNGoW5/uyVfSNbK9UhPopJTspFYvxv78=;
        b=RNvY/V5IkNov3Q2XJIow3mPsCT/Kw3xynBU3MHiIu/QXVSniej+v0DA2nKBOjx359e
         4oQIUia0rxnAISB+wwCuKcpRDRGVVwYee12k4AwuYpvm7Mo3xRgYdpJSJCzodj6VE78o
         4Odj7G8etlfKZHtgqw+4oNRO9/PM/ycrnTkSv/RZrb8G2z3pXoppSWhPGHX9M8TS+Kx9
         fiYbA5A8pXtlFVHDl3eP9v7HSQNumx1t5+Zh9JfFBo826BQaTV8SBAoUOW0ODFXRVu/w
         MMaohpog7bDXa10iVyLG928rYasto9ysqWjGeWjE749IY+/8mKpBktlHE+8DrZuUQgJG
         c3DQ==
X-Forwarded-Encrypted: i=1; AJvYcCUACTKFC89gUhYoeBozME5EElvt4Sj7KrPbCQEFyZYRJVfl4ymYm1wrmlAHJLki2ecMXR7FtbJG0JBObi44@vger.kernel.org
X-Gm-Message-State: AOJu0YxAMe0upB89tFjd6DiVzEVrworuJbPWOL6CJWc4jFHSnOyaIumF
	PKoHOmE/3+L8CKfHrXEM2Y7YMpcdFoAN/Kepblugu02zRqSGHr4BUiimqUwYz7W6TGkUbuEQoyn
	Bls9xWsxjeShVygIDfdy3NXaMNAKIvKwzExulO/r6DnwLB2MiXkURYZD7DH43emyZpGM6
X-Gm-Gg: ASbGnctsM0hK4VbD+1mnBUXiYsMiBQSHzr6xkFVRMBTv/jaots0GmRuX2AtRG8TgSmY
	rT+2NfxU3+lghVwDFHgNQDyZSVPPFDnDkGtFG/bdBYv6ULYcbMzizvVUNsHwIo5GoHU/MTsHM9g
	Hf2/QXiYhLX1WqgxhbDYzAE3sc52hdLsaep3Oh96yMb/sa6v37w68t2l1IFVCKl7y7Lrtk7Y4uH
	Z2D4fb1y0fWzsstI2fjRa9JNdBTn2971+UJCzI+Jz57Wmk9zjOZZjJ28kJ0Z7yp94kPUL2Nm5Mm
	zAtnufE3ZE5cn93xVBMDLniNaANJ2V2ABfllD5fx34fjo/KdfIfSpSMmRuU/as9JzAcNcZtXZcu
	zpQ==
X-Received: by 2002:a17:90b:3ec4:b0:32e:51dd:46dd with SMTP id 98e67ed59e1d1-33b5116b782mr2662521a91.16.1759900562240;
        Tue, 07 Oct 2025 22:16:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJfXchZYLk7AwCGFqllzQgE2NliGSPz5KcimSGlsyuUs5e0R13CuQuC6i02t0y4fizJxZ2tA==
X-Received: by 2002:a17:90b:3ec4:b0:32e:51dd:46dd with SMTP id 98e67ed59e1d1-33b5116b782mr2662477a91.16.1759900561622;
        Tue, 07 Oct 2025 22:16:01 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b5114acb7sm1714505a91.24.2025.10.07.22.15.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 22:16:01 -0700 (PDT)
Message-ID: <1530abc3-158b-a3e5-54a6-d96b24178406@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 10:45:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] media: venus: prevent potential integer overflow in
 decide_core()
Content-Language: en-US
To: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <20251007103043.1969715-1-Pavel.Zhigulin@kaspersky.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251007103043.1969715-1-Pavel.Zhigulin@kaspersky.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Ll7FMmsM44uhMx-F9zishb_ifyobLbHJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfXwEfM25XuWE5m
 nvEiMyYJjKRxfcWDrUn2C+cP8DTWEzLlZpB0ww45eRz6NVMyPoFmjUJm6gVjcKjuBiDA6erDzJs
 SujwIc1gGcklYpg+5RA3rGaebORa/PNeUVtyfpz+poTLXq3VtVNwzrU7bbY2TEEizPAOfgUiP+C
 vsMHYSKLIHqymIYnNWUAni0Os0/vHib1c2dDFUWlM9SVQY6XC2NsLL0+xX9uXmc4LwafKcuJAvT
 jHSgD19c9ak059IQ9KExjL94ApEc5Ww0cZWEmVjpFf31+VMHn6fbKdNrMg0cUfYUGT3OgHOZWRL
 +iZrKdam9x12N+qrIsg1EH9Zl4wc72e8E8Xz9JVWD9jih6s8puByUNBwJqOI2keVrwnV7LvqRK9
 DIWqt/4N8k86oZbYpEPZ7H851dVAkQ==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e5f393 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=ACEZY41XAAAA:8
 a=HH5vDtPzAAAA:8 a=EUspDBNiAAAA:8 a=E45_vJ1-3OPGenHQyXEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=QM_-zKB-Ew0MsOlNKMB5:22
X-Proofpoint-GUID: Ll7FMmsM44uhMx-F9zishb_ifyobLbHJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023



On 10/7/2025 4:00 PM, Pavel Zhigulin wrote:
> The function 'decide_core()' contains the following code:
> 
> 	cur_inst_load = load_per_instance(inst);
> 	cur_inst_load *= inst->clk_data.vpp_freq;
> 	...
> 	cur_inst_lp_load = load_per_instance(inst);
> 	cur_inst_lp_load *= inst->clk_data.low_power_freq;
> 
> This can lead to an integer overflow because the variables
> 'cur_inst_load' and 'cur_inst_lp_load' are of type u32.
> 
> The overflow can occur in the following scenario:
> 
>   1. The current FPS is 240 (VENUS_MAX_FPS constant).
>      The processed image frame has a resolution of 4096x4096 pixels.
>   2. According to 'codec_freq_data':
>        - 'inst->clk_data.low_power_freq' can be up to 320
>        - 'inst->clk_data.vpp_freq' can be up to 675
>      (see drivers/media/platform/qcom/venus/hfi_platform_v4.c
>       and drivers/media/platform/qcom/venus/hfi_platform_v6.c)
>   3. 'load_per_instance()' returns 15728640 under these conditions.
>   4. As a result:
>        cur_inst_load *= inst->clk_data.vpp_freq → 10616832000
>        cur_inst_lp_load *= inst->clk_data.low_power_freq → 5033164800
> 
> The proposed fix changes the type of these variables from u32 to u64
> to prevent overflow.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 3cfe5815ce0e ("media: venus: Enable low power setting for encoder")
> Signed-off-by: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
> ---
> v2: Revert min_coreid and min_lp_coreid to u32 as
>     Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com> suggested
> 	during review
> v1: https://lore.kernel.org/all/20251006154041.1804800-1-Pavel.Zhigulin@kaspersky.com/
>  drivers/media/platform/qcom/venus/pm_helpers.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index f0269524ac70..eec49590e806 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -582,9 +582,9 @@ static int move_core_to_power_save_mode(struct venus_core *core,
>  }
> 
>  static void
> -min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u32 *min_load, bool low_power)
> +min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u64 *min_load, bool low_power)
>  {
> -	u32 mbs_per_sec, load, core1_load = 0, core2_load = 0;
> +	u64 mbs_per_sec, load, core1_load = 0, core2_load = 0;
>  	u32 cores_max = core_num_max(inst);
>  	struct venus_core *core = inst->core;
>  	struct venus_inst *inst_pos;
> @@ -639,8 +639,9 @@ static int decide_core(struct venus_inst *inst)
>  {
>  	const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
>  	struct venus_core *core = inst->core;
> -	u32 min_coreid, min_load, cur_inst_load;
> -	u32 min_lp_coreid, min_lp_load, cur_inst_lp_load;
> +	u32 min_coreid, min_lp_coreid;
> +	u64 min_load, cur_inst_load;
> +	u64 min_lp_load, cur_inst_lp_load;
>  	struct hfi_videocores_usage_type cu;
>  	unsigned long max_freq = ULONG_MAX;
>  	struct device *dev = core->dev;
> --
> 2.43.0
> 
LGTM now.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

