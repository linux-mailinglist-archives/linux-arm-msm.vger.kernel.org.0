Return-Path: <linux-arm-msm+bounces-84836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB42FCB18A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 01:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0569230E0F5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 00:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FFE61A9FB4;
	Wed, 10 Dec 2025 00:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mLNV0SbV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iKRpfrnK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDC68635D
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 00:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765327252; cv=none; b=KeXqi7OEH0bP7FpDZImymSm0E7mvx8onyyg0gZp7BEqk/f4QJhiK2Ogi0LRgV02OcrHWHjJ9AEr9ZYA2UpsC0YKgv6rGZtzH9fSKpIanr7Wa32i8TzswgU8R2ZZXG9S8fJkDSWl4S34AX5bPy2zplw5KjCn//Wn++HRLOoo3Pg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765327252; c=relaxed/simple;
	bh=hRqNpASOAtV2R6ptGK9ZvEW4iCMGd+z3fowDImWMDWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ooc71X0YCO3LDSiNJudYFvFT4J+Ldr+Oes0ixN+nFeMWWyBM6+jydaRpx9EbzTlaPAlXqZ5EZZmq0dIYxV01qi43dEiZLK7MYtVPmg0ZfBeJ4UMu/33rn1eMolDhLBY0a8WyXNsxE/jfis2guaL4uLQH7ZpRL3JrYw0TzZ1B+ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mLNV0SbV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iKRpfrnK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA0OAHO881702
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 00:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BjnVilg3abOxU+W32kl7Zz9UhmN4RRtptZxZawb0RM8=; b=mLNV0SbV5szXUHb8
	sFRKNF4gb+YP4QUcBvN8zLszGFiF6ddhPWkL1IyjQEiSwjMabC6hb8SNT0F44P3c
	RZIJ5DtAeuIDsvp/HnwQh0Ch5ckQRsg50whBea6Z6nmRTvxoP9xsqCuCHUfS8xOv
	J2v7wqlvOFUyDNlg7VLhrxN9Texr+WQyKpLFuxdfdaA9T4dGQwAcBq1R1wfXybC7
	nX3HU0MuijUsdlEKnODoSd6i8utlHo0F6mwx4K8NwBQvNFNlsYW8HtfyqiCTqh1q
	UDCHvJUa+liJLcf7o/tnUsota5CgcIPt/vqj6jexyA+rSdio1bwFS8ZbdsngzWjy
	UkBSnQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axqqn1abx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 00:40:49 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7ba9dcc9e53so1420506b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 16:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765327249; x=1765932049; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BjnVilg3abOxU+W32kl7Zz9UhmN4RRtptZxZawb0RM8=;
        b=iKRpfrnKevwENNZ2puvrjn/uysF9+Mxd3eNGrBGI0CM45qPPFoMXZkvFQoWk65aour
         hgHnsTWt1UO4hMTpO9yH8jF+sRx9X4QT4Q4aqfEdxskMxr98QkpMMyOpa+TJixMzczuH
         PX0sZ2Jq4jVdj9IuXdXWm8621oIBV1/MM8FGl15yl3DRPQIMpCrKYTCxs7y1YvTJ3Vl9
         bnr3MLotgnWciUE7ZrWwEc8YP1g3YTtNHy8Hhp0Uc6NXx5YGjxXH5bjJyEDHqQZ0DBzL
         kkN9rXICJSdQLlkc7J1zvqyXgtDQGyO+yDm/2on9QSf+9GztPeDaqZjL5kT06EnpY7j2
         CX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765327249; x=1765932049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BjnVilg3abOxU+W32kl7Zz9UhmN4RRtptZxZawb0RM8=;
        b=t4IMFXUFUgmT/Txlh0RuEesqiBh8YleTlp+Mz0ZZVbqI0pOJiWRDEwHErLQ4+pn0g0
         CioVY9LdybIa3UlfTfkblGNT+BpD94NB16l7hKtZNbR5N+6nBAuEVV1/cm0Qks0mZh9q
         HoX93RzukA7OF4ff7jCz6QcEe9tfT7Vjpj42R9kzoUsmU1Qp61g3SvKkKfa+mpOzyaz1
         1t66ODlMH/ByNyBKyt0a3TVvaRqqlRlt6RWkQTadAdn12tnoTjV8ZcuuHVuNC+1RGNCf
         PLrswURKRKNsKrSAKh7E6XSQlbwUI+A//tsF1nVH3GEd8wU1thLwITCWbTrbd+QHLohV
         1hiw==
X-Forwarded-Encrypted: i=1; AJvYcCXbr4emxNpjue7+HPt0Ar3gcqszlAGTm5xB7jqn/fClUnvm8nmKhrbW0+J9MUfKlj224cJEbyfMc2WGCbBN@vger.kernel.org
X-Gm-Message-State: AOJu0YzbMkT4915sO3KgiV5LKWIPLCVEqf285CHBHfsOVN34f+hcFNf4
	Qy+9rdDGNTVLq5Zb/HREP6RkqY58lT5iNi3VMxZpNEiLIbNBrpeVdjN0qemmpyn9X3GYjBRGx4n
	iL+Hwm0wi8eRRSFMIA4v6gr1aQENoXCmNyeZ4CNp/yV1eRaj92lQ6b34W0VjTm4BZJjfs
X-Gm-Gg: ASbGncvxtru/Er7G8yu7FExtNVc40sJqr+N22fyPxbH66Y7SBSInokrg14V5w/gp6Vo
	/JfOZpoNq33H5TLjrjkxiTS7JmJ5W6DMbxlW2NFzo9bogQqpd+fBKbUohZeeGs6MvOGFUl1leEg
	khv9uB3rddq2u3tRPfaR+llw4ff0krUaNWaEYC37j1qRK1B5SV3R5eGPDjOO9NDH+sV0HwSKbhE
	juu8uHsrdhvNF6tOLnBWWl4YgxQTa0v54d/djYh4Hl6smjc2h6jNlIz9p8BHl/rq3pweMXtmVLZ
	xrrfZDV5c2Mrcr82QA0dYdFOI83qfEmUyUbOprk/CSY0mXQNRfzlLlgydvqWoeNNp8vjxxvRpUM
	8jY0Z/Z/LRRZbHnH0KS2uvaeIJzlAbqdo2G6T3wv89uc4D8Jeho6GWOpeOtdGr64xP+oCUZW1
X-Received: by 2002:a05:7022:3847:b0:119:e56a:4fff with SMTP id a92af1059eb24-11f296c903fmr233604c88.4.1765327249117;
        Tue, 09 Dec 2025 16:40:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3vRJ01ZpoagUST265v0ky1EHBQYobOKV+8HlnSsbYXPe/btZXA+y41v0dTaTn5L8mbxA7qg==
X-Received: by 2002:a05:7022:3847:b0:119:e56a:4fff with SMTP id a92af1059eb24-11f296c903fmr233585c88.4.1765327248516;
        Tue, 09 Dec 2025 16:40:48 -0800 (PST)
Received: from [10.110.63.171] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f283d483dsm3848764c88.15.2025.12.09.16.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 16:40:48 -0800 (PST)
Message-ID: <f247cd33-e438-4c73-b0a8-ce589b5e6828@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 16:40:47 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/5] media: iris: Add support for AV1 format in iris
 decoder
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251202-av1d_stateful_v3-v8-0-2f74a81773b4@oss.qualcomm.com>
 <20251202-av1d_stateful_v3-v8-3-2f74a81773b4@oss.qualcomm.com>
 <c1fde623-9f2b-4904-8008-8dd9a02a352f@oss.qualcomm.com>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <c1fde623-9f2b-4904-8008-8dd9a02a352f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fZx-eQLH5V_ulKnf3CUmIFrFoEPJptYI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAwNCBTYWx0ZWRfX0/p3VKaY0VPK
 e6zctx7oHBvVW8BKNrVyaJ+169BPRG83IHQ8mwUePPkZpMVjYE6d2BeJdBm3bYY8UHGVn0YZNXq
 r3aYRT/xofH2C0ySOwZrJEZ8cwaQtbsj7bg9Hbn7rLWaJyT5JzjaEskmQMu7f4YZQPwJoGJ6cZU
 cXklxrAnrxol9+IrjsWCg7I8krSAOoic8MkyIMsqNl8o4WjZ95O5IJMkYJyF1kz8ab9MIoDH8hq
 /H+YFg4qSR1rQmoH4k7emgHMCsU7ExVbfCJn7j09kggOBHw9V03P7gDg1iLPJkAnlXaqfwVXWU2
 LIuIWI+YNhxk3We7wLO2CUpITOgC9itd2LMz+nGwr4sv5vp0B7Ms5b4RJdrcoUrKkBtze5NHEpo
 a4tOwNbXROK2RFQVwk4hGyrxdwautQ==
X-Authority-Analysis: v=2.4 cv=A5Jh/qWG c=1 sm=1 tr=0 ts=6938c192 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yLxqPbnFcNyJ_sgzbz0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: fZx-eQLH5V_ulKnf3CUmIFrFoEPJptYI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100004


On 12/8/2025 2:51 AM, Wangao Wang wrote:
>
>
> On 2025/12/3 7:03, Deepa Guthyappa Madivalara wrote:
>> +static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>>       {
>>           .cap_id = PROFILE_H264,
>>           .min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
>> @@ -759,6 +778,8 @@ const struct iris_platform_data sm8550_data = {
>>       .dma_mask = 0xe0000000 - 1,
>>       .fwname = "qcom/vpu/vpu30_p4.mbn",
>>       .pas_id = IRIS_PAS_ID,
>> +    .inst_iris_fmts = platform_fmts_sm8550_dec,
>> +    .inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
>>       .inst_caps = &platform_inst_cap_sm8550,
>>       .inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
>>       .inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
>> @@ -851,6 +872,8 @@ const struct iris_platform_data sm8650_data = {
>>       .dma_mask = 0xe0000000 - 1,
>>       .fwname = "qcom/vpu/vpu33_p4.mbn",
>>       .pas_id = IRIS_PAS_ID,
>> +    .inst_iris_fmts = platform_fmts_sm8550_dec,
>> +    .inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
>>       .inst_caps = &platform_inst_cap_sm8550,
>>       .inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
>>       .inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
>
> I noticed that you didn’t add inst_iris_fmts to the platform data for 
> qcs8300 and sm8750, which will prevent the decoders on these platforms 
> from running.
Done. Thanks for the comment.

