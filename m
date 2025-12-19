Return-Path: <linux-arm-msm+bounces-85918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0B6CD05F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 15:50:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB3143059BC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 14:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D2333A714;
	Fri, 19 Dec 2025 14:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="baLn9UFX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gvjOxM6V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5AC328B6F
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 14:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766155671; cv=none; b=O2mCPjAm4o8PGqb+kWMLhmXAvgn8/rkU9iUKVwCqu+aF2DuSM4OvJm4yHOkw/MWeaFzhqV7U8Dtvy4NOaXj389Xd71uWR6xHOdprYLTpIYAg39nJMr89STvdl3A4JgNfONPca6eCs6DDz2xlpU5Dln2FZRRf+D/66y9HfWteCbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766155671; c=relaxed/simple;
	bh=+v6epbEJ9lGIKWS/C4CAv+mgesmOySMOExkX9nSiO0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pU7JaGeS9LKbeZ4rb5ELDaOVUe/PGsVK3+f7ovMwUDaSGi5j0Lpi+HKPQQMxZAO0spXWcOmHNJJgf31C9IaTP0FBltoOkPFN2sPjuusq6OHsjwN3fMU8inUUBHj7GKve2gK0pfkq0z/4tAYpYac57LGJFVhSB+W7v9sVQFjm5sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=baLn9UFX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gvjOxM6V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBdDNY3700752
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 14:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C6bZcGlQ11MXnBi6clTrulclc54PhSecTf/GBKLuogw=; b=baLn9UFXo4OlV9FV
	Tpm8ofwyP9HNb5LiMhlY2gIQ9jiHjZT3mQAGcP33FbuaGLD8xJiARgA0VjOxaGoX
	D0fjS506rL65N3pHGT6m0X0VyUMsMQ34LulX7efpNwibT0auqrC9McuZGz+OIOGz
	YKlxeYxdZIwlX2+MNv94H54tEG5ypFY8C+qzcBwNdCeYhEvV6/Zbnrq5nAlYs11L
	jRDUjQf8v0Box40ytTK92+qDHxhhnuJFnSJQ1XHr5Z5pHDcsSAY+Oc2Av4GSVqw8
	3fub6HF7lvisUtFnqG9j5EzrMJFRvkAANQgUSCZ+iV2IgBuW8gD5QJP8pzyEmxTt
	keI+bQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ejx23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 14:47:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0fe4ade9eso20205185ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 06:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766155667; x=1766760467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C6bZcGlQ11MXnBi6clTrulclc54PhSecTf/GBKLuogw=;
        b=gvjOxM6VTy0bWlBRjRoNmEKln/9b5LCyTtYpCM/wMvQYBz99TbyrrMY5t924A/5YoT
         JPRK1b/mp9rMPy0HufgUdy3C+TLyG4KbbpE2Woqe2qgaO7ndrlIEg67fCX4E8H5ysGA6
         ZxMJc/0CnWrJahyPSb3aH6Z+MqLovkNEdZ23mJQ2cGNsmdvYYNfHT2U/MaAxA8ry2k6Y
         kMVNGkwmOLEgBsv4Qqefg9E6307O2E53qCmZwOykPS06XHy9GtrX4pJckThYv0mwoQ0x
         jXb55VLmjYTuAib+wn1SKso7Hgq/YCSR70u2JeVsnkTaDWfD+crkXysml57tVmivm8Kc
         zMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766155667; x=1766760467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C6bZcGlQ11MXnBi6clTrulclc54PhSecTf/GBKLuogw=;
        b=fCFNIlBzsH2eun8H7myXKDuZNdf1UvGUXBncAtbUZtd1LLPxB3To5RdCVYWGUpq3kn
         LNn47NcbHCXuwuyjo7ymhoihqUmVKeNMSUYEXXLGMITTProibbPxF/zJHFi7Z289axHx
         EgsRselLPcc8Ec+7Ab5OjOEw6I771Gvdm4lm6qROMw6rXf9CeWxzBkR6t9C6UZhJ0vTs
         kMBk40iiTQ4lo0aPz0qPuTHvrVD18tUjBUxyo/BNwXZZJ9nILqp+lMhCB1j+T943x83e
         XMxu+O+MJokyB+QSyq/tBKJf9NpAgJHgBlZvlYZx8q4K8xJm3INT4pQUURxgFl+qNFbm
         OM/g==
X-Gm-Message-State: AOJu0YzGr5sxmqoCryh+05ZbHjGa/sxIHFbnBRNtZNA1zkiwnVBDRQp2
	EGE0G+9SnHCqqmufMeEviX4In6s7EttmCACqCjZcL2FKyBXxYe/cPxK3mQhj+ZgApl/KbiorHLm
	CAeMC5ZxB7GIKh2hbIvaGreRQx/mXCgcItq7ulrVY0IWsakdBoTEslKqNBbUKpJuPcarx
X-Gm-Gg: AY/fxX6RVUM217B/kJjyIWe3qLO7MqNB59MtGKpySQYeATFCoI+zFE4a3LtM0RMbwWg
	HvdzwB5O8jF7tLmqaVUUwgjGMnnvNoIiPFnydP2hY7EeJyixyOwav2l7wLdVnLwAa9za5sL6e8Q
	y3eYpO90IBxhgBlsdaJ2IcYdWtpY0TTQa+YFPd0qPBfCrLPlOOeXrQsPKR6AhIgLSIeVpkEEhJb
	8AdI3qGwEFcOWsBiTubQB1f5fCYu+DWEeFPacUd//s/9k+0l376lttjm4ksIIZLc+wAHugcDKVo
	s6P6yDUpfZh2hvrecSPo0uYMOLNWJb8PvmusFi8l0Syv9je+PTxHO8iULH6JffZzeg6Am7ausAw
	4kqNpdhkrmUuuUx+vbpo2ahMaOCPjE53Q1SddVdRAMEGeFI9pKLmhXOakOgVeYATqSfixYTkXud
	z+Fmz+NtsgtIiZ2q52pYTR0cv2BvsTPg==
X-Received: by 2002:a17:902:f64a:b0:2a0:c5b8:24b0 with SMTP id d9443c01a7336-2a2f2a34fedmr40542765ad.46.1766155666810;
        Fri, 19 Dec 2025 06:47:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELUpr3B1JT5EdJFofw18XNapzYotJHnYxFGOrY99hUP5lr1IVp8EanEsg3tDzWl/Vq+EXIBg==
X-Received: by 2002:a17:902:f64a:b0:2a0:c5b8:24b0 with SMTP id d9443c01a7336-2a2f2a34fedmr40542325ad.46.1766155666235;
        Fri, 19 Dec 2025 06:47:46 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8286esm25433855ad.33.2025.12.19.06.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 06:47:45 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 20:16:57 +0530
Subject: [PATCH v3 4/4] arm64: dts: qcom: glymur: Enable Glymur CRD board
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-upstream_v3_glymur_introduction-v3-4-32271f1f685d@oss.qualcomm.com>
References: <20251219-upstream_v3_glymur_introduction-v3-0-32271f1f685d@oss.qualcomm.com>
In-Reply-To: <20251219-upstream_v3_glymur_introduction-v3-0-32271f1f685d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        rajendra.nayak@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766155644; l=21566;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=+v6epbEJ9lGIKWS/C4CAv+mgesmOySMOExkX9nSiO0k=;
 b=1ETc319OEXunmeNGqpOOFVg8X6AblRpjFCKFAWAxBl5AgFlmZklW4hqA5mK2PndLmTX4xDWFf
 m2vDBP+ditqD6voOxMbnX9pgmz2ZzSiF4uk49wCV0NZKw8S77XBTGEd
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-GUID: aj9MS9pV08vI9B1TnbzHAjsl03ia00Jx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyNCBTYWx0ZWRfXyUrsIsD7Ggom
 UnsymXlSnAFh2Y4HnAS4MmBXSloYvWbhJT3EueiCq3kjTuH3vWiuZWX5iF0FaQ/dWJsIDOn76Ed
 M3DKaxW3BXEtOrbPE6nfkzQEkLAhS8XmcrhhD01ywd5n+KLyHJRQjNWL5RwZtjkwUxsq12RAniF
 /d76ksvIkM6xNDBCb8JIdFLhntd5JfMviVXkQV0R2YhlLJYMNb+j3GKTxn1NMJnkiPAhPIq/PfI
 FYKXsBK/gEE8lIpPlpIrH4tFIPrO6VMDaa6XgFtyhqxwiRIBXBg6P3eTao/5y+pQiAn5sVjqeX4
 2VmALyzktzV2v1O4sOYrdNbV1urrEJ223tCoACiawhOcAu2Jv+I2c4LvMlmRD7te2TIAjMjWSto
 03clrkDjfTSjg+TBjLSKGBbIjfjh4Zu3Mb8B9X04nmuP5Ogwx2yrWJbjCBX1KYANF1AfaPFmImZ
 K6KFUuzQwVolLI/hBRw==
X-Proofpoint-ORIG-GUID: aj9MS9pV08vI9B1TnbzHAjsl03ia00Jx
X-Authority-Analysis: v=2.4 cv=EabFgfmC c=1 sm=1 tr=0 ts=69456594 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Sr3Z2WK-enE8fikEQukA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190124

Add initial device tree support for the Glymur Compute Reference
Device(CRD) board, with this board dts glymur crd can boot to shell
with rootfs on nvme and uart21 as serial console

Features enabled are:
- Regulators 0 - 4
- Power supplies and sideband signals (PERST, WAKE, CLKREQ) for
  PCIe3b/4/5/6 controllers and PHYs
- QUPv3 instances
- PMIC thermal-zone updates

Co-developed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Co-developed-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile       |   1 +
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 860 ++++++++++++++++++++++++++++++++
 2 files changed, 861 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f34d5ed331c..6ff911cca06c 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8039-t2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
new file mode 100644
index 000000000000..7c168e813f1e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -0,0 +1,860 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "glymur.dtsi"
+#include "glymur-pmics.dtsi"
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+/ {
+	model = "Qualcomm Technologies, Inc. Glymur CRD";
+	compatible = "qcom,glymur-crd", "qcom,glymur";
+
+	aliases {
+		serial0 = &uart21;
+		serial1 = &uart14;
+		i2c0 = &i2c0;
+		i2c1 = &i2c4;
+		i2c2 = &i2c5;
+		spi0 = &spi18;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			#clock-cells = <0>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&key_vol_up_default>;
+		pinctrl-names = "default";
+
+		key-volume-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pmh0101_gpios 6 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
+	vreg_nvme: regulator-nvme {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_NVME_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmh0101_gpios 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&nvme_reg_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_nvme_sec: regulator-nvme-sec {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_NVME_SEC_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmh0110_f_e1_gpios 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&nvme_sec_reg_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_wlan: regulator-wlan {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WLAN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 94 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wlan_reg_en>;
+	};
+
+	vreg_wwan: regulator-wwan {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WWAN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 246 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wwan_reg_en>;
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+	};
+
+	thermal-zones {
+		pmh0101-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmh0101_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pmcx0102-c0-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmcx0102_c_e0_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pmcx0102-d0-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmcx0102_d_e0_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pmcx0102-c1-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmcx0102_c_e1_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pmcx0102-d1-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmcx0102_d_e1_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pmh0110-f0-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmh0110_f_e0_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pmh0110-h0-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmh0110_h_e0_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pmh0110-f1-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmh0110_f_e1_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pmh0104-i0-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmh0104_i_e0_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pmh0104-j0-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmh0104_j_e0_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pmh0104-l1-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmh0104_l_e1_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+	};
+};
+
+&tlmm {
+	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
+			       <10 2>, /* OOB UART */
+			       <44 4>; /* Security SPI (TPM) */
+
+	pcie4_default: pcie4-default-state {
+		clkreq-n-pins {
+			pins = "gpio147";
+			function = "pcie4_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio146";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio148";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie5_default: pcie5-default-state {
+		clkreq-n-pins {
+			pins = "gpio153";
+			function = "pcie5_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio152";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio154";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie6_default: pcie6-default-state {
+		clkreq-n-pins {
+			pins = "gpio150";
+			function = "pcie6_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio149";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio151";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie3b_default: pcie3b-default-state {
+		clkreq-n-pins {
+			pins = "gpio156";
+			function = "pcie3b_clk";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio155";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio157";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	wlan_reg_en: wlan-reg-en-state {
+		pins = "gpio94";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	wwan_reg_en: wwan-reg-en-state {
+		pins = "gpio246";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&pmh0101_gpios {
+	key_vol_up_default: key-vol-up-default-state {
+		pins = "gpio6";
+		function = "normal";
+		output-disable;
+		bias-pull-up;
+	};
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pmh0101-rpmh-regulators";
+		qcom,pmic-id = "B_E0";
+
+		vdd-bob1-supply = <&vph_pwr>;
+		vdd-bob2-supply = <&vph_pwr>;
+		vdd-l1-l10-l15-supply = <&vreg_s9f_e0_1p9>;
+		vdd-l2-l7-l8-l9-l16-supply = <&vreg_bob1_e0>;
+		vdd-l11-l12-l18-supply = <&vreg_s7f_e0_1p32>;
+		vdd-l17-supply = <&vreg_bob2_e0>;
+
+		vreg_bob1_e0: bob1 {
+			regulator-name = "vreg_bob1_e0";
+			regulator-min-microvolt = <2200000>;
+			regulator-max-microvolt = <4224000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_bob2_e0: bob2 {
+			regulator-name = "vreg_bob2_e0";
+			regulator-min-microvolt = <2540000>;
+			regulator-max-microvolt = <3600000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l1b_e0_1p8: ldo1 {
+			regulator-name = "vreg_l1b_e0_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b_e0_2p9: ldo2 {
+			regulator-name = "vreg_l2b_e0_2p9";
+			regulator-min-microvolt = <2904000>;
+			regulator-max-microvolt = <2904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b_e0_2p79: ldo7 {
+			regulator-name = "vreg_l7b_e0_2p79";
+			regulator-min-microvolt = <2790000>;
+			regulator-max-microvolt = <2792000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8b_e0_1p50: ldo8 {
+			regulator-name = "vreg_l8b_e0_1p50";
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <1504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b_e0_2p7: ldo9 {
+			regulator-name = "vreg_l9b_e0_2p7";
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2704000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10b_e0_1p8: ldo10 {
+			regulator-name = "vreg_l10b_e0_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11b_e0_1p2: ldo11 {
+			regulator-name = "vreg_l11b_e0_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12b_e0_1p14: ldo12 {
+			regulator-name = "vreg_l12b_e0_1p14";
+			regulator-min-microvolt = <1144000>;
+			regulator-max-microvolt = <1144000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b_e0_1p8: ldo15 {
+			regulator-name = "vreg_l15b_e0_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17b_e0_2p4: ldo17 {
+			regulator-name = "vreg_l17b_e0_2p4";
+			regulator-min-microvolt = <2400000>;
+			regulator-max-microvolt = <2700000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18b_e0_1p2: ldo18 {
+			regulator-name = "vreg_l18b_e0_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pmcx0102-rpmh-regulators";
+		qcom,pmic-id = "C_E1";
+
+		vdd-l2-supply = <&vreg_s7f_e0_1p32>;
+		vdd-l1-l3-l4-supply = <&vreg_s8f_e0_0p95>;
+
+		vreg_l1c_e1_0p82: ldo1 {
+			regulator-name = "vreg_l1c_e1_0p82";
+			regulator-min-microvolt = <832000>;
+			regulator-max-microvolt = <832000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c_e1_1p14: ldo2 {
+			regulator-name = "vreg_l2c_e1_1p14";
+			regulator-min-microvolt = <1144000>;
+			regulator-max-microvolt = <1144000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c_e1_0p89: ldo3 {
+			regulator-name = "vreg_l3c_e1_0p89";
+			regulator-min-microvolt = <890000>;
+			regulator-max-microvolt = <980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4c_e1_0p72: ldo4 {
+			regulator-name = "vreg_l4c_e1_0p72";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <720000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "F_E0";
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+		vdd-s9-supply = <&vph_pwr>;
+		vdd-s10-supply = <&vph_pwr>;
+		vdd-l2-supply = <&vreg_s8f_e0_0p95>;
+		vdd-l3-supply = <&vreg_s8f_e0_0p95>;
+		vdd-l4-supply = <&vreg_s8f_e0_0p95>;
+
+		vreg_s7f_e0_1p32: smps7 {
+			regulator-name = "vreg_s7f_e0_1p32";
+			regulator-min-microvolt = <1320000>;
+			regulator-max-microvolt = <1352000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s8f_e0_0p95: smps8 {
+			regulator-name = "vreg_s8f_e0_0p95";
+			regulator-min-microvolt = <952000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s9f_e0_1p9: smps9 {
+			regulator-name = "vreg_s9f_e0_1p9";
+			regulator-min-microvolt = <1900000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2f_e0_0p82: ldo2 {
+			regulator-name = "vreg_l2f_e0_0p82";
+			regulator-min-microvolt = <832000>;
+			regulator-max-microvolt = <832000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3f_e0_0p72: ldo3 {
+			regulator-name = "vreg_l3f_e0_0p72";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <720000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4f_e0_0p3: ldo4 {
+			regulator-name = "vreg_l4f_e0_0p3";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-3 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "F_E1";
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-l1-supply = <&vreg_s8f_e0_0p95>;
+		vdd-l2-supply = <&vreg_s8f_e0_0p95>;
+		vdd-l4-supply = <&vreg_s8f_e0_0p95>;
+
+		vreg_s7f_e1_0p3: smps7 {
+			regulator-name = "vreg_s7f_e1_0p3";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1f_e1_0p82: ldo1 {
+			regulator-name = "vreg_l1f_e1_0p82";
+			regulator-min-microvolt = <832000>;
+			regulator-max-microvolt = <832000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2f_e1_0p83: ldo2 {
+			regulator-name = "vreg_l2f_e1_0p83";
+			regulator-min-microvolt = <832000>;
+			regulator-max-microvolt = <832000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4f_e1_1p08: ldo4 {
+			regulator-name = "vreg_l4f_e1_1p08";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1320000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-4 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "H_E0";
+
+		vdd-l1-supply = <&vreg_s8f_e0_0p95>;
+		vdd-l2-supply = <&vreg_s8f_e0_0p95>;
+		vdd-l3-supply = <&vreg_s9f_e0_1p9>;
+		vdd-l4-supply = <&vreg_s7f_e0_1p32>;
+
+		vreg_l1h_e0_0p89: ldo1 {
+			regulator-name = "vreg_l1h_e0_0p89";
+			regulator-min-microvolt = <832000>;
+			regulator-max-microvolt = <832000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2h_e0_0p72: ldo2 {
+			regulator-name = "vreg_l2h_e0_0p72";
+			regulator-min-microvolt = <832000>;
+			regulator-max-microvolt = <832000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3h_e0_0p32: ldo3 {
+			regulator-name = "vreg_l3h_e0_0p32";
+			regulator-min-microvolt = <320000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4h_e0_1p2: ldo4 {
+			regulator-name = "vreg_l4h_e0_1p2";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1320000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpi_dma2 {
+	status = "okay";
+};
+
+&pmk8850_rtc {
+	qcom,no-alarm;
+};
+
+&pmh0101_gpios {
+	nvme_reg_en: nvme-reg-en-state {
+		pins = "gpio14";
+		function = "normal";
+		bias-disable;
+	};
+};
+
+&qupv3_0 {
+	status = "okay";
+};
+
+&qupv3_1 {
+	status = "okay";
+};
+
+&qupv3_2 {
+	status = "okay";
+};
+
+&pmh0110_f_e1_gpios {
+	nvme_sec_reg_en: nvme-reg-en-state {
+		pins = "gpio14";
+		function = "normal";
+		bias-disable;
+	};
+};
+
+&pcie3b {
+	vddpe-3v3-supply = <&vreg_nvme_sec>;
+
+	pinctrl-0 = <&pcie3b_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie3b_phy {
+	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
+	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
+
+	status = "okay";
+};
+
+&pcie3b_port0 {
+	reset-gpios = <&tlmm 155 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 157 GPIO_ACTIVE_LOW>;
+};
+
+&pcie4 {
+	vddpe-3v3-supply = <&vreg_wlan>;
+
+	pinctrl-0 = <&pcie4_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie4_phy {
+	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
+	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};
+
+&pcie4_port0 {
+	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+};
+
+&pcie5 {
+	vddpe-3v3-supply = <&vreg_nvme>;
+
+	pinctrl-0 = <&pcie5_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie5_phy {
+	vdda-phy-supply = <&vreg_l2f_e0_0p82>;
+	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+
+	status = "okay";
+};
+
+&pcie5_port0 {
+	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+};
+
+&pcie6 {
+	vddpe-3v3-supply = <&vreg_wwan>;
+
+	pinctrl-0 = <&pcie6_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie6_phy {
+	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
+	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};
+
+&pcie6_port0 {
+	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+};

-- 
2.34.1


