Return-Path: <linux-arm-msm+bounces-73619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D225B58B5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 03:42:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5C6417083B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 01:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E922A220F38;
	Tue, 16 Sep 2025 01:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PFqYzgmb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9441221DAE;
	Tue, 16 Sep 2025 01:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757986958; cv=none; b=thPRa6XVucYCqPofYpN6U9APNa4Xm3GrTyqZnVauomy5cpWQ9rlyUdmmLcHp7/eESv3j5JMKwEq66x1C/S3qvJHgOmpEv8NA8Woh221koa7vS51MtRDUab57o49/bNNT7dUobgaxx/L2c0LcPM0BIhypqfpcJ+Jld3ngT+1ZXWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757986958; c=relaxed/simple;
	bh=wQUzAqVEeXkuBbdQlS59ZJEef76CWtcFW2TBoR9gBvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IBaZG1H9ktqhY/5ExOkoZQRhifn64cyx2ntJG6BNoAPZtRQhYUoWVP/hqdCikUx1HPUfVuZDrWQHX2v8br2I21eLHxM6njCJRC5qQNHlg1nRdD3GUcC6Om0o0uSjL/5RVtKXCCDWnmGK4d2XJ9cjlDhC/H1aCRevcQPAj/JwkpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PFqYzgmb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FEAh5D002382;
	Tue, 16 Sep 2025 01:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u0DgAO7WtJOgWlLICy5tTYCxSJaESuTmIoNwm+65vN0=; b=PFqYzgmbMgYC3pyF
	Vj1atfLgKjY2ft3gODN5HVj7p3BGbNsQ60U2T5ODrLpNZmhdmoaV7npNaDBxLiVh
	vgqZQ1gyIlN91Nm4lBNvslfhAWNSUoyy0+gbMBaRsjSqvANOBXFmUGQ2XMyfbMzr
	CujfgyXaHVtHTvUio5N8lbyT6z1UeK+Hnkvu8t0R/uYx2+XPBvvtWra8GVK54pww
	F7/KX20P6JdezH9zjG+cwqSdIPein4+LwoamqwkYZAJkLzT7IYesjgVnE3w3xMhC
	RxIZKqmB03Mx3VG0pzZOZ7I9QFk10tML/yoju7gb3nNNkJJe9bWiPfpNaTgYpmWw
	4+eMyA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496da9b943-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 01:42:32 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58G1gVlC009520
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 01:42:31 GMT
Received: from [10.231.195.155] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Mon, 15 Sep
 2025 18:42:29 -0700
Message-ID: <317ffa87-060c-4f1b-a6bf-61bb27367477@quicinc.com>
Date: Tue, 16 Sep 2025 09:42:26 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/4] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Yijie Yang
	<yijie.yang@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250910-hamoa_initial-v11-0-38ed7f2015f7@oss.qualcomm.com>
 <20250910-hamoa_initial-v11-4-38ed7f2015f7@oss.qualcomm.com>
 <aMPhEm8PuhEofHP7@linaro.org>
From: Yingying Tang <quic_yintang@quicinc.com>
In-Reply-To: <aMPhEm8PuhEofHP7@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=M+5NKzws c=1 sm=1 tr=0 ts=68c8c088 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=BKfv3jXuzfWu8byZeJgA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: YTSvcZ3zbg-c4tTPvllNglaz9GfO0_L6
X-Proofpoint-ORIG-GUID: YTSvcZ3zbg-c4tTPvllNglaz9GfO0_L6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA1NiBTYWx0ZWRfXwslaY2RrDsAm
 TxDz92Cg1qXNY9qDlegSsZNX5PoNB3/rcN2GKsuXCgo0hWZFRILzmIUO0s3evBwybeCFi48vETO
 32jJS8lh621+8IfFg9pYb7CtqaB7x8TP7OgrU32d4sa3y1lVW/6kxlY0BXSgNRY1SpMrt8wpf6t
 sjN/VFGiQ3m2TaNIEeI6RYBNgJhppvFcz9LR+LD3RoZe8420welJlv3NRVZZr+BRWvi1oIXaIvq
 bzS+z+7LW3HMJaa+IdU1KLEcQT32H3sbRKP3Sxv7vdX7+NpXoszFYDWsGnfjGtKUouBs19kpVhW
 G1jHIfVnxpKpRBo7ELxw37ihXRqfHO66kL2l9Pxt2O0TG2afjhZxNqjHhNq+aXfw0ZorQ1fOHl6
 wRsQO6zu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1011 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509150056



On 9/12/2025 5:00 PM, Stephan Gerhold wrote:
> On Wed, Sep 10, 2025 at 05:02:12PM +0800, Yijie Yang wrote:
>> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
>> the Hamoa IoT SoM and a carrier board. Together, they form a complete
>> embedded system capable of booting to UART.
>>
>> Make the following peripherals on the carrier board enabled:
>> - UART
>> - On-board regulators
>> - USB Type-C mux
>> - Pinctrl
>> - Embedded USB (EUSB) repeaters
>> - NVMe
>> - pmic-glink
>> - USB DisplayPorts
>> - Bluetooth
>> - WLAN
>> - Audio
>>
>> Written in collaboration with Quill Qi (Audio) <le.qi@oss.qualcomm.com>,
>> Jie Zhang (Graphics) <quic_jiezh@quicinc.com>, Shuai Zhang (Bluetooth)
>> <quic_shuaz@quicinc.com>, Yingying Tang (WLAN) <quic_yintang@quicinc.com>,
>> and Yongxing Mou (USB DisplayPorts) <quic_yongmou@quicinc.com>.
> 
> This looks like you should have Co-developed-by: tags together with
> their Signed-off-by: tags.
> 
>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile          |    1 +
>>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 1221 ++++++++++++++++++++++++++++
>>  2 files changed, 1222 insertions(+)
>>
>> [...]
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> new file mode 100644
>> index 000000000000..6eedad7e858a
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> @@ -0,0 +1,1221 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "hamoa-iot-som.dtsi"
>> +
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. Hamoa IoT EVK";
>> +	compatible = "qcom,hamoa-iot-evk", "qcom,hamoa-iot-som", "qcom,x1e80100";
>> +	chassis-type = "embedded";
>> +
>> [...]
>> +	/*
>> +	 * TODO: These two regulators are actually part of the removable M.2
>> +	 * card and not the CRD mainboard. Need to describe this differently.
> 
> This is not a CRD, I think?
> 
>> +	 * Functionally it works correctly, because all we need to do is to
>> +	 * turn on the actual 3.3V supply above.
>> +	 */
>> +	vreg_wcn_0p95: regulator-wcn-0p95 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_WCN_0P95";
>> +		regulator-min-microvolt = <950000>;
>> +		regulator-max-microvolt = <950000>;
>> +
>> +		vin-supply = <&vreg_wcn_3p3>;
>> +	};
>> +
>> +	vreg_wcn_1p9: regulator-wcn-1p9 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_WCN_1P9";
>> +		regulator-min-microvolt = <1900000>;
>> +		regulator-max-microvolt = <1900000>;
>> +
>> +		vin-supply = <&vreg_wcn_3p3>;
>> +	};
>> +
>> +	vreg_wcn_3p3: regulator-wcn-3p3 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_WCN_3P3";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&wcn_sw_en>;
>> +		pinctrl-names = "default";
>> +
> 
> regulator-boot-on?

It shoulde be regulator-always-on
> 
>> +		regulator-always-on;
>> +	};
>> +
>> [...]
>> +};
>> +
>> [...]
>> +&mdss {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dp0 {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dp0_out {
>> +	data-lanes = <0 1>;
> 
> This is unneeded unless you really want to limit this to just 2 lanes.
> x1e80100.dtsi specifies 4 lanes by default.
> 
>> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>> +};
>> +
>> +&mdss_dp1 {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dp1_out {
>> +	data-lanes = <0 1>;
> 
> Same here.
> 
>> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>> +};
>> +
>> +&mdss_dp2 {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dp2_out {
>> +	data-lanes = <0 1>;
> 
> And here.
> 
>> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>> +};
>> +
>> +&mdss_dp3 {
>> +	/delete-property/ #sound-dai-cells;
> 
> You need to define pinctrl for the HPD pin here.
> 
> Thanks,
> Stephan


