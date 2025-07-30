Return-Path: <linux-arm-msm+bounces-67137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C74B15FF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 14:07:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDB7D3B3405
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 12:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C017D284B46;
	Wed, 30 Jul 2025 12:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KfVywomE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243A821D00D
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 12:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753877232; cv=none; b=MKmVWmyPXfnDx8RuOFvnCJoGZAotdmNyox4IkuWxrpnCE0Npn54GI1KbZ2MsgVLrR2z8JO0R14DEaOv26otFrtXcy20b+XbF/WJgEJdvSXB2OW06jQ9DHj29kPsQTFPbxHWyXnNGotRw03cILQB5xHukE9x0Kom0TUBd6ZikZ0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753877232; c=relaxed/simple;
	bh=nzDS3J8Tl4uutqBKhmKxdBPH3AFv6h9o+HqreCGEqhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hbiZ+kjBzEKpzY5QPiMtnflCgBQNEuaeqGcXa9mNuxNYxo6uC2YVi4cblMib9x9XAkWwrbKL+bBaUvEHwgLv/HXWw59v3H8sgU50sB+GTkrW0JDU0iNzv6O+VkOkMw0z/UUCgwFQ7TiIEHB0Ddab0s2XKFHEvFudypbwuSIMZSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KfVywomE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UBqrJ6007523
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 12:07:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YXPB8xAVMNnXhcculy8uUbKvbOohXUXRpW6onDRXyIM=; b=KfVywomEGyh5bNld
	2Wbq7OIXVEqVAHR6DemCa7a0Ylp5iK0oK3UJ9ccKl3mTf+Djrp8S+GGJtVlX/sQu
	4WlgkNELKiE9V5fPb2Z3hMqRLn+7BiK8C6PdLSOz0Riq9ZjoGo+CNS1ddjL22H9W
	0SRKpdKPOv3okZfR+LMq7EJech25fJCSgfgvfH0+6DlCEZyiP0raBPkRdfvwHZk3
	/dzQLnP08tF1thaMCWBwub+Lzqc6mqJabFNnHmyjbKo04WC38oAiMYHusVtbWTYo
	AYIXTzaKmEDs0KXcnDEojcGuQUtU4AjXuQNF2oVPFQGT7NbAHXlY668AtR008iwh
	hqYa+A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jwer1ap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 12:07:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab61b91608so24309341cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 05:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753877229; x=1754482029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YXPB8xAVMNnXhcculy8uUbKvbOohXUXRpW6onDRXyIM=;
        b=Nq0f3ROC8kv8LPIuCvEzOn4EuI3mb/UPQYNxCe8f6gL+D/uHp5GSxLCd+TLzYqJxTT
         nrqKKFNqoK/hlLZMIvjJEEfBzlWJKCh57WraZ3V4yfR2Ot4T9pOj+LLWH7xML/drixiz
         56KNkrQCQOsTlI3Sm5KEqvgbHDrij+GlRudBuDojuzr6fdOvP/YlzJRLhG7e+gYqfkoF
         FiAJT5cjFg6tAx4remqh6JHgmGMPP/utaihXkMR5qs6A1rW/3xYvJhOvQm1ix8V7z/r6
         8E283kezOG3/RE5FbBDQDJh9zvQacuXbEeSZY6e+S6igru/HK/UVUGMPQKerPHLhV1KK
         2waA==
X-Forwarded-Encrypted: i=1; AJvYcCVa9EG6QrTH+Ad7LdSwfNVY9m4cr7xj7KHSYAppGsFYitfHuPhHF71D8CvXd37gumT7sWHr0HB/CBYDA1LZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwM1l1HubOCTBzm4FoF6IeH/ab2RiMCOvutHJz/WPv9q1/7016v
	eqtYp6OBK6W17fKqIdKHU8SBsR4YnSPSDzU+Nhhd/fxtZPQggTEkWQTmhaQl+6UGOXPx9WIl81q
	FyQPw/vPlOUNeOIQxGyJATawkN9tyvwXX4deTJfvtCV+Ms8MAz0FDQ4/i3052w0ehG6R6
X-Gm-Gg: ASbGncvq7hvkvIqfDUHT8RULreUfNvu9LNXyJ3g/7LVxYcNbAZdx2V2bPDSm9+UoEPk
	bgTXsjRPtm8SS7HHlWKzu3aE8ne/R5WFG7zt9JRPWoIHJJdNrGeA4zTFHjar5FX4JNcb6XQeqaB
	o12nbG7AO0riSk9xGZ85qy8qIGI3nVyJnvHC2NBEyMRSX6WmFsckbKRLQKwQsDcYR8hK1po/ctz
	wUDh/jAavE5Wo5a9lhbTeCdFx8mPrZbbZ1v8A54PYyQBAk9OW/D/LHIChAXzO22aAbiI2PCxPFz
	sQuqGINnoHuSKuWCageGY0o+0nkNelWwpvALreyCVV/MOthi5RFZLA0UKZp4SgxLzQhO9ps232i
	uAcZWtPszQGMDGY8pkQ==
X-Received: by 2002:a05:620a:1989:b0:7e3:49b9:d06a with SMTP id af79cd13be357-7e66f3412c6mr190738285a.9.1753877229189;
        Wed, 30 Jul 2025 05:07:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2dFWuV9ypfCgfd4v8j0ZSQkQwxTOTO6AEX7GRCA3ShMfzfTaFvEB2RNG2NOx9CQxbn3Lu1w==
X-Received: by 2002:a05:620a:1989:b0:7e3:49b9:d06a with SMTP id af79cd13be357-7e66f3412c6mr190733685a.9.1753877228415;
        Wed, 30 Jul 2025 05:07:08 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af6358d2fa9sm732893766b.62.2025.07.30.05.07.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 05:07:07 -0700 (PDT)
Message-ID: <747e5221-0fb1-4081-9e98-94b330ebf8c7@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 14:07:04 +0200
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
 <bf78d681-723b-4372-86e0-c0643ecc2399@oss.qualcomm.com>
 <62b0f514-a8a9-4147-a5c0-da9dbe13ce39@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <62b0f514-a8a9-4147-a5c0-da9dbe13ce39@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4g5SlCO9zw-1ecqe9uSZX3Xfab1egDcs
X-Authority-Analysis: v=2.4 cv=Wv0rMcfv c=1 sm=1 tr=0 ts=688a0aee cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=8yqZ_v4obXD5Xgezft8A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 4g5SlCO9zw-1ecqe9uSZX3Xfab1egDcs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA4NSBTYWx0ZWRfX4geD9xo3AzRs
 zka864++NfTygOuoNzzaIAptdILXIYsSzP16gvgAcXwahuZZDwy/K+KGp4ikJkPPvRwDDHou7ee
 Ft95Fgixeap4Au/g8+Ndmg4LCD8qN79MRY3WKrgn/YfaLF+BvwLfZ+WibPo64EN6rWXkRg6Kgl9
 S3mbx/HDC09+cd+A1/nfE1u0XS0+r46/TJmqHxOx0TeH59ZccpSTvAtUVzXR7/uECrDe4Sz5lMJ
 f2cZmw0rQ1zW8MmGQI5ygHMdFByc3vn0BtKaKrCVH7yj2735mKBoeMeeerqBzyxay0cLEhvfesA
 CidKOj15LXUJtvDORYuVUquMn3ZFYrpuGTpZbE0vYDFg70ywFOFCe+X0ZhM0I/2KVauWX4pAOf3
 i6sqdkj1kn0tZ6iiI5zmynjy3fx1uO4JG1G6fyDTHHF6rR80+JB287DM8BJC2+fcP2RjB3nQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300085

On 7/15/25 8:37 AM, Krzysztof Kozlowski wrote:
> On 14/07/2025 19:53, Konrad Dybcio wrote:
>> On 5/27/25 1:42 PM, Krzysztof Kozlowski wrote:
>>> On 27/05/2025 13:36, Konrad Dybcio wrote:
>>>>>> diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>>>> index 2711f90d9664b70fcd1e2f7e2dfd3386ed5c1952..7c882819222dc04190db357ac6f9a3a35137cc9e 100644
>>>>>> --- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>>>> @@ -51,6 +51,9 @@ properties:
>>>>>>      $ref: /schemas/power/reset/syscon-reboot-mode.yaml#
>>>>>>  
>>>>>>  patternProperties:
>>>>>> +  "^modem-tables@[0-9a-f]+$":
>>>>>> +    description: Region reserved for the IP Accelerator
>>>>>
>>>>> Missing additionalProperties: false, which would point you that this is
>>>>> incomplete (or useless because empty).
>>>>
>>>> How do I describe a 'stupid' node that is just a reg?
>>> With "reg" - similarly to many syscon bindings.
>>
>> Is this sort of inline style acceptable, or should I introduce
>> a separate file?
> 
> It's fine, assuming that it is desired in general. We do not describe
> individual memory regions of syscon nodes and this is a syscon.
> 
> If this is NVMEM (which it looks like), then could use NVMEM bindings to
> describe its cells - individual regions. But otherwise we just don't.

It's volatile on-chip memory

> There are many exceptions in other platforms, mostly old or even
> unreviewed by DT maintainers, so they are not a recommended example.
> 
> This would need serious justification WHY you need to describe the
> child. Why phandle to the main node is not enough for consumers.

It's simply a region of the SRAM, which needs to be IOMMU-mapped in a
specific manner (should IMEM move away from syscon+simple-mfd to
mmio-sram?). Describing slices is the DT way to pass them (like under
NVMEM providers).

> 
> If the reason is - to instantiate child device driver - then as well no.
> This has been NAKed on the lists many times - you need resources if the
> child should be a separate node. Address space is one resource but not
> enough, because it can easily be obtained from the parent/main node.

There is no additional driver for this

Konrad

