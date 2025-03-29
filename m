Return-Path: <linux-arm-msm+bounces-52811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 606D5A7554F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 10:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E329C3AF8AF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 09:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B9231940A2;
	Sat, 29 Mar 2025 09:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QBm5tDYh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60F2320F;
	Sat, 29 Mar 2025 09:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743239342; cv=none; b=jJxbuIRG88qUMva18/yd5z6HF1DSBWHTKcv80+uPidr8wiD/iNZ5a59BfNKNQVmJaPc9+xgzAobCNeCNf42fBK7CUjV/jnZGasSKuCV9jptJffgaFuqhyLJzJKryvQu8tmYE9e3wmE8mkHzY+QI04w2LuXtaj/vOPY9iWCvpKxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743239342; c=relaxed/simple;
	bh=wHn6uO7FmHT+u29dI+/PISc4l6zOUOxitSsOKgYQkAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kH0AhHPdMlWGOYFf31zD1cWZ/nSHjZWS/3E4+/oWLgjEZQM1BK7dHE7auJbJflovGoiCRxHsAqh8BFskX9eWsUbyTUxoxoWo3FTBiopOhEyg3I2NQGOpcQuLx45b6JJDHV7JyAgQf/noFBV3fMN+x9ObwiYE3xSC0E55GAAJO6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QBm5tDYh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52T7iPJw003487;
	Sat, 29 Mar 2025 09:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MoMlT4AKp/xkNU2qHgj40LUFzbvh0INrOi3hh/g5N6s=; b=QBm5tDYh0gArjbD7
	W+eddSHcSMku43BhdmfKAIhkLCR9LUJph0FyHqkZI3lT8KeTbkHAtSrdcxW8vESC
	Eei00rAzY+0KORpP9m424IHBmSCFBBzSqxeZy3eL1qE/C5D5MJLVE0MpSy70F0Q8
	szm8IrifyX4duRLP9s+PE0pj+Z/oMsQrztkPSzziRViyFcNZmY+HscQ1szxfsAf1
	JEdMkXzSM0yd2fAGc8BO5vPUZ0PhsFx35ILyrRrOj+Xe6y6tVwnQJmiaxjkd9X5B
	MeqipKhnY3ZJMdKS1jTOgUujGMhs1bMRACyLZjAfx/oFasRvgJjtNFUNCXkiuI3o
	IYbxwg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p9mjgc0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Mar 2025 09:08:50 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52T98niG019037
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Mar 2025 09:08:50 GMT
Received: from [10.216.2.59] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 29 Mar
 2025 02:08:46 -0700
Message-ID: <e997bd15-728c-4316-8050-d461f115fd9f@quicinc.com>
Date: Sat, 29 Mar 2025 14:38:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: i3c: Add Qualcomm I3C master
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>, <alexandre.belloni@bootlin.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jarkko.nikula@linux.intel.com>, <linux-i3c@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>
References: <20250326141641.3471906-1-quic_msavaliy@quicinc.com>
 <20250326141641.3471906-2-quic_msavaliy@quicinc.com>
 <991b0652-76f2-40d6-b49b-1e6f76e254ac@kernel.org>
 <661e1a21-0f3a-497a-9b3b-fab284e30d19@quicinc.com>
 <36b67f9c-5905-4fa6-8190-ab980850b3a2@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <36b67f9c-5905-4fa6-8190-ab980850b3a2@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Mfhsu4/f c=1 sm=1 tr=0 ts=67e7b8a2 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=J7C7Ry7mLDWpNK8ALR4A:9
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: QeYO5ETz98swPMKfkKRxgBbizXsAHh95
X-Proofpoint-GUID: QeYO5ETz98swPMKfkKRxgBbizXsAHh95
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-29_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503290064



On 3/28/2025 8:03 PM, Krzysztof Kozlowski wrote:
> On 28/03/2025 15:28, Mukesh Kumar Savaliya wrote:
>> Thanks Krzysztof for immediate review !
>>
>> On 3/26/2025 7:53 PM, Krzysztof Kozlowski wrote:
>>> On 26/03/2025 15:16, Mukesh Kumar Savaliya wrote:
>>>> Add device tree bindings for the Qualcomm I3C controller. This includes
>>>> the necessary documentation and properties required to describe the
>>>> hardware in the device tree.
>>>>
>>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> ---
>>>>    .../bindings/i3c/qcom,i3c-master.yaml         | 60 +++++++++++++++++++
>>>>    1 file changed, 60 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
>>>> new file mode 100644
>>>> index 000000000000..af6b393f2327
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
>>>
>>> Naming: nothing improved.
>>>
>> Sorry, i didn't get exactly. To your comment "Filename matching
>> compatible." i have Changed the compatible string to "qcom,i3c-master"
>> and now it's matching to file name.
>>
>> shall i make filename as qcom,i3c-master-qcom.yaml ? If this is wrong,
>> please suggest.
>>
>> Removed "bindings" from the subject line too. I have removed "master"
>> from the description, shall i remove from subject also and keep only
>> controller ? I kept master controller thinking it may be good as "master
>> controller" instead "controller".
> 
> I still see the "master" in the compatible and filename.
> 
File Name : qcom,i3c-geni-qcom.yaml
Compatible name : "qcom,i3c-geni"
+
Remove master from subject too "dt-bindings: i3c: Add Qualcomm I3C 
controller"

will this be fine ?
>>
>>
>>>> @@ -0,0 +1,60 @@
>>>> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/i3c/qcom,i3c-master.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Qualcomm Geni based QUP I3C Controller
>>>> +
>>>> +maintainers:
>>>> +  - Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> +
>>>> +description:
>>>> +  I3C in master mode supports up to 12.5MHz, SDR mode data transfer in mixed
>>>> +  bus mode (I2C and I3C target devices on same i3c bus). It also supports
>>>> +  hotjoin, IBI mechanism.
>>>> +
>>>> +  I3C Controller nodes must be child of GENI based Qualcomm Universal
>>>> +  Peripharal. Please refer GENI based QUP wrapper controller node bindings
>>>> +  described in Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml.
>>>> +
>>>> +allOf:
>>>> +  - $ref: i3c.yaml#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: qcom,i3c-master
>>>
>>> And this got worse. It makes also no sense either: how can you claim
>>> that this covers all possible future I3C masters from Qualcomm?
>>>
>>> What was the resolution of previous discussion?
>>>
>> Below was my understanding and reply.
>> "
>> I think i should remove const. kept it for now as no other compatible to
>> be added as of now.
>> let me remove const.
>> SoC name is not required, as this compatible is generic to all the SOCs.
> 
> I don't see any talks about const, what are you referring to?
> 
+properties:
+  compatible:
+    : qcom,i3c-geni
will this be fine ?


>> "
>>
>> But i realized i missed to remove const, sorry for that.
>>
>>
>> I have also checked for qcom,spi-geni-qcom.yaml, it has below :
>> properties:
>>     compatible:
>>       const: qcom,geni-spi
>>
>> Let me know if i can correct for SPI in separate new patch ?
> 
> I love such arguments - let's find whatever old bindings and whatever
> antipattern.
Sure, once i know what should be the ideal pattern which is 
unique/should be unique, will share you other files.
> 
> What was the outcome of the discussion? I think was about geni, no? What
> did Rob write? So how did it became i3c-master?
> 
yes, so "qcom,i3c-geni" is fine ?

> Best regards,
> Krzysztof


