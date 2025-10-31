Return-Path: <linux-arm-msm+bounces-79805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 560A8C237C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 08:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40F561893415
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 07:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9BF26D4DE;
	Fri, 31 Oct 2025 07:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k0qEBBMP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dBV51U/W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B4878F59
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 07:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761894140; cv=none; b=rTmUHp+TVTjAVJcQmGcMFHfLorYI2W4ghBlZI6ylIjDjoOTzy6KKOB913fQP6g/kDL0n6LPCYXOz3+4JLAswRJGj4ftgwiGPIvE2eO+wzuRmVHiyJ7TnDa3mbrQdtu7wqqDMyoNCb+tmfRnMIsb1f0Dy6xLFPKQ5yPTzikkA/iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761894140; c=relaxed/simple;
	bh=3VA/JP5N74/+QURC8lvECwgrL5VwU+hARhls54ewH0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OJb5OQ7fWSYLwLe0Sq8T0J8ixovJL2Mvi4z76yVyjpfk0424haUHyO3bJ5HAlbCjWN+oSnyklG5LgNmlP0LeGzpv2NF0pnOhBqK/ORk98qEZvz7uF2RsC9feDmBh46YsYvE1eAgsPmiw/TFHEfr3kiMMK29VfPrDpJeM+lWlGUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k0qEBBMP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dBV51U/W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59ULrM00898088
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 07:02:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KXQpzLFJXh+E+d7yWUIENb/c5cswdUeinkrB0pk5JuY=; b=k0qEBBMPvG0dpn1q
	sdMyF4Y55fQCal/dx3M+1gm9tC2/hFGVjKoACGlx5xCYhw6ZVf9wyFZknmc185cQ
	C2W776MWnnEXB+GOLEOHn5VSX6QRzpikss9cLJgIY7+RN6jjc7kBEuQqwoYWxVEn
	V1gp3FaUgkvSMBE+BrT+D0TeBgncYWnfvkPH7FSqEIFcPxH6PSmhCEg+WeP04A6h
	XrJjZTC8jGNKywlM4AvptU6yf6tvEcEmugEB3hFV7GGO6LFAiE6w8HRZrrgJdRO1
	XnS5VxSpHHbF/jHx7I3GBvko3LSKw9xdQaGeURrGmC4z2zmxkLe7gSXUdIeln4MD
	iILQTg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4gb214r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 07:02:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-290bd7c835dso21091305ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 00:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761894137; x=1762498937; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KXQpzLFJXh+E+d7yWUIENb/c5cswdUeinkrB0pk5JuY=;
        b=dBV51U/WVflfmbhGGpm1Hc+N5MZ5CUDNU6Jm+suMDJqJLH0CpL2vQv3V5/2xKzWTXQ
         F0wWZsHt8cQUFMcDVI7thAuiByrivjHTvzH8vAPHxOP6Erda16lVIwQ1VGhXpzqI8hZt
         b1mS5GrqgvEkEptU9CDvEAYM085++QROURgYk3gDvOtgmdLvGirtMroafSpsdrHsZCc3
         x8OLoACzXpWB6xmhrrT3+7CufMcbbAJ/+AejDh4P+Wps9/0wSJ2OuDzUoqjOnIo2sWdJ
         tqzirZJu6kyjxNMD/sL66OlFXusIarFDKOBsM2JyPoPvbdlevcOUCjXOgYRfK9Wel9Nn
         tdIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761894137; x=1762498937;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KXQpzLFJXh+E+d7yWUIENb/c5cswdUeinkrB0pk5JuY=;
        b=eey74pks8jwz5rMdjAjcZT7I9CpuWnGic65JVhNmarotWk85MWU24Jm9FkLqAUwaTs
         cM1klruFlnQDaV4DPdixh5DGkIi40o3+hdPQdtdAToE3FrEvwtUylFCwhyKBOJbAeTCZ
         gxoIF5i7DZsDSia7oUlsgsmv0NL/ipkiVlTjGRDxS1/tk3Hsi91X0WaDk0i24docMotB
         2+WjZzI9ZqZQohvr3roBy1HRL54JMaDCFi4g56GmwKaLMPYt+9896aOfiPcP1gq+1+kv
         nSBy66bXVqskMpD4nptP4lZWLuanF3JTrWC0WQewbqLL1PvYkwiyBNxd2Lw+Tr4vxaoh
         1eEA==
X-Forwarded-Encrypted: i=1; AJvYcCUwPG7fWXQhveWJWTom83NRHk0DW2wEI7r+0xRJQpoeSI1EMY+CI10yEnXlY7zM6RBYlIH9e0y5tBnNOwil@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2quW3Gh4KkWg/ixnuhSK7a01USLVBOek+cj9umT+RDGCmKy2X
	dGcVRyxy90s13wSNLUeJBxdFXBQDU7HVDAYkCvJntBvVKu9639N6a54osIb1jc8SBT4T7QRvaTo
	o2wd70iNI4EyV3agXf7FYaJmy1LJejqF4bSmlxbimUk19/900DMV7/EmU+g+aKHxkKvwc
X-Gm-Gg: ASbGncuJIfPBj/6W7uyGuY3ZQ8HP2gYQ0YiAYMo4B7asy18mJ8tf54xXLsuVFPxepIy
	qRndedCdO7EFQ1MYneYOhuohskDx5nLtqcGqjK8tzsm83cXf1hkamoA670W+t3+oBazQBFZkubF
	xjDaiaJpm4q3skfTpppA1T3qXw+vBihRNkUkLKwNaRjSbD1RR5r2cpSBYYZVOQb1ePI9kQCaUB/
	fHiu09Mb+3+cXAnibhRP0DaeIJiR3h2yQ1UVWCCDmVM3djAJvEewdb50PF6qqRSYrYWGmZCSROI
	5o4NdXw4Kbw1GA2p4EFBIZQyBMRFlLDKvBC3ZfSAN/FH0qqwIIYesN0a+hyd5f+czh3X3nTGMe8
	DYzjamcyykXbc54bjY6YKqLkTMUVx5F0=
X-Received: by 2002:a17:902:f54c:b0:294:f745:fe7f with SMTP id d9443c01a7336-2951a4935e9mr34274435ad.38.1761894136542;
        Fri, 31 Oct 2025 00:02:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQutvspZLKYBSr0XkKmfMKKVl2kzqj4MOiD4B9YAEjI8OaoI5KxGJo9ixY0mKdP+ykwrUAHQ==
X-Received: by 2002:a17:902:f54c:b0:294:f745:fe7f with SMTP id d9443c01a7336-2951a4935e9mr34274005ad.38.1761894135947;
        Fri, 31 Oct 2025 00:02:15 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952d0314cdsm6798965ad.26.2025.10.31.00.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 00:02:15 -0700 (PDT)
Message-ID: <9f03f29d-f667-648e-1383-d6a9883541df@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 12:32:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/5] media: iris: Add support for AV1 format in iris
 decoder
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251030-av1d_stateful_v3-v3-0-a1184de52fc4@oss.qualcomm.com>
 <20251030-av1d_stateful_v3-v3-3-a1184de52fc4@oss.qualcomm.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251030-av1d_stateful_v3-v3-3-a1184de52fc4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=efswvrEH c=1 sm=1 tr=0 ts=69045ef9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=s5kO0R1Z4orJ4Q5W7-IA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA2MyBTYWx0ZWRfX1eQXH/spwsP8
 T7aUor98tj5rvT2rvmzdxY/0cXyuvaEitLYurtT2UKc6QZG7gz7+DoxajNoFwTX1Sn/J2w5kfuA
 zx9dVrdiO7uV1xMxR9oUXg/FEZF2pmuMmVO8GEkMpQZDD0TgvFytoUPlXkkD1FZLg0EZBk3aLv9
 XDzIUHp4/nVp1D5cTtxeovCdFu/T5Vd2QY9rg4I2Iu/9AHmcLAAsjaGPKFwnO9Hl2ne6Swod8Qp
 EEnUw6ry1Zu72vfC7UaXBla5pF7Zjl2dOErRG8QuWYtrEPIJirvfkRY3UTgi8kW/b8226EqG9Zo
 syFkHSBGOIq2xP9OinGAKf/kZE28MDGZ31p6DNz+qKzp3prNeWXL5u3fupoXs/cTRAe8+1tBHWC
 2IXAFlv6/6QVfCSXoBSOcWa+sj2gcg==
X-Proofpoint-GUID: yUzKqtevM1RxXMWoW9Sf9v3VGoAPmQ8O
X-Proofpoint-ORIG-GUID: yUzKqtevM1RxXMWoW9Sf9v3VGoAPmQ8O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310063



On 10/30/2025 12:30 PM, Deepa Guthyappa Madivalara wrote:
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
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 23 ++++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_sm8250.c      | 17 ++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vdec.c       | 23 ++++------------------
>  6 files changed, 48 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index 1b6a4dbac828ffea53c1be0d3624a033c283c972..3d56f257bc5620aacec2bb7e11253dc7c83b7db9 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -139,6 +139,7 @@ enum hfi_codec_type {
>  	HFI_CODEC_DECODE_HEVC			= 3,
>  	HFI_CODEC_ENCODE_HEVC			= 4,
>  	HFI_CODEC_DECODE_VP9			= 5,
> +	HFI_CODEC_DECODE_AV1			= 7,
>  };
>  
>  enum hfi_picture_type {
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 62fbb30691ff967212022308fa53ff221fa24ce9..7e4f5f1dd8921c57db039fbd4bc2f321891348db 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -19,6 +19,7 @@ enum iris_fmt_type_out {
>  	IRIS_FMT_H264,
>  	IRIS_FMT_HEVC,
>  	IRIS_FMT_VP9,
> +	IRIS_FMT_AV1,
>  };
>  
>  enum iris_fmt_type_cap {
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
> index 69c952c68e939f305f25511e2e4763487ec8e0de..3b61723dbf27e9ba8d427686e44cf048a0ab7c5b 100644
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
> @@ -761,6 +780,8 @@ struct iris_platform_data sm8550_data = {
>  	.dma_mask = 0xe0000000 - 1,
>  	.fwname = "qcom/vpu/vpu30_p4.mbn",
>  	.pas_id = IRIS_PAS_ID,
> +	.inst_iris_fmts = platform_fmts_sm8550_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
>  	.inst_caps = &platform_inst_cap_sm8550,
>  	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
>  	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
> @@ -853,6 +874,8 @@ struct iris_platform_data sm8650_data = {
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
> index 69ffe52590d3acf8d595f856fb1dbd81f3073721..bf7b9c621cb7255367c06f144c03c3faa69372e0 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -67,21 +67,6 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
>  	kfree(inst->fmt_src);
>  }
>  
> -static const struct iris_fmt iris_vdec_formats_out[] = {
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
>  static const struct iris_fmt iris_vdec_formats_cap[] = {
>  	[IRIS_FMT_NV12] = {
>  		.pixfmt = V4L2_PIX_FMT_NV12,
> @@ -101,8 +86,8 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>  	unsigned int i;
>  	switch (type) {
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> -		fmt = iris_vdec_formats_out;
> -		size = ARRAY_SIZE(iris_vdec_formats_out);
> +		fmt = inst->core->iris_platform_data->inst_iris_fmts;
> +		size = inst->core->iris_platform_data->inst_iris_fmts_size;
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>  		fmt = iris_vdec_formats_cap;
> @@ -131,8 +116,8 @@ find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>  
>  	switch (type) {
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> -		fmt = iris_vdec_formats_out;
> -		size = ARRAY_SIZE(iris_vdec_formats_out);
> +		fmt = inst->core->iris_platform_data->inst_iris_fmts;
> +		size = inst->core->iris_platform_data->inst_iris_fmts_size;
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>  		fmt = iris_vdec_formats_cap;
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

