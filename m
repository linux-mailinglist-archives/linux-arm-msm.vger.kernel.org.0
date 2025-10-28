Return-Path: <linux-arm-msm+bounces-79163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2971C1422B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 11:40:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CFA119848AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 10:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765BE304975;
	Tue, 28 Oct 2025 10:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZcTYS5wb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C150C305E26
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 10:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761647994; cv=none; b=VB889AVlSTDH+djPbUsScTSA8vKN/u9u2UjCSnAa/iYsOTsWdfm9n5eaeCQMHzJufABT6YeRLxK/wW5Xcw819o1LSV1bTuEBLbELPpe6LG2engZTy43G/4pW3GGBz9c89rnVp4Beq481aG5FBTadIiqDJEGE3i/lJvaROG4nEC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761647994; c=relaxed/simple;
	bh=3NGjtgZxPgWtmH709RDRDfk7uFifY5OiY7B1EJWWpsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iqu0QCLCVj5W02vSRuiIImGXIslq08j7f2ukJtmM8Fj6Gz1/lnvEGeTBKJXVzCbAH3koFyxLT3TG+h7EWIDQwl46fuZMTcbksI2sdZcAbAeA+iLoTXSRaYayCCtBCFCgwysHh6Xmxf/6DXgVSV+tTKGniLNloe40tUpWqJhGSyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZcTYS5wb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S8Xrr01177133
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 10:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hakPLjvlb1x1mh1I+hwpkg3sAPbblZiTbfuHFvfq7VE=; b=ZcTYS5wbGBjroiRs
	Oe3hNC/poxLYE5cdIShOTQnO2ck3B0SA2YF76Q5N5TEQ66BR/0YxS5wOOA8w4vfD
	7f4Z7RvuQ5Q7byey9tn/1RsDUCtxZPi+wqm37ILaQ7aCM6FxPHk7iVE3AaSqh0t4
	j1UAM4l0JCpjf0AciJNZFCFJmEefjnl28zuX7j6LgwFexVYdp5v7iE3koq4rxH/y
	WcOpX018WI6HEvGQ2AfmrNjSHvbkOYb6wPkvsHBhiEhGyxosvs6mrebZkIPebutL
	m197HJxhnqakE2KcI88aHZvkOwSw8Ht2hGLWeXSBk24OrI9JNct1Up2N+1GbWLjH
	PGkkVA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2tebgcbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 10:39:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-781171fe1c5so4764988b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 03:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761647991; x=1762252791;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hakPLjvlb1x1mh1I+hwpkg3sAPbblZiTbfuHFvfq7VE=;
        b=u1OgbOMDYk3kw1UTlDv5dTakrFzb/2XmMxXb3ujh0LTZIdyzr3Zp9Z/yLgj6RVvjjD
         OrazrMlIaQ1F5gLTbehNmo1tAOE8gd3YBzcs3aY4ZuarDKMBJUeI6P/R9ubguDYfXa+9
         6Od1HvYxqvgJkMRig7+Ao4/xJp9nLnqHJkzYu9BHbzpF8Lfiq6JVhXmQx/n9qvDQL2lM
         M59m3zoWC0OvSjckL2oXEkKIGddxsCDhpisgCFI6/L+YDcP3DbTU8FiPPlSKBFMrvB1Y
         VK6JmGeyzbr+fgNMOYCa16EbSo7OPfhFIrLvlDJ4Fct856M2WgMZJ0QJ+4u/jwY4qrLP
         Wh8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpgxtJHDN3ieMVupExDaVTtAwBsn6g2LGpQo2kcexD9K7xRPQu0VclGL1xQ+ksQGSIic0RLhKjQzLTHWGB@vger.kernel.org
X-Gm-Message-State: AOJu0YyYzNFZAsulmKebsVQ5MpkNdBztdNCXTL94QymXKRrHeB3vdg7W
	xfJ0hAIvRLGwBtI+zK/X7uSRN6CWqJH9zVkJgaitknMKg6TZJS+TDCdy/seV3WGUwsoTho51GjB
	PI5P8xp/CLu1iT+jMeDSkS1jf391iFV+Ybcht4FIYDCksI4nKJ1rp6xtLZabWf4UWS1VA
X-Gm-Gg: ASbGncuKqxysYXvsAqsufOGBigKXVKr5wXKKh1nTFYfL62Gyd7STtOP+Nka2zUNojTl
	xXCW8y8MDRKhgxDMEJ1Rp19+DKEM2VscWdoEXhKwDFzHFqZxVTpVR9+B+PkTdUvuI8YOtH5onNq
	E+dUdZ+VRWCj7Nfy9L3zMnbTjWanczUxrlubFd1QN87b0ac+5UIoAdhLRMMEq+pMKwMwm39dSpb
	4e5X4XNGkKkAWyjm4cKvw787oBnIl/xBsx2E273K930tRdOBZzbgo8wJ9uMU+oxIvh3nAnYJBp6
	JDmfVtYTeAXEepZfic2ielVW2gS33hG8N6YBHyOozMbV5kGE1HhClslcMAIU3Fp8S/wJ37dT7kw
	+xNCZE5ybaX1oTjz1/WMiZixi1edjUzU=
X-Received: by 2002:a05:6a21:3397:b0:2dc:40f5:3c6c with SMTP id adf61e73a8af0-344d403a01cmr3981139637.54.1761647990652;
        Tue, 28 Oct 2025 03:39:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYuP8hwnRXCriOHq1znAqj/6unUwBm2UU+kXa9k/iRY2/grJHUUtm0DNhi4dw2IYstv7N44A==
X-Received: by 2002:a05:6a21:3397:b0:2dc:40f5:3c6c with SMTP id adf61e73a8af0-344d403a01cmr3981110637.54.1761647990221;
        Tue, 28 Oct 2025 03:39:50 -0700 (PDT)
Received: from [10.206.101.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a4140492f9sm11100899b3a.30.2025.10.28.03.39.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 03:39:49 -0700 (PDT)
Message-ID: <2898f1bc-c014-b196-705a-cd797be92dce@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 16:09:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 1/4] media: qcom: iris: Add support for scale and
 improve format alignment
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        dikshita.agarwal@oss.qualcomm.com, abhinav.kumar@linux.dev,
        bod@kernel.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
References: <20251015092708.3703-1-wangao.wang@oss.qualcomm.com>
 <20251015092708.3703-2-wangao.wang@oss.qualcomm.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251015092708.3703-2-wangao.wang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA5MCBTYWx0ZWRfX6wRKKEf/mH1Q
 2rLGPb35gnsNBh8oQmgfjbfb+Lg2DNqqBntydJRsca8Vtu2vLZ7kHtr0/nR+l/HnYkJRKM8TEWi
 yOhTrOBUWSiE7MCMRoIsq57HpltPO93029+d9qWL30/+i/QiJw+D4VI/wrnkgs3SXd47EfYBIT0
 2e68CZ5wKVYo9ZDAVz3zZD1u5vH2BKVtWE7j+sIAcw5ItvfC3/fJpZKEbHjfbm+no/IqM2MpNAQ
 ZA/Li7f89iCP+jTKPr2IiOMpZELtpGOq8rpBoF2sDBVb1HDBqaCXbVKYS3hKXsZZctpff2ztHDw
 s7Tco3+NY1Hb/yMz2MhAR2+Ltvr6LPXN+sZVtMyheCL+41lMzeMaPVBmoT+2cZ4pvTGiRX+aD6x
 HPh8wzaDoSLnap1CfVjwqu03fF/zXw==
X-Proofpoint-GUID: 1PWOAf5vlJJtynYbjfUo1Cv9ENR1Xlv0
X-Proofpoint-ORIG-GUID: 1PWOAf5vlJJtynYbjfUo1Cv9ENR1Xlv0
X-Authority-Analysis: v=2.4 cv=V/BwEOni c=1 sm=1 tr=0 ts=69009d77 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tP2Na-aPhhGfs1T55DUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280090


On 10/15/2025 2:57 PM, Wangao Wang wrote:
> Add output width and height settings in iris_venc_s_fmt_output to
> enable scaling functionality.
> 
> Add members enc_raw_width, enc_raw_height, enc_bitstream_width and
> enc_bitstream_height to the struct iris_inst to support codec
> alignment requirements.
> 
> HFI_PROP_CROP_OFFSETS is used to inform the firmware of the region
> of interest, rather than indicating that the codec supports crop.
> Therefore, the crop handling has been corrected accordingly.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  .../qcom/iris/iris_hfi_gen2_command.c         | 18 ++++++++----
>  .../media/platform/qcom/iris/iris_instance.h  |  8 ++++++
>  drivers/media/platform/qcom/iris/iris_venc.c  | 28 ++++++++++++++++---
>  3 files changed, 44 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 4ce71a142508..c2258dfb2a8a 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -168,9 +168,12 @@ static int iris_hfi_gen2_session_set_property(struct iris_inst *inst, u32 packet
>  
>  static int iris_hfi_gen2_set_raw_resolution(struct iris_inst *inst, u32 plane)
>  {
> -	u32 resolution = inst->fmt_src->fmt.pix_mp.width << 16 |
> -		inst->fmt_src->fmt.pix_mp.height;
>  	u32 port = iris_hfi_gen2_get_port(inst, plane);
> +	u32 resolution, codec_align;
> +
> +	codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
> +	resolution = ALIGN(inst->enc_raw_width, codec_align) << 16 |
> +		ALIGN(inst->enc_raw_height, codec_align);

HFI_PROP_RAW_RESOLUTION interface expects actual YUV resolution. It is not
suppose to be aligned while configuring it to firmware.

>  
>  	return iris_hfi_gen2_session_set_property(inst,
>  						  HFI_PROP_RAW_RESOLUTION,
> @@ -195,8 +198,8 @@ static int iris_hfi_gen2_set_bitstream_resolution(struct iris_inst *inst, u32 pl
>  		payload_type = HFI_PAYLOAD_U32;
>  	} else {
>  		codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
> -		resolution = ALIGN(inst->fmt_dst->fmt.pix_mp.width, codec_align) << 16 |
> -			ALIGN(inst->fmt_dst->fmt.pix_mp.height, codec_align);
> +		resolution = ALIGN(inst->enc_bitstream_width, codec_align) << 16 |
> +			ALIGN(inst->enc_bitstream_height, codec_align);

Do we really need *bitstream variable here ? What is the concern in using the
instance capture fmt height and width ?

>  		inst_hfi_gen2->dst_subcr_params.bitstream_resolution = resolution;
>  		payload_type = HFI_PAYLOAD_32_PACKED;
>  	}
> @@ -216,8 +219,11 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
>  	u32 port = iris_hfi_gen2_get_port(inst, plane);
>  	u32 bottom_offset, right_offset;
>  	u32 left_offset, top_offset;
> +	u32 codec_align;
>  	u32 payload[2];
>  
> +	codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
> +
>  	if (inst->domain == DECODER) {
>  		if (V4L2_TYPE_IS_OUTPUT(plane)) {
>  			bottom_offset = (inst->fmt_src->fmt.pix_mp.height - inst->crop.height);
> @@ -231,8 +237,8 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
>  			top_offset = inst->compose.top;
>  		}
>  	} else {
> -		bottom_offset = (inst->fmt_src->fmt.pix_mp.height - inst->crop.height);
> -		right_offset = (inst->fmt_src->fmt.pix_mp.width - inst->crop.width);
> +		bottom_offset = (ALIGN(inst->enc_raw_height, codec_align) - inst->enc_raw_height);
> +		right_offset = (ALIGN(inst->enc_raw_width, codec_align) - inst->enc_raw_width);

I would suggest as below:
S_FMT (output) -> Keep the driver fmt same as what client sets in s_fmt.
So crop setting here could be "inst->fmt_src->fmt.pix_mp.height - inst->crop.height"

without the need of additional variable ?

Could you fix s_fmt and other places and run through compliance/ffmpeg to see it
works well ?

Regards,
Vikash

