Return-Path: <linux-arm-msm+bounces-52821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1409A75628
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 13:08:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DE0E3AE793
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 12:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6114017A2E8;
	Sat, 29 Mar 2025 12:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BfKtNglN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0D96FBF
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Mar 2025 12:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743250098; cv=none; b=btzq1jBdzOQae3iPKI07yN/h6hTrd5MRc4b/1rn461fnxoZe8iAghObFnLj4OUYHCEc1P8FPwWPnIEJPTcFtyFhT50iTLs4ZgJtcvsqUl912shu61UNWfz0urGdbjrjGHNfvAuPTH4FibVR8CL5wcZXYVVctgyz8FG/Fx6S3TmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743250098; c=relaxed/simple;
	bh=L7JTo0E0gzn7rLnvsNJRz+dUNZ0JNHvemC0kxqfvfjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DuIrpjG+daKFVtHU75Dpcq48na19Dd5Q0iAFcO0LHLEbPn6B1vNLAw4A06BmvFguE7Cs33ZdIEjK6TLwn3S+GJJ7PK1DrRU/jRbSZEaow/M5yvoqjSywXrrft1SsttIa4Eifa7zHAduikDUC9MVADGD/KIbQsgYZMnnF2bc6wJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BfKtNglN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52T7iQc5027609
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Mar 2025 12:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0C9gknJATnLKxpwXnEsHTDid47o633iNtgcda9/d9AY=; b=BfKtNglNc8x1BJ6q
	P917REaxLGWzozaObGTUAmoaBwMZjtNUNARrwSV93ApOYIY07YcDQfWe5Ygve/Fk
	wBMDxcGQ6IbPfDdcKK8lAHkN66mi//XfWRH63CkZMvsYYvqdc+gVklPSF1CKz4NE
	3u0OVtzoPdSPhQAsbkX4RZZVhWoIYGPDHbcN8y493HDEAyca1jHe64uOpSEUGlMO
	ecYF7X10kPT8Vh1mLdsD6DZcZG8NJrzjYv0OHX7CrMCE6Lg1nHZyj2A5yGGIHbUo
	xv8gW8prJ8JDYhNPL685ri1tnwUubDeJq1GjL2S4kxNCN2cPE8yHFo29U4hu+ZHW
	HWKYVg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p86kgqw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Mar 2025 12:08:15 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8f3c21043so6585386d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Mar 2025 05:08:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743250095; x=1743854895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0C9gknJATnLKxpwXnEsHTDid47o633iNtgcda9/d9AY=;
        b=Ai4Zi1Dwi+sV3ZNaK6Yv+8RlfipRp3/rMgXr0ydnDbfMIC+SUJB40QIFD5+tJoZH0h
         fJCcH6/YsH8+8v0ERRbeqK6gz/wtw2ppqGEOz+ZPl2OyRglrARB5l+fgdckqSpdpqVIz
         67Swc9p2Y41R1tTn8ZwkfmjydMtMKOJmhvcvekk3APMbHFY0oLAV/QthO8XQI+Qa8UQj
         TXpufZQbECqiKrfTGcEoWXNDZqzz1e+1H7w9s7nSd6m2oU5dKpxyMBJtfmS+t+3bGkLS
         hW1yplgQH7KMmcq2SqYwsdWrZaS7n3Ia+VAYJ+fJK1Ym1fl6PdRfB79CmIykqys7zMvj
         4cAA==
X-Forwarded-Encrypted: i=1; AJvYcCUbWe9NpTSJsvs1Sg+B5AjN15zty6LVvioLi2EpmFmME8qdiIu6cI4yP27IERZk13trxkouHWiCrhn3yDKT@vger.kernel.org
X-Gm-Message-State: AOJu0YyQP0GMDdtDyUPc9hmWd0Yzd4utTtcOhvXtCIPtYxykd4gpusU7
	l4eYJPor2h8zr0RfLiFo2Esjy+k45YqyN+l+la51quZKJUotY1XGTvGFNmcxegFBdhaPyIXzgsR
	2PqwX4qYM0oaIouN/0PrtGpJHXJrubRQmSTG6XUhyLonnSN3OSn7J1R5wK1LbQF9f
X-Gm-Gg: ASbGnctsXyP+Kqr3PS2rh9coC85X2RGpjLdrE+1PJLTruTJGpifdd94rUYMcwU2B1wh
	y1ydFkpLk4Q8ztVQm0m/XG6/iJ29+0+SXS2s4YO08gcouox8drD2SaiI086sm3NoUsZQuFpUZvO
	6tAOhrPSK+OeNss6v0fhXxPgkxgGuuSqNkNNGJpAfGfdmfrCvBony3yRjqqk9oLZAqTGH8JO4Ah
	6S9Lj0r1kB3xVULOXFAKY5cm9/mxJ3K6AzKe1Zw+GtHe6tVmkLcwwfhdRj5VgdvGmTocMUVhFlL
	0FiB+8qxO8y/am4E6V2DMp0Hv1hmkfo2xt40vXNWgqwX/J3a55SjoSiWuzKWJmS7DnFPNw==
X-Received: by 2002:a05:6214:4005:b0:6e8:f645:2639 with SMTP id 6a1803df08f44-6eed60173fcmr12213436d6.5.1743250094794;
        Sat, 29 Mar 2025 05:08:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHk2TeNdBaucLn9okSalMI69L3QObeCM+4ngmKxDw6cS677XnXJGRFXWModiedovv9j0mcijA==
X-Received: by 2002:a05:6214:4005:b0:6e8:f645:2639 with SMTP id 6a1803df08f44-6eed60173fcmr12213216d6.5.1743250094238;
        Sat, 29 Mar 2025 05:08:14 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7196dd9a5sm316166966b.166.2025.03.29.05.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Mar 2025 05:08:13 -0700 (PDT)
Message-ID: <1bd6d249-e0bc-4750-83a6-db70f2e58ef6@oss.qualcomm.com>
Date: Sat, 29 Mar 2025 13:08:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sa8775p: add QCrypto node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250227180817.3386795-1-quic_yrangana@quicinc.com>
 <ea79cee4-8c47-4054-bd17-2097ada4e583@kernel.org>
 <b57fa204-d3d2-4b74-8834-3f2d93726a99@quicinc.com>
 <73ed6108-27ab-43ac-abd3-82656693404d@kernel.org>
 <4a205725-af49-4f28-ab78-7059451d66c8@quicinc.com>
 <gkjdjzmhtsr4la5ami4qnsqgrd3zzdvu46eyaxpwh2brfsqm6m@wwkuxljbfwa4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <gkjdjzmhtsr4la5ami4qnsqgrd3zzdvu46eyaxpwh2brfsqm6m@wwkuxljbfwa4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W8g4VQWk c=1 sm=1 tr=0 ts=67e7e2af cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=sY3dAEUmMzCiYxic9fkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: TrGlhjdDC2e7A0TMyR7qvArSYmnh2rYO
X-Proofpoint-ORIG-GUID: TrGlhjdDC2e7A0TMyR7qvArSYmnh2rYO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-29_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503290086

On 3/28/25 1:48 PM, Dmitry Baryshkov wrote:
> On Fri, Mar 28, 2025 at 11:34:58AM +0530, Yuvaraj Ranganathan wrote:
>>
>>
>> On 3/27/2025 12:38 PM, Krzysztof Kozlowski wrote:
>>> On 26/03/2025 18:40, Yuvaraj Ranganathan wrote:
>>>> On 3/25/2025 1:00 PM, Krzysztof Kozlowski wrote:
>>>>> On 27/02/2025 19:08, Yuvaraj Ranganathan wrote:
>>>>>> The initial QCE node change is reverted by the following patch 
>>>>>> https://lore.kernel.org/all/20250128115333.95021-1-krzysztof.kozlowski@linaro.org/
>>>>>
>>>>> Use commit SHA syntax (see submitting patches, checkpatch).
>>>>>
>>>>>> because of the build warning,
>>>>>>
>>>>>>   sa8775p-ride.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
>>>>>>     ...
>>>>>>     'qcom,sa8775p-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
>>>>>
>>>>> Not relevant warning.
>>>>>
>>>>>
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>>
>>>> Are you saying this is not the warning seen at merging?
>>> Tell me how it is relevant? Tell me how can I reproduce it.
>>>
>>> Best regards,
>>> Krzysztof
>>
>> Below commands will show the above warnings without the fix,
>> make clean && make qcom/qcs9100-ride.dtb CHECK_DTBS=1
>> make clean && make qcom/qcs8300-ride.dtb CHECK_DTBS=1
> 
> You are probably running those commands on a tree where the patch was
> not reverted. That's useless. Please update your patches to stop
> mentioning the (outdated) warning and just describe your changes (i.e.
> adding the QCE nodes, you are not fixing any warnings with your change).

(please use linux-next/master unless asked otherwise)

Konrad

