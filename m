Return-Path: <linux-arm-msm+bounces-1633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 526F17F59A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 08:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 747031C20B65
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 07:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4199218AF1;
	Thu, 23 Nov 2023 07:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UyGLY6re"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3694AA2;
	Wed, 22 Nov 2023 23:57:32 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AN4OuvR006167;
	Thu, 23 Nov 2023 07:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=xT9mC5lx0ErBSkckehHdh13wVtvWEQZryXxBATcTRJw=;
 b=UyGLY6reJYmK290YvCkxpr1vZxz2DimypKIOWWXKXPKwHR5/c58jNds9REsqq8cvKKvg
 LGUAYkyHpv0WgXjC13s/E8k/mS7pzg6JMDGfix8C+fV9wcQ7Rsv1LkCF7x/Yu1ZbUUqW
 2r4tmR4Bo9BWCS9UnIKR1sYT4p3UvwVkpX1d7wevPFzL269+ItnNX3Yc+rTACHuG1jnn
 R+GgpwcKyDqWRHdwO01uF7HnJUPwcQMLnIp7Ybkjwj04SIhTYgiumzCD559AL5pw4Hr0
 tLfAxoaICpcVOvbxyW0G6GjdNljgVLl0OQi2IFHFXobAyceRgq2S03iqWQkSRpfHeVzX 0A== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uhr5psac8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 07:57:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AN7vQZd023540
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 07:57:26 GMT
Received: from [10.216.59.116] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 22 Nov
 2023 23:57:20 -0800
Message-ID: <f7bc0564-8260-4254-b66b-b472ef73225e@quicinc.com>
Date: Thu, 23 Nov 2023 13:27:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: usb: dwc3: Clean up hs_phy_irq in
 bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        Andy Gross
	<agross@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>, <quic_wcheng@quicinc.com>,
        Conor Dooley <conor+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        <quic_ppratap@quicinc.com>, <quic_jackp@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20231122191335.3058-1-quic_kriskura@quicinc.com>
 <4c323ab5-579f-41f5-ab77-c087136e4058@linaro.org>
 <ab2952ea-1917-4b58-a0cf-64f3eba0b7c9@quicinc.com>
 <7f4d20fd-b975-47ab-8dfb-2a0eb3db04fc@linaro.org>
Content-Language: en-US
From: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <7f4d20fd-b975-47ab-8dfb-2a0eb3db04fc@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rdU-o8uxm5bjbM06Njdx5lEv1Sg8bAZv
X-Proofpoint-ORIG-GUID: rdU-o8uxm5bjbM06Njdx5lEv1Sg8bAZv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_05,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311230055



On 11/23/2023 1:20 PM, Krzysztof Kozlowski wrote:
> On 23/11/2023 08:44, Krishna Kurapati PSSNV wrote:
>>
>>
>> On 11/23/2023 1:11 PM, Krzysztof Kozlowski wrote:
>>> On 22/11/2023 20:13, Krishna Kurapati wrote:
>>>> The high speed related interrupts present on QC targets are as follows:
>>>>
>>>> dp/dm Irq's
>>>> These IRQ's directly reflect changes on the DP/DM pads of the SoC. These
>>>> are used as wakeup interrupts only on SoCs with non-QUSBb2 targets with
>>>> exception of SDM670/SDM845/SM6350.
>>>>
>>>> qusb2_phy irq
>>>> SoCs with QUSB2 PHY do not have separate DP/DM IRQs and expose only a
>>>> single IRQ whose behavior can be modified by the QUSB2PHY_INTR_CTRL
>>>> register. The required DPSE/DMSE configuration is done in
>>>> QUSB2PHY_INTR_CTRL register of phy address space.
>>>>
>>>> hs_phy_irq
>>>> This is completely different from the above two and is present on all
>>>> targets with exception of a few IPQ ones. The interrupt is not enabled by
>>>> default and its functionality is mutually exclusive of qusb2_phy on QUSB
>>>> targets and DP/DM on femto phy targets.
>>>>
>>>> The DTs of several QUSB2 PHY based SoCs incorrectly define "hs_phy_irq"
>>>> when they should have been "qusb2_phy_irq". On Femto phy targets, the
>>>> "hs_phy_irq" mentioned is either the actual "hs_phy_irq" or "pwr_event",
>>>> neither of which would never be triggered directly are non-functional
>>>> currently. The implementation tries to clean up this issue by addressing
>>>> the discrepencies involved and fixing the hs_phy_irq's in respective DT's.
>>>>
>>>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>>>> ---
>>>>    .../devicetree/bindings/usb/qcom,dwc3.yaml    | 125 ++++++++++--------
>>>>    1 file changed, 69 insertions(+), 56 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
>>>> index e889158ca205..4a46346e2ead 100644
>>>> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
>>>> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
>>>> @@ -17,20 +17,25 @@ properties:
>>>>              - qcom,ipq5018-dwc3
>>>>              - qcom,ipq5332-dwc3
>>>>              - qcom,ipq6018-dwc3
>>>> +          - qcom,ipq6018-dwc3-sec
>>>
>>> I could not understand from commit msg why you are adding new compatible
>>> and what it is supposed to fix.
>>>
>>> The entire diff is huge thus difficult to review. Why fixing hs_phy_irq
>>> causes three new interrupts being added?
>>
>> Some targets have two controllers where the second one is only HS
>> capable and doesn't have ss_phy_irq. In such cases to make it clear in
>> bindings, I added a suffix "-sec" and accordingly changed in DT as well.
>> Should've put this in commit text.
> 
> Where did you explain it in the commit msg? Why adding new compatibles
> is squashed to this patch?
> 
Apologies. I meant I should've put the explanation in commit text which 
I missed. Will do it while revising this patch.

> You need separate commit with its own justification. I am not sure if
> calling things secondary and tertiary scales. Please describe all the
> differences and come with some reason for the naming.
> 
> 

Sure, will separate out the new compatible additions and then make 
different commits.

Regards,
Krishna,



