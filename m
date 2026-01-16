Return-Path: <linux-arm-msm+bounces-89386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A413D306B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 12:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4B9C303F9AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 11:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7035361DA3;
	Fri, 16 Jan 2026 11:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ifnD7BOR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KKHzsEBz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315F93624C0
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 11:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768563121; cv=none; b=u3j77RdrpZG9sie4mU404V2D3tmj3mO89Va6wOtBLSjYt/2UvWABLGJoLsym1jUWP/g4ST7K/y7oMUCfdrc8Ze/57cgKtQaGLnOCLUi3tWdRhut15Pbr2HS1NlimsksgnukQY1GtSqFgl4RjU5QL+CPvhANJQgMgO9gpuNxTLa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768563121; c=relaxed/simple;
	bh=CjaiQLrpmOnlbyQR1lslDbYPeYToCh8CSIkVpFfn/EA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U447s8yPLcFHls2BjeUZJZJ5gsWLHAly4d6GkbNHcfgS2XtOmlhF1HVOUzkciITmNN8qTsAlvRr06B1rX3HqopL5D1ATjl6VV/joSFEiWVQ7JP/KMQETVjcRLZaBA8+rYu4dhljwG0QSbsMGCXGU9iFV1qxKd7+roNOpr2WVhNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ifnD7BOR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KKHzsEBz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G7lmqS2818740
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 11:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YRHCUbU7sPkxEpJcuN0iQaVyvFtsCF+3nmbFTJgUqs0=; b=ifnD7BORPzSTWG/I
	yOWjpqyZZD8Xhn8ez/VHinxNET5ecg0CGNas/8FvOOVMrR/i6CrU2jnO1+cE6kwg
	SVdp4pQNcnbhHuewjSkqIUoGsaHQOek6RSRhd3ApzyEjWYijB2Az7HLwYpOubZD1
	kAQJlOZHj1WXAXzffPRo4F/4FXnAmWNMY5S0LebeTqD0fws4XRHj8nWVDzWwRUpo
	RQwDikMuzQxWwjjk96LlQPY1ks2KwDSLsyGd1Tr2qAY5db6QnyHqZ9N9ffF50iPP
	0ygeVRmLa9iUnJP6QBBgx0CJ3o5UX2CB2yIhkHmHuXB46JBmFfaJD+S7TJtQQnki
	/EjHZQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq99ahyjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 11:31:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52d3be24cso248438485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 03:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768563118; x=1769167918; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YRHCUbU7sPkxEpJcuN0iQaVyvFtsCF+3nmbFTJgUqs0=;
        b=KKHzsEBzIdaPws7Ioe3Nf1lnwiz+w0BZXrGNLDKDfdzBHZf6dNiqa6BKBX8QYEC5kl
         DgDSf++MR1LMsSStHn4ixkLLlvesJf648zvXqI/1NVWPO89xQwp8g1B/BGGRnwTawOvG
         QEbA6pcw5mEdIBz66ffkVJQH09IQJdJeXPIOaQ1yXV+rRhPhiAc43QCkDxHpkF65UsuF
         h2Wxy6lKsmhmKTuoBg9M6hs6hEytNGkDYoE+yjfr7zeIEddCvVNeEEe21o9INPBhHqcA
         erHovm58cAspM1mDQjN2dls9EXWXj+zVTWgXj3ss5ZOzTZldanOGeW6BgRJihiJuNA5R
         094A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768563118; x=1769167918;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YRHCUbU7sPkxEpJcuN0iQaVyvFtsCF+3nmbFTJgUqs0=;
        b=SjWauCIQqvWp/WDsdJiIU51tvdt5MjFs6IBFvdqKdKMJYioaGgI4MUJQBYY9m0RtJN
         77Hg0Ml/izvxGDUgqdbZpVegUTUXymtf/aLbwBDVwDkCFDw5FdryZxw3fLVAPfCShAAk
         4LVUmXxl4ppyzWZ/aby32gO/pjnFGhZ2zz90c9+Y2tuqODkuuqrVIxEZv+maPSDzOOD4
         U0uob4ezB+hKY3IVCGEkY4C6tRncIbWFss31AegfmV2ZUByvijgXuGlmMiGnIxg0WAx7
         5GwsLda601mvpERD7G1aMcI3GvKWDqv7BR3h5aFPX2M1qkaLoqn7Jx3yrA/mK8AOSiGs
         oUgw==
X-Forwarded-Encrypted: i=1; AJvYcCXtQt643a2kcO7vqbuWE8PtHh/1vGQ0DFjqikUuoI0pESYHO2C+HTdCQs+dq59qMyHrcZoVifkOC7nQkVgi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6vq3zfKA1NTYCz3jed6/tc/A/HIvSBY4amp/BYuV2hTH4M5nr
	b8PC1aXIrh/e4LPLO6p80dqsAl+66KPyxqtTcUb9nsUDz26VuQG4Ro0C/7izZSegT5TBtK/Vvid
	5gkQ55SksUULCqY6nRbAVZUmsmYK3T7oPV/kAvxn1hQqDNOcnIHNg4AGdvb/WciC4Hvn5
X-Gm-Gg: AY/fxX7p+iHsrbR8XkvuRcqUSS7L0jozDlkopFvsSxy19ivsSIgzhbi47OXR43V0zLr
	zh9ZrF8KOGxAtnRFaWkhqeZcViNZMC2ufkYIg+oUiPzmtHL4rLwtrHSAMrOXnmQcVYjaaN4LU/8
	e+3z6JI6n4K162Y+8rD1fiXVzxkOXFxF613Z6+Y/K3cze21rgmMd5l7Rg47NEwGc1yJRVxoHBMF
	z1LjZeYI1SfB0FvQ0Q4arijks9c+6ZGgfIAkuGIveoipDh6dpFdByIJot+SKgZGEs637IFsXNg2
	0f2lBn6a6hQQohSZ923ubsf9sA+9hayZa/8bEi7R/o16QBdSwPOTKv8cCZYuHtcX+5bbcoq7wMG
	WnBCFkcAEFZTHRdQd+JKk4TR0V5guB1TRiB4EnA2SKP6df6FIAvYpcMEHUC+Vm3s0EfN13HmHed
	c8N3eunAf3nwWhnOpqDn2QAec=
X-Received: by 2002:a05:620a:c41:b0:8c5:3067:903c with SMTP id af79cd13be357-8c6a66eda10mr352951985a.11.1768563118453;
        Fri, 16 Jan 2026 03:31:58 -0800 (PST)
X-Received: by 2002:a05:620a:c41:b0:8c5:3067:903c with SMTP id af79cd13be357-8c6a66eda10mr352947785a.11.1768563117906;
        Fri, 16 Jan 2026 03:31:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf33e84esm697578e87.16.2026.01.16.03.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 03:31:57 -0800 (PST)
Date: Fri, 16 Jan 2026 13:31:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: YijieYang <yijie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/4] Initial patch set for PURWA-IOT-EVK
Message-ID: <jeyj5wqu4uw7tnm4h5ryatoqupdrqpkjcynnydgbum6oj2d4jj@qvvbbifrvud3>
References: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xXEnonhHUXsOLiEvisxAaPWrT91MjNRR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA4MyBTYWx0ZWRfX81XH83pzp1bI
 +Y7zSIsF+mkIq8+hkgv/9DXGGo/ZvHjOc7pP2fJsSpuXzW3nj5WjktMm0gqg/k+6b+EJ/FuZCGY
 oJVgfuOvUUb9vaLz0e9jB0JgoX3GYUBmK7TN8BuIv0/efXblxYVPFm7v3rec4cxDtAHnSjUNGdG
 exI+r54QUhuOdRVphiwnxLmq70vcpi9r+xrHVGLkn7d5muk5ezlJxw7oznKI7FlbGOObZ8AnVbQ
 UWd+Y0T9fEJGro3OYwb6av5V2TgoblE2NiSb3xPQpYnT5Kuoy2Tj/r0q2Oq+IBkLqN9mpdgl6po
 WiZZdZB37tCjZ9DMPvVD1uofMWa7drg1C6vlZI8gYTugNZNcX1gG8CY4weUg+RF3OFQ0clXQg5b
 G+Ict+1+9aauv9tOyBsiv2vPQz2Shk5LDUPjsqw4ODT/A4exYcIiO5rMQD8/f47RSUALNbT6piC
 jSPT5Ac6OAEr1pUG2hg==
X-Proofpoint-GUID: xXEnonhHUXsOLiEvisxAaPWrT91MjNRR
X-Authority-Analysis: v=2.4 cv=f5ZFxeyM c=1 sm=1 tr=0 ts=696a21af cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=zISjWgYTDL59evdA9KsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160083

On Fri, Jan 16, 2026 at 06:41:26PM +0800, YijieYang wrote:
> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> 
> Introduce the device tree, DT bindings, and driver updates required to enable
> the bring-up of the PURWA-IOT-EVK evaluation board. Focus is on two key
> hardware components:
> 
> PURWA-IOT-SOM — A compact System-on-Module integrating the SoC, GPIOs, and
> PMICs. Designed for modularity, it can pair with various carrier boards to
> support diverse use cases.
> 
> PURWA-IOT-EVK — A carrier board tailored for IoT scenarios, providing
> essential peripherals such as UART, on-board PMICs, and USB components.
> 
> Together, these components form a flexible and scalable platform. Initial
> functionality is achieved through proper device tree configuration and driver
> support.
> 
> The PURWA-IOT-EVK/SOM shares most of its hardware design with
> HAMOA-IOT-EVK/SOM, differing primarily in the BOM. Consequently, the DTS files
> are largely similar. Both platforms belong to Qualcomm’s IQ-X family. For more
> details on the IQ-X series, see:
> https://www.qualcomm.com/internet-of-things/products/iq-x-series
> 
> Hardware differences between HAMOA-IOT and PURWA-IOT:
> - Display — PURWA uses a different number of clocks and frequency compared to
>   HAMOA.
> - GPU — PURWA integrates a different GPU.
> - USB0 — PURWA uses a PS8833 retimer, while HAMOA employs an FSUSB42 as the
>   SBU switch.
> 
> Features added and enabled:
> - UART
> - On-board regulators
> - Regulators on the SOM
> - PMIC GLINK
> - USB0 through USB6 and their PHYs
> - Embedded USB (eUSB) repeaters
> - USB Type-C mux
> - PCIe3, PCIe4, PCIe5, PCIe6a
> - Reserved memory regions
> - Pinctrl
> - NVMe
> - ADSP, CDSP
> - WLAN, Bluetooth (M.2 interface)
> - USB DisplayPort and eDP
> - Graphics
> - Audio
> - TPM
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
> Changes in v4:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.

Oh no. B4 probably even warned you about not sending it out.

From this changelog I can assume that nothing has changed. Is it
correct?

> - Link to v3: https://lore.kernel.org/r/20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com
> 
> Changes in v2:
> - Update the GPU firmware path.
> - Update the description in the cover letter.
> - Reorder the patches.
> - Use separate DTS files for Purwa and Hamoa.
> - Update base commit.
> - Link to v1: https://lore.kernel.org/all/20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com/
> 
> Changes in v3:
> - Delete unused PMIC and thermal nodes.
> - Add WiFi node.
> - Add display backlight node.
> - Add connectors and VBUS regulators for USB3 and USB6.
> - Enable PCIe3 and PCIe5; add PCIe ports along with reset and wake-up GPIOs.
> - Link to v2: https://lore.kernel.org/r/20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com
> 
> Changes in v4:
> - Enable TPM.
> - Update the descriptions for video and the USB OF graph.
> - Link to v3: https://lore.kernel.org/all/20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com/
> 
> ---
> Yijie Yang (4):
>       dt-bindings: arm: qcom: Document PURWA-IOT-EVK board
>       firmware: qcom: scm: Allow QSEECOM on PURWA-IOT-EVK
>       arm64: dts: qcom: Add PURWA-IOT-SOM platform
>       arm64: dts: qcom: Add base PURWA-IOT-EVK board
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml |    6 +
>  arch/arm64/boot/dts/qcom/Makefile               |    1 +
>  arch/arm64/boot/dts/qcom/purwa-iot-evk.dts      | 1549 +++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi     |  685 ++++++++++
>  drivers/firmware/qcom/qcom_scm.c                |    1 +
>  5 files changed, 2242 insertions(+)
> ---
> base-commit: 377054868ffa544991cc491ecc4016589fc58565
> change-id: 20251113-purwa-907ec75b4959
> 
> Best regards,
> --  
> Yijie Yang <yijie.yang@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

