Return-Path: <linux-arm-msm+bounces-71505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB00B3F609
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 08:56:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 140787AEE3B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 06:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C8692E54BD;
	Tue,  2 Sep 2025 06:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L1b8lsXi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFCC279787;
	Tue,  2 Sep 2025 06:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756796209; cv=none; b=XwddEcg3K4lX4bAqiAFJtSeQa96DHZgKAibg8UOyU0WrIJS9O9TifJglSENwaW3nsYLCPx72RUt4Lp7xBIdaWhYIoovmBkubWGr5raOahskMRLibpzxtGnEWhjkvj5Ev+8EL1rX7kGfWB3FVU8PxQkKm6kHFcV1AhOQL8PSGk6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756796209; c=relaxed/simple;
	bh=O105z+/vSYQ4Yom7FKHQLBcP9B5uEpS3iwV1DeqMvDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Jt5VQtBo0fqxFylUkVWGxZAqtVUAHiVFehL/nTvKy6e50BVg9sbAjGcXf7dSNNr2zsWtUyMcLU3iOcaDgNNK5gOR57S9RIICdzjhNcs5rbbXwaeT1g5fxCxxNhBjDuP0aXY/WbPfxcHKjqwMgUgz8o0RZhetkwey6IlPVQuCEDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L1b8lsXi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822SBXm010468;
	Tue, 2 Sep 2025 06:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vYAsRdegq6abFlkAkg7pkXMF0w9WuWL6qVlwMcypxDM=; b=L1b8lsXiDdI0W2z3
	Hu+1g+E+5i3f4TA6XOnMO34e3kt9dSXC4BLCdaOZpBesMXLrBbRTBw47SpK07JWV
	1aZ2NydZ1em63TwyxcZAFN7UNApJfIfjiAyqqKmOCTtAjS3hoNbO7fpVsJNY+9tw
	kxD1HK8Q64Q2nf4c3OBi8dDcSC/wYaSOeFFG1OizbZZNaz4MkFYTU9PtCnxzSPBD
	C0DgGvtBHIMtbmbf7eQNJYrVDrKNwecUxfm5FOOSJCD71ZrW5pD7DDeeXHdhqOG/
	xJlX40YB/3UQGSHiOPf+mUeaHVXDqpyUtR+icHnQnvcNh4GTH/svpmzBgXIiwkbp
	17RvIA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjeu9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Sep 2025 06:56:43 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5826ugG8010913
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Sep 2025 06:56:42 GMT
Received: from [10.231.195.155] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Mon, 1 Sep
 2025 23:56:39 -0700
Message-ID: <23d10901-6b8a-41fb-8cb2-e8e361093561@quicinc.com>
Date: Tue, 2 Sep 2025 14:56:37 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Yingying Tang
	<yintang@qti.qualcomm.com>,
        <miaoqing.pan@oss.qualcomm.com>,
        "stone Zhang
 (Stone)" <stonez@qti.qualcomm.com>,
        <zhichen@qti.qualcomm.com>
References: <20250828-hamoa_initial-v8-0-c9d173072a5c@oss.qualcomm.com>
 <20250828-hamoa_initial-v8-3-c9d173072a5c@oss.qualcomm.com>
 <qgirqibqvsld7n2ac4cvuvtqknhqkq535jkxnxjjqvss5wpm36@i3mbp7qgqxju>
 <1600b292-df57-4328-baa6-db6467e00096@quicinc.com>
 <wxnyux7a5raz5ltz7hpd5dp5euuwwjts2qvhvr4ksdgoye6pm5@2jxthgfwgpuf>
From: Yingying Tang <quic_yintang@quicinc.com>
In-Reply-To: <wxnyux7a5raz5ltz7hpd5dp5euuwwjts2qvhvr4ksdgoye6pm5@2jxthgfwgpuf>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b6952b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=dcTC8DFeqv3NktzYkXkA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: WhVqAYS55w6TRWXZlZp-fjudE-LB3xdx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfXwpglC3Nfa4uj
 i8nY5m2x1OXDPjQVh+Ba+b+I5p74nyonRF4WCwRTy5kojPsK+lQWiFHcDPMqn+UDBQoe6bZDjCu
 sGivHReCpyCq4zeYUJ1oW+icgoleXFubRx5UTuaubVhh8URdfeoT21KlqyruCpkiaIZyyQyNoVD
 aRKiXYemMFe971MmpAjc2CwAEBU1zC548piJqVbxFA4M9ls4xdqv+2g7dqVNxnAWNG+/ZG+nnJZ
 7j07StlU+dG5lonsm2LpgINtVb4XjQ72DJrI/5m7v5J2Fcgw8BjHoAoAXQ7AidpySxJkD6MW20+
 wpSVV53Qo4wCxP8uerE++mCbOg4Nmbeua9oJfysTFbuprMM0dVI57Vdj/aEHWXiPFlE4meegG6N
 /uwFlLh5
X-Proofpoint-ORIG-GUID: WhVqAYS55w6TRWXZlZp-fjudE-LB3xdx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024



On 9/2/2025 10:37 AM, Dmitry Baryshkov wrote:
> On Mon, Sep 01, 2025 at 11:02:24AM +0800, Yingying Tang wrote:
>>
>>
>> On 8/28/2025 7:18 PM, Dmitry Baryshkov wrote:
>>> On Thu, Aug 28, 2025 at 12:48:47PM +0800, Yijie Yang wrote:
>>>> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
>>>> the Hamoa IoT SoM and a carrier board. Together, they form a complete
>>>> embedded system capable of booting to UART.
>>>>
>>>> This change enables the following peripherals on the carrier board:
>>>> - UART
>>>> - On-board regulators
>>>> - USB Type-C mux
>>>> - Pinctrl
>>>> - Embedded USB (EUSB) repeaters
>>>> - NVMe
>>>> - pmic-glink
>>>> - USB DisplayPorts
>>>> - Bluetooth
>>>> - Graphic
>>>> - Audio
>>>>
>>>> Written in collaboration with Quill Qi (Audio) <le.qi@oss.qualcomm.com>,
>>>> Jie Zhang (Graphics) <quic_jiezh@quicinc.com>, Shuai Zhang (Bluetooth)
>>>> <quic_shuaz@quicinc.com>, and Yongxing Mou (USB DisplayPorts)
>>>> <quic_yongmou@quicinc.com>.
>>>>
>>>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/Makefile          |    1 +
>>>>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 1247 ++++++++++++++++++++++++++++
>>>>  2 files changed, 1248 insertions(+)
>>>>
>>>> +
>>>> +	wcd938x: audio-codec {
>>>> +		compatible = "qcom,wcd9385-codec";
>>>> +
>>>> +		pinctrl-0 = <&wcd_default>;
>>>> +		pinctrl-names = "default";
>>>> +
>>>> +		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
>>>> +
>>>> +		qcom,micbias1-microvolt = <1800000>;
>>>> +		qcom,micbias2-microvolt = <1800000>;
>>>> +		qcom,micbias3-microvolt = <1800000>;
>>>> +		qcom,micbias4-microvolt = <1800000>;
>>>> +		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000
>>>> +		500000 500000 500000 500000>;
>>>
>>> Other platforms use a single line here. If you don't want to do it,
>>> align data to start from the same column rather than restarting from the
>>> column 1.
>>>
>>>> +		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
>>>> +		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
>>>> +		qcom,rx-device = <&wcd_rx>;
>>>> +		qcom,tx-device = <&wcd_tx>;
>>>> +
>>>> +		vdd-buck-supply = <&vreg_l15b_1p8>;
>>>> +		vdd-rxtx-supply = <&vreg_l15b_1p8>;
>>>> +		vdd-io-supply = <&vreg_l15b_1p8>;
>>>> +		vdd-mic-bias-supply = <&vreg_bob1>;
>>>> +
>>>> +		#sound-dai-cells = <1>;
>>>> +	};
>>>> +
>>>> +	wcn7850-pmu {
>>>> +		compatible = "qcom,wcn7850-pmu";
>>>> +
>>>> +		vdd-supply = <&vreg_wcn_0p95>;
>>>> +		vddio-supply = <&vreg_l15b_1p8>;
>>>> +		vddaon-supply = <&vreg_wcn_0p95>;
>>>> +		vdddig-supply = <&vreg_wcn_0p95>;
>>>> +		vddrfa1p2-supply = <&vreg_wcn_1p9>;
>>>> +		vddrfa1p8-supply = <&vreg_wcn_1p9>;
>>>> +
>>>> +		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
>>>
>>> Okay, so how is WiFi controlled? Is there a GPIO? The DT should be
>>> describing the hardware, not the UEFI behaviour.
>>>
>> Hi Dmitry, as I described in previous mail, On hamoa platfrom whole wifi module's power supply and enable gpio are voted in UEFI.
>> Hamoa is PC platform, so BIOS/UEFI behavior is compatible with Windows/ACPI architecture. UEFI is responsible for enabling power supply 
>> for all devices which may be used in boot phase (such as WLAN may be used to boot from network).
> 
> This is not completely relevant. You are describing driver / Linux /
> bootloader behaviour. I asked if there is a GPIO in the hardware. If
> there is one, please add it here.

Hi Dimitry,

During the UEFI boot phase, the WLAN enable GPIO has already been asserted, and the WLAN chip is functioning normally. 
If we include this GPIO in the kernel device tree, when the kernel configures this GPIO, its voltage level may experience a brief glitch, which could cause the WLAN chip to reset and result in a PCIe link down.

So I didn't add wlan-en-gpio in this hamoa's device tree.



> 
>>
>> So we need not Wifi chip's power and control GPIO in kernel side, thanks 
> 
> What if someone requests this GPIO from userspace and pulls it down?
> 
>>>> +
>>>> +		pinctrl-0 = <&wcn_bt_en>;
>>>> +		pinctrl-names = "default";
>>>> +
>>>
>>
> 


