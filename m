Return-Path: <linux-arm-msm+bounces-61307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99966AD9F79
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 21:31:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CFD818991F4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 19:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0612D9EED;
	Sat, 14 Jun 2025 19:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FixSNMyp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AB418CC15
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 19:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749929488; cv=none; b=Eip0UsrfmK5IGEiMINM/GY8jWAORlX/YUSSedy1VtkTYA0TWU55mLYepdnKElA5XVcUb9cA0gIWd/kHboeZuxIhYPBahtnFq9gqIXizr1EnM5UQmfuc7Sg9Bnn15T/SZnSWsAaKOdbG7kfzuyQ51F8BpSCBiMsJWDXz6pSo/UdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749929488; c=relaxed/simple;
	bh=6wGaCAB/yIhoaUvyyK/d54sw5+H0cGEiYk19Zi4EpmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rqejnMxXgYoM8jauDcNfYF7oeCmIIxCS71h7roXCDX9KhPO+5oi+5nzi1Yy0j0mtVJm3uPbkwZx49Dn5kuC3v7m8ljhGCJyMkN+XYa4kbIcaXisQLdhbm6gGD6Koa5MTBi4Iv+tQS3+kuqa8E8+GoUoDfpKm3yHOR7un4Ip+ES8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FixSNMyp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EIR0eG002075
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 19:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mbw1P4iXCotc1yh/8nVbKSU0NE4NDWyxlScBFeQNPNs=; b=FixSNMypvlcekly6
	9CgCLhV4YCpqlJr4U99JLRgV8n+K3ZogPSYaC+Mz/YbMRWsg8eisRDDpV4d7wMTd
	q0OFpjc4NqY0nH1C4ddHNuWc4+0Cv4kf+rVvbOAjhg5NqB7eg9spAIK9454E0S2h
	+kDf56NkLwZJGPpLtQ6WFk4+DXoQ3SXeVFykuHN2VoMNMlDx5zJ0WcuObUBGzO5c
	/wnh//Q84LS4GCadibCO359gIWBynOfVLG0dO2Ga9jj01rdmiaYh7xO690XjXawv
	BOeNX0atjQzpLva5YwjZCDZjYMNWH5BsyE0xWmmtLaXQp3JeBM9R5bCLcj8lYB9b
	VQ6dgg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791ug8wug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 19:31:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0976a24ceso99702285a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 12:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749929485; x=1750534285;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mbw1P4iXCotc1yh/8nVbKSU0NE4NDWyxlScBFeQNPNs=;
        b=YWKd5cNt9FYzPXnKMY1dqYuJhGi5WzzztIwoSkXBjD0L+CacC0k/TVp5JGeDTeP0zB
         4RhL5dunB2ROMsOZkXRLnTIIKWPYaTXhZKNOVQ8Ik4XO5GHg8rKMgtpoyuvOQYBPKUdI
         1Tq5Ylumd87Ahy1KVlcfOMqZNKUqnEWcZo8dKNRXBLvPo2CMk6J2e6I4hwPe0I3/hENW
         k1T7eqwi/iCrnBmqHpyeulPjzfee4/Sb2oKto9Q3J+kZF5oc7xTL7n9TUJ1BiYMLTlTr
         gfoQA0ZhYSKBIki+sFD8GvVbNqTxVslaUhE4rnp0A1+60HFs5YoRHQ0hqaEmEo7SJBzR
         ubug==
X-Forwarded-Encrypted: i=1; AJvYcCVo17IVnAkSF/Y7NYvNYgyMFy0eQ3YN3eKp01GP7z9ZEvDVWK4i6g8z+FgA8Cm8IUsowob+ONSXqtB7VioZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzrkH5CT8zZfGnqpEL+bjZHtVVm8pNp5GYMQAkKRFxt/ypmg+2T
	eEJnDc5Ta+XsFFCquqjqTnKLh+5mwA9tVDcXO1SO2qQPKR/OdITiSCIB2e8CVCday0OVqQKHY1c
	Qp8DvQ5IDMHxRHzbkyjsmhb+NbftuEtFg1tDdPWv+EcHOzrudq+GOuZdHieZyclJBNSZA
X-Gm-Gg: ASbGncuUxInu6oL5BjcxeTZm10DkfY2/ng94fkUz8oQcPn2fG2/NIMna88no3YBo/jK
	xalPyCbljgndXYVAjKqMZokZta6yy3L8lJcs2SGfo6EKpVCS8Kq6k1gorIosOdD9N+YuMyZ8pJC
	c0qyefDRw2TLWRBpcUpRTHe8wiRi6deS28usJt+yu3DhDgDAsEcrdQt/BP3j7uIYml1Y+Ppq/FZ
	EXEHL6fBaFfiL8Pj0NxbKDWZ54Jnih8JvT4z6vkC+FAWaE9k8s97CVY56Bi98jdouJiNdSz9vUL
	hu6yTfsVisAqNq/oCeFZkG4EAF3nffGYUHEVKRlS+BYdQsv0cnG9p+xKl08HvXU+e7II6jACYsg
	VkOA=
X-Received: by 2002:a05:6214:f2b:b0:6fb:1fc:7889 with SMTP id 6a1803df08f44-6fb47834635mr22006046d6.11.1749929485075;
        Sat, 14 Jun 2025 12:31:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQrPaKrJs4xim+Pui0DuU9UY0DDQ3xWTfjg2bIlpo0NAve4AAaX9mVrjanKcHXaWRaFkpqHw==
X-Received: by 2002:a05:6214:f2b:b0:6fb:1fc:7889 with SMTP id 6a1803df08f44-6fb47834635mr22005846d6.11.1749929484685;
        Sat, 14 Jun 2025 12:31:24 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec88ff5ffsm354178566b.106.2025.06.14.12.31.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 12:31:24 -0700 (PDT)
Message-ID: <9e383935-a10c-40ec-a63a-243cd028374e@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 21:31:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] dt-bindings: media: qcom: Add Qualcomm MIPI
 C-/D-PHY schema for CSIPHY IPs
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-9-vladimir.zapolskiy@linaro.org>
 <6e411e89-ce1e-4d6a-8d48-b800554f830e@kernel.org>
 <e9afdd0f-7842-4780-9044-d5afa6a09d7f@linaro.org>
 <b96f9cca-cdd4-4456-8ced-f4a8fd810ff1@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b96f9cca-cdd4-4456-8ced-f4a8fd810ff1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE2MyBTYWx0ZWRfX3s3gozzho/zF
 lAWIV2D6WfBYB8ccIk3Y3E8wmRDIvVwKdp1ppt195hZbZS3Jsp+bY2B7LYNVgcR3+9gvxWW1NUr
 T26KWpt0uO3+3i7jxzfN5P40x08ONjIrNBfQdPwSPjN8E69D0F3ybIjGMDvNc/lj27usHS0Y/bJ
 uDEcn7WD20VJze2zBtYTaWeWqfsYhIfXHIVTL4jFylPbwhvIid64aXHZfXMFZ0+gmv2c/k9j0++
 mK3yOvYD4qUVX8+f+ZKYqBR01MaTvKZW+eGcPUa2dmmB/BbSeU27Y+FUD6qiW6cLclP7eWJWr0g
 T4PIJu83ZP1rMGJkv0vATtY1oQibFtumhXJf5smYbQhy2kAsf2mlYR+ebTn9PSTrvMjsDV6aAd3
 KH/o1uZw99VzQkrOoPJQHiG8a4yX/QgVjqtL3DNDQ7hWFd3IrTY9JMqNNxZDZhl1AY8aVNBY
X-Proofpoint-GUID: 2uVF_67L4QKCd6a_7zzJ5h-EAFtiSwzz
X-Authority-Analysis: v=2.4 cv=NtnRc9dJ c=1 sm=1 tr=0 ts=684dce0e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=LZMvtdFs93sqpN7HcN4A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 2uVF_67L4QKCd6a_7zzJ5h-EAFtiSwzz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506140163

On 6/13/25 8:28 AM, Krzysztof Kozlowski wrote:
> On 12/06/2025 19:13, Vladimir Zapolskiy wrote:
>> On 6/12/25 10:38, Krzysztof Kozlowski wrote:
>>> On 12/06/2025 03:15, Vladimir Zapolskiy wrote:
>>>> Add dt-binding schema for Qualcomm CAMSS CSIPHY IP, which provides
>>>> MIPI C-PHY/D-PHY interfaces on Qualcomm SoCs.
>>>>
>>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>> ---
>>
>> <snip>
>>
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 2
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: csiphy
>>>> +      - const: csiphy_timer
>>>
>>> Drop csiphy from both, redundant. And this points to the first clock
>>> name not having any useful name. Name equal to device name is not useful.
>>>
>>
>> I got the rationale, but I have no idea how to correct it, since it's
>> literally the case, the first clock name on the list in 'csiphy'.
> 
> What do you mean by "list"? You can point me also to internal
> documentation if that helps.

So if you do:

"csiphy_timer" - "csiphy_" you're left with "timer" which makes sense

however, if you do:

"csiphy" - "csiphy_", you get "" and Vlad is wondering what to name it

> 
>>
>> What could be an alternative name then?..
> 
> The real clock input name, signal name. You can also drop the names.

I don't have the docs before my eyes right now, but I would not be
surprised if it's also called "csiphy" in there..

Konrad

