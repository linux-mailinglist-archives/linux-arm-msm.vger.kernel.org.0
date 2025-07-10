Return-Path: <linux-arm-msm+bounces-64322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E4DAFFDAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 11:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F28E77AE50D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 09:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA98290D94;
	Thu, 10 Jul 2025 09:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E0MRWoxp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37341EF39F
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 09:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752138997; cv=none; b=cjEVpJTciR7i1+DlcviqwA9mSr1GCXA+z201uiQO15xPL0iLLNI2JMNjSKOSmxh8MyJSNsqvBsAE7xMhZWqgQ/SVc/FSzdA8Bre2KfLhwL/BvK+Cu4cxb4VLDMs2hQhgtz3i+aepZrciG+n8WAh+2CyulQ7+iw37LOAdGbgdE+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752138997; c=relaxed/simple;
	bh=/04PbE8KzZdvLvxOjOoiOARkuVucI7qifPsmXoYHQkE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WbWqoezWS6/NzZtkmzWIU4Hh33bMV46TI7rCuwa08wUXmW6n0SMV2WpkoakGuSH3zI2CCCfbuuA8uNfff/T+zVoHVpMnL31R4t3PwX1nniKca1qYzFAvoDkdDjl4WRIOUnk0WUu9atr2viR08kI7j6ogRf4yUootL2fk6V8+Ii0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E0MRWoxp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A8edBH016807
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 09:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uXJUy9rZdcnaOTmsEO1AhC
	7sZveYMrW3FlEj7Bg7i1g=; b=E0MRWoxpQf1joZgPaUtqdhWRPmZ2+zCDsl1ug3
	0ER7CyLa1rwq3TbjjfMK/aH3ZBJd6N1vQxDxODzLywEKy3kdaOa+BUIHDDGax1p/
	qIgeVeA2ZV360UKClfWiOgbGp2bc6SbLepENuJUaNKbY9UPLAWRwiJtRPnVAsdK4
	qvvNcYTFZkDSHgjvQd6cSSASsJRJCLuKO4QQCFiEHYf1vUnvDSwh+cGNLx9AOT6r
	swl0MT4tvoLVyWt25im6k66/83DQMR6dSnmOqax7IWP7ay505iKxoNOzdH751Ocb
	pI+lsxZXzAY1Wys3q+D5VwDKsDLpFc54tmCnIwUg3HPoMQGg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbnvb3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 09:16:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235f77f86f6so8407145ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 02:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752138994; x=1752743794;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uXJUy9rZdcnaOTmsEO1AhC7sZveYMrW3FlEj7Bg7i1g=;
        b=L5ogYTrDcO1TgC5xPL8Q5hJlJcffZmXPiMxc78jxPYjafs/D/zP0kdTKArqpUa1iua
         9TYURhXv/XPud9sRN4LvTLeEyQiYuP64GlWbz5wyKv81EzuSUmWIJSaZDN+3edinK0rJ
         Ai4Lvm8Lb35Qa9wD2OqalwVDw6Z2bZRzHsSeSyMGkvs1IzFmIq5lrKBlQ4wnkrC2NM3H
         EgslBv7e3CuVcNt3b9M6UBrV8FJUhfsabJ/TInVCQwqwjjDiqQ7nmmKObiuctwOEjaKT
         UC8phmHRJ8GW8EYG4kZP5bSGdRnx8JaKR8ifDRQ6n1nuonb0BHMCddg0DLRY60Lr6olk
         PTZA==
X-Forwarded-Encrypted: i=1; AJvYcCV/eaOHGW11obtYNzOCqtfUdN+iXFDBvDyn84aSaWIf7xVEJLk9BUSic/zrJxEitwXR+ujV5KVt/AqudMK1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1ySWbPFGjoigauz5lTfX57cLSyZSOMs+QYiH8ywbxhna6WEV7
	kTO6jVThw9Kv0ct8sooYpbW+t/iVVVaZ4cgSQzpuxOeus8q/q1MLcsv5Z0HCvQrVYn+RDiVCS5k
	GiZY+buVwYJKy0orNmrrKYBcQLsKn2pQgOL7hMpj9t43gO2fol8Zq488hHjBFCQNHkTlK
X-Gm-Gg: ASbGncvWASrS3dtFQuj24lFHecZVMUnfRTYZ71IpExWwUupMNV32ugyBIxCdees49II
	t507Jf10YZXTv9h8WsPNf0tRM6JVj3aK2Vt+qOjiBWT7BziAEm6VT6Y1jggRfhsk/2XvBr2Nm7P
	H8ZH/IiMtj/iVKmtM8hpQiAEtYodOtMGK6BPvXPR16nodsoVciQlZuGGZl00ABWpqaaChDSRaC2
	l14pyBVPrrmp657L9tvhfSNBzhjJ8TYlbKD+WHi4Ltl0zUcXHBtQ+LwWuhe2W/CRkjWLFaZs7Z/
	+yC1pumzt78HY7ka4HC4v+jN3fxkjkKfBsVSXB3TAxKLCcqEtNcgJ/qPW8g=
X-Received: by 2002:a17:903:22c4:b0:235:5d1:e366 with SMTP id d9443c01a7336-23de480acc0mr27776695ad.10.1752138993488;
        Thu, 10 Jul 2025 02:16:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqQ4sOmk8FmROvK+C7bAz5LK1QFA2VskzQKWocL2iKHG4NPqgXx/uH3vxAssNn9Alzmkvi6g==
X-Received: by 2002:a17:903:22c4:b0:235:5d1:e366 with SMTP id d9443c01a7336-23de480acc0mr27776235ad.10.1752138992968;
        Thu, 10 Jul 2025 02:16:32 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4341d51sm14837765ad.189.2025.07.10.02.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:16:32 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Subject: [PATCH v10 00/10] Implement vendor resets for PSCI SYSTEM_RESET2
Date: Thu, 10 Jul 2025 14:45:42 +0530
Message-Id: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAL6Eb2gC/42NUQ6CMBBEr0L67ZIFqkW/vIchppZFmliK3Uokh
 LtbiQfwZ5I3ycxbBFOwxOKULSLQZNn6IUGBu0yYXg93AtumQpRY7lHhEXRwMLKxwDNHctdATLG
 EiYbWBwh08z4yyIOpEaXUnelE+hoDdfa9iS5N4t5y9GHevFOB3/qnKPBPRZoBAiklK1VXVSvN2
 TPnz5d+GO9cnkI067p+ANBcWuvkAAAA
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
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Elliot Berman <elliotb317@gmail.com>
Cc: Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Andre Draszik <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
        linux-rockchip@lists.infradead.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752138982; l=10397;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=/04PbE8KzZdvLvxOjOoiOARkuVucI7qifPsmXoYHQkE=;
 b=qOcxH9g2kL6xzg29hstsumQnn7l37NJfnxSwOpNR2S2rQBPZ0k/v/Ab13/xYcukyIuKoSy63n
 Au7NHRtlpSpAwRo27kxCPO+ayBXy3NJTloYTw4UTPfAwIwsIYV0DhaD
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3OSBTYWx0ZWRfX1Vop4/hPgwt5
 0hPvVWn8OWLqMRP7Kb3kkDDGYzJ3eA/OvdLWqowgC16paQ7XLuhW8XWJzOrfZ2lRJqY3fmkfPnA
 ijH/ccYYzWiR++/2q7inA6qndY82MaH572pRiJTGvKquL9nPi54TG01fSqS0jYwVYK8bOR9N2su
 Rj5II4jj9KZnR1zmk0uwUXlvCEY6wd9fy1sacbcHZPnkABGKoZ1ccIUG7vP39UrVWgHpiLkIknD
 Oi1Q/OHOVOLM/Ilwkd505OlxWDZ2TxfAim708Q9LSMDjg1CoKaN7H7r9H+9pPxibAmUPSGz3cdD
 DdFWEgVa6BlAVLjKXkrOrrbNTSsxWyECkpS7UJvxA6h4bRAfwrH33+b9/nW61iQ4TCxcsJGXPjz
 Gmq03RMBqhRUtGLIGm01dfvP+F0uKBTtQf185t+VkV2ZGPsQPOEcWHkQaSQbXoxpGZmMsqsO
X-Authority-Analysis: v=2.4 cv=QM1oRhLL c=1 sm=1 tr=0 ts=686f84f2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=LQ4SgkHdnCmFo4IeYfsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: OFHduXcb5ghLOIVn-20DlBbqQTMdAoI9
X-Proofpoint-GUID: OFHduXcb5ghLOIVn-20DlBbqQTMdAoI9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100079

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
reset_type and cookie as defined by the spec. As the
vendor-specific reset needs two arguments reset_type and cookie
to be passes to the firmware, enhance the reboot-mode framework
to support two arguments (magic and cookie), for each reboot-mode
command, where cookie will be optional.

Along this line, the patchset also extends the reboot-mode
framework to add a non-device-based registration function which
will allow drivers to register using DT node, while keeping
backward compatibility for existing users of reboot-mode. This
will enable psci driver to register for reboot-mode and implement
a write_with_cookie function which will save the
magic(reset_type) and cookie and then use it in psci reset path
to make a vendor-specific reset call into the firmware. In
addition, the patchset will expose a sysfs entry interface within
reboot-mode which can be used by userspace to view the supported
reboot-mode commands.

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

Shivendra Pratap (6):
      power: reset: reboot-mode: Add device tree node-based registration
      dt-bindings: power: reset: Document reboot-mode cookie
      power: reset: reboot-mode: Add optional cookie argument
      firmware: psci: Implement vendor-specific reset-types as reboot-mode
      Documentation: ABI: Add sysfs-class-reboot-mode-reboot_modes
      power: reset: reboot-mode: Expose sysfs for registered arguments

 .../testing/sysfs-class-reboot-mode-reboot_modes   |  39 ++++++
 Documentation/devicetree/bindings/arm/psci.yaml    |  41 ++++++
 .../bindings/power/reset/reboot-mode.yaml          |  12 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |   7 ++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   7 ++
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi         |   7 ++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |   2 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   2 +-
 drivers/firmware/psci/Kconfig                      |   1 +
 drivers/firmware/psci/psci.c                       |  53 +++++++-
 drivers/power/reset/reboot-mode.c                  | 140 +++++++++++++++++----
 include/linux/reboot-mode.h                        |   5 +-
 12 files changed, 280 insertions(+), 36 deletions(-)
---
base-commit: 58ba80c4740212c29a1cf9b48f588e60a7612209
change-id: 20250709-arm-psci-system_reset2-vendor-reboots-46c80044afcf

Best regards,
-- 
Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>


