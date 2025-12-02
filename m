Return-Path: <linux-arm-msm+bounces-84038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EA0C9A555
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 07:35:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BF1194E2C7B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 06:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F942FD7AE;
	Tue,  2 Dec 2025 06:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PLi/7kpn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EXI6dz8j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A901F151C
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 06:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764657324; cv=none; b=uOt6gvI4WZREYfK4SJZLTx9bz0K9OrLU3OfJv5gM/ePiNAOrYFmW8KgXzqAhFR4jPCwBwjIvOcTwZUg2kgUdNnOqP06Df+0kxQ5+LhzllOvgKZiiDe+IJzB+8Qwwa4Z//p7APTuvsL4juJPtiO3iFdGsBg/BrSKbaQPqcGxeyNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764657324; c=relaxed/simple;
	bh=ankNTt4neXOcPc9gnzhoIk3xndCsYDDRUnulh5w1llo=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=d91Gx0JlX3FmVJDUGeLe31gCYVr57tcCnrF8oD59Jhol+OwI2tti2FFuAGO3C5h1Y3ohlsb+la+1R85CHlcja/UrcFQk12zETHdxaq99Rr+pRsUW54IqU7xfLTYAz7YIB8jNoJBEzEX+qJ/pGF+xDh+AdSUwTld6LuYDkp1Lj64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PLi/7kpn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EXI6dz8j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B25Cr5f1688789
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 06:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9taXAkv/HCL/GxtpivIx6rAO9Nhr3mG7qvCltfnBsLI=; b=PLi/7kpnj6cxlxWh
	d69wX/letR+dM/SQStD2vN0OwL8jbiDb76f0vDb72vnHcLVZJGeTXzSxgsmNGmmM
	4Qq/0kjWMFxV3sX6/rHlszao5qdn6qB53SX4ErKnbFshTbHeyQ1lqJCC4twhCNyO
	reIKCXklho4Sf1yLMhArCLGBrTc3nWfJxuWIQZaVgXjYF2oDvZlGrY4BPdU6D5O4
	aOfS8zfts0X3EVhErVjlUK01zhS8vIHwUaStNP1Cd3T8bsc7J0+zjjvoV5itHGak
	TK3nOWJW6xEjzqFZghd9ybOGwtd4nNFnjAqXA7Ydw0ZWp0tBLC7lfMGukkAFCYcT
	RDjXuQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asgxesw7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 06:35:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-299ddb0269eso61571905ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 22:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764657320; x=1765262120; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9taXAkv/HCL/GxtpivIx6rAO9Nhr3mG7qvCltfnBsLI=;
        b=EXI6dz8jD5rkAnpKE0pl9HrnifT4PUK/RKN+U2Ti/gqUs9QAw6wlEneSrOmo7Vb1ds
         AY0frn6l1IScak78iMoC8GBdpvQSv8awEO0onw0JYGEkvn5eUze6JckOzDKuwBaUJDxA
         B4gQ19F5xGgCdjdUZDjiTHPluFu1ckFKnxPvk5n41g4O9Qu0sGlkQGqTHNsFIEXekdPO
         /PT5MuonVv2hO3SCQ4ZBltHMFxLZeYXR5oRW08wTrk054SEqw7JQKzKeLiSIl82p8B9a
         XEZZGdzn63Ov9cplGY3gCkIzEgy86PIvCQgjqKKG+AQ8oPusJp5kbm+xuWcJ1xDKFawV
         drhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764657320; x=1765262120;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9taXAkv/HCL/GxtpivIx6rAO9Nhr3mG7qvCltfnBsLI=;
        b=UTeMvI8eHtykAYykvtSJc5NtPHRKAz+DiTf+yyFp4GmHftMqBDD6Ja/THy2WiWnJ9A
         ecg3M+bwe2o3nR89rfnML6WeZXRTnShYMwoHNlRm0JgEN79YI7vBz/8HhLcG2ygvhaxK
         DdNjNuwVrCrfy32alX+hVT4PgqT21ZWNuoOUx4dUmuA6H85I7MZ2GiMRY9RW3Pc+BOy4
         qJI4WEgWTa0C8ZPyPseCNwUBTxGay/76FyC++mAntLfDaXKjxNVCfLlK3kp22SNTeObG
         mMO/bmng61KZWUaKSXXrGDKKgAUy3qKWZg7N0u91ERin+7H37HjM14l7Due9pg7uO8ww
         KJIA==
X-Forwarded-Encrypted: i=1; AJvYcCW0NItaI9/G0PXqZ+5vgnPhjR978LdAHUS3/11nxfaatQ2BsBA/k566HICj0aTe66OTh/FMmCUTFvsnmmCk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6PJKoozdeFpsTWAVkN3TbI9dTkOYGPbzBscH4iNOtlTyc3bLf
	vtvyPlxlvRloDZgZLoXUsYAYgitAp8o8AVdwMcGNwjpGzI2yZ9byUXBkGaus/ITqP98/zdMe3jW
	VhoHCmoHJjrxdqzQncYQ10nmCqgG1SHNozjzhdnFlE0CZ3Tt3WgVdRBMh3Ja6DjWy57jS
X-Gm-Gg: ASbGncujtr5XtP8yUHXycNs/AUl2iHUAxZ3jhTrABbVMJ2FCM1Vr6okfnkNskusq7Vc
	zBFkKJbKtVXaX9Mi+UM6kvB01F0SgHf+5pfgFPg0/ZQf2VYWAPxi1amRzXNPXgEGRlZBkincsiD
	OEIjhugvbEDvwzglGd1IftutDG0+1vOHMlGaB3LkOqhJbpyXpy2rkR5paUCAmdQPunB2TA7q77l
	PIeTxg0YjTYJ25TpwwUTQsThgSBkzYx05hcmOov8ePhh9NX3BmfqqK873246GALTUOKfshpWZgm
	PuZ14kdIPU55hfereTyHtU+t5mHTVohf2CTKgqfJrT/BV8Cper7kK7w8jnVXq56DGSgK0z2rd3L
	YhIcw/ik/6i+JuQH3LokDda/jr13c2mir/e3m5GxzozyTZ3lgWAb89typ0WkNy6UbbX+M1r7jNM
	kX7aI=
X-Received: by 2002:a17:902:ef51:b0:297:e575:cc5d with SMTP id d9443c01a7336-29bab141bc7mr345436045ad.35.1764657320607;
        Mon, 01 Dec 2025 22:35:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAAR4obs5E14wU8UmfWdKbVA2VsDO97CAfbLrhjF0gXIPJcW1X1uyl7T+CY3mCzNHNzJeJXg==
X-Received: by 2002:a17:902:ef51:b0:297:e575:cc5d with SMTP id d9443c01a7336-29bab141bc7mr345435685ad.35.1764657320032;
        Mon, 01 Dec 2025 22:35:20 -0800 (PST)
Received: from [10.249.18.58] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce445927sm143810745ad.37.2025.12.01.22.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 22:35:19 -0800 (PST)
Message-ID: <99609312-bd69-4506-be80-9c6aca6a10ad@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 14:35:15 +0800
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
Subject: Re: [PATCH 1/4] media: qcom: iris: Add intra refresh support for gen1
 encoder
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20251127-batch2_iris_encoder_enhancements-v1-0-5ea78e2de2ae@oss.qualcomm.com>
 <54pZM7wO84wvdB_kwjNvPB0WMjjfGPPtDLg2eXpiGDYgz1N43hG2Z8TLP-nbVVhCwW-77N_i4K4QunzrO8HtKw==@protonmail.internalid>
 <20251127-batch2_iris_encoder_enhancements-v1-1-5ea78e2de2ae@oss.qualcomm.com>
 <0e00467c-6d24-43f0-8a66-72160631d2fc@kernel.org>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <0e00467c-6d24-43f0-8a66-72160631d2fc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: neAosfo8JE0sNvQxA5HFvO2CCbIr9H87
X-Proofpoint-ORIG-GUID: neAosfo8JE0sNvQxA5HFvO2CCbIr9H87
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA1MSBTYWx0ZWRfX3rxUW0CaXuDf
 oWpVuSdpGGhKnSw8C5WKDGUY+6tIov8MWx4f+LMHC+7DyjS3WsUL9tl/Ym8+5l78qgnAJ4W8DpA
 GSNo29ApeT7sWeocDR1cfc/hwSbxNW+njO7jXerI9UX3igknEJvnXR8S8K50EVBY5DUzjhunVUp
 +QHnhlfD+DoKm+YTxwBoz90UnoB29XgL8MJrdneC98yz72T/WL+nrQuHZGbWwdN30eARhwGIAGp
 nJOcBml6yJnrcbMtIn2tGWFn/5+NsGrkMDwd/7p+KqWK1XG1aezCZJXj3ZVXYSChmvenvUrEVDt
 QCGtyUdjhiImjY5Jg81omhb2Ttpu2sx49AX3ryTAiBWeLGilOhqxUyQ6fsVV1Vyu3vpz6plBLBA
 expbCH6tYeFWK6trde9nfuiFqz7f3g==
X-Authority-Analysis: v=2.4 cv=A8Zh/qWG c=1 sm=1 tr=0 ts=692e88a9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PgoIHAgY8_GuLWmOGKAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020051



On 2025/11/27 18:35, Bryan O'Donoghue wrote:
> On 27/11/2025 07:44, Wangao Wang wrote:
>> +    hfi_val.mbs = fmt->width * fmt->height;
>> +    hfi_val.mbs /= 16 * 16;
> 
> 256
> 
> But why ? Also why express it as 16 * 16 ?
> 
>> +    if (hfi_val.mbs % ir_period)
>> +        hfi_val.mbs++;
>> +    hfi_val.mbs /= ir_period;
> 
> This code deserves some commentary.
> 
> ---
> bod

16 * 16 is the size of a macroblock.

Here, we first calculate the total number of macroblocks in one frame, 
then determine the number of macroblocks that need intra refresh in each 
frame based on the ir_period. All macroblocks must be refreshed within a 
single ir_period.

However, there is an issue: the macroblock sizes for AVC and HEVC are 
different. I will address this in a later patch and add comments 
accordingly.

-- 
Best Regards,
Wangao


