Return-Path: <linux-arm-msm+bounces-70618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13427B33D50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 12:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 051B81615EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 10:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F9E2DCF50;
	Mon, 25 Aug 2025 10:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HayQzHCC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C00B2DCF4D;
	Mon, 25 Aug 2025 10:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756119370; cv=none; b=JqPnnoTemaProlpFzPHGcu2T46UjKulO8DM836gjEYH68vvkCYGo1Pw5s9KxiM2yeKt7lK332xxrvhE1rDBKZxdJ5DVC7CBsaFMQpQo49OD7G1E0oW4fYGT0MGSsH6wYqDJGlmWocIUw2GlrlgNBDTO8FwLJy3BWeXwfTliWr9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756119370; c=relaxed/simple;
	bh=lCIPyKubhXd22BAJCDhhrNFDJqPozw/RhdkNIDG1w/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gyHDQuRuMEO39Q4heC0X0rG1YEbAcoAhnY6YkUzNTjDl6CX/5mSsL8TSbBrpJqOEuD3vW/OkWot5DUujfiCM5GgAcPkPsdshWUpIKyS81GE3QtGfqOw5a9ckQICyflPjrfOaEChy2BoWSvJRzIlSYH032IvLYWOFXShCfIXXZOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HayQzHCC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8eQ1U003654;
	Mon, 25 Aug 2025 10:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F0zL9NBKTfXf/0iUKK2GWcBbGWQDTjOPB+0bk1979jo=; b=HayQzHCCQBAcejEW
	bx7FaobvGkoN9R1SaOC9Iv/3e97FS7ko7M/dJf/zs90gVmzDXwE2wXhZKkhAToSJ
	fD9ySjh0+v1dCqTZX7I+t9sfMwjy/gG92ZwdE0A4e+WAFiVULLdPAUL/MalMn3va
	5wr2Lfm6ZPToDyJrghN6U3t+HSs0/SH3pVBB0mVhzMlVhxdPZGFmW2G+4pBOibvx
	SIcZ/kPfMCI5tQtpVbZSJ4Uq4DVOa8EcRW0x9/Ox3aDk39UqAR23uJooXpFEaieo
	ITUsm3hZkeHEukKH9NYE+KU80t5RmOs/x0qqFeiX5cwvBGtR9GiyPOOJnoTOiS8r
	roeiDQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5cqgf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 10:56:03 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57PAu23w006203
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 10:56:02 GMT
Received: from [10.253.35.4] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Mon, 25 Aug
 2025 03:55:59 -0700
Message-ID: <79cc3480-6383-4683-81b5-9dc4303398ff@quicinc.com>
Date: Mon, 25 Aug 2025 18:55:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Yijie Yang
	<yijie.yang@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Quill Qi <le.qi@oss.qualcomm.com>, Jie Zhang
	<quic_jiezh@quicinc.com>,
        Shuai Zhang <quic_shuaz@quicinc.com>,
        Yongxing Mou
	<quic_yongmou@quicinc.com>, <quic_zhichen@quicinc.com>,
        Yingying Tang
	<yintang@qti.qualcomm.com>
References: <20250821-hamoa_initial-v6-0-72e4e01a55d0@oss.qualcomm.com>
 <20250821-hamoa_initial-v6-3-72e4e01a55d0@oss.qualcomm.com>
 <jj3mvad27kdpfxo4p2c3jfpjq2icao6mltpx4uu3sretqgkfap@vpqgfwzl3sjs>
 <33ac5fef-f855-46f3-acd3-daa8fc34d918@oss.qualcomm.com>
 <qlyqobhy2wjwpp437qwyk3zs6gqp47sremvdud674ygjbeziag@motnuwsalpvj>
From: Yingying Tang <quic_yintang@quicinc.com>
In-Reply-To: <qlyqobhy2wjwpp437qwyk3zs6gqp47sremvdud674ygjbeziag@motnuwsalpvj>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXzAHbMP/AmlKp
 FEdH4E9kYKsO9DpEfQu2nlpBihQw++3TxVySG5avR7J2IDiJgr1lPLInkmsqFnfjpXGIcj7Jb1T
 1y3991kccBk2Ib9htmQTWbesDel3UAxo/PnELN1a7syN/oQy/R1ReAQqOwg7tFGZGDQE7K5lnL+
 KIQZooBWeRze85r8NN1iPxjJK65KvWsDDtTss62CieRnxtnal5Y6agcOgjN/6cOQfyW7ju+YAMC
 DoA2T6WLbPDCotoqUFe8BbqjxrFmQ9VspSTR7BBHkuZo1JoBT77B3XwbgyvUOawnDIX4LYgspqM
 sF8AI2ALXi22M3rkq9u+I36WBxLaSpNUVpNmQ4Yo1+bMZOoKwQRvDcTBjc/aKc/YeSASY8IR6M4
 RjjBpVAM
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68ac4143 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=4w_1HSF_LytnapU_WVcA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: vHk3dDCg5mb5q2usO2lQExwgh_Uev_6H
X-Proofpoint-ORIG-GUID: vHk3dDCg5mb5q2usO2lQExwgh_Uev_6H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033



On 8/25/2025 5:24 PM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 10:47:22AM +0800, Yijie Yang wrote:
>>
>>
>> On 2025-08-22 19:56, Dmitry Baryshkov wrote:
>>> On Thu, Aug 21, 2025 at 04:20:24PM +0800, Yijie Yang wrote:
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
>>>
>>> No WiFi?
>> It's in patch 2/3.>
> 
> No, it's not. It has PCIe4, but not a WiFi (which makes sense since WiFI
> is not present on the SoM).
> 
For Hamoa WiFi chip is powerd by UEFI not kernel, so WiFi can work without DTS node.

Only for usercase specific firmware requirement we need to add WiFi node.
For this case we need to wait both HSP and HMT's usercase specific firmwares are available on UPSTREAM, otherwise loading fw will fail.

So for now, we can skip adding the WiFi node. Once the use-case-specific firmware is ready in upstream, I can add the WiFi node separately for both HSP and HMT.
>>>>
>>>> Co-developed-by: Quill Qi <le.qi@oss.qualcomm.com> # Audio
>>>> Signed-off-by: Quill Qi <le.qi@oss.qualcomm.com>
>>>> Co-developed-by: Jie Zhang <quic_jiezh@quicinc.com> # Graphic
>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>> Co-developed-by: Shuai Zhang <quic_shuaz@quicinc.com> # Bluetooth
>>>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>>>> Co-developed-by: Yongxing Mou <quic_yongmou@quicinc.com> # USB DisplayPorts
>>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>>>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/Makefile          |    1 +
>>>>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 1247 ++++++++++++++++++++++++++++
>>>>   2 files changed, 1248 insertions(+)
>>>>
> 


