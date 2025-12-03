Return-Path: <linux-arm-msm+bounces-84151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7EDC9DEC4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 07:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 33AE14E0244
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 06:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59AD7283CB1;
	Wed,  3 Dec 2025 06:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VDOAj9sT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JntVLmxP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A92279DC0
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 06:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764743355; cv=none; b=ka0fw0ibgoNKczbUOGVtFWMEgH5McJsrm7zJcJMoyfhobV65VEfzTU9PEnmhdjd9qAfVWWgCT5954GJ7eC/iY0LpcIhijimHmxp4UqUZUdg7MkSikJIdvt/68dX3Sl6dMtqsIarmyYpsF0GNiWiMQteZbbUV5tfKNpdo/opioYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764743355; c=relaxed/simple;
	bh=yd59UdZu7nMnSNsFIR4X08AmzWaXRk2sXEz6DF3qQ5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d0GIvwAP0tqS3O7aR9BgtRf5ykDCDLPq7p8JkYAnt1lOasPzQzyQIIG+lLR2d51oLbW6bMJ/GHVjLQ0QxnRZQkVDDxB2A/YziDo9RNUpeyn3MtVc8N45pi11F8ytzpqU051NXtlCaDQ0Uu5X9gmOGxvMrPHXLE4fBJIkSZ5a8Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VDOAj9sT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JntVLmxP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B31W4jt805887
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 06:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cptKAliVv/0+Lj/32SV7fc+dDymOk4+RacGORkxeQ58=; b=VDOAj9sTLxdorVV7
	6tn+QlCBgm4UunAr143nvLXRjHftKWXXuUOVGkAfAybeHDIVQPnDY3mUIw5oPmJP
	Vp0AEfcqqG9kfoepTBhOXwx4faLytK03g8gw1Ncj+7usecniSfX8Z2vfpYgtadOH
	WN08GB25KPuYIKJWLBf4iLZvo3KYaPmTidkyRSCuHqSTJejMCpt1mlFJzbGlFRl0
	YLl2dOGBQLfzQmzCo3TuGs+MOVSlKMoZ0Andeuh/OOEHwDWnRiQGx1FiqV1/lHSb
	CLWF0BefA+L9Mt25SdJtP2jMDU6JUPES6wJRAx3vJ3Q/Xks/RSaCR9s2r3AWXWBU
	r+FOkw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atbmmgswn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 06:29:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7be94e1a073so10900779b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 22:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764743352; x=1765348152; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cptKAliVv/0+Lj/32SV7fc+dDymOk4+RacGORkxeQ58=;
        b=JntVLmxPFhHRWZ5Mv5Wid25APtU/H1q4r7FC8GHhq0T5nBiDC2NpU3hATJzXLRr0yC
         BtD1RyN7gs3GbquIiKkthlxVgt5SyQG+MF8PAWlInpQYrqCHnTYDvAR0XUkm1VmAwoHu
         o1T+0vbOYw5efIPI9QDRIxzNYqYEdoQsHhw3NogwTtScKHvOelH9JZjZGCANxcMvvKBG
         qITRj+1t1mwP4z6wUC2DmROqG4l32iWz+hSu9I0ls97QzM8dJU6He4mBYzvdvLbE/QFj
         bFaoqC48tm0RrUtly+EBH4963cYwGjM8Y8ZFGT8caNGV7c2/GQyGQ3qfZJATPrla1EIV
         UkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764743352; x=1765348152;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cptKAliVv/0+Lj/32SV7fc+dDymOk4+RacGORkxeQ58=;
        b=TVOGhKUGvmm2PS04z6HRtOj5NR5RVm00i3tKkbV9b3C7QeoERoldGZSVpR97iaBpps
         dF8ZQvIWSsXGs6lvlxmVj1DEEl3UuWZkYMSQNwsHzVXrXkHO0oaAcpxrLWr8UD5y8APk
         Vz2avJlsguKfRXyIeuelfxMmTYV4PQsw6RyjguiKoA9SpAWkvNrFQkXfQxGyFKJXTUFM
         3uOrwJ3fXHHJjHJoHvOrkglclTxGzlet6OTj0bS7Le2VRLIu/cNNSTRf4teWbXCGsnqt
         RPqIFi0hgBADjQDzS+B0p/E78mYvf2HvWJqN9SHCQrvP1vMzqzueeAv7RF2fd5hEjcUs
         Y8EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeKSuYWc9nF7WpDgiheqdtC9vzl7sRRoJW6mdSejkrHsVqG1extcPCMXvDa9zhhhN6OTcvdKEqBV69vJz0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx48nnhAhNxhT71zoEwj6mMdHakHEKw6fQGYI9YDdcfeOz9YvNG
	WtqArPLuUR12r3HIfbSmH7rkM8aqK+tEUOwDE/txs/iehWN7jxyH+9qpgiHG/va+yQ0QdY+zxIa
	DeQcr1C+DPDoxqf/IPtd3sNW96ZPU2lMEpZSJHR+wVkLtSUDdtMUI8GrpymjnJ1QcmL5d
X-Gm-Gg: ASbGnctxLSOVTUTcUr3Simn8g4L/9QbhpweYY5Yne1wVFSW1ESPrGTKN6w5YrOEQyy+
	DDUgLVI1Wx/fgqQ16oz3cYgQPqCWteWdoi9BK7jKerB9vmRCtM1oYAM3BHRlZdmvory39r2hqjy
	YAOPsobKLqWA3zP6WmwxwOZKES+ElJ64TNfCIeNP72reDDAKOThJYkhlkUbROus309er9OcNyL0
	Kl4EYVHhTMnalCKbYFlkqs5eLUfHLy9gya9YCKEGrsln9YWc6rCF49GcAmJoMrqTL0My0JGldGd
	F7K06qqcsVMY6UVXssXARHI1W5ot9+FV/XuaXASftztrR1k/H4q6t3pI2IMiib/NsGJGl6sZXZM
	K2mdx3i2AIDYMc4qy304oAW2LuZz+31u2DLBcNyi+qA==
X-Received: by 2002:a05:6a00:1396:b0:7b8:e02d:d5b1 with SMTP id d2e1a72fcca58-7e00dfd6eeemr1667267b3a.16.1764743352192;
        Tue, 02 Dec 2025 22:29:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgpUjA4cT6E6ZwCjddxuf4bSfPxgNYa/BJnCqIjWNFUo8uv1GmObTpn44n/hgM2axz73z4bw==
X-Received: by 2002:a05:6a00:1396:b0:7b8:e02d:d5b1 with SMTP id d2e1a72fcca58-7e00dfd6eeemr1667242b3a.16.1764743351624;
        Tue, 02 Dec 2025 22:29:11 -0800 (PST)
Received: from [10.0.0.3] ([106.222.234.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d5513a6e61sm13379473b3a.10.2025.12.02.22.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 22:29:11 -0800 (PST)
Message-ID: <4ee90f4d-757e-7382-e03d-7e43e7b4ee65@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 11:59:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/4] media: qcom: iris: Add Long-Term Reference support
 for encoder
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251127-batch2_iris_encoder_enhancements-v1-0-5ea78e2de2ae@oss.qualcomm.com>
 <20251127-batch2_iris_encoder_enhancements-v1-2-5ea78e2de2ae@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251127-batch2_iris_encoder_enhancements-v1-2-5ea78e2de2ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gWJuQwrPAhVpwM5qUggyDtaGHMfM9jcr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA0OSBTYWx0ZWRfX8PoT8Z69m6Yd
 ZEhEod5UJciqian5suLXN/NU/0+iiRZjVAWeQH7Z3PtD+l3nDWt46Y6n2FqEx3J0LEOeJFrwEsc
 Uzn6nhCCRqQzqCnr3Q4lgRIQ1s4I6XxYzWmpTndgr+vchrQ8VbTJful471MqQQdGdHX3n7XEFbP
 7PzVRwHgmf8B2rCNqYHTHOX+Hezo5RCfJyUwbHlAgk/IFu0+SmlUkCm0C5KD7pQJASESFN2QzNA
 i48r5PGnHcwooT1fOD0Vi+CLbIQpB6YRJaoL0FNje2N7pvZjhpfwXxpnHHzDiR6wnCvzUU5qoXC
 VNu/nCiAwq0NpEQIeGy9ONVJIo0Eh/VaiEw3bT8EnQFpXc9mInufwGrt50bLzVAS8FV42p9sghQ
 z7kC/jAev1vcJhfEg4CSsK+r0JhdXQ==
X-Proofpoint-ORIG-GUID: gWJuQwrPAhVpwM5qUggyDtaGHMfM9jcr
X-Authority-Analysis: v=2.4 cv=ApjjHe9P c=1 sm=1 tr=0 ts=692fd8b8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fQrT7HkFwVlTC8MbpnvDjA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=24HQHIkan-lcwZaw3N0A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030049



On 11/27/2025 1:14 PM, Wangao Wang wrote:
> Add Long-Term Reference(LTR) frame support for both gen1 and gen2
> encoders by enabling the following V4L2 controls:
> V4L2_CID_MPEG_VIDEO_LTR_COUNT
> V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES
> V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX
> 
> Key changes:
> Added LTR capability IDs and V4L2 controls.
> Implemented handlers for LTR count, use, and mark (gen1/gen2).
> Defined new HFI properties and structures for LTR.
> Updated platform capability tables and buffer size calculations.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 126 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |   5 +
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  25 ++++
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  24 ++++
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   3 +
>  .../platform/qcom/iris/iris_platform_common.h      |   6 +
>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  30 +++++
>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  30 +++++
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  33 ++++--
>  9 files changed, 270 insertions(+), 12 deletions(-)
> 

>  static struct platform_inst_caps platform_inst_cap_sm8550 = {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index 1e54ace966c74956208d88f06837b97b1fd48e17..8139fefe40fe179ff7862bbca879ce94c71c1f89 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -668,6 +668,19 @@ static u32 iris_vpu_enc_bin_size(struct iris_inst *inst)
>  				  num_vpp_pipes, inst->hfi_rc_type);
>  }
>  
> +static inline u32 hfi_buffer_get_recon_count(struct iris_inst *inst)
> +{
> +	u32 num_ref = 1;
> +	u32 ltr_count;
> +
> +	ltr_count = inst->fw_caps[LTR_COUNT].value;
> +
> +	if (ltr_count)
> +		num_ref = num_ref + ltr_count;
> +
> +	return num_ref + 1;
> +}

Here you are always returning num_ref+1 which might break
iris_vpu_enc_scratch2_size calculation since you are using this as common
API for calculating ref buffers. Please recheck.

> +
>  static inline
>  u32 hfi_buffer_comv_enc(u32 frame_width, u32 frame_height, u32 lcu_size,
>  			u32 num_recon, u32 standard)
> @@ -693,17 +706,14 @@ static u32 iris_vpu_enc_comv_size(struct iris_inst *inst)
>  {
>  	u32 height = iris_vpu_enc_get_bitstream_height(inst);
>  	u32 width = iris_vpu_enc_get_bitstream_width(inst);
> -	u32 num_recon = 1;
> -	u32 lcu_size = 16;
> +	u32 num_recon = hfi_buffer_get_recon_count(inst);
> +	u32 standard, lcu_size;
>  
> -	if (inst->codec == V4L2_PIX_FMT_HEVC) {
> -		lcu_size = 32;
> -		return hfi_buffer_comv_enc(width, height, lcu_size,
> -					   num_recon + 1, HFI_CODEC_ENCODE_HEVC);
> -	}
> +	standard = (inst->codec == V4L2_PIX_FMT_HEVC) ?
> +		   HFI_CODEC_ENCODE_HEVC : HFI_CODEC_ENCODE_AVC;
> +	lcu_size = (inst->codec == V4L2_PIX_FMT_HEVC) ? 32 : 16;

these code optimization is not in the scope of this change. pls have in a
spearate patch if needed.

Thanks,
Dikshita
>  
> -	return hfi_buffer_comv_enc(width, height, lcu_size,
> -				   num_recon + 1, HFI_CODEC_ENCODE_AVC);
> +	return hfi_buffer_comv_enc(width, height, lcu_size, num_recon, standard);
>  }
>  
>  static inline
> @@ -1402,10 +1412,9 @@ static u32 iris_vpu_enc_scratch2_size(struct iris_inst *inst)
>  {
>  	u32 frame_height = iris_vpu_enc_get_bitstream_height(inst);
>  	u32 frame_width = iris_vpu_enc_get_bitstream_width(inst);
> -	u32 num_ref = 1;
> +	u32 num_ref = hfi_buffer_get_recon_count(inst);
>  
> -	return hfi_buffer_scratch2_enc(frame_width, frame_height, num_ref,
> -				       false);
> +	return hfi_buffer_scratch2_enc(frame_width, frame_height, num_ref, false);
>  }
>  
>  static u32 iris_vpu_enc_vpss_size(struct iris_inst *inst)
> 

