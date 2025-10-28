Return-Path: <linux-arm-msm+bounces-79089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1A7C12E57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 06:02:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F1A944FB5E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 05:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E9729B789;
	Tue, 28 Oct 2025 05:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZHLqtm4C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB3128BA83
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 05:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761627684; cv=none; b=F7DUL5VnOYEopjn5Hs/8DMIV6P8WHQQS2Ff8FacIqklOBXWGJdQzMZiXKnug0eZg2k/PDfdn3Xuv3Dd2NbNyDMIl3rH7uwCw3BQYvh5yhytOdywDCC/GNjrItg/TpcgtzMDtz1EaY/jdoKUiF8jrv6hih2ShN135lu12CdbTxmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761627684; c=relaxed/simple;
	bh=Lq0NUp8tzDM21ME58IEDJ0ubQDaHxYD7QlhSXZX4T5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ytpw7ob0UNfjDNtnrT6djZ/TD3nW4cncMF6EZHqP/v7FjoqejvemCDyMqhLgChkY9Tqd7SgS7vXt0tizqe0/V7jNPKgt/VkHjBhVh+mr1WhoL6x2jMjqwRR4YKFEA9PkcZLkcDeYGwX3rLhch6ng8llJfFuDLxF96SMmmlwbLns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZHLqtm4C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S3grrD3165798
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 05:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vad+qn8RkXM2BN3TnKTIwMAAG+YIgA1CHl86YPkog10=; b=ZHLqtm4CHqai9IvB
	qmTba2B1efr68ZmBDME+eF2GlpicIFe36gX0uz/NGyTVHbT/Pcyx1AaAYo0OUrZ8
	BkIc0NgThPUASDXXn/S/vkgpXnYMzRs8S/mTc1ssBhl/l8DIo71qZlXruXypYmQM
	8j49aXc/ahJzCZH/ijj8rzlEHHH4NLItqNbDI/qdetasQ5kAs+yITY5PbWVfKMuN
	pMzihqAhhuEzc4L3E/dz5B+n4KOkMxKUB6vvRZRSG+UPDd9iv4rkwd99lE/Lud39
	ld5h48F7z9m5JYy9SotAs2QU/kqSFGEh+l3qqTdVIraKQsqv/z6iSsiXTr5qkI/d
	X60phA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2bwx1vy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 05:01:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33bcb7796d4so5250724a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 22:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761627681; x=1762232481;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vad+qn8RkXM2BN3TnKTIwMAAG+YIgA1CHl86YPkog10=;
        b=vYJlguKgPm8rvr6wIZIVKnoyU9AEqMKPcpr/1CotdcymWpT5JvMdmz8sa2UeSodIxl
         2gDeneGzjZZgjgKquL6S9f2W7OLir7/Y4f9XP3/8DMB6CZSYCgh3h83sX/Kj7fr9cncs
         lJB3eOxHtbR4kfz7sHiLh0+twfL7GVmdxlmYc7SB5XH3uodcTrDXnGOt/Ner7Nmrh2Ei
         BbJPK4ELYmyw4GHPfKF/XX/a4+utXqawv9dE7Tuz0qVLcHuyDepA7LQiq3pGGr7uat2G
         mV/z1Tjb/b5jPaHW51CsZ1diszh8wUkF4ODS7CZO663LZT9Qt1sVfPhrMhRfAiRYbaYb
         WCvw==
X-Forwarded-Encrypted: i=1; AJvYcCXDglbGf9Mi/qydwnHJYWsXI666lO6ualj7BCjQRDx89zHOwgRMXnIbgueNMwugFuxs7oAQyuu3HjgYuFIY@vger.kernel.org
X-Gm-Message-State: AOJu0YybugnHPyIFa/mCfhND1QSKJwu4G6SUrWgQGm6kSnx5V5F3zkd1
	kB+nHG0NHXXwRARVibnUMnE1OBAnCcyHB0kbBBWLzcPlrtbpPbXzgM/DGsE/Z61kZx49OUOrlbD
	YbmLNaFmED+OHb+zAOO60nrJhV9lKnBwI2YNYApb9KhUgleLtSEp089OCTMC/tsghkkoJ5WBVxv
	lC
X-Gm-Gg: ASbGnctRPCE+PBY/gZtO1M4n/GfOnqpOvVhfATXhdUJTIrV3l565V89UlxkqBcMbgkL
	Q4a4G7PtMjN3V9g22f8YzNNUsPmF3kecSQ9JZzR16ygoYmNP56Cqc8vJzWy0j24Mr0kv8XlCCT8
	5gMLPPTa5CWBDpCWfrQWB9c0NzQ3pkvuX4LjEermbpqlmDKYwnW4PW5et8eJTnWLDcQVg+TaktP
	6PSQJ9GYPPFDvTq44wawt9g6hktuahd0wWOXSa0tNIdVuYwqwq6YFoH5/gyf6n0wc1O1nZ1HKeJ
	95VyvFnZbWJ2j2nN+gVe+Q9BYwvY+nNpRKbIvUQqKeooZRkR1bwcNavpw0c3tKqnST5tcSvCbxy
	WfjvkSQnT0nQkyrN7hosYINn9yetSZxw=
X-Received: by 2002:a05:6a20:6a22:b0:340:fce2:a15c with SMTP id adf61e73a8af0-344d1ba883dmr2074220637.9.1761627680744;
        Mon, 27 Oct 2025 22:01:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdDeIRD4wAR0wRMOvJHEteHWQmjnRT05hGOov0KIeVR9og2SzmIgUQrAfBFQA0Yal7IiQhpw==
X-Received: by 2002:a05:6a20:6a22:b0:340:fce2:a15c with SMTP id adf61e73a8af0-344d1ba883dmr2074192637.9.1761627680233;
        Mon, 27 Oct 2025 22:01:20 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b712d7cdf28sm9039013a12.31.2025.10.27.22.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 22:01:19 -0700 (PDT)
Message-ID: <68974e34-78e0-d82a-f552-044e9bae3170@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 10:31:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 3/6] media: iris: stop encoding PIPE value into fw_caps
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251027-iris-sc7280-v5-0-5eeab5670e4b@oss.qualcomm.com>
 <20251027-iris-sc7280-v5-3-5eeab5670e4b@oss.qualcomm.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251027-iris-sc7280-v5-3-5eeab5670e4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA0MSBTYWx0ZWRfX87YeSzbu6CWp
 aAlVy8x/+J1Mof8/2rEzaYMiMHrU9soIkymjnBp/Imys6m+B1A3t9OggrsUqDUGHhHYms5xu0ZO
 3cPcqbURHaXPTdh7yjl+z3UGrXrbuuOaPHcEJzL7GGzEgYZbZ1fWoWaesEDe7qSXBt49UNFlAAI
 o4IuD1ET6vKIXrX9napc+0CuQrEX+JKAWEh0B46fff/5M00bGA61rg9ukY6kBDfm8ojWibtiVoI
 7dA/4qmw8+iss6P3ZeG50WAEsPVWIINKkLU51F8kixg34gfDIc5lABFx9G1pk3uHSOzhfMc/RHU
 7r33NEOfEmqTJwFO5kLXLA8e3jJBUpVlE5+kDR3pYN8ZDzYjAHjY6LjTpxVSXSwNK/tUldbrIhP
 M7ZlXmk3hQ6ahtdT2diWf1paNXUF9Q==
X-Proofpoint-ORIG-GUID: HMIjXAmOWz-G--G_OwoaZVz6eaAHRKJO
X-Authority-Analysis: v=2.4 cv=U9WfzOru c=1 sm=1 tr=0 ts=69004e21 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=SvJZJoMY8oi3fNviAK8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: HMIjXAmOWz-G--G_OwoaZVz6eaAHRKJO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280041



On 10/27/2025 5:57 PM, Dmitry Baryshkov wrote:
> The value of the PIPE property depends on the number of pipes available
> on the platform and is frequently the only difference between several
> fw_caps. In order to reduce duplciation, use num_vpp_pipe from the
> iris_platform_data rather than hardcoding the value into the fw_cap.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c            | 16 +++++++++++++---
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c    |  4 +---
>  drivers/media/platform/qcom/iris/iris_platform_qcs8300.h |  4 +---
>  drivers/media/platform/qcom/iris/iris_platform_sm8250.c  |  4 +---
>  4 files changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 9da050aa1f7ce8152dfa46a706e2c27adfb5d6ce..c0b3a09ad3e3dfb0a47e3603a8089cf61390fda8 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -313,13 +313,23 @@ void iris_session_init_caps(struct iris_core *core)
>  			continue;
>  
>  		core->inst_fw_caps_dec[cap_id].cap_id = caps[i].cap_id;
> -		core->inst_fw_caps_dec[cap_id].min = caps[i].min;
> -		core->inst_fw_caps_dec[cap_id].max = caps[i].max;
>  		core->inst_fw_caps_dec[cap_id].step_or_mask = caps[i].step_or_mask;
> -		core->inst_fw_caps_dec[cap_id].value = caps[i].value;
>  		core->inst_fw_caps_dec[cap_id].flags = caps[i].flags;
>  		core->inst_fw_caps_dec[cap_id].hfi_id = caps[i].hfi_id;
>  		core->inst_fw_caps_dec[cap_id].set = caps[i].set;
> +
> +		if (cap_id == PIPE) {
> +			core->inst_fw_caps_dec[cap_id].value =
> +				core->iris_platform_data->num_vpp_pipe;
> +			core->inst_fw_caps_dec[cap_id].min =
> +				core->iris_platform_data->num_vpp_pipe;
> +			core->inst_fw_caps_dec[cap_id].max =
> +				core->iris_platform_data->num_vpp_pipe;
> +		} else {
> +			core->inst_fw_caps_dec[cap_id].min = caps[i].min;
> +			core->inst_fw_caps_dec[cap_id].max = caps[i].max;
> +			core->inst_fw_caps_dec[cap_id].value = caps[i].value;
> +		}
>  	}
>  
>  	caps = core->iris_platform_data->inst_fw_caps_enc;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index b444e816355624bca8248cce9da7adcd7caf6c5b..fb3fa1665c523fbe01df590f14d8012da3a8dd09 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -160,10 +160,8 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>  	},
>  	{
>  		.cap_id = PIPE,
> -		.min = PIPE_1,
> -		.max = PIPE_4,
> +		/* .max, .min and .value are set via platform data */
>  		.step_or_mask = 1,
> -		.value = PIPE_4,
>  		.hfi_id = HFI_PROP_PIPE,
>  		.set = iris_set_pipe,
>  	},
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> index 87517361a1cf4b6fe53b8a1483188670df52c7e7..7ae50ab22f8c577675a10b767e1d5f3cfe16d439 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> @@ -146,10 +146,8 @@ static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
>  	},
>  	{
>  		.cap_id = PIPE,
> -		.min = PIPE_1,
> -		.max = PIPE_2,
> +		/* .max, .min and .value are set via platform data */
>  		.step_or_mask = 1,
> -		.value = PIPE_2,
>  		.hfi_id = HFI_PROP_PIPE,
>  		.set = iris_set_pipe,
>  	},
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> index 66a5bdd24d8a0e98b0554a019438bf4caa1dc43c..805179fba0c41bd7c9e3e5de365912de2b56c182 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> @@ -20,10 +20,8 @@
>  static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
>  	{
>  		.cap_id = PIPE,
> -		.min = PIPE_1,
> -		.max = PIPE_4,
> +		/* .max, .min and .value are set via platform data */
>  		.step_or_mask = 1,
> -		.value = PIPE_4,
>  		.hfi_id = HFI_PROPERTY_PARAM_WORK_ROUTE,
>  		.set = iris_set_pipe,
>  	},
> 

