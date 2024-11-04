Return-Path: <linux-arm-msm+bounces-36873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2E09BABD6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 05:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C52871C20966
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 04:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1685415FD16;
	Mon,  4 Nov 2024 04:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RMmwFLoV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAEF290F;
	Mon,  4 Nov 2024 04:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730694685; cv=none; b=G8q+k83gSpuAIJYjzpyPWhsMcTcy1025HmeQdUPa2MPUlN7XuB/rIc6j7td/6U4mi9AuF1B4sFiGo39UhR5EFJVtHvIQEEidgpV/ARm/ZpRf+BE3dpup1vkTV+sb6BKzpEHQinZWzJpwpoN6sOXZ3nQtO1z1R1pIWUH0UbzfG00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730694685; c=relaxed/simple;
	bh=vbigO1/0tmqLCH75w1yvEiA/jHXipTAk41obguiX2g8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BXT9x1YdtyLRTx7szwSEwGRkpOhPuQv3I2ObAUJ0oILiXz0kM1TwdXBdBhjjAVARlt4hv+Eb5mm4ks9kBkBRI8cIa/55qZiZrbkoCAmELLoT/By561JIKN8uBq3dkFvnsDZapIU/ampSX44L1IU4zrSOcYbysMFQTKdbpthUdjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RMmwFLoV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A40E0d7025188;
	Mon, 4 Nov 2024 04:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+w9BUqc9qTS5lo096IW4hBuKmzwChCj8VIAFc+Sqiv0=; b=RMmwFLoVTDAHi7CC
	3agB+E+g4fy27QsspWVAL7xMDc9ksKhleSE8GBtyu+7wvL4RenuzrwMibadlU5Di
	fC5Qrpz9V8ctHkT1QT4l0pGuFNY1RRdwRHVRyNezcUkjiosH8medTgirqXLf31wa
	65H9BQXWIGOboMtmgKOgFn33/1g8KdZqvz0HQT7mxpJ80iV2EH3I6uumQdhI1XVN
	NiyOuZK3cmSu5/L2sAFvcmv7Htqvh85QY2ho26kHScexybBZ24QMHaUtVOt1R8SM
	QtK5tJhgRrdjBsIrWch0D/iN5SxniyxRuwmJEZurwF6BXsqpzM7EGO3gBEds5V9r
	sBgw9Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd2r30nv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 04:31:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A44V9Dh016816
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Nov 2024 04:31:09 GMT
Received: from [10.216.1.91] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 3 Nov 2024
 20:31:06 -0800
Message-ID: <945f3eae-0a68-4738-af07-74e228039508@quicinc.com>
Date: Mon, 4 Nov 2024 10:01:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] arm64: dts: qcom: sc8280xp-blackrock: dt
 definition for WDK2023
To: <jens.glathe@oldschoolsolutions.biz>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Merck Hung <merckhung@gmail.com>,
        Kalle Valo
	<kvalo@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
References: <20241101-jg-blackrock-for-upstream-v7-0-8295e9f545d9@oldschoolsolutions.biz>
 <20241101-jg-blackrock-for-upstream-v7-3-8295e9f545d9@oldschoolsolutions.biz>
Content-Language: en-US
From: Krishna Kurapati <quic_kriskura@quicinc.com>
In-Reply-To: <20241101-jg-blackrock-for-upstream-v7-3-8295e9f545d9@oldschoolsolutions.biz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ug9g8cPQUpCHaczIpV-yad96zKYoMhPb
X-Proofpoint-GUID: Ug9g8cPQUpCHaczIpV-yad96zKYoMhPb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040039



On 11/1/2024 11:56 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Device tree for the Microsoft Windows Dev Kit 2023. This work
> is based on the initial work of Merck Hung <merckhung@gmail.com>.
> 
> Original work: https://github.com/merckhung/linux_ms_dev_kit/blob/ms-dev-kit-2023-v6.3.0/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-dev-kit-2023.dts
> 
> The Windows Dev Kit 2023 is a nice little desktop based on sc8280xp.
> Link: https://learn.microsoft.com/en-us/windows/arm/dev-kit/
> 
> Supported features:
> - USB type-c and type-a ports
> - minidp connector
> - built-in r8152 Ethernet adapter
> - PCIe devices
> - nvme
> - ath11k WiFi (WCN6855)
> - WCN6855 Bluetooth
> - A690 GPU
> - ADSP and CDSP
> - GPIO keys
> - Audio definition (works via USB)
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

[...]

> +&usb_2 {
> +	pinctrl-0 = <&usb2_en_state>;
> +	pinctrl-names = "default";
> +

On the blackrock platform, for this controller, are there all 4 ports 
given out for use or only one ?

Because if all 4 are there, you might need to give all 4 pinctrls (one 
for each TS3USB221A mux select) here for usb_2 node. If only one port is 
given out for use on the platform, then only one phy (of the 4 activated 
below) needs to be marked as active.

In my case, in [1] on the ADP platform, I marked them as always on for 
all gpios on multiport controller since driver had no support added yet.

[1]: 
https://lore.kernel.org/all/20240707085624.3411961-1-quic_kriskura@quicinc.com/

> +	status = "okay";
> +};
> +
> +&usb_2_hsphy0 {
> +	vdda-pll-supply = <&vreg_l1b>;
> +	vdda18-supply = <&vreg_l1c>;
> +	vdda33-supply = <&vreg_l7d>;
> +
> +	status = "okay";
> +};
> +
> +&usb_2_hsphy1 {
> +	vdda-pll-supply = <&vreg_l8d>;
> +	vdda18-supply = <&vreg_l1c>;
> +	vdda33-supply = <&vreg_l7d>;
> +
> +	status = "okay";
> +};
> +
> +&usb_2_hsphy2 {
> +	vdda-pll-supply = <&vreg_l10d>;
> +	vdda18-supply = <&vreg_l8c>;
> +	vdda33-supply = <&vreg_l2d>;
> +
> +	status = "okay";
> +};
> +
> +&usb_2_hsphy3 {
> +	vdda-pll-supply = <&vreg_l10d>;
> +	vdda18-supply = <&vreg_l8c>;
> +	vdda33-supply = <&vreg_l2d>;
> +
> +	status = "okay";
> +};
> +
> +&usb_2_qmpphy0 {
> +	vdda-phy-supply = <&vreg_l1b>;
> +	vdda-pll-supply = <&vreg_l4d>;
> +
> +	status = "okay";
> +};
> +
> +&usb_2_qmpphy1 {
> +	vdda-phy-supply = <&vreg_l8d>;
> +	vdda-pll-supply = <&vreg_l4d>;
> +
> +	status = "okay";
> +};
> +

[...]

> +	usb2_en_state: usb2-en-state {
> +		/* TS3USB221A USB2.0 mux select */
> +		pins = "gpio24";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;
> +	};
> +

Regards,
Krishna,

