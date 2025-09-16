Return-Path: <linux-arm-msm+bounces-73674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31157B593D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 12:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6BD03B19B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 10:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724FC30597B;
	Tue, 16 Sep 2025 10:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Eo5X7Pni"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8673E30596C;
	Tue, 16 Sep 2025 10:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758018570; cv=none; b=fGIwZF74xrHvEV1f68DmeQClXn/oZ+YZnm2AuCasCeBmXCY6qOFz7SF5WdVEWbhVXEQqwQVBEVi05yKd98Uu/frpVwehnXJJgy9WEpUOEgqDoopGu3Jk/oA5w5lTllSZwkRd5k52UsA0M+TErC2YS3H1M4jQzuKV7OJmqv2eK9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758018570; c=relaxed/simple;
	bh=xLHYiPNjGHS1mIa7j8mQuVkgH/Nrxly+KAF+eo6q+jQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Tsf76XjVGyROLCw11dBARiAvCodFRp8esddVUhgLQ0Gr7u3mJtEyeA3//OkK0aBpMPCVsFPzO91FEP39VZnfHHj0indAYF3POM+PxHymTtf49bG7TXvvknN9GiAcNPqJVt5VN5eVPm4tEynHYPGkFPFx7tD9cS6jj4HI1XWym1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Eo5X7Pni; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G9jMT8020246;
	Tue, 16 Sep 2025 10:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HZ3G7XV8FFn3g7gAhGKeTrzavytN+4WNmGecUqsyMm4=; b=Eo5X7PniRf/vnTZ6
	FEtid8tt2wm8c3TEyMc/3n0WTozuYen0/p/VY3B0uPwJfAqdCcc9ZjP2D0WC1nEs
	w3q6M8Wa/M4CUK+Gd3SpMbdyKsnA/PgVa5cP8jYlKX81praDST9CRoBF6+ykv7BU
	t97mqci9b8o+5ZVzKJpgUGnF45siu28y7bvkhGyfYhw+a2xSrTdPhGFikV88uy4p
	prKZ4d1xfu7XcODA3Gj47kJj1X+B3+P+Oxz0omm9ramHIdYpvCQiyGkhR/qpxqhd
	0wvTlOLzK+XYLBh2nA0336kvpU9fs/KT1UOISvUw3tp71vwDsWVZKjskFkbEEqvz
	lcD+tw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496h1sm1c3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 10:29:24 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58GATNSH010821
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 10:29:23 GMT
Received: from [10.253.12.79] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 16 Sep
 2025 03:29:20 -0700
Message-ID: <b3bf54a2-f33b-44d5-a9e4-65ba18ea267d@quicinc.com>
Date: Tue, 16 Sep 2025 18:29:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/4] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Yijie Yang
	<yijie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Yingying Tang
	<yingying.tang@oss.qualcomm.com>,
        Shuai Zhang <shuaz@qti.qualcomm.com>
References: <20250910-hamoa_initial-v11-0-38ed7f2015f7@oss.qualcomm.com>
 <20250910-hamoa_initial-v11-4-38ed7f2015f7@oss.qualcomm.com>
 <aMPhEm8PuhEofHP7@linaro.org>
 <317ffa87-060c-4f1b-a6bf-61bb27367477@quicinc.com>
 <jimz3qnjrcvemvgrqpwxq4zmywfo6psplsg4jefkvvpiwlffek@fwn3juynr4zx>
From: Yingying Tang <quic_yintang@quicinc.com>
In-Reply-To: <jimz3qnjrcvemvgrqpwxq4zmywfo6psplsg4jefkvvpiwlffek@fwn3juynr4zx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3AADeK94tyw09TCDBto8LlOmRb3uk88r
X-Authority-Analysis: v=2.4 cv=A/1sP7WG c=1 sm=1 tr=0 ts=68c93c04 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=C2Vfro6yae4YIf0hDw4A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 3AADeK94tyw09TCDBto8LlOmRb3uk88r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA5OCBTYWx0ZWRfX/xIVKIf9uC0R
 nEgiipzGcnckSMtJjxvBMwjvbynJZcUz33637ahQnX12y7O5NC+1WUmFb8h6jEnki33cS1r41Bc
 FEvLmh8d8N/EXh9bq9CDAAlJWXVuDR8/MnIcZaWzrMgAGK96FP1qFgb2WjoCNKTP45j78kqJz0m
 KLVksvnfYt/+vd4BCuHMboErcBp4Ta1pColkxmHdMrj4eeB5/bjlcY+41vnvNlz/Ki5CW33p7fC
 kIKCvFQ4EUT/hGx/3zoqn/xbxfL7drXeG2sxkeqJhH0xgkwYUpLKxIZCib4kk0Nsv8cKkP3YxOI
 ndRfBd+yb0u6BUoYWDTSgMygpsp1rmizXnfyw2XepQoh22K8OhfM6pjl5iHOw421k7QAa3RJw5Z
 M6nDRGW3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150098



On 9/16/2025 6:14 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 16, 2025 at 09:42:26AM +0800, Yingying Tang wrote:
>>
>>
>> On 9/12/2025 5:00 PM, Stephan Gerhold wrote:
>>> On Wed, Sep 10, 2025 at 05:02:12PM +0800, Yijie Yang wrote:
>>>> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
>>>> the Hamoa IoT SoM and a carrier board. Together, they form a complete
>>>> embedded system capable of booting to UART.
>>>>
>>>> Make the following peripherals on the carrier board enabled:
>>>> - UART
>>>> - On-board regulators
>>>> - USB Type-C mux
>>>> - Pinctrl
>>>> - Embedded USB (EUSB) repeaters
>>>> - NVMe
>>>> - pmic-glink
>>>> - USB DisplayPorts
>>>> - Bluetooth
>>>> - WLAN
>>>> - Audio
>>>>
>>>> Written in collaboration with Quill Qi (Audio) <le.qi@oss.qualcomm.com>,
>>>> Jie Zhang (Graphics) <quic_jiezh@quicinc.com>, Shuai Zhang (Bluetooth)
>>>> <quic_shuaz@quicinc.com>, Yingying Tang (WLAN) <quic_yintang@quicinc.com>,
>>>> and Yongxing Mou (USB DisplayPorts) <quic_yongmou@quicinc.com>.
>>>
>>> This looks like you should have Co-developed-by: tags together with
>>> their Signed-off-by: tags.
>>>
>>>>
>>>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/Makefile          |    1 +
>>>>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 1221 ++++++++++++++++++++++++++++
>>>>  2 files changed, 1222 insertions(+)
>>>>
>>>> +
>>>> +	vreg_wcn_3p3: regulator-wcn-3p3 {
>>>> +		compatible = "regulator-fixed";
>>>> +
>>>> +		regulator-name = "VREG_WCN_3P3";
>>>> +		regulator-min-microvolt = <3300000>;
>>>> +		regulator-max-microvolt = <3300000>;
>>>> +
>>>> +		gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
>>>> +		enable-active-high;
>>>> +
>>>> +		pinctrl-0 = <&wcn_sw_en>;
>>>> +		pinctrl-names = "default";
>>>> +
>>>
>>> regulator-boot-on?
>>
>> It shoulde be regulator-always-on
> 
> Why it's not boot-on and always-on?
> 
As I described before, connectivity power is voted by UEFI in boot phase.So PCIe link between connetivity card and RC4 is established once RC4 is on.
If we set this node as "regulator-boot-on", connectivity power will be down first then up. That cause PCIe link down and the link can't be trained again unless you reboot board.
So we can't set it to "regulator-boot-on"
>>>
>>>> +		regulator-always-on;
>>>> +	};
>>>> +
>>
> 


