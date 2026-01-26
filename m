Return-Path: <linux-arm-msm+bounces-90493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCLJMNwhd2lmcgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 09:12:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F320855C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 09:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 129A130073E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 08:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79C82F7449;
	Mon, 26 Jan 2026 08:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NB0MQmEM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DlIR+urQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E10327A47F
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 08:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769415128; cv=none; b=ceg+h7WjhH7wNobC4FgNuxc+THJxaGGMyJ2+vXaZ06WdJ+wKw2o3qPpmus8x5DOJx1HsFc+MhuchY/c2wtamAwijv541O+h+Tzcy49aUx7htvqsL75CQSrlKr1PGiFq1npOoluSoVT8LiM/xocYckSdyrmAP3Xj34MXhPYGO1hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769415128; c=relaxed/simple;
	bh=ZwRb3dT/cGaGYFrvTwAatD7KQyxYekQVp/ubs4iaius=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eLc6KyvoSEoaNpf250IPzY6BpUOOXynNGBT0XU5+Zd/fQdlNR0dfIr+zJ/XSfT5000DxSIc4Rd2z+7D8bvthmLUQX8Mwp6c7ygpzJ0XxAeEdVGXREwjdWb1yiPF0eWzi+c8g6rV5qHdUfnvX7BJMWw9pX8dWrAXedU4JepBzng8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NB0MQmEM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DlIR+urQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q5ULmM1019118
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 08:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x1CMx7e3LYR7pLqgZ7x++uPS48aYhata5WM+yqK19hU=; b=NB0MQmEMglWg19KA
	ykmdIfJn16iaD7+EOFsEIrFKhjPn4EVq+1LwhOyhm+t7W0FSQoSlCNuxYciJSNip
	pO4KLhj/lCfOdAotq9Sb5WoyiWktOMcjZzV5DnqBh9eITeeYbLaHM0rYhOGNINRV
	kqZsGExLq1x6zfAwMhWzw8YNYZkLYdVJ78G6JrprmaxpiPGDciNK7vqFEca3EFLp
	YorpGeFA/+ZFEeM9zbFb1MpiGjTEOIBGo3uNFckesDxoryVky+oHGMsotN4a2bqN
	KhYFOmI+4K7LAGKtyxw5+yW2smYa3kHEnNzZgtmM13Y72VOSD8Ivgf8IhkNaroI5
	0moRDQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx2680bjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 08:12:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f1f79d6afso45742835ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 00:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769415126; x=1770019926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x1CMx7e3LYR7pLqgZ7x++uPS48aYhata5WM+yqK19hU=;
        b=DlIR+urQLsodcqFqnaWVgXe+rbx9tq9Pm0hGFxI0katiD5p2vlzi6mA7ztBmLQoFOo
         zVg+LyVhdxgQY/F2M59TW7pFbXr0/0w/TKnbaU56xsRWGiK6Ee2pWw4Ax4QpZ54iPPwT
         2iockJsuO0DZ830/PDWEHjqKakAjqeGqSWoIzjXM8YtdLmPe3uHf7VI732028gDTV+hG
         oAtsvx9qlvA+zuKnPZmqVwDk04gZzOeUESHUu4gc8OWltmDNhaqegTV3WT0lYkkd5LCP
         gfbjxeA4Y0S+vnj46rQRQ44Uw1gTWl9p+mrmLNDNB47aqO8Bfjg7kYK70DOWlRGIdsPh
         ZjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769415126; x=1770019926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x1CMx7e3LYR7pLqgZ7x++uPS48aYhata5WM+yqK19hU=;
        b=OBKW4Pw5TuIyar5/CEKF77kSXl8WUE+rSVntmOR54h4bXKRRYYHTFI1g8ILOg7Ra5K
         Z09fcWtwj4evPQzyr+5jxSlYt4wq9gr9p9nyeeOcsZFbDlsEUMEm2p31YO1Tvsn7McfB
         Y/+JV1IbiLxI77jAey2J3BQB+exFC9i23iuWbaTDRElDpxMjqepUgvUdUHg6KiBj7ZnY
         +7oXJvsucPIu2PdF8ffzu7iC3bpwMyl/cVPmCTzKoCefqrYe9DArCcugFwcw4d+PZ6Ik
         zGlRkzvbOVD8sDvAatsoUV7VK7phzcA4sP4LnIcCFohuShHQL/EEwHfWD0wk39E2xp70
         kt0A==
X-Forwarded-Encrypted: i=1; AJvYcCXHaq9LPlNEnfqCNsOn3hFYGvzvngoJWwuL2b92X4sNqxEFgkCMaiubf4gmRVANfR2zq3JrvS29pHSbmI53@vger.kernel.org
X-Gm-Message-State: AOJu0Yx14YnAsMgZK5Ke3mtpeT2J9YTeyn1udJJXrJX+7d6HoVgoDq0d
	bn6HBRRG//jHCtJUZi1qC79hWobChD0TBpQU+9krXBt0ey9jo+chF3iU/xDTwAh5C63B4lPjBpg
	mC9C6DuKEREeH/pwmCk+edFaC27NN92huwnTHozCxcXe1wut04bp2Or/CxwFDjZLp556o
X-Gm-Gg: AZuq6aLjZbhug782sUpq+F87XxitKsyeN64mGFvD+rpbOrvt/TrY2Pu06hi6xmv0GvV
	nN9nZlWVUhE8goLWnMWLXQ3fzqmD2d7qqX4MFaAM8KeXE7phIP/pOaWAwYFGhZo1+NFT6O2H2yH
	GD933JN4j/xvmaLEXI4p9EKmBkFS4adDm3OD99QjCbXddVzY/QrgRHScD0cASAFjL/GluhPmnnW
	B4/pUJ6FfeDPgClaryCozxoJS6RlrYOxzv4+I4KXZc3KVUwTwLR4ErVoaqBiCybXFiQtVLBOAGl
	541ptb58VwsHT8vimTlRUPTVdE1IVMOZg1HHM5FAV0yhnbSLM3eVXrcIlp5IPtPrgpDQ4QVk60f
	MvnqG2yo3TevbGR9q9pk0udLOOzcyCE5GqorvUyy/ePwwYW1iKeHc85fSax5FONfJbJHr
X-Received: by 2002:a17:903:24f:b0:2a7:6f90:8650 with SMTP id d9443c01a7336-2a84530e11fmr36010295ad.55.1769415125752;
        Mon, 26 Jan 2026 00:12:05 -0800 (PST)
X-Received: by 2002:a17:903:24f:b0:2a7:6f90:8650 with SMTP id d9443c01a7336-2a84530e11fmr36009995ad.55.1769415125212;
        Mon, 26 Jan 2026 00:12:05 -0800 (PST)
Received: from [10.249.16.203] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dcd776sm82001135ad.26.2026.01.26.00.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 00:12:04 -0800 (PST)
Message-ID: <dd9cd9dd-3947-4ea9-bdbc-0c655238af46@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 16:12:01 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, quic_qiweil@quicinc.com,
        Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] media: qcom: iris: Add hierarchical coding support
 for encoder
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20260109-batch2_iris_encoder_enhancements-v3-0-196855ef32ba@oss.qualcomm.com>
 <20260109-batch2_iris_encoder_enhancements-v3-4-196855ef32ba@oss.qualcomm.com>
 <e4afc72c-ed44-c516-a44f-4f727da86248@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <e4afc72c-ed44-c516-a44f-4f727da86248@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=697721d6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=65R93-EQ1uaeyMUcKjgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA2OSBTYWx0ZWRfX1n4+MDBkwcti
 2KAkstPNRqVahAo7pqgnWVgkjOU0Ll7MTCdLovxiqrKsyr7e87OoJfJK3NgRTut0SE4UVZ5q9dm
 Le+bHnBSq0y6qqPaDKhkKRRoMFr0mPz7yoOvNYC5bg7hgyOw6VD4ACAMhRTwJWtcP67oJBdmle9
 aMb4cNlJgoRNFIf5NbxtWTF6vmiHITMXnlwTAvxQ1w9iSs5z8dTPTfwksBFyjCge3/iZ51wJIPI
 VEiJYhVBs+GsMmEs1kKdAG/zfWr0S/Ji9l152OEYbMWXqvfPHskqEL+j9gZPiDKOghXFpxk3605
 +uZcY/R3Up7KGDStTBgk9MZbPK0t6MtVqwH78PC4OIlzz0TyFyQB/yz1l1p2ShVeIzp35JYuhfN
 yEguscb7rMldeUmhnLvgygJqg1KugSBusKL50dp8/DhsUh9TgJIDHNFb+640W8/2yQ5EMB6ShcL
 y6zaXFnjjpL6nGrOSoQ==
X-Proofpoint-ORIG-GUID: dgtGEDN0b6hLi5iV7LUETlK_h0uXejCq
X-Proofpoint-GUID: dgtGEDN0b6hLi5iV7LUETlK_h0uXejCq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260069
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90493-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2F320855C7
X-Rspamd-Action: no action



On 2026/1/22 17:38, Dikshita Agarwal wrote:
>> @@ -116,6 +116,40 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>>   		return MARK_LTR;
>>   	case V4L2_CID_MPEG_VIDEO_B_FRAMES:
>>   		return B_FRAME;
>> +	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING:
>> +		return LAYER_ENABLE;
> 
> Will the same control be used for HEVC as well? I think this is applicable
> for only H264 encoders.
> 

H264 flow:
V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING,
V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE,
V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER
HEVC flow:
V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE,
V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_LAYER

LAYER_ENABLE is used for H.264. In the HEVC flow, this flag is 
considered redundant—once the type is set, layer encoding is implicitly 
enabled.

>> +int iris_set_bitrate_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>> +{
>> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>> +	u32 entropy_mode = inst->fw_caps[ENTROPY_MODE].value;
>> +	u32 bitrate = inst->fw_caps[cap_id].value;
>> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>> +	struct hfi_bitrate hfi_val;
>> +	u32 max_bitrate;
>> +
>> +	if (!(inst->fw_caps[cap_id].flags & CAP_FLAG_CLIENT_SET) && cap_id != BITRATE)
>> +		return -EINVAL;
> 
> Can you pls explain what is this check for?
> 
> The layer bitrate should only be set if layer encoding is enabled, isn't it?
> 

This flag is used to confirm whether the corresponding ctrl has been 
invoked. A check should also be added to determine whether layer 
encoding is enabled, while excluding bitrate configuration in 
non–layer‑encoding scenarios.

>> +	if (inst->codec == V4L2_PIX_FMT_H264) {
>> +		if (!layer_enable || !inst->fw_caps[LAYER_COUNT_H264].value)
>> +			return -EINVAL;
>> +
>> +		if (inst->fw_caps[LAYER_TYPE_H264].value ==
>> +			V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P) {
>> +			if (inst->hfi_rc_type == HFI_RC_VBR_CFR)
>> +				layer_type = HFI_HIER_P_HYBRID_LTR;
>> +			else
>> +				layer_type = HFI_HIER_P_SLIDING_WINDOW;
>> +		} else if (inst->fw_caps[LAYER_TYPE_HEVC].value ==
>> +			V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B) {
> 
> why are you checking HEVC layer type for H264 codec? seems like a bug.
> 

This is a bug and will be fixed in v4.

>> +int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>> +{
>> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>> +	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
>> +	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
>> +	u32 layer_enable = inst->fw_caps[LAYER_ENABLE].value;
>> +	u32 layer_count = inst->fw_caps[cap_id].value;
>> +	u32 hfi_id, ret;
>> +
>> +	if (!layer_enable || !layer_count)
>> +		return -EINVAL;
>> +
>> +	inst->hfi_layer_count = layer_count;
>> +
>> +	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq)) {
>> +		hfi_id = HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER;
> 
> why the streaming check? and what's the significance of this setting? why
> this prop is set under streaming check?
> 

This property needs to be set to the firmware before streaming. It 
represents the maximum layer count and is static; any dynamically 
configured layer count later must not exceed this maximum.

>> +
>> +int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>> +{
>> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>> +	u32 bitrate = inst->fw_caps[cap_id].value;
>> +
>> +	/* ignore layer bitrate when total bitrate is set */
>> +	if (inst->fw_caps[BITRATE].flags & CAP_FLAG_CLIENT_SET)
>> +		return 0;
>> +
> 
> any streaming check required here?
> 

A streaming check will be added here.

>> +	{
>> +		.cap_id = LAYER_TYPE_HEVC,
>> +		.min = V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B,
>> +		.max = V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P,
>> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B) |
>> +				BIT(V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P),
>> +		.value = V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P,
>> +		.hfi_id = HFI_PROP_LAYER_ENCODING_TYPE,
>> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>> +		.set = iris_set_layer_type,
> 
> layer type depends on layer count so shouldn't you have layer count before
> layer type in caps? or handle both in same set API?
> 

In the iris_set_layer_type API, there is a check for the layer count. If 
the count is 0, layer type will not be set to the firmware.

>> +	/*
>> +	 * The expression (1 << layers - 2) + 1 accounts for the number of reference
>> +	 * frames in the Adaptive Hierarchical B-frame encoding case. In this scheme,
>> +	 * the number of frames in a sub-GOP is related to (2^(number of layers) - 1),
>> +	 * hence the use of the shift operation.
>> +	 */
>> +	if (layer_type == HFI_HIER_B) {
>> +		if (inst->codec == V4L2_PIX_FMT_HEVC)
>> +			num_ref	= layer_count;
>> +		else
>> +			num_ref = (1 << (layer_count - 2)) + 1;
>> +	}
> 
> were you able to test these different scenarios?
> 

Okay, I will test the other scenarios.

-- 
Best Regards,
Wangao


