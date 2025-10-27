Return-Path: <linux-arm-msm+bounces-78845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0FAC0BE4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 07:04:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94B3518A1FC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 06:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A6282D63F6;
	Mon, 27 Oct 2025 06:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="El9w4C9H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACB62D97A8
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 06:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761545080; cv=none; b=eYlSB/9Dp/VWSgQdOgjGSgp2Wg/xEUZnFZDQb89Dn5kJmw5muy5gJcbRLoFf6Z3c4hTen7aoAyoosr8Aerx3A3k12WtcTCBnezYHkfa0hfxX9R59nzoEwtt8sN89kz7J/mITRGohU+m9kGqQRUjEHKyleGSAmSwnkfukrT6D6o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761545080; c=relaxed/simple;
	bh=kepiIueOFRnfbHnym1u9qyut0xSrNgMTLoGRgt/niJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fXPgtDlO4qgoBewAtee8KKlo30Lnu3gGiP0GuiONwmHKY1953m6amjzz5oak+mV7eBdEIUCxWkO2z/C5l/HiS4uI3YMZSQrd5Nv8T5Z0i++u3gZIo2GONd2/rlpmSB0UGdJ+QiuyZuqnZyiCHmwJQEso6sYiZfPBUJYFQipaxu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=El9w4C9H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59QKjxa3827542
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 06:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wvgRpgmEkc6a4YxoH0OAuoDFthvgpwMImnX+j+mmQvg=; b=El9w4C9Hj3rGFkk7
	xNTKuNmovpuh1etoW8DbV5OySteHJni2NXDr2UnPLP8Dy84or6WeoSR4i/Lv7Qm1
	U/aDKCps5Nio5qbRpNm6qWSOFCILsWDfX0ZNREzMSnTiBgGq1Zie78+f9XvjC1Si
	MfQdj1odwC370o1SldLqpMW4EYWSUckLhsSyUZ/8HOm+OtNQI7xKxdaJhq1zwi6t
	rK8jsq9BXymxyunvqqRIhGNyouDDVN5879d+2CSYWtIZthE+DeSP83uvWm6D9KsE
	uXdPAWf8lKaj8qTTfSl7web7c4TqNIgC0M0gRSzRODsjZjP1pR1xp49JmIBgwhvI
	jdw/2w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0nnxuep0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 06:04:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-26985173d8eso111318485ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 23:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761545076; x=1762149876;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wvgRpgmEkc6a4YxoH0OAuoDFthvgpwMImnX+j+mmQvg=;
        b=kz05m0TYJuVwvG9pE57Qjb5mQ57K4JGeexp8jIFl/z/9OTeg+uX+EX1/7KbB2RfA1S
         Qw5GknJZLjAJs7JdKkWTeY14tmAFpbmFFqDl1DxV4RPem23oCwLecFkwqkg9IKgoPxNP
         S06usnNaLS17YmjBcn6N17yAbaQJc0QTQtKGJqq3cu/ZclUEdLeSSm2+meljWp8pE6qS
         dZyUAa+xa7NpzB3kUyHj5q5uV8EM0dVhRSLitLWHSqtkQTtIz67shEySvzbzRWPgYUC9
         1frz4k+OBGiGo3PFRq7VaoRqP7mvx+qbG5mBOvkL0HKUajljtDbVw/zHrwun2kCPjPgS
         64gw==
X-Forwarded-Encrypted: i=1; AJvYcCVKwnDz4k7YXnONqT9oTzxqoMZZR9mV3E4D1c7ghSokvHQluLf2mT1aNfOColcPFn1+MIqX2WjFq4mxXpF9@vger.kernel.org
X-Gm-Message-State: AOJu0YwqUQGhOGXre2A90J0i/m1dpmrEOA5kOilN516zKz4UEpWTu8K/
	Jx+hZIBMH6cOKSUbycSV77Nc28I0yGfX0FcoXOjc7LY0HTjjCiklJO3TMaE/qB35f9JkunH0wj1
	JSmvCaHSEG3o+udN8WCEUAydH/70o17jtaEjHPMa+wOMwAKDsmhaF1WS/jc+pm7prTQDGrxM+7F
	kf
X-Gm-Gg: ASbGnctdoKYmY78nTnEXBq8+0fL/pNjVgFAbg8QkKEwFpJ6pELCFnJysoPdo/v/+Yol
	bI1zsLHQtWuTrEao2/IqCDfMKmtDCkeuWrccBK944Q1mcR6yYXO6OHpKQ4vV5QOKSk3+4voKUK3
	t7pYefYlBGc+sVja3/xWQ0YjOHEnWyGJLcCEYxprTEp8Lp4isc1zYXTMtcNxj1loig1rgJW+R3o
	X6YwthBc38CyVLaK5bFL5gEAf1nUPsBrZyWJt7KKgG9dDazat0kKxp6FDChYRjD/6LojjjO722N
	5y2tte0LYz8x6YVfyxbp7HrX10aQ7Eih/Z26xMflNgcOhV2TeTn/MGMmXtqECx9uGvRRzyK+4KT
	spqnLFr5lUQ3VkAlhm7eB09GHH4LhtJA=
X-Received: by 2002:a17:903:440c:b0:264:8a8d:92dd with SMTP id d9443c01a7336-290c9cb8b95mr486472845ad.20.1761545076359;
        Sun, 26 Oct 2025 23:04:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7cTBX9iOHLCxXb/v6OPzj9ar4fAF9G8qX4Vje0vyekWJq9KwQY9jvgVjQ7yxHSIR0h1dXAA==
X-Received: by 2002:a17:903:440c:b0:264:8a8d:92dd with SMTP id d9443c01a7336-290c9cb8b95mr486472525ad.20.1761545075779;
        Sun, 26 Oct 2025 23:04:35 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d23218sm67709885ad.51.2025.10.26.23.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 23:04:35 -0700 (PDT)
Message-ID: <c5dcec1d-7230-1a09-d846-76a427ecba00@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 11:34:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 3/5] media: iris: Add support for AV1 format in iris
 decoder
Content-Language: en-US
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251017-av1_irisdecoder-v2-0-964a5478139e@oss.qualcomm.com>
 <20251017-av1_irisdecoder-v2-3-964a5478139e@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251017-av1_irisdecoder-v2-3-964a5478139e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Xc+EDY55 c=1 sm=1 tr=0 ts=68ff0b75 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=patBjdNt95CMtBv0JbEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: IMo19nbNyceydKM42i7g91al3Siqwjl_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA1NCBTYWx0ZWRfX5Amim2S+jt61
 uc6LDW6aOG5kFu0lw1riLsNot9ujcG/KLuBP2YeYmGSpHJt9NU9G1Ud1Pnshzi5soF5429GJadF
 j5VjcM7No1W3jHnYDnoI60NjdYiMmDjeCcfd3q21BFF/1vaKQ5jkIWdWfGhS3stAXidcrmFazmN
 YwwYlQ9cgpvKEfMB+B+E0e5MgN62LqzSl4Xvhcbqz8jx+Vv4jdHs/YxnO5ZU0XrbYWJ+3zDb4Q0
 IxOv8sDk940Ab6KQoQu92h22wcOX1BcVO33xPVp9HuYVd1eXIkfAKPOcYREIMtJ6iwrJckiQJXM
 JOV6TMY3AZq3WdQdRmrectYt7Lf9pVa+5pLlmCAxafPAdsXwvliApgnn3vsWO5LkB7YU9gGsySl
 sAz7pIL3BUsesamjCC5CICaxDsSEqg==
X-Proofpoint-ORIG-GUID: IMo19nbNyceydKM42i7g91al3Siqwjl_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270054



On 10/18/2025 12:05 AM, Deepa Guthyappa Madivalara wrote:
> Extend iris decoder driver to support format V4L2_PIX_FMT_AV1.
> This change updates the format enumeration (VIDIOC_ENUM_FMT)
> and allows setting AV1 format via VIDIOC_S_FMT for gen2 and beyond.
> Gen1 iris hardware decoder does not support AV1 format.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>  drivers/media/platform/qcom/iris/iris_instance.h   |  1 +
>  .../platform/qcom/iris/iris_platform_common.h      |  2 ++
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 23 ++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_sm8250.c      | 17 +++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vdec.c       | 25 ++++++----------------
>  6 files changed, 50 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index aa1f795f5626c1f76a32dd650302633877ce67be..bbfe7a0851ea94fb7041a868b4df8b2ec63bf427 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -138,6 +138,7 @@ enum hfi_codec_type {
>  	HFI_CODEC_DECODE_HEVC			= 3,
>  	HFI_CODEC_ENCODE_HEVC			= 4,
>  	HFI_CODEC_DECODE_VP9			= 5,
> +	HFI_CODEC_DECODE_AV1			= 7,
>  };
>  
>  enum hfi_picture_type {
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 5982d7adefeab80905478b32cddba7bd4651a691..f1883ffc138fd975fb76d4e45904ee04e196cd20 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -19,6 +19,7 @@ enum iris_fmt_type {
>  	IRIS_FMT_H264,
>  	IRIS_FMT_HEVC,
>  	IRIS_FMT_VP9,
> +	IRIS_FMT_AV1,
>  };
>  
>  struct iris_fmt {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 58d05e0a112eed25faea027a34c719c89d6c3897..9aca70b4c0690f0d8d799e2a9976bd20d6bb8c94 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -214,6 +214,8 @@ struct iris_platform_data {
>  	u64 dma_mask;
>  	const char *fwname;
>  	u32 pas_id;
> +	struct iris_fmt *inst_iris_fmts;
> +	u32 inst_iris_fmts_size;
>  	struct platform_inst_caps *inst_caps;
>  	struct platform_inst_fw_cap *inst_fw_caps_dec;
>  	u32 inst_fw_caps_dec_size;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 36d69cc73986b74534a2912524c8553970fd862e..15a38b7122af6d978fac433e8c02b4da5c141e1a 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -19,6 +19,25 @@
>  #define VIDEO_ARCH_LX 1
>  #define BITRATE_MAX				245000000
>  
> +static struct iris_fmt platform_fmts_sm8550_dec[] = {
> +	[IRIS_FMT_H264] = {
> +		.pixfmt = V4L2_PIX_FMT_H264,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	[IRIS_FMT_HEVC] = {
> +		.pixfmt = V4L2_PIX_FMT_HEVC,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	[IRIS_FMT_VP9] = {
> +		.pixfmt = V4L2_PIX_FMT_VP9,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	[IRIS_FMT_AV1] = {
> +		.pixfmt = V4L2_PIX_FMT_AV1,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +};
> +
>  static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>  	{
>  		.cap_id = PROFILE_H264,
> @@ -760,6 +779,8 @@ struct iris_platform_data sm8550_data = {
>  	.dma_mask = 0xe0000000 - 1,
>  	.fwname = "qcom/vpu/vpu30_p4.mbn",
>  	.pas_id = IRIS_PAS_ID,
> +	.inst_iris_fmts = platform_fmts_sm8550_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
>  	.inst_caps = &platform_inst_cap_sm8550,
>  	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
>  	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
> @@ -852,6 +873,8 @@ struct iris_platform_data sm8650_data = {
>  	.dma_mask = 0xe0000000 - 1,
>  	.fwname = "qcom/vpu/vpu33_p4.mbn",
>  	.pas_id = IRIS_PAS_ID,
> +	.inst_iris_fmts = platform_fmts_sm8550_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
>  	.inst_caps = &platform_inst_cap_sm8550,
>  	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
>  	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> index 16486284f8acccf6a95a27f6003e885226e28f4d..8342a0b6f825b385192baedfc67c50bba7661470 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> @@ -17,6 +17,21 @@
>  #define BITRATE_PEAK_DEFAULT	(BITRATE_DEFAULT * 2)
>  #define BITRATE_STEP		100
>  
> +static struct iris_fmt platform_fmts_sm8250_dec[] = {
> +	[IRIS_FMT_H264] = {
> +		.pixfmt = V4L2_PIX_FMT_H264,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	[IRIS_FMT_HEVC] = {
> +		.pixfmt = V4L2_PIX_FMT_HEVC,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	[IRIS_FMT_VP9] = {
> +		.pixfmt = V4L2_PIX_FMT_VP9,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +};
> +
>  static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
>  	{
>  		.cap_id = PIPE,
> @@ -337,6 +352,8 @@ struct iris_platform_data sm8250_data = {
>  	.dma_mask = 0xe0000000 - 1,
>  	.fwname = "qcom/vpu-1.0/venus.mbn",
>  	.pas_id = IRIS_PAS_ID,
> +	.inst_iris_fmts = platform_fmts_sm8250_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
>  	.inst_caps = &platform_inst_cap_sm8250,
>  	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
>  	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index ae13c3e1b426bfd81a7b46dc6c3ff5eb5c4860cb..be8d2d48c82f385e4f46807f7e0dd52e469927cd 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -67,26 +67,12 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
>  	kfree(inst->fmt_src);
>  }
>  
> -static const struct iris_fmt iris_vdec_formats[] = {
> -	[IRIS_FMT_H264] = {
> -		.pixfmt = V4L2_PIX_FMT_H264,
> -		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> -	},
> -	[IRIS_FMT_HEVC] = {
> -		.pixfmt = V4L2_PIX_FMT_HEVC,
> -		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> -	},
> -	[IRIS_FMT_VP9] = {
> -		.pixfmt = V4L2_PIX_FMT_VP9,
> -		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> -	},
> -};
> -
>  static const struct iris_fmt *
>  find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>  {
> -	unsigned int size = ARRAY_SIZE(iris_vdec_formats);
> -	const struct iris_fmt *fmt = iris_vdec_formats;
> +	unsigned int size = inst->core->iris_platform_data->inst_iris_fmts_size;
> +	const struct iris_fmt *fmt =
> +			inst->core->iris_platform_data->inst_iris_fmts;
>  	unsigned int i;
>  
>  	for (i = 0; i < size; i++) {
> @@ -103,8 +89,9 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>  static const struct iris_fmt *
>  find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>  {
> -	const struct iris_fmt *fmt = iris_vdec_formats;
> -	unsigned int size = ARRAY_SIZE(iris_vdec_formats);
> +	unsigned int size = inst->core->iris_platform_data->inst_iris_fmts_size;
> +	const struct iris_fmt *fmt =
> +			inst->core->iris_platform_data->inst_iris_fmts;
>  
>  	if (index >= size || fmt[index].type != type)
>  		return NULL;
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

