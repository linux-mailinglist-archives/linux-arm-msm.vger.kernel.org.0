Return-Path: <linux-arm-msm+bounces-76006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 257ACBBD4F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 10:10:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E734F4E1916
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 08:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694F125A357;
	Mon,  6 Oct 2025 08:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jEp70esJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C719F1C84D0
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 08:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759738207; cv=none; b=jsHkvWs/FGKEJDEgo0IKpNe/bb/1/wbBWPnM9GD4Hp0Lr8CcmJtxmDq9h4mLxnhvPkCw/kWlnpTajlk2Zv3CDARL2GYLD1bBFSLJz1zXKK+KIgkZq10haByt1cE/QifwGlT/MGHl6bx3OMdRhEt7i9FoeF1HUeJ4r0upbMq+Y4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759738207; c=relaxed/simple;
	bh=rRqbDNJJozQdwKsc1j1gRxEQnE8tCHyuKOkR/azckzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZZaqNIqWeHZwAEfKfqH+n/R5NtDew8lcDgTOojMS2PcPmcJnm6ff8NdSGGQ/jmJoIhGPa/gLfFj13ZV3XXB0bb5QEGObUBumJo2v49lgmujTs4V0eM5Hq4oXGzFNy0zXZYa0k+AZn0+FDDTxBZpSG9KPWuCGHBVFvEi11CBSuv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jEp70esJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5961OspY001364
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 08:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	45B2sK23pf0jnxjuCOALGNeyqT1UiqcLuxhMNfIiCBw=; b=jEp70esJYas4wP69
	EowecLSY7WmaabZdARHwHT9ugwH54IG+TlFi/IhroB7Lz1f1yxlKOkS8J8Y4Z41o
	Px2+FrIDWNQqpLXwEM4IzeCtnPbtIN6o58bre1rNlNxnRxrd4t4k1B3Ry10++8TF
	mlvMshue8/KWZHpR2XMJDBtR2TNdm7LEzdbpNWPJaquD/OQ7u/j9PqUy1XxvcGyL
	o/LzQgyYOIHyGJYMVeVtcTOdsqE9vvSePh0mSsHdf0QpWWQqCmD7df3FBeQUcz99
	O9RqVrC1m+eA7D2i5hfzl8MQfDapQSlElEBIw6B/0KKGNAsQzWcMjoDgH2AbodBR
	Rh1i4Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy6u7qx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 08:10:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-85a8ff42553so79756585a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 01:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759738204; x=1760343004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=45B2sK23pf0jnxjuCOALGNeyqT1UiqcLuxhMNfIiCBw=;
        b=J9fsADPJxIlsqe6rYX7cGS8GHNHqSVYbW35QiXWxVe61Lu3nJ8MukP0Svfp+lhb9bm
         heaT930cQD+p8qEfVUdX0/BhWA6RzjuTqZmwyIqngy4VPTe9uYVVvP/hCL1pKMRuUWMP
         XFcjWkQuZKOe6AnjCqm8Rz3yw7fFFBE4FLJxgPIzFJXIoVlvPG3xffyWTA5zZfE7fwSe
         yWMZOLHcvt9qorwVo/lUWKAmeJW0tm4cUs7LdcQFbeloilp7cFUOoHjQbAJDMfZdjfld
         xuRkM4smcDrU52nLH7tGnyuyFEFcfL5CugW5zn16vkwukRd9P6pCZz2qhUARBcgmPvti
         OTTw==
X-Forwarded-Encrypted: i=1; AJvYcCVEr8yFhq+bMOQWFNddKPoM6tCJ/LKVKgFrODBXVYYI0cOAiq5ljhn1J12EkU8ICWyGXnl1uAZ+nsSiv83y@vger.kernel.org
X-Gm-Message-State: AOJu0YyCG2f8qS7sY/wgGxQTMnj1V5ciD1WZpUNpHSO04HSc4YfQ7uK7
	jOPMdH13Gh89W5CGVVDYikvhwn6FnkC3jZXPOMET0oXOlMHXx6RRFvO2rhT0/15tPrWI938QHqa
	QyTFdvWw+7GLRX5PYkCdtiJXEXPd9LGU9Fp+1i86/5FzO0ot8Fr4WXZQwLddGSJDwb+V6
X-Gm-Gg: ASbGnctA6/1M0vb6+ghmPR/Km2tdBbX7pMOxUl29O10jZ1RNuIZ4vql7vsnwNv17Jeb
	NHspedD1oKRPD62SU0H7udz4cjfAbJDt3UApm32ulnyBs2NNttiKAgsDJJITZb0WXENC8a9+fXI
	ZUgv89KFgv+mDocXbPoqKQdYFgtT4VslLAdwYt0L/nIqNv+2Evo9IikgsbMQB23SI28Pqpqsktf
	fQzSUbd5iiuMB4xJ9i1kVVbLUFXydiO+m5nToIWFQcDspa7ukftBaBgyCBxmvfjEEk5NHp2Jw4N
	0uSsbOJlhFb6Kh7N6Nh/GswE0qtkuRlD/2+LFN67f94jAt8hResoepTDeMiluirPHmqoCCNOVwh
	7TBwRwEgJsHck6pMCwUpzJlKmfXk=
X-Received: by 2002:a05:620a:28cd:b0:866:6f75:5928 with SMTP id af79cd13be357-87a396bde94mr937573885a.10.1759738203818;
        Mon, 06 Oct 2025 01:10:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcCPRHpyle444crx8NKZd5cvmWSUSXE2YNbj6mR8rWkfiaXnSKsWJlcawCI5kXeKEqRWLX9g==
X-Received: by 2002:a05:620a:28cd:b0:866:6f75:5928 with SMTP id af79cd13be357-87a396bde94mr937571285a.10.1759738203331;
        Mon, 06 Oct 2025 01:10:03 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869b4f1d1sm1074256066b.71.2025.10.06.01.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 01:10:02 -0700 (PDT)
Message-ID: <6807638b-b212-44b9-b7cb-e53e1f11c0d9@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 10:09:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Documentation: dt-bindings: arm: qcom: Add Pixel 3
 and 3 XL
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251005-pixel-3-v1-0-ab8b85f6133f@ixit.cz>
 <20251005-pixel-3-v1-1-ab8b85f6133f@ixit.cz>
 <bq3jeaxksk33ntdk32ojsdyh2d3qkglvgj6segtc3acizlkrhm@fvdsccdbuook>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bq3jeaxksk33ntdk32ojsdyh2d3qkglvgj6segtc3acizlkrhm@fvdsccdbuook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e3795c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=c5TqcUTYwFkuCHJDiosA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: yezWp7MepUgVqYN7UsL1j6QsK52mFrVh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfXwTMrjHBy/zqF
 URaNvkNsPJZpipFC5GvxDfpx6e9bIY502SdU9DYO7+Q223XTfUT+JN+v5AN4tvSO0HcZt2AzKhz
 FzcDn1bWR24AKaWdK0qrZeOw3cPtwBdJT3RvHjj6awbduDklfLl457KhLSVjc44sgNlj5YMURWW
 3JHtFMmGKZvIOtnBi6RV6WP7ZxFBFgxfpNx430owXdap4gG8KLShyJsAyBMTRPJw8r+f2EShkP0
 g6FcjImyb54hjNRwWmD3cJaqsHbgdcGVX3GGzM7YXJzMr3da1JK9xuDwrQGv71JzB3+FcL2kyVA
 +kGWyLQF568el83GG6Cr9AmMFZcpIruXePv3bicK7eNzWULBJQT6vl5mGueU+XdXd2PyENJTPlA
 A5ooYKa3+uoPpa2YPuueURo9Pw5gcA==
X-Proofpoint-ORIG-GUID: yezWp7MepUgVqYN7UsL1j6QsK52mFrVh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_02,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029

On 10/6/25 12:21 AM, Dmitry Baryshkov wrote:
> On Sun, Oct 05, 2025 at 03:16:28PM +0200, David Heidelberg via B4 Relay wrote:
>> From: David Heidelberg <david@ixit.cz>
>>
>> Document the bindings for the Pixel 3 and 3 XL.
>>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>  Documentation/devicetree/bindings/arm/qcom.yaml | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index ae43b35565808..2190c5b409748 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -976,9 +976,8 @@ properties:
>>  
>>        - items:
>>            - enum:
>> -              - google,cheza
>> -              - google,cheza-rev1
>> -              - google,cheza-rev2
> 
> Why are you removing those?

I removed these a long time ago, the base for this series is 6.17-release
instead of -next :/

Konrad

> 
>> +              - google,blueline
>> +              - google,crosshatch
>>                - lenovo,yoga-c630
>>                - lg,judyln
>>                - lg,judyp
>>
>> -- 
>> 2.51.0
>>
>>
> 

