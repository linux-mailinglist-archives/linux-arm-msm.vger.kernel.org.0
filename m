Return-Path: <linux-arm-msm+bounces-35749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3619AF58D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 00:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D79D71C21358
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 22:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 758971B0F11;
	Thu, 24 Oct 2024 22:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="By1e5e+5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAB222B66B;
	Thu, 24 Oct 2024 22:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729810037; cv=none; b=o2JfaFowe42P8HqgT4TL/NriVirpTIlMVzX0C7MYfJo8W89beZ0oc4mkK8Kln7DFdUqOom+5xWPUnm0U5o/kG3E44mOMzV9MF6Hw6+t9GhOxvQxbY/Va0+U2mjS0sK+P/hpyd94HRBuqXeyjSAjxjHhiTVgeEY+CvpZduWz6nVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729810037; c=relaxed/simple;
	bh=QmdCeVWPPcovBQHiPOAWAeyLgjrwCNegokViJ8dhSt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MGHwzj60CZnaOFQ1f5aVqqMYhcJsEZcSuC+Ri07gyXUAfUWhzyBhfikGspNUGtzMKJFPU4iIUxSDwmkEKN7vBaagFHDVB0oU0eALfw83/SSbaS4QTcc0PwLjcJbSTOyvbUSLN24IUDsELS5WxE1l4Jf+wsojOodhf92z7ZU0eTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=By1e5e+5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OLWwx1018676;
	Thu, 24 Oct 2024 22:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gBr4ic81vTmvN7XRQwq9YY3unq51MMimZGFmIhdyS1w=; b=By1e5e+5oNNn5nAO
	o43Ohiy+KFls7LGMpqKGgEyZIVm218pwmVrv3LSDPE4vS0J5XPESWklrJN63Ndex
	oEagm9Od3Muiy1wAQ0IinjyPHRh+uSSx8EcJKeuPxVuBxt+QxVwKKpBTcKDmFfwZ
	HTbgSwdWolvz3CvV7h+bxYl6FLOnnL19uW76q1Cyrm48N7CPGlZoNYPdcMVNdCbs
	l4CXWgU+TGHtswMPtsYVJfgKpexugDol9imBs39EDeMODVOht36fVj6ImDjk9eeM
	Smu6T3/dyqljrCrNyrO1QnjJurgYUFacr37IkIkv7eiKLdlhH5B9C0r2284ysToM
	ILu9Qw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em66f5r7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 22:46:51 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49OMkc1v005480
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 22:46:38 GMT
Received: from [10.71.108.63] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Oct
 2024 15:46:37 -0700
Message-ID: <d6452efa-5d97-4c29-a2ea-8c97569dbdb5@quicinc.com>
Date: Thu, 24 Oct 2024 15:46:37 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] dts: qcom: Introduce SM8750 device trees
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rob Herring (Arm)"
	<robh@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "Neil
 Armstrong" <neil.armstrong@linaro.org>,
        Lee Jones <lee@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, "Stephen Boyd" <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        "Catalin Marinas" <catalin.marinas@arm.com>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Will Deacon <will@kernel.org>
References: <20241021232114.2636083-1-quic_molvera@quicinc.com>
 <172978739477.623395.5604249801475913676.robh@kernel.org>
 <3ca1f7e8-1204-4898-9e7e-cb6423c122cc@oss.qualcomm.com>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <3ca1f7e8-1204-4898-9e7e-cb6423c122cc@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 867ay8EuuWrW-d_ts8xBu19lu33tUxZV
X-Proofpoint-GUID: 867ay8EuuWrW-d_ts8xBu19lu33tUxZV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=856
 suspectscore=0 clxscore=1015 mlxscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240186



On 10/24/2024 10:22 AM, Konrad Dybcio wrote:
> On 24.10.2024 6:33 PM, Rob Herring (Arm) wrote:
>> On Mon, 21 Oct 2024 16:21:09 -0700, Melody Olvera wrote:
>>> This series adds the initial device tree support for the SM8750 SoCs
>>> needed to boot to shell. This specifically adds support for clocks,
>>> pinctrl, rpmhpd, regulators, interconnects, and SoC and board
>>> compatibles.
>>>
> [...]
>
>> New warnings running 'make CHECK_DTBS=y qcom/sm8750-mtp.dtb qcom/sm8750-qrd.dtb' for 20241021232114.2636083-1-quic_molvera@quicinc.com:
>>
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
>> 	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: domain-idle-states: cluster-sleep-0:compatible:0: 'domain-idle-state' was expected
>> 	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
>> 	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: domain-idle-states: cluster-sleep-0:compatible:0: 'domain-idle-state' was expected
>> 	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
> These were recently dropped across the board, please drop them
> here as well.

Ack.

>
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: pmic@7: 'eusb2-repeater@fd00' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[0-9]+', 'pon@[0-9a-f]+$'
>> 	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: pmic@7: 'eusb2-repeater@fd00' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[0-9]+', 'pon@[0-9a-f]+$'
> phy@ (as seen in x1e80100-pmics.dtsi)

Ack.

>
>> 	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: rsc@16500000: regulators-0: Unevaluated properties are not allowed ('vdd-l1-supply', 'vdd-l10-supply', 'vdd-l4-supply' were unexpected)
>> 	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: rsc@16500000: regulators-0: Unevaluated properties are not allowed ('vdd-l1-supply', 'vdd-l10-supply', 'vdd-l4-supply' were unexpected)

These actually needed to be combined; they should be 
vdd-l1-l4-l10-supply. Will fix.

>> 	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: rsc@16500000: regulators-4: Unevaluated properties are not allowed ('vdd-s7-supply', 'vdd-s8-supply' were unexpected)
>> 	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: rsc@16500000: regulators-4: Unevaluated properties are not allowed ('vdd-s7-supply', 'vdd-s8-supply' were unexpected)
>> 	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
> These need bindings updates

Agreed; this regulator is not documented correctly. Will address in a v2 ps.

>
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: rsc@16500000: 'power-domains' is a required property
>> 	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
> This I'll address when reviewing the dt

So for this, let me know if the following seems about right.
The rsc node needs a system-wide power domain defined. To accomplish 
this, I would define
a system_pd node and point both cluster pd nodes to it via 
power-domains, similar to what you did here:
https://lore.kernel.org/all/20240102-topic-x1e_fixes-v1-3-70723e08d5f6@linaro.org/

Then, extrapolating from that, I can define a system-wide idle-state 
under the domain-idle-state node as follows:
domain_ss3: domain-sleep-0 {
     compatible = "domain-idle-state";
     [...] (omitting a bunch of details, but you get the point)
};

And then point to that from the new system_pd node under the psci node:
system_pd: power-domain-system {
     #power-domain-cells = <0>;
     domain-idle-states = <&domain_ss3>;
};

And then of course in the rsc node, have power-domains = <&system_pd>;

Is that correct?


>
> [...] (skipping a bunch of duplicates)
>
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: timer@16800000: #size-cells: 1 was expected
>> 	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer_mmio.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: timer@16800000: #size-cells: 1 was expected
>> 	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer_mmio.yaml#
> #address-cells <2> is fine, #size-cells must be 1, apparently

Ack.

Thanks,
Melody

