Return-Path: <linux-arm-msm+bounces-54003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14886A85C12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 13:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FC9E3B4C04
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 11:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65877298CC6;
	Fri, 11 Apr 2025 11:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FuDHU6Be"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0107238C27;
	Fri, 11 Apr 2025 11:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744371470; cv=none; b=MHKWT8P/DsC4y1ehxT6gb4j8u/TgRNN/2UM+u7/356N4ulhC9gskxwNwdsBzvQ5VkuzNoP1Vdsjpa6CaPJi83X0sE/+8DPF8PqJLQshvrt/ANUzzL5Ss7PqUTUdxff1H6OV+cJXE/E79QXmcN8EUkFVnReIjvXCiT80mt7KSioc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744371470; c=relaxed/simple;
	bh=Kw2t04XUNLRM4wS/GspaB4ARdTcOcJffLKspSqUjU9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Vpp8duGvIYeVxlIGMZuOGxWgcrUusSJvRM+WelMNEgS/NNBUQTgUPKjvvNSApPqQ2/ycsV9GEJ7hxehAB9DLQ9RRXfe4LueVhlLW/EPM6TI8nXRxzodlU0EZicRJX2vWRdfDVZnATmhak0pu3QD0Xvc7Rn61nS9xrLSzXskNZjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FuDHU6Be; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B62xf1016319;
	Fri, 11 Apr 2025 11:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j40li0hUXJG8aKZAfoP+JUQjN0C/lLCXQbNkfXbS/v8=; b=FuDHU6BenHQhdj1F
	LIjq5nM9OtX+0gKjnnUq0fZtrlwcL8Tg+JLp+uDGlWuiMqKA8uhFFWzeN1KjLs9R
	rp3CWosFfjDj5JfN4qhVlI7JZNPVE4PDFWCdqjYQbV5AMlzmNB/+ygGL6xMJXSTS
	Na7ARkX7iDEWfbHKUZkGZDj4fXbVXUlWf5dY+Q2D3vQ183JokdCv1Lrvc0vYvl9N
	WNtdgxosRG1xo4y1/9pNud78YyHh9ovF4XLZySLKrxjp00ef3sHQb26qQuqa5RrW
	KE1647hCcMRWAs2IlA9RerTeG6BQGNP6nag9VO/xJdf00rY0KQB8YF33uDR3tXHH
	J5Dt9Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1t29q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 11:37:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53BBbdla003584
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 11:37:39 GMT
Received: from [10.218.22.7] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 11 Apr
 2025 04:37:34 -0700
Message-ID: <69fba227-ed47-4004-9451-777ca19b687f@quicinc.com>
Date: Fri, 11 Apr 2025 17:07:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sm6350: Add video clock
 controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luca Weiss
	<luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Michael
 Turquette" <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>
CC: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250324-sm6350-videocc-v2-0-cc22386433f4@fairphone.com>
 <20250324-sm6350-videocc-v2-4-cc22386433f4@fairphone.com>
 <1c09fee5-9626-4540-83fb-6d90db2ce595@oss.qualcomm.com>
 <9eb6dfd7-2716-4150-9392-98e26892d82d@quicinc.com>
 <e3dda8bf-e19e-4dde-83a4-7876ca81e5e6@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <e3dda8bf-e19e-4dde-83a4-7876ca81e5e6@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LjnntO8tf29NEwcfn2mZ6AKG0KlDzgFO
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f8ff04 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=6H0WHjuAAAAA:8
 a=pBxsQiL28MlgmQOkK-EA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: LjnntO8tf29NEwcfn2mZ6AKG0KlDzgFO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110074



On 4/11/2025 2:42 PM, Konrad Dybcio wrote:
> On 4/11/25 9:15 AM, Jagadeesh Kona wrote:
>>
>>
>> On 4/1/2025 10:03 PM, Konrad Dybcio wrote:
>>> On 3/24/25 9:41 AM, Luca Weiss wrote:
>>>> Add a node for the videocc found on the SM6350 SoC.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 14 ++++++++++++++
>>>>  1 file changed, 14 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>>> index 42f9d16c2fa6da66a8bb524a33c2687a1e4b40e0..4498d6dfd61a7e30a050a8654d54dae2d06c220c 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>>> @@ -1952,6 +1952,20 @@ usb_1_dwc3_ss_out: endpoint {
>>>>  			};
>>>>  		};
>>>>  
>>>> +		videocc: clock-controller@aaf0000 {
>>>> +			compatible = "qcom,sm6350-videocc";
>>>> +			reg = <0x0 0x0aaf0000 0x0 0x10000>;
>>>> +			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
>>>> +				 <&rpmhcc RPMH_CXO_CLK>,
>>>> +				 <&sleep_clk>;
>>>> +			clock-names = "iface",
>>>> +				      "bi_tcxo",
>>>> +				      "sleep_clk";
>>>> +			#clock-cells = <1>;
>>>> +			#reset-cells = <1>;
>>>> +			#power-domain-cells = <1>;
>>>> +		};
>>>
>>> You'll probably want to hook up some additional power domains here, see
>>>
>>> https://lore.kernel.org/linux-arm-msm/20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com/
>>>
>>
>> On SM6350, videocc doesn't need multiple power domains at HW level, it is only on CX rail which would be ON
>> when system is active, hence power-domains are not mandatory here.
> 
> 6350 doesn't have either MMCX nor a split MX - shouldn't both normal
> CX and MX be in there?
> 

All clocks & GDSC's of SM6350 videocc are only on CX rail, so it requires only CX power domain. But when HLOS
is active, CX rail will be ON and operate at a level above retention, which is sufficient for videocc to operate.
Hence clock driver don't need to explicitly vote on CX rail.

The same is not true for other rails like MMCX and Split MX(MXC), hence clock drivers had to explicitly vote on
those rails.

Thanks,
Jagadeesh 
 
> Konrad

