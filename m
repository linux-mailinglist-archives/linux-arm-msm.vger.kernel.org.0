Return-Path: <linux-arm-msm+bounces-72937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D280B512D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 11:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5B43441A0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 09:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6444C286894;
	Wed, 10 Sep 2025 09:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nSLTTmZn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C412030E825
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 09:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757497239; cv=none; b=Tti9uCgyXCPmbK09SF5Vr97xcb3VftDy9NUntxPBsiTSrXGrys1AztlIaaTORt8a35gsPCzOJMFeIXioiUePVzTdJNOV/S+J1rUwY8/mVEd1Guu3WVD8hdlqoEIIvJdSWJDGeJ1OyH8fTUqt4kag4g2TX7G9i4Km4lh35RLXJbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757497239; c=relaxed/simple;
	bh=PMrygF5tQEBETNNlK2TURt60yHgbiNe7/3/KcHUD8tk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HWcAAI1hqYIPMrNqRXs5nKu83PciJNNqUDowv8pXdAIRkaWp5jjo3tvqmIzJyyefqWdhtJGyZ22SVseLiWEhgQxQ2vg+NBuzNyf5cidcGcn4uOzwV7TiZBUSsmcT8etW5JG2J9XRPM1OwrtAzY/qs2qcu7PatswUkxH+vfE8j/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nSLTTmZn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58A974ID027346
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 09:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Gclb0Ihbq4U0dzyWeLi7fsQ8/l2l+bvwlN9BvdXuZ0=; b=nSLTTmZnKr6ScU92
	Fyb392PZn7uFi1XNswYjKJ12/rbtN2iAb4OajNPKN0JJJpB8uJi1eJMPeX4greiE
	9sZ5s48WLAUzk+c1QSV2NBPzOGVgcNfQ8zB1t3h8y3dMfbZzQnQbNBl2MH1L9Cz2
	G54kAIe6rivYEbIG/WWRs0vd9NSB/x/3fQWPIOfGMEkNiYMI+kXJNLAd09B4AvWg
	DWjSR1c105Kx7ziFCn6LAPfgdGYLY664rK7gONlhwPZ7mZZOrTMQael2gSyPlNFm
	s9A7krBD1swlKPefKWiUV4bf298daJlUjKy4kopPyzK+pDl1/UORNLNYhmZWBJA5
	1RiLow==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by93dqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 09:40:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-329ee69e7deso6462315a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 02:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757497234; x=1758102034;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Gclb0Ihbq4U0dzyWeLi7fsQ8/l2l+bvwlN9BvdXuZ0=;
        b=Cyex4oGTt9U8pT29Ykhbxd5a1VvJWdOmDh+DHNnmS4e5ompJvIedb0gXbMRdR7NxfU
         J4Gvtqcl5Lnk3/aYMphzmBvCoxvoe9thY9seynNR/0B1yHH7UFATkFcXAwR1FXcgb3QQ
         XBqyiKyIsDqGLTzyLGjIvOR0EIlTdC7GqhbD40lURw8TxffgXt5wRVCYda7ib1zuI9cP
         1P79FrzaAUrDSroE9VuEGEZaBg6n3VCyFfWEBjS4DD0Zet8d3VDNG0LtcnNd8BOHl9t7
         cSG0C8rmK/FAPeFwVLjkh2fWlMD47nSSqOhQnlKEmfy7YOH5ccxop1zGP9Apyocmq0/p
         0bwQ==
X-Gm-Message-State: AOJu0YyK0gaLa2T4NYnw1BkTPt0XDwA6XJYR+WN6QgqhESVS+oeU8oDR
	wF8xZUzZsC/mWM1x0Vwd1PBM285t5bvQRa2J86TG0SdUJi0l+JgjgfiTiFQEO1SskK/trAVNCj6
	NRPurxorLQ/c3pOiWFCR0W7Xw/thmOLbtRHk4cXRCtiMbF1zqq0gW+v0wfy1xqFuk9O6C
X-Gm-Gg: ASbGncvNiXNkEl7SJQfXqYwOzshp04K4sQQqFxTVLltbN+koZMDlF83Gy3fwpUbzTwz
	BLkBUV4QMJeTGGc+XspUIKtL4pbLeYHKVrFWEI3ivM8Z0SrEXMW/8aRRNj8G/3nALZGN2Jsl1Nt
	MzwgewWFKGq/Tb7MSj67G6KLv605PL+ZScH7A0p1PDE/v97CdTRaMJXSGU/9GroLG14vN+gExF/
	GjaiXWsNE1Ae7rbMj5ZedVSPzHT78uo7/lhuqcwh8FDKJPkQVqIK2kCrH9XttLCyxUGT/1sKZPL
	Orny5SU9Sh54pvUcC1kOV3hP0vJw8X3ZObFQwzoQoRMxvGPHPKaczN12wKkSN2FRv3xx/slBvqp
	K3A==
X-Received: by 2002:a17:90b:4e83:b0:32b:9774:d340 with SMTP id 98e67ed59e1d1-32d43fb9041mr20757082a91.33.1757497233998;
        Wed, 10 Sep 2025 02:40:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaecEzrQFrPqSdW4dQERZAIFQpKAkVm5A9reVkG5A2GgX835tsdd4acUFKiggHGiBsSO6+GQ==
X-Received: by 2002:a17:90b:4e83:b0:32b:9774:d340 with SMTP id 98e67ed59e1d1-32d43fb9041mr20757048a91.33.1757497233496;
        Wed, 10 Sep 2025 02:40:33 -0700 (PDT)
Received: from [10.92.178.42] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dbb35576esm1832190a91.16.2025.09.10.02.40.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 02:40:33 -0700 (PDT)
Message-ID: <04554d6c-132d-4f3b-9284-4b54d5047805@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 15:10:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ASoC: dt-bindings: qcom,sm8250: Add QCS8300 sound
 card
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20250905142647.2566951-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250905142647.2566951-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <43090acb-ea36-4015-b14f-78d44d789d42@kernel.org>
 <a9507045-b900-49ee-8841-0f8fd30816ba@kernel.org>
 <abc66798-dc91-4860-b0b4-de39a58b5745@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <abc66798-dc91-4860-b0b4-de39a58b5745@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68c14793 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ExpgeREpyeptk5CJGqkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: l2GnP7Ynvbfmjg7LNcMGxt08pSEBymRE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX7YaZ8B+YK4QJ
 g3G4FTtVeWFwlC4Qcuswg/wAkNedF/5wmIUjDIZjqS+0U0UrqkhX++pckH3AIzRasoFwcj660+C
 3deClNL+aTFYg9ozoWGARBjNtYv0Vp+GE0G+o/fGIbvSdoyYPCLtUDnE/hk3JFRLQibFaTqDFDS
 7qDlsolV7IqvZDR7JY1tJQsx8kLCOep0YfnHW/gIIr4Zn6LiI6xGbskfW8uGPNMJWknyG9xoHKS
 cKLE178Ml2YC1mh6DdPcva5WUN/R+IRvCIwsHZDPhlvT6gQsHmZGRDl0ZfjU+tjd12bDa2A41m3
 M+9NzrN2uLTwlWK4zMMEB+drMO3VOSQpZGGcKj5Ghg1KCXPkjgOqz+BVghTvTWcRQe+fN+xIjJF
 AfVlfbzZ
X-Proofpoint-ORIG-GUID: l2GnP7Ynvbfmjg7LNcMGxt08pSEBymRE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018



On 9/10/2025 1:35 PM, Mohammad Rafi Shaik wrote:
> 
> 
> On 9/10/2025 1:09 PM, Krzysztof Kozlowski wrote:
>> On 10/09/2025 09:26, Krzysztof Kozlowski wrote:
>>>> diff --git a/Documentation/devicetree/bindings/sound/ 
>>>> qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/ 
>>>> qcom,sm8250.yaml
>>>> index 8ac91625dce5..eebf80c1d79a 100644
>>>> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>>> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>>> @@ -35,6 +35,7 @@ properties:
>>>>             - qcom,qcm6490-idp-sndcard
>>>>             - qcom,qcs6490-rb3gen2-sndcard
>>>>             - qcom,qcs8275-sndcard
>>>
>>> So what is the point of this compatible? There is no user of it and I
>>> think you added QCS8275 for this case exactly...
>>>
>>> Shall I start reverting commits from Qualcomm because you post patches
>>> "just in case" and turns out they are completely not needed? No single
>>> user of such code?
>>
>>
>> @Mark,
>>
>> In case it wasn't obvious, please do not merge the patch till we get
>> some clarification. For sure it is wrong one way or another: either
>> incomplete or just duplicated.
>>
> 
> The device tree currently uses qcs8275 as the sound compatible, and
> the corresponding Device tree changes have already been applied and merged.
> 
> Reverting this now would break the ABI.
> 
> A new device tree patch with qcs8300 is currently under review:
> 
> https://lore.kernel.org/linux-arm-msm/20250910044512.1369640-1- 
> mohammad.rafi.shaik@oss.qualcomm.com/
> 
> Once the machine driver and device tree patch with qcs8300 are accepted 
> and merged,
> 
> I will promptly submit a cleanup patch to remove of discontinued 
> compatibles from the machine driver.

If the above explanation is acceptable, please help with approvals.

I will submit the cleanup patch to remove discontinued compatibles,once 
the qcs8300 support added in driver and device tree considering ABI 
should not break.

Thanks & Regards,
Rafi.

> 
>> Best regards,
>> Krzysztof
> 


