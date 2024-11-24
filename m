Return-Path: <linux-arm-msm+bounces-38978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 208CF9D758E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 16:55:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9B6F167E90
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 15:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427DE186294;
	Sun, 24 Nov 2024 15:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U2XLAOxp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE602500AF;
	Sun, 24 Nov 2024 15:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732463701; cv=none; b=TJMytnjTHMWMbSovXBgPy4MD1I89ogB4eKGJ75iaSE/WxCZU93Wpbb4H7mr05Z/hY2uJShcd3FdFT311ztj9RNYFCbJRtVmjQcIZgwXqq0GpiNuRd/dt6eq8022pfEY/3+90bfosyuHH8+ffGy4HMpjjTrDgJjrTWYG4ib87IDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732463701; c=relaxed/simple;
	bh=hBB43uLUvtVLudvJZphIjsE/oW7XwZubOuwpW2wKCp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TTQzanqJlvE5GNAwB1E/Bf8KBAmgKxBlmuXGgq9JSuKvUCtywtbUn2USE1omkGVTMxIBViTxZjZEb2EGYMT8eav/ERy9NsYF85zf20dg78dUl/QkRG4KXsBsSI8xN6qDrCcKbA+6xA1H3HW60WC7x3OUmP16NU1he5tUO81AAVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U2XLAOxp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AODXEuR026475;
	Sun, 24 Nov 2024 15:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2LMsnLvwZd9AdnctdkEDNz7vNj9k49C4JvFhUO0R80I=; b=U2XLAOxpgKNQTecY
	PPwGgIhE0oGWPC/dL/hf1Sca2wSqQrn/yLf+ShpG2LkyvTE+dxLhdvEvt+9RNTEj
	/npaoGfs8jn+tvN727SXfJaPYVf22Wnh3qLpSVOs0I7Jp5C+/G/3QnLnkbRdIDwp
	MOU26/VwWhO4uteAZiPbOWF0QfaQSg5h2QVwZUmBgaMtVuJr39ZJxuaurOrQuDnw
	c00pTFb41lnDkjeR/bYDv/Kso7Xj4Us4yzznWM0CsYobj9ZSkbDyOGRg7wC8exRg
	12gll+oakqB5xq6wvu2gbPyRNh0iqQujmX2g4BZzNAPm24ubBHukZay+V+rVyqhd
	PD4IoA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 433626ah2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 24 Nov 2024 15:54:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AOFsXSM025493
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 24 Nov 2024 15:54:33 GMT
Received: from [10.216.28.62] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 24 Nov
 2024 07:54:26 -0800
Message-ID: <0b4db909-6029-40e6-8e1d-a7ecdc731b25@quicinc.com>
Date: Sun, 24 Nov 2024 21:24:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook
 X Laptop 14
To: <jens.glathe@oldschoolsolutions.biz>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        "Douglas
 Anderson" <dianders@chromium.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Kalle Valo
	<kvalo@kernel.org>, "David Airlie" <airlied@gmail.com>,
        Conor Dooley
	<conor+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann
	<tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
References: <20241124-hp-omnibook-x14-v1-0-e4262f0254fa@oldschoolsolutions.biz>
 <20241124-hp-omnibook-x14-v1-4-e4262f0254fa@oldschoolsolutions.biz>
Content-Language: en-US
From: Krishna Kurapati <quic_kriskura@quicinc.com>
In-Reply-To: <20241124-hp-omnibook-x14-v1-4-e4262f0254fa@oldschoolsolutions.biz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lxCHzPHjaX0cEGapYD-t7fbp5ETk8hmH
X-Proofpoint-ORIG-GUID: lxCHzPHjaX0cEGapYD-t7fbp5ETk8hmH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1011 phishscore=0 spamscore=0 adultscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=898
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411240138



On 11/24/2024 6:50 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Introduce device tree for the HP Omnibook X Laptop 14-fe0750ng
> (hp-omnibook-x14). It is a Laptop based on the Qualcomm Snapdragon
> X Elite SoC. There seem to be other SKUs, some with Wifi-7 (WCN7850)
> instead of Wifi-6E (WCN6855). This dt explicitly supports WCN6855,
> I haven't found a good way yet to describe both.
> 
> PDF link: https://www8.hp.com/h20195/V2/GetPDF.aspx/c08989140
> 
> Supported features:
> 
> - Keyboard (no function keys though)
> - Display
> - PWM brightness control (works via brightnessctl)
> - Touchpad
> - Touchscreen
> - PCIe ports (pcie4, pcie6a)
> - USB type-c, type-a
> - WCN6855 Wifi-6E
> - WCN6855 Bluetooth
> - ADSP and CDSP
> - X1 GPU
> - GPIO Keys (Lid switch)
> - Audio definition (works via USB)
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

[...]

> +
> +&usb_mp {
> +	status = "okay";
> +};
> +
> +&usb_mp_dwc3 {
> +	phys = <&usb_mp_hsphy0>;
> +	phy-names = "usb2-0";
> +};
> +
> +&usb_mp_hsphy0 {
> +	vdd-supply = <&vreg_l2e_0p8>;
> +	vdda12-supply = <&vreg_l3e_1p2>;
> +
> +	phys = <&eusb3_repeater>;
> +
> +	status = "okay";
> +};
> +
> +&usb_mp_qmpphy0 {
> +	vdda-phy-supply = <&vreg_l3e_1p2>;
> +	vdda-pll-supply = <&vreg_l3c_0p8>;
> +
> +	status = "okay";
> +};
> 

The above QMP MP PHy is unused in the above DWC3 node. If the port is 
only HS capable, please don't enable the QMP node.

Regarfds,
Krishna,

