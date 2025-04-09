Return-Path: <linux-arm-msm+bounces-53606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41722A81CCB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 08:15:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C749C3B0D21
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 06:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517DC1DDC2A;
	Wed,  9 Apr 2025 06:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VB8I1W0D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AB01D5166;
	Wed,  9 Apr 2025 06:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744179125; cv=none; b=jJ5qXEEphOjT2g/az6QRkNiLHb/FsglbzUfwAB4kjhMMcVdgChYlEFNe6qRo2u6HdL+ZxGp+evOH7GrFW04Se0OcSjsYUnQiWRM8YTYy7FvdCThnrsKFU7OsDAuwH/5CkJ/o+s0gTl2heK1NbvGfbbcOZvzyLq/qFWepqJGF/gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744179125; c=relaxed/simple;
	bh=tnn60fY+SnoSTaZFPObx5/uzNmbb47tqHcapAnoHuRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oE1GQSfBKoncbsBpSkMsDq2H9Oay1RWtSKaMpBuTirqHRX2p/MdtvTuamDzAhyVFYo8LZQNIPzyZDejrSsm3/KN0pvonZpipMLbIbfg/AptMmOebsn5qx9iukJfxwwPEhP/h9q7YMP79ErwSfHCrdK/2+CGK8afU7AH3wpl4bNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VB8I1W0D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JapZY027027;
	Wed, 9 Apr 2025 06:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AESpHE9DMD5xMFqSsQ1LarP7CTBv54js9YSWiRKyqTs=; b=VB8I1W0DfV7RM0cy
	y11KRSk0bfZ5lyP9fK+wScWVGCTUfNARnhCKhOK2pOO7go8z7JF3WQDNt7qUZWMm
	6gW9obxG46+eEzgZGN7zh057ybINKzPfNAmZ0QNB8QQeaHzA5R0xEg/QhtncfjUq
	BJqvr7eVzbsOB5jNvv7gnE2CFQ/4FVE4riX5KDZDKnPgXSFCO2IrIVktHmS2xuME
	0pY9fMErQau0GAfmBQggizREtLOjiGHkrynuvI3eaZO6ZPak6g8GcLdbQs4ggiNp
	Gs1o/j76FyyFVtE6NKvKdArpyogeImQN8EFG9+/32wJGhnTXikEJpa2mqbCc3jUR
	HSiFhA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkj584-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 06:11:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5396BwmX010010
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Apr 2025 06:11:58 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Apr 2025
 23:11:54 -0700
Message-ID: <3176af36-8b4c-4911-80e9-ffcda020eddc@quicinc.com>
Date: Wed, 9 Apr 2025 11:41:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: ipq5424: Enable PCIe PHYs and
 controllers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_varada@quicinc.com>,
        <quic_srichara@quicinc.com>
References: <20250402102723.219960-1-quic_mmanikan@quicinc.com>
 <20250402102723.219960-3-quic_mmanikan@quicinc.com>
 <ezodm6qh63fs43xx6cw3smspfqkwqb5qscwfee36k5vtktguc4@tlqhuvjg2bly>
 <bcbd2f83-2599-4a2e-ad69-64edcb97dfbe@quicinc.com>
 <CAO9ioeVTyWL0-vzzNs3isDodi8jXQ9pHknyyhnWKcb+0tyf1FQ@mail.gmail.com>
 <5de57d38-4cc3-44ab-87c4-cdd99911d343@oss.qualcomm.com>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <5de57d38-4cc3-44ab-87c4-cdd99911d343@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cWJ3Q9M8By8eUHnPv_aW_CoFFrhgQ3HU
X-Proofpoint-ORIG-GUID: cWJ3Q9M8By8eUHnPv_aW_CoFFrhgQ3HU
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f60faf cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=L8VBV9Asz1L9HHCLX4QA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=586 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090022



On 4/4/2025 2:19 AM, Konrad Dybcio wrote:
> On 4/3/25 11:32 AM, Dmitry Baryshkov wrote:
>> On Thu, 3 Apr 2025 at 08:08, Manikanta Mylavarapu
>> <quic_mmanikan@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 4/2/2025 7:50 PM, Dmitry Baryshkov wrote:
>>>> On Wed, Apr 02, 2025 at 03:57:23PM +0530, Manikanta Mylavarapu wrote:
>>>>> Enable the PCIe controller and PHY nodes corresponding to RDP466.
>>>>>
>>>>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>>>> ---
>>>>> Changes in V6:
>>>>>      - No change.
>>>>>
>>>>>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 41 ++++++++++++++++++++-
>>>>>  1 file changed, 40 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>>>>> index 0fd0ebe0251d..1f89530cb035 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>>>>> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>>>>> @@ -82,6 +82,32 @@ &dwc_1 {
>>>>>      dr_mode = "host";
>>>>>  };
>>>>>
>>>>> +&pcie2 {
>>>>> +    pinctrl-0 = <&pcie2_default_state>;
>>>>> +    pinctrl-names = "default";
>>>>> +
>>>>> +    perst-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
>>>>
>>>>
>>>> No wake-gpios? Please document it in the commit message.
>>>>
>>>
>>> Hi Dmitry,
>>>
>>> Thank you for reviewing the patch.
>>>
>>> The wake GPIO is dropped because the PCIe on the IPQ5424 doesn't support low power mode.
>>> I will document this information in the commit message and post the next version.
>>
>> If the GPIO is routed on the PCB I think it should still be described in the DT.
> 
> Even basic s2idle can be woken up from, please describe it.
> 

Hi Konrad,

	Thank you for reviewing the patch.

	When the system enters the s2idle state after the PCIe link is established, the link remains active, and no devices are suspended. 
	Consequently, upon waking up from s2idle, there is no need to resume PCIe devices since the link remains active.

Thanks & Regards,
Manikanta.


