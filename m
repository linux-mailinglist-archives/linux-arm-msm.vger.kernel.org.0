Return-Path: <linux-arm-msm+bounces-74422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 130D9B916FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 15:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 937594E127C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 13:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772163093D3;
	Mon, 22 Sep 2025 13:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W+a+4OEo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7321D30C355
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 13:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758548436; cv=none; b=jXkkjDpAwX/79iPZ1ko4lCHwyZOMuYumfO17wOCVe+YfFppeeCVabE99CuWneefYlkHHGleDBd8ifFK7OR8IOyyP7ndUwTt7Qgr1ntudf4fzcfMe3koEPcT7XUV5OkJYIPTT0kruRD7pcNnnbZJVTniXmELu8TEv5tKlzMpUOio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758548436; c=relaxed/simple;
	bh=W18l6dlnqN/+Gm0bj8IXw40qPxwsbuhNnHOBiZL+6Tw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jHHNtYjKCEnkbckxkxqvFL790U6GEh6rAS0MZRTb8vUbL7MCwPXMYD2N3Fe/r6ZjoVyC5n/IMhrJBP0zeF0U4DEni8U042WY0ary4qL5qmCZ0PLG39wz4d1N9Dhu84ROybluXB+zaaQQanfUiubE4qkdEGvdOG5bEl6qcivbOS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W+a+4OEo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8v6uN027509
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 13:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+2AT5EMxitP58IXNbJIDXo
	jQbEP2a8PauiFAYiH2QX8=; b=W+a+4OEoporDROfH9L4M7QePXIZ+SB/IbqI0n/
	6apvp1Kc49RNcXEDBF7wiWAtM85oqrbq3ADNZ903j9sQ+e1RONh2wge9BIPfzLgT
	O4yP/1EHTUls7DanG8wkOxWKdXPiuNTlKcGD8WZeAx7RStwO429I/uWFyTH+mHmS
	JIprWeH36O7f1J7SFNkc8NRpKZDPRih6vR2MjbjkooMWRut+ILfti1MlZbbCUu9V
	Tpi+OpduA37UxNnDjCy+PzO9aKOKQLUVrU4gqTxL2AvqEB3Y9Xl5sKoZyF8sghAZ
	g/7hQ3ls8wPnNneZSq8FqenWEvmHVEnsb9y2bJHObUEreIZg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kkhmxrb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 13:40:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32eb18b5500so6990805a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 06:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758548431; x=1759153231;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+2AT5EMxitP58IXNbJIDXojQbEP2a8PauiFAYiH2QX8=;
        b=YGEIphUWyc61npACLbX66fHLcliNpus737DmTzb2oWTOuvK1aoDX/rxn1Rgbb0q+1J
         9RHsOr2WYdRrV3FncZ7FxEi9xic1bYRmJnNZPIgqwmsFwLq87pbesrQ/8YUjpnqTkW30
         mFzu6Bv1VHnsS8Gt54uBbpQr/9jVIFJChLAhg48Ds4OywU0tL+NldZwsxPiEgg8mBLUR
         ZkMNBL9zxKgmu3K28fJffWA0GlcedY7WaAs1gB2uLxxzKXVum3qlKAiwKZizuaOMu2WJ
         KyZKakKXupesDjYX4m7rgZ+UViBFdPHFhS+EryJaUFg7QB4ceZZYei9I6sfCljhQMwDj
         /Esw==
X-Forwarded-Encrypted: i=1; AJvYcCWuxk350FfAkUMMpoMebTUZm+sZqy5QAAPj43fTr3Q5g0dJN9XnEXAllctXw/7nkeQl/TxjNvUj8oFCaW7S@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz8JnBXfm0atnwzpAKBvEtzWpZzeCTfwwZvu+X+RvuBTqxBHiu
	vYg2N6acfc9Gd9nkVsuAf5ULaqI8jlXJ0pdUGhKfPbIY5Ho7bqA56I1g1DBjtsoK+3MQvuDOySX
	mr7XA877kyipq6cYJI2ERint20GOijc3Igow+GsBSkeEyJNCb0xKtIxlAvyxLpfxIh7qx
X-Gm-Gg: ASbGncthfmQGpRw4Rcd7p8rSbiuUt4s+nTO3so+EqWlkpmSXrPq2758UhpZ+dWlIYcW
	/QauAFpJrSxMtT5pKh5qg/3o9H78dfVRp/mG3uTrCANWYwgVtMICs2kIRF5R6ZnuoUWaDuMIDHP
	hVFX5ofdwU7AusGaf8RnrLfsPTbHnfpgb7NlUEp6luageT9a47h7VqKZhn5CTE/4klUqrIJX/Qh
	oFsYbkewG1lqRGS2CIcxd38/lZBWFozOlz5iwQVctf8af/P+E64hGFJbIPwhXs5gleJD67DC77V
	N37UNEplfdA60nb/S/bZfdGVa6V+g4Cte2xbPs761USoagAnKzVfK8V2/9vVAAz5QO3ebDCrhy8
	w
X-Received: by 2002:a17:902:fc46:b0:24c:92b5:2175 with SMTP id d9443c01a7336-269ba480055mr189262485ad.24.1758548431257;
        Mon, 22 Sep 2025 06:40:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9JpAX777kuKZiJwVCCYPUVUOqS+4K8F6Jh6jNIfQVeDpAgeGl1P4tlTCU2TT0pPXuzHNEQA==
X-Received: by 2002:a17:902:fc46:b0:24c:92b5:2175 with SMTP id d9443c01a7336-269ba480055mr189261005ad.24.1758548430096;
        Mon, 22 Sep 2025 06:40:30 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016c13asm134246755ad.46.2025.09.22.06.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 06:40:29 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Subject: [PATCH v15 00/14] Implement vendor resets for PSCI SYSTEM_RESET2
Date: Mon, 22 Sep 2025 19:10:10 +0530
Message-Id: <20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALpR0WgC/53P22rDMAwG4FcpuZ6LLdm106u9xxjDB2U1LHFnZ
 2Gl5N3nlMECWyHsRiCBvl+6NoVypNIcd9cm0xRLTENthHrYNf5kh1diMdRBAxwU17xlNvfsXHx
 k5VJG6l8yFRqBTTSElFkml9JYmDx4w7mUtvNdU61zpi5+3oKenmt/imVM+XLLnQRfxt8Rgm+Mq
 GuMM9JaojaIQfrHVMr+/cO++dT3+1qW5H+pDgI6Y8CRUb/V5YFJiPXRejMvKh86JHAgDHq8x8O
 KB7GZh8ob7axH8hKA7vG45rdfj5U/OBMAUSjTmnu8/OGNUJt5WXnUAdpOtda39g9+nucv1ujNw
 LYCAAA=
X-Change-ID: 20250709-arm-psci-system_reset2-vendor-reboots-46c80044afcf
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758548419; l=15978;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=W18l6dlnqN/+Gm0bj8IXw40qPxwsbuhNnHOBiZL+6Tw=;
 b=B/j5UJ0bj4ie8P09hpQgu8kuGQsX+q6q0dBRvtu6KZ5e/2DXXasjC4I3ldx1JQFgBKk2tZXeA
 bgUkGXvdcjaBvZBr3xQj2kc5useTnIIWFNcbSptVDQJjUonQsPK5mYg
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: O0dcfvJapT67yEu0ENg-Dac40jx97PDx
X-Proofpoint-GUID: O0dcfvJapT67yEu0ENg-Dac40jx97PDx
X-Authority-Analysis: v=2.4 cv=JMo7s9Kb c=1 sm=1 tr=0 ts=68d151d1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=Q-fNiiVtAAAA:8 a=vHTdaABNch53pXtT-hsA:9
 a=BVuyAunXjfEx3-9X:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyMiBTYWx0ZWRfX5248S+6vUbbF
 LALpnyzvPo/jlxyKpXNvYCRRjZ1X+dKfP38feWmkOirnZZAjRA/I+6EN3mCusOUq/g2kOUtmxzv
 x4JT38ik5LptzspqFuXeDPmeOEqTP/wG1EiQXjQiaYSrrdB2/7K2+sg+HGTkLAHBhPKvJliJJCa
 iGyN+cQAQHeShwInX/qf6pvEtg5RJj0/6f9NfU2VkKLaXpZL9i3XgZ4mlmUuz2nx9vC660i0VfV
 pbDg1qmlVDCTbgSSFnmHbzIbk87EuiLgZlKN6mAWR93ygLbe8RXVwrRhATo4riNS8R72OTTxye5
 RwD2jooun/C5F4dkArvg14QTiNuFokDEmoIT+Mkgk/1SEMsYwFPmBQoSkq5Udxx19HG06JESW1y
 lL9MdanS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200022

The PSCI SYSTEM_RESET2 call allows vendor firmware to define
additional reset types which could be mapped to the reboot
argument.

User-space should be able to reboot a device into different
operational boot-states supported by underlying bootloader and
firmware. Generally, some HW registers need to be written, based
on which the bootloader and firmware decide the next boot state
of device, after the reset. For example, a requirement on
Qualcomm platforms may state that reboot with "bootloader"
command, should reboot the device into bootloader flashing mode
and reboot with “edl” command, should reboot the device into an
Emergency flashing mode.  Setting up such reboots on Qualcomm
devices can be inconsistent across SoC platforms and may require
setting different HW registers, where some of these registers may
not be accessible to HLOS. These knobs evolve over product
generations and require more drivers.  PSCI defines a
vendor-specific reset in SYSTEM_RESET2 spec, which enables the
firmware to take care of underlying setting for any such
supported vendor-specific reboot. Qualcomm firmwares are
beginning to support and expose PSCI SYSTEM_RESET2
vendor-specific reset types to simplify driver requirements from
Linux. With such support added in the firmware, we now need a
Linux interface which can make use of the firmware calls for PSCI
vendor-specific resets. This will align such reboot requirement
across platforms and vendors.

The current psci driver supports two types of resets –
SYSTEM_RESET2 Arch warm-reset and SYSTEM_RESET cold-reset. The
patchset introduces the PSCI SYSTEM_RESET2 vendor-specific reset
into the reset path of the psci driver and aligns it to work with
reboot system call - LINUX_REBOOT_CMD_RESTART2, when used along
with a supported string-based command in “*arg”.

The patchset uses reboot-mode based commands, to define the
supported vendor reset-types commands in psci device tree node
and registers these commands with the reboot-mode framework.

The PSCI vendor-specific reset takes two arguments, being,
reset_type and cookie as defined by the spec. To accommodate this
requirement, enhance the reboot-mode framework to support two
32-bit arguments by switching to 64-bit magic values.

Along this line, the patchset also extends the reboot-mode
framework to add a non-device-based registration function, which
will allow drivers to register using device tree node, while
keeping backward compatibility for existing users of reboot-mode.
This will enable psci driver to register for reboot-mode and
implement a write function, which will save the magic and then
use it in psci reset path to make a vendor-specific reset call
into the firmware. In addition, the patchset will expose a sysfs
entry interface within reboot-mode which can be used by userspace
to view the supported reboot-mode commands.

The list of vendor-specific reset commands remains open due to
divergent requirements across vendors, but this can be
streamlined and standardized through dedicated device tree
bindings.

Currently three drivers register with reboot-mode framework -
syscon-reboot-mode, nvmem-reboot-mode and qcom-pon. Consolidated
list of commands currently added across various vendor DTs:
 mode-loader
 mode-normal
 mode-bootloader
 mode-charge
 mode-fastboot
 mode-reboot-ab-update
 mode-recovery
 mode-rescue
 mode-shutdown-thermal
 mode-shutdown-thermal-battery

On gs101 we also pass kernel-generated modes from kernel_restart()
or panic(), specifically DM verity's 'dm-verity device corrupted':
	mode-dm-verity-device-corrupted = <0x50>;

- thanks Andre' for providing this.

Detailed list of commands being used by syscon-reboot-mode:
    arm64/boot/dts/exynos/exynosautov9.dtsi:
	mode-bootloader = <EXYNOSAUTOV9_BOOT_BOOTLOADER>;
	mode-fastboot = <EXYNOSAUTOV9_BOOT_FASTBOOT>;
	mode-recovery = <EXYNOSAUTOV9_BOOT_RECOVERY>;

    arm64/boot/dts/exynos/google/gs101.dtsi:
    	mode-bootloader = <0xfc>;
    	mode-charge = <0x0a>;
    	mode-fastboot = <0xfa>;
    	mode-reboot-ab-update = <0x52>;
    	mode-recovery = <0xff>;
    	mode-rescue = <0xf9>;
    	mode-shutdown-thermal = <0x51>;
    	mode-shutdown-thermal-battery = <0x51>;

    arm64/boot/dts/hisilicon/hi3660-hikey960.dts:
    	mode-normal = <0x77665501>;
    	mode-bootloader = <0x77665500>;
    	mode-recovery = <0x77665502>;

    arm64/boot/dts/hisilicon/hi6220-hikey.dts:
    	mode-normal = <0x77665501>;
    	mode-bootloader = <0x77665500>;
    	mode-recovery = <0x77665502>;

    arm64/boot/dts/rockchip/px30.dtsi:
    	mode-bootloader = <BOOT_BL_DOWNLOAD>;
    	mode-fastboot = <BOOT_FASTBOOT>;
    	mode-loader = <BOOT_BL_DOWNLOAD>;
    	mode-normal = <BOOT_NORMAL>;
    	mode-recovery = <BOOT_RECOVERY>;

    arm64/boot/dts/rockchip/rk3308.dtsi:
    	mode-bootloader = <BOOT_BL_DOWNLOAD>;
    	mode-loader = <BOOT_BL_DOWNLOAD>;
    	mode-normal = <BOOT_NORMAL>;
    	mode-recovery = <BOOT_RECOVERY>;
    	mode-fastboot = <BOOT_FASTBOOT>;

    arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dts:
    	mode-normal = <BOOT_NORMAL>;
    	mode-loader = <BOOT_BL_DOWNLOAD>;
			mode-recovery = <BOOT_RECOVERY>;
			mode-bootloader = <BOOT_FASTBOOT>;

Detailed list of commands being used by nvmem-reboot-mode:
    arm64/boot/dts/qcom/pmXXXX.dtsi:(multiple qcom DTs)
			mode-recovery = <0x01>;
			mode-bootloader = <0x02>;

The patch is tested on rb3Gen2, lemans-ride, lemans-evk, monaco-ride.

Previous discussions around SYSTEM_RESET2:
- https://lore.kernel.org/lkml/20230724223057.1208122-2-quic_eberman@quicinc.com/T/
- https://lore.kernel.org/all/4a679542-b48d-7e11-f33a-63535a5c68cb@quicinc.com/

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Tested-by: Florian Fainelli <florian.fainelli@broadcom.com> # On ARCH_BRCMSTB
Tested-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com> # IPQ5424-RDP466

Changes in v15:
By Sebastian:
  power: reset: reboot-mode: Synchronize list traversal
   - Change mutex locking to scoped_guard() and a Fixes: tag
  power: reset: reboot-mode: Add device tree node-based registration
   - Change reboot_mode_register external call to use fwnode
  power: reset: reboot-mode: Expose sysfs for registered reboot_modes
   - Use sysfs_emit_at for printing sysfs entries
   - Add driver_name to struct reboot_mode_driver instead of passing
     as argument
   - Update reboot_mode_register, devm_reboot_mode_register and
     create_reboot_mode_device for same.
  firmware: psci: Implement vendor-specific resets as reboot-mode
   - Update psci to use updated reboot_mode_register and store driver_name
     to struct reboot_mode_driver
- Add DT nodes for PSCI SYSTEM_RESET2 types for lemans-evk, qcs8300-ride,
  monaco-evk and qcs615-ride boards.
- Link to v14: https://lore.kernel.org/r/20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com

Changes in v14:
- mode-dm-verity-device-corrupted documented in cover letter -by André
 ABI Documentation:
- Updated KernelVersion in ABI documentation to reflect base commit
  version. – by André
- Revised ABI documentation to clarify space-separated format for
  supported reboot-mode commands. – by André
 power: reset: reboot-mode: Expose sysfs patch
- Modified `show_modes` to output a space-separated list of supported
  reboot modes – by André
- Added error handling in `create_reboot_mode_device()` to ensure
  proper cleanup on failure.
 firmware: psci:
- Locate psci/reboot-mode node using psci compatible. - by Krzysztof,
  Dmitry, Sudeep.
- Added error handling for additional code for compatible.
- Converted hex values to lowercase for consistency. – by André
- Introduced panic notifier to disable valid vendor-reset flag in
  panic path. – by André
- Added check for `psci_system_reset2` before registering vendor reset
  commands.
- Updated Commit text.
 dts: sa8775p:
- DT file name changed from sa8775p to lemans and commit text updated
  accordingly. – for dt renaming in base commit (sa8775p to lemans).
- Link to v13: https://lore.kernel.org/r/20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com

Changes in v13:
- Split patch1 into two (Synchronize list traversal and DT node-based
  registration) - by Dmitry.
- Move mutex lock inside get_reboot_mode_magic - by Dmitry.
- Reorder the patches – pull patch8 for exposing reboot-mode sysfs before
  psci patch - to align the change in reboot-mode sysfs patch.
- Update patch- reboot-mode: Expose sysfs for registered reboot_modes
     - Introduce a driver_name in reboot_mode_register. This will be used
       in sysfs creation  -  by Arnd.
     - Update documentation and commit text for above.
     - Fix release function to properly call delete attr file.
     - Fix sparse warning for devres_find.
     - Add error handling for devres_find.
- Split ABI documentation as a separate patch and update ABI documentation
  for usage of driver-name in sysfs - by Arnd
- Update patch - psci: Implement vendor-specific resets as reboot-mode
     - Fix Kconfig for CONFIG related warning.
     - Add driver_name as "psci" in register call to reboot-mode - by Arnd
- Link to v12: https://lore.kernel.org/r/20250721-arm-psci-system_reset2-vendor-reboots-v12-0-87bac3ec422e@oss.qualcomm.com

Changes in v12:
- Added lock for list traversals in reboot-mode - by Dmitry.
- Added proper handling for BE and LE cases in reboot-mode - by Dmitry.
- Removed type casting for u64 to u32 conversions. Added limit checks
  and used bitwise operations for same - by Andrew.
- Link to v11: https://lore.kernel.org/r/20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com

Changes in v11:
- Remove reference of cookie in reboot-mode – Arnd/Rob
- Introduce 64-bit magic in reboot-mode to accommodate two 32-bit
  arguments – Arnd
- Change reset-type to reboot-mode in psci device tree binding – Arnd
	- binding no more mandates two arguments as in v10.
	- dt changes done to support this binding.
- Remove obvious comments in psci reset path – Konrad
- Merge sysfs and ABI doc into single patch.
- Fix compilation issue on X86 configs.
- Fix warnings for pr_fmt.
- Link to v10: https://lore.kernel.org/all/569f154d-c714-1714-b898-83a42a38771c@oss.qualcomm.com/

Changes in V10:
- Change in reset-type binding to make cookie as a mandatory
  argument.
- Change reboot-mode binding to support additional argument
  "cookie".
 From Lorenzo:
- Use reboot-mode framework for implementing vendor-resets.
- Modify reboot-mode framework to support two arguments
  (magic and cookie).
- Expose sysfs for supported reboot-modes commands.
- List out all existing reboot-mode commands and their users.
   - Added this to cover letter.
 From Dmitry:
- Modify reboot-mode to support non-device based registration.
- Modify reboot-mode to create a class and device to expose
  sysfs interface.
- Link to v9: https://lore.kernel.org/all/20250303-arm-psci-system_reset2-vendor-reboots-v9-0-b2cf4a20feda@oss.qualcomm.com/

Changes in v9:
- Don't fallback to architecturally defined resets from Lorenzo.
- Link to v8: https://lore.kernel.org/r/20241107-arm-psci-system_reset2-vendor-reboots-v8-0-e8715fa65cb5@quicinc.com

Changes in v8:
- Code style nits from Stephen
- Add rb3gen2
- Link to v7: https://lore.kernel.org/r/20241028-arm-psci-system_reset2-vendor-reboots-v7-0-a4c40b0ebc54@quicinc.com

Changes in v7:
- Code style nits from Stephen
- Dropped unnecessary hunk from the sa8775p-ride patch
- Link to v6: https://lore.kernel.org/r/20241018-arm-psci-system_reset2-vendor-reboots-v6-0-50cbe88b0a24@quicinc.com

Changes in v6:
- Rebase to v6.11 and fix trivial conflicts in qcm6490-idp
- Add sa8775p-ride support (same as qcm6490-idp)
- Link to v5: https://lore.kernel.org/r/20240617-arm-psci-system_reset2-vendor-reboots-v5-0-086950f650c8@quicinc.com

Changes in v5:
- Drop the nested "items" in prep for future dtschema tools
- Link to v4: https://lore.kernel.org/r/20240611-arm-psci-system_reset2-vendor-reboots-v4-0-98f55aa74ae8@quicinc.com

Changes in v4:
- Change mode- properties from uint32-matrix to uint32-array
- Restructure the reset-types node so only the restriction is in the
  if/then schemas and not the entire definition
- Link to v3: https://lore.kernel.org/r/20240515-arm-psci-system_reset2-vendor-reboots-v3-0-16dd4f9c0ab4@quicinc.com

Changes in v3:
- Limit outer number of items to 1 for mode-* properties
- Move the reboot-mode for psci under a subnode "reset-types"
- Fix the DT node in qcm6490-idp so it doesn't overwrite the one from
  sc7820.dtsi
- Link to v2: https://lore.kernel.org/r/20240414-arm-psci-system_reset2-vendor-reboots-v2-0-da9a055a648f@quicinc.com

Changes in v2:
- Fixes to schema as suggested by Rob and Krzysztof
- Add qcm6490 idp as first Qualcomm device to support
- Link to v1: https://lore.kernel.org/r/20231117-arm-psci-system_reset2-vendor-reboots-v1-0-03c4612153e2@quicinc.com

Changes in v1:
- Reference reboot-mode bindings as suggeted by Rob.
- Link to RFC: https://lore.kernel.org/r/20231030-arm-psci-system_reset2-vendor-reboots-v1-0-dcdd63352ad1@quicinc.com

---
Elliot Berman (4):
      dt-bindings: arm: Document reboot mode magic
      arm64: dts: qcom: qcm6490-idp: Add PSCI SYSTEM_RESET2 types
      arm64: dts: qcom: qcs6490-rb3gen2: Add PSCI SYSTEM_RESET2 types
      arm64: dts: qcom: lemans-ride: Add PSCI SYSTEM_RESET2 types

Shivendra Pratap (9):
      power: reset: reboot-mode: Synchronize list traversal
      power: reset: reboot-mode: Add device tree node-based registration
      power: reset: reboot-mode: Add support for 64 bit magic
      Documentation: ABI: Add sysfs-class-reboot-mode-reboot_modes
      power: reset: reboot-mode: Expose sysfs for registered reboot_modes
      firmware: psci: Implement vendor-specific resets as reboot-mode
      arm64: dts: qcom: lemans-evk: Add PSCI SYSTEM_RESET2 types
      arm64: dts: qcom: qcs8300-ride: Add PSCI SYSTEM_RESET2 types
      arm64: dts: qcom: monaco-evk: Add PSCI SYSTEM_RESET2 types

Song Xue (1):
      arm64: dts: qcom: qcs615-ride: Add PSCI SYSTEM_RESET2 types

 .../testing/sysfs-class-reboot-mode-reboot_modes   |  39 ++++
 Documentation/devicetree/bindings/arm/psci.yaml    |  43 ++++
 arch/arm64/boot/dts/qcom/lemans-evk.dts            |   7 +
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   |   7 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/monaco-evk.dts            |   7 +
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |   7 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |   7 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   7 +
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |   7 +
 arch/arm64/boot/dts/qcom/qcs8300.dtsi              |   2 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/sm6150.dtsi               |   2 +-
 drivers/firmware/psci/Kconfig                      |   2 +
 drivers/firmware/psci/psci.c                       |  89 ++++++++-
 drivers/power/reset/nvmem-reboot-mode.c            |  13 +-
 drivers/power/reset/qcom-pon.c                     |  11 +-
 drivers/power/reset/reboot-mode.c                  | 217 ++++++++++++++++-----
 drivers/power/reset/syscon-reboot-mode.c           |  11 +-
 include/linux/reboot-mode.h                        |  12 +-
 20 files changed, 426 insertions(+), 68 deletions(-)
---
base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
change-id: 20250709-arm-psci-system_reset2-vendor-reboots-46c80044afcf

Best regards,
-- 
Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>


