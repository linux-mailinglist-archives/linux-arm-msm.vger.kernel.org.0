Return-Path: <linux-arm-msm+bounces-66977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3496DB14B77
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 11:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17F37188A262
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 09:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37E028850B;
	Tue, 29 Jul 2025 09:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Cale5vJu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA7B23373B;
	Tue, 29 Jul 2025 09:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753781954; cv=none; b=KV2EK9772uxzZS91RaVAZvJSPdrctlZkzKcrSbI84goLEDiWIE8mt0zkRCo/8NWnSgQbU96Gfi/mtGIaGXLLKP7Cu1+TKUqCUqtCkMXJ5kv2idAOtYnpvPSptQGWl0tQTxC+i7dx30Mgqzg3slOFJp/4dGgSDNIo6c+N7iscHcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753781954; c=relaxed/simple;
	bh=qiDpg8+oxVUyJhGaPjP2TdQxkpTkyr0Ra8aroFa9q8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FiaiAkUz0Q/F59L0vtlwOaFobTcX4VmhNpetKV23D3APGwFPA8g4EH2ELhvGuyWEL4WdbgKt3X3a8jU35cO1VV9vMRqna5LHITO05qRObgKiV05W6RmWX71b3U7DMKck6S4m9LLaMVHTG/TbKgy7g51c65PpgX93U84REjoj1M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Cale5vJu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T03C40019418;
	Tue, 29 Jul 2025 09:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xs8F+swM+IvFUKegxHJ1I3AShbpB7Wl3shKKlibdxes=; b=Cale5vJumnO9+mzm
	/Np2R5Q+gB0TTDnGjh0vs8wBJwyhCXynHfi0si80R86+SvSg/z43Hjy8HjrJKL+R
	lBafGBxctvrRY3GF9b4C72L60PsEK8xtmghQ7yLAayLPtpDHYKa4kgXB2dxjNDF1
	3fqg9SQXOw8kt+xQKzFplO40mZiqrDBrNiRTAR4hvFETThyBLThUzx7TPU6sNaXe
	qe2KC8UxYWBba6mFUI77Dt/i5oDefrQJNUX+XYoSfUXM/8JbtfNArXJ0c/H9aJ2F
	yZIxyNpmOZJvWaHeYtz1JFRnO2sz25vNNmcp/0iaIJW6S0tQz39aqF6UED5ApiNV
	QEsM9g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2fh14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Jul 2025 09:39:09 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56T9d8VR026385
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Jul 2025 09:39:08 GMT
Received: from [10.231.195.155] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 29 Jul
 2025 02:39:05 -0700
Message-ID: <c0b804e3-16ee-4e81-9aa8-4b6051b5af03@quicinc.com>
Date: Tue, 29 Jul 2025 17:39:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Yijie Yang
	<yijie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Shuai Zhang <shuaz@qti.qualcomm.com>,
        <quic_miaoqing@quicinc.com>, <quic_zhichen@quicinc.com>
References: <20250729-hamoa_initial-v3-0-806e092789dc@oss.qualcomm.com>
 <20250729-hamoa_initial-v3-4-806e092789dc@oss.qualcomm.com>
 <a6456802-3d19-4da5-a995-c8f00553c7fa@oss.qualcomm.com>
 <d14b2a0c-8304-497f-a662-5b93dbaaa1ed@oss.qualcomm.com>
From: Yingying Tang <quic_yintang@quicinc.com>
In-Reply-To: <d14b2a0c-8304-497f-a662-5b93dbaaa1ed@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 28bjND0JqCliO6bpHeGX9Tf2UaegbSXP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA3NSBTYWx0ZWRfXwoqglyeIiM9W
 fSIpnMIhB4UDMkjcL+TttddROmSQ75RyyxDuB21ulIkf81pVAqulxFTj3CtPXXy3VkFtqv0J3zC
 2fwTAS0/avzQmvIzCD1hRiWThSeUnI/4oYoK/vMWWFegl344RK+6DFpn1HnTBPZkj6I7KJdUZnw
 efwdGKBaOOrjRtC+HH+FbaSrouthBpE433gM9Z+rSvAdwA6Dmtp4YRe1oawDf5X3nryD7MW1S/5
 2dN0hCfeCHcguJs0XvjB3xiUPe3WHEM3bA9Po/hHr5xOb5MPvT7sfA6elSMh3FkcoDdqs0/tie2
 VfwriyhuyUGVzNvrF/fw+RlaYW7SF7lKXFBYzLbbqx2m1n9Q2ri1p/IXqwCn8cNfOimGQ7XQPwm
 v3bIEKy1Tk17DuqtqJB6yErnPGc2hHRo/Dxl9nmgj2yt/RzL5pR2InS9Q18zqVoRufYqADkX
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=688896bd cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8
 a=1utyrP9q1XeMewFY-dYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 28bjND0JqCliO6bpHeGX9Tf2UaegbSXP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_02,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=993 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290075



On 7/29/2025 4:37 PM, Konrad Dybcio wrote:
> On 7/29/25 7:51 AM, Yijie Yang wrote:
>>
>>
>> On 2025-07-29 09:32, Yijie Yang wrote:
>>> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
>>> the Hamoa IoT SoM and a carrier board. Together, they form a complete
>>> embedded system capable of booting to UART.
>>>
>>> This change enables and overlays the following peripherals on the carrier
>>> board:
>>> - UART
>>> - On-board regulators
>>> - USB Type-C mux
>>> - Pinctrl
>>> - Embedded USB (EUSB) repeaters
>>> - NVMe
>>> - pmic-glink
>>> - USB DisplayPorts
>>>
>>> Written with contributions from Shuai Zhang (added Bluetooth) and Yongxing
>>> Mou (added USB DisplayPorts).
>>>
>>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>> ---
> 
> [...]>> +    vreg_wcn_3p3: regulator-wcn-3p3 {
>>> +        compatible = "regulator-fixed";
>>> +
>>> +        regulator-name = "VREG_WCN_3P3";
>>> +        regulator-min-microvolt = <3300000>;
>>> +        regulator-max-microvolt = <3300000>;
>>> +
>>> +        gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
>>> +        enable-active-high;
>>> +
>>> +        pinctrl-0 = <&wcn_sw_en>;
>>> +        pinctrl-names = "default";
>>> +
>>> +        regulator-boot-on;
>>
>> It should be set to 'regulator-always-on'.
> 
> Are you sure? Turning off Wi-Fi sounds like a valid usecase..

Hi Konard, It is m.2 interface on Hamoa. The PCIe power of m.2 should be always on.

Even on QCOM's B2B interface, we are unable to dynamically control the power of PCIe devices on upstream kernel.
The PCIe specification does not support dynamic power control between the PCIe device and the RC.
PCIe power should be always on here.
> 
> Konrad


