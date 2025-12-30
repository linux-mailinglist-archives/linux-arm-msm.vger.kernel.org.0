Return-Path: <linux-arm-msm+bounces-86908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EE3CE8BB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 06:47:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 66F9D300C364
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 05:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 199652D5C91;
	Tue, 30 Dec 2025 05:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b5LDw8Az";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QncZRnNg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA0F221545
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 05:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767073673; cv=none; b=cXgmEGTl/Ylx8Dv9rJLik1DFZv0fqMDuZM9VLHfgzIZ9JWCr1m0r8tEWPzREzukN6iBGg6JhupC1FsU2Cttx4LPm4ucvEY3ICZKGBUCPBmlvdVLMjeSj7s3B+m9e/L43eItunlvxjrxrIXGtq+Swg6QM9ZTa5jW05SZUMw24Qdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767073673; c=relaxed/simple;
	bh=NfJVYZHqL2GjqUM1gYbHfJnzSAZISiJYfElcxRNGEEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BdYAAuwYqeaUf8O6eBisXskQt6xoaIPwgp8W1Eh+5EM6+n0PfLrHfyL5LEzrT5DTulaaag3YJXPWpfwG0NWI8Ohwlz+DgvEHCGbIrElH0uueVL+r/CIivaDQiYPqWxbz75S4y/Bms4T+dXmFu9EoKo/HaYS6PDKk9SsKXGUor2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b5LDw8Az; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QncZRnNg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU3hgEQ2546965
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 05:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ChOOaZx7bKMSfqzBY50DzgXLmE1Kif7ro1TALjzZP28=; b=b5LDw8Az6NhpinD+
	s993iN2Kzb16OqxSCuBakk8BGiWy09pI2xuULmTW/Yr6AkdV5IeEq5dK7HfEon+3
	lca0VMOR5i+isc5jlp6UD0EhjpEn5pt3oOd94kmqBpGmwQo+v6ChPX8aRvzaTZk1
	ACb1Eg6ZFaHHjl1S5iuH+VQjhRMsIIWiOx4uIzHfMwOXpQmPuDt4fzR1fW/PHCK4
	Mv2xyR/1CQo7JQdY52lf3R2uNI72ZlhyaAtUIztbIQFvPFDh8FzFXQbBDrrZOSpo
	ZIdVnsI9PCPmD+lAIxu3PFqkMiIkXt2Zkm4/liyB11yWDAsd0OKyRUhhBSx4TDIv
	g710AQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc7398740-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 05:47:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34ec823527eso13285258a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 21:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767073668; x=1767678468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ChOOaZx7bKMSfqzBY50DzgXLmE1Kif7ro1TALjzZP28=;
        b=QncZRnNgM8muWAO6Yk7Xsp+0qOA27hb9E5Acg1MRUEAo+enCLHnQMqPdV2cdQORBtf
         IFF6ssxb7kVpZmrw1ebE4xMCuXxZHJ0fbciiEUUmU+stHmwbvj9bbktIvhOUHBV/Ktcm
         G3vSY3c4TxP6i/fxCjGZ+1Doci/3uwxhbrKdKBe8tzVwwAEPUIGVkxJxg+dWwTpzKd8f
         Z3Kgz+eKyqHUnoEifZmkMD1IXCkDbRJvaA/MNILmv8oB+jiZ3WjcTaYWdKrXSQtQDTmV
         F1RKSm+Wkxbgk+CQAmPuMXk/fHN8pUkXxqqJz4wOq9COVhVRZ0Bsrj4XKs7asWLJrruY
         5IZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767073668; x=1767678468;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ChOOaZx7bKMSfqzBY50DzgXLmE1Kif7ro1TALjzZP28=;
        b=KRzOFfuDlaV18I5A26AB/Lv/BPjBAHmEE0tukugzH7BlHTqvupyTt4pRyQxbVXZf9d
         HkL77OP/eMy5rIm84pHtCiTLlE4S9F/URggEJGoBAcJt/m5q/EKmIZccJU2eMgrkxqEn
         148t+wq80o3R0WwRHiGIzAZQUJ4mXANXF5/aVn1CipjBKz8Eqv0glkpQbvNz5jjTT0vr
         XgNv0w8e8bBryJEpFxyK1OYmcA1+7JC/60UbFD6NDqWmx5WOVmFvvEqOsKNrYLWu9arv
         qqLW1dv89nfIEGBnfvQTLhwC2winUExHPZ7KK/LHf4Tpx0zYAw0LUkvr0aLLPRy/ME4i
         qzHA==
X-Forwarded-Encrypted: i=1; AJvYcCWzsTJ94EkR3Me7uVsGSd+GLhBXAVzhQCD2GgmkAff8iUrGliEswkCqd+kgvDVHv8Co+4SmyoLDYnmU8wFx@vger.kernel.org
X-Gm-Message-State: AOJu0YwIZhhzEWEiHRS5EyIlPz7GuvBOPM7ZHKmngv+fA/Nylo+kQdV6
	tKgFaQteUWb8bzTYWqaNMDZA49AtacXJc3xst3RGHvdcde0k3Ng7rOf0mBszPaOq/RjzojUHRGv
	urWmLlsI4fm/VxTGdJAG6P7kRgBwDpmrbbbFDAtkDSbUbK/cC9zk2QiAPACPL8I1rL4FR
X-Gm-Gg: AY/fxX7kyw3HUhi2IDekAW3lI4L9rhtBRzKDoA6o4InkD9yTmg2MneF1iMbYw5EgB0/
	5SxYC68CjBX/uwALZ/1TD0KDEq1jKAqN2+GfHkmp9DZzbAcYt4adUDbay4e94h4eiIoVRM1h4uX
	HyU/EhL0k0LF5NJzx0SpoHDgBSCbm13PBrf2mR644i9N/PFguutEMc5Xd36fOP0odIXuiYnC+Cu
	iAGCvpx0CAJLIKkSLp1XajrJ730HVuH8o/zo+xCls/ZFtghBvHpJrzILKpjjZl1tHUUFgbv5V6V
	+4IHXfuYcxEH/pRtNDppWBI/jnqHSasQ5agqsmLiaodVvX7YAJfXqdtTOGsdsxa0U2yX7hyup+u
	RTWLN5ZM0TcwfygoVDzSHIPbh2eHtRauRufbTLqW5zA==
X-Received: by 2002:a05:6a20:9389:b0:342:fa4f:5849 with SMTP id adf61e73a8af0-376a95c0819mr27756756637.39.1767073668290;
        Mon, 29 Dec 2025 21:47:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZO+AOIu3PgnRLN1dANeXl85T8xeyk5msoeAx1WHNbLWl5yW3BGHpoPE2oO31807mxaadKPA==
X-Received: by 2002:a05:6a20:9389:b0:342:fa4f:5849 with SMTP id adf61e73a8af0-376a95c0819mr27756732637.39.1767073667738;
        Mon, 29 Dec 2025 21:47:47 -0800 (PST)
Received: from [10.0.0.3] ([106.222.235.175])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7961fbb9sm26790168a12.2.2025.12.29.21.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 21:47:47 -0800 (PST)
Message-ID: <d8313fee-3f42-49cc-ba24-865dd60110a2@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 11:17:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/6] media: qcom: iris: Add Long-Term Reference support
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
References: <20251219-batch2_iris_encoder_enhancements-v2-0-371f7fe24801@oss.qualcomm.com>
 <20251219-batch2_iris_encoder_enhancements-v2-2-371f7fe24801@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251219-batch2_iris_encoder_enhancements-v2-2-371f7fe24801@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Sn-HEStRdBZB5X7gxonACIAuI0BplAUB
X-Authority-Analysis: v=2.4 cv=HrV72kTS c=1 sm=1 tr=0 ts=69536785 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IzfGebrgPFzWcUWWzKPHyQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pMfPH_gjMZfusMAboDYA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA1MSBTYWx0ZWRfX1wQ+QjqBIEO5
 bJZpLeMwGJV5wTtUTqDOto1ZTPeQ8zgvhgIcUIq6XvnyGncMz7ey0UDivu/DK2c6OfCPGr6tVpV
 i/+td/MXxeUwfYl8Md+MzAxO4/1Nr2FxDR9fhMswo+NmgF35f4gixGKEKcaDUvCSxtXliIqzUC9
 2R3pn1H+yhrSYWIU133qtfHX1oc1xUCziKxQxkmXdTy8e9EEEm4TcHQy4toUNVWzABbINEOqyIa
 y4Av9hSAwU5M+b9dYI1sX1AEalXlhkXVtVq9A+RkM7OgQVmUHh5GB4Zn5s/GW3W0gJ+gB2wGozM
 J2bzbtR8oyV3ATzbpnADuY2hd0OlAugdabaP71w//1JvOeMZ/PXEfUQDNVgy34ewt28DJheqGwI
 RRXQuahGkeSGRRLrYcZKdAz40lRUDwMAQHpdj1KBoK7vpcwX6xIS8t3Axyt6mZI8pZHPoXDmmk5
 uLkq9zRzvVDktbgiFuQ==
X-Proofpoint-ORIG-GUID: Sn-HEStRdBZB5X7gxonACIAuI0BplAUB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300051



On 12/19/2025 1:12 PM, Wangao Wang wrote:
> Add Long-Term Reference(LTR) frame support for both gen1 and gen2
> encoders by enabling the following V4L2 controls:
> V4L2_CID_MPEG_VIDEO_LTR_COUNT
> V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES
> V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 128 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |   5 +
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  25 ++++
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  24 ++++
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   3 +
>  .../platform/qcom/iris/iris_platform_common.h      |   6 +
>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  30 +++++
>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  30 +++++
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  20 +++-
>  9 files changed, 267 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index eae4fedc929e980eb001a5a6625159958d53a3d1..428203af725ab5697ee42b5adf9557c65fafd7f4 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -108,6 +108,12 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>  		return IR_TYPE;
>  	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
>  		return IR_PERIOD;
> +	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:
> +		return LTR_COUNT;
> +	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:
> +		return USE_LTR;
> +	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
> +		return MARK_LTR;
>  	default:
>  		return INST_FW_CAP_MAX;
>  	}
> @@ -205,6 +211,12 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>  		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE;
>  	case IR_PERIOD:
>  		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD;
> +	case LTR_COUNT:
> +		return V4L2_CID_MPEG_VIDEO_LTR_COUNT;
> +	case USE_LTR:
> +		return V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES;
> +	case MARK_LTR:
> +		return V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX;
>  	default:
>  		return 0;
>  	}
> @@ -1025,6 +1037,122 @@ int iris_set_ir_period_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_ty
>  					     &ir_period, sizeof(u32));
>  }
>  
> +int iris_set_ltr_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	u32 ltr_count = inst->fw_caps[cap_id].value;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	struct hfi_ltr_mode ltr_mode;
> +
> +	if (!ltr_count)
> +		return -EINVAL;
> +
> +	ltr_mode.count = ltr_count;
> +	ltr_mode.mode = HFI_LTR_MODE_MANUAL;
> +	ltr_mode.trust_mode = 1;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_STRUCTURE,
> +					     &ltr_mode, sizeof(ltr_mode));
> +}
> +
> +int iris_set_use_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
> +	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
> +	u32 ltr_count = inst->fw_caps[LTR_COUNT].value;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	struct hfi_ltr_use ltr_use;
> +
> +	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq))
> +		return -EINVAL;
> +
> +	if (!ltr_count)
> +		return -EINVAL;
> +
> +	ltr_use.ref_ltr = inst->fw_caps[cap_id].value;
> +	ltr_use.use_constrnt = true;
> +	ltr_use.frames = 0;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_STRUCTURE,
> +					     &ltr_use, sizeof(ltr_use));
> +}
> +
> +int iris_set_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
> +	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
> +	u32 ltr_count = inst->fw_caps[LTR_COUNT].value;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	struct hfi_ltr_mark ltr_mark;
> +
> +	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq))
> +		return -EINVAL;
> +
> +	if (!ltr_count)
> +		return -EINVAL;
> +
> +	ltr_mark.mark_frame = inst->fw_caps[cap_id].value;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_STRUCTURE,
> +					     &ltr_mark, sizeof(ltr_mark));
> +}
> +
> +int iris_set_ltr_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	u32 ltr_count = inst->fw_caps[cap_id].value;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +
> +	if (!ltr_count)
> +		return -EINVAL;
> +
> +	if (inst->hfi_rc_type == HFI_RC_CBR_VFR ||
> +	    inst->hfi_rc_type == HFI_RC_CBR_CFR ||
> +	    inst->hfi_rc_type == HFI_RC_OFF) {
> +		inst->fw_caps[LTR_COUNT].value = 0;
> +		return -EINVAL;
> +	}
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32,
> +					     &ltr_count, sizeof(u32));
> +}
> +
> +int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
> +	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
> +	u32 ltr_count = inst->fw_caps[LTR_COUNT].value;
> +	u32 hfi_val = inst->fw_caps[cap_id].value;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +
> +	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq))
> +		return -EINVAL;
> +
> +	if (!ltr_count || hfi_val == INVALID_DEFAULT_MARK_OR_USE_LTR)
> +		return -EINVAL;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32,
> +					     &hfi_val, sizeof(u32));
> +}
> +
>  int iris_set_properties(struct iris_inst *inst, u32 plane)
>  {
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index a0d5338bdc910bd30407132e8b700c333ad74e4c..996c83fdc6f492dc252771129fc1d62e8b7a7e07 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -36,6 +36,11 @@ int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>  int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_ir_period_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_ir_period_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_ltr_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_ltr_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_use_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_properties(struct iris_inst *inst, u32 plane);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 4d9632ba86bc8f629cee6d726eb44efcdeba2475..139e7a9321d30d3e348671f99b0fa81afed4827e 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -693,6 +693,31 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
>  		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_refresh);
>  		break;
>  	}
> +	case HFI_PROPERTY_PARAM_VENC_LTRMODE: {
> +		struct hfi_ltr_mode *in = pdata, *ltr_mode = prop_data;
> +
> +		ltr_mode->mode = in->mode;
> +		ltr_mode->count = in->count;
> +		ltr_mode->trust_mode = in->trust_mode;
> +		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mode);
> +		break;
> +	}
> +	case HFI_PROPERTY_CONFIG_VENC_USELTRFRAME: {
> +		struct hfi_ltr_use *in = pdata, *ltr_use = prop_data;
> +
> +		ltr_use->frames = in->frames;
> +		ltr_use->ref_ltr = in->ref_ltr;
> +		ltr_use->use_constrnt = in->use_constrnt;
> +		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_use);
> +		break;
> +	}
> +	case HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME: {
> +		struct hfi_ltr_mark *in = pdata, *ltr_mark = prop_data;
> +
> +		ltr_mark->mark_frame = in->mark_frame;
> +		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mark);
> +		break;
> +	}
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> index 04c79ee0463d7f32a2042044fe4564718cc01561..34249fc0d047918c2463517b8303e30df3666b97 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> @@ -147,8 +147,16 @@
>  #define HFI_INTRA_REFRESH_RANDOM		0x5
>  
>  #define HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH			0x200500d
> +
> +#define HFI_LTR_MODE_DISABLE			0x0
> +#define HFI_LTR_MODE_MANUAL			0x1
> +#define HFI_LTR_MODE_PERIODIC			0x2
> +
> +#define HFI_PROPERTY_PARAM_VENC_LTRMODE				0x200501c
>  #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES		0x2005020
>  #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
> +#define HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME			0x2006009
> +#define HFI_PROPERTY_CONFIG_VENC_USELTRFRAME			0x200600a
>  #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
>  
>  struct hfi_pkt_hdr {
> @@ -460,6 +468,22 @@ struct hfi_intra_refresh {
>  	u32 mbs;
>  };
>  
> +struct hfi_ltr_mode {
> +	u32 mode;
> +	u32 count;
> +	u32 trust_mode;
> +};
> +
> +struct hfi_ltr_use {
> +	u32 ref_ltr;
> +	u32 use_constrnt;
> +	u32 frames;
> +};
> +
> +struct hfi_ltr_mark {
> +	u32 mark_frame;
> +};
> +
>  struct hfi_event_data {
>  	u32 error;
>  	u32 height;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index f6a214a6815420f299be70f80732943d02168f0c..2b8c87c25a066ead30bb1b134bdc3fe1e84e8f05 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -71,6 +71,9 @@ enum hfi_rate_control {
>  #define HFI_PROP_MIN_QP_PACKED			0x0300012f
>  #define HFI_PROP_MAX_QP_PACKED			0x03000130
>  #define HFI_PROP_IR_RANDOM_PERIOD		0x03000131
> +#define HFI_PROP_LTR_COUNT			0x03000134
> +#define HFI_PROP_LTR_MARK			0x03000135
> +#define HFI_PROP_LTR_USE			0x03000136
>  #define HFI_PROP_TOTAL_BITRATE			0x0300013b
>  #define HFI_PROP_MAX_GOP_FRAMES			0x03000146
>  #define HFI_PROP_MAX_B_FRAMES			0x03000147
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index dd0a4210a2647ff4dadf8d67b71c6f4a22deb548..c48dfb6d47734fadd4f2e4123c93560f55355b86 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -29,6 +29,9 @@ struct iris_inst;
>  #define MAX_QP_HEVC				63
>  #define DEFAULT_QP				20
>  #define BITRATE_DEFAULT			20000000
> +#define INVALID_DEFAULT_MARK_OR_USE_LTR		-1
> +#define MAX_LTR_FRAME_COUNT_GEN1		4
> +#define MAX_LTR_FRAME_COUNT_GEN2		2
>  
>  enum stage_type {
>  	STAGE_1 = 1,
> @@ -148,6 +151,9 @@ enum platform_inst_fw_cap_type {
>  	VFLIP,
>  	IR_TYPE,
>  	IR_PERIOD,
> +	LTR_COUNT,
> +	USE_LTR,
> +	MARK_LTR,
>  	INST_FW_CAP_MAX,
>  };
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> index e7645bd60eb46785e0110a34f3257f7c37bbfca5..13cee5f72a443b85136d30b41b589aeb0db8eb9a 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> @@ -249,6 +249,36 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
>  		.flags = CAP_FLAG_OUTPUT_PORT,
>  		.set = iris_set_ir_period_gen1,
>  	},
> +	{
> +		.cap_id = LTR_COUNT,
> +		.min = 0,
> +		.max = MAX_LTR_FRAME_COUNT_GEN1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROPERTY_PARAM_VENC_LTRMODE,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_ltr_count_gen1,
> +	},
> +	{
> +		.cap_id = USE_LTR,
> +		.min = 0,
> +		.max = ((1 << MAX_LTR_FRAME_COUNT_GEN1) - 1),
> +		.step_or_mask = 0,
> +		.value = 0,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_USELTRFRAME,
> +		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_use_ltr,
> +	},
> +	{
> +		.cap_id = MARK_LTR,
> +		.min = 0,
> +		.max = (MAX_LTR_FRAME_COUNT_GEN1 - 1),
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME,
> +		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_mark_ltr,
> +	},
>  };
>  
>  static struct platform_inst_caps platform_inst_cap_sm8250 = {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 585f0aedc0eb5e80fd108929e1861101a7bab2be..99d8e1e59e6bfd5e4ab0fd2b5831f74c54b6e87d 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -637,6 +637,36 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>  			CAP_FLAG_DYNAMIC_ALLOWED,
>  		.set = iris_set_ir_period_gen2,
>  	},
> +	{
> +		.cap_id = LTR_COUNT,
> +		.min = 0,
> +		.max = MAX_LTR_FRAME_COUNT_GEN2,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_LTR_COUNT,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_ltr_count_gen2,
> +	},
> +	{
> +		.cap_id = USE_LTR,
> +		.min = 0,
> +		.max = ((1 << MAX_LTR_FRAME_COUNT_GEN2) - 1),
> +		.step_or_mask = 0,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_LTR_USE,
> +		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_use_and_mark_ltr,
> +	},
> +	{
> +		.cap_id = MARK_LTR,
> +		.min = INVALID_DEFAULT_MARK_OR_USE_LTR,
> +		.max = (MAX_LTR_FRAME_COUNT_GEN2 - 1),
> +		.step_or_mask = 1,
> +		.value = INVALID_DEFAULT_MARK_OR_USE_LTR,
> +		.hfi_id = HFI_PROP_LTR_MARK,
> +		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_use_and_mark_ltr,
> +	},
>  };
>  
>  static struct platform_inst_caps platform_inst_cap_sm8550 = {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index 1e54ace966c74956208d88f06837b97b1fd48e17..b7413edfbc5646fbdee6139d1e6897d730e2c8d1 100644
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
> +	return num_ref;
> +}
> +
>  static inline
>  u32 hfi_buffer_comv_enc(u32 frame_width, u32 frame_height, u32 lcu_size,
>  			u32 num_recon, u32 standard)
> @@ -693,7 +706,7 @@ static u32 iris_vpu_enc_comv_size(struct iris_inst *inst)
>  {
>  	u32 height = iris_vpu_enc_get_bitstream_height(inst);
>  	u32 width = iris_vpu_enc_get_bitstream_width(inst);
> -	u32 num_recon = 1;
> +	u32 num_recon = hfi_buffer_get_recon_count(inst);
>  	u32 lcu_size = 16;
>  
>  	if (inst->codec == V4L2_PIX_FMT_HEVC) {
> @@ -1402,10 +1415,9 @@ static u32 iris_vpu_enc_scratch2_size(struct iris_inst *inst)
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

