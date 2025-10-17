Return-Path: <linux-arm-msm+bounces-77686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA95BE680E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 07:55:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 847093AC5C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 05:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E4F730DD3F;
	Fri, 17 Oct 2025 05:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CedNOCEh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E392A30DD23
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 05:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760680494; cv=none; b=HnGGW8NcwO9N2YwoL3fJ2rVI33oNBfd4ULN3+b0L2YlDA9dtSxLGIEq1KkjDoq8zbqRxCNuu8uPrZuycLTYV2an456ozI5269ZncDUMkyrFI32Vhf7V4S9bX87lkFPZdp96KzuvVyVCa/aH/vl0UqjjUHak865Pv5F/wqfT3da0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760680494; c=relaxed/simple;
	bh=SNmMw0sTgquEx0KNzWAeChkFRwGDfFp1CMVORD7GjL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pz1UylDKSbk0cAfChxO0HZhthPPb3420YeEaf41jQcWQtd832tvayih5zdbGtAL4nnC/QhHsJP0L1WsL6r8nMDtOzB4jHz/DIIVXOP+Rc4Tt52sUArtMRZBwbAcizsiRZcYERZDSXYNyJ64EYMJAXUGLl9okcGeNswYuQLiu+e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CedNOCEh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLUkK020254
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 05:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VkqSu9s5dxWjR7I4tDBayWcEUvhFWsAikTkxnFFF10w=; b=CedNOCEhG5heA1Ze
	KebbOO8GsfEj6SNrJBu5xNiVfOS2i4XEfoF0cn/bOauvSah3QOgNG0c21Y8Pr6g9
	0DT/PGsurHsMhS+1uvtx20w/oKTiuwiugetgXvBnNMsLxrogNF4KT2CTS8mH6rpl
	KmbsoSf/630/Wqq5+wwfIEfLTub/+mzl2CrGJdgD/4egpsBUCaiG3SzTrkVwUG5u
	NUiZ8Rhc57eVhdGAuHBAhsJT8ySTxwrFLbnJSvB4dwmPH+HkoRhfUl7ikElVUcFv
	iEZYMufLap/+rA++dEE2d+vzrZin7E8cXW1g7wGgWbxkDBLJYPbH+INWu9YHnmjJ
	GlM74g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49tqvpme0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 05:54:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-28a5b8b12bbso34439395ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 22:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760680489; x=1761285289;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VkqSu9s5dxWjR7I4tDBayWcEUvhFWsAikTkxnFFF10w=;
        b=YK1xcbBpszPFORUwnCV6ye/W95q72hAZu03EBLMq4Ojb/sTvPRB1dgQlKmgKYoLAF2
         rxk609rF5qPOv8dPkzED8u2HEgBqw32+07vJ5oGqThevTv8JkGH4NfTLQlIASt2VWaWZ
         hqqpPNAbftp/CQFCdoJ80RsaEjGeIS5616BKIRktdLHoNyKEYwz6fyt9hiiYxnbQP7GG
         M2u7f16G+KQfVImxjDXFbNvUqnQNtrDOx+yg4tmeppQresAx+kpT+ImcznfU45lPymP1
         0XaSbvh6cAgmk6SOhBlMMsBtS8ks69gLQoHXYcWWRcfEt37XoYf2ekpbLoYPpToq+bcf
         2abA==
X-Forwarded-Encrypted: i=1; AJvYcCVqIHO4MjWkkuq9/i7ZyiSJfVwkTsyRB3YADmtPDcsdVYDca7EJVdA5dHJNLKSiS2ntE+dEvRYQgw+r+JJ7@vger.kernel.org
X-Gm-Message-State: AOJu0YwMXVd2+iXmy0kM2oR9efcPdkgiHSCzytyWDmhroOynQknqwPGU
	Dt5VqZ9q3orIjYiufvzas41d6fuwqQsAYTNyYi8jGtuoFT7IUUj62kAKutiL/CRi9zBN8J979Qz
	vtHuLXdBp+9SmGZ6sx3Gl6vrG2DfuHQFrkN7Z/mJBB+97U21k0JdTfXUlACgaP1DHpLGyMNUjJZ
	Yx
X-Gm-Gg: ASbGnctaMnLfKhBZvtxAnWbiZdyeibcnuL3PVAN8at0BHPN4TdeTdym2Km4qdzruTz1
	nEMIKInWcBlzVcknFIrdBVa35P2h0ANdrTWoLascPLrIoOdhCcXRc/hxETTe8B5v+MCuf+ZwsHf
	CurBxAvNLSXsIPOpQ/s45uZ8YE/HO/swT5Nwz1oQh/ELjgt1dzDKIYDzKECnVv+1sgcWgiFqqFv
	2dda+58GfrJ+9GXd07tZZtv/vc+8f7Lw/UsKIP+DcZ1KTMXIeT6SvL7iqd5YsCLoYCs9PSbxY2o
	QB7iQ0pRGo6AvCMgzZWk95yYs2VDDrzhQlbs0RxqReedD02+7NE9mEk/cjJualmwt+eWvgLsVrA
	tjbL1u1FKu6EeAfCJykZXJiccZrmJ0TKgQ5MMzgYNrRgkthSxngxwv4FxaDe49CnC41e0CQ==
X-Received: by 2002:a17:902:f693:b0:265:47:a7bd with SMTP id d9443c01a7336-290c9cf8efemr23014665ad.4.1760680489221;
        Thu, 16 Oct 2025 22:54:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHd8a0IlV6YWKUfG9MbGZ0cIY2N4OtBfpsKGv/NleymxB5I+xnN9bB5sCluTNXsZQxkWj93rg==
X-Received: by 2002:a17:902:f693:b0:265:47:a7bd with SMTP id d9443c01a7336-290c9cf8efemr23014535ad.4.1760680488823;
        Thu, 16 Oct 2025 22:54:48 -0700 (PDT)
Received: from [10.249.28.124] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7b4a2sm50581445ad.67.2025.10.16.22.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 22:54:48 -0700 (PDT)
Message-ID: <c18043c0-253a-4681-8ade-659b8652a90e@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 13:54:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] media: qcom: iris: Add rotation support for
 encoder
To: Bryan O'Donoghue <bod@kernel.org>, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, abhinav.kumar@linux.dev,
        mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com, Wangao Wang <wangao.wang@oss.qualcomm.com>
References: <20251015092708.3703-1-wangao.wang@oss.qualcomm.com>
 <VvDBI2gT4oH7ZFT0ooUS3sR8qVBmREmQCBoO6TyzK-3QbZzvQP6xByAlET8sWzpVPkJEeoa8pOCgjIHmayqBug==@protonmail.internalid>
 <20251015092708.3703-3-wangao.wang@oss.qualcomm.com>
 <437c380e-885e-4458-9913-788ece5a4ecc@kernel.org>
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <437c380e-885e-4458-9913-788ece5a4ecc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aPD9aL9m c=1 sm=1 tr=0 ts=68f1da2a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=sT30tPJYCz54KknbIz8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDAxNyBTYWx0ZWRfX3GTW1DQ4lfTQ
 iCwzxRO3Wv3E2yKBH23Isj5lUIfswrbBWvT3Zt4pWDcbhbRQoGgyqHAstq7FkQXBr/dr62GSc6V
 1d7xIZxz9P6ztKqLHMIyGeyZD/+nLEsN7kfFwYveMn7KsM5O3fjBvei1alY5YmDNM/MeUe9vdz6
 juLMBDyVlST//WQh9yhwTxSLJMdp6KQ7NvB2HLCRNTv9KsIfeFa7BoDK/xjVjKswLQ6afW2teD+
 r8EXpaCGDnp4P88OLgT30YsRDnfYFBiIvKK5OkFeascsElxohJexBUJdXrJ7rVdpijQYuwk8u3l
 QVLQv8fkw44U5f8/0z0LHCkG80VW9pgr3JRi5caX84/+wwwv2uOsgSmk+l03Ah0MIZ1yXYXlhe5
 c86/0x0wbkwkyK+xDx/Q3pKI0iypIQ==
X-Proofpoint-ORIG-GUID: yK_6CLaWY01pPbnbb8E5m-wqLFvoJy-1
X-Proofpoint-GUID: yK_6CLaWY01pPbnbb8E5m-wqLFvoJy-1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510160017

On 10/16/2025 12:08 AM, Bryan O'Donoghue wrote:
>> iris_hfi_gen2_set_bitstream_resolution(struct iris_inst *inst, u32 pl
>>           payload_type = HFI_PAYLOAD_U32;
>>       } else {
>>           codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
>> -        resolution = ALIGN(inst->enc_bitstream_width, codec_align) << 
>> 16 |
>> -            ALIGN(inst->enc_bitstream_height, codec_align);
>> +        if (is_rotation_90_or_270(inst))
>> +            resolution = ALIGN(inst->enc_bitstream_height, 
>> codec_align) << 16 |
>> +                ALIGN(inst->enc_bitstream_width, codec_align);
>> +        else
>> +            resolution = ALIGN(inst->enc_bitstream_width, 
>> codec_align) << 16 |
>> +                ALIGN(inst->enc_bitstream_height, codec_align);
> 
> That complex assignement can be expressed as a macro, static inline or 
> just a regular method instead of copy/paste the same code with one 
> variable changed.
> 
You're right, this code is reused in several places. I will address it 
in v2.>>   inline bool is_scaling_enabled(struct iris_inst *inst)
>>   {
>> -    return inst->crop.left != inst->compose.left ||
>> -        inst->crop.top != inst->compose.top ||
>> -        inst->crop.width != inst->compose.width ||
>> -        inst->crop.height != inst->compose.height;
>> +    return inst->fmt_dst->fmt.pix_mp.width != inst->fmt_src- 
>> >fmt.pix_mp.width ||
>> +        inst->fmt_dst->fmt.pix_mp.height != inst->fmt_src- 
>> >fmt.pix_mp.height;
> 
> These long chains of indirection make the code not very readable
> 
> Please take pointers to &fmt_dts->fmt and &fmt_src->fmt and reduce this 
> clause.
> 
Sure, will update in v2.

-- 
Best Regards,
Wangao


