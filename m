Return-Path: <linux-arm-msm+bounces-34968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 615CA9A409D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 16:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77F851C2438B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 14:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573875478E;
	Fri, 18 Oct 2024 14:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PIbf2saj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177C541A84;
	Fri, 18 Oct 2024 14:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729260211; cv=none; b=SQ4JPnR956Fvrh6sALWqvOnPX9o11prVV745hQlU6RegdkSCIiGiwxUE7esez/VrY0giG8WRWl9NDwyK6T+GqDHCqtLwn1djGIBpSDxIZonQUJBEmSjnfTnPcn2I9SUVKzRIZtdtQV5t+MFszCEO/kx3PkRaKhlvioUQKWJlFBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729260211; c=relaxed/simple;
	bh=qZfqYvidyZZs9iNU/7gvDLreaqVnDtDxxmt3detY5C0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PJtG1rO+BQ4s701G5MR3ZIb+Bjoqc5HbvJEPIFk+9TN8w4p8D8wmuG5C2jqNaL+aA5H5v0PuqP1NYZWOCe6bj2tyqZRhTa8FCDArHLr9a7yviQDRuShvS5xGKuKuNRt8Azc1bkCjt4cHlKLf8me973TVw4ObDABwV7xqbNPxklI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PIbf2saj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I6KYNY006874;
	Fri, 18 Oct 2024 14:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ww6WPk4zRAg8DqDwBPZb6CyOotm3JIke7iboM7rYt6o=; b=PIbf2sajCY7lp8uq
	bx1Xi2et9n2ndtp/EEmwMOtE033r5S9Nm5s2G8SRn7K0oMiqxTMMD5aWHZ/HF6Ri
	lzPEO3ZX74Gqlzis9yYPjtLwy/rkjLBjrGncZSE4qchn7v/NEckINEXlL9mlSnpK
	UrT7KaMQdU4I2JjkNLI08N25OQ2DzPg9/YK8zGal+VQrkLYWCiqz2zc1Z2h4cV/y
	elOj6F1adCRii9+VNlLSY4C7lSoSVZQ925eDeVpb7CH+Yh2oY05lJH4NOUoG4J0d
	hL5BhCo78Zw4gBiS1rFqbifvSmVtodE1y8gOM+a3LhwZ6lbpDvQwoC87f7TeZttm
	zTo6uw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42b5hsudsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 14:03:17 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49IE3FsN014099
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 14:03:15 GMT
Received: from [10.253.38.177] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Oct
 2024 07:03:10 -0700
Message-ID: <32dbf7ee-1190-401c-b6b1-bc8c70a5158c@quicinc.com>
Date: Fri, 18 Oct 2024 22:03:08 +0800
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
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <CAA8EJprVNOLO-CoorNhvKrrSD1bNKdFrzth5BL0GHXffPv62jw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xERruqM-VTbohSe7-PW1Y8IWLNcPEXbC
X-Proofpoint-ORIG-GUID: xERruqM-VTbohSe7-PW1Y8IWLNcPEXbC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180089



On 10/18/2024 4:11 PM, Dmitry Baryshkov wrote:
> On Fri, 18 Oct 2024 at 09:55, Jie Luo <quic_luoj@quicinc.com> wrote:
>>
>>
>>
>> On 10/18/2024 6:32 AM, Dmitry Baryshkov wrote:
>>> On Tue, Oct 15, 2024 at 10:16:54PM +0800, Luo Jie wrote:
>>>> The CMN PLL clock controller allows selection of an input
>>>> clock rate from a defined set of input clock rates. It in-turn
>>>> supplies fixed rate output clocks to the hardware blocks that
>>>> provide ethernet functions such as PPE (Packet Process Engine)
>>>> and connected switch or PHY, and to GCC.
>>>>
>>>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi |  6 +++++-
>>>>    arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 20 +++++++++++++++++++-
>>>>    2 files changed, 24 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>>>> index 91e104b0f865..77e1e42083f3 100644
>>>> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>>>> @@ -3,7 +3,7 @@
>>>>     * IPQ9574 RDP board common device tree source
>>>>     *
>>>>     * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
>>>> - * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
>>>> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>>>     */
>>>>
>>>>    /dts-v1/;
>>>> @@ -164,6 +164,10 @@ &usb3 {
>>>>       status = "okay";
>>>>    };
>>>>
>>>> +&cmn_pll_ref_clk {
>>>> +    clock-frequency = <48000000>;
>>>> +};
>>>> +
>>>>    &xo_board_clk {
>>>>       clock-frequency = <24000000>;
>>>>    };
>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>>>> index 14c7b3a78442..93f66bb83c5a 100644
>>>> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>>>> @@ -3,10 +3,11 @@
>>>>     * IPQ9574 SoC device tree source
>>>>     *
>>>>     * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
>>>> - * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
>>>> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>>>     */
>>>>
>>>>    #include <dt-bindings/clock/qcom,apss-ipq.h>
>>>> +#include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
>>>>    #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
>>>>    #include <dt-bindings/interconnect/qcom,ipq9574.h>
>>>>    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> @@ -19,6 +20,11 @@ / {
>>>>       #size-cells = <2>;
>>>>
>>>>       clocks {
>>>> +            cmn_pll_ref_clk: cmn-pll-ref-clk {
>>>> +                    compatible = "fixed-clock";
>>>> +                    #clock-cells = <0>;
>>>> +            };
>>>
>>> Which block provides this clock? If it is provided by the external XO
>>> then it should not be a part of the SoC dtsi.
>>
>> The on-chip WiFi block supplies this reference clock. So keeping it in
>> the SoC DTSI is perhaps appropriate.
> 
> Then maybe it should be provided by the WiFi device node? At least you
> should document your design decisions in the commit message.

This CMN PLL reference clock is fixed rate and is automatically
generated by the SoC's internal Wi-Fi hardware block with no software
configuration required from the Wi-Fi side.

Sure, I will enhance the commit message to add the information on the
fixed reference clock from Wi-Fi block. Hope this is ok.

> 
> Also, I don't think this node passes DT schema validation. Did you check it?

Yes, the DT is validated against the schema, I have shared the logs
below. Could you please let me know If anything needs rectification?

dt-doc-validate --version
2024.9

make ARCH=arm64 DT_SCHEMA_FILES=qcom,ipq9574-cmn-pll.yaml CHECK_DTBS=y 
qcom/ipq9574-rdp433.dtb
   DTC [C] arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb

make ARCH=arm64 dt_binding_check 
DT_SCHEMA_FILES=qcom,ipq9574-cmn-pll.yaml        SCHEMA 
Documentation/devicetree/bindings/processed-schema.json
   CHKDT   Documentation/devicetree/bindings
   LINT    Documentation/devicetree/bindings
   DTEX 
Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.example.dts
   DTC [C] 
Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.example.dtb

make ARCH=arm64 CHECK_DTBS=y qcom/ipq9574-rdp433.dtb 
          DTC [C] arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb
/local/mnt2/workspace/luoj/projects/opensrc/linux-next-cmnpll-validation/linux-next/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: 
usb@8af8800: interrupt-names: ['pwr_event'] is too short
         from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
/local/mnt2/workspace/luoj/projects/opensrc/linux-next-cmnpll-validation/linux-next/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: 
usb@8af8800: interrupts-extended: [[1, 0, 134, 4]] is too short
         from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

> 
>>
>>>
>>>> +
>>>>               sleep_clk: sleep-clk {
>>>>                       compatible = "fixed-clock";
>>>>                       #clock-cells = <0>;
>>>> @@ -243,6 +249,18 @@ mdio: mdio@90000 {
>>>>                       status = "disabled";
>>>>               };
>>>>
>>>> +            cmn_pll: clock-controller@9b000 {
>>>> +                    compatible = "qcom,ipq9574-cmn-pll";
>>>> +                    reg = <0x0009b000 0x800>;
>>>> +                    clocks = <&cmn_pll_ref_clk>,
>>>> +                             <&gcc GCC_CMN_12GPLL_AHB_CLK>,
>>>> +                             <&gcc GCC_CMN_12GPLL_SYS_CLK>;
>>>> +                    clock-names = "ref", "ahb", "sys";
>>>> +                    #clock-cells = <1>;
>>>> +                    assigned-clocks = <&cmn_pll CMN_PLL_CLK>;
>>>> +                    assigned-clock-rates-u64 = /bits/ 64 <12000000000>;
>>>> +            };
>>>> +
>>>>               qfprom: efuse@a4000 {
>>>>                       compatible = "qcom,ipq9574-qfprom", "qcom,qfprom";
>>>>                       reg = <0x000a4000 0x5a1>;
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>>
>>
> 
> 


