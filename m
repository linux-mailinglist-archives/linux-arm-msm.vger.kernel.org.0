Return-Path: <linux-arm-msm+bounces-88042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC67CD03191
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 14:41:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F39A23084D56
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 13:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C010442EEC8;
	Thu,  8 Jan 2026 09:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="plQhJESP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MRdqOulw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1AA433BF8
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 09:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767864142; cv=none; b=B2dDkjhkPum29AbfvPHJT2dbd5UW6RVv6dtKUVeHdZo/Ztz8FaOW07tJTXZ/940ykuSbC686hI0D4SKyqaYsIPgIM0UkI/w8R9LE67MQl53Wr0cKw4TZzm4qbfk5acAclCfm2C+gAbCKczfjDnzymAM7C7U6zquSfVHGfAd5elw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767864142; c=relaxed/simple;
	bh=NykHxiLesQcmL2nusIInhtRLoMtoWy5GzdgE9w8Y6EM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BpmlFhcGsmXKL7bI1NPiptnycEp0qDeWcmP5CgTZhUC1b+HfLIZBO2Zt/EUE1eRdUrDLlWlJxSYLzSXzhBOl0kBRrJL/S//XIKtv3raneROLPpSPBJVYvKXaAUnzF7sjFPlT9rOAkkE8pRSdlUVBYEpsoZ228GGug3XbrJQuJmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=plQhJESP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MRdqOulw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60872JIc1496306
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 09:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NykHxiLesQcmL2nusIInhtRLoMtoWy5GzdgE9w8Y6EM=; b=plQhJESPDxEeM+e6
	WXA3kc/FSUTvnZS1khnkQ/Vjx0lvvLW6JQ0AE4QeMbPjlI/iVXQ98yXUt3SLs8F/
	0VGcfTyI2POoi/JlLLyev8vCDbJlIy9LP6BBYnGD6SpbVlrRB4e/NicTKFXxKnBJ
	nBDzQ9QVlHg2CBAHq7ubQ2swcWWqDXD3UeZ/zyhpb649EQV45S24Qv4KGgFhM3nQ
	f7OFya0bzEfnloulgLTlSqfxe6qBs7xiFDREP9FU2hj3fip1f60e53LDINSpBOsf
	G0RdJ7zWPVd/tpneNzO8uO5uACEd050IBCJVc5KuQy6HXi9R1rMB+RzadENkNLd6
	Vnqs1Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj7ua8daw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 09:22:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee409f1880so7377551cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 01:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767864132; x=1768468932; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NykHxiLesQcmL2nusIInhtRLoMtoWy5GzdgE9w8Y6EM=;
        b=MRdqOulwGjBkG2W6NFhyOk9RuY6so+CVQb2MWm6U9KvkRELi2q2Ao/3dLgP5xHrptm
         uYAHdkw4zGueAtqM7JoPBC/ooy5m42Sxstw8O2ZUb3ksFTt6EQvb1MoAqZKwjVgeaw/t
         jPhCl5DZMUQPQik9G6J5YQdsP1C2saszyIKRLj7vQh3DHf7b781SsUABvf1v+DJq7Y8w
         H4cke1kFA9nSFrjIYcc9g1BwRGP2HwEgyb97g2RSyPlz2sj7BWW/R/vzatSOZaoo+vyx
         ypZtAzqByhOvx3Ip/IhX0+s073dFZRgef6sRvC8emvg1t/JWEFj+veoaiFkDprzyX8N3
         y+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767864132; x=1768468932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NykHxiLesQcmL2nusIInhtRLoMtoWy5GzdgE9w8Y6EM=;
        b=lTyT+p2UwTMw9OzRmi20Sl601pQl5OZ8gZXVJqkuW4cpG0227hxYaSp7vXi5eAID0f
         LmniNNsPK6f0lDxMWmDAwdo1YNfEuEoJVbbLT9UOf7DqokSrbkaoIXxrfW/OFjdg2pgu
         PeQX2KTywUHmjUSanMqlIT3c9V+j0Q/r7SXolRq0qS4OQEgJb7mQrSirpzovUUhC5sXZ
         lCJHKXzOe1S5OMtyShMY64yS4m+2xewFFNwRMsIRNazmqj+x8rOemGYrXbzcDEycgYi5
         64CC9pu3HC/NIDr2HyihrNR9CcIxx2jVjU5pxhl/hW4KE3fqDKLoLkuZk0zclkoMl8oL
         vI2w==
X-Forwarded-Encrypted: i=1; AJvYcCXGZeJQJce9YgfNtyVKOBvXLVdPeu8kGMHS23Z/8gYh51AzSl9CvZo1lo7YbETedSAl15CQ5G5BwyMqjcNk@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjs4uW9lpiLhkCpHw9N0hyN/U4it0PfwgFIOvHC8zOmpanOJna
	Hj66MLcYs9ls/RpZvUZ92N9M8qT5SFeqedNFBbGFMyOsDWA8Bd9+T2fhpWgw5+xndViFq4WuKI3
	KbzY47L+O9q6Helxz5+0lNNk6+8XxwJcD4biggWNRHEUqwwWIWaoEl0oOJqhF4xglkZEt
X-Gm-Gg: AY/fxX67fZfJ24CIcWizTfMQHs1ffYCaZz10dbvw9UUiekoa6ehADnRFmn+L2kK+1OP
	vRA4JWj14NXzQz28jrDag/Yf3ouRCJcaxpPUeWZtvtmZgDUo8oCjrwXdCBriIP8Trjv+djsULHL
	Pfu4NZLauI2Me4x8a7X7RMKwGm44oSCGvRwOU58ZRIwj5ZpN4x7+/+o138U0TiCg5rW8sxv3tht
	LELjBKWThOiUODt5MVFWdgq+zTG9cNAS9zArEATgk2GdTSlAnc3r7HG2twF8OFHUOPxZDegAY30
	gP/sbPi6PTkVGe07OEezaA3KQb+DZOWSW6/TGqk/oLbialQ7UDsdqCyCu4FE8PynohVWDbHhgEf
	Gur2i73hFPUHZk7jVpDHlWINFRGw2ObFUjWVUavse/zoUueicu5Pu1AijuYs3+nxIeXY=
X-Received: by 2002:a05:622a:211:b0:4ee:2638:ea2 with SMTP id d75a77b69052e-4ffb4a73847mr53808761cf.9.1767864132592;
        Thu, 08 Jan 2026 01:22:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGY4wdNCuBrMFoo9DDpE5DqvPtrXyk71CRz9mJOSVhhSxeHi/+bMqRghkU10RrDVSHGxOxCIg==
X-Received: by 2002:a05:622a:211:b0:4ee:2638:ea2 with SMTP id d75a77b69052e-4ffb4a73847mr53808561cf.9.1767864132191;
        Thu, 08 Jan 2026 01:22:12 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be641e0sm6930953a12.22.2026.01.08.01.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 01:22:11 -0800 (PST)
Message-ID: <52778327-69bb-4f6c-8d64-094f33809480@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 10:22:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: backlight: qcom-wled: Document ovp
 values for PMI8994
To: barnabas.czeman@mainlining.org
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
        Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>,
        Eugene Lepshy <fekz115@gmail.com>,
        Gianluca Boiano <morf3089@gmail.com>,
        Alejandro Tafalla <atafalla@dnyon.com>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-1-8687f23147d7@mainlining.org>
 <45a2b510-c825-4191-975a-1389f4f18903@oss.qualcomm.com>
 <c7bca43b1b912a6a100d83229d78abde@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c7bca43b1b912a6a100d83229d78abde@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2MiBTYWx0ZWRfX1wy9VUK2/n/B
 M+ES5pO3/aDkG+xiABXIguQUlahwJn9co+n6/RsnEUJWfhIjEckXAwJHxrORllXvrIUEd6wNeVc
 /inSiVI83NU4O02oQ9wDROqDI53mxxSqHYZ+6kCKt11mOVo6QtJ3NKDpEv8//W5G1cmKvhOpHUb
 HVA1itoxqX7RpZPn5jjBcJ7F/dqUexQ3Tzkkf0bvc+e6lOTJYqTkgJSNWpKkYIMox5TenOeiTbg
 g6DWzcyaeU9BI2Raa5NDt2yKRiegZbsdxh8mN0kyvJVwyHwmticQDnIRmLW6OpZl3/vd4gm5nrR
 MSm2XmXFltn7RE+lt3BH07GQj032ByHeWEq4XSy17BxWITmez8gtBMRg5QN0UTuuphA4UBYPuBt
 Yi3uJIbw9n+hVdjGEv4nfff4mCdx3iApWKdQj00/saW6AcOwVhF1TEdezsJAR7NxYLAct3X6/B7
 8uPPb8BFS4k3mdIg0Hw==
X-Proofpoint-GUID: mUEaWt9XWwyeZYzBmwLsE1xtqCZRkWUq
X-Proofpoint-ORIG-GUID: mUEaWt9XWwyeZYzBmwLsE1xtqCZRkWUq
X-Authority-Analysis: v=2.4 cv=XMM9iAhE c=1 sm=1 tr=0 ts=695f7745 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=mtDAOQl0mCcS2X4wXL4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080062

On 1/8/26 10:17 AM, barnabas.czeman@mainlining.org wrote:
> On 2026-01-08 09:54, Konrad Dybcio wrote:
>> On 1/8/26 4:43 AM, Barnabás Czémán wrote:
>>> Document ovp values supported by wled found in PMI8994.
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> I reviewed a version of this that said PMI8950, which is very much
>> not the same..
>>
>> Let me try and get some more docs to confirm or deny what you're
>> saying..
> I have sent it for the previous revision msm-4.4 contains the documentation.
> https://lore.kernel.org/all/95f7c89fdf9b856f567a498cc56ecfa5@mainlining.org/T/#u

Right, but I didn't send any reply acknowledging that.

On v1, my review tag meant "I concur this is the case for PMI8950"

Because you carried it in v2, it appears as if I said "I concur this
is the case for PMI8994", which is not what I then said.

Konrad

