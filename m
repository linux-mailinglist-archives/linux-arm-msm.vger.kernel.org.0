Return-Path: <linux-arm-msm+bounces-84149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 411DDC9DBE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 05:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1BA714E0244
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 04:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5EA2741B6;
	Wed,  3 Dec 2025 04:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZKVTn4ji";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OUZtkysL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F3B2749FE
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 04:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764736140; cv=none; b=WhLltDPNDoMDGy7nOTelb1U/yemWNk5nAIm5MJQ6R6fD9eEGUvHdoeeagq0mNFgqfCjQg7S6u0/eL3aojLw6zDC8s6F73J85R5G6QjDtk1pNzgNKjlSPKS6tNRgvPLBVMRFAB1EwmXTSiYlc9Y6ZpzuKMUu7LtETpMP8ak8GyqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764736140; c=relaxed/simple;
	bh=oRbEcIVNgp6kdKeZgYHatnKVbqvIZH8iYCVLe89adTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cipXkvY/sfO7OHV1QAyD5yjC3wNiB2ZKObgdAm3Gxsn7ofHGaBT1tqTJUK9XPjBygx1DX5gl8dQSMkNiEsRbrqh+5pN/DXKwfyqmZIY0PyiFCciCUonFxDcgqrsuJU7myyz0XOelXEV6otIyVyokV+VIrdVm2rfacD0lJONenMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZKVTn4ji; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OUZtkysL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2JMXZ5330609
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 04:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ytwgMZhYN8h1S8Ejyk86/SZe3w9e7WeFvjkgK8xE0bc=; b=ZKVTn4jiKxMXAlYR
	S7/BpDF0ZvOrf0i+EwAPiMxZv8MoioSEDs6zp4ToElL7ZJN6n6/F4eLxLZd+UmCG
	AOQr+LWF7ioyQ2hqLOIOG5gC1hkHhc32hHyQubtWOsmZKEMigbP1/mu3s4y3fBCo
	JOCHJvLgnbKdNfyh4BgAlOTNqU2t6NNZOXpfI69x/hFMD0++XkT7eHkR/Pa96s5j
	HQdF4K6V0Vy5pe4U+beOZG4cS6PrZW0pFCUhQ/pD7LNWTeEGZrMkjfGt5fMC5z/z
	LPUuDr6Tzpj7LzV6MEwjvJCnerj8XLaHxW4fz5KFSeG7K//uuf2EHrr7VZHSjFAp
	YFux7g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at67c1apc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 04:28:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-343806688cbso11950172a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 20:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764736136; x=1765340936; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ytwgMZhYN8h1S8Ejyk86/SZe3w9e7WeFvjkgK8xE0bc=;
        b=OUZtkysL9fkIgEg4JuqZtWsmqhlLXcnrDafdnsA0FYwtx2+lZefOObEyGiio17Fv70
         L9VGtXQV2hiVsRuFALYAaHhXHsq482uaJ0RJdM66gKqjObPKPXllWEcB4njZfD9MGU46
         XefKsTTMKJk9t7ueYE/0sUWppL8GSFav1fnPL/Yp6tp3mYocXbldjIWFVGhmK4p5WJh0
         ldAfXqW5HRFN5hb4xYKitmXMuInBPODv330YHJB9G/902hUMCmEw5sBr4r6orw0lm6sn
         SYejfj8Sx0rIMoLqhgddTfPmtpEKUm3kEnXKpWbeRJVz742ZE3/Q8ouNXtgomS/6HnTe
         CdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764736136; x=1765340936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ytwgMZhYN8h1S8Ejyk86/SZe3w9e7WeFvjkgK8xE0bc=;
        b=syU3X53fnGU+bICKiVvdzo/PX3s2g/BsJy+WeoRTZ5Cu47U+VaaEbFUrh1P78caerB
         XTm3Hg+YLMYSwZ4lK3ZxKOQrPfCmumPRoHrw+57S979rC0pU7uJHEo87v+hOO7gltL4G
         J9JWPnpv6UTYqcfScYSQJeyt5nydHYEbYJBmHOTr2wGNO6D6vEFsCBgJlizFWs7JE3cH
         2svORUH9dmSRi0t+PZj7kgZtn62g2eRdfKmCJPjHusjzEWnLR+yylFwbDHymNcGtcOk6
         AsyvyGZJJHHWuL9r3qz9uHwXxLNJTsq/9Zgrj5uayATy92p1ZfdrimUieE3/xK9iQ89F
         KKpg==
X-Forwarded-Encrypted: i=1; AJvYcCXOTWh0/TsPmA2UPMJmSV7i8AJXzlkwI6ZIAJ011b7ku7I9M6XnA/nUak/INJfnpnCiOEqKAcfN6R0ESWbv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2I3bYf6d/RiKFx8SITCIl0MqzBE2S4yTFc1ywrXj1JYv7oZSE
	CQ93zzYLYmpo4FcJIuf0QNw0+BT3hCMhSQ0bWJ8YDWqBKGHboLTt2LKJTEF9rlkBTl9v6l8q5Sc
	45S+A0TR+Xd9VbFVYvy4DyOL298lDn39HID4IaansxZMVi1o47LMMtrjcITyq23y+TyB7
X-Gm-Gg: ASbGncsBZq20Mi2RqAxhGKeAVllmghXNhgg/uACZ2/hmMA1LOBZbHNdq57GbPl2uyEH
	c45FDt3Z9vYCq0qLPmUFp0k+eCHPRfVB3gB74k6OqRrExYUP1bwuczMeC6FEtvkEtxVJMLJjt+W
	KHtSrvou/N0IbxjRI4j7LFdg+ElnkfP2jL/041WCOK5IBrgZW2pwyGzv1Q9VEGtc5/mol1dfElJ
	oFgzkRqzf9mUSlnkNqm+XaFwkFFcqJYxZxTjTpLMCz3fWhSk9Zr5PQoNYqpT77s/oGRwfc7081s
	LvJnN4fScRSWam6JBOjo+fZjPiyXD4akXycxkAodCKieAoZ0idrpZKOCTgwzDK37U+RPQPhexq9
	6lky4CW88DEdwBoxBplv2kZdClV2IpCZFnJGlnyDhjg==
X-Received: by 2002:a17:90b:5143:b0:340:bb51:17eb with SMTP id 98e67ed59e1d1-34912607f64mr1252785a91.15.1764736135891;
        Tue, 02 Dec 2025 20:28:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwx3dQOPn7uxPtNDmZvLbp74kT1q9MGub+BZ18moeO+R8QXAIF1z+wtqyP35cD7r3A1gURLQ==
X-Received: by 2002:a17:90b:5143:b0:340:bb51:17eb with SMTP id 98e67ed59e1d1-34912607f64mr1252743a91.15.1764736135341;
        Tue, 02 Dec 2025 20:28:55 -0800 (PST)
Received: from [10.0.0.3] ([106.222.234.106])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34912d175bdsm254867a91.11.2025.12.02.20.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 20:28:54 -0800 (PST)
Message-ID: <747f661f-1be3-59d3-0cec-71bb6a6e2fa6@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 09:58:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/4] media: qcom: iris: Add intra refresh support for gen1
 encoder
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251127-batch2_iris_encoder_enhancements-v1-0-5ea78e2de2ae@oss.qualcomm.com>
 <20251127-batch2_iris_encoder_enhancements-v1-1-5ea78e2de2ae@oss.qualcomm.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251127-batch2_iris_encoder_enhancements-v1-1-5ea78e2de2ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HQ0_Mk9GnOCfKwcmxIHEhDzHRtCkbcjm
X-Authority-Analysis: v=2.4 cv=W/c1lBWk c=1 sm=1 tr=0 ts=692fbc89 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fQrT7HkFwVlTC8MbpnvDjA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=4WFqAtl7KJYln3AVwwUA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: HQ0_Mk9GnOCfKwcmxIHEhDzHRtCkbcjm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDAzMiBTYWx0ZWRfXz7XEajTfDkHu
 FH3aMK0CSknrxlw5Y2hPx9BHWQ/Mntr17kddnzzaRsSBwmkWciWmY86T1LmV/yccUJcPhciyq7P
 shx9qW+aHuaG70Ecye9a5JpkFQbH+2024U5WYcrt4eKill1wR+k1uTJ/5Xr+vPuHvH1lNBOQdM4
 Cu4JG86cb9XnnXbc6TSFlRqDw9buqwXjgKy7OwIuc+XNLkGvYzCGYBfMY7HJOIst4J8nmISkDw7
 FgIpsjMOej+F8XES24D1nwu9v+zwe/HruSB9U0347osMDnpIAbsyTJJ3V2lBaiUaZL5NJPhrfc3
 sN8ckxn2qo7232rpDsgFIa0QNohdbx+/O4dEqxMVphH5ByCpmYrvb/aGohpecHNVFWiYgEb4HCm
 rzHLc5m7/hUnwDYbMFyQytamOYYl4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030032



On 11/27/2025 1:14 PM, Wangao Wang wrote:
> Add support for intra refresh configuration on gen1 encoder by enabling
> V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD and
> V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE controls.
> 
> Key changes:
> Added intra refresh capability for gen1 encoder.
> Implemented handler for intra refresh period and type.
> Defined HFI property and structure for gen1.
> Renamed iris_set_ir_period_gen2() for gen2 to keep implementation separate.

No need to explain the code in commit text.

> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 36 +++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  3 +-
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  8 +++++
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 13 ++++++++
>  .../media/platform/qcom/iris/iris_platform_gen1.c  | 19 ++++++++++++
>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  2 +-
>  6 files changed, 78 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 1910aa31a9b9218e9423f2916aa40b85185f0dfb..cdf38c285b9133f20bdb9bc3dd0f5e916d3ed7f8 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -962,7 +962,41 @@ int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  					     &hfi_val, sizeof(u32));
>  }
>  
> -int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +int iris_set_ir_period_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	struct v4l2_pix_format_mplane *fmt = &inst->fmt_dst->fmt.pix_mp;
> +	u32 ir_period = inst->fw_caps[cap_id].value;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	struct hfi_intra_refresh hfi_val;
> +
> +	if (!ir_period)
> +		return -EINVAL;
> +
> +	if (inst->fw_caps[IR_TYPE].value ==
> +			V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM) {
> +		hfi_val.mode = HFI_INTRA_REFRESH_RANDOM;
> +	} else if (inst->fw_caps[IR_TYPE].value ==
> +			V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC) {
> +		hfi_val.mode = HFI_INTRA_REFRESH_CYCLIC;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	hfi_val.mbs = fmt->width * fmt->height;
> +	hfi_val.mbs /= 16 * 16;
> +	if (hfi_val.mbs % ir_period)
> +		hfi_val.mbs++;
> +	hfi_val.mbs /= ir_period;

Can we have some comment here to explain what is this calculation for?

> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_STRUCTURE,
> +					     &hfi_val, sizeof(hfi_val));
> +}
> +
> +int iris_set_ir_period_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>  	struct vb2_queue *q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index 9518803577bc39f5c1339a49878dd0c3e8f510ad..a0d5338bdc910bd30407132e8b700c333ad74e4c 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -34,7 +34,8 @@ int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>  int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> -int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_ir_period_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_ir_period_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_properties(struct iris_inst *inst, u32 plane);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 52da7ef7bab08fb1cb2ac804ccc6e3c7f9677890..4d9632ba86bc8f629cee6d726eb44efcdeba2475 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -685,6 +685,14 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
>  		packet->shdr.hdr.size += sizeof(u32) + sizeof(*plane_actual_info);
>  		break;
>  	}
> +	case HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH: {
> +		struct hfi_intra_refresh *in = pdata, *intra_refresh = prop_data;
> +
> +		intra_refresh->mode = in->mode;
> +		intra_refresh->mbs = in->mbs;
> +		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_refresh);
> +		break;
> +	}
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> index 42226ccee3d9b9eb5f793c3be127acd8afad2138..04c79ee0463d7f32a2042044fe4564718cc01561 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> @@ -139,6 +139,14 @@
>  #define HFI_PROPERTY_PARAM_VENC_H264_DEBLOCK_CONTROL		0x2005003
>  #define HFI_PROPERTY_PARAM_VENC_RATE_CONTROL			0x2005004
>  #define HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2		0x2005009
> +
> +#define HFI_INTRA_REFRESH_NONE			0x1
> +#define HFI_INTRA_REFRESH_CYCLIC		0x2
> +#define HFI_INTRA_REFRESH_ADAPTIVE		0x3
> +#define HFI_INTRA_REFRESH_CYCLIC_ADAPTIVE	0x4

HFI_INTRA_REFRESH_ADAPTIVE and HFI_INTRA_REFRESH_CYCLIC_ADAPTIVE are not
being used, do we need these macros here?

> +#define HFI_INTRA_REFRESH_RANDOM		0x5
> +
> +#define HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH			0x200500d
>  #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES		0x2005020
>  #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
>  #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
> @@ -447,6 +455,11 @@ struct hfi_framerate {
>  	u32 framerate;
>  };
>  
> +struct hfi_intra_refresh {
> +	u32 mode;
> +	u32 mbs;
> +};
> +
>  struct hfi_event_data {
>  	u32 error;
>  	u32 height;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> index 34cbeb8f52e248b6aec3e0ee911e14d50df07cce..e7645bd60eb46785e0110a34f3257f7c37bbfca5 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> @@ -230,6 +230,25 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
>  		.flags = CAP_FLAG_OUTPUT_PORT,
>  		.set = iris_set_qp_range,
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

is this value correct? please recheck.

Thanks,
Dikshita

> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_ir_period_gen1,
> +	},
>  };
>  
>  static struct platform_inst_caps platform_inst_cap_sm8250 = {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index a2025d32b3235aaff25793ba77db143000e54bae..b3425dcea22ceadbd56021e5859a24134100d5df 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -635,7 +635,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>  		.value = 0,
>  		.flags = CAP_FLAG_OUTPUT_PORT |
>  			CAP_FLAG_DYNAMIC_ALLOWED,
> -		.set = iris_set_ir_period,
> +		.set = iris_set_ir_period_gen2,
>  	},
>  };
>  
> 

