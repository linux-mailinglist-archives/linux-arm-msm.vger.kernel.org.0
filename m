Return-Path: <linux-arm-msm+bounces-1631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B107F5985
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 08:44:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DD6E2814A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 07:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7E1182C0;
	Thu, 23 Nov 2023 07:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BrX2xUsx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 880C8E7;
	Wed, 22 Nov 2023 23:44:26 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AN5p9sG019102;
	Thu, 23 Nov 2023 07:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ODq+VcjcMmK3OWQ4qwMAU23ZgLzdDzuPsqKbO1zYxSI=;
 b=BrX2xUsx3jWrJ1R1XCstV+ygot0GspjyJgPR0Ec30fHr69llr/7n6OlXX2qF4VE4cNlh
 DOKQpRnhC1P+iZZpLhmgF9PkykXNYgf+IuaEc70RzNSmGxQJx9lrX5KznuZk7kN6StcQ
 na+Qwr3VCxe82BTcL9WfvQcW/wY13oYQ/5SKNcP9ueD46r4T3V3KtALOSzhqXZr0mSYA
 u+aRxGQJ9s3jjmpUePdmESkXSpIc9p4Dl592Zzn4Xz3nqXqVKVQB+0OQxBiuYa9uiI9t
 Pxof+BOZbg74PqcnIo+J/ITT8ixnHrMsCdiqnubNP/ZZTKtF/fZXxPu5l9T6TT5b5NMs AQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uhr5ps96c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 07:44:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AN7iLoi024807
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 07:44:21 GMT
Received: from [10.216.59.116] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 22 Nov
 2023 23:44:15 -0800
Message-ID: <ab2952ea-1917-4b58-a0cf-64f3eba0b7c9@quicinc.com>
Date: Thu, 23 Nov 2023 13:14:11 +0530
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
Content-Language: en-US
From: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <4c323ab5-579f-41f5-ab77-c087136e4058@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zZdZlOuvuxHtKt3sV6lJrgfqK5tiTUeC
X-Proofpoint-ORIG-GUID: zZdZlOuvuxHtKt3sV6lJrgfqK5tiTUeC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_05,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311230054



On 11/23/2023 1:11 PM, Krzysztof Kozlowski wrote:
> On 22/11/2023 20:13, Krishna Kurapati wrote:
>> The high speed related interrupts present on QC targets are as follows:
>>
>> dp/dm Irq's
>> These IRQ's directly reflect changes on the DP/DM pads of the SoC. These
>> are used as wakeup interrupts only on SoCs with non-QUSBb2 targets with
>> exception of SDM670/SDM845/SM6350.
>>
>> qusb2_phy irq
>> SoCs with QUSB2 PHY do not have separate DP/DM IRQs and expose only a
>> single IRQ whose behavior can be modified by the QUSB2PHY_INTR_CTRL
>> register. The required DPSE/DMSE configuration is done in
>> QUSB2PHY_INTR_CTRL register of phy address space.
>>
>> hs_phy_irq
>> This is completely different from the above two and is present on all
>> targets with exception of a few IPQ ones. The interrupt is not enabled by
>> default and its functionality is mutually exclusive of qusb2_phy on QUSB
>> targets and DP/DM on femto phy targets.
>>
>> The DTs of several QUSB2 PHY based SoCs incorrectly define "hs_phy_irq"
>> when they should have been "qusb2_phy_irq". On Femto phy targets, the
>> "hs_phy_irq" mentioned is either the actual "hs_phy_irq" or "pwr_event",
>> neither of which would never be triggered directly are non-functional
>> currently. The implementation tries to clean up this issue by addressing
>> the discrepencies involved and fixing the hs_phy_irq's in respective DT's.
>>
>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>> ---
>>   .../devicetree/bindings/usb/qcom,dwc3.yaml    | 125 ++++++++++--------
>>   1 file changed, 69 insertions(+), 56 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
>> index e889158ca205..4a46346e2ead 100644
>> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
>> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
>> @@ -17,20 +17,25 @@ properties:
>>             - qcom,ipq5018-dwc3
>>             - qcom,ipq5332-dwc3
>>             - qcom,ipq6018-dwc3
>> +          - qcom,ipq6018-dwc3-sec
> 
> I could not understand from commit msg why you are adding new compatible
> and what it is supposed to fix.
> 
> The entire diff is huge thus difficult to review. Why fixing hs_phy_irq
> causes three new interrupts being added?

Some targets have two controllers where the second one is only HS 
capable and doesn't have ss_phy_irq. In such cases to make it clear in 
bindings, I added a suffix "-sec" and accordingly changed in DT as well. 
Should've put this in commit text.

>>             - qcom,ipq8064-dwc3
>>             - qcom,ipq8074-dwc3
>>             - qcom,ipq9574-dwc3
>>             - qcom,msm8953-dwc3
>>             - qcom,msm8994-dwc3
>>             - qcom,msm8996-dwc3
>> +          - qcom,msm8996-dwc3-sec
>>             - qcom,msm8998-dwc3
>>             - qcom,qcm2290-dwc3
>>             - qcom,qcs404-dwc3
>>             - qcom,sa8775p-dwc3
>> +          - qcom,sa8775p-dwc3-ter
> 
> Ter?
> 
Tertiary controller.

Regards,
Krishna,

