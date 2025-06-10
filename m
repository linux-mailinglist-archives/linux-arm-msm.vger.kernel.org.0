Return-Path: <linux-arm-msm+bounces-60717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7B0AD2F8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 10:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 538653A56E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 08:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C1C28033F;
	Tue, 10 Jun 2025 08:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Z8fOOhUs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586DE22172F;
	Tue, 10 Jun 2025 08:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543040; cv=none; b=mzIla6PWvjRFNcA1l6vozzDxmn8LoLUpWVTHCf/SxKLDye5sMTQC4DEmiJWa4GXAgoKDl+n/kp5tkO7Szk0LH65JeqvGjoXKcX+a/1ywP75HZSN5Lrq7A87osUnJhO8vX4WdBlV4e42TsodjVBhoAl+nz+z+lI1VXmFEJ4xLxM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543040; c=relaxed/simple;
	bh=pxQqTLeJGrzRcba35v6Sv8J7W+lYfStZ+/qrHNswdu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TUC6300h09M7cVsmTu3oBWipqZwbbJLjTQe+Q50iYgA53avrx5e9a8xjC9TBipXB0qddgYlk9LXCs0BPrJltBLQLCd3PmljZz88+sLKVJdS9lGXt8BDclUVy2N9H+M6L0+dDrpLGq6oh9H5yiuoSpVET3Ce0jqC8s+AGOfh3RZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Z8fOOhUs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559KOrqf017669;
	Tue, 10 Jun 2025 08:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PyVKbeyNtvyCYpKab0D2gGv0Ts2lWek+MIyPqd7++uA=; b=Z8fOOhUs2OA+V4Zs
	sPSYC/PvKZknaAL61rAArdH75Oo3pzXwuLEo/lXwa8b/U9WNFBjEbliiiZD6W7yu
	GDrOmBJYK7J5uXOGw2Lxa0+Tziwhi5SBcZHVPIJRSRaP74hNG8ampSUS8FhOtZFU
	Iu6yWdDVv2yd2ZgMGtUlxY3gvl18eRJfF62/lKOeXdoRBHBhk1b4jL1+cBD1fdWV
	7nRK6kY94G06vUOxgbOnoml2aJ4g/WiiVVJX/f/RUTXb8aBX1xevNjn0N04z1aqu
	bX9UeQwlQCMukd2KZwQSblUWNupd+ldvoDkxOIfjaIMe3NQTt2QnR75Zi5eGXl9H
	RRFTzg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4766mchcdt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 08:10:29 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55A8ASAj020415
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 08:10:28 GMT
Received: from [10.218.32.171] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Jun
 2025 01:10:23 -0700
Message-ID: <d744b518-2ae9-4ca0-86ce-11cf74c945e6@quicinc.com>
Date: Tue, 10 Jun 2025 13:40:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] dt-bindings: serial: describe SA8255p
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <psodagud@quicinc.com>, <djaggi@quicinc.com>,
        <quic_msavaliy@quicinc.com>, <quic_vtanuku@quicinc.com>,
        <quic_arandive@quicinc.com>, <quic_mnaresh@quicinc.com>,
        <quic_shazhuss@quicinc.com>, Nikunj Kela
	<quic_nkela@quicinc.com>
References: <20250606172114.6618-1-quic_ptalari@quicinc.com>
 <20250606172114.6618-2-quic_ptalari@quicinc.com>
 <20250610-tested-lilac-raccoon-6c59c4@kuoka>
Content-Language: en-US
From: Praveen Talari <quic_ptalari@quicinc.com>
In-Reply-To: <20250610-tested-lilac-raccoon-6c59c4@kuoka>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=T8KMT+KQ c=1 sm=1 tr=0 ts=6847e875 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8
 a=COk6AnOGAAAA:8 a=7yBbA8StSmaZYdc8j60A:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: HoZ9RDAgzfOybucuaFDqukYoeTGxroit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA2MSBTYWx0ZWRfX03wNyGDMBgwe
 QgAeBgOnfhf0FXcn1EzcbSOc//rjExxsfYiKiv/w1YYiSJUViueb/CzLuPDNYlUpPX51TqF4JcZ
 ElxdaA1ONXJXD4FTbXpHJl3KcuzU5/f4MSAHsSh/7/yFaoKQNnYklDmhdZGCPu6H/hS5fub5H6w
 ooBtzYzJqWqp6Tzprf4PX8x8qQDde3JoA3BtHTy1NDWmvtZw/hxS68o6rISgdSinrVy3Yp+XLkC
 n2YC9AfHY2yHH2M3tSoNSmWjMX4Rbo/1KzppgC98Gmded3qQWJls5jW+LGBsqL+9spX6Q1XvneL
 bSTOcCc0HcdeC1wbS3o8MdnZOw8LwJ0rIt0ieAEJ49St9NUi1XHTdcjHCGD93HGYssfHlza+amV
 iZ/ecPqJhZ9Wmj+BERt86EDoPcHsRKd8pFevnV2dfYnTp4vWNwSqLrHgW9ouHoWXjUh5ORu8
X-Proofpoint-GUID: HoZ9RDAgzfOybucuaFDqukYoeTGxroit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_03,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100061

Hi Krzysztof

Thank you for review.

On 6/10/2025 12:34 PM, Krzysztof Kozlowski wrote:
> On Fri, Jun 06, 2025 at 10:51:07PM GMT, Praveen Talari wrote:
>> From: Nikunj Kela <quic_nkela@quicinc.com>
>>
>> SA8255p platform abstracts resources such as clocks, interconnect and
>> GPIO pins configuration in Firmware. SCMI power and perf protocols are
>> used to send request for resource configurations.
>>
>> Add DT bindings for the QUP GENI UART controller on sa8255p platform.
>>
>> The wakeup interrupt (IRQ) is treated as optional, as not all UART
>> instances have a wakeup-capable interrupt routed via the PDC.
>>
>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
>> Co-developed-by: Praveen Talari <quic_ptalari@quicinc.com>
>> Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
>> ---
>> v5 -> v6
>> - added description for interrupt-names
>> - added wakeup irq as optional information in commit text and
>>    property description.
>> - removed wake irq form example node.
>>
>> v4 -> v5
>> - added wake irq in example node
>>
>> v3 -> v4
>> - added version log after ---
>>
>> v2 -> v3
>> - dropped description for interrupt-names
>> - rebased reg property order in required option
>>
>> v1 -> v2
>> - reorder sequence of tags in commit text
>> - moved reg property after compatible field
>> - added interrupt-names property
>> ---
>>   .../serial/qcom,sa8255p-geni-uart.yaml        | 68 +++++++++++++++++++
>>   1 file changed, 68 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml b/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
>> new file mode 100644
>> index 000000000000..c2e11ddcc0f6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
>> @@ -0,0 +1,68 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni-uart.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Geni based QUP UART interface
>> +
>> +maintainers:
>> +  - Praveen Talari <quic_ptalari@quicinc.com>
>> +
>> +allOf:
>> +  - $ref: /schemas/serial/serial.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,sa8255p-geni-uart
>> +      - qcom,sa8255p-geni-debug-uart
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    minItems: 1
> 
> Drop, this is not in sync with interrupt-names. You already received
> comments on this. We talk about this since v4!
I hope you have reviewed the commit message and the description under 
interrupt-name regarding the optional wakeup IRQ. I believe that address 
your query.

I can include minItems:1 in the interrupt-name property in the next 
patch set to align/sync with interrupts property.

Thanks,
Praveen Talari
> 
> I am not reviewing the rest. Implement complete feedback given to you in
> v4 and v5.
> 
> Best regards,
> Krzysztof
> 

