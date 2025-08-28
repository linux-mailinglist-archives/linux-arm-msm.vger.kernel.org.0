Return-Path: <linux-arm-msm+bounces-71081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1078EB39625
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 10:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD166361FEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 08:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C56152BDC2A;
	Thu, 28 Aug 2025 08:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bqBtRgNb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2544E18B0A
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 08:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756368350; cv=none; b=Lh+sqa27/NKDZLNFM9P7crQys3B9ClfkmtexK2kn5ev5GHk3w0Dw3LqUrWDmtIl/WeSTzIDQAcyiaCSlwyN+KCyV3W0eR/NiBI0fImaL4WfXupcdu+hpOwsF7V3bQ1RXN+4KyTjTOtQ8F7j+knogBryIG+NaquU20PPGN78E2f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756368350; c=relaxed/simple;
	bh=0v3VTSDnoKSJ11aMKmMrmANPBeZqszSRoleoKqFZowM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TZytIm3WFvJkUVXjCWtHbjFoHuKv5zbLODAW8KugrQaFHlNzX8jWRkG6nd93FCUWNSemdTGssh5TLlmmlAGAZUgm6T2RFe0C5Pqp5KN68ThIZxmzDlPjtqcaZ4mULVVBP9Q54Y7JMX+fjz3ubKb1d2/P2c+KD311rBAmAvQK1pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqBtRgNb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S2vd94000532
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 08:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vY1V0UwZ8s0vX29+NR8gyAX4j41CCT/In5zMDAylqeI=; b=bqBtRgNbYkRka2Fq
	k0XVKjGHYQc6rqp3e06EaJvNitZZhwSCeMMVubZ8hX2LttTGNC4njobZ08q57XgD
	fU8PozMPtE2b4qsd8xrju+oJSHPFr6zS+fIkzAR8feiTdvbVDXedEmvwEnhEbDPm
	WCHWAAqxW9v0/UZOgN9umCLP9nyZ5mKP4sxfInch8BHQOLATGE24bLkk8zTOHzn2
	CSObKgF2FCzRLUhSvk+OI5ZYlWnDdqI9upCRMs3Lj0ZIsD4gAQ7qzq7IevdRFl7U
	LxN0bacd5fG176iVasZ1o3wLkUMwAo4OgXC8tHKV7e4ESHfO1MLBsfjpjvw1kPsp
	lCOUaQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48t47bafdd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 08:05:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24696a89d6dso13819685ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 01:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756368347; x=1756973147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vY1V0UwZ8s0vX29+NR8gyAX4j41CCT/In5zMDAylqeI=;
        b=XIzheS7+ydMfZhyCGJQez/XL3fF09WxVOYk8LcrSYIw0LwL+dKbWCwNAj4Z4WnEcR9
         BqMfH9nvl4E9b115CRVYnDL2JEGEM24pnk59kOOXZv3ZqAtmSVsC6LTXDCOT8z6im1//
         RsaL/4Umh2/5Zl9I8p1PRVnkDftDSFuI5Gwo7csGJ3d6QU+sRNrFokwNMzTusOJQI4zY
         pfkJKODPUuFytrXABN/l9M7vseEsQ1cm02UF/bnR4JwOsxPtWfEtT225rNyw1FMt/dO8
         fz9FPRWYev6uz1yxOTlVlEnwKAxUbYcIraKxGLT3UE3iphlPLKYtExCtD6COlNUjGBfp
         bffw==
X-Forwarded-Encrypted: i=1; AJvYcCWHzyGUlCjWC+eDOYu3GPK/8FMNAKssYw5oDmRcfWCrCt4hux52g2aR30ULJcwxdhwzVF63TlXuMym4i2NR@vger.kernel.org
X-Gm-Message-State: AOJu0YyQsa1+2mUOk8gEdiCWb2jDzcpdh5Cu5H4rYWigBM0lwAa1erAD
	AX8uc0XBzU7xVFyRFul7x7wpV1SrOpcrMCIdtA85alNGITw60KAL33sFT5x4APxfoAxbm3vKIdw
	1+U2auOIljZcCvfM+dvMAv1AHueS70Wv97LdwPT39H8U1LE8VFjHFlSUcPOCqFZ7EE2TS
X-Gm-Gg: ASbGnctRFN8nEYHkKUrecBp6xf8pWC34loz2J8lV1fdne3pcdBpt2IPMgCJO21A8IP9
	bEzHFiErjRUK/7G+ZEgWOtvaZPQZ/48zIvYkSBeTps6Mr1nyophbc6D/9DZxYvre8El13gLOqho
	80bPnwZuHIQiC6wvKXHBzchNJqdjL9+U+X/4Rn9hwL5qD8S+4aIknQl4zT8MS6qSUH3pENx+AnE
	cWWfSG8o0AQyDzChL8EKrejw9lymavY6DrA5+OzulY9VLY4jLkYD2F87hz6wmhoVCu6FzuKB2YN
	RHqO6Z8lo5eUkns5p6jWqn5elBPuHvUMUKr0leX8cxZD0eg8n4pDHh0aLBgFTXIabxUNTLlZRNU
	c6WZpVObQ
X-Received: by 2002:a05:6a20:6a28:b0:23f:fec8:9ab0 with SMTP id adf61e73a8af0-24340b59c44mr32754337637.25.1756368347078;
        Thu, 28 Aug 2025 01:05:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyRlqZnSkO2dMdTgeoV1jxASU3ZmYnT0g0dq+toleinjjWrSpO9LT86flFSlKz/iy9C2rMrw==
X-Received: by 2002:a05:6a20:6a28:b0:23f:fec8:9ab0 with SMTP id adf61e73a8af0-24340b59c44mr32754293637.25.1756368346509;
        Thu, 28 Aug 2025 01:05:46 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327ab0f20c7sm1600294a91.26.2025.08.28.01.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 01:05:45 -0700 (PDT)
Message-ID: <b08aa8f4-7283-40d5-9f5e-ed8697f882a9@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 13:35:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 00/10] Implement vendor resets for PSCI SYSTEM_RESET2
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _feeCi-bKS58fCMVfekVIeQbIP13G7a4
X-Authority-Analysis: v=2.4 cv=CYoI5Krl c=1 sm=1 tr=0 ts=68b00ddc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=YvEvsVr50XASBo1Q0dIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: _feeCi-bKS58fCMVfekVIeQbIP13G7a4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDEyOCBTYWx0ZWRfX566NHkBiU7eb
 ki1s3zwGN34EOKTj6dAULrW/r2/cE9z1/zOGS/vrEkLjrIcvqH8+lqbfghQGROf0UHy96/s79Id
 q+4W+CppcOn2rAybkIyqtZXK4ZtK0mDSXaJfAWisiFWbWmm02+Th+3s99VoW8JWAY29nM2uGZ3M
 fWeyLeWmSGBbkVETNfcmU/pRczr0vf8p8sgkujsnhqHInetapf2solRHV4GXEreqvjdNyOLA2U9
 9jZ4hKe1d2Pd+Vpz1UbaNAu6gyRhYeRLvQXTTix7FteXV99WW/3gJhr3w3hvcAcbz7pW8is6Hgh
 1awagGjkrpGHTqrq4eAY2Nwt36VBKkNR+oPwA9DGiEnXOJ/sY3SxamSEOVWkUxXSJQu9DPzVAoE
 K48doDIz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508270128


On 8/15/2025 8:05 PM, Shivendra Pratap wrote:
> The PSCI SYSTEM_RESET2 call allows vendor firmware to define
> additional reset types which could be mapped to the reboot
> argument.
>
> User-space should be able to reboot a device into different
> operational boot-states supported by underlying bootloader and
> firmware. Generally, some HW registers need to be written, based
> on which the bootloader and firmware decide the next boot state
> of device, after the reset. For example, a requirement on
> Qualcomm platforms may state that reboot with "bootloader"
> command, should reboot the device into bootloader flashing mode
> and reboot with “edl” command, should reboot the device into an
> Emergency flashing mode.  Setting up such reboots on Qualcomm
> devices can be inconsistent across SoC platforms and may require
> setting different HW registers, where some of these registers may
> not be accessible to HLOS. These knobs evolve over product
> generations and require more drivers.  PSCI defines a
> vendor-specific reset in SYSTEM_RESET2 spec, which enables the
> firmware to take care of underlying setting for any such
> supported vendor-specific reboot. Qualcomm firmwares are
> beginning to support and expose PSCI SYSTEM_RESET2
> vendor-specific reset types to simplify driver requirements from
> Linux. With such support added in the firmware, we now need a
> Linux interface which can make use of the firmware calls for PSCI
> vendor-specific resets. This will align such reboot requirement
> across platforms and vendors.
>
> The current psci driver supports two types of resets –
> SYSTEM_RESET2 Arch warm-reset and SYSTEM_RESET cold-reset. The
> patchset introduces the PSCI SYSTEM_RESET2 vendor-specific reset
> into the reset path of the psci driver and aligns it to work with
> reboot system call - LINUX_REBOOT_CMD_RESTART2, when used along
> with a supported string-based command in “*arg”.
>
> The patchset uses reboot-mode based commands, to define the
> supported vendor reset-types commands in psci device tree node
> and registers these commands with the reboot-mode framework.
>
> The PSCI vendor-specific reset takes two arguments, being,
> reset_type and cookie as defined by the spec. To accommodate this
> requirement, enhance the reboot-mode framework to support two
> 32-bit arguments by switching to 64-bit magic values.
>
> Along this line, the patchset also extends the reboot-mode
> framework to add a non-device-based registration function, which
> will allow drivers to register using device tree node, while
> keeping backward compatibility for existing users of reboot-mode.
> This will enable psci driver to register for reboot-mode and
> implement a write function, which will save the magic and then
> use it in psci reset path to make a vendor-specific reset call
> into the firmware. In addition, the patchset will expose a sysfs
> entry interface within reboot-mode which can be used by userspace
> to view the supported reboot-mode commands.
>
> The list of vendor-specific reset commands remains open due to
> divergent requirements across vendors, but this can be
> streamlined and standardized through dedicated device tree
> bindings.
>
> Currently three drivers register with reboot-mode framework -
> syscon-reboot-mode, nvmem-reboot-mode and qcom-pon. Consolidated
> list of commands currently added across various vendor DTs:
>   mode-loader
>   mode-normal
>   mode-bootloader
>   mode-charge
>   mode-fastboot
>   mode-reboot-ab-update
>   mode-recovery
>   mode-rescue
>   mode-shutdown-thermal
>   mode-shutdown-thermal-battery
>
> On gs101 we also pass kernel-generated modes from kernel_restart()
> or panic(), specifically DM verity's 'dm-verity device corrupted':
> 	mode-dm-verity-device-corrupted = <0x50>;
>
> - thanks Andre' for providing this.
>
> Detailed list of commands being used by syscon-reboot-mode:
>      arm64/boot/dts/exynos/exynosautov9.dtsi:
> 	mode-bootloader = <EXYNOSAUTOV9_BOOT_BOOTLOADER>;
> 	mode-fastboot = <EXYNOSAUTOV9_BOOT_FASTBOOT>;
> 	mode-recovery = <EXYNOSAUTOV9_BOOT_RECOVERY>;
>
>      arm64/boot/dts/exynos/google/gs101.dtsi:
>      	mode-bootloader = <0xfc>;
>      	mode-charge = <0x0a>;
>      	mode-fastboot = <0xfa>;
>      	mode-reboot-ab-update = <0x52>;
>      	mode-recovery = <0xff>;
>      	mode-rescue = <0xf9>;
>      	mode-shutdown-thermal = <0x51>;
>      	mode-shutdown-thermal-battery = <0x51>;
>
>      arm64/boot/dts/hisilicon/hi3660-hikey960.dts:
>      	mode-normal = <0x77665501>;
>      	mode-bootloader = <0x77665500>;
>      	mode-recovery = <0x77665502>;
>
>      arm64/boot/dts/hisilicon/hi6220-hikey.dts:
>      	mode-normal = <0x77665501>;
>      	mode-bootloader = <0x77665500>;
>      	mode-recovery = <0x77665502>;
>
>      arm64/boot/dts/rockchip/px30.dtsi:
>      	mode-bootloader = <BOOT_BL_DOWNLOAD>;
>      	mode-fastboot = <BOOT_FASTBOOT>;
>      	mode-loader = <BOOT_BL_DOWNLOAD>;
>      	mode-normal = <BOOT_NORMAL>;
>      	mode-recovery = <BOOT_RECOVERY>;
>
>      arm64/boot/dts/rockchip/rk3308.dtsi:
>      	mode-bootloader = <BOOT_BL_DOWNLOAD>;
>      	mode-loader = <BOOT_BL_DOWNLOAD>;
>      	mode-normal = <BOOT_NORMAL>;
>      	mode-recovery = <BOOT_RECOVERY>;
>      	mode-fastboot = <BOOT_FASTBOOT>;
>
>      arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dts:
>      	mode-normal = <BOOT_NORMAL>;
>      	mode-loader = <BOOT_BL_DOWNLOAD>;
> 			mode-recovery = <BOOT_RECOVERY>;
> 			mode-bootloader = <BOOT_FASTBOOT>;
>
> Detailed list of commands being used by nvmem-reboot-mode:
>      arm64/boot/dts/qcom/pmXXXX.dtsi:(multiple qcom DTs)
> 			mode-recovery = <0x01>;
> 			mode-bootloader = <0x02>;
>
> Previous discussions around SYSTEM_RESET2:
> -https://lore.kernel.org/lkml/20230724223057.1208122-2-quic_eberman@quicinc.com/T/
> -https://lore.kernel.org/all/4a679542-b48d-7e11-f33a-63535a5c68cb@quicinc.com/
>
> Signed-off-by: Elliot Berman<quic_eberman@quicinc.com>
> Signed-off-by: Shivendra Pratap<shivendra.pratap@oss.qualcomm.com>


With this series, 'edl' mode is working fine in QCOM's IPQ5424 SoC. So

Tested-by: Kathiravan Thirumoorthy 
<kathiravan.thirumoorthy@oss.qualcomm.com> # IPQ5424-RDP466


