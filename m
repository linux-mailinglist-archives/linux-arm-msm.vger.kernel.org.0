Return-Path: <linux-arm-msm+bounces-44387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B7BA05D5F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 14:50:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E12B13A87C8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 13:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36401FCFD9;
	Wed,  8 Jan 2025 13:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gmeK/YWK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0F41F9F5A;
	Wed,  8 Jan 2025 13:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736344109; cv=none; b=mngyLBn4LFrkNSlrs/sRPQtdmtn7HVbGgd6YPM6YpL1SbIVmK+JODSrkHbPDdzcDRBezd1TJLrqWjpuWKiLQjr4KzcVoeLiuClnFPGKIleElhjZq6+HunjuuJEN/aWInQqImSmjk6NeN/OxqoFiS+v1VtR7aZyW2c1XNCd41+d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736344109; c=relaxed/simple;
	bh=+f+nPuXmP6GKJ7yQGURtz2byhf5mVGRXASOnpEUr0gI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=JTHhtMEUdAt2jjCM9pB+dRmVvh0GZzbl0oBTG1eqbkiwD34CA5pGJrKL4lLkGzy20EEWGmWJqpJqX+GWIN4BWgc8FDnDCuFtuirViTYrONOjt26FwiKfjuwnCyMRaxsep94iD94x/sWhURlQw7dMy7zBXWcUZuKfQvslw1rkcDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gmeK/YWK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508BkS92011525;
	Wed, 8 Jan 2025 13:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	69gfZjfnwI+qXhZSefQKTjrQjz5fLExeBvynPx3+GJk=; b=gmeK/YWKhkP3PLpk
	nqLzsEGhTwNKep6XedYEgKJsKrn99yL33xmZLkNP7xRnwFZGp9T+9k2cLl474WJZ
	zrVpwx7L1Gp7NewD4TydZCNWMvXWNkHgMnvxOnBeOfmRXo+Hy21TOpQoxl+vb4RO
	bQ+M1uP3ED8EdqXKnzjcQ+1qx3NW5Bl8iwu0AVMHr07cUyXgO1tjupq+xtLtAJeV
	fUlgh2aXqfU8LnfnTbwP2FcTVLq/CvoAuGm9TppXjguxjTNnIUjnwYL+z3r584Ub
	TDOG/9rJXuNEVmhPP9aSuEIrRSWY2F4c0rKM9Ax+jH90zKt/hdcMug9n6Ed8Ap9d
	ADsOPQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441ppn0m69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 13:48:11 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508Dm9mA026727
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 13:48:09 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 Jan 2025 05:48:03 -0800
From: Luo Jie <quic_luoj@quicinc.com>
Date: Wed, 8 Jan 2025 21:47:11 +0800
Subject: [PATCH net-next v2 04/14] net: ethernet: qualcomm: Initialize PPE
 buffer management for IPQ9574
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250108-qcom_ipq_ppe-v2-4-7394dbda7199@quicinc.com>
References: <20250108-qcom_ipq_ppe-v2-0-7394dbda7199@quicinc.com>
In-Reply-To: <20250108-qcom_ipq_ppe-v2-0-7394dbda7199@quicinc.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal
	<quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>,
        "Simon
 Horman" <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Kees Cook
	<kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Philipp
 Zabel" <p.zabel@pengutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <john@phrozen.org>, Luo Jie <quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736344057; l=11509;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=+f+nPuXmP6GKJ7yQGURtz2byhf5mVGRXASOnpEUr0gI=;
 b=Z2pSZujqRGHGWdotjscsVaPjrUd6jjlm3jqAGKqwuv+GWjckkkQkORXsXdnMktz6+cq11V0bI
 xHCH2KmGRz0D8E09eVgv0yLdA8EiLyXai2Im/sNlKLbz1KEYf3dONKE
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lNBDCC3C4RgJPCfCIJdMvvQVtHN2Tr9W
X-Proofpoint-ORIG-GUID: lNBDCC3C4RgJPCfCIJdMvvQVtHN2Tr9W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501080115

The BM (Buffer Management) config controls the pause frame generated
on the PPE port. There are maximum 15 BM ports and 4 groups supported,
all BM ports are assigned to group 0 by default. The number of hardware
buffers configured for the port influence the threshold of the flow
control for that port.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/net/ethernet/qualcomm/ppe/Makefile     |   2 +-
 drivers/net/ethernet/qualcomm/ppe/ppe.c        |   5 +
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c | 193 +++++++++++++++++++++++++
 drivers/net/ethernet/qualcomm/ppe/ppe_config.h |  12 ++
 drivers/net/ethernet/qualcomm/ppe/ppe_regs.h   |  59 ++++++++
 5 files changed, 270 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qualcomm/ppe/Makefile b/drivers/net/ethernet/qualcomm/ppe/Makefile
index 63d50d3b4f2e..410a7bb54cfe 100644
--- a/drivers/net/ethernet/qualcomm/ppe/Makefile
+++ b/drivers/net/ethernet/qualcomm/ppe/Makefile
@@ -4,4 +4,4 @@
 #
 
 obj-$(CONFIG_QCOM_PPE) += qcom-ppe.o
-qcom-ppe-objs := ppe.o
+qcom-ppe-objs := ppe.o ppe_config.o
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe.c b/drivers/net/ethernet/qualcomm/ppe/ppe.c
index 4d90fcb8fa43..e8aa4eabaa7f 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe.c
@@ -15,6 +15,7 @@
 #include <linux/reset.h>
 
 #include "ppe.h"
+#include "ppe_config.h"
 
 #define PPE_PORT_MAX		8
 #define PPE_CLK_RATE		353000000
@@ -194,6 +195,10 @@ static int qcom_ppe_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "PPE clock config failed\n");
 
+	ret = ppe_hw_config(ppe_dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "PPE HW config failed\n");
+
 	platform_set_drvdata(pdev, ppe_dev);
 
 	return 0;
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
new file mode 100644
index 000000000000..848f65ef32ea
--- /dev/null
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/* PPE HW initialization configs such as BM(buffer management),
+ * QM(queue management) and scheduler configs.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/regmap.h>
+
+#include "ppe.h"
+#include "ppe_config.h"
+#include "ppe_regs.h"
+
+/**
+ * struct ppe_bm_port_config - PPE BM port configuration.
+ * @port_id_start: The fist BM port ID to configure.
+ * @port_id_end: The last BM port ID to configure.
+ * @pre_alloc: BM port dedicated buffer number.
+ * @in_fly_buf: Buffer number for receiving the packet after pause frame sent.
+ * @ceil: Ceil to generate the back pressure.
+ * @weight: Weight value.
+ * @resume_offset: Resume offset from the threshold value.
+ * @resume_ceil: Ceil to resume from the back pressure state.
+ * @dynamic: Dynamic threshold used or not.
+ *
+ * The is for configuring the threshold that impacts the port
+ * flow control.
+ */
+struct ppe_bm_port_config {
+	unsigned int port_id_start;
+	unsigned int port_id_end;
+	unsigned int pre_alloc;
+	unsigned int in_fly_buf;
+	unsigned int ceil;
+	unsigned int weight;
+	unsigned int resume_offset;
+	unsigned int resume_ceil;
+	bool dynamic;
+};
+
+/* Assign the share buffer number 1550 to group 0 by default. */
+static int ipq9574_ppe_bm_group_config = 1550;
+
+/* The buffer configurations per PPE port. There are 15 BM ports and
+ * 4 BM groups supported by PPE. BM port (0-7) is for EDMA port 0,
+ * BM port (8-13) is for PPE physical port 1-6 and BM port 14 is for
+ * EIP port.
+ */
+static struct ppe_bm_port_config ipq9574_ppe_bm_port_config[] = {
+	{
+		/* Buffer configuration for the BM port ID 0 of EDMA. */
+		.port_id_start	= 0,
+		.port_id_end	= 0,
+		.pre_alloc	= 0,
+		.in_fly_buf	= 100,
+		.ceil		= 1146,
+		.weight		= 7,
+		.resume_offset	= 8,
+		.resume_ceil	= 0,
+		.dynamic	= true,
+	},
+	{
+		/* Buffer configuration for the BM port ID 1-7 of EDMA. */
+		.port_id_start	= 1,
+		.port_id_end	= 7,
+		.pre_alloc	= 0,
+		.in_fly_buf	= 100,
+		.ceil		= 250,
+		.weight		= 4,
+		.resume_offset	= 36,
+		.resume_ceil	= 0,
+		.dynamic	= true,
+	},
+	{
+		/* Buffer configuration for the BM port ID 8-13 of PPE ports. */
+		.port_id_start	= 8,
+		.port_id_end	= 13,
+		.pre_alloc	= 0,
+		.in_fly_buf	= 128,
+		.ceil		= 250,
+		.weight		= 4,
+		.resume_offset	= 36,
+		.resume_ceil	= 0,
+		.dynamic	= true,
+	},
+	{
+		/* Buffer configuration for the BM port ID 14 of EIP. */
+		.port_id_start	= 14,
+		.port_id_end	= 14,
+		.pre_alloc	= 0,
+		.in_fly_buf	= 40,
+		.ceil		= 250,
+		.weight		= 4,
+		.resume_offset	= 36,
+		.resume_ceil	= 0,
+		.dynamic	= true,
+	},
+};
+
+static int ppe_config_bm_threshold(struct ppe_device *ppe_dev, int bm_port_id,
+				   struct ppe_bm_port_config port_cfg)
+{
+	u32 reg, val, bm_fc_val[2];
+	int ret;
+
+	/* Configure BM flow control related threshold. */
+	PPE_BM_PORT_FC_SET_WEIGHT(bm_fc_val, port_cfg.weight);
+	PPE_BM_PORT_FC_SET_RESUME_OFFSET(bm_fc_val, port_cfg.resume_offset);
+	PPE_BM_PORT_FC_SET_RESUME_THRESHOLD(bm_fc_val, port_cfg.resume_ceil);
+	PPE_BM_PORT_FC_SET_DYNAMIC(bm_fc_val, port_cfg.dynamic);
+	PPE_BM_PORT_FC_SET_REACT_LIMIT(bm_fc_val, port_cfg.in_fly_buf);
+	PPE_BM_PORT_FC_SET_PRE_ALLOC(bm_fc_val, port_cfg.pre_alloc);
+
+	/* Configure low/high bits of the ceiling for the BM port. */
+	val = FIELD_PREP(GENMASK(2, 0), port_cfg.ceil);
+	PPE_BM_PORT_FC_SET_CEILING_LOW(bm_fc_val, val);
+	val = FIELD_PREP(GENMASK(10, 3), port_cfg.ceil);
+	PPE_BM_PORT_FC_SET_CEILING_HIGH(bm_fc_val, val);
+
+	reg = PPE_BM_PORT_FC_CFG_TBL_ADDR + PPE_BM_PORT_FC_CFG_TBL_INC * bm_port_id;
+	ret = regmap_bulk_write(ppe_dev->regmap, reg,
+				bm_fc_val, ARRAY_SIZE(bm_fc_val));
+	if (ret)
+		return ret;
+
+	/* Assign the default group ID 0 to the BM port. */
+	val = FIELD_PREP(PPE_BM_PORT_GROUP_ID_SHARED_GROUP_ID, 0);
+	reg = PPE_BM_PORT_GROUP_ID_ADDR + PPE_BM_PORT_GROUP_ID_INC * bm_port_id;
+	ret = regmap_update_bits(ppe_dev->regmap, reg,
+				 PPE_BM_PORT_GROUP_ID_SHARED_GROUP_ID,
+				 val);
+	if (ret)
+		return ret;
+
+	/* Enable BM port flow control. */
+	val = FIELD_PREP(PPE_BM_PORT_FC_MODE_EN, true);
+	reg = PPE_BM_PORT_FC_MODE_ADDR + PPE_BM_PORT_FC_MODE_INC * bm_port_id;
+
+	return regmap_update_bits(ppe_dev->regmap, reg,
+				  PPE_BM_PORT_FC_MODE_EN,
+				  val);
+}
+
+/* Configure the buffer threshold for the port flow control function. */
+static int ppe_config_bm(struct ppe_device *ppe_dev)
+{
+	unsigned int i, bm_port_id, port_cfg_cnt;
+	struct ppe_bm_port_config *port_cfg;
+	u32 reg, val;
+	int ret;
+
+	/* Configure the allocated buffer number only for group 0.
+	 * The buffer number of group 1-3 is already cleared to 0
+	 * after PPE reset during the probe of PPE driver.
+	 */
+	reg = PPE_BM_SHARED_GROUP_CFG_ADDR;
+	val = FIELD_PREP(PPE_BM_SHARED_GROUP_CFG_SHARED_LIMIT,
+			 ipq9574_ppe_bm_group_config);
+	ret = regmap_update_bits(ppe_dev->regmap, reg,
+				 PPE_BM_SHARED_GROUP_CFG_SHARED_LIMIT,
+				 val);
+	if (ret)
+		goto bm_config_fail;
+
+	/* Configure buffer thresholds for the BM ports. */
+	port_cfg = ipq9574_ppe_bm_port_config;
+	port_cfg_cnt = ARRAY_SIZE(ipq9574_ppe_bm_port_config);
+	for (i = 0; i < port_cfg_cnt; i++) {
+		for (bm_port_id = port_cfg[i].port_id_start;
+		     bm_port_id <= port_cfg[i].port_id_end; bm_port_id++) {
+			ret = ppe_config_bm_threshold(ppe_dev, bm_port_id,
+						      port_cfg[i]);
+			if (ret)
+				goto bm_config_fail;
+		}
+	}
+
+	return 0;
+
+bm_config_fail:
+	dev_err(ppe_dev->dev, "PPE BM config error %d\n", ret);
+	return ret;
+}
+
+int ppe_hw_config(struct ppe_device *ppe_dev)
+{
+	return ppe_config_bm(ppe_dev);
+}
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.h b/drivers/net/ethernet/qualcomm/ppe/ppe_config.h
new file mode 100644
index 000000000000..7b2f6a71cd4c
--- /dev/null
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __PPE_CONFIG_H__
+#define __PPE_CONFIG_H__
+
+#include "ppe.h"
+
+int ppe_hw_config(struct ppe_device *ppe_dev);
+#endif
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
new file mode 100644
index 000000000000..b00f77ec45fe
--- /dev/null
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/* PPE hardware register and table declarations. */
+#ifndef __PPE_REGS_H__
+#define __PPE_REGS_H__
+
+#include <linux/bitfield.h>
+
+/* There are 15 BM ports and 4 BM groups supported by PPE.
+ * BM port (0-7) is for EDMA port 0, BM port (8-13) is for
+ * PPE physical port 1-6 and BM port 14 is for EIP port.
+ */
+#define PPE_BM_PORT_FC_MODE_ADDR		0x600100
+#define PPE_BM_PORT_FC_MODE_ENTRIES		15
+#define PPE_BM_PORT_FC_MODE_INC			0x4
+#define PPE_BM_PORT_FC_MODE_EN			BIT(0)
+
+#define PPE_BM_PORT_GROUP_ID_ADDR		0x600180
+#define PPE_BM_PORT_GROUP_ID_ENTRIES		15
+#define PPE_BM_PORT_GROUP_ID_INC		0x4
+#define PPE_BM_PORT_GROUP_ID_SHARED_GROUP_ID	GENMASK(1, 0)
+
+#define PPE_BM_SHARED_GROUP_CFG_ADDR		0x600290
+#define PPE_BM_SHARED_GROUP_CFG_ENTRIES		4
+#define PPE_BM_SHARED_GROUP_CFG_INC		0x4
+#define PPE_BM_SHARED_GROUP_CFG_SHARED_LIMIT	GENMASK(10, 0)
+
+#define PPE_BM_PORT_FC_CFG_TBL_ADDR		0x601000
+#define PPE_BM_PORT_FC_CFG_TBL_ENTRIES		15
+#define PPE_BM_PORT_FC_CFG_TBL_INC		0x10
+#define PPE_BM_PORT_FC_W0_REACT_LIMIT		GENMASK(8, 0)
+#define PPE_BM_PORT_FC_W0_RESUME_THRESHOLD	GENMASK(17, 9)
+#define PPE_BM_PORT_FC_W0_RESUME_OFFSET		GENMASK(28, 18)
+#define PPE_BM_PORT_FC_W0_CEILING_LOW		GENMASK(31, 29)
+#define PPE_BM_PORT_FC_W1_CEILING_HIGH		GENMASK(7, 0)
+#define PPE_BM_PORT_FC_W1_WEIGHT		GENMASK(10, 8)
+#define PPE_BM_PORT_FC_W1_DYNAMIC		BIT(11)
+#define PPE_BM_PORT_FC_W1_PRE_ALLOC		GENMASK(22, 12)
+
+#define PPE_BM_PORT_FC_SET_REACT_LIMIT(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_BM_PORT_FC_W0_REACT_LIMIT)
+#define PPE_BM_PORT_FC_SET_RESUME_THRESHOLD(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_BM_PORT_FC_W0_RESUME_THRESHOLD)
+#define PPE_BM_PORT_FC_SET_RESUME_OFFSET(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_BM_PORT_FC_W0_RESUME_OFFSET)
+#define PPE_BM_PORT_FC_SET_CEILING_LOW(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_BM_PORT_FC_W0_CEILING_LOW)
+#define PPE_BM_PORT_FC_SET_CEILING_HIGH(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)(tbl_cfg) + 0x1, value, PPE_BM_PORT_FC_W1_CEILING_HIGH)
+#define PPE_BM_PORT_FC_SET_WEIGHT(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)(tbl_cfg) + 0x1, value, PPE_BM_PORT_FC_W1_WEIGHT)
+#define PPE_BM_PORT_FC_SET_DYNAMIC(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)(tbl_cfg) + 0x1, value, PPE_BM_PORT_FC_W1_DYNAMIC)
+#define PPE_BM_PORT_FC_SET_PRE_ALLOC(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)(tbl_cfg) + 0x1, value, PPE_BM_PORT_FC_W1_PRE_ALLOC)
+#endif

-- 
2.34.1


