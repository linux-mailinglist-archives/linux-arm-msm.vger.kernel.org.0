Return-Path: <linux-arm-msm+bounces-84153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DA3C9DFD2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 07:56:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CB403A8DDA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 06:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1F229A307;
	Wed,  3 Dec 2025 06:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+fGv8YW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LIVV8NEJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F05298CD5
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 06:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764745003; cv=none; b=LHucSjDPr0GujB8Qy+BvLlJftJw2HIofKgx9GaQXMV2yuVUN6Kqx4e8HHeLek7Sp+mGBqBZ7NlCIiNzkmaDlCQjA45OSszsa8dN/6caLzcMmoMjfW4KPaBA0VSg/R3ONYOzjOwaLgd41z1jPQQC6zGQtY5+uO2jps1o49MxiH7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764745003; c=relaxed/simple;
	bh=q2QgWTb9BQb9nfmVvDL3neOtywMv6dLKVFPX+o4Pnes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jVrN1/Z8GYeomgcAkJiNNgKhyTvmghX0ollMno0ZK/bzWOpy3kh5IADv1xrPFJRcbzLZ9C+MfPq7ss/IyGgsmUM0bzDwnmzRXhnQFR/b2hMrnxHUbX19fS8aRBKlxktPOXhBp/Ah2W4lIinhIDVYiQk0q753C47jScOpczdTayw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+fGv8YW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LIVV8NEJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2LsA3g919414
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 06:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SnCYa9Z1yoUaYLyInizaHbloo917zQzboQeaEPvYYmk=; b=Z+fGv8YW/ttelPB4
	r0qDWszmThCPGTMtXIcNves3HVDQ46me/DqzWOYowbi0/BUliEXV1efjgsOAOy8A
	uIiqtmvyyGIsEgO1AzFtor743ytgcSElDvYmVGvszR3ob61u1siX9yfm+I4lv2pG
	+brMGVmvU+fWN3IYxR/h4GV+ersz8un5Y9sF4SFUvtzEq/IvJ7nOq/EVppW4bm5i
	88HLZoMHiGQZsJ86nvW4AXl6g5C5XCmotQxmnMy+sgBvXEYEf2EyyZIuKZOJ0SgM
	txKLbrhNanrUHxQOYfsaogt5I/KTMWn5R9fMaBZM9zsLhg5dT4l20yrqx+0kck7Z
	YZFGqw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at8eb1bpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 06:56:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29846a9efa5so118804555ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 22:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764744999; x=1765349799; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SnCYa9Z1yoUaYLyInizaHbloo917zQzboQeaEPvYYmk=;
        b=LIVV8NEJvqEpzju0d2f2OyQwSpBo7Yy/Mg4ZySXHCcmJVX6Ff+aGIIRU2fG2gfdXpc
         aG6VZ7wXwBf/nj/cYa1fOGCQiKLIyJx+pAev9M8kgYhAK1rhqV52tbiMAtp90JqPe5nP
         65EOhM5WKXfKonP6rbLh0LlsH6vrFCIKVqJl+Q7FYukZe65HJTOS5da7kkRpGm4yftgh
         Qmi+6djxCS4tS7VI2ZCfhIFrSA+pLqTbb0F6D9fl1uMi63o3iVxG0qtqY+nEDn4kPiS0
         hBcCA9NovkvS/JazIdbc5FyFtn7Dl2gMJyu8wra41+xaEFUcs8FM6PNGWh8VUskhVw5H
         rzcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764744999; x=1765349799;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SnCYa9Z1yoUaYLyInizaHbloo917zQzboQeaEPvYYmk=;
        b=lRHwC/4J8DiMuAqnTmmFBeuV6i3NvxCQJ6eo3rNLwrcG9fdKyE2GtJEG0Q2elqgdsS
         fPwmokbwKVM8vMmdw2exmTYCTVQ7ZCtxLN1iaqbEnZBQiVu0nyEmYL8KCi3vYXAczOx1
         I4Ckf3kU9QomLgF4alnqN5jI8ppOLQxKfbCHfF8e2QQuAlLeGgkZj+tMmryR6XoEMCic
         tjVI0bz63fGiRvEatcKP762bitWaDSiZLoJrVIiSeD0V2lSZ2HYXIAU+Lg50UK4kI2ZP
         Y2d4PKeBKp/gwGXlyCYPO45k9JVCF550Pf9GPZNcofUBKPnqaNnXX7SC08rdT5Q4W+iz
         qziA==
X-Forwarded-Encrypted: i=1; AJvYcCWpVATKuBPlvyXSgLdoOxYxqASoz8g8keOguUoubWNfGTOVIV9V/Qn/xp6/bBuFt+jPg28Shvf6cOlqEd4h@vger.kernel.org
X-Gm-Message-State: AOJu0YwiHVsPOmq9EPragSUoy1UIybgKL62VKaTczf+QMEFsygjTfMEc
	gr4rJnl3r966dDERE/47M4LpwZOc9oMG22a0Ltiv1S3N+8lu8GHNDA/jiQXz9/Gw7/sUkVCjb/l
	dTvgvjCceyDR6Yz1v7tKy8nVhJr2vomH603FjcraHJIcL07IuZGGbfMZjmwn0+btCsLlF
X-Gm-Gg: ASbGncvFba1LU/aNxx0uDBY6ns7CNtoyiInbzR/DWin0DPIwiqZUq4+bCLBJtZVZdgr
	Id7WqQq+vigoFoLU686E4K55Flc5a+01ZnUc4GaTPzcVwjNPAjSedVy1MFmIoG2cM80FzXj7BtF
	+nDLDZmdA3r3qJcfCCiNcl7po996mSryulANCZQlvzSYnxi65ArSshoYnJZ2F8fmaZcrIxL4Yc/
	jNa2/it8V3YiHXW1XBXB/9IA/vDKG7Qw6ryIGMkKYHmErFGc88SbgglChNMdM8F60BqecgRYbN1
	TiBYLjIKIOYw05ZMyvwzkP1Pl04xSPe8JVmhNI50ZvD6zONhFv+8Ak+11tHYyZGjDOmp7S9cw4r
	F1gA0i2pRi3Qd75669mAGe9wn9HcWwHRHtlya+/gOrg==
X-Received: by 2002:a17:903:13c7:b0:298:4ee2:19f3 with SMTP id d9443c01a7336-29d68482cdamr18058645ad.49.1764744999200;
        Tue, 02 Dec 2025 22:56:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8X/CQlE8FORiMG17UjlxEnsPKeUgAL3Lapr0xrcy3zggSzaJo1T99HvPO6vm/D21k2iZs9w==
X-Received: by 2002:a17:903:13c7:b0:298:4ee2:19f3 with SMTP id d9443c01a7336-29d68482cdamr18058375ad.49.1764744998671;
        Tue, 02 Dec 2025 22:56:38 -0800 (PST)
Received: from [10.0.0.3] ([106.222.234.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40ab6bsm173631845ad.21.2025.12.02.22.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 22:56:38 -0800 (PST)
Message-ID: <17b48dc5-9808-db54-323e-40cb5bbf9b12@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 12:26:34 +0530
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
X-Authority-Analysis: v=2.4 cv=e98LiKp/ c=1 sm=1 tr=0 ts=692fdf28 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fQrT7HkFwVlTC8MbpnvDjA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=2CijGRP0beerHxGP0IgA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: IijpvkTmMAk4qPAPvPG6trdavjmTj5W_
X-Proofpoint-GUID: IijpvkTmMAk4qPAPvPG6trdavjmTj5W_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA1MyBTYWx0ZWRfX3B3XGeI7llzJ
 krKnZN4a4A400wRAxOyyihkwGNl6GvKI8hNL0UOqfEPlyecUyeu5OnDJ8Y059uZx88WNcHBumMQ
 6r0VG+Xn0CpL9nRmHnf+4XX0Nsluidy80Ga/Hi2uw029FhYqfmT6rnwsXy1SmqxLEkCqAYITMuu
 BnikTpjvY5U46Mkp5nFbk1zS1MmqPe9MY8FCVUChTbp7YqW+492h8gFOcM8nHeXtEL0e4YCRK36
 jB1mh5AYReHhpGaH9F7oqQabzFbMQshygObU8hCY5tBKelF0lLYbP79kihIBotPioFlTHQ1t6WM
 I+iGyQCSxyn8LUL+JZXfNwImstBiRdPDd2zOp48KE/NQq0e0WmJpa86brNjrPofEKSFkgBiL3HH
 w7SZQheMsyZrq1xg/y0L7LCMTi3MRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030053



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
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index cdf38c285b9133f20bdb9bc3dd0f5e916d3ed7f8..33e104142a5bb51c952550fa45e81b3bdc723ac2 100644
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
> @@ -1022,6 +1034,120 @@ int iris_set_ir_period_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_ty
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

RC check not required here?

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

RC check not required here?

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
> +	if (inst->hfi_rc_type == HFI_RATE_CONTROL_VBR_VFR ||
> +	    inst->hfi_rc_type == HFI_RATE_CONTROL_VBR_CFR ||
> +	    inst->hfi_rc_type == HFI_RATE_CONTROL_CQ)
> +		return -EINVAL;
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
> +	u32 ltr_count = inst->fw_caps[LTR_COUNT].value;
> +	u32 hfi_val = inst->fw_caps[cap_id].value;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +
> +	if (!ltr_count || hfi_val == INVALID_DEFAULT_MARK_OR_USE_LTR)
> +		return -EINVAL;
> +
> +	if (inst->hfi_rc_type == HFI_RATE_CONTROL_VBR_VFR ||
> +	    inst->hfi_rc_type == HFI_RATE_CONTROL_VBR_CFR ||
> +	    inst->hfi_rc_type == HFI_RATE_CONTROL_CQ)
> +		return -EINVAL;
> +

Streaming check is not required here?

Thanks,
Dikshita

> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32,
> +					     &hfi_val, sizeof(u32));
> +}
> +

