Return-Path: <linux-arm-msm+bounces-65462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 410F1B08D53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 14:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CE5B560F3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 12:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EED2BE651;
	Thu, 17 Jul 2025 12:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cmno7Dh0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702E0291C26
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752756468; cv=none; b=M35ae1Sprqi1CyKvQPh69Be7WSG2NZfSDGseSsdxan453gkBeaiOs+IE2OG5X+MpgNDJCXGk0jCmnuUAZrLS2BHRkpPHMx2VgiMaosVG6k24ePrF0nkSS+8na6tzCCa8njF4qpfDWwaOqA3db8L6VDjPjDwlNfF/+XbfBhNBd4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752756468; c=relaxed/simple;
	bh=FDOpIm3JXs32+N3twwxHsuwm2o2bXbMkn/E0Mx2MyIo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hkP/+Gr7q5rgaQC75SFi+U8VLRrs0kMupHMNr1Uzr9SaxubPhnbV1oTNcgWTXqqSCPVzGP/9zSzP0lRXolIXgbFj9oXTMQVhjGcQojdmag+nhBl/FEE1ZFSH9Q7NRyu9PCnCmvLOb1WyooBHMgLS0lvFO2gBgds05zarJxJrRpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cmno7Dh0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HBXjnM028060
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LeXeukrpee7b7RMH1xIU9a
	m+NXGPwNaWHrc/G6jR6aE=; b=cmno7Dh01q1F6as0M7g3kh2DAMeuvzKoJV4LwJ
	Ggy0/n/5TjfNWW12ttWn0vfQ2HPEUX1Zk5c8oG9PCAQXYcfUzUm9YF8K1M9DmYR2
	WwP5iwapNNUqMBolK1oqhTBG7aSW9MsbIk02kNXeAISHB/xcMGqMutr/U+2FJhms
	j3BiCgYo7PUZvkQSu3E69hv0T6rUECEDXwrDuMnyWW4GivEliEzJxzNioqvg01B+
	hsm++TJgjt0khK7zGhgdBJO2Jx+kiYGNlvtK1saHLwbzdoqqV14qrnqyL7Y7X/K4
	MHI46ZPDlx3FADxzArTyI2xUblpEISgj8PARtjvPfPv+5p2w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh5ywcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:47:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3132c8437ffso1706167a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 05:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756464; x=1753361264;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LeXeukrpee7b7RMH1xIU9am+NXGPwNaWHrc/G6jR6aE=;
        b=fHJ3J3wnaefj2XBpAvDoclB0iJkPrLxxHGfz9GO/OJ3G3C3WRl7TSgAu9Pi3EgHP6n
         BlLPN4Oy+sW7OjhOT0dFF0aIGBpMtxez1+DxOcbRaEZeJwUF7l4Z8EnBbDJ3cMtuaqZJ
         SOHixFtc0Rpc2X3KEhoW7lPPkwEFb0z24sNfmHS5I0egGYv4RmX/aaqRCpsvjFJ7Ggii
         fZbwousxPDwGicLT+sezTs98nShOrrRyExMhOJVd0Go+QTkWXz0J2JaMKk37d0mmSpyD
         6hPyfqJXNIWr/EsMfKPM2xScTv+Ix89zLm+aUQwuHXjT2FQ7ytd3ImdPG2jh3C7PMvkt
         yRSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSKun3AF/RUhVRe6H/zF/Q8fYT8SEcwGko56rihakuQbgiM+2q4V/gxBT1KhDEXyzPG+18pyczTBER/C1D@vger.kernel.org
X-Gm-Message-State: AOJu0YyIIjbP6QyBz9zHaXPBVc6/RTIoBDkjXo/5dd91d1yP6nQ9y0Bf
	EEwEqh46NTm//MtNe0vSXJLo/bhV8huyBWZz+JLX/AXc/nEVadqRVL0bLhFoVBP9aJOrCnbUV8F
	2FJqp8HJNZ9anMEWhJSqfgoeyyrvAJnA+NSUsScPvoy72a4+VDFgetOUUHhp4MLPRyPae
X-Gm-Gg: ASbGnct06Wghm4AypNVzXH79l3EJKW0xVbXb6ihOTsFRlWCZXQcafY3jPxR/CKxUKji
	+utq63WrAoYWiLUcX4LVIpD2obM7JmRDTqLDR62mlzGmlmdssbPY2vzZDyYIC4FqL8Bu3dWuaRm
	lQXg+sFo9FdgIerTeqJvp1D3Y+UfYDlslVbZl9lh12PWG4f14BWsynDThHAAC+/QVsKhtPOYEP6
	K08x1Hr6xHvvkug4fovtCaZMcNAplMlI8wUF8NUVJDomPyW3NWpxwQgOe61DDE46Th1roZMN9tU
	ZnNu9GC0gxVBfHaYkVc2XSKgd8PgKCq5zLIInDioTAsXDjfDLaSoIXgbVUBk17kFcLz/GTLNhFY
	P
X-Received: by 2002:a17:90b:5485:b0:311:b0ec:135b with SMTP id 98e67ed59e1d1-31c9f47c799mr9338578a91.24.1752756464339;
        Thu, 17 Jul 2025 05:47:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1wjM33GNzk4EjXIuBxBox9zlV6x0yfPGvWiojEJ5RcfRJcqMok+3UnTg5LXDIQ6jplXko8A==
X-Received: by 2002:a17:90b:5485:b0:311:b0ec:135b with SMTP id 98e67ed59e1d1-31c9f47c799mr9338513a91.24.1752756463814;
        Thu, 17 Jul 2025 05:47:43 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31caf828a0esm1505283a91.42.2025.07.17.05.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 05:47:43 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Subject: [PATCH v11 0/8] Implement vendor resets for PSCI SYSTEM_RESET2
Date: Thu, 17 Jul 2025 18:16:46 +0530
Message-Id: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALbweGgC/52NQQ6CMBREr2K69pNSilRX3sMQA+1HmgjF/kokh
 LtbiDs3xs0kM8m8NzNCb5HYaTczj6Ml6/pY0nS/Y7qt+huCNXFggoucF/wIle9gIG2BJgrYXT0
 SBgEj9sZ58Fg7FwjkQSvOpawa3bDIGjw29rWJLmXsraXg/LR5x5Sv80eR8h8V8QYcsChkVqgsM
 1KfHVHyeFZ37bouibGa/6LWwmS1UqJGlX9Ty2VZ3lMM8Rc6AQAA
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
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752756455; l=10856;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=FDOpIm3JXs32+N3twwxHsuwm2o2bXbMkn/E0Mx2MyIo=;
 b=4WgSjy8wsL29L/NLUmave9PdcgpmmX/vkKgVK68TaF9RzVd/pcei/CkuEsdO9ODllKtS8mSOb
 v+zxWjx01lqDptfebGBU2+P6xZFi3pFqTPeCHoXYkHTxBH0nHPt2nVJ
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=6878f0f1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=6CcJ-q_IyJskFRMnly8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: eiTPQnYHoza4R7ZsOMB9me9h9oeaYDS2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDExMiBTYWx0ZWRfX/z8US+evt5aq
 6iiIvAuasNTm61F3KeX2XMM4tMTfQ77tcotKNHsHxzVc+bEgzOax2mIGVJx/osPgY/DbCmh7cgd
 mPyQTtxlUEbtBQLkP7L0xX3HOnnpjHcsBsSLW8np+lm/i+GpaH9P9bszDesCGsjnQi6V5S8i+vp
 jd/rVaJcNM57sEEcqRktpCc02rI4Lwy4ipHNJJSvPZLoTnkc3rrham4e6e54I7i0spre+0TALN2
 9njEE5QUFkY7uifXjIQW4zQmwwPRoP3VkrzJTVl+ZAZFuiqjntI5OuZlmQ8uNK6sI4ykl87tRXi
 Gl5yGFIWZo1G5H6dvdA1N9fIG+fmzGL9IRTzihZqWHDzCAFKaR2czYuBkqp5clv9VmBwaHp2YWm
 R3LLozSOxxEOgePnhLhCYxxW70DonhkO8bxrTEFUl3f4bSOyAFhybCQakABvl7Z2GmntAz3Z
X-Proofpoint-ORIG-GUID: eiTPQnYHoza4R7ZsOMB9me9h9oeaYDS2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170112

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

Previous discussions around SYSTEM_RESET2:
- https://lore.kernel.org/lkml/20230724223057.1208122-2-quic_eberman@quicinc.com/T/
- https://lore.kernel.org/all/4a679542-b48d-7e11-f33a-63535a5c68cb@quicinc.com/

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

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
      arm64: dts: qcom: sa8775p-ride: Add PSCI SYSTEM_RESET2 types

Shivendra Pratap (4):
      power: reset: reboot-mode: Add device tree node-based registration
      power: reset: reboot-mode: Add support for 64 bit magic
      firmware: psci: Implement vendor-specific resets as reboot-mode
      power: reset: reboot-mode: Expose sysfs for registered reboot_modes

 .../testing/sysfs-class-reboot-mode-reboot_modes   |  38 ++++++
 Documentation/devicetree/bindings/arm/psci.yaml    |  43 +++++++
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |   7 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   7 +
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi         |   7 +
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |   2 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   2 +-
 drivers/firmware/psci/Kconfig                      |   1 +
 drivers/firmware/psci/psci.c                       |  53 +++++++-
 drivers/power/reset/nvmem-reboot-mode.c            |   5 +-
 drivers/power/reset/qcom-pon.c                     |   5 +-
 drivers/power/reset/reboot-mode.c                  | 142 ++++++++++++++++-----
 drivers/power/reset/syscon-reboot-mode.c           |   5 +-
 include/linux/reboot-mode.h                        |   7 +-
 14 files changed, 281 insertions(+), 43 deletions(-)
---
base-commit: 024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
change-id: 20250709-arm-psci-system_reset2-vendor-reboots-46c80044afcf

Best regards,
-- 
Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>


