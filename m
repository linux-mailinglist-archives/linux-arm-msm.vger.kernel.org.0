Return-Path: <linux-arm-msm+bounces-87189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFA6CEE305
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 11:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 430813007CBA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 10:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E451DFF7;
	Fri,  2 Jan 2026 10:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NKwyQmfX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VHtAUDau"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2FA1E7660
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 10:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767350808; cv=none; b=Q3ZLUQ6FACximP9IjZkCVHsRsW4IhnCyYNk6Iungmxo/jGCXJbRsF/qTytKBvDxHdTnHzj36M4PTExqxtc93wSYH9pK3ZMwnFiq7LfiwKGP/RqMmqVkLVf76D08DeT0WAxltE/00dkGqVDmV29DP/tM2lUMjt3f5byyrw4lYd2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767350808; c=relaxed/simple;
	bh=byPxs775M0FHSMTS76KUhtXgUqOesoA1Ysp2r8axggA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hPw6qajUtXNnzySBtp2jjCSUhlWPigm2M7HvxZFhmBnglP/J++3czKM9fYLYMoKYCcY6DIzZLiWeVn+dFvFMcWwaBwgz7tqpH/Z+IFtm3yBepV2QD4a2zD+UxhMJvvp7rQV74WcWAacJGJ5GSuijZbaLlXSiiSB2qCFZIbQn9IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NKwyQmfX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VHtAUDau; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029Vxrt824311
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 10:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SLA6HXwUWOI4lMxWcZhs1YMxjq0ODiNmjOg
	Jy0ClejA=; b=NKwyQmfXTxnOJ3LZcFC0Zmj0GXXW9WbvD/nMFbxgeLFBpCHTxSJ
	2241eAjvpwNIo7sJEEFGYise87qVJeAw4u/haJkLTnBvF5Q22rnIq1JINcTDgzdK
	9ICvBpcI1t32g6/sSvnGPgNThuzF39wo+7BdyoKxNl9eH1K7SLJr28H5Q8HLwx7f
	FonlNFqmTylpEyTEv8lfjeaz5NWhUjRr/j3hdnHu6YzgbgbluQx1xmpxXebPZBuJ
	uGJdB+97pGfHXE0Dqrsy1NTxqOsU7EQ1Up9giPlQruV8/SGe74z7HK583Y/D/9sn
	YEP0mgUdvofFG+cV5qqhu5cN4NsRe/ZRRhA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd853352n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 10:46:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0f0c7a06eso244103055ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 02:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767350805; x=1767955605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SLA6HXwUWOI4lMxWcZhs1YMxjq0ODiNmjOgJy0ClejA=;
        b=VHtAUDauKBw/WeCQM1Bc1/NvTLYGswvgEysJB3n37uWRvMh5XIkZLcBAgWRpJGBCh4
         ESrtEJmpdb4OIQQC72H6lX8xGcgdMSYg5PTVFX5bSoLG9ZHv+PRWEABpjMq8Pukxt4xY
         NN120BuWTLn8I7hp8qUMrl1HqXL0CqyEudHzHmM0QurZhaWAxHGlG3LjCj1l67MQkn78
         2AA+G9NXGiBLyQFdVcVPM3UTqggaHecosfqWRm/y8cfAvVtTye567/qwVY4Y1PeZZiuh
         v9vsfKnxRyQQJpXJurHlZOXPxwd8+xoTyuxwKXCCZ90/gEkndl+oTezNfwspamLrnYKb
         A7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767350805; x=1767955605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLA6HXwUWOI4lMxWcZhs1YMxjq0ODiNmjOgJy0ClejA=;
        b=BYbkyjDr98g76f38gZx/8HchGjZQsNamseSht7jr7VN81rVw4l3ThyJYfxt1WJGfYM
         BRcZfIOKm2OlqDeMlOb5XxbjTGsG/f+OB1oFH0WUCyssz8wR/744FR+O2yxYE5avGvNM
         8MFKDpKfZVkkLXjmwqtqH3lIbKPlfKWpm+wWKnbLJRxiuvFaJAHkJolqiIgD5YP2SQSr
         TA0OnNE+BF/4dh9p3DczZPMwjuYAl4WfEoXQlxbpf4/atYYtWNCrTqXcZC89RCCDyqWO
         V3pLRRtZaYw7FvF9CdktcNi7UX/FviViibGf9IA3C4xM2cBR1yMdmYvGuIDGBGAwE1qE
         xtZA==
X-Forwarded-Encrypted: i=1; AJvYcCX1vvmMvO8ZfFat5yCXGJCiHcSqnxHEwgvwmbwv4kWzw3T0pVVpc+3ZurEHNBTO8iG+ZEcb7ktOzpZSnCJL@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0lsPYgGHwqe89W9BP5vgpjnZE+d5Rbr1k/Op2NV/w50pLnQBU
	QphceOimW1H4j5yCNR9DTcLidEUeblL6kHZm4aE0eaM1hg7O3LJhVMFxvtlgV06MIIfSkQqV7gr
	+L0l0Rzn3IuoW8xLWSj/6b4tjiTN3Oldjy3TElgOfY2uoqbJz1zdXd9rSgcbdmmCBrf2U
X-Gm-Gg: AY/fxX4/Oqdyzo89cO6mkpktdP/cF90HUL+9pQV9OxtgEBj1oYCvYvMMOeImc256fTm
	ax28XQ7AqWU9XmK9jcqhId/j4Cg7MQHBvfUwjSWXIQurDxadav43YmtJwzPl/wXYZq2GiVNvv5r
	+4pCs8nD8T46Xe3GCLsL5gx+POmt8eZDsRd0rHG/dTH8g+MtpYgRKZKpVmEPhdmbMz4jn3AJYX9
	RyInUgcw1Fhz5WajJIw/i6aPQWuRl4FUcgbMtDVxw2Bp1ffxcxeghgTRF7VWK9hdvg2UFGwPYCY
	9ZOJi+ZlZ/yywFw/yKjWlO0UzntOTA3gV9udbeCjHZvJlGJB051e8wXPK6UXB9310lqCWEqxfUX
	0OACtj5JFzknSIw3gc4KBfJEpn7qBCP4cBZ/VRgNfTJHVXcjIcqeeorEWILg2Wbf7egTRG8+QWU
	5oBfgC0cQibxTsHpv2n9bYgtaNjHSE1qtcq62iCNE=
X-Received: by 2002:a17:903:41c8:b0:2a0:ba6d:d101 with SMTP id d9443c01a7336-2a2f24248b5mr413724745ad.21.1767350805443;
        Fri, 02 Jan 2026 02:46:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECEYPGc0NcGdquQIVLMrksakbr/aT+KQfboO/IFLgYUQTem9B3/aGPXFKvvjXMTxG+8gT4Wg==
X-Received: by 2002:a17:903:41c8:b0:2a0:ba6d:d101 with SMTP id d9443c01a7336-2a2f24248b5mr413724655ad.21.1767350804958;
        Fri, 02 Jan 2026 02:46:44 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbb7sm377997115ad.59.2026.01.02.02.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 02:46:44 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: sumit.garg@kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: ipq9574: Enable eMMC variant
Date: Fri,  2 Jan 2026 16:16:38 +0530
Message-Id: <20260102104638.3802715-1-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7vr3-wUazCh0ZF4hH1gs1cftpf0prQng
X-Authority-Analysis: v=2.4 cv=fL80HJae c=1 sm=1 tr=0 ts=6957a216 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=pPiS01ZHNgX3inIG970A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 7vr3-wUazCh0ZF4hH1gs1cftpf0prQng
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA5NCBTYWx0ZWRfX1LxuSubzKRLU
 71LdW8DSolfDQU7aoXm52bzEs7N6fxwHz7gyihFkPeY9Tb1FV1bqSiHBFdjuF/reUj7hdatd5DX
 BPbLqQi6Zl7xHgOtE6gTnJDbyExxhW77nTVxwfWa2tBhtYlJz5mKK0v57QWlpwsVzPSH1+vSkOj
 wPM7TXmtR43h/Xc5bpuuj3qwN/HZluv3vgPPNkE/27IIgWBSG8g8guKO7LvIDZNOasiFC9cQLGS
 qPZvUjYXFefLxdaEBskFAjFslwTAtXPlAuZH2476Nyb4B29wOP092WPHMRmU7DyQkFMpqjsZ0u4
 6Uj59yuX9ZY40kb3bvwH3B4DlVeX+zPYE9wwGS9XaorPdsgdVdyl2l1vEcLdccAzVlbHGHIwzxw
 Imkq6asBvGKthD3q3/wUwaz0oMuHo7OR11Dx0M/IKYib5sGM4Ti3CxVM1z4XQEv52u7X1oLMD5R
 ruz1YLqSwUlCyE59lcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020094

RDP433 can have NAND or eMMC based on a board level rework. Since the
same GPIOS are used for both the interfaces, only one of them can be
used. Add a new DTS file to disable NAND and enable eMMC.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  2 +-
 .../boot/dts/qcom/ipq9574-rdp-common.dtsi     | 32 +++++++++++++++++++
 .../boot/dts/qcom/ipq9574-rdp433-emmc.dts     | 26 +++++++++++++++
 3 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f34d5ed331c..d5fe12ef4300 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -26,7 +26,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp418.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb ipq9574-rdp433-emmc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
index bdb396afb992..e4ae79b2fcd9 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
@@ -169,6 +169,38 @@ data-pins {
 			bias-disable;
 		};
 	};
+
+	sdc_default_state: sdc-default-state {
+		clk-pins {
+			pins = "gpio5";
+			function = "sdc_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cmd-pins {
+			pins = "gpio4";
+			function = "sdc_cmd";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		data-pins {
+			pins = "gpio0", "gpio1", "gpio2",
+			       "gpio3", "gpio6", "gpio7",
+			       "gpio8", "gpio9";
+			function = "sdc_data";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		rclk-pins {
+			pins = "gpio10";
+			function = "sdc_rclk";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+	};
 };
 
 &qpic_bam {
diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts
new file mode 100644
index 000000000000..ffd96b1b1c65
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * IPQ9574 RDP433 eMMC board variant device tree source
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "ipq9574-rdp433.dts"
+
+&qpic_nand {
+	status = "disabled";
+};
+
+&sdhc_1 {
+	pinctrl-0 = <&sdc_default_state>;
+	pinctrl-names = "default";
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	max-frequency = <384000000>;
+	bus-width = <8>;
+	status = "okay";
+};
-- 
2.34.1


