Return-Path: <linux-arm-msm+bounces-69158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4FBB25FC0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 10:57:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F4E77B91B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 08:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12F92EBDDB;
	Thu, 14 Aug 2025 08:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gurs1CkT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FBA2EBBB6
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 08:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755161686; cv=none; b=u63cX3UfhJpoH7dxBZxwJGdgGYeAWEVAxZ9SFrvuz7T1zR9LITRWp+uAV4tenUr+xqukA7TmRcMsTlhhrQ+u/13UobbA81Q/49LHpVtaqUSiDXjh6UwzKxHq7OAPNggezaAD5I2rOF5pkBjQgoVTwAoQsvUAuX9nTyzAKiGcHV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755161686; c=relaxed/simple;
	bh=o0JelzvkUyEcr8PgweyIC8ORBqUud/Jz1FzkBZ69eI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fZ9xubf4eEAsVTpjhBReZzGbGzoUoXJEz17KHKmjGSa2O+0Bw9EzboIfTyLevZ7e5TIpHsc13d1U1idRrxIAXrmp1cRUA4u6hK4KxAXAQIRvPmQiMpOb6XonnKcVXIj8MdM+SKpHQPWHpdMadE9K/mydunTiB/Mp2BBYKDSNxYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gurs1CkT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E00TYZ029470
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 08:54:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2UJw+SfFxVIPXPPKC+F8/FC8oXhBDU5WPkeGJpJMYS4=; b=gurs1CkT8YePo4nt
	peGwtljVTg8MvTchSugLhqjmlXUY0AamfrbD4oR7ZLk+lSe+3RSt+OSzTWp9Zg60
	cgUK21CclZeX5ubLK+uwz6CDLRS9b2iKSfKoe9IMPGtqt1DMhUBTbS2qlbRtdfTh
	cg7U5h5Xa5aLfrQu5d9Tf85ocR+cAaH5qi87OWImKisyvBON7Jl53ZucbML/qGXA
	KYhOy3AWi7hhAQ2hN57H/uVyziMa/cdmE59MAhdJgGarAOJ9urFfTkQb8LGkygxj
	PT3JRAa7ujrDLEu+EknIOEE7GpXuaOmLjxpWoc3Osy5zZ+2boWvipJJGiJfM36nS
	oXnpWg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9q9x37b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 08:54:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2445823e49fso7720325ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 01:54:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755161683; x=1755766483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2UJw+SfFxVIPXPPKC+F8/FC8oXhBDU5WPkeGJpJMYS4=;
        b=GS+kGI2sGDAiv6FqhQ3oV3S29JxdIAickQBok2qAXdUe2kHcuJn/sCg4Z8FujB7OBu
         fGZ07/J6U9DSp3smb+2aqwZ8sgliDX31jrLVBkW/9iZzurBnQmfU3uV7SCXIyIgY8YKE
         n0lbz3/WClxSvPkThK/5FyvixAp7x5cgvP/4N78+B8YIsvwCFmZo+1bt7MpCv++BS1do
         Y0/INCdCapQH+JGJsxpBhJqQM/LJaCLGYUZiBZlxpuGGbMN5ELPxsEbZZPu8+yXzoRL3
         C6z5SpYSYH0e2+ILb7gsNAVwsjOeyGsc1BYrdB2bLNb5woAW608uUKOaFUw7NyJ0xMd1
         VHdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkGLJw9F2ddnIUosfdzCU81hpjaq7Z5dR3EHcYdsyCrMtSsDhykjcN/agltnUJDBt8uuSrYEDRfK3vOkdS@vger.kernel.org
X-Gm-Message-State: AOJu0Yw41O2z7J3v0Nw1Di+inERDTonkG7OfZS1OW96tYUSffCxbFfrI
	OFeQUo31J+GIERlGuHRnrQ1j425MqihLPVazAx62yA2WjQDfVpRGKy/0OeJsdyA6k5AwgM6Qkoh
	v+K2z1eO5lXIaF2K8sMo6p3zTzkvYCUXtPUA8e2aHxy/2M+ofhkMAFU8bDvfqb1DqRzMO
X-Gm-Gg: ASbGncs25woVYDfRHMEEgW4q9TYe8WqG8izQHHFvS4tFL+fzEtfoudKYScB7fq02O5W
	+9o4vRz8uGJwHDOFAkLa7cETmhd+PqZ+GEp3nWEhoa2OgAlpJSaBTLZlXqN0wKoG39Xrqz46L4V
	9sONl9gLGmicVbbtXebDMjnmTZhpiMpYeBWDwNd2ttgVU5qWVLX9Ul4b5onQRevmBeBhiY1XwqT
	vrfX74QcXHqrFJF1QPcsPVSN6/u/1iYkFq+f4re5sZ97ta10PwH8k0DuZ0JZ1O+gOLlc0BXfiuu
	Pf83SGfndnIjwhe57KSRr5Tm3C4+Z/buumFctNBP6KJE5p8JOX+uCgOwCu0s7wCGDsJX5Naeq9r
	0evUk1nIuRfM3c9eJOh7OdMiK+6A=
X-Received: by 2002:a17:903:1984:b0:240:7725:18de with SMTP id d9443c01a7336-2445867ee51mr35046245ad.37.1755161683472;
        Thu, 14 Aug 2025 01:54:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8w8QOFa8FrfnfmTZV8IlFvtc/tzzs60iEP0bFR9r77L1vJM6LWPGvCRVwZorvo+a3h5EqZw==
X-Received: by 2002:a17:903:1984:b0:240:7725:18de with SMTP id d9443c01a7336-2445867ee51mr35045995ad.37.1755161683028;
        Thu, 14 Aug 2025 01:54:43 -0700 (PDT)
Received: from [10.133.33.40] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-243086849b3sm54122435ad.175.2025.08.14.01.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 01:54:42 -0700 (PDT)
Message-ID: <7e5d39e0-115e-40be-b44f-0195a4827a0c@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 16:54:35 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] Initial support for Qualcomm Hamoa IOT EVK board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Yingying Tang <quic_yintang@quicinc.com>,
        Shuai Zhang <quic_shuaz@quicinc.com>,
        Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250814-hamoa_initial-v5-0-817a9c6e8d47@oss.qualcomm.com>
 <5reeryefhw7burzf2lymhg5wivaq2n4gq5hszvfp57dergvpyx@qehaf334gdrn>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <5reeryefhw7burzf2lymhg5wivaq2n4gq5hszvfp57dergvpyx@qehaf334gdrn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689da454 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=idm_D6DhFunYarwkacIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: wmohR0hTSPIgTQt5NSn5JTsJP1ujHV6f
X-Proofpoint-ORIG-GUID: wmohR0hTSPIgTQt5NSn5JTsJP1ujHV6f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfX4bDjr/+TX5Yj
 febWsfwAns2leWRfjb3tUlx/lyl3ZDSaIc3Xpfyt7Rb5Lei0N92p4Fv7fkxB+G4ONLqSheQyWA0
 00eZY7vPcfsbwAcgZE5Io2NnJ/vb9NwglcXPFIETGf4qOaF9a8U13AsmZ2VwVKHsd/ik4S97+s+
 ZNxVCbIN3xyMA9AFcNygZ1l4oClnyuVsyEurMDdFNC+5eOBPIczJpvwkjBpAzjjzD9X+MH5HiGm
 yHA2POHCg7ZNg0KCXHYRjgEknC2K7873PRDFRpMAr3dN2IjqmxZX2FLyngX1J9cBdPmw60rbs5V
 yRZTjY9D43C/eQfIhe/EGVhrSaLzZpOdd3cwYr5VV1LkugjfP8o2r1P52X2vdlOpMSUO7GWSjO1
 EQTLgOCe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164



On 2025-08-14 16:24, Dmitry Baryshkov wrote:
> On Thu, Aug 14, 2025 at 03:27:27PM +0800, Yijie Yang wrote:
>> Introduce the device tree, DT bindings, and driver modifications required
>> to bring up the HAMOA-IOT-EVK evaluation board—based on the X1E80100 SoC—to
>> a UART shell.
>> This patch set focuses on two key hardware components: the HAMOA-IOT-SOM
>> and the HAMOA-IOT-EVK carrier board.
>> The HAMOA-IOT-SOM is a compact System on Module that integrates the SoC,
>> GPIOs, and PMICs. It is designed to be modular and can be paired with
>> various carrier boards to support different use cases.
>> The HAMOA-IOT-EVK is one such carrier board, designed for IoT scenarios.
>> It provides essential peripherals such as UART, on-board PMICs, and
>> USB-related components.
>> Together, these components form a flexible and scalable platform, and this
>> patch set enables their initial bring-up through proper device tree
>> configuration and driver support.
>>
>> Qualcomm SoCs often have multiple product variants, each identified by a
>> different SoC ID. For instance, the x1e80100 SoC has closely related
>> variants such as x1e78100 and x1e001de. This diversity in SoC identifiers
>> can lead to confusion and unnecessary maintenance complexity in the device
>> tree and related subsystems.
>> To address this, code names offer a more consistent and project-agnostic
>> way to represent SoC families. They tend to remain stable across
>> development efforts.
>> This patch series introduces "hamoa" as the codename for the x1e80100 SoC.
>> Going forward, all x1e80100-related variants—including x1e81000 and others
>> in the same family—will be represented under the "hamoa" designation in the
>> device tree.
>> This improves readability, streamlines future maintenance, and aligns with
>> common naming practices across Qualcomm-based platforms.
>>
>> Features added and enabled:
>> - UART
>> - On-board regulators
>> - Regulators on the SOM
>> - PMIC GLINK
>> - USB0 through USB6 and their PHYs
>> - Embedded USB (eUSB) repeaters
>> - USB Type-C mux
>> - PCIe6a and its PHY
>> - PCIe4 and its PHY
>> - Reserved memory regions
>> - Pinctrl
>> - NVMe
>> - ADSP, CDSP
>> - WLAN, Bluetooth (M.2 interface)
>> - USB DisplayPort
>>
>> DTS Dependency:
>> https://lore.kernel.org/all/20250724-move-edp-endpoints-v1-3-6ca569812838@oss.qualcomm.com/
>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>> To: Bjorn Andersson <andersson@kernel.org>
>> To: Konrad Dybcio <konradybcio@kernel.org>
>> To: Rob Herring <robh@kernel.org>
>> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> To: Conor Dooley <conor+dt@kernel.org>
>> Cc: linux-arm-msm@vger.kernel.org
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>>
>> ---
>> Changes in v5:
>> - Update base commit.
>> - Drop an already merged patch:
>> https://lore.kernel.org/all/20250804-hamoa_initial-v4-2-19edbb28677b@oss.qualcomm.com/
>> - Link to v4: https://lore.kernel.org/r/20250804-hamoa_initial-v4-0-19edbb28677b@oss.qualcomm.com
> 
> Please keep full changelog rather than trimming previous iterations.

Sure, I will restore them.

> 
> Also, is there a reason why you didn't pick up audio and display chunks
> as it was requested on the corresponding reviews?

Display-related changes have been merged into '[PATCH v5 3/3] arm64: 
dts: qcom: Add base HAMOA-IOT-EVK board' and are already present there.

Audio support is still under debugging due to unresolved issues, and 
it's unclear when it will be ready. Would it be acceptable to proceed 
without it for now?

> 
>>
>> ---
>> Yijie Yang (3):
>>        dt-bindings: arm: qcom: Document HAMOA-IOT-EVK board
>>        arm64: dts: qcom: Add HAMOA-IOT-SOM platform
>>        arm64: dts: qcom: Add base HAMOA-IOT-EVK board
>>
>>   Documentation/devicetree/bindings/arm/qcom.yaml |   6 +
>>   arch/arm64/boot/dts/qcom/Makefile               |   1 +
>>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts      | 987 ++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi     | 609 +++++++++++++++
>>   4 files changed, 1603 insertions(+)
>> ---
>> base-commit: 2016d952577e807ee89e0cef02af1f95aabbbcb2
>> change-id: 20250604-hamoa_initial-0cd7036d7271
>> prerequisite-message-id: <20250724-move-edp-endpoints-v1-3-6ca569812838@oss.qualcomm.com>
>> prerequisite-patch-id: c536bf9ec7fd22af9b05b695272997615dfd675f
>> prerequisite-patch-id: d513e5a08d3be585b9b6a737ef3a1ad275d7caad
>> prerequisite-patch-id: 605ef6f89dd84f810df11be9d11ee6803a6bf289
>> prerequisite-patch-id: 2ab2430624acbdd9011f6c0c2a77469fd19fc75a
>> prerequisite-patch-id: bfbb562513763ce75f2bb5da7f12e7b54ff3919d
>>
>> Best regards,
>> -- 
>> Yijie Yang <yijie.yang@oss.qualcomm.com>
>>
> 

-- 
Best Regards,
Yijie


