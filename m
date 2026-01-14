Return-Path: <linux-arm-msm+bounces-88982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2E3D1DA8B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 10:44:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8C91300F89B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 09:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8480C389E09;
	Wed, 14 Jan 2026 09:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n6abAncv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KZB0RzWc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B1E389DEE
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 09:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768383817; cv=none; b=OPcjIAIm2g/n/dIT8OfVlMY5/nJdjW7ZAsOco9gYMTbeAVFpwMYib85EaF7HSpuTPw5jxTxKGomh7/DucEZUGdW/bH/JebW68PCQ8FFGq88OUIw05qdHJylDLRfYnBc5N8ahWoMn1GbzrmQKxo5t/cT6b6virjfBRtdgwcUe6ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768383817; c=relaxed/simple;
	bh=HHD3SzlXWlyeQJZP+G/46O9PY+zpRJ+xkI9tFVBkWxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jsVdelI6vLNZ2PE7xJCT3mc3TkQg4ajR6FgLFm3xL7riYw5J4brKpHmuG3wWAd3DrvUJCwpJFnKadzSrekx5YI0Jy6TyHwLiifzD6wDW8TjWEDFLlcXiJA132jL05Maq+2DFqvElERj/cj0vY3dk6WLYc70R0dSUN5TJO38jOlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6abAncv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KZB0RzWc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E7jPh83028059
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 09:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UP+XwvQl12po0rGZZ8ZsvMNO1Sg8dVAdvVxDQucbPUA=; b=n6abAncvHwzy1gys
	cof8ylvcbrbzz4lc2tRxByfN6J3faPbfnIBYyDVxWujaegS7BjlmUcPvs2r8aLNP
	GXKFmKeeXrEyo0EtIu+Z+m1xuCQjMLFVm1vernVI9lspBmKK+MM3MLsBrj1YTMXh
	J1orbLlN/qt3/SuslICe2+YKDN9FY7syW13uODjtM7ay8E545o3jtQwD5OKyFfGj
	upjYj/NCZ0zfAdeJnZcgCiJBMG2U2t/3a1Eb1UjZKSb6XlDS3om3i/im5a53anV+
	OY4n+s/r9S1VuZXwtZy7iD6FgVmRiwmOb50gTv2inVIr1YCe8DGOy0gShZDXx35z
	nMxYUQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bny89j1pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 09:43:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88880bc706cso18865136d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 01:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768383814; x=1768988614; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UP+XwvQl12po0rGZZ8ZsvMNO1Sg8dVAdvVxDQucbPUA=;
        b=KZB0RzWcq4TrL81tKQ960JS/7NbkG9pM5yXpThSYfzpvYfkdZ6wb6Nz0s/w1jT6Ov2
         MWdTeCdpkp+mkyy8gDRn2ocP15wZFlgigbGgIg92djhzISxYrhTFkOVpgPUW/HhzaQ2r
         xKFi+E4gSafDBm5Sbcwgajt5tLBlOAj959oVFK1Fib5WOtVWudFOr7nunIuM/diFJTJe
         mb/OwLWsGchvr5B2R4HDJv/VzKTgt1vCb5YbWtlAD68JIX+OgtfyUDGYqQbOj67X7Crg
         1W7axb0ylKF4k3J0YJcmvgKZX7ut+2/ij/J15IbcoA3CPvLjrnmM6td8m0vcUNHfDjcP
         mliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768383814; x=1768988614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UP+XwvQl12po0rGZZ8ZsvMNO1Sg8dVAdvVxDQucbPUA=;
        b=PYw4WIzPcPJIIrCAElwoOiEPCNM0Vi/c/FwcnPd935jLwBoG7NIHXWKUagELAJVn34
         TRnHoXqsXl81MsUG2BeVo5CSRp7fQrtCkCpd27LWx31nyd20EZqKXfLjueofTeLaOTgC
         BK4ji29n5HmZZhJaAgKMSdGzgz/xsPBBCRp/VGdoIaUcagADxRoamiwNFHf3KwVFwQYx
         KnhtebX9anN+ugS8PCWm6d9wBzBwYL4yiiVv8O8E/jduORXZJJRrekeA3rKYMNWvQR5S
         DK0/lBS16RQ1OPDOL34yQTAqS8u3CeTzvPfAukdFYuP+r/+FNjuOUIoMFRTcMGh9FsLu
         788Q==
X-Forwarded-Encrypted: i=1; AJvYcCVybM7ouvEgLGU3tJ5NTheGT0wdQCYBRn0p1O2OkKGopDRs701ioWvKg4M4LOLEBJn0Rn0cEjktZmu8MdDm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2J7zd3JXgrwiESOUdSjf2PLBx9MT8fX8yv1511+OFLqLGyEu7
	qxNQBPKG1GVEW9TnfrkHWB71mmBxDotmELC6MW5esbaXWOMIOzcvHS7VHnCVXaaTT+mbiEUUR+g
	2kjZxlnKZnkF8L1Y39+/wWonYoCsvwHUqM49G/kMBxP+nblwe0k7//BCuJKficNJuclC4
X-Gm-Gg: AY/fxX7gm7zw6PD0BVOaIFpwO0i6+wQyHUyVBdMk2rAQ4RtJlOoswXUWLDCF0Ko6aPF
	ZFdWcvtQxPUFHGDgpNW/ooOld8gMUuIQ4i820JtfBu7BQMxrak8HArgr4gHHEpeWf7+3z+/Sg9k
	J4CycMvQst3PQkdZX4uhd54Gx/7YPioOjkGxvqcLnOnyYYDrRPNexu3pUCTWu7kmKNpIXptVe5g
	46t8l2Kmxa0ma1Ar9FLhev3QlJTuUgh0M1fjKUulyxuOnvv/7bompr+gpX1V4xORH7Zrg8vDbiP
	TjbZA6+8Y3Beme0uU1VeY+4yUy6P/THK5mAc6HWWMmtacvhogqwtm6xgiqDHi19as6W0A15TdVU
	oahqXwjpVU9aKF/75EDBLAevP+2JstPbJRM5QdAc9mp+vzLR1bTJ4a3Ek7aGkN4pZT/c=
X-Received: by 2002:a05:622a:11d6:b0:501:4767:a72 with SMTP id d75a77b69052e-5014823507dmr23131761cf.1.1768383814155;
        Wed, 14 Jan 2026 01:43:34 -0800 (PST)
X-Received: by 2002:a05:622a:11d6:b0:501:4767:a72 with SMTP id d75a77b69052e-5014823507dmr23131581cf.1.1768383813669;
        Wed, 14 Jan 2026 01:43:33 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be655aesm22536130a12.17.2026.01.14.01.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 01:43:33 -0800 (PST)
Message-ID: <d45ae8a5-6890-4263-8aea-62575f71b3f2@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 10:43:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] media: qcom: camss: Add common TPG support
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260113-camss_tpg-v8-0-fa2cb186a018@oss.qualcomm.com>
 <20260113-camss_tpg-v8-1-fa2cb186a018@oss.qualcomm.com>
 <87a31d4e-b604-4b9a-92e9-75fd2748489a@linaro.org>
 <98a26638-675b-4654-a940-898ba9e1af9c@oss.qualcomm.com>
 <e1907273-3d14-41ee-9a22-a963f2b83d20@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e1907273-3d14-41ee-9a22-a963f2b83d20@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA3OCBTYWx0ZWRfX9LnYZm6QXW/x
 mc/SUyHnCRHscXkgc3l7VCkVDRF3mRKtu1uRE/a5Rpy5RQuBsvww0FPhU9s5wjmLSsiG5hlqbTS
 E/tgG3EgJdREuKSCp76to0QVEXSxBSxp0VyUanmnEcGksjejD45Jou62hS+TwUlCOP/6W2Kg1d+
 S+U8P8fc1a8GggFeb0ufG+sMigv5/IYqGVajiz9A6gCMgbLREXMzyXh9o+zodVSjqVE0MKju84e
 /c7+ZCsXWMCscTfNvikyGHAfXQSSIoWGCAzsrGsEw65LGEBK4dpWfyISqzpXMCv4Ncprk/Pnedo
 NMG4uHTNPqE7mYW+I7PF3aPcpplTX23PrYpzoEnMfNva9CmQ79mvKN94D5HDXyoXX4CgrFx91fN
 yPrcjyFboX8HaEkbG1WYwuCsr27qj3XCCiBvCGzBDmF/64L9wJkCC2w9Q5AJCTky+CWGQkeoy2e
 mSESbAx+4rHr/dkwDsA==
X-Proofpoint-ORIG-GUID: tT7raY_v6Eaf6synsqTMJI1O4ctWLVVO
X-Authority-Analysis: v=2.4 cv=efEwvrEH c=1 sm=1 tr=0 ts=69676546 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=eMJ58_vy7G6fnsrVVIUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: tT7raY_v6Eaf6synsqTMJI1O4ctWLVVO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140078

On 1/14/26 6:05 AM, Vladimir Zapolskiy wrote:
> Hi Wenmeng.
> 
> On 1/14/26 05:04, Wenmeng Liu wrote:
>> Hi Vladimir,

[...]

>>>> +const char * const testgen_payload_modes[] = {
>>>> +    "Disabled",
>>>> +    "Incrementing",
>>>> +    "Alternating 0x55/0xAA",
>>>> +    "Reserved",
>>>> +    "Reserved",
>>>> +    "Pseudo-random Data",
>>>> +    "User Specified",
>>>> +    "Reserved",
>>>> +    "Reserved",
>>>> +    "Color bars",
>>>> +    "Reserved"
>>>
>>> It makes little sense to mention the unsupported values, and then
>>> introduce enum tpg_testgen_mode to list the supported ones.
>>>
>> This is for ctrl menu, will do as follow:
>> static const char * const testgen_payload_modes[] = {
>>       [TPG_PAYLOAD_MODE_DISABLED]          = "Disabled",
>>       [TPG_PAYLOAD_MODE_INCREMENTING]      = "Incrementing",
>>       [TPG_PAYLOAD_MODE_ALTERNATING_55_AA]       = "Alternating 0x55/0xAA",
>>       [TPG_PAYLOAD_MODE_RANDOM]      = "Pseudo-random Data",
>>       [TPG_PAYLOAD_MODE_USER_SPECIFIED]    = "User Specified",
>>       [TPG_PAYLOAD_MODE_COLOR_BARS]        = "Color bars",
>> };
>>
> 
> This is also not perfect, still userspace is misinformed about a number
> of possible TPG modes vs. a number of actually supported TPG modes.

If the values are really reserved (i.e. don't do anything (useful) today),
let's just throw an -EOPNOTSUPP if selected

Konrad

