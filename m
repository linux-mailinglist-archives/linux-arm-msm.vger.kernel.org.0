Return-Path: <linux-arm-msm+bounces-81027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D07B8C470BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 14:55:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A8D2E4E5034
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 13:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C979230C376;
	Mon, 10 Nov 2025 13:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QHcR7FdZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PtKDwTuU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0416820D4FC
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 13:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762782907; cv=none; b=Q23DLJGdznLxeO+CHtWF06SEewwdNp4UXP2xKDS2C4E7DRy8Eh0oolEk3sffdDX1NfGKqnUugcolz3DNCQVa1bBDgz4LtHWty8rPlNg/kW+EMP9616BmkXl1R2zo1NM/5qWf/h7F7A/354Tq8M3sF3ibj6QUSHVcdb1GX4QuVyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762782907; c=relaxed/simple;
	bh=VtKxyTYXKVMwbRBYUok5IOxyJLWZmmmNlAIF+qIVSHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jByghMXJmLDZR4AyK1HFBJ0Pd/XWJHFcB5hlabmn2ALKgFrTWM6QZVEhU8Mdmd/7iL/Wp/0+WVChEqS2DVsrQ6HaelO4gaAyvFZYr9Lrkzv9+Z7+/a01LfaUWiFeUDlN/sGlIM5oMhu6TVYsBiF8bPqpUhOiwIfy5Yk3VrAbeHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QHcR7FdZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PtKDwTuU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAD11Uv3676867
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 13:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	92NAht9vmhdQg3F3B362/2P/Al82g/z14lX6OMb7wfc=; b=QHcR7FdZ7iL3uGAh
	Bp6DM08tPcpmlSZ2h4EpnKsYiYAI1cIXs60eSrLP/Sx1zf+aUh6DQLSjaOyVrHc2
	bU++9uszuOPhNyAPQ2W3ztDPIn4q2NY35hCpm32zwG1AJX1SoLFJKmWYaQK26+Uz
	+5mbpKx4cS5qlJ9s7QoXN89Youoi3TfnXKw8/M0bfjfMQJ6zON8X5gvJRd8doNqY
	FFdv0K5XYqHBoHN8+eXKaKRnTsfAov/Wb79Sdq2aoLyDwKuXIG34q4AhcJ46FCO2
	zhP90/fOP5tHhgjflQJBVGN5yqCDevh/lWJQcTrojLPCyF/nBufq77HpDcISi1mz
	+9Ji4g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abgjh84s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 13:55:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b99f6516262so6920208a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 05:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762782904; x=1763387704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=92NAht9vmhdQg3F3B362/2P/Al82g/z14lX6OMb7wfc=;
        b=PtKDwTuUpSNr2ol/MsFWg+PV4LHvP5ox/JyYo2N7cuZysNhyR+drC5Z83JQWqUormm
         AJXa/UrxfUVS5f8usJ8BPN5DL/lqVN5ujzMlB+6yspWCEIlUZvmtR0pEUUg/ei8L4V8g
         NvBDwKH90sFWgyD7Fx6qXhy8eDGjzZJPwj9GiarW8Qmu57iTHSldc6R8UF/jHsV7S6bc
         8wIqKRAo+MnKHAgRcBPPxuS5hXa8Ih9Wia7568gsFVr2KqEj0c9Tl+pRkziUvn/iTvoT
         KyJDqeGNCQm+cw9VEsGIQwcCaDlgt0qR3rz9xKzzr3XrsjjUtnVIHU/4KRdkjRmxbHos
         qi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762782904; x=1763387704;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=92NAht9vmhdQg3F3B362/2P/Al82g/z14lX6OMb7wfc=;
        b=CMOTzv4vfGG69XTSwqa8KhhpgO3P1hdaQs12OI6LEePcc2RunN0uUSyWiakZOPrf1N
         B2DV4kCFBObpXXjydkU5jfHHoxzHRVD+l7ev4yY+Ma6D/957cEn2WVYe7nAZ4bhTUNrl
         5zsqQfkkREykG+fwdF/TNaVL1gO0Jf1F7BLXCetW6NQvo1P3nufOfDXwIi81tODFePff
         Y4Lz4Ie1xnybCMC9gs2nDSGPnB1ALJgfud4+NiaKjam968SgESud/je2leZcTfQqzFZu
         rvOmB1enAC75W6F61k85jHTVMbwDj58+PaV482uh16IOSABHizExgMKOuBSqCcNK66bm
         CfDw==
X-Forwarded-Encrypted: i=1; AJvYcCVvJ2P8vTBLHcIBqIzBo9CrDBF8X8JF34Ujp1oTVoa/L2WV7L9IRDdRgmfPX05X51GVjmPqHp43EEQDgyTE@vger.kernel.org
X-Gm-Message-State: AOJu0YyAj9nNoNAdMddQcy9HuNZNHYa01B2qxcgcrcKgXsNR3jPSBuTX
	WeEeIBdaFwRVnuPLLZxF7+WRzqOdYMmvL/yOPbLrhrOnt9Sns5YCTqep4ccOQPxHyRZ7Zav177C
	szAs4qgbPX9/isuZFIiZz8Zyuw6X4Ku6S/QoxpTYJ4KSvlk8ljfNbLfwPEjUA/039wNiR
X-Gm-Gg: ASbGnctqQO6BP118ajuTKNxmVSh1InGxuRhbJKeVLPqN1bfQ+fcZk+vuGz/DyvChzCQ
	AKKjmdOz8Krm72A4QDY0ziVGzLPQZi+GwW2Ecr+er8Sr8xXIBRlaNMabHHleyCauYG8SkdmrkAS
	QX6W3m0hzgZkADfnF4jCte7ZukLXYUE1D6sqPgUfU+9mo90xEBeZN2DPQWsEhEwaclgPumUOrU1
	RnqsgR4ru85N9Zx4tccCvUC8UcgY3MEouEx/QoUamMbrcXzSmH3hGAS20zj2oXw8sorUbdpps4h
	t0a5rUUzzpxjq2xPAaGevO0Kq1oFPQ/P0FG7mc3L/wJf7ZrydcBKN0UlXmzWhv44ro8gonRy9hA
	RMlbX9F25ayzppvwIR4avcHWPAxPiczo=
X-Received: by 2002:a05:6a20:4306:b0:34e:7bef:e816 with SMTP id adf61e73a8af0-353a1ae2947mr11700237637.35.1762782903524;
        Mon, 10 Nov 2025 05:55:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIBKl2qgrS/oNApP2Xt4xZhV9mgZMLUXTTjzVnFgpELSppcoQjGs791t09WSlCQ7C+ZhMFrw==
X-Received: by 2002:a05:6a20:4306:b0:34e:7bef:e816 with SMTP id adf61e73a8af0-353a1ae2947mr11700183637.35.1762782902994;
        Mon, 10 Nov 2025 05:55:02 -0800 (PST)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba902207232sm12564983a12.32.2025.11.10.05.54.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 05:55:02 -0800 (PST)
Message-ID: <361d26e6-3137-5378-1fe6-e5fc51148419@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 19:24:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 3/6] media: qcom: iris: Add scale support for encoder
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
References: <20251110-iris_encoder_enhancements-v5-0-1dbb19968bd5@oss.qualcomm.com>
 <20251110-iris_encoder_enhancements-v5-3-1dbb19968bd5@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251110-iris_encoder_enhancements-v5-3-1dbb19968bd5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEyMSBTYWx0ZWRfXxWVNejdb4iDz
 VY5T/Cfyr9UXOx7S70zocZoTGff1GzqOYSV5ppUdqFN76WWlWtgM/Ks/n7KPsXsGWSTwsh6AGTi
 S5BVcKlOX5vpNXWsFZdeT0Bl/cVV5Sn1ZLGf8iAXGthpHQpRhUp8yQbZYtcGAyIXg/Vt46vxVWL
 VY5nqNA0BlqAXMlLzmGMgsGHExBOcMhTSKSW3xLT8Vl9psJ25IROyUS4uUjSAGRGpNLI5rCYOub
 C+twjjILFccYGje3GB6DtRcUiCu7ZFa8j0BrvJvSnTzBEm1kFrR40o6MVLa2tcrTx+fOeeIDWzg
 jyP1iXSQkYXl6JkRy1QppiExvEsoeb2JkIU7uouyBc8mmtap6ApKdZoMdRlOLI3odczZZGL/RqU
 iAI1qYQYt4OiXBymqyt4X5eLVt6PtA==
X-Proofpoint-GUID: ruTA-iRGlwI4c8wj5Bx0O8No6kBhWLGw
X-Proofpoint-ORIG-GUID: ruTA-iRGlwI4c8wj5Bx0O8No6kBhWLGw
X-Authority-Analysis: v=2.4 cv=La8xKzfi c=1 sm=1 tr=0 ts=6911eeb8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=XTzlPML3CqmVTmx85CUA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100121



On 11/10/2025 3:53 PM, Wangao Wang wrote:
> Add members enc_scale_width, enc_scale_height to the struct iris_inst to
> support scale requirements.
> 
> Add output width and height settings in iris_venc_s_fmt_output to
> enable scaling functionality.
> 
> Add VPSS buffer to platform data, which the scale function requires.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 12 +++++------
>  .../platform/qcom/iris/iris_hfi_gen2_response.c    |  2 ++
>  drivers/media/platform/qcom/iris/iris_instance.h   |  4 ++++
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 12 +++++++++++
>  drivers/media/platform/qcom/iris/iris_venc.c       | 23 +++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  9 +++++----
>  6 files changed, 51 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 30c0cbe22d1d34b5bbbc6bdbd3881dd43a6ff647..8945e94ec9e87750fc87bebf63f4fbb634d8571a 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -194,8 +194,8 @@ static int iris_hfi_gen2_set_bitstream_resolution(struct iris_inst *inst, u32 pl
>  		payload_type = HFI_PAYLOAD_U32;
>  	} else {
>  		codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
> -		resolution = ALIGN(inst->fmt_dst->fmt.pix_mp.width, codec_align) << 16 |
> -			ALIGN(inst->fmt_dst->fmt.pix_mp.height, codec_align);
> +		resolution = ALIGN(inst->enc_scale_width, codec_align) << 16 |
> +			ALIGN(inst->enc_scale_height, codec_align);
>  		inst_hfi_gen2->dst_subcr_params.bitstream_resolution = resolution;
>  		payload_type = HFI_PAYLOAD_32_PACKED;
>  	}
> @@ -237,10 +237,10 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
>  			left_offset = inst->crop.left;
>  			top_offset = inst->crop.top;
>  		} else {
> -			bottom_offset = (ALIGN(inst->fmt_dst->fmt.pix_mp.height, codec_align) -
> -					inst->fmt_dst->fmt.pix_mp.height);
> -			right_offset = (ALIGN(inst->fmt_dst->fmt.pix_mp.width, codec_align) -
> -					inst->fmt_dst->fmt.pix_mp.width);
> +			bottom_offset = (ALIGN(inst->enc_scale_height, codec_align) -
> +					inst->enc_scale_height);
> +			right_offset = (ALIGN(inst->enc_scale_width, codec_align) -
> +				       inst->enc_scale_width);
>  			left_offset = 0;
>  			top_offset = 0;
>  		}
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 2f1f118eae4f6462ab1aa1d16844b34e6e699f1e..dc3e606b6ab429a1d15536fa8316afb1e384d674 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -54,6 +54,8 @@ static u32 iris_hfi_gen2_buf_type_to_driver(struct iris_inst *inst,
>  			return BUF_SCRATCH_2;
>  	case HFI_BUFFER_PERSIST:
>  		return BUF_PERSIST;
> +	case HFI_BUFFER_VPSS:
> +		return BUF_VPSS;
>  	default:
>  		return 0;
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index a9892988c10bc28e9b2d8c3b5482e99b5b9af623..0b36092fe4e7296da2f66aecf9083f7f1edc5459 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -66,6 +66,8 @@ struct iris_fmt {
>   * @hfi_rc_type: rate control type
>   * @enc_raw_width: source image width for encoder instance
>   * @enc_raw_height: source image height for encoder instance
> + * @enc_scale_width: scale width for encoder instance
> + * @enc_scale_height: scale height for encoder instance
>   */
>  
>  struct iris_inst {
> @@ -106,6 +108,8 @@ struct iris_inst {
>  	u32				hfi_rc_type;
>  	u32				enc_raw_width;
>  	u32				enc_raw_height;
> +	u32				enc_scale_width;
> +	u32				enc_scale_height;
>  };
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 36d69cc73986b74534a2912524c8553970fd862e..d3306189d902a1f42666010468c9e4e4316a66e1 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -729,6 +729,10 @@ static const u32 sm8550_dec_op_int_buf_tbl[] = {
>  	BUF_DPB,
>  };
>  
> +static const u32 sm8550_enc_ip_int_buf_tbl[] = {
> +	BUF_VPSS,
> +};
> +
>  static const u32 sm8550_enc_op_int_buf_tbl[] = {
>  	BUF_BIN,
>  	BUF_COMV,
> @@ -816,6 +820,8 @@ struct iris_platform_data sm8550_data = {
>  	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>  	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>  
> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
>  	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>  	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>  };
> @@ -908,6 +914,8 @@ struct iris_platform_data sm8650_data = {
>  	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>  	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>  
> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
>  	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>  	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>  };
> @@ -989,6 +997,8 @@ struct iris_platform_data sm8750_data = {
>  	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>  	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>  
> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
>  	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>  	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>  };
> @@ -1077,6 +1087,8 @@ struct iris_platform_data qcs8300_data = {
>  	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>  	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>  
> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
>  	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>  	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>  };
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 7ad747d2272f029e69a56572a188a032f898a3fb..f573408a3fc66e1bbc7814a8fc7953158e043fce 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -70,6 +70,8 @@ int iris_venc_inst_init(struct iris_inst *inst)
>  
>  	inst->enc_raw_width = DEFAULT_WIDTH;
>  	inst->enc_raw_height = DEFAULT_HEIGHT;
> +	inst->enc_scale_width = DEFAULT_WIDTH;
> +	inst->enc_scale_height = DEFAULT_HEIGHT;
>  
>  	memcpy(&inst->fw_caps[0], &core->inst_fw_caps_enc[0],
>  	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
> @@ -188,15 +190,32 @@ int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
>  
>  static int iris_venc_s_fmt_output(struct iris_inst *inst, struct v4l2_format *f)
>  {
> +	const struct iris_fmt *venc_fmt;
>  	struct v4l2_format *fmt;
> +	u32 codec_align;
>  
>  	iris_venc_try_fmt(inst, f);
>  
> -	if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
> +	venc_fmt = find_format(inst, f->fmt.pix_mp.pixelformat, f->type);
> +	if (!venc_fmt)
>  		return -EINVAL;
>  
> +	codec_align = venc_fmt->pixfmt == V4L2_PIX_FMT_HEVC ? 32 : 16;
> +
>  	fmt = inst->fmt_dst;
>  	fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	/*
> +	 * If output format size != input format size,
> +	 * it is considered a scaling case,
> +	 * and the scaled size needs to be saved.
> +	 */
> +	if (f->fmt.pix_mp.width != inst->fmt_src->fmt.pix_mp.width ||
> +	    f->fmt.pix_mp.height != inst->fmt_src->fmt.pix_mp.height) {
> +		inst->enc_scale_width = f->fmt.pix_mp.width;
> +		inst->enc_scale_height = f->fmt.pix_mp.height;
> +		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
> +		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
> +	}
>  	fmt->fmt.pix_mp.num_planes = 1;
>  	fmt->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
>  	fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
> @@ -254,6 +273,8 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
>  
>  	inst->enc_raw_width = f->fmt.pix_mp.width;
>  	inst->enc_raw_height = f->fmt.pix_mp.height;
> +	inst->enc_scale_width = f->fmt.pix_mp.width;
> +	inst->enc_scale_height = f->fmt.pix_mp.height;
>  
>  	if (f->fmt.pix_mp.width != inst->crop.width ||
>  	    f->fmt.pix_mp.height != inst->crop.height) {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index 4463be05ce165adef6b152eb0c155d2e6a7b3c36..db5adadd1b39c06bc41ae6f1b3d2f924b3ebf150 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -1131,10 +1131,11 @@ static u32 iris_vpu_enc_arp_size(struct iris_inst *inst)
>  
>  inline bool is_scaling_enabled(struct iris_inst *inst)
>  {
> -	return inst->crop.left != inst->compose.left ||
> -		inst->crop.top != inst->compose.top ||
> -		inst->crop.width != inst->compose.width ||
> -		inst->crop.height != inst->compose.height;
> +	struct v4l2_pix_format_mplane *dst_fmt = &inst->fmt_dst->fmt.pix_mp;
> +	struct v4l2_pix_format_mplane *src_fmt = &inst->fmt_src->fmt.pix_mp;
> +
> +	return dst_fmt->width != src_fmt->width ||
> +		dst_fmt->height != src_fmt->height;
>  }
>  
>  static inline
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

