Return-Path: <linux-arm-msm+bounces-78602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0340FC01777
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 15:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEFE13AB20D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 13:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABDA632C954;
	Thu, 23 Oct 2025 13:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHcj03g9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17FA32B9B6
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761226285; cv=none; b=nQ6LaFBRfz1SApp0QYCAkBqx8RXRl4s6A1aRpNzVt4/Dy112KcP5DyALYugFt3g/alpo9DWuAOmjqeXjhZ4vS8J4mT5Uv7zMBhJTUWT5G8v1eiGIVn239J7DedUn9s8tUVeQBeAdrRH4y6qOrhM3emizqhgn5LrKLocq1pllajk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761226285; c=relaxed/simple;
	bh=0S3lhZyjMWRyKPKxFMWq5KIgfXeNo+vZg2NK/C1DEWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kjJuc6T9k33rPTGL3AxCYxz5EAxatSX3B19kTp6+mYuvJZWTjhdbxtkSlSzXXdWm8NqdpZOup5JqkYx/EKdjrg1WD7MjwbntAeK+17BRm1uJZCZulFW+eYXFNo8AU+WbYa0xT25Xkr4gVEZbngFB9Ruh2MNY2Fid9oIdU4sJJsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHcj03g9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N8OEJZ019075
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 13:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kAhTRx7nGtBqD8iQZGgInReXuf3rfQJhM2SvW7bi6aY=; b=cHcj03g9LBSoyPRq
	OY1GR6X66EOpud9b66s+yFgl0CJvLAhnZ8YsSuCPRQqBur1wUehxWrkU4lFcAxDU
	JD/T6bDBhSGwpuRtS3O0vlhO+Y/l6MN5CzYU9uhtyQowGFEVOP2dd7QaizeGnDmB
	0tjovY0cu37ygCZ7kiJTHaG5xxYgWI5PVK7YN2SiHy4LAGGpr4F5C0gRKzYsVKvH
	WVMZ2u68xmIytR3/6HqpckLjtV4l1RXEXnnMYx7nWuzsZAF6fumqmWGQuydYGTBi
	VWVnmYv+kQ7jXZzF1B16Pcoae9xdPz9rTmjjClNbEjB1dTV3Z+PXbQ6fttas7Hej
	0e0usw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qjh52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 13:31:22 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6ceeea4addso695335a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 06:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761226282; x=1761831082;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kAhTRx7nGtBqD8iQZGgInReXuf3rfQJhM2SvW7bi6aY=;
        b=CZKe+DQXOAPzmxwCp462QmBxOB7aIopOdGKc7dANNpjYcwsEnSVnsnZ1cKNHmMMcb2
         vUvAp8TyWZEVmTI50Oth7UMP7HFj7SGAFW4AfuckvrkT3UjANeMGvoD7mNsG6EOBkg0c
         +qR3JUjypLqf8e++z5gPmrDNQnRGR9CLX8nf77TZ8ZSg3Z7vFpNhjUoUX/5BWDVpBLgC
         R+X/oqxcHzumw95CiNGmjpK4aDoWN5CcB6vANajoxTzIwu6De2roiiX40Zbog102DZNl
         S0Ebirh4mUUtUSvUMEW761+5PHMdeg5oI5Q8AOaM+p1lzVWdQjkLkNMH+bzEfUMNZrj4
         kFqw==
X-Forwarded-Encrypted: i=1; AJvYcCUR1++475XhIcwaKBJA16Gw1Ra1r/8NVb/ZLpe8tkqBg/Y6MWmDUea9HVKRbHbW/qVMHtAW6sYan5K6rs53@vger.kernel.org
X-Gm-Message-State: AOJu0YwsYPaPIu0d2eyViGCKdZ876MygwuI0T2dh1cvTTSESvquljh8q
	sEL4TOW5Wwvouuoka8FJnb949GQ7V7fLgAkL6bIANn93llL4UdgJAlAGPTu5rTXPoKQqSMAdSsb
	tzEV8fdIU54Mvt1kaKA9o+TBvNl8TTrT+3CEN+stLydV0i3EaUSf8SMRYjkDhihua+uAohUuxmO
	qA
X-Gm-Gg: ASbGncttS/AMzmcvyVgOA7Yv6fu483GvX2jvGZuhR11AWMQ6fHcABKH6d+oguOGX/SA
	TLR4owo+klUzDQIVj1VO7DKvw5d7i9lN0C46quw6VXWknY006HmG2RngMzI7Py3oUqoQy6A3i+e
	kijtqQpHk/0TTO5ffMQcZiin9Kp1SZNeAUn6edgOTk7164NxtxgYKg2+2fURH2rX1WstARTibye
	mLI5AA+mW78xIWbMFEhFhsTmeeJz5OD4YgDKeuyFIizQxQN86GcT0U7l4NJblNcL5S5kksKZEd3
	a+QHiVDpigZieQBXFqvz8wWVonrujKiWDLrf0cqoFb7S+UIjcpqkt532hPNSBd+yVE/C/kyDu9y
	Ne72eFQvMk6oHkRz65jsRcb5V1Hr+ld8=
X-Received: by 2002:a17:903:3bce:b0:24b:1625:5fa5 with SMTP id d9443c01a7336-290c9c89d97mr294636235ad.11.1761226281372;
        Thu, 23 Oct 2025 06:31:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHe4wHypbXKQj+b9fHd9Y9Eo2Q2DGjFksp8Pgd4M85sCSuMlISqrivjB0S/8hvW/VThhDp9dQ==
X-Received: by 2002:a17:903:3bce:b0:24b:1625:5fa5 with SMTP id d9443c01a7336-290c9c89d97mr294635255ad.11.1761226280568;
        Thu, 23 Oct 2025 06:31:20 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e242707sm23784855ad.108.2025.10.23.06.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 06:31:20 -0700 (PDT)
Message-ID: <9a4a7297-4f9e-01f1-57ee-996d3cacad61@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 19:01:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 6/6] media: iris: enable support for SC7280 platform
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251019-iris-sc7280-v4-0-ee6dcee6e741@oss.qualcomm.com>
 <20251019-iris-sc7280-v4-6-ee6dcee6e741@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251019-iris-sc7280-v4-6-ee6dcee6e741@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfX8ytfAcgXeFM1
 Gee3QX9N8FmknPsoWglaKjPLJXXdw220XjRwJoev0LAoUcXgQOnN0ork2gEq4Bw3kmKYb/2nJPI
 fi8/vWUT5lMq35RCdcF4vHbsDb44jHMwc0gGyiV4o4MOiByd3sl9TUvYHyr3s0CAgLffcXrthwV
 JNGGZ7Ch1KyFougGD2WovNMGKQnRFMnRGPAhylboGPNE5lHViIXWfdge6g7IgREPOd2wagkyAYg
 qmvPCPuMgiLel5IQKkjAnAlHCEZKAufbr+XCfkrgX9/vbkT6fKGMr9hrrDld6vl8sjoCXia3fVw
 GQgfq+53vbVPkAf9OhBVXB/FYUIm4RHDDR5nk2wRms16/UxOIiwm4eWTaKGATxSQEc7lsnSL4w3
 soci6HfuTcZmEaY59GbVLEQgpeL8Ww==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68fa2e2a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7b6Sf04faytPFaYNhJoA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 79PFTKKLL0uu4koikYZHC9TziHjQD_Jd
X-Proofpoint-ORIG-GUID: 79PFTKKLL0uu4koikYZHC9TziHjQD_Jd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168



On 10/19/2025 1:26 PM, Dmitry Baryshkov wrote:
> As a part of migrating code from the old Venus driver to the new Iris
> one, add support for the SC7280 platform. It is very similar to SM8250,
> but it (currently) uses no reset controls (there is an optional
> GCC-generated reset, it will be added later) and no AON registers
> region. Extend the VPU ops to support optional clocks and skip the AON
> shutdown for this platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |  4 ++
>  .../media/platform/qcom/iris/iris_platform_gen1.c  | 52 ++++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_sc7280.h      | 27 +++++++++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
>  drivers/media/platform/qcom/iris/iris_resources.c  |  2 +-
>  drivers/media/platform/qcom/iris/iris_vpu2.c       |  6 +++
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 34 ++++++++++----
>  7 files changed, 119 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 5ffc1874e8c6362b1c650e912c230e9c4e3bd160..8d8cdb56a3c7722c06287d4d10feed14ba2b254c 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -42,6 +42,7 @@ enum pipe_type {
>  };
>  
>  extern const struct iris_platform_data qcs8300_data;
> +extern const struct iris_platform_data sc7280_data;
>  extern const struct iris_platform_data sm8250_data;
>  extern const struct iris_platform_data sm8550_data;
>  extern const struct iris_platform_data sm8650_data;
> @@ -50,7 +51,9 @@ extern const struct iris_platform_data sm8750_data;
>  enum platform_clk_type {
>  	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
>  	IRIS_CTRL_CLK,
> +	IRIS_AHB_CLK,
>  	IRIS_HW_CLK,
> +	IRIS_HW_AHB_CLK,
>  	IRIS_AXI1_CLK,
>  	IRIS_CTRL_FREERUN_CLK,
>  	IRIS_HW_FREERUN_CLK,
> @@ -224,6 +227,7 @@ struct iris_platform_data {
>  	u32 hw_response_timeout;
>  	struct ubwc_config_data *ubwc_config;
>  	u32 num_vpp_pipe;
> +	bool no_aon;
>  	u32 max_session_count;
>  	/* max number of macroblocks per frame supported */
>  	u32 max_core_mbpf;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> index 9cb9ddc86ad73daf75383b3253e851394235093d..beea8c79de34d163f113d3449fee18d33bfe5fd9 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> @@ -12,6 +12,8 @@
>  #include "iris_vpu_buffer.h"
>  #include "iris_vpu_common.h"
>  
> +#include "iris_platform_sc7280.h"
> +
>  #define BITRATE_MIN		32000
>  #define BITRATE_MAX		160000000
>  #define BITRATE_PEAK_DEFAULT	(BITRATE_DEFAULT * 2)
> @@ -363,3 +365,53 @@ const struct iris_platform_data sm8250_data = {
>  	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
>  	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
>  };
> +
> +const struct iris_platform_data sc7280_data = {
> +	.get_instance = iris_hfi_gen1_get_instance,
> +	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
> +	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
> +	.get_vpu_buffer_size = iris_vpu_buf_size,
> +	.vpu_ops = &iris_vpu2_ops,
> +	.set_preset_registers = iris_set_sm8250_preset_registers,
> +	.icc_tbl = sm8250_icc_table,
> +	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
> +	.bw_tbl_dec = sc7280_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(sc7280_bw_table_dec),
> +	.pmdomain_tbl = sm8250_pmdomain_table,
> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
> +	.opp_pd_tbl = sc7280_opp_pd_table,
> +	.opp_pd_tbl_size = ARRAY_SIZE(sc7280_opp_pd_table),
> +	.clk_tbl = sc7280_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(sc7280_clk_table),
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/vpu/vpu20_p1.mbn",
> +	.pas_id = IRIS_PAS_ID,
> +	.inst_caps = &platform_inst_cap_sm8250,
> +	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
> +	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
> +	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
> +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
> +	.tz_cp_config_data = &tz_cp_config_sm8250,
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.num_vpp_pipe = 1,
> +	.no_aon = true,
> +	.max_session_count = 16,
> +	.max_core_mbpf = NUM_MBS_8K,

Max core mbpf would be
/* ((4096x2176)/256) x 2 + (1920x1088)/256 */

> +	.max_core_mbps = ((7680 * 4320) / 256) * 60,

Max supported spec for SC7280 is 4096x2176@60fps



> +	.dec_input_config_params_default =
> +		sm8250_vdec_input_config_param_default,
> +	.dec_input_config_params_default_size =
> +		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
> +	.enc_input_config_params = sm8250_venc_input_config_param,
> +	.enc_input_config_params_size =
> +		ARRAY_SIZE(sm8250_venc_input_config_param),
> +
> +	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
> +	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
> +
> +	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sc7280.h b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..9e8ade674ff1a8c4e42b1a05a3de3097110e5f0d
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +
> +#ifndef __IRIS_PLATFORM_SC7280_H__
> +#define __IRIS_PLATFORM_SC7280_H__
> +
> +static const struct bw_info sc7280_bw_table_dec[] = {
> +	{ ((3840 * 2160) / 256) * 60, 1896000, },
> +	{ ((3840 * 2160) / 256) * 30,  968000, },
> +	{ ((1920 * 1080) / 256) * 60,  618000, },
> +	{ ((1920 * 1080) / 256) * 30,  318000, },
> +};
> +
> +static const char * const sc7280_opp_pd_table[] = { "cx" };
> +
> +static const struct platform_clk_data sc7280_clk_table[] = {
> +	{IRIS_CTRL_CLK,    "core"         },
> +	{IRIS_AXI_CLK,     "iface"        },
> +	{IRIS_AHB_CLK,     "bus"          },
> +	{IRIS_HW_CLK,      "vcodec_core"  },
> +	{IRIS_HW_AHB_CLK,  "vcodec_bus"   },
> +};
> +
> +#endif
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 00e99be16e087c4098f930151fd76cd381d721ce..9bc9b34c2576581635fa8d87eed1965657eb3eb3 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -357,6 +357,10 @@ static const struct of_device_id iris_dt_match[] = {
>  		.data = &qcs8300_data,
>  	},
>  #if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
> +	{
> +		.compatible = "qcom,sc7280-venus",
> +		.data = &sc7280_data,
> +	},
>  	{
>  		.compatible = "qcom,sm8250-venus",
>  		.data = &sm8250_data,
> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
> index cf32f268b703c1c042a9bcf146e444fff4f4990d..164490c49c95ee048670981fdab014d20436ef85 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> @@ -112,7 +112,7 @@ int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk
>  
>  	clock = iris_get_clk_by_type(core, clk_type);
>  	if (!clock)
> -		return -EINVAL;
> +		return -ENOENT;
>  
>  	return clk_prepare_enable(clock);
>  }
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
> index de7d142316d2dc9ab0c4ad9cc8161c87ac949b4c..9c103a2e4e4eafee101a8a9b168fdc8ca76e277d 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
> @@ -3,9 +3,15 @@
>   * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <linux/bits.h>
> +#include <linux/iopoll.h>
> +#include <linux/reset.h>
> +
>  #include "iris_instance.h"
>  #include "iris_vpu_common.h"
>  
> +#include "iris_vpu_register_defines.h"
> +
>  static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
>  {
>  	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index bb98950e018fadf69ac4f41b3037f7fd6ac33c5b..1460e1683025e49cfa55d1afbe281e5db5a0d898 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -222,12 +222,14 @@ int iris_vpu_power_off_controller(struct iris_core *core)
>  
>  	writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON, core->reg_base + CPU_CS_X2RPMH);
>  
> -	writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +	if (!core->iris_platform_data->no_aon) {
> +		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>  
> -	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
> -				 val, val & BIT(0), 200, 2000);
> -	if (ret)
> -		goto disable_power;
> +		ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
> +					 val, val & BIT(0), 200, 2000);
> +		if (ret)
> +			goto disable_power;
> +	}
>  
>  	writel(REQ_POWER_DOWN_PREP, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
>  
> @@ -250,6 +252,7 @@ int iris_vpu_power_off_controller(struct iris_core *core)
>  	writel(0x0, core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
>  
>  disable_power:
> +	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
>  	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
>  	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
>  	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> @@ -261,6 +264,7 @@ void iris_vpu_power_off_hw(struct iris_core *core)
>  {
>  	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
>  	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
>  	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
>  }
>  
> @@ -294,11 +298,17 @@ int iris_vpu_power_on_controller(struct iris_core *core)
>  
>  	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
>  	if (ret)
> -		goto err_disable_clock;
> +		goto err_disable_axi_clock;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_AHB_CLK);
> +	if (ret && ret != -ENOENT)
> +		goto err_disable_ctrl_clock;
>  
>  	return 0;
>  
> -err_disable_clock:
> +err_disable_ctrl_clock:
> +	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
> +err_disable_axi_clock:
>  	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
>  err_disable_power:
>  	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> @@ -318,13 +328,19 @@ int iris_vpu_power_on_hw(struct iris_core *core)
>  	if (ret)
>  		goto err_disable_power;
>  
> +	ret = iris_prepare_enable_clock(core, IRIS_HW_AHB_CLK);
> +	if (ret && ret != -ENOENT)
> +		goto err_disable_hw_clock;
> +
>  	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
>  	if (ret)
> -		goto err_disable_clock;
> +		goto err_disable_hw_axi_clock;
>  
>  	return 0;
>  
> -err_disable_clock:
> +err_disable_hw_axi_clock:

This label needs an update s/err_disable_hw_axi_clock/err_disable_hw_ahb_clock

Thanks,
Dikshita

> +	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
> +err_disable_hw_clock:
>  	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
>  err_disable_power:
>  	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> 

