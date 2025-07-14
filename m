Return-Path: <linux-arm-msm+bounces-64860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B00CDB046F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 19:53:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC5124A479B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 17:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C35267713;
	Mon, 14 Jul 2025 17:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YHQCd3V0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71171F5433
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 17:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752515629; cv=none; b=lVU35VyJVBl63YfiHwJnfRD6HHp1mShirJJjkThgkaGuHRX/Sm/v6F8vYzOEQoXQ2NBFdQPWF3tBTA6BAbwg9PfsI1pfIu9LI8SDqgacrdkvpspA8uGzZVk92e6ZSkPCL2JfGvio0DiHcKQcOdNSwAULbbNxChXG7uplkU+qjEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752515629; c=relaxed/simple;
	bh=YvsJN12SAY9OQ75DnDkBYqvaW6o0cntTB75m162ikOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J44KLY6a+hhOP0CW6Hj9aWNHSxvqJYPg1nfPcCk4tYJb0Ag1sd+3gViQM/fvWu2ByQ9XUmKljns4So0SGJD+7OVocCRaLbZX0NPe2vrIbeRlAyp2fiflABf5hZt8iBYLtWDW7NWtdttGwZrDpemZEMgc6YbzPYHUGqhwde1BvGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YHQCd3V0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGSQQS024343
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 17:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fK6x+ly3xuI/2lAjrk6WHaK2Wj/VJnTiR8SzPU9LGHk=; b=YHQCd3V0Cae+VGUk
	84WIQIRbGymyYAmUvvD4+fCmV2kNvPOF6HVlOqX5DLwSrU6S70yklbcgbE/4BCL+
	EeN22p30ny++MTzzLnKEHGe51UUxwLOAJgUuS0WGNTIrTLnNOgIaKUYRn7yRh/Tx
	8OKLguXe81zaLvLUDJjY3O1ECX5PfZYGD5s8C70atShXlot5Y5W5hClCDa5B2Pp5
	Y4LD/R6L5paSi+da7NqbFjTDzxrtyETwZQO1CVwYdabfMwdbt8ue2kWMe43HHnJ6
	aGbxmaWCbzrXJk1NG2zKXdHN99bw12m1k7OrE9pgmYJ+zy2yL0Hy88DqR2D03cTL
	g/1Y/g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dp878e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 17:53:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fafb22f5daso2836356d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 10:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752515625; x=1753120425;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fK6x+ly3xuI/2lAjrk6WHaK2Wj/VJnTiR8SzPU9LGHk=;
        b=ln7asQbPaMcorrwVO8SLlXKFfReR4jwTDidEUCPh9M5LcxdI+MHAKpPHlngkW6K+Kh
         R906+USdubLADMSNTe/3XbEMVd9dqUxkFWQmOGYRyJ5DI0dbdn34jFkK342IyY6+FdVA
         ul7UosT6tRJPBqY5DImHX/FleIwZSQ6+Qc4+JRfuQ+RJ7o2GuCWjKGB4nrKzhsCj36l2
         LUm2aaj5t0+2b+xDkV1JY/Pxnt9UZoLHNXEzaTe+Ij6FQ352JGf4qOCKlZ4kely8rT3h
         BX8DI6V5z9JCKzvA7q/ydRu63waSAqJ5KnEkd0ujgYBdqwAP3pGwIlsdqnvY5B/0UthM
         Bkug==
X-Forwarded-Encrypted: i=1; AJvYcCWtTbu8mYvwUxhvjRv6FEx6sRIikTUHb+zxZ+YevFGnzbXKWBoz5qxU3G/g+K7RnhDsDFbK8kz3wMkfSMm/@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe30BVIhvKUAGxWSf2a+nz6ZhptwyKEpoUIPSfNepAJJBJVRZN
	Jl8s5wEz4HYVm1XSTJvfUzz2yC7NMHp6U65rahWVCYK2YmPeDCr+jFLb4Lg+M13nv4764Dpl3bx
	zSVu57a2Kkx5M8//uleR7wAlosHr+py6wgJh1Vu1Ph8rm3+MsFwkSz+mEPFRezYOZnaAWGDqbIH
	d1
X-Gm-Gg: ASbGncsOaPQo6aOmNNhJAEAmt5Z7ucfQTYd6sHo+gRTBeEwPoUzYMuNFOf6PCckP7rB
	EbevRwuDuPauXgL8bczXMCGHd/N7OUSyDftCIMjkEcikLbIc4zI+YEG0cdin91/j3lpsZk0DYt/
	HncCcgHGfUl79SeZrHvPx6E8JjKJgyy5yPvzoB4NaLBaWsYz3G/6PAeuCrcvxAMOm+wS6W9zEsP
	nmWGKSZdJmK0D5Hf7KZ34sT9CrUVE/3EBuVXROiWNTKndqT4rJbDXiYKeN9PoTls4qs5zbWphaY
	KuhFitW1omJx6UFrKYw/SVhEf2KWaljw8/6pDthosp0eyTnH+MqSbzFhHpWY+RXzkDSB4VAi2K/
	qNKfghgFJIDSLxw5REww0
X-Received: by 2002:a05:620a:618f:b0:7e3:2d1d:bda5 with SMTP id af79cd13be357-7e32d1dc30fmr148797385a.9.1752515625432;
        Mon, 14 Jul 2025 10:53:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH33J/OmI1AFTIjnQFvLICqDRKARWzq6lcWnIeXIfJs1esBEhAy06+UMvKScpJWaDTw5mOsbA==
X-Received: by 2002:a05:620a:618f:b0:7e3:2d1d:bda5 with SMTP id af79cd13be357-7e32d1dc30fmr148796485a.9.1752515624920;
        Mon, 14 Jul 2025 10:53:44 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c976ec04sm6252166a12.60.2025.07.14.10.53.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 10:53:44 -0700 (PDT)
Message-ID: <bf78d681-723b-4372-86e0-c0643ecc2399@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 19:53:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/3] dt-bindings: sram: qcom,imem: Allow
 modem-tables
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Alex Elder <elder@riscstar.com>
References: <20250527-topic-ipa_imem-v2-0-6d1aad91b841@oss.qualcomm.com>
 <20250527-topic-ipa_imem-v2-1-6d1aad91b841@oss.qualcomm.com>
 <97724a4d-fad5-4e98-b415-985e5f19f911@kernel.org>
 <e7ee4653-194c-417a-9eda-2666e9f5244d@oss.qualcomm.com>
 <68622599-02d0-45ca-82f5-cf321c153cde@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <68622599-02d0-45ca-82f5-cf321c153cde@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDExMyBTYWx0ZWRfX/SYwC5agM7ie
 naFvkEdIewkhRQMML7uPUn9MNdLDDTJYhyMv7s4tt3wse0TNFi+rWQ8O1GuIum5liy8DZQ3xjZt
 IrVluCAqhgkEYwNVMsCOr70HtI5Bcwi3DvAOEOownb4O0aaJWfqZMKHidVtYsCn9j6xAeZv02tC
 XKdeZ6W+uHAv7XW9ZYV9+gj1rL+iVA/pUc2r2EOv+XLKqAP+mPVti/A42AEGXtdmCh9uc0qMvNs
 oogKYsfl9W37rP4JHsO0XCsk5yE+/s+GrQjwjstlK2FX3JTqbTl/7Rb6nh80hCIzcc2XRQigZvJ
 hszt5DKdHe3GR1kCIg/lYQZuhrp834eiF4+MGFTNFbcKbvOkPOhWrv4qtd7VrRW2eUyk9T9HBpv
 +wtS2OwFkzUYHfjoTMoh1irmA1EAqaeXYFcttV3Rn1w6lYi9B8A3r382AOx/MuocLeRk+UkH
X-Proofpoint-GUID: lpBAA-ndeDABd6Inevlt1W7F7kEa_CpB
X-Proofpoint-ORIG-GUID: lpBAA-ndeDABd6Inevlt1W7F7kEa_CpB
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=6875442a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=kRKpuzDA6j_fRx5RDl4A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_02,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140113

On 5/27/25 1:42 PM, Krzysztof Kozlowski wrote:
> On 27/05/2025 13:36, Konrad Dybcio wrote:
>>>> diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>> index 2711f90d9664b70fcd1e2f7e2dfd3386ed5c1952..7c882819222dc04190db357ac6f9a3a35137cc9e 100644
>>>> --- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>> +++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>> @@ -51,6 +51,9 @@ properties:
>>>>      $ref: /schemas/power/reset/syscon-reboot-mode.yaml#
>>>>  
>>>>  patternProperties:
>>>> +  "^modem-tables@[0-9a-f]+$":
>>>> +    description: Region reserved for the IP Accelerator
>>>
>>> Missing additionalProperties: false, which would point you that this is
>>> incomplete (or useless because empty).
>>
>> How do I describe a 'stupid' node that is just a reg?
> With "reg" - similarly to many syscon bindings.

Is this sort of inline style acceptable, or should I introduce
a separate file?

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 7555947d7001..95fbb4ac9daa 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -67,7 +67,13 @@ properties:
 
 patternProperties:
   "^modem-tables@[0-9a-f]+$":
+    type: object
+    properties:
+      reg:
+        maxItems: 1
+
     description: Region reserved for the IP Accelerator
+    additionalProperties: false
 
   "^pil-reloc@[0-9a-f]+$":
     $ref: /schemas/remoteproc/qcom,pil-info.yaml#

(fwiw checks are happy with the above)

Konrad

