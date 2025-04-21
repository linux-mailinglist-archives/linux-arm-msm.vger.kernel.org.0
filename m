Return-Path: <linux-arm-msm+bounces-54895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BF3A958B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 00:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61E371697E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 22:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9718E21D59F;
	Mon, 21 Apr 2025 22:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dyd9KvN0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B4321C9E8
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 22:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745272841; cv=none; b=R3a69FItsEuRX0CeqJFJRszOnOc+Oh0QBJC7pt1UB5RBxVd9lVizGiXxu1tl3WJrw6o/SxxRmOVX5dC6DQYh+mnwwcqZKvCZmnR1FNHAze3BtzzriLj1QzSAEgelUc1sHwK9JT8u7gBO5uCIolGt0+iyoLYs4Jj/s72+LQmYSTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745272841; c=relaxed/simple;
	bh=Sw+0qUCoX6V4rIrmwTlAs/ERiC1+Xys4YK56yy0dnh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fpg4Z+zDuOXqh5QUH1y2VT3bXOumQ3utVThehZwTY645axRZ6k4pRg55CdWqonqOBVKLarUVswHWhA9gMxGxMbLEjA4Ppezpk5wOuRxrrQK/f9bw8EKYPw1xjzEA65gCSabSi+dFXb5VemilU+8Lcfp3wZm8ejv2vAaA3z+Nyrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dyd9KvN0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LK3mKn002144
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 22:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eXwFQUsAORBiHpjXO8LhW27ItfKPDqTMLumXZEfpvvY=; b=dyd9KvN0MRVoG7mS
	u5zYgw7Fz7u4CROZ0mQbELfv/boYvuGXMDTXUHR0YuoBxBXQxhCpCIVjJ9WtvfzT
	hSDyGH5obDMF4QsvKJLmObOX2QWLX0+1mRRbR4fk2fGEWYmZNNRXIt4LsYFI4kxs
	mgZlLRD7fPZVwEIIVNm4cbOae1vxu4ZotIC6ruxuPUtBsx2cAmaJOnSts/jPXcHP
	OZPRYd+vFq0rizuLibGAIdqLg3jkGoF8RPByqtp8nwzYQctt8Qmu4Z9RCwdGlFFw
	04cS0U24pJTthtp0kuE4dPwJO8RDoXSbFGZFmyUrn6F4BGSQRFjm5nfUhWCDQt5/
	U81XSw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4641hhnh3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 22:00:37 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-73720b253fcso3608946b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 15:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272836; x=1745877636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXwFQUsAORBiHpjXO8LhW27ItfKPDqTMLumXZEfpvvY=;
        b=wPWwSKBFDoMDJG7HcdVL6PDFzkMrxnYpeZCa8WNrg4ik+l+ogof5dfc1s/RZ5XRjiv
         7NPd3NDUaOOaCT4YV/Afs8Sl6hvG8VN0QjV2taoqrbUZrwFdG0s96Lm1ZnsdBUyxEcyK
         54ycuJbMWN/CrwtympzSFcjuI07P5LHOjWNJYcCEvamTK9StzPhyn5HaQMzXPOam7DFR
         qaE5/jwd+rGnD7GkHFIrzxeroqSsPUJabKl97j3hMuwrqZactU9iGS0UCDDasWoMl3Ok
         HQ0oLLiVc/RV1347RBmVd5WLdhA5mF9kPeEFTYTT8bFGW49xTMwCogRILANICkxfB5Hz
         95Hw==
X-Gm-Message-State: AOJu0YwI+9s7y56K38NCOyubzIl4BgQLmdGZbLKUqig6Cuf29f6GuiyU
	l8r/X0dJhF+oiPRVfrk/dX2VSO1IBPG7J5SSeGO1rnUih7/4MQSD7dAMRuBakzrsx1MeJi0XIWr
	NXXjIxgQwzWFYmhq4VTl2xY7miG01XuKvK9mIIOfwPaebneD/2rDsAgikaRm63CfY
X-Gm-Gg: ASbGncsUZjm1wwZr/QEFpsIS6iAQO70T6wDYQF1aC+I6sACMTUgnC8OUyVke0L4IvK9
	m4PbqLPlTHCpHYcfCGZAvYXBFLCTmZo8EDkgUDVtAI4qx/SI6lZxQ3bIPd6kYlCR45yjMkBXU3A
	nOwuYwVK8yhKmTyte63fiVCik9kaMf64iTahHiI3bEe2ssWI1dzgogcDqbh7NepYkqiIgexOsXn
	d+floLQYmYnx3kh/5zGfMZkMpsmxVmLKwNZUJqe+2bqQp1FFULrXXFz4gbDZlkdQr2HBLgtLDR/
	6z8iRuBLnZGAf5UaBntmTjv/HEZbWT34lwSKLAiIxM4/IfSTgYo1EDnlfQMHR1F7JPI=
X-Received: by 2002:a05:6a00:2e1b:b0:730:75b1:7219 with SMTP id d2e1a72fcca58-73dc14aea82mr14029974b3a.12.1745272836307;
        Mon, 21 Apr 2025 15:00:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzAwKNUlspDGqsruluUQEpQNGQ9Ez0bUuB5d2HzcuGOSgeC6Iwu6jXnTvdn4K5CI37H4OShQ==
X-Received: by 2002:a05:6a00:2e1b:b0:730:75b1:7219 with SMTP id d2e1a72fcca58-73dc14aea82mr14029917b3a.12.1745272835770;
        Mon, 21 Apr 2025 15:00:35 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c04c5sm7107917b3a.24.2025.04.21.15.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 15:00:35 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 21 Apr 2025 15:00:13 -0700
Subject: [PATCH v5 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-sm8750_usb_master-v5-6-25c79ed01d02@oss.qualcomm.com>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
In-Reply-To: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745272824; l=11817;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=lSejwJvTtArOmVHm59Z9mb4lkgk4H7ZYl+12Gv2Xb98=;
 b=p2iYUwJ+YcNCrOAM0lc0wLInxvng9T/oNvtMs1+WljfFyot43FYj+wTgbJmQW+7AaW/y4w6uZ
 edyWJKQBR1jAY3EnIxNWD5+qB6RNzz6A0PUSZ/890N9WwGnXPzMniYz
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=Fe43xI+6 c=1 sm=1 tr=0 ts=6806c005 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=SaPFg9MOAsmIOgfY5tUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6Dl4EkJj1pe5ZAplrJtJnysWJod7TUDd
X-Proofpoint-ORIG-GUID: 6Dl4EkJj1pe5ZAplrJtJnysWJod7TUDd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_10,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210173

From: Wesley Cheng <quic_wcheng@quicinc.com>

SM8750 utilizes an eUSB2 PHY from M31.  Add the initialization
sequences to bring it out of reset and into an operational state.  This
differs to the M31 USB driver, in that the M31 eUSB2 driver will
require a connection to an eUSB2 repeater.  This PHY driver will handle
the initialization of the associated eUSB2 repeater when required.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 drivers/phy/qualcomm/Kconfig              |  10 +
 drivers/phy/qualcomm/Makefile             |   1 +
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 325 ++++++++++++++++++++++++++++++
 3 files changed, 336 insertions(+)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 3cfb4c9d3d10dce49bb93b241f9b56c75b934601..5d55ed0bd198d786d31d5dbee8f32e6fbed875a9 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -167,6 +167,16 @@ config PHY_QCOM_UNIPHY_PCIE_28LP
 	  handles PHY initialization, clock management required after
 	  resetting the hardware and power management.
 
+config PHY_QCOM_M31_EUSB
+	tristate "Qualcomm M31 eUSB2 PHY driver support"
+	depends on USB && (ARCH_QCOM || COMPILE_TEST)
+	select GENERIC_PHY
+	help
+	  Enable this to support M31 EUSB2 PHY transceivers on Qualcomm
+	  chips with DWC3 USB core. It supports initializing and cleaning
+	  up of the associated USB repeater that is paired with the eUSB2
+	  PHY.
+
 config PHY_QCOM_USB_HS
 	tristate "Qualcomm USB HS PHY module"
 	depends on USB_ULPI_BUS
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index 42038bc30974a376bb2e3749d57d0518a82c35fe..4a5907816c65ec15b85e1fa5d22003ee8e2a3e97 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_PHY_QCOM_EDP)		+= phy-qcom-edp.o
 obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)	+= phy-qcom-ipq4019-usb.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
 obj-$(CONFIG_PHY_QCOM_M31_USB)		+= phy-qcom-m31.o
+obj-$(CONFIG_PHY_QCOM_M31_EUSB)		+= phy-qcom-m31-eusb2.o
 obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
 
 obj-$(CONFIG_PHY_QCOM_QMP_COMBO)	+= phy-qcom-qmp-combo.o phy-qcom-qmp-usbc.o
diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
new file mode 100644
index 0000000000000000000000000000000000000000..8746218914afbd814ca90639edd8e2cf47ff99f1
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -0,0 +1,325 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+
+#include <linux/regulator/consumer.h>
+
+#define USB_PHY_UTMI_CTRL0		(0x3c)
+#define SLEEPM				BIT(0)
+
+#define USB_PHY_UTMI_CTRL5		(0x50)
+#define POR				BIT(1)
+
+#define USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
+#define SIDDQ_SEL			BIT(1)
+#define SIDDQ				BIT(2)
+#define FSEL				GENMASK(6, 4)
+#define FSEL_38_4_MHZ_VAL		(0x6)
+
+#define USB_PHY_HS_PHY_CTRL2		(0x64)
+#define USB2_SUSPEND_N			BIT(2)
+#define USB2_SUSPEND_N_SEL		BIT(3)
+
+#define USB_PHY_CFG0			(0x94)
+#define UTMI_PHY_CMN_CTRL_OVERRIDE_EN	BIT(1)
+
+#define USB_PHY_CFG1			(0x154)
+#define PLL_EN				BIT(0)
+
+#define USB_PHY_FSEL_SEL		(0xb8)
+#define FSEL_SEL			BIT(0)
+
+#define USB_PHY_XCFGI_39_32		(0x16c)
+#define HSTX_PE				GENMASK(3, 2)
+
+#define USB_PHY_XCFGI_71_64		(0x17c)
+#define HSTX_SWING			GENMASK(3, 0)
+
+#define USB_PHY_XCFGI_31_24		(0x168)
+#define HSTX_SLEW			GENMASK(2, 0)
+
+#define USB_PHY_XCFGI_7_0		(0x15c)
+#define PLL_LOCK_TIME			GENMASK(1, 0)
+
+#define M31_EUSB_PHY_INIT_CFG(o, b, v)	\
+{				\
+	.off = o,		\
+	.mask = b,		\
+	.val = v,		\
+}
+
+struct m31_phy_tbl_entry {
+	u32 off;
+	u32 mask;
+	u32 val;
+};
+
+struct m31_eusb2_priv_data {
+	const struct m31_phy_tbl_entry	*setup_seq;
+	unsigned int			setup_seq_nregs;
+	const struct m31_phy_tbl_entry	*override_seq;
+	unsigned int			override_seq_nregs;
+	const struct m31_phy_tbl_entry	*reset_seq;
+	unsigned int			reset_seq_nregs;
+	unsigned int			fsel;
+};
+
+static const struct m31_phy_tbl_entry m31_eusb2_setup_tbl[] = {
+	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 1),
+	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL5, POR, 1),
+	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG1, PLL_EN, 1),
+	M31_EUSB_PHY_INIT_CFG(USB_PHY_FSEL_SEL, FSEL_SEL, 1),
+};
+
+static const struct m31_phy_tbl_entry m31_eusb_phy_override_tbl[] = {
+	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_39_32, HSTX_PE, 0),
+	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_71_64, HSTX_SWING, 7),
+	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_31_24, HSTX_SLEW, 0),
+	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_7_0, PLL_LOCK_TIME, 0),
+};
+
+static const struct m31_phy_tbl_entry m31_eusb_phy_reset_tbl[] = {
+	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, USB2_SUSPEND_N_SEL, 1),
+	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, USB2_SUSPEND_N, 1),
+	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL0, SLEEPM, 1),
+	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL_COMMON0, SIDDQ_SEL, 1),
+	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL_COMMON0, SIDDQ, 0),
+	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL5, POR, 0),
+	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, USB2_SUSPEND_N_SEL, 0),
+	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0),
+};
+
+static const struct regulator_bulk_data m31_eusb_phy_vregs[] = {
+	{ .supply = "vdd" },
+	{ .supply = "vdda12" },
+};
+
+#define M31_EUSB_NUM_VREGS		ARRAY_SIZE(m31_eusb_phy_vregs)
+
+struct m31eusb2_phy {
+	struct phy			 *phy;
+	void __iomem			 *base;
+	const struct m31_eusb2_priv_data *data;
+	enum phy_mode			 mode;
+
+	struct regulator_bulk_data	 *vregs;
+	struct clk			 *clk;
+	struct reset_control		 *reset;
+
+	struct phy			 *repeater;
+};
+
+static int m31eusb2_phy_write_readback(void __iomem *base, u32 offset,
+					const u32 mask, u32 val)
+{
+	u32 write_val;
+	u32 tmp;
+
+	tmp = readl_relaxed(base + offset);
+	tmp &= ~mask;
+	write_val = tmp | val;
+
+	writel_relaxed(write_val, base + offset);
+
+	tmp = readl_relaxed(base + offset);
+	tmp &= mask;
+
+	if (tmp != val) {
+		pr_err("write: %x to offset: %x FAILED\n", val, offset);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int m31eusb2_phy_write_sequence(struct m31eusb2_phy *phy,
+				       const struct m31_phy_tbl_entry *tbl,
+				       int num)
+{
+	int i;
+	int ret;
+
+	for (i = 0 ; i < num; i++, tbl++) {
+		dev_dbg(&phy->phy->dev, "Offset:%x BitMask:%x Value:%x",
+			tbl->off, tbl->mask, tbl->val);
+
+		ret = m31eusb2_phy_write_readback(phy->base,
+						   tbl->off, tbl->mask,
+						   tbl->val << __ffs(tbl->mask));
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int m31eusb2_phy_set_mode(struct phy *uphy, enum phy_mode mode, int submode)
+{
+	struct m31eusb2_phy *phy = phy_get_drvdata(uphy);
+
+	phy->mode = mode;
+
+	return phy_set_mode_ext(phy->repeater, mode, submode);
+}
+
+static int m31eusb2_phy_init(struct phy *uphy)
+{
+	struct m31eusb2_phy *phy = phy_get_drvdata(uphy);
+	const struct m31_eusb2_priv_data *data = phy->data;
+	int ret;
+
+	ret = regulator_bulk_enable(M31_EUSB_NUM_VREGS, phy->vregs);
+	if (ret) {
+		dev_err(&uphy->dev, "failed to enable regulator, %d\n", ret);
+		return ret;
+	}
+
+	ret = phy_init(phy->repeater);
+	if (ret) {
+		dev_err(&uphy->dev, "repeater init failed. %d\n", ret);
+		goto disable_vreg;
+	}
+
+	ret = clk_prepare_enable(phy->clk);
+	if (ret) {
+		dev_err(&uphy->dev, "failed to enable cfg ahb clock, %d\n", ret);
+		goto disable_repeater;
+	}
+
+	/* Perform phy reset */
+	reset_control_assert(phy->reset);
+	udelay(5);
+	reset_control_deassert(phy->reset);
+
+	m31eusb2_phy_write_sequence(phy, data->setup_seq, data->setup_seq_nregs);
+	m31eusb2_phy_write_readback(phy->base,
+				     USB_PHY_HS_PHY_CTRL_COMMON0, FSEL,
+				     FIELD_PREP(FSEL, data->fsel));
+	m31eusb2_phy_write_sequence(phy, data->override_seq, data->override_seq_nregs);
+	m31eusb2_phy_write_sequence(phy, data->reset_seq, data->reset_seq_nregs);
+
+	return 0;
+
+disable_repeater:
+	phy_exit(phy->repeater);
+disable_vreg:
+	regulator_bulk_disable(M31_EUSB_NUM_VREGS, phy->vregs);
+
+	return 0;
+}
+
+static int m31eusb2_phy_exit(struct phy *uphy)
+{
+	struct m31eusb2_phy *phy = phy_get_drvdata(uphy);
+
+	clk_disable_unprepare(phy->clk);
+	regulator_bulk_disable(M31_EUSB_NUM_VREGS, phy->vregs);
+	phy_exit(phy->repeater);
+
+	return 0;
+}
+
+static const struct phy_ops m31eusb2_phy_gen_ops = {
+	.init		= m31eusb2_phy_init,
+	.exit		= m31eusb2_phy_exit,
+	.set_mode	= m31eusb2_phy_set_mode,
+	.owner		= THIS_MODULE,
+};
+
+static int m31eusb2_phy_probe(struct platform_device *pdev)
+{
+	struct phy_provider *phy_provider;
+	const struct m31_eusb2_priv_data *data;
+	struct device *dev = &pdev->dev;
+	struct m31eusb2_phy *phy;
+	int ret;
+
+	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
+	if (!phy)
+		return -ENOMEM;
+
+	data = device_get_match_data(dev);
+	if (IS_ERR(data))
+		return -EINVAL;
+	phy->data = data;
+
+	phy->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(phy->base))
+		return PTR_ERR(phy->base);
+
+	phy->reset = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(phy->reset))
+		return PTR_ERR(phy->reset);
+
+	phy->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(phy->clk))
+		return dev_err_probe(dev, PTR_ERR(phy->clk),
+				     "failed to get clk\n");
+
+	phy->phy = devm_phy_create(dev, NULL, &m31eusb2_phy_gen_ops);
+	if (IS_ERR(phy->phy))
+		return dev_err_probe(dev, PTR_ERR(phy->phy),
+				     "failed to create phy\n");
+
+	ret = devm_regulator_bulk_get_const(dev, M31_EUSB_NUM_VREGS,
+					    m31_eusb_phy_vregs, &phy->vregs);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				"failed to get regulator supplies\n");
+
+	phy_set_drvdata(phy->phy, phy);
+
+	phy->repeater = devm_of_phy_get_by_index(dev, dev->of_node, 0);
+	if (IS_ERR(phy->repeater))
+		return dev_err_probe(dev, PTR_ERR(phy->repeater),
+				     "failed to get repeater\n");
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (!IS_ERR(phy_provider))
+		dev_info(dev, "Registered M31 USB phy\n");
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct m31_eusb2_priv_data m31_eusb_v1_data = {
+	.setup_seq = m31_eusb2_setup_tbl,
+	.setup_seq_nregs = ARRAY_SIZE(m31_eusb2_setup_tbl),
+	.override_seq = m31_eusb_phy_override_tbl,
+	.override_seq_nregs = ARRAY_SIZE(m31_eusb_phy_override_tbl),
+	.reset_seq = m31_eusb_phy_reset_tbl,
+	.reset_seq_nregs = ARRAY_SIZE(m31_eusb_phy_reset_tbl),
+	.fsel = FSEL_38_4_MHZ_VAL,
+};
+
+static const struct of_device_id m31eusb2_phy_id_table[] = {
+	{ .compatible = "qcom,sm8750-m31-eusb2-phy", .data = &m31_eusb_v1_data },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, m31eusb2_phy_id_table);
+
+static struct platform_driver m31eusb2_phy_driver = {
+	.probe = m31eusb2_phy_probe,
+	.driver = {
+		.name = "qcom-m31eusb2-phy",
+		.of_match_table = m31eusb2_phy_id_table,
+	},
+};
+
+module_platform_driver(m31eusb2_phy_driver);
+
+MODULE_AUTHOR("Wesley Cheng <quic_wcheng@quicinc.com>");
+MODULE_DESCRIPTION("eUSB2 Qualcomm M31 HSPHY driver");
+MODULE_LICENSE("GPL");

-- 
2.48.1


