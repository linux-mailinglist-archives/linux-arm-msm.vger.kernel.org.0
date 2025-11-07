Return-Path: <linux-arm-msm+bounces-80718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 067E4C3F138
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 10:06:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B5BE3B0542
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 09:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F953168EF;
	Fri,  7 Nov 2025 09:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cJaDXBbt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CBdb7nwY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8872BE652
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 09:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762506359; cv=none; b=NfSCG+C4p7N7dxyq1NiZgyJ+Eaevfa7VwX9CXbUZnALBbofwTHngkEDT5Cryq1AUbd3QFRlGozzzAlHnmEP6YoF2rJscjwF2TdnzOshqO4ma2bTUmC91YWiynjXrAm8ilE8d/W5QPhKF00a+v+g/pnL7TuoPFlioFRdOqiXvddQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762506359; c=relaxed/simple;
	bh=lCNEOWLT+7/XeDg1YbyCpFzIANEFWFgCWrikEPbPsGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c3kjlAZeJnhSxnb7WKjwwW1e/Vw+8FdFbbAFvn6oqW2O4B6b50N7p6BXjLJ8ZrOy3f8ZswnuXOi8R0UfYto9vaZkVKfmeP6Fz0A6aKqo0hdiBTaRMiDvLZpO5XeOd/mE9METiaZ5oQvnWJ/n/KK/3XgoMrqxw6vgGYafiJ9UrJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cJaDXBbt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CBdb7nwY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A73Mt6K1864937
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 09:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cn/9gp5o7cY90sjFMFqcqEPElzL9CFdH/lnBGbpOTmk=; b=cJaDXBbthCESDqZh
	nWtyVe0UgJ2Qh8b58GU7o33f/sE9RcO0l9Ixle7vKS9ixhpf5owMOeadT02Vg8wv
	EoRQx19nV8OVQAwv9DPPynMQa1LdUEZlf3rbFi9VieFQF3JOMVC34NGhl6I0orAv
	e/L8LW9G3zHaP/DC7Bfze+olz4yV9oCjAFKHl84yb6BbfGwei9h91unfZOeTe0vR
	bA2j9S0kWpNv2JY/D/QvaufkJgdlAJItf3ryaK8P4Mkaxxh3OV4ZD1/q8Dqe3SUg
	NsXGrgPR1VH2vX9lZkgfWptwESVlFWOxxgtellkROTY3neJ8T0jYfkVDllrPgl4K
	twFddw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a98ta0vst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 09:05:57 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b95d06db747so506964a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 01:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762506356; x=1763111156; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cn/9gp5o7cY90sjFMFqcqEPElzL9CFdH/lnBGbpOTmk=;
        b=CBdb7nwYh+yBYcvn9igfN68+s+0xzZ+Tstr8M7v4K0Nd8E/9VdT4hecSuvcqFpnsQg
         oRRwIpcq3Q7URUO5yKv6HS4+WVpaGBx0p2BFNG3cK1Z02Vz3YreiVysnjJoOyL5hGoXH
         +9ESAP26IjkqcFa6ZGD5Y2AnU9lkm/4KJLqmOp6bH0bLzrTkYVMvS2e1Xilp5VrZVpZ5
         1OcB91BtwCKuW/Fq9KLBhOBuLHwF6/KUNwRV48Ahyeiqp15867ZQKkLyvbU8XYHLejSE
         tO6E2cVt1WJwUs536IMVuQfJwLMmbK788vwAW1lWuaKyL/oaIIbcSJrBhioa9AJ72KBt
         XglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762506356; x=1763111156;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cn/9gp5o7cY90sjFMFqcqEPElzL9CFdH/lnBGbpOTmk=;
        b=P7NFY+549oQXPFzzTa0w5Mk4PvQLr00PHyd3jxLkxN7zOGwmqjDoBaexXCZdolh8FK
         WMZbcyUiIrvmclP9QASZPJ2cN5viwsZruJxAkcA411WaVwNwUjLxUbpnlHkTmCPTp6aE
         pppMaFyp9qHFVzcqYvsYyB3FqnNrRRW2VEJdvO/IdWeHOsdnOE6vCJVr3OE9tU/vYuH/
         hPS4ulpqFlL1f/deT5kjaxscUMU9izioCEMoMLaQrj+S3nEqcJm8/8dwXtuoazBBcgJT
         rgv7EmrZK6Zdtu45JLFc9zCvFL55UOZvOVG+C8wDB6kfHTRarle+n7F1Dah8eot0sZB7
         ZBKg==
X-Forwarded-Encrypted: i=1; AJvYcCVM+h4o8TnIT0b8MvaSuAJoi0+S8PVR6XJT1UXe+qO+dhylL/iPjjFy4Y2ofhziLlkHsnws3w4LNPZ9W21b@vger.kernel.org
X-Gm-Message-State: AOJu0YyZkj2afc2IMgHvn0B6iGxB5VvmX6PJ91D7hrbhQ21r3WYdVLwk
	A8rAelejzopUKQlaNOt5YwlFmRDlfCeDmkrSZw7f5yLNyuD7Q2PlAottD85W3QvG76CaEuDubJK
	RvqkbLMMQ3v1m9H5KJnErePjuzNJBS2NWPTnvYkBKQBzNMPXb3kWt5pj67lCTelZdlQYG
X-Gm-Gg: ASbGncunxpJEDNoebK5qr+PeCe0Vw1w5gtfSgG7FH2kmGwhppQmag2uHOpwNYgpLG54
	IaFy+iavIMU+8+YbK+PQPata19vKjMww1td6K65wnm0aK7z/HyFrqA0GIhDUxjH8H1Lf41NjzdL
	OtGUr1fW7R5lhX9YLt8+rIs2iv2JfCrfkbM5YEOWyhEerRoqOHCqfjpyNcN4i/zKvh/KtFBit18
	pK4omaJbzvmUTe37yZ3OA2dRxd3wBrQEodEzbWoGummrEbUHoFad2Pvn2CCYb4QMNvYVQpPgpcU
	QjSVD1G3eI5/7nMO3X75DL6/hVyNnQTSXwkWzPSV2HfLPX4758GwpkZauqdmWgBQmFrFyu0bddG
	130stZuc3jPKojAc9PBvZeYaBAjDwTYc=
X-Received: by 2002:a05:6a21:328e:b0:334:a854:64a7 with SMTP id adf61e73a8af0-352b5f0904cmr1608556637.3.1762506356440;
        Fri, 07 Nov 2025 01:05:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcUtnP5yaDtpiYGU+yKvPAjbntPIIVLxWawJk98uJOABN63v9LKaz2/ekuR0+CKD0lsWt6yg==
X-Received: by 2002:a05:6a21:328e:b0:334:a854:64a7 with SMTP id adf61e73a8af0-352b5f0904cmr1608521637.3.1762506355877;
        Fri, 07 Nov 2025 01:05:55 -0800 (PST)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cd05d17asm2241017b3a.72.2025.11.07.01.05.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 01:05:55 -0800 (PST)
Message-ID: <75d84de1-4f7c-1397-d445-42a367985991@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 14:35:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 6/6] media: qcom: iris: Add intra refresh support for
 encoder
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
References: <20251106-iris_encoder_enhancements-v4-0-5d6cff963f1b@oss.qualcomm.com>
 <20251106-iris_encoder_enhancements-v4-6-5d6cff963f1b@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251106-iris_encoder_enhancements-v4-6-5d6cff963f1b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA3MiBTYWx0ZWRfXwBNx+QcemXvM
 Cu0UGKWAS2tUEPOnJLkhw6/q6HDqFmt6WXHIK0fwvG9xGpOeHe5zo7bslg4jDfkFWpV9FM1LXjI
 is3nY0uaGzcpJxieQDqGA/UN0pMW/JXR/GRbaURd9JKShnBVU+Zsjsd31eBaXZQxx3UN9d8SRiG
 KUv4drQBhDNEfVpA3/pBbT3idTH3D91HLkSjXMZWcSTmTvrEZsHoDb1Mo5hpLiaxaReIuy8/TF9
 NsuvwSw59kt5DmO46nWJVKl4Km9L9pKnSBVul6lhiZwlnfXyz3PapT+7PxFBe4QiwEjJUMnTTvq
 Pwph2VFwb6onpsj4z7B7xrWUbsV7g5nbuxwXLFXO7RvnmK0SeKPSsPHJxP0o2GVkHi2yyRpJ+YA
 Syx8XxYsuuVN7cyBWLj9dkhT3YqD7w==
X-Proofpoint-ORIG-GUID: U-bg-mDiJqULHvyDznJpGqddGad6F6_R
X-Proofpoint-GUID: U-bg-mDiJqULHvyDznJpGqddGad6F6_R
X-Authority-Analysis: v=2.4 cv=G9IR0tk5 c=1 sm=1 tr=0 ts=690db675 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=jOerO3nEycnuB6UvFdUA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070072



On 11/6/2025 9:00 AM, Wangao Wang wrote:
> Add support for V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD and
> V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE controls.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 33 ++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 ++
>  .../platform/qcom/iris/iris_platform_common.h      |  2 ++
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 19 +++++++++++++
>  5 files changed, 57 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 8f74c12f2f41f23d75424819c707aff61ea61b33..14891569247318aaa7b2009b737f077d1cb45095 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -104,6 +104,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>  		return HFLIP;
>  	case V4L2_CID_VFLIP:
>  		return VFLIP;
> +	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
> +		return IR_TYPE;
> +	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
> +		return IR_PERIOD;
>  	default:
>  		return INST_FW_CAP_MAX;
>  	}
> @@ -197,6 +201,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>  		return V4L2_CID_HFLIP;
>  	case VFLIP:
>  		return V4L2_CID_VFLIP;
> +	case IR_TYPE:
> +		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE;
> +	case IR_PERIOD:
> +		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD;
>  	default:
>  		return 0;
>  	}
> @@ -944,6 +952,31 @@ int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  					     &hfi_val, sizeof(u32));
>  }
>  
> +int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	struct vb2_queue *q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
> +	u32 ir_period = inst->fw_caps[cap_id].value;
> +	u32 ir_type = 0;
> +
> +	if (inst->fw_caps[IR_TYPE].value ==
> +			V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM) {
> +		if (vb2_is_streaming(q))
> +			return 0;
> +		ir_type = HFI_PROP_IR_RANDOM_PERIOD;
> +	} else if (inst->fw_caps[IR_TYPE].value ==
> +			V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC) {
> +		ir_type = HFI_PROP_IR_CYCLIC_PERIOD;
> +	} else
> +		return -EINVAL;

missing braces.

with that fixed,

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita
> +
> +	return hfi_ops->session_set_property(inst, ir_type,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32,
> +					     &ir_period, sizeof(u32));
> +}
> +
>  int iris_set_properties(struct iris_inst *inst, u32 plane)
>  {
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index 355a592049f3fcc715a1b9df44b4d1398b052653..9518803577bc39f5c1339a49878dd0c3e8f510ad 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -34,6 +34,7 @@ int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>  int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_properties(struct iris_inst *inst, u32 plane);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index 0f92468dca91cbb2ca9b451ebce255180066b3a4..9e8fdddf2aef439e7f133c9bb2fafa6d95062b02 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -70,6 +70,7 @@ enum hfi_rate_control {
>  #define HFI_PROP_QP_PACKED			0x0300012e
>  #define HFI_PROP_MIN_QP_PACKED			0x0300012f
>  #define HFI_PROP_MAX_QP_PACKED			0x03000130
> +#define HFI_PROP_IR_RANDOM_PERIOD		0x03000131
>  #define HFI_PROP_TOTAL_BITRATE			0x0300013b
>  #define HFI_PROP_MAX_GOP_FRAMES			0x03000146
>  #define HFI_PROP_MAX_B_FRAMES			0x03000147
> @@ -108,6 +109,7 @@ enum hfi_flip {
>  #define HFI_PROP_BUFFER_MARK			0x0300016c
>  #define HFI_PROP_RAW_RESOLUTION		0x03000178
>  #define HFI_PROP_TOTAL_PEAK_BITRATE		0x0300017C
> +#define HFI_PROP_IR_CYCLIC_PERIOD		0x0300017E
>  #define HFI_PROP_COMV_BUFFER_COUNT		0x03000193
>  #define HFI_PROP_END				0x03FFFFFF
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 284d6bde6d6bcdf70016646d1c92e6ae7f067efc..30b98e769ad34c2b63dd63e7714bfeaa5b4f162c 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -143,6 +143,8 @@ enum platform_inst_fw_cap_type {
>  	ROTATION,
>  	HFLIP,
>  	VFLIP,
> +	IR_TYPE,
> +	IR_PERIOD,
>  	INST_FW_CAP_MAX,
>  };
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index e74bdd00a4bb2f457ec9352e0acaebc820dae235..ce54aac766e2bf76fa2de64c884724ca63f05dcb 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -620,6 +620,25 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>  			CAP_FLAG_DYNAMIC_ALLOWED,
>  		.set = iris_set_flip,
>  	},
> +	{
> +		.cap_id = IR_TYPE,
> +		.min = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
> +		.max = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC,
> +		.step_or_mask = BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM) |
> +			BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC),
> +		.value = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +	},
> +	{
> +		.cap_id = IR_PERIOD,
> +		.min = 0,
> +		.max = INT_MAX,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.flags = CAP_FLAG_OUTPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_ir_period,
> +	},
>  };
>  
>  static struct platform_inst_caps platform_inst_cap_sm8550 = {
> 

