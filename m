Return-Path: <linux-arm-msm+bounces-28342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E6094F791
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 21:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AF191F213C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 19:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3199B190686;
	Mon, 12 Aug 2024 19:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lSGkcnD8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7382717A5B5;
	Mon, 12 Aug 2024 19:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723491712; cv=none; b=nIbvkS6zEw9m9WpPwp5cm7tQYn4s0Pw2EA5LJxuA/PK9gHmsayERUlapp1VI4Bn7C+un7BnGdoISxKF/0fiWFG3ki0m1uuvmA/fr9umq6pS9Ljkvw9/jbv5KQzp6lykqgeH9Cv1bKfX2dNGXQczZa5Ub+cHq7zJDnjQekRXhhLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723491712; c=relaxed/simple;
	bh=G2DRIm0pciL1++ViVhPHiHFhHpBCr5b+Asl+io2Y+w8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rgd+gmYf3rAJs0dvRRjF8GE5mYMWTx3UtikdOp5msUyAMHXA1oBeOhJukZQE/MATOfYZ9CYXVv2FYqhiZoVKHgCcPm8Ye89XERfcVvHYwKwk2vaR0GhZfMR/XWLQ2WQnYdXhWBuvxLoJenC7EoR09WB+mzjspfD4WHsk216asx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lSGkcnD8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47CDSekx012549;
	Mon, 12 Aug 2024 19:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lOoINTYMC+g7sSvxznQOIBqTIhde6IokfNTepRfvGdk=; b=lSGkcnD8qyGmdPKf
	GyM/h/VqjNrb5zBvfGDFY+CvWtj3QbY3art0zcC460CZ/u1rX/r9Kic1Jo7eI54U
	3qDyJ6bopIwPd9wcRBATEecp1dmJo3POlDCtPLznwaikYTRBrkoxL66qbk+uHl3S
	RPH5Mer4qUmYsa3JDVSHC0P8mSQL48ZUYElexUyk5WYmmyK4hmdg8+t8iLvIWiJw
	p++Z6wL25BnsWF7DcCkVyQo5RtbVM+dRdoAWmiif6ltm3hmQ3b4QN7gqM1aweuA7
	hsy0HlC1ogIvB6HxsvrztsdxGXdLv/BUkL53MiEQVkgcAAXW9jEWI84KVphPaF5k
	GXOTxw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x17y576j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 19:41:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47CJffkH019254
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 19:41:41 GMT
Received: from [10.71.110.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 12 Aug
 2024 12:41:40 -0700
Message-ID: <c2218911-650a-4f43-9119-bd2cfc46f3aa@quicinc.com>
Date: Mon, 12 Aug 2024 12:41:40 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: fix the highest_bank_bit for sc7180
To: Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
        "David Airlie" <airlied@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul
	<sean@poorly.run>,
        <freedreno@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
        <dianders@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240808235227.2701479-1-quic_abhinavk@quicinc.com>
 <CAE-0n53qMJVbfb9oXbDexqhOj6qTBq9k5kMj1e6CXadObhBmLg@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAE-0n53qMJVbfb9oXbDexqhOj6qTBq9k5kMj1e6CXadObhBmLg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NBDRY8v2sh0DIO3yS392jSiyCjaxHrEf
X-Proofpoint-ORIG-GUID: NBDRY8v2sh0DIO3yS392jSiyCjaxHrEf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_12,2024-08-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408120146



On 8/12/2024 11:40 AM, Stephen Boyd wrote:
> Quoting Abhinav Kumar (2024-08-08 16:52:27)
>> sc7180 programs the ubwc settings as 0x1e as that would mean a
>> highest bank bit of 14 which matches what the GPU sets as well.
>>
>> However, the highest_bank_bit field of the msm_mdss_data which is
>> being used to program the SSPP's fetch configuration is programmed
>> to a highest bank bit of 16 as 0x3 translates to 16 and not 14.
>>
>> Fix the highest bank bit field used for the SSPP to match the mdss
>> and gpu settings.
>>
>> Fixes: 6f410b246209 ("drm/msm/mdss: populate missing data")
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/msm_mdss.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
>> index d90b9471ba6f..faa88fd6eb4d 100644
>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>> @@ -577,7 +577,7 @@ static const struct msm_mdss_data sc7180_data = {
>>          .ubwc_enc_version = UBWC_2_0,
>>          .ubwc_dec_version = UBWC_2_0,
>>          .ubwc_static = 0x1e,
>> -       .highest_bank_bit = 0x3,
>> +       .highest_bank_bit = 0x1,
> 
> Usually when I see hex it's because there's a mask. This isn't a mask
> though? Can it just be '1'?

I just retained the same convention that was used earlier. It seems like 
a mix and match right now. sc7180, sm6115 and qcm2290 were using 0x.

I can post a separate change to change all of them.

