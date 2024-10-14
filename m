Return-Path: <linux-arm-msm+bounces-34235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A18FD99BE45
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 05:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3DD01C22222
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 03:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E8913B5B4;
	Mon, 14 Oct 2024 03:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QwNGk678"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F56084A2F;
	Mon, 14 Oct 2024 03:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728877082; cv=none; b=TS5ZnBv5subUjGF8lATuHjRjBSOPojqMl2GOMo8i7zAXzoBC+NvccKoDXxBRF4JY+oJ0dGXUSIUakNpE23YeqZDZNYFM4LsaYm002YY/J3PI14oMn2Ba6kWIOtLYUvQXspU6PEYQTreV/gfKuLhXp75xMfvBU3IfTgVuB4EcNPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728877082; c=relaxed/simple;
	bh=nakAHXjXuEiKAWt3kFmE/zY0COayKHgh6TPeb/YFlCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VHOghsN+/uaYvGrEUcXArMgIIx0w6j0EqjhPlFecmLmnBFvQuI5NX509yBwZSxklmUWEcoe3sm/VzAneJ/QA3x+MuMlnwA/1pMz4llqi11eugL2Z3RFtR1bgggBFrAxClO5/bIeF/i2tUBeX2fsyKvqQym2su2MLv0Rs4YN0tSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QwNGk678; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49DMmArm019902;
	Mon, 14 Oct 2024 03:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EVmGkDQFALOSNGVp4SJXLafB4/6GYX01frE3m+m7m/Q=; b=QwNGk678AsfInkjT
	M5pFmoxAo/Wg5ffQuexP3VDIozngdyauMw+ZgXBUfYRw6MYy/B64cmceBEHciRO6
	dT9zDW9FCK13Azj1oKKuiehqlli8U+vFVcjqbwFTr0kmFdO7MLZnP1pzw03AK+ul
	Gv9m4EyUo7MB3MvqgPXHFg5y/yPoypGK+3kVdVMSChebuIwGAoRgj9ZFxp2/amM4
	rR0c2LuohjoUggWzAJ61U31dF4eoKLmtD+LvHRXzltr0fBAg+ggLQs8G3+pOq4TS
	93HYk2zg6PsEhS6TXrNbsviblnTYtyz5FJqgFr3+NEPM6y0Kz1wMFzVr4YjX8LlI
	sCwKrQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427hg733t6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 03:37:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49E3bsut017621
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 03:37:54 GMT
Received: from [10.216.1.154] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 13 Oct
 2024 20:37:50 -0700
Message-ID: <050f8c5e-b16f-4df1-b1b1-06e60f838085@quicinc.com>
Date: Mon, 14 Oct 2024 09:07:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sc8280xp-blackrock: dt
 definition for WDK2023
To: <jens.glathe@oldschoolsolutions.biz>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob
 Herring <robh@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn
 Andersson <andersson@kernel.org>,
        <linux-kernel@vger.kernel.org>, Merck Hung
	<merckhung@gmail.com>
References: <20241013-jg-blackrock-for-upstream-v3-0-839d3483a8e7@oldschoolsolutions.biz>
 <20241013-jg-blackrock-for-upstream-v3-3-839d3483a8e7@oldschoolsolutions.biz>
Content-Language: en-US
From: Krishna Kurapati <quic_kriskura@quicinc.com>
In-Reply-To: <20241013-jg-blackrock-for-upstream-v3-3-839d3483a8e7@oldschoolsolutions.biz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Wxay2Ju9CBbpW7QvACHJZ8GNCTvF446m
X-Proofpoint-GUID: Wxay2Ju9CBbpW7QvACHJZ8GNCTvF446m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=709
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140025



On 10/13/2024 5:24 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Device tree for the Microsoft Windows Dev Kit 2023. This work
> is based on the initial work of Merck Hung <merckhung@gmail.com>.
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
> Signed-off-by: Merck Hung <merckhung@gmail.com>

[...]

> +
> +&usb_0 {
> +	status = "okay";
> +};
> +
> +&usb_0_dwc3 {
> +	dr_mode = "host";
> +};
> +
> +&usb_0_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_con0_hs>;
> +};
> +
> +&usb_0_hsphy {
> +	vdda-pll-supply = <&vreg_l9d>;
> +	vdda-phy-supply = <&vreg_l4d>;
> +	phy-supply = <&vreg_l4d>;
> +	vdda18-supply = <&vreg_l1c>;
> +	vdda33-supply = <&vreg_l7d>;
> +
> +	status = "okay";
> +};
> +
> +&usb_0_qmpphy {
> +	vdda-phy-supply = <&vreg_l4d>;
> +	phy-supply = <&vreg_l4d>;
> +	vdda-pll-supply = <&vreg_l9d>;
> +	pll-supply = <&vreg_l9d>;
> +
> +	orientation-switch;
> +
> +	status = "okay";
> +};
> +

I may be wrong but aren't only 3 supplies for femto and 2 supplies for 
qmp sufficient ? I see two extra supplies in each node.

Same for all the other usb phys as well.

Regards,
Krishna,

