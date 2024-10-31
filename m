Return-Path: <linux-arm-msm+bounces-36595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 604279B82E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 19:54:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0D0B1F2295B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 18:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266B81C9EA4;
	Thu, 31 Oct 2024 18:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ltogtxm+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A0E13A865;
	Thu, 31 Oct 2024 18:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730400871; cv=none; b=FJQOlXG7Ik/fiCwL51e9DAGJTT//9xHMlG1I1EIGRg40oGQU1iw5nqk2NWsIAUJTIy7vcKIs5vnxYo/LShyQ/7xaJQS1qEiBEiNGll/EN/ouIPlibobh0YQY90BxnmBfdMLt7WlSDCQQ37a+mNd1Hb7XzLiulEjYnok4Ya1laPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730400871; c=relaxed/simple;
	bh=0AN2cEme6KN+MD6/2CJs5BoWooLWL+Ww1sHtt035mkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SeSGFmMQMv+ywIwzgfA6yiDZ3wfQwlhn9ORx/BrOfpccxI4qBrgH89+fsvhEe1M5+kwREmtekqrnF+AA9GEUjgemACyBL8IpPxu3Gxm6X6SkVs6uOZSnRnWGbsJsVfUbiNZ5UJIMITNluNrcfxJEJ1xlkL0tZ2CFcwzon6X+WO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ltogtxm+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49V9rSBx009576;
	Thu, 31 Oct 2024 18:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zR2oPsDq+v2hp6B2K+B1H3EJciKvEeAHkR4Lv7MS4eQ=; b=ltogtxm+CKy3YvlC
	uadNAigIuRlzQ77fw/6kG4eKvKivQJW6gbLA/UlfmOc9NZHX9z84dmXIfrF0Funt
	rhdL05fM+xzmhLUdrhqXqEwiCVCB7VvOR0laPiiMyLOqMPjcTaFaU72HNc7tJ3hM
	M+Gz5aMk7wIqNs2cBA1Pe7RYTsM4vYU5SuL8UlATs8fS9yHPLXFhvqT4uiUe7XDQ
	3bKco0ljno3bh7JoW7FKkldFYU9G5o1biCOkt5X4Ll0KDbd9X3WRspeY3wiixsmm
	jJd+Sezg3LK413gfezoSCQ6RjnWXZddXOJ/yBkyR6ZCSEx/ERf/6ZRZY/x9G0Nkj
	epytBg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kjm1d01r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 18:54:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49VIsDTk025895
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 18:54:13 GMT
Received: from [10.216.19.89] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 31 Oct
 2024 11:54:10 -0700
Message-ID: <5a9e97ad-0f84-4e0c-85e6-5ed0a4d20568@quicinc.com>
Date: Fri, 1 Nov 2024 00:24:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sc8280xp-blackrock: dt
 definition for WDK2023
To: <jens.glathe@oldschoolsolutions.biz>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Kalle Valo
	<kvalo@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        Merck Hung <merckhung@gmail.com>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20241030-jg-blackrock-for-upstream-v6-0-7cd7f7d8d97c@oldschoolsolutions.biz>
 <20241030-jg-blackrock-for-upstream-v6-3-7cd7f7d8d97c@oldschoolsolutions.biz>
Content-Language: en-US
From: Krishna Kurapati <quic_kriskura@quicinc.com>
In-Reply-To: <20241030-jg-blackrock-for-upstream-v6-3-7cd7f7d8d97c@oldschoolsolutions.biz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TBHZUxU695kobpyZQOeTCFl3G-q22yjs
X-Proofpoint-ORIG-GUID: TBHZUxU695kobpyZQOeTCFl3G-q22yjs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 clxscore=1011
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410310143



On 10/30/2024 4:32 PM, Jens Glathe via B4 Relay wrote:
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
> +	status = "okay";
> +};
> +
> +&usb_2_dwc3 {
> +	dr_mode = "host";
> +	phy-names = "usb2-port0", "usb3-port0";
> +	phys = <&usb_2_hsphy0>, <&usb_2_qmpphy0>;
> +
> +	status = "okay";
> +};

 From what I remember, the phy names for multiport must be "usb2-X"  or 
"usb3-X". The above notation might compile but If I am not wrong, the 
phys won't be active. How was USB tested in this case ?

Moreover just marking status as "okay" for usb_2 must work like done in 
[1] and [2] and there is no need for explicitly marking dr_mode as host 
again and refactoring the phy-names.

[1]: 
https://lore.kernel.org/all/20240707085624.3411961-1-quic_kriskura@quicinc.com/
[2]: 
https://patchwork.kernel.org/project/linux-arm-msm/patch/20240501065641.965-1-johan+linaro@kernel.org/

Please fix this up.

Regards,
Krishna,

