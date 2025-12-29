Return-Path: <linux-arm-msm+bounces-86794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 93338CE60B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 07:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 01C47300E048
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 06:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D852D063E;
	Mon, 29 Dec 2025 06:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dE5lc5aM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GRtmQYyN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B303A1E8A
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766990621; cv=none; b=sEBMLrHzoTno3bbSziAXXl8kSLkV3D/IUmut4vWEvZzCoMqmUMjxKgBUBV1h+m/APzODdZICtFaeRwLXlRufVzEthwkc7AAM1s5R2cedUeRuI2gJJtv8/EBds1stGdpJfSSXPXWwJOSJpLGdMwY0QpyW8jrPlsQnrXBSIRJZtNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766990621; c=relaxed/simple;
	bh=Pk83VFyfLosOVAPNAYdOGSdoQm1hQVRbdJq0lK8csHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tSbJSA53LIdt7A0p2ShImDJNZxCCOM/0dUdTNXHW0AVLRSsfs3OoE0BYrze4v8F1TKyZabk93+L8S42Znb9svqpQ+FDQjtiwDkhh4UeZ8b2HZSIogaXgpP+JevpFPBlucyXW0DD+0bObA9Ord0WZiHZ72wMvBBAr1vjJRg/N3AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dE5lc5aM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GRtmQYyN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSKKEOK3751745
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yIFMBfLvglCowVKq7o3uAHbalZ9Llk0yLVkKcJwBL/k=; b=dE5lc5aMgPO9HIEr
	lt5HzEy6M60UrUyzLvaSEI7AWK4+dcIB+07kbkKRPdGhWJwKdxqt9vP4Y5F3aJE0
	Ebt5eSbt/hlTz5m1VK2No3pGqayeSt4LUntf6kZmfF4WJ0dmw6YRlDzTDAQgU7LX
	yk1VptHHKsdLR4WbOQAfkI2ZMFzfRgh4Rto4gXvRur+Z3zk8R6HQrZ5BYDHQS50E
	tHmNYFUrDCZXZte/otOmEgS6W5eiDQexrUtfYPE7EhToY97YmJ9kmZlADrLg3hgz
	GonEYLw26dI7uDThKMN22h+ZKacugeHvrtEfr6k6XJLQ1ir9tKoVfck1pATAC6S3
	qsw+sQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba87buk58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:43:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a090819ed1so73601385ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 22:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766990618; x=1767595418; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yIFMBfLvglCowVKq7o3uAHbalZ9Llk0yLVkKcJwBL/k=;
        b=GRtmQYyNFwxtbDHMM6z7diH6kc2k3SSSNdYilAKF5dCCfbxeR3SBoOAXktErY9SEaj
         kDQhOMDqZe7LMwNRRfR6Plg+YXPX0cMnbA8reLwJREdlTrugW61WE2oED3wEhbzL3sgZ
         Vd8/XLONTpOrXgT/7iJbZ74G/be3zdx3vfHmeX1canaR/EzM5WtrHyRiZi5P3AxFfvcC
         URr9/NMXUqjk71Uzqs5ZOUFBthavxi0F1SJnYqbZUbCh0eZl+we01WpVbWOTM1CkAXUJ
         TEdMCE/IFodN5BNxG0gwNyfOGl9I/B70Qjn77qdz+lcrsNZOHcLQx6jYPznCCCxRcxDh
         6JVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766990618; x=1767595418;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yIFMBfLvglCowVKq7o3uAHbalZ9Llk0yLVkKcJwBL/k=;
        b=YZaqL8dscK3UONaOi8DIhtvGWndb2L/3D1/Bwg54ox71dx+04MhO5OSSM+ueW0hiTB
         TJCt43/fU9sg508wvNQhmzUG8MX/7+UHLxrULvongMpKA7gZY1/J6gn8vIXwj5327kvW
         wLUh4GZfv+PubzEHwF1Fs6XzUxW9AjeWnsuhFi3mDni47FQEIdf6RJMPKvSO8mZkiZ+f
         QLB+HXuAfaJfjP9f0fqJnBT/CdQuE75JH8TqWMXEZjaA3RJZviSzrecgTZxTjQUijc3p
         OAKsN5RdC9uRsaA+ZwrhJQFpfFgom7rjOHHBOYepJKvSnnEfhj28tELy4fBrrhGQfLzw
         ZsAw==
X-Forwarded-Encrypted: i=1; AJvYcCUlHnC8lkP8vqQWKHmaLUmw+p6eBeZgwiVWJYszM8C0apyxADL4YKQKIbx7j6Jk/0tRGjgd4i5V8z9NALsL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw31VLSxJ5BUmHvk8M9Hn9OACdhuWucb4o12y0B0lzAS8fVhZJX
	CYWtVpHlv1ftHY5P/O9UOJKmw/6D6SwppjTC3SXCpjXT6oNxYida+s02rZI6Mt1rV9cF3NbmF9H
	kOeNqnYNeau+7SmHpCIznwN/WfrE8Oa57YVotq6sBMXhAxf+VDbR7sQJvJguAcqluwMB9
X-Gm-Gg: AY/fxX7C9b1Jb7GaZz1eWvpPFbVHPgDMWQfgtwMdlu5HoMwx/QAfLATIou0HDPsj9Gq
	wMe+DGNIntW7eec4ojO8QCJfwJgo5TQ3yzni3qgAV0hnwTJl2mtcI90LDhAauVndZv8EZhI3aKE
	XRH8fuML1q7DiEfxAo9ndbfu0LfcVvhw2qz84+a9UWQw8I+57JVXwYlO/Rh4zNfqUX2ht6bfQFG
	ByoZ7L5WW87sVsYfzbVOYrpyuVrEl07Twz716qBPo5znAnEHP9oFAOEdVl+CTqa6qVjsECcmNgb
	otx6iWhA6PZB7hDg6y5fFFDg+bYB949B/g1MPHd6sryAeYuu5wuP1GeLWIxkokrdceAEe9CY1vS
	MR2egRUGJe9Eer28kIf6JHpIsQc+U9mWQ26O/oSvtXQ==
X-Received: by 2002:a17:902:e541:b0:29f:1bf:6424 with SMTP id d9443c01a7336-2a2f221ff92mr299318225ad.18.1766990617481;
        Sun, 28 Dec 2025 22:43:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3qvbxTL8oq9r9+JD9YIow7mGQ9o/rrWV/hiZyiwEgIfqpefaKN6TNr8mwED6wIgfD8IT7oQ==
X-Received: by 2002:a17:902:e541:b0:29f:1bf:6424 with SMTP id d9443c01a7336-2a2f221ff92mr299317995ad.18.1766990616934;
        Sun, 28 Dec 2025 22:43:36 -0800 (PST)
Received: from [10.0.0.3] ([106.222.235.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c82bbesm267466575ad.35.2025.12.28.22.43.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 22:43:36 -0800 (PST)
Message-ID: <a2debdb8-0dcf-c07d-db18-852395546b78@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 12:13:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/6] media: qcom: iris: Add intra refresh support for
 gen1 encoder
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251219-batch2_iris_encoder_enhancements-v2-0-371f7fe24801@oss.qualcomm.com>
 <20251219-batch2_iris_encoder_enhancements-v2-1-371f7fe24801@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251219-batch2_iris_encoder_enhancements-v2-1-371f7fe24801@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _-PWXcKquTyvSkKV53CeKZ7JrtEPxbtL
X-Proofpoint-GUID: _-PWXcKquTyvSkKV53CeKZ7JrtEPxbtL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA2MCBTYWx0ZWRfXwW1SrZhH8Ho5
 KuZomyR3QGxfsY7dwldqfqBHjOdFYmEeTkB1I3GdJNFmD1+JYyZiMDrSD30pnKQRWFfEYpMahBf
 a+mmGEbsJ9OPKVUFxzrRRi2GWb47bFj4GOacx8ApgOUERQ8gorV8Y61UU04yb8YiwUFDBptE6pt
 aa79/32I2zh0vsZuimM144Ib5L00yroLkWDwdybQgeMo2yNijw8ldZtNEkyltBN6fLc2keESTeS
 bwHgo0PxBoxi5/MjkhflcUgsygoUddf8dGCAbkulh/Zwm7MTOUaZCih0XgDAptvNxt0sKusxeMS
 l38exlJvIuxqUyIvsItAziCFLlyTWhDNvjwG6JXQkgePa/l2yjsjsWJFhoR1TZ+R0GYI6TJmKsw
 w8h8ZJvA0EkjCI0qEoTLzEOCoIWbveo0BaSny+6z8FkGa/qUPjhnkr/AuyI4rDXBS/AOhYzj2fm
 8+thbNG6UyN7nJlrOAg==
X-Authority-Analysis: v=2.4 cv=do7Wylg4 c=1 sm=1 tr=0 ts=6952231a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IzfGebrgPFzWcUWWzKPHyQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=qJ1aOlWR8aN_MEtMHDIA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_02,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290060



On 12/19/2025 1:12 PM, Wangao Wang wrote:
> Add support for intra refresh configuration on gen1 encoder by enabling
> V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD and
> V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE controls.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 39 +++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  3 +-
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  8 +++++
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 13 ++++++++
>  .../media/platform/qcom/iris/iris_platform_gen1.c  | 19 +++++++++++
>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  4 +--
>  6 files changed, 82 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 1910aa31a9b9218e9423f2916aa40b85185f0dfb..eae4fedc929e980eb001a5a6625159958d53a3d1 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -962,7 +962,44 @@ int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  					     &hfi_val, sizeof(u32));
>  }
>  
> -int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +int iris_set_ir_period_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	struct v4l2_pix_format_mplane *fmt = &inst->fmt_dst->fmt.pix_mp;
> +	u32 codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
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
> +	/*
> +	 * Calculate the number of macroblocks in a frame,
> +	 * then determine how many macroblocks need to be
> +	 * refreshed within one ir_period.
> +	 */
> +	hfi_val.mbs = (fmt->width / codec_align) * (fmt->height / codec_align);
> +	hfi_val.mbs /= ir_period;
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
> index a2025d32b3235aaff25793ba77db143000e54bae..585f0aedc0eb5e80fd108929e1861101a7bab2be 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -630,12 +630,12 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>  	{
>  		.cap_id = IR_PERIOD,
>  		.min = 0,
> -		.max = INT_MAX,
> +		.max = ((4096 * 2304) >> 8),

INT_MAX is correct here. No need to change.
This change is needed in gen1 platform data to keep it same as venus driver.

Thanks,
Dikshita
>  		.step_or_mask = 1,
>  		.value = 0,
>  		.flags = CAP_FLAG_OUTPUT_PORT |
>  			CAP_FLAG_DYNAMIC_ALLOWED,
> -		.set = iris_set_ir_period,
> +		.set = iris_set_ir_period_gen2,
>  	},
>  };
>  
> 

