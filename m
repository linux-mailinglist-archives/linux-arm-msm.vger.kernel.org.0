Return-Path: <linux-arm-msm+bounces-77293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F025ABDC821
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 06:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA73940646A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 04:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE4CA2FF666;
	Wed, 15 Oct 2025 04:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oNQA2pX2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2AB2FE56A
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 04:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760503184; cv=none; b=NCXAqoAMw2Dhsamk5/dFWWPn6XPexF4WT03ZYutJFFevIRATXpo9XIePGCs1cPnzDQxp2BVqRMZwtNQSrb3bmPhTykj1rCZn8gFzpvTU439ozA6wDT743gnVg7chHBQ9WA6Erm5UrpoWywrxms1cW+avJ3Cy/9ix1Nxn0CYH2/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760503184; c=relaxed/simple;
	bh=mujdORVMR0YarIWF+tp2a2NDsOcx2HXXqSZCJYJwx5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VgHJox73TyBiJ2ZSnSfGYdmV1kC5I2gxNa+o/z0kqeT4ax9LigaIpFzMY+L/M2zDbPCbWK76sV8aj0SaULK7hTQ9TbtQHRJIJjqZVJP8bWOIqgJbU+kjKcVoQ93Ru5d/I9fBAkscCHehnay/4qhqcRRDjgmmpUsFpCHRxLII2Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oNQA2pX2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sUiF005327
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 04:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K+Slv6Z73CYGuBFbnhI24GFvm6YLUmIexclaD/f6th0=; b=oNQA2pX2gZel9qJD
	icgDauj7caaXue7+WVIzCwb8+WZ5TrdMIIOSEoASY7HN674SufIVV9D4IvE4+Fon
	Hvb0iMhLU3iGLyCFTWQo1dvRbgg/m21pWml2R6gtCys+DcoXTzReCl5Wy6yxC/wa
	fV585H7uzxXcSCBiRKhGF+RQ1yEuhWtmCa+7mPAYm9q7yXzbq/Pah9FxtPvk1xNd
	5NYdh9ewmfTVLDxmAAtfU/NTR/TywPxUcQa3uQUHO8qWDswSQ7p/KbuSGJmdl6G1
	/3RHkKwUFR+PJfzwwQpFjvIEUG/PbwNWN8Z1rh+56ZAkeus19c0MRRIz1S+Ynjrt
	q+sRFQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1afbng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 04:39:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32ee62ed6beso16020060a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 21:39:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760503181; x=1761107981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+Slv6Z73CYGuBFbnhI24GFvm6YLUmIexclaD/f6th0=;
        b=GNZ+sE1YoRyTi+9wkBRkWHoUb1lQd8XCtochMm9hI8DttmtfPwEmFA/mNJtlTQy5ou
         pONepR7MCJBsIfxzyx+lmtxKo46R9eNX6braCB2k25I7cH6POds5m7msZr5EumHSnY1v
         QHgZFAQy2/o8pIDGthPrJ5SNFDW7nkcVPQj9wWZoVhfr3+DDXRbWxVNlk136HZj7dWbf
         kEabMY/1uLVK9BYXpDpsGZArBVCbAlFpnh02r7zTx2BqQmjlUYjkVAClKLF2GFvJpUgz
         sGXHdM15sa3RR8DXXdNSmO07qAU/fnuK4fWz1l3RpjvgwyYWp53Zs9IWWXoHANCN5PiN
         yTxw==
X-Forwarded-Encrypted: i=1; AJvYcCVrwUhtut0A2hn+jRAmFKRR79y7brpRPMCGsOkrc0xWSvH3R+rY05asDYZ84V8evJThNWMxSvXCyqljNyN+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5tyBeCEnF/koJRIh/wMHA//a1g4e0yN/JxnjrvggOIoWjGX6A
	Nx/6KaSmylqO96kDpVeXTLqieHO3f/MMkE+RGDgEGHop11P+0r2eXjzmNhZ1kQQiSD+5OgKTq1w
	UtLPmrfwUeevOAu6O06ScF/0eoKWKg6mj/otCuxaH+Hl7EQcFxum+mFQvOvzbacJKRqU4
X-Gm-Gg: ASbGnctHkNOywsH7SE8iGBg335z919KtYlF8ikfiv290fwfbshqF8JMK9dcaTK5I/S2
	N2/dl8NmWzAfRJfamNr1KmhknHYw6E51U8snAf2a3cdkgx3kSKd1cKTP1U33TtC/WI4ywKQ0wZw
	9c+8oN/0Qlph8yqmDuuUk9it82PTBN/QxKvyruq2rqTSBqhz7Xz8nHjNlS2TKcRKnOOxUNyU+so
	6GCZevm4ONrW6V+5Sa5XPzKEXuJXijvR4VhnJhGv0WxVTxh/due2oCCWQ79aWFNCDOFGEITtvN3
	aVsxShvGIQVCSzYPIRl9qbVxtBUp+JIT31nBFPP0WnYULnRlJGxVGi0oHltgpb6QfHUbj4ZDy9C
	1
X-Received: by 2002:a17:90b:3b8d:b0:332:5349:279 with SMTP id 98e67ed59e1d1-33b51148b30mr37048924a91.3.1760503181219;
        Tue, 14 Oct 2025 21:39:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBw65NlxBKWvgcFdfd4dOvK6U24Nofemaxqj65Y+NgroOTNJyTNGRj5Csi0CXUY+t5xFilOg==
X-Received: by 2002:a17:90b:3b8d:b0:332:5349:279 with SMTP id 98e67ed59e1d1-33b51148b30mr37048876a91.3.1760503180700;
        Tue, 14 Oct 2025 21:39:40 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9787af5asm705406a91.20.2025.10.14.21.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:39:40 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 10:08:22 +0530
Subject: [PATCH v16 07/14] firmware: psci: Implement vendor-specific resets
 as reboot-mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251015-arm-psci-system_reset2-vendor-reboots-v16-7-b98aedaa23ee@oss.qualcomm.com>
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
In-Reply-To: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
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
        Umang Chheda <umang.chheda@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760503106; l=6511;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=mujdORVMR0YarIWF+tp2a2NDsOcx2HXXqSZCJYJwx5c=;
 b=p6iM2MrWS5PEsHbQ61Zs5nOtL9wTJJ1jfj/KcIZz8/n2ynAp2Pi6XLpRplO9DnBDEHSiqFwR2
 OnvsABBfO+fCnrHClY+YB8XOrU0Ut5pN5Xw74G1jKzTxY7wykeQPstd
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ef258e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1Y-8vuCXXADn_sFn8ogA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: cnxd9d8gQE2K-0Joccy2Vc4jpx8Ueiyq
X-Proofpoint-ORIG-GUID: cnxd9d8gQE2K-0Joccy2Vc4jpx8Ueiyq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfXx++e1dQn9PIs
 mdGC6Zh+9O6zBEIO5c9mzk0aeLRqsj92Ya0z1EFUbk2h9des+nR5WNSK0VG+e9/e+RV76iDXcgw
 UflNk05DVjkvLYMmjwieGWYInxxWmWq3KnigbEYYIUubuJNh/F7464rvcGc0A3OQXgsg4Sn/kUc
 aq5WdCI0Mcq2p4xeXPYQKoKaIvvzF3k/bGLdaIW7iFjNN1kbKD33PH20+GCad9BDSSgPyAmQRkL
 WrGLwqWX2/3EJWC+K01CXJhwV0WnXrVVIekvyv9xZPYlAUnkknYupa0OMVVngjZgLt9HLs2SCwb
 tW/4pX/RknzdH6GCYSdDt0Prfyvw3hd2fSpmC3VZu5QjqbrzPgFCl/U+e4VNxl1aEwGbTuLAGa+
 6w0OkR+PuQR0RsA56Q6b2CvRo5e9Og==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035

SoC vendors have different types of resets which are controlled
through various hardware registers. For instance, Qualcomm SoC
may have a requirement that reboot with “bootloader” command
should reboot the device to bootloader flashing mode and reboot
with “edl” should reboot the device into Emergency flashing mode.
Setting up such reboots on Qualcomm devices can be inconsistent
across SoC platforms and may require setting different HW
registers, where some of these registers may not be accessible to
HLOS. These knobs evolve over product generations and require
more drivers. PSCI spec defines, SYSTEM_RESET2, vendor-specific
reset which can help align this requirement. Add support for PSCI
SYSTEM_RESET2, vendor-specific resets and align the implementation
to allow user-space initiated reboots to trigger these resets.

Implement the PSCI vendor-specific resets by registering to the
reboot-mode framework. As psci init is done at early kernel init,
reboot-mode registration cannot be done at the time of psci init.
This is because reboot-mode creates a “reboot-mode” class for
exposing sysfs, which can fail at early kernel init. To overcome
this, introduce a late_initcall to register PSCI vendor-specific
resets as reboot modes. Implement a reboot-mode write function
that sets reset_type and cookie values during the reboot notifier
callback.  Introduce a firmware-based call for SYSTEM_RESET2
vendor-specific reset in the psci_sys_reset path, using
reset_type and cookie if supported by secure firmware. Register a
panic notifier and clear vendor_reset valid status during panic.
This is needed for any kernel panic that occurs post
reboot_notifiers.

By using the above implementation, userspace will be able to issue
such resets using the reboot() system call with the "*arg"
parameter as a string based command. The commands can be defined
in PSCI device tree node under “reboot-mode” and are based on the
reboot-mode based commands.

Reviewed-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
Reviewed-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/firmware/psci/Kconfig |  2 +
 drivers/firmware/psci/psci.c  | 90 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/psci/Kconfig b/drivers/firmware/psci/Kconfig
index 97944168b5e66aea1e38a7eb2d4ced8348fce64b..93ff7b071a0c364a376699733e6bc5654d56a17f 100644
--- a/drivers/firmware/psci/Kconfig
+++ b/drivers/firmware/psci/Kconfig
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config ARM_PSCI_FW
 	bool
+	select POWER_RESET
+	select REBOOT_MODE
 
 config ARM_PSCI_CHECKER
 	bool "ARM PSCI checker"
diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index 38ca190d4a22d6e7e0f06420e8478a2b0ec2fe6f..771e164d6649f15a1f8f5ba999a24f5c04110932 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -8,15 +8,18 @@
 
 #include <linux/acpi.h>
 #include <linux/arm-smccc.h>
+#include <linux/bitops.h>
 #include <linux/cpuidle.h>
 #include <linux/debugfs.h>
 #include <linux/errno.h>
 #include <linux/linkage.h>
 #include <linux/of.h>
+#include <linux/panic_notifier.h>
 #include <linux/pm.h>
 #include <linux/printk.h>
 #include <linux/psci.h>
 #include <linux/reboot.h>
+#include <linux/reboot-mode.h>
 #include <linux/slab.h>
 #include <linux/suspend.h>
 
@@ -51,6 +54,24 @@ static int resident_cpu = -1;
 struct psci_operations psci_ops;
 static enum arm_smccc_conduit psci_conduit = SMCCC_CONDUIT_NONE;
 
+struct psci_vendor_sysreset2 {
+	u32 reset_type;
+	u32 cookie;
+	bool valid;
+};
+
+static struct psci_vendor_sysreset2 vendor_reset;
+
+static int psci_panic_event(struct notifier_block *nb, unsigned long v, void *p)
+{
+	vendor_reset.valid = false;
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block psci_panic_block = {
+	.notifier_call = psci_panic_event
+};
+
 bool psci_tos_resident_on(int cpu)
 {
 	return cpu == resident_cpu;
@@ -309,7 +330,10 @@ static int get_set_conduit_method(const struct device_node *np)
 static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
 			  void *data)
 {
-	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
+	if (vendor_reset.valid && psci_system_reset2_supported) {
+		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), vendor_reset.reset_type,
+			       vendor_reset.cookie, 0);
+	} else if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
 	    psci_system_reset2_supported) {
 		/*
 		 * reset_type[31] = 0 (architectural)
@@ -547,6 +571,70 @@ static const struct platform_suspend_ops psci_suspend_ops = {
 	.enter          = psci_system_suspend_enter,
 };
 
+static int psci_set_vendor_sys_reset2(struct reboot_mode_driver *reboot, u64 magic)
+{
+	u32 magic_32;
+
+	if (psci_system_reset2_supported) {
+		magic_32 = magic & GENMASK(31, 0);
+		vendor_reset.reset_type = PSCI_1_1_RESET_TYPE_VENDOR_START | magic_32;
+		vendor_reset.cookie = (magic >> 32) & GENMASK(31, 0);
+		vendor_reset.valid = true;
+	}
+
+	return NOTIFY_DONE;
+}
+
+static int __init psci_init_vendor_reset(void)
+{
+	struct reboot_mode_driver *reboot;
+	struct device_node *psci_np;
+	struct device_node *np;
+	int ret;
+
+	if (!psci_system_reset2_supported)
+		return -EINVAL;
+
+	psci_np = of_find_compatible_node(NULL, NULL, "arm,psci-1.0");
+	if (!psci_np)
+		return -ENODEV;
+
+	np = of_find_node_by_name(psci_np, "reboot-mode");
+	if (!np) {
+		of_node_put(psci_np);
+		return -ENODEV;
+	}
+
+	ret = atomic_notifier_chain_register(&panic_notifier_list, &psci_panic_block);
+	if (ret)
+		goto err_notifier;
+
+	reboot = kzalloc(sizeof(*reboot), GFP_KERNEL);
+	if (!reboot) {
+		ret = -ENOMEM;
+		goto err_kzalloc;
+	}
+
+	reboot->write = psci_set_vendor_sys_reset2;
+	reboot->driver_name = "psci";
+
+	ret = reboot_mode_register(reboot, of_fwnode_handle(np));
+	if (ret)
+		goto err_register;
+
+	return 0;
+
+err_register:
+	kfree(reboot);
+err_kzalloc:
+	atomic_notifier_chain_unregister(&panic_notifier_list, &psci_panic_block);
+err_notifier:
+	of_node_put(psci_np);
+	of_node_put(np);
+	return ret;
+}
+late_initcall(psci_init_vendor_reset)
+
 static void __init psci_init_system_reset2(void)
 {
 	int ret;

-- 
2.34.1


