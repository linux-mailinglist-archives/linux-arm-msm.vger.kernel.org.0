Return-Path: <linux-arm-msm+bounces-89553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6273ED39C74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 03:39:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B75F23012256
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 02:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE9C24A064;
	Mon, 19 Jan 2026 02:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O4pyKET9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O5EakCpH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578631FAC34
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 02:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768790355; cv=none; b=c1TgFmpYMmmfJlNiWxqGK0wTLuZ/7qH1id6BgCZNmkTXdoqYRWWOgAAWa0/cHePI/89qd3l7LbnsoZatI2Ok9Dk7NCnhgVrAfgdbvTpkG6DmoiccMU6JeRQid2WknO3+ymAIkL6EZl9xb5I9Q+l8uXV204V1uM244gWr0Swq4X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768790355; c=relaxed/simple;
	bh=Uhfj6+BJdQZvX6VC4XU4YWj0jJPjk1tiGNkzQJucHrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s0eCDlU60tPkgEI1PJvqNcngMZyZ+zsZH0c64I1lMPwXFBPLQNwtT8wVk3o2BcSQPKVFBEIJZT3S1gDjZQWMkWSUja2NLqHfF+LFlNrKTQQjvZ9aHlJl9+WtRTsCNcBEhRwrSr6vsCpZ6wwia0oyldDXHN8Z5VNRbyIzy5GJa24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O4pyKET9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O5EakCpH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60INk66E3737705
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 02:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	redrQf3LYk20tcuyPP/CDa3UkYljG6+JNYZVfB2dClA=; b=O4pyKET9qhsMeR2i
	sI9WH3EoPL8U6dLPJfDj68w3e25QvAfBM2z5i871whqgj2s+d4RmysN6tng82j5e
	5+7CTA4srOyRlFB0dwnWrjh7Pk1pv/aHsus2sM0ijkCB0qWhUH125FO/Bdo0kkky
	Y7tvYpYScgsS/ui3uZc0nMSGs2Up6V2vuzpt8utGcB7P0+YY4i8edY4y4f0MzKrb
	18I3I3FoGuPScNZSTE0dp91X7KSd18k5Gmy6c0ljfON/1VvQh3oXbRTmfBFMZKea
	0UhAMVhtNFGI9dCoJSMCP5dI+6aWGCmmMe5ybunb0aa/ELqpvmnZoIO0PlvoIkXe
	KH9qBQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2t73bb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 02:39:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0f47c0e60so82024875ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jan 2026 18:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768790352; x=1769395152; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=redrQf3LYk20tcuyPP/CDa3UkYljG6+JNYZVfB2dClA=;
        b=O5EakCpHxj+ArVO+LQvSBXYrSzcXfeYrCUPV8jWf2+GjRwE3tIUxKoqKGRgjIhf+Sk
         ffPdFb9T64zCMUs8QXb2rblYuKXpu5WPax2T4KNfLJK0lR8x3i4mpSi/jrkr7g8ToarD
         LWJKtGBrA9RCNqg6QIsg8RWEFGqvoKReyS4Vx+Ima+13UjRye3LMu625gv6cpGWzTHes
         3Par1flwiba0Y4pfH5OpmXFN2rQeZ6HpTRImE5FFYMtk7dj1t4tS6efS4IMXvF74xS3q
         NJBBZ89NDZ3HzY/GvxtQmN/aRegolT31+s1t7z4i6kZQRnULI3IRqSG3PHOQvi4/HTxA
         plqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768790352; x=1769395152;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=redrQf3LYk20tcuyPP/CDa3UkYljG6+JNYZVfB2dClA=;
        b=Dnx2DqvgTlXKg8s4/OT5lPViwK6ZlYukQ+Fw2EsgPdMpMuLN5rExpomtERIf9A/NGi
         gr8LCVWx5rU99MTbul8/vijU3YN5wOxfzscy/rR2QhaQ8AXSJVZmh7SF6y/+ojSJ7mzU
         BBUYYQ6m6P2fK99gbth9AZ2+a3khNftWiMc/ahG0mM2sdAbKKnXVIsU+fmShjmPzGAFa
         KqrIAz7bS0xPmAT6WMw5HgLzKnaKOlUJfClAG296Ou1+AzHi/HMiZNHqwznWTUtT664n
         yO9HSohrAGZSkgs9eT2N2L5SFHrIn4WEMqJEE4ssXbT66gNAVQeLoYx/SwTWW/DBCCVh
         2ceg==
X-Forwarded-Encrypted: i=1; AJvYcCWmkPDPAmZ9pjYtmv+inF35zHDW1JP9rPt/cM52Y4KxswiP1RkIhrY/Jh1UZSyYD1kfj/DtlsfAeuQ1p8WX@vger.kernel.org
X-Gm-Message-State: AOJu0YyC6qvbMoem9KEaeEBwfXYVgzi2wlO1NlEcdPYZh9go/OLtc+gq
	qBt7MKXFDalDGMon7N854Mpah0CenOTSu4+b42uE31b2s7Nwx/JsQtJrJCfgGqMEQQpPbv5622S
	Yc/2Y3jXjdPLB5iXLzdmpHxZjozBQkqYDIJ0hT/35Ild70R2PRCsb0DkCRmC1CHo+EO01
X-Gm-Gg: AY/fxX6kxgcQdQ+VlE5tyjaf+JrDrp3STeOWOAuQNnZ8vAm9/VB9qLTJSaAhma9vkrV
	PAvxGU5mU5SWceArmR+Chv2eKVoH6PZIPIyHCNEh+RHAVu1H8tR+thmT2fFDvVmMhTgpFwB4VhY
	drUmHWmwSsTLVzaF5/HjhNyiP8aNOYRbaEbjoXdxrnjfBOX4Lgk1EREl4ySVEryQ54T4de9NAE7
	g+uoE3pQeNyppJ5KBIkuqu9oh0s/AoN7hYf2j1NDqoyA3HA+ElqXs+aIsHsb+nLvmCwF0uAWeXm
	2a32iMGnf/pvo68jXEnhX3e49puxup82RcCfd0Szna8U8GvItBqHCas91rtWgXtRMU7zaArWzaJ
	T7SXhpJI6hgY9PBEXkNTfdcv2JHVtGGTsrrUZmQJqKDTLRY9diAcdCspFaz24MGMlITkWHxDPdN
	CYBds=
X-Received: by 2002:a17:903:fae:b0:29f:2f40:76c4 with SMTP id d9443c01a7336-2a7175a21ddmr85020985ad.34.1768790352153;
        Sun, 18 Jan 2026 18:39:12 -0800 (PST)
X-Received: by 2002:a17:903:fae:b0:29f:2f40:76c4 with SMTP id d9443c01a7336-2a7175a21ddmr85020875ad.34.1768790351702;
        Sun, 18 Jan 2026 18:39:11 -0800 (PST)
Received: from [10.133.33.126] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fb373sm63041395ad.72.2026.01.18.18.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 18:39:11 -0800 (PST)
Message-ID: <ed49abf0-c2b6-4496-a3b0-ef040fd94615@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 10:39:04 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Initial patch set for PURWA-IOT-EVK
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
 <jeyj5wqu4uw7tnm4h5ryatoqupdrqpkjcynnydgbum6oj2d4jj@qvvbbifrvud3>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <jeyj5wqu4uw7tnm4h5ryatoqupdrqpkjcynnydgbum6oj2d4jj@qvvbbifrvud3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Fdc6BZ+6 c=1 sm=1 tr=0 ts=696d9951 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=UxwFr_l814m0czHT70EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: bGpdswBT6MoW5I9nKmkirIvZkjvxtMOU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDAyMCBTYWx0ZWRfX4GcIMs1oAeo7
 o3QZmcmL2eOKg/UGiweFbx3dSvveyda9jhCHf/bjJySTd6Rr+XFrH/xajLeK47kGoc8/OtsZoQ7
 k6Pgrv9tOG3OWlYUYuObu5NcNkcUyeDjPEfqmR3XRgjf9WS5soExOi8Uez1EbpGc//07kRJuiL1
 sdFZKXdedQ4bwXrf6AyBb/TL9M5HOa5EYAy1QFGMMYedtN9Q6YAgIhzf+YdHQZ917btM/iPuo+a
 nFuKA6PmwlTSJ3c8j9/v6zkcUQyqoC8DJoMH0+dFq2g0r4D14SQxA2N66e/GNRSGziafhS7TgBo
 ZQSLBccpPYty5CNKkBrpD6gEJJGkGbGc9pYwwRMOXmnXuiDBYc0ZNaK+vJ+zy/Ob874G+kbPFwn
 V9oLcRQBpHwy9zk3OE7xlN5kvCloFuzsEgGMZVP7FfOcmZ3Ab3dl+sJazMpGQg5bgeaSh2DzOwW
 +EAjT2Hzvy2SqSeWOwg==
X-Proofpoint-GUID: bGpdswBT6MoW5I9nKmkirIvZkjvxtMOU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190020



On 1/16/2026 7:31 PM, Dmitry Baryshkov wrote:
> On Fri, Jan 16, 2026 at 06:41:26PM +0800, YijieYang wrote:
>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>
>> Introduce the device tree, DT bindings, and driver updates required to enable
>> the bring-up of the PURWA-IOT-EVK evaluation board. Focus is on two key
>> hardware components:
>>
>> PURWA-IOT-SOM — A compact System-on-Module integrating the SoC, GPIOs, and
>> PMICs. Designed for modularity, it can pair with various carrier boards to
>> support diverse use cases.
>>
>> PURWA-IOT-EVK — A carrier board tailored for IoT scenarios, providing
>> essential peripherals such as UART, on-board PMICs, and USB components.
>>
>> Together, these components form a flexible and scalable platform. Initial
>> functionality is achieved through proper device tree configuration and driver
>> support.
>>
>> The PURWA-IOT-EVK/SOM shares most of its hardware design with
>> HAMOA-IOT-EVK/SOM, differing primarily in the BOM. Consequently, the DTS files
>> are largely similar. Both platforms belong to Qualcomm’s IQ-X family. For more
>> details on the IQ-X series, see:
>> https://www.qualcomm.com/internet-of-things/products/iq-x-series
>>
>> Hardware differences between HAMOA-IOT and PURWA-IOT:
>> - Display — PURWA uses a different number of clocks and frequency compared to
>>    HAMOA.
>> - GPU — PURWA integrates a different GPU.
>> - USB0 — PURWA uses a PS8833 retimer, while HAMOA employs an FSUSB42 as the
>>    SBU switch.
>>
>> Features added and enabled:
>> - UART
>> - On-board regulators
>> - Regulators on the SOM
>> - PMIC GLINK
>> - USB0 through USB6 and their PHYs
>> - Embedded USB (eUSB) repeaters
>> - USB Type-C mux
>> - PCIe3, PCIe4, PCIe5, PCIe6a
>> - Reserved memory regions
>> - Pinctrl
>> - NVMe
>> - ADSP, CDSP
>> - WLAN, Bluetooth (M.2 interface)
>> - USB DisplayPort and eDP
>> - Graphics
>> - Audio
>> - TPM
>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>> Changes in v4:
>> - EDITME: describe what is new in this series revision.
>> - EDITME: use bulletpoints and terse descriptions.
> 
> Oh no. B4 probably even warned you about not sending it out.
> 
>  From this changelog I can assume that nothing has changed. Is it
> correct?

This section was generated automatically by b4 and was not reviewed 
carefully. The actual list of changes is in the section below.

> 
>> - Link to v3: https://lore.kernel.org/r/20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com
>>
>> Changes in v2:
>> - Update the GPU firmware path.
>> - Update the description in the cover letter.
>> - Reorder the patches.
>> - Use separate DTS files for Purwa and Hamoa.
>> - Update base commit.
>> - Link to v1: https://lore.kernel.org/all/20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com/
>>
>> Changes in v3:
>> - Delete unused PMIC and thermal nodes.
>> - Add WiFi node.
>> - Add display backlight node.
>> - Add connectors and VBUS regulators for USB3 and USB6.
>> - Enable PCIe3 and PCIe5; add PCIe ports along with reset and wake-up GPIOs.
>> - Link to v2: https://lore.kernel.org/r/20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com
>>
>> Changes in v4:
>> - Enable TPM.
>> - Update the descriptions for video and the USB OF graph.
>> - Link to v3: https://lore.kernel.org/all/20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com/

Here.

>>
>> ---
>> Yijie Yang (4):
>>        dt-bindings: arm: qcom: Document PURWA-IOT-EVK board
>>        firmware: qcom: scm: Allow QSEECOM on PURWA-IOT-EVK
>>        arm64: dts: qcom: Add PURWA-IOT-SOM platform
>>        arm64: dts: qcom: Add base PURWA-IOT-EVK board
>>
>>   Documentation/devicetree/bindings/arm/qcom.yaml |    6 +
>>   arch/arm64/boot/dts/qcom/Makefile               |    1 +
>>   arch/arm64/boot/dts/qcom/purwa-iot-evk.dts      | 1549 +++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi     |  685 ++++++++++
>>   drivers/firmware/qcom/qcom_scm.c                |    1 +
>>   5 files changed, 2242 insertions(+)
>> ---
>> base-commit: 377054868ffa544991cc491ecc4016589fc58565
>> change-id: 20251113-purwa-907ec75b4959
>>
>> Best regards,
>> --
>> Yijie Yang <yijie.yang@oss.qualcomm.com>
>>
> 

-- 
Best Regards,
Yijie


