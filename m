Return-Path: <linux-arm-msm+bounces-35607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEA99ACAB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 15:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C36BB236DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 13:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41AC1AC444;
	Wed, 23 Oct 2024 13:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="A1Kg3w74"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FB3156C72;
	Wed, 23 Oct 2024 13:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729688736; cv=none; b=jkLaf4/RVaM0m8s/kU4aNEmBh60c7TowlU2jhPYsKPi5xDaZGo5dmM6c31J2L1G3mYDTTDMyJl0tbEkhEhSRRx6tOEVeCDChgG3RlZj7O0YLityc8GL0akprFnMwF0pGPhZVWuvSsSNlOq8rUq/H4x+Ldm1F/42d6NvbZpZ2Adg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729688736; c=relaxed/simple;
	bh=UBCLs1CT6lS89hLMeBBrgYkW5FO4QlEYT3JDYAYWdPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iHgG2gcqTRt/Skttxl7RpP8Nq23ZSrxuXnoHJeFsrftQQumU/fARK9DaFNJqJrK089LPiNymcIt14Cplz4vVO5TR3QiMfMPwyiA4Htj+VfMtVD4aounFF39+02vLdJ7c8YMb4iWiSGinMqrCB6gLcGZ9C4upi0bgzAqiygJMBnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=A1Kg3w74; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9uKAa020008;
	Wed, 23 Oct 2024 13:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4403SM6nc/S9kArf7Hq5R7eFffWVXEua9Stbp6iDzSo=; b=A1Kg3w74+xsRbx0L
	Dek8a/wPSE7yAezN3U4vxBhqh7ke86c10Utm9PqaBW228uO+BNyCfnJyb+MHbI1M
	iyDSo8/hl0xs7EZx3rHO4yYni4UP4gFxJHqSYRz/Dr34GPps4gPDYaW7tey2aDOG
	pKprSCBBqhBhys56Vb4C0+rE4ZlLA1vhbE0pwFCxl+J/MFoKtpMrlN0z/U5OaTun
	GkTl36AnNXq51Ao5oziOvdTivxaYFdQ6N0zYA/fTIUYJccEwiD4xsaFvUqmmjkaf
	rEXqtpJsuxd7knsS18nfoM8QI62tW2br9yLXMWe6Qx/xqwKnXSomQYQg/18PVnG3
	XtzzCg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em66a8vx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 13:05:17 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49ND5GIx005127
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 13:05:16 GMT
Received: from [10.253.39.49] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Oct
 2024 06:05:11 -0700
Message-ID: <a2448df9-9b8b-4b7e-ada5-6f26d7e7da97@quicinc.com>
Date: Wed, 23 Oct 2024 21:05:09 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add CMN PLL node for IPQ9574 SoC
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <bartosz.golaszewski@linaro.org>, <srinivas.kandagatla@linaro.org>
References: <20241015-qcom_ipq_cmnpll-v4-0-27817fbe3505@quicinc.com>
 <20241015-qcom_ipq_cmnpll-v4-4-27817fbe3505@quicinc.com>
 <abro3enahzbugcwokcyyhwybbokestbigvzhywxhnfrdjihni3@7ej2hkgbgtf6>
 <b336724c-1fea-4e1e-9477-66f53d746f09@quicinc.com>
 <CAA8EJprVNOLO-CoorNhvKrrSD1bNKdFrzth5BL0GHXffPv62jw@mail.gmail.com>
 <32dbf7ee-1190-401c-b6b1-bc8c70a5158c@quicinc.com>
 <cqgkc3qpupbv47rqxiyhe2m466zxcxepyfcgyaieo2sggffprx@mstqi4pqoiqc>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <cqgkc3qpupbv47rqxiyhe2m466zxcxepyfcgyaieo2sggffprx@mstqi4pqoiqc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1CO6k--mz-lrf1Qh_Mly3NrWvlL3yEAP
X-Proofpoint-GUID: 1CO6k--mz-lrf1Qh_Mly3NrWvlL3yEAP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 clxscore=1011 mlxscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230078



On 10/18/2024 11:38 PM, Dmitry Baryshkov wrote:
> On Fri, Oct 18, 2024 at 10:03:08PM +0800, Jie Luo wrote:
>>
>>
>> On 10/18/2024 4:11 PM, Dmitry Baryshkov wrote:
>>> On Fri, 18 Oct 2024 at 09:55, Jie Luo <quic_luoj@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 10/18/2024 6:32 AM, Dmitry Baryshkov wrote:
>>>>> On Tue, Oct 15, 2024 at 10:16:54PM +0800, Luo Jie wrote:
>>>>>> The CMN PLL clock controller allows selection of an input
>>>>>> clock rate from a defined set of input clock rates. It in-turn
>>>>>> supplies fixed rate output clocks to the hardware blocks that
>>>>>> provide ethernet functions such as PPE (Packet Process Engine)
>>>>>> and connected switch or PHY, and to GCC.
>>>>>>
>>>>>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>>>>>> ---
>>>>>>     arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi |  6 +++++-
>>>>>>     arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 20 +++++++++++++++++++-
>>>>>>     2 files changed, 24 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>>>>>> index 91e104b0f865..77e1e42083f3 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>>>>>> @@ -3,7 +3,7 @@
>>>>>>      * IPQ9574 RDP board common device tree source
>>>>>>      *
>>>>>>      * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
>>>>>> - * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
>>>>>> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>>>>>      */
>>>>>>
>>>>>>     /dts-v1/;
>>>>>> @@ -164,6 +164,10 @@ &usb3 {
>>>>>>        status = "okay";
>>>>>>     };
>>>>>>
>>>>>> +&cmn_pll_ref_clk {
>>>>>> +    clock-frequency = <48000000>;
>>>>>> +};
>>>>>> +
>>>>>>     &xo_board_clk {
>>>>>>        clock-frequency = <24000000>;
>>>>>>     };
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>>>>>> index 14c7b3a78442..93f66bb83c5a 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>>>>>> @@ -3,10 +3,11 @@
>>>>>>      * IPQ9574 SoC device tree source
>>>>>>      *
>>>>>>      * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
>>>>>> - * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
>>>>>> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>>>>>      */
>>>>>>
>>>>>>     #include <dt-bindings/clock/qcom,apss-ipq.h>
>>>>>> +#include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
>>>>>>     #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
>>>>>>     #include <dt-bindings/interconnect/qcom,ipq9574.h>
>>>>>>     #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>>> @@ -19,6 +20,11 @@ / {
>>>>>>        #size-cells = <2>;
>>>>>>
>>>>>>        clocks {
>>>>>> +            cmn_pll_ref_clk: cmn-pll-ref-clk {
>>>>>> +                    compatible = "fixed-clock";
>>>>>> +                    #clock-cells = <0>;
>>>>>> +            };
>>>>>
>>>>> Which block provides this clock? If it is provided by the external XO
>>>>> then it should not be a part of the SoC dtsi.
>>>>
>>>> The on-chip WiFi block supplies this reference clock. So keeping it in
>>>> the SoC DTSI is perhaps appropriate.
>>>
>>> Then maybe it should be provided by the WiFi device node? At least you
>>> should document your design decisions in the commit message.
>>
>> This CMN PLL reference clock is fixed rate and is automatically
>> generated by the SoC's internal Wi-Fi hardware block with no software
>> configuration required from the Wi-Fi side.
>>
>> Sure, I will enhance the commit message to add the information on the
>> fixed reference clock from Wi-Fi block. Hope this is ok.
> 
> We have other fixed clocks which are provided by hardware blocks.
> Without additional details it is impossible to answer whether it is fine
> or not.

There is an XO on the board which supplies reference clock (48Mhz or
96Mhz) to the Wi-Fi block on the SoC. There is a multiplier/divider in
the Wi-Fi block, which ensures the output reference clock of 48Mhz is
supplied to CMN PLL block.

In summary, below is the path to receive the reference clock at CMN PLL:
The clock path is .XO (48 MHZ/96 MHZ) --> WiFi (multiplier/divider) 
-->(48 MHZ) --> CMN PLL.

There is no software configuration required for the entire path, as it
is fully controlled by bootstrap pins on the board. There are bootstrap
pins for selecting the selecting the XO frequency (48Mhz or 96Mhz) and
based on this, the divider is automatically selected by HW (1 for 48Mhz,
2 for 96Mhz), to ensure output clock to CMN PLL is 48Mhz.

> 
>>
>>>
>>> Also, I don't think this node passes DT schema validation. Did you check it?
>>
>> Yes, the DT is validated against the schema, I have shared the logs
>> below. Could you please let me know If anything needs rectification?
> 
> I see, you are setting the cmn_pll_ref_clk frequency in the
> ipq9574-rdp-common.dtsi file. If the PLL is internal to the SoC, why is
> the frequency set outside of it? Is it generated by multiplying the XO
> clk? Should you be using fixed-factor clock instead?
> 

Since the reference clock is controlled by bootstrap pins on the board,
it may be appropriate to define the frequency for this reference clock
in the board DTS. Given the clock tree described above, I will update
the cmn_pll_ref_clk to define it as a fixed-factor clock as per your
suggestion, with its frequency and factors configured in board DTSI.
These values defined in rdp-common.dtsi will be default values that can
be overridden if necessary by different boards. Hope this approach is
fine.

In ipq9574.dtsi:
cmn_pll_ref_clk: cmn-pll-ref-clk { 
  
  

         compatible = "fixed-factor-clock"; 
  
  

         clocks = <&xo_clk>; 
  
  
  
  
  

	#clock-cells = <0>;
};

xo_clk: xo {
	compatible = "fixed-clock";
	#clock-cells = <0>;
};

In ipq9574-rdp-common.dtsi.
&cmn_pll_ref_clk {
	clock-div = <1>;
	clock-mult = <1>;
};

&xo_clk {
	clock-frequency = <48000000>;
}

