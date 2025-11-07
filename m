Return-Path: <linux-arm-msm+bounces-80714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C403C3F033
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 09:46:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F38514E48C6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 08:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB3A423817D;
	Fri,  7 Nov 2025 08:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pJI9s/GX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ad1uyS8A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C43527462
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 08:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762505176; cv=none; b=Ajp/gI8JaqEyyFBdrAcT7nGBQXEkccTWqr3yh2vQ2hbLMbsK9t/VtM/fKEhLZklIF3E/K2flCAMBtm0jkX423TR/24DeN3lDR1dIHPQarsnLZYNpSwE8+wzVdMtqtTQVAA1epu2q4hs4ZCVm5+Io4Iqzy9KzFtNRwcfxFOsvpMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762505176; c=relaxed/simple;
	bh=qTwy9fXU73+YLUnSpqa3s+LUPiZe3cDYU9NTKfskAMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b1j83AKYQGJw/9HTfWDntfl9QDgIxiubAfeBS4CvY2L7LGU6duKUANUNZMNL8ndQX8MHDTpruHoQ6ZAYgYTWquTrbmUue+mvh2TX1Bs3ESANPF+4SoojkXstMjmWt32TSHxc/NvXMinzn2I14dQQEBcq+9TXqP8mx5du5lLv35E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pJI9s/GX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ad1uyS8A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A77WLQe4131317
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 08:46:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2J7yLmUuCyaBbnvYbvDFzyQvcT7qSwPg6DZ/rKC+PAY=; b=pJI9s/GX7BJzPE4g
	6LWrk7kW9uF2KJt7N+NwYUQVujA4yP5N8/TVd5GvQhvsQW2VXJISlIoxannBjWJ0
	OHS8nGmQwmORR1YKJ8WG5yCd70lBlPZ5XnnUK1D6gu0HhzPJKDK8R/nFtD24aGXR
	eT/lH7AUZ2vIiRaglaBQXb5PXeFjjuPhR2iyq4I+k6/aDYCQLMznk2tEr9QYFlb/
	y+fCaCFC50EowjQgqKPapF/AHsdYjPW5Rq4USWIROQQhOc+1tz7c31212zBtLHhG
	PVXNQ4KC1zTIClTAYaFegq6gazSP0MpeR+MFS/btGBhk4etwnK0Ni9ZZEkpiRkIo
	glr4qQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8u3x3c2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 08:46:14 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b0a870d3ebso647206b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 00:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762505174; x=1763109974; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2J7yLmUuCyaBbnvYbvDFzyQvcT7qSwPg6DZ/rKC+PAY=;
        b=Ad1uyS8Aq41bPSsPAeSVdbIqL1VYxKzNSktGwEEshEbgBWjEiOcrOVQXiDEsqnQAjc
         YloShxQkFwMBuuE76F2un45bAk8lSSVA5IYiTyQfUCr8EwRnzXPxSzfG7Dj/RLoSnLcQ
         D/+yNNFalqht0WzqqY+ymnoDrt5p3SXlF2VGAF+ESyfpeWyaivY5eaYiBgo7Ne/kVSyb
         X1mzShY4Es2Rl9J/3S04SteNyTqvjdp8S4dEi7a/FnO43ealANY3F73p9bPxve8brWZU
         VmeSPRZZfr2jd63oFMYx5pQzkCax3n2yb5OiWRlGiWnASMiva/Qof5jhRz+7tOjSj/Q3
         3dBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762505174; x=1763109974;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2J7yLmUuCyaBbnvYbvDFzyQvcT7qSwPg6DZ/rKC+PAY=;
        b=gtq3TY7mIe7Q7j3vJ95nMxPdsW83+PHNSljAsjiCVE0R3sYwHRGEqvql++qqjOz7WQ
         9623LV9NuLq/Xn8l4EXhAK7t0wymdwzKgkeA4o0RTrCyfCh31a99Sk8aOxmxj63vnezm
         7wdsnrPNfcyTu1H83kLkHQI6eEoJJHNN8SM7QHmFFFP4A47mGlXERm2XqGWi2eiyMqe1
         vEZyv+auXzbCnzy0RxXvV40EVkupAum+XcOLIdfhiH7nZ//2innCbVjMRsGKcBvgPvBS
         jcOPsehxhF11ZZ3O00p+G1CP67YY/kyooXmknP83OZtLTtq6EOjPbr9uIufxx0VGzAf/
         fuVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTXSAE/s/0LgvK06x//VOgYSAzTK6nu3UfUx5bTGYW/Etnbxgy24eZdcCcMTmF0xvsiuE5B0pxcF+LFeUF@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo3nDUTx+GIdg+zADwEm45ku2VRA6Nsmj6Ct65teTADwy55GwB
	mqNjU1Eq6/u3nVurQGSRedEYw6oWsVe8rUMqxyh78hlx8yWHcwMWi/lApYqr/WuoQ4bIyieFjze
	Y9uAKJGwdDO+2q3zTDJkLlE9D4I7xEBnHuR5lKcb9tsqor8ZTBIVeXULOtB7NBOpfvimr
X-Gm-Gg: ASbGncsxkpWN8r/NeGwDJ4HWUr9A18+vPs/+bSGaBj44zuZVGHcQPo0rwpRksazp/JR
	AG5EZXWGrLjqRn4UP+8zHTsoLjWgHlqvThbouw+GbO2RYNSYidXWk4lIKAs+h9pag7aCAtWQDMZ
	UkwFrE+hE70NnGbvF1ibjdxybDdGuIzhT+BXW3olsFn77uT39+yJsYbe0D8BqfbSFRKYuZjHdGh
	F8OfFgRnQWHAElk2qWuMqNbOsqN7zaJ6PIEIE6a8Q/fxZAT8Ejy9/RZOPQIHGlJJcTpuxREyb4S
	UoF4BiZhmLwk7ncL80ysLydH4bRy6u7rvFwESrdwJVEYEzoTuk/gH4AgkgOO5ud4MTO2TExlH08
	MG4psCYfRRhWKjmqexToN5IFJSAxgyRQ=
X-Received: by 2002:a05:6a20:7d86:b0:344:8ef7:7a03 with SMTP id adf61e73a8af0-3522ae7608bmr3570399637.56.1762505173559;
        Fri, 07 Nov 2025 00:46:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4daP1kib/Z3Zsv1e3eRc7cpLPd2g1GESz+2gnnbNugqt9DICJpxnLqdCYhgfcWLH6IYcV4Q==
X-Received: by 2002:a05:6a20:7d86:b0:344:8ef7:7a03 with SMTP id adf61e73a8af0-3522ae7608bmr3570370637.56.1762505173048;
        Fri, 07 Nov 2025 00:46:13 -0800 (PST)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f8c880c5sm4718213a12.6.2025.11.07.00.46.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 00:46:12 -0800 (PST)
Message-ID: <0d73b172-cb94-dacd-bd9e-a0061b65ce38@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 14:16:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 5/6] media: qcom: iris: Add flip support for encoder
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
 <20251106-iris_encoder_enhancements-v4-5-5d6cff963f1b@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251106-iris_encoder_enhancements-v4-5-5d6cff963f1b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA2OSBTYWx0ZWRfX2MD0l5myW+Xn
 H2nXXCW7UgUYxPF8o0hKUv/6y/KTYwHsMX8U2us/bv+P1aj8TwWC8tSK65yHweUmoXngdSr83mz
 y5ipepGs0l/mVT04XtRLa9UiE/bVsPYGPwNkWTEnB1zRq1c6QcG8tlAUE6c8J0KQzX3tlLqloTI
 d2pAn2tIn1QmnYDbvfEuHvVuMBczCvZD26znCHIPcohGGxHZoi4u2dHAbD9eX48kzyIgbJK2E/e
 /fFHgTZsEyy0snXpvI8yZrz8wFe3dJ6xQrUVDJQYXAzg6SZd+F6MayKXoL/6z0R6Uw90Jjc13UG
 LcnM2NFLAkcIgRuqHNMwxUrYTBDIZwgHQmIPjGiAOinHMefHgZtTzS73Nbsu7cwg/aIiTJrJACX
 2/BNgQYCF2cfxC5TRISBpk/hsQG/2A==
X-Proofpoint-ORIG-GUID: qnEeGpIhbYMmDfcuMdySHUfGt2C9H8mN
X-Proofpoint-GUID: qnEeGpIhbYMmDfcuMdySHUfGt2C9H8mN
X-Authority-Analysis: v=2.4 cv=BrKQAIX5 c=1 sm=1 tr=0 ts=690db1d6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=47cB15JwpupiNioDY5AA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070069



On 11/6/2025 9:00 AM, Wangao Wang wrote:
> Add support for V4L2_CID_HFLIP and V4L2_CID_VFLIP controls in encoder.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 27 ++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  8 +++++++
>  .../platform/qcom/iris/iris_platform_common.h      |  2 ++
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 22 ++++++++++++++++++
>  5 files changed, 60 insertions(+)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 00949c207ddb0203e51df359214bf23c3d8265d0..8f74c12f2f41f23d75424819c707aff61ea61b33 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -100,6 +100,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>  		return B_FRAME_QP_HEVC;
>  	case V4L2_CID_ROTATE:
>  		return ROTATION;
> +	case V4L2_CID_HFLIP:
> +		return HFLIP;
> +	case V4L2_CID_VFLIP:
> +		return VFLIP;
>  	default:
>  		return INST_FW_CAP_MAX;
>  	}
> @@ -189,6 +193,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>  		return V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP;
>  	case ROTATION:
>  		return V4L2_CID_ROTATE;
> +	case HFLIP:
> +		return V4L2_CID_HFLIP;
> +	case VFLIP:
> +		return V4L2_CID_VFLIP;
>  	default:
>  		return 0;
>  	}
> @@ -917,6 +925,25 @@ int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>  					     &hfi_val, sizeof(u32));
>  }
>  
> +int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	u32 hfi_val = HFI_DISABLE_FLIP;
> +
> +	if (inst->fw_caps[HFLIP].value)
> +		hfi_val |= HFI_HORIZONTAL_FLIP;
> +
> +	if (inst->fw_caps[VFLIP].value)
> +		hfi_val |= HFI_VERTICAL_FLIP;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32_ENUM,
> +					     &hfi_val, sizeof(u32));
> +}
> +
>  int iris_set_properties(struct iris_inst *inst, u32 plane)
>  {
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index 3ea0a00c7587a516f19bb7307a0eb9a60c856ab0..355a592049f3fcc715a1b9df44b4d1398b052653 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -33,6 +33,7 @@ int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
>  int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_properties(struct iris_inst *inst, u32 plane);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index 4edcce7faf5e2f74bfecfdbf574391d5b1c9cca5..0f92468dca91cbb2ca9b451ebce255180066b3a4 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -92,6 +92,14 @@ enum hfi_rotation {
>  };
>  
>  #define HFI_PROP_ROTATION			0x0300014b
> +
> +enum hfi_flip {
> +	HFI_DISABLE_FLIP    = 0x00000000,
> +	HFI_HORIZONTAL_FLIP = 0x00000001,
> +	HFI_VERTICAL_FLIP   = 0x00000002,
> +};
> +
> +#define HFI_PROP_FLIP				0x0300014c
>  #define HFI_PROP_SIGNAL_COLOR_INFO		0x03000155
>  #define HFI_PROP_PICTURE_TYPE			0x03000162
>  #define HFI_PROP_DEC_DEFAULT_HEADER		0x03000168
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 9a4232b1c64eea6ce909e1e311769dd958b84c6e..284d6bde6d6bcdf70016646d1c92e6ae7f067efc 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -141,6 +141,8 @@ enum platform_inst_fw_cap_type {
>  	B_FRAME_QP_H264,
>  	B_FRAME_QP_HEVC,
>  	ROTATION,
> +	HFLIP,
> +	VFLIP,
>  	INST_FW_CAP_MAX,
>  };
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index c1f83e179d441c45df8d6487dc87e137e482fb63..e74bdd00a4bb2f457ec9352e0acaebc820dae235 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -598,6 +598,28 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>  		.flags = CAP_FLAG_OUTPUT_PORT,
>  		.set = iris_set_rotation,
>  	},
> +	{
> +		.cap_id = HFLIP,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_FLIP,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_flip,
> +	},
> +	{
> +		.cap_id = VFLIP,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_FLIP,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_flip,
> +	},
>  };
>  
>  static struct platform_inst_caps platform_inst_cap_sm8550 = {
> 

