Return-Path: <linux-arm-msm+bounces-60229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFF1ACDE6B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 15:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DFA73A2E55
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 12:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCD1F28F921;
	Wed,  4 Jun 2025 13:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MRCsfPn2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC7E28F92B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 13:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749042010; cv=none; b=RruE3hfBZqz+HnvTS7gotsn1CKwqMjZpr55FItrHXy8G3xiNpWmS/BUJPo0JMM+sjoNSJyIk3BknHflv/NkLp+5pnubUDgmrJDybAb4C+vpiJJ32h/+FoYfJ7EAXEEHwHxVfr1p3DgAN1JNc/HHKSQYx0qODJ6ZzudU6svLM5Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749042010; c=relaxed/simple;
	bh=8XVhguz1+Ed3YcXtVsOgIGoJBaQuam99SMuhMvkOoBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jX5zZjwE+YdtZPzyfWuX+TEGHfZet2yXdhvWTJoViYCION/ZGC7nbddvkBbTHu5krf6Y3CFVk0l3j6EnwOy9wzxDX60AjEMo0vKVeUShXJENe2A3xiGJRwVqbwd6kFFqmGrrpMyGGtogRUmqTwNEIG/9vLVkvevHRmoE43D8UYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MRCsfPn2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554AhXaI022158
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Jun 2025 13:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3yULVZvEmG9t/23IJG8ShwjnKhSSSSZCNlyggUkvwyY=; b=MRCsfPn2CoGwnkir
	1jg+wgvLYQIX+E5BbJ2vWKbYgwI8Pht+dg9r7oCoajhFwawI0OZLZETd5UfJWhSw
	Y8dqZUa7egZgknY0YPGyLK59vJHQaEGuewv7+b+xO+dj0jzLwh9U+k+oKowz1nhg
	kWESiOHHBv1sLh8vYynXyumbrfnQj+vriomqFb9IBjV8FPZyddN6Cud4RpfFv/5y
	Nn5gsVXg1n6Ttq7xasYEyYMQxxWcw27pcUL3s5qEomxD9LAHXGQZscElxovZYcy1
	EL8m0oDyLMfGJpmHl7v/1j0vdjPzgi7bWDCxtYoGwF9IbTMVZrF6WsSYRFSw8Wpg
	fTA4NA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472mn00arm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 13:00:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d09a3b806aso143081585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 06:00:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749042007; x=1749646807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3yULVZvEmG9t/23IJG8ShwjnKhSSSSZCNlyggUkvwyY=;
        b=ZA3EbFdoa6lBhh79HMHJuzX4dm0Cqp/6dEaz4dRWyZzQz8sfOSR/j+xeW3SwcK8Pv6
         j8w5i7BSjrSoW92WWOXMdGATvOeI6rYX6ataw7su5C/sZkeVANmitvtqrIqeJW/kpV/R
         VY6iDR0KDUjQEO9VSnPlQTAsjGRZhkH8/4FkWS1fO5fzVX6lHwcqD5NY0mjuU/3C2Khl
         2enedwzk+AKVEoxTYn/ocuzYZvHJthOkO07spis9tlgyuVTqzc3sLpukJCSEoX5SVkA4
         NrRZ3EP2VNEwVVaOkzrRuiOpwX6J/yiw5JW7ZlF3VR8iFjVzFenhkZ1AybVgBEsROBJB
         eEcA==
X-Forwarded-Encrypted: i=1; AJvYcCWYJITtHyp2x7u2n0EgQBcDgmFZLJiZfp3y9Zm6Cghs4j65UeIEbRpMOZeuM8I4WH6P+z2r+5z1+pYDffLh@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq1/CIVfLnVP2WEed4C7PYZhbzAj8pYN3Rp98OTPPCZtAW9XL7
	BwIz0Sfzv461laDyA08xFOwBhN4wTLmGt7b55OheuUDaCvwpCpYVPf3KkUwHVZO63TZ8Ke9Wq4e
	e9PParGXWOWU/WYaskQGAlrmYsPlzcmScVBcT9wHqYb4YTuvmxcXbdcQC1P5Rz1UKxdhXhozOU7
	RR
X-Gm-Gg: ASbGncuZDoUacn/WJDOdDjsO+lMIXlZQU9ebRsMHFPvXGltupELdsnQwaniTafDII1H
	v7zu+9cSjuMhPZDGT/sulVNBiiHgQk5RtwYCoctWgDZYI9WqkvMvTe7hu25ygc7Ayx/OxpdoiRM
	M23Qt3wk1jiDOzjTLQzSv7z9rvZaiUhSl8uxxZIxEKpJH8hyW9tR+ppyToCACWtEf0Xz1GOyw1E
	bJWHVeT+061BCZHH8h16tt/QJ81BSCyFHZ+19k00ZB/TA/cXfWVj+NYAtDgVmcJ+mDYOwFRud9y
	fcSAK54gbgTxPl+EnN3f0ld3LqKVMDbHqskvfMMO1Ph9PoVApVf/s6hu0OFUlavFeNPYQnGLknT
	9
X-Received: by 2002:a05:620a:191b:b0:7c9:23d7:6dd6 with SMTP id af79cd13be357-7d2199090a7mr174140885a.13.1749042006681;
        Wed, 04 Jun 2025 06:00:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEn4xJuvGOLTe7ZTBVF2ik8xPdkhjFGFOvWwDjwbyfQtIsf2eqrG3bthpaWtCLfw7+RR9Tkxg==
X-Received: by 2002:a05:620a:191b:b0:7c9:23d7:6dd6 with SMTP id af79cd13be357-7d2199090a7mr174136985a.13.1749042006140;
        Wed, 04 Jun 2025 06:00:06 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad39565sm1094145666b.134.2025.06.04.06.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 06:00:05 -0700 (PDT)
Message-ID: <aeda0cf4-fd8a-4f3f-a3ea-922d5b0ceec0@oss.qualcomm.com>
Date: Wed, 4 Jun 2025 15:00:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: Fix MSM8998 frequency table
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250531-topic-venus_98_tbl-v1-1-68e5523a39dc@oss.qualcomm.com>
 <4504e16a-f4c4-1f68-fa91-d3641a3decbe@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4504e16a-f4c4-1f68-fa91-d3641a3decbe@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eckd-F9eBww0AsjrrzBAMAVVI7ixGfzS
X-Proofpoint-GUID: eckd-F9eBww0AsjrrzBAMAVVI7ixGfzS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA5OCBTYWx0ZWRfX/F2O6Nz6cUzo
 G+ZlN0z9PsER0d7kE7hxyn9XjXCfx/B2oGcmddnG+Bv28AdCBEg8IGtRGqb1zdZB5Om15iDwDk1
 RY7m2ViT2fNMYZgW48xOcqtFsPB7td8ISA+aCVB3pu3ADsnn3DJKTAUQNB96XRVt7lvtAbKiW/1
 0xOia6vKLuG6bgDgGKO1/fSIqFJUGOEk/ndIn3xKEQuAxL/WjU/AhQ6nNrH5DDSt2ZGbmPre26J
 WWy+ZDe0w6dMM/sQC4LJHKN3CJlPMwE6fVpco+WdO2kmlFoAP0fIs0Ozhm18k67P9B3Z6zy33vF
 VdOhzrqp/AakO79MPeJfcOn2DTo2Zl65+btEWuZckvQzMFae5PGvm3+iWEbXAk/BaAZUJPqJd15
 dyiaPfVFkC5gC9O7ZZlAYBbuUXvJYFOrFCBBgAszUtl6ag2QNn8uvQZcFzCRX2fAyS3lbAtF
X-Authority-Analysis: v=2.4 cv=Y8/4sgeN c=1 sm=1 tr=0 ts=68404357 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=beIa89I-peMrsPrHJCYA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040098

On 6/4/25 2:35 PM, Vikash Garodia wrote:
> 
> On 5/31/2025 5:52 PM, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Fill in the correct data for the production SKU.
>>
>> Fixes: 193b3dac29a4 ("media: venus: add msm8998 support")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/media/platform/qcom/venus/core.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>> index d305d74bb152d21133c4dfa23805b17274426a5c..2bb514c322692475ed58198e17f906f894d81cf4 100644
>> --- a/drivers/media/platform/qcom/venus/core.c
>> +++ b/drivers/media/platform/qcom/venus/core.c
>> @@ -709,11 +709,11 @@ static const struct venus_resources msm8996_res = {
>>  };
>>  
>>  static const struct freq_tbl msm8998_freq_table[] = {
>> -	{ 1944000, 465000000 },	/* 4k UHD @ 60 (decode only) */
>> -	{  972000, 465000000 },	/* 4k UHD @ 30 */
>> -	{  489600, 360000000 },	/* 1080p @ 60 */
>> -	{  244800, 186000000 },	/* 1080p @ 30 */
>> -	{  108000, 100000000 },	/* 720p @ 30 */
>> +	{ 1728000, 533000000 },	/* 4k UHD @ 60 (decode only) */
>> +	{ 1036800, 444000000 },	/* 2k @ 120 */
>> +	{  829440, 355200000 },	/* 4k @ 44 */
>> +	{  489600, 269330000 },/* 4k @ 30 */
>> +	{  108000, 200000000 },	/* 1080p @ 60 */
> What has ideally changed in production SKU which led to this change. Pls add
> this info.

I have no clue what's the root reason for the clock plan change, probably
some hw bugs were ironed out and higher clocks were deemed stable

Konrad

