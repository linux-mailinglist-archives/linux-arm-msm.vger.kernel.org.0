Return-Path: <linux-arm-msm+bounces-40706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8499E66E6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 06:30:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15676169D71
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 05:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6DE0194AF4;
	Fri,  6 Dec 2024 05:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C4DXNqz9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5166C191F7C;
	Fri,  6 Dec 2024 05:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733463047; cv=none; b=gfsxXEakrtlOt2UPZgw4hokjxjm/eziPSba+aLBT3nN/AksEJxPweOPRDa68oi5KcFBowrAwVlpbUlmMhEGIjbDaFo07U/MI/+FRGV2Ew+9lZlTPqWUCJsaMIbOY5m5VSSAGiCydV8KcMxuFw6gysDepdr6iDaK6+wK7L3mgtEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733463047; c=relaxed/simple;
	bh=I7ezur48GTOr90mXFX/d7EPuBwbaQzfn8C4/oP7yzOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=u6Kr2tr78Efvs1bQIYgoSMU+fWdfVCoAz62OTNOAK54BHpqKXDTJCI9n/m+A4z68hqbnNLXHrh1wze99I0yZwz8euCARv/K7BwAhl43pfvkuBI15dyY/1RvI5LxDnRshuGa6KiwUn2hmbN0IrS84/4Ses/qok6OjyQtYJ/CrhmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C4DXNqz9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaNiK020813;
	Fri, 6 Dec 2024 05:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K/YhsUfDB5MCFMGonVP60D00jRenznk+EdT6M7F5qL8=; b=C4DXNqz9rfciZfQD
	Xy6UF/aaOIEngzECYklXP+gOsalc/0p4XbGRpNCK/ASFxt+ISf43SSq1iKGMX6ve
	7/XNvmNeIh1idWNS2jl1Qb507NztNY8BkwSDeSML8ixEsqDMQWT5YDq/HKWWU1p9
	dR4jQm91ZntkrBl1g/yEnNG2aVj2a4kGgKrlebhjat70XE/TxrqliQlKtuiRaIW8
	sKpfQ9vA51Qniaqd89yt8CiC6lFP5+9UfVlOg6bsbKF/d+bQ6zgyVc2XqwFT8Ftv
	1kyrcBkvLe6ej78KpRlDyxNCXSm604a4eGLzZv6rbirbt/zAOZiTBIvmKpjDzyJs
	xx+7LA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439v8021vv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 05:30:42 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B65Uf9n022934
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 05:30:41 GMT
Received: from [10.50.18.22] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 21:30:38 -0800
Message-ID: <2f4363b0-3a15-49b2-8f4d-1dc82abd6e21@quicinc.com>
Date: Fri, 6 Dec 2024 11:00:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] dt-bindings: mailbox: qcom: Document
 qcom,tmelite-qmp
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20241205080633.2623142-1-quic_srichara@quicinc.com>
 <20241205080633.2623142-2-quic_srichara@quicinc.com>
 <h5franuhsumreqz2l6l2lq3lyfzqtzjvz5py6q3smuds46j7rr@kcexrs5qn4be>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <h5franuhsumreqz2l6l2lq3lyfzqtzjvz5py6q3smuds46j7rr@kcexrs5qn4be>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LUDl2tOqBI51gqZvDVbaqYgnBubYk7bQ
X-Proofpoint-GUID: LUDl2tOqBI51gqZvDVbaqYgnBubYk7bQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060038



On 12/5/2024 5:54 PM, Dmitry Baryshkov wrote:
> On Thu, Dec 05, 2024 at 01:36:32PM +0530, Sricharan R wrote:
>> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>
>> This binding describes the component responsible for communication
>> between the TME-L server based subsystems (Q6) and the TME-L client
> 
> This should start by explaining what is TME-L.
> 
ok, will change.

>> (APPSS/BTSS/AUDIOSS), used for security services like secure image
>> authentication, enable/disable efuses, crypto services. Each client
>> in the   SoC has its own block of message RAM and IRQ for communication
>> with the TME-L SS. The protocol used to communicate in the message RAM
>> is known as Qualcomm Messaging Protocol (QMP).
>>
>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>> ---
>>   .../bindings/mailbox/qcom,tmelite-qmp.yaml    | 70 +++++++++++++++++++
>>   1 file changed, 70 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mailbox/qcom,tmelite-qmp.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,tmelite-qmp.yaml b/Documentation/devicetree/bindings/mailbox/qcom,tmelite-qmp.yaml
>> new file mode 100644
>> index 000000000000..1f2b3e02b894
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mailbox/qcom,tmelite-qmp.yaml
>> @@ -0,0 +1,70 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mailbox/qcom,tmelite-qmp.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm TMELITE IPCC channel
> 
> So, TME-L or TMELITE or TME-LITE?
> 
ok, will use TME-L in all places.

>> +
>> +maintainers:
>> +  - Sricharan Ramabadhran <quic_srichara@quicinc.com>
>> +
>> +description:
>> +  This binding describes the component responsible for communication
> 
> It's already a description of the binding, no need to repeat the obvious.
> 
ok

>> +  between the TME-L server based subsystems (Q6) and the TME-L client
>> +  (APPSS/BTSS/AUDIOSS), used for security services like secure image
>> +  authentication, enable/disable efuses, crypto services. Each client
>> +  in the   SoC has its own block of message RAM and IRQ for communication
>> +  with the TME-L SS. The protocol used to communicate in the message RAM
>> +  is known as Qualcomm Messaging Protocol (QMP).
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - qcom,ipq5424-tmelite-qmp
>> +      - const: qcom,tmelite-qmp
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description:
>> +      The base address and size of the message RAM for this client's
>> +      communication with the TMELITE core
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +    description:
>> +      Should specify the TMELITE message IRQ for this client
> 
> Just should? This is a very relaxed constraint. Just "the message IRQ
> for the client" sounds better.
> 
ok, will reword.


Regards,
  Sricharan


