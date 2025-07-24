Return-Path: <linux-arm-msm+bounces-66426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 655E6B10216
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 09:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CAEE3A7AEF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 07:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7183824DD0C;
	Thu, 24 Jul 2025 07:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="na51dqax"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E86B2A1BB;
	Thu, 24 Jul 2025 07:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753342867; cv=none; b=OO/CBeveUZVgWHYuK7vqRbb48xpoaYJSlaN/1P+UdxmS09A9yPz3hHdSf3abKB6OhmTyVKi0hnZJUYPL5ffwU2CU+NDb2M/I3gaq+EPUYDcck/THqDpZv8K8O7ICVBZecOo9mYPv/bi3hUlu35j3pSBpliBOmil6dGGNB54h7BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753342867; c=relaxed/simple;
	bh=o3VrKMzKat7v0pDU7VIO6g56NwTueA3Yfn1CRRUWWGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=atuY2lrvPEZdUr74Er0qeeTa9iZEtlEC6JQ2R9ReZWa1smaQUglHDo8iy4MD/3jAGZiD+XNTVRjozAHC+tTsjhr9fi3pnIim4pwjCwyQAdb7KU6iBOQs1q1dYhOjlqQWvG1xtULXeS2tSCw19/uH2clMYZ+586IzuhnmZXQmQcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=na51dqax; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NMXNvd001453;
	Thu, 24 Jul 2025 07:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZceUf3hvGHbpx2o1VY0t/FpMt/Mhu/kv9tj/tj2oaLk=; b=na51dqax/s+Go3Bg
	AkWHr/faV+Ak3IjkyLxdvwXFgj1hjoCzZ0lIrQs3j+mEh27VpFfIhnQok9ItFtro
	MfBYwrGygPfQTS+jXB7cFe1bo5WDpQC1ET64wtaIOvzZUvPqRgCdHiYMeU9dPKBD
	Kvuq7gRKTiIX6GBTAXBnZr1Rkc0JitApmt2M1wUs0TDUSu6zXlIhzuWqCOxdAP29
	g2GAu0oj7yzuXf8HFIYplC929rcZo58g2N2jHUQIikAFWiGFEXp+sIvhPCMRrwgi
	KtD/sF4vgeLZ9/4E4c/ILawaRa6xV7wJ58/kREwX4ZF7FcZFyo1tzwewjO+6f2TK
	m8fj9w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1ueedg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 07:40:58 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56O7ewuq031584
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 07:40:58 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 24 Jul
 2025 00:40:55 -0700
Message-ID: <c7041754-7be9-44f5-89a4-03bb21e2d342@quicinc.com>
Date: Thu, 24 Jul 2025 15:40:52 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable display support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250723-x1e-evk-dp-v1-1-be76ce53b9b8@quicinc.com>
 <6wwcxwgcf4wm4ekb3d4ukkyyqsseaawo6l66umzxim4kcilynm@fc6mwj6ymnes>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <6wwcxwgcf4wm4ekb3d4ukkyyqsseaawo6l66umzxim4kcilynm@fc6mwj6ymnes>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=6881e38a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=6oUO4QyBuBcHVGqS9G8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA1MyBTYWx0ZWRfX6IFggY9PReRh
 5/E+eV8SXPH3Ibd5abz6zKscWga4cyldQPGUaOAEXt0A2ylIzI6rR5sj0yLg6kcfn3ZX6VSg+4H
 ZTxkwtCK+rC6crWDGLInWWPcaqKMZW4qxVKSFLd6mq9b7SxmIts9yxHw8OOHRoXHLZWtdY6afHd
 5iKAi3FsjNccEH5s0SqYTsQyxXYmnS8kTlq7pp2Nf9Ozyn4Ya2BsoeNlmQCMXRogqgU8v9Ld2ml
 kGue0uBc5QLT6q1V+DeplAXRaj6RX00p1Tq/QkA3r37y8/zbNQWzOWctHuIMH54OMccshrS7SQF
 vQAHvnXvxr9UzPUJC3XORJEeW2yM+ppZcN3U01XWdx/XCT3HlNMM52pVHZHpca4dzsCzxxdv/kk
 apeLHOy3AdcJCrH4TWew8Ai3/UnHZwWhDAybCo+VRpREBMMpmstyGK7Xi1u+/F4Yj3mHZXUi
X-Proofpoint-ORIG-GUID: oTlahIG6SJvwbjLspVP3mzMI_bMIvc-O
X-Proofpoint-GUID: oTlahIG6SJvwbjLspVP3mzMI_bMIvc-O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=816 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240053



On 2025/7/23 19:21, Dmitry Baryshkov wrote:
> On Wed, Jul 23, 2025 at 02:14:55PM +0800, Yongxing Mou wrote:
>> Enable DisplayPort support on all three USB-C ports of the
>> hamoa-iot-evk platform.
>>
>> Unlike most X1E-based boards, this platform uses FSUSB42 USB
>> switches for the USB0 Type-C port, while USB1 and USB2 rely on
>> Parade PS8830 retimers for Alt Mode switching.
>>
>> Support for the PS8830 retimers was already included in the
>> initial DTS, so this change adds support for the FSUSB42 switches.
>>
>> Due to limitations in the USB/DP combo PHY driver, DisplayPort
>> functionality is limited to 2 lanes instead of the maximum 4,
>> consistent with other X1E-based platforms.
>>
>> The platform also supports embedded DisplayPort (eDP) by default.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>> This change made top of initial DTS:
>> https://lore.kernel.org/all/20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com/
>> ---
>>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 156 +++++++++++++++++++++++++++++
>>   1 file changed, 156 insertions(+)
>> +
>> +	ports {
>> +		port@1 {
>> +			reg = <1>;
>> +			mdss_dp3_out: endpoint {
> 
> Add empty endpoint to x1e80100.dtsi, then patch it here like you do for
> all other DP endpoints.
> 
Hi So i need to add mdss_dp3_out: endpoint {} in x1e80100.dtsi and 
+&mdss_dp3_out {
+       data-lanes = <0 1 2 3>;
...
in board dts..  is this understanding correct?

i just wondering that here can we just follow other x1e80100-based dts?
others 8 x1e80100-based board dts all introduce edp-panel in this way..
>> +				data-lanes = <0 1 2 3>;
>> +				link-frequencies = /bits/ 64 <1620000000 2700000000
>> +							      5400000000 8100000000>;
>> +
>> +				remote-endpoint = <&edp_panel_in>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
> 


