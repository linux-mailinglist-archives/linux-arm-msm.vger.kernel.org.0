Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4649E337BE3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 19:11:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbhCKSKg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 13:10:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230386AbhCKSKU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 13:10:20 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76737C061761
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 10:10:19 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id hs11so48177043ejc.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 10:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TS1PKnDP0m44AQ62fje0cjo8A6ijSaeGJ2jLhSPrKmg=;
        b=ppCwX3yydGqdP03+DW5fMj1maBqnhr3upYYpzhrO8/jylQpCvBxVoIFY9BDxXkWzBy
         OlWSQtMuSLBNjdUaiyFv08UiUieyvTPZ+Fr7AfuR4whTiAsxe3wjCMG1SziQ5P5/P7je
         BPYh3WiXLHij0+jsf7Oro1VnqOntT54RdquWtru5hDnFjBvUigfw+6xxUgVFhnnJR5oQ
         VbBrVc8V2BIpxrubVSLLf5ql9pnGsu46E9MD5E5wiGMQUAo3azu2PxAqzWtP1uKSsggA
         XVE27sDG7BtlZeD6Vw/XM3UzDS7h8VP1JtYYezOqRjMXJhy9ClPL8sgpEt+EP6JztQTg
         4ReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TS1PKnDP0m44AQ62fje0cjo8A6ijSaeGJ2jLhSPrKmg=;
        b=QkXiL2lA7IQuHxZmgMZwtt45FoKLcEthj3H9e7ZC0mAwNnCCf7KQ05PsS1C9f9ePJQ
         m8EoudkDdOUO+gfyK+t1fRGpWVWd4dqAnk1YW3ktLp3JNQGcSwGGiS4XyyINKCA5/O4J
         yp1HdaZ8iT04KWk+UhZu/yZblnnQtZs1m1ktuuKbJ65jBFRL3Jb4wWCGxst4kYe4mK1u
         t2y/MjRwTPsLeA1x/jEYeg69f2IpZck5K75DLvkrizr5k3rmEHkZwenvMv5x3I7qnmPO
         qKxAjCvrseCNDr2grLwlU3omFITHWJp8h96cyKlP+1EN5TEHYvt/RdQjGdB2T+ETJIwy
         URmQ==
X-Gm-Message-State: AOAM533vuvFteJhkyCzbTAL2jcCXhLV6ROS4u/MHq8j/BDMlnsgfDqnY
        qDMgUiOeggWAycryJgiBY7G2jg==
X-Google-Smtp-Source: ABdhPJwOlynwMYLg3f07vj2Cxkv0iUe+3m3ygWtRG07SdLGvIyjll0m/UNbJweTPFShLMMF1g4C3Ng==
X-Received: by 2002:a17:906:5d12:: with SMTP id g18mr4217167ejt.246.1615486218075;
        Thu, 11 Mar 2021 10:10:18 -0800 (PST)
Received: from localhost.localdomain ([2a02:2454:3e3:5f00:8e01:34c:da50:eb7e])
        by smtp.gmail.com with ESMTPSA id a22sm1741290ejr.89.2021.03.11.10.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 10:10:17 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v7 10/22] media: camss: Add support for CSID hardware version Titan 170
Date:   Thu, 11 Mar 2021 19:09:36 +0100
Message-Id: <20210311180948.268343-11-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210311180948.268343-1-robert.foss@linaro.org>
References: <20210311180948.268343-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add register definitions for version 170 of the Titan architecture
and implement support for the CSID subdevice.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---


Changes since v5:
 - Andrey: Fix test pattern selection logic
 - Andrey: Add r-b
 - Move Titan 170 specific test modes to this commit

Changes since v6:
 - Andrey: Fix off-by one in pattern list



 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../platform/qcom/camss/camss-csid-170.c      | 601 ++++++++++++++++++
 .../media/platform/qcom/camss/camss-csid.c    |   4 +
 .../media/platform/qcom/camss/camss-csid.h    |   9 +
 .../media/platform/qcom/camss/camss-vfe-170.c |   1 -
 drivers/media/platform/qcom/camss/camss.c     |  62 ++
 6 files changed, 677 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-170.c

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index cff388b653ba..0752c46ea37b 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -6,6 +6,7 @@ qcom-camss-objs += \
 		camss-csid.o \
 		camss-csid-4-1.o \
 		camss-csid-4-7.o \
+		camss-csid-170.o \
 		camss-csiphy-2ph-1-0.o \
 		camss-csiphy-3ph-1-0.o \
 		camss-csiphy.o \
diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
new file mode 100644
index 000000000000..0d508c8b2684
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -0,0 +1,601 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-csid-4-7.c
+ *
+ * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module
+ *
+ * Copyright (C) 2020 Linaro Ltd.
+ */
+#include <linux/completion.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+
+#include "camss-csid.h"
+#include "camss-csid-gen2.h"
+#include "camss.h"
+
+/* The CSID 2 IP-block is different from the others,
+ * and is of a bare-bones Lite version, with no PIX
+ * interface support. As a result of that it has an
+ * alternate register layout.
+ */
+#define IS_LITE		(csid->id == 2 ? 1 : 0)
+
+#define CSID_HW_VERSION		0x0
+#define		HW_VERSION_STEPPING	0
+#define		HW_VERSION_REVISION	16
+#define		HW_VERSION_GENERATION	28
+
+#define CSID_RST_STROBES	0x10
+#define		RST_STROBES	0
+
+#define CSID_CSI2_RX_IRQ_STATUS	0x20
+#define	CSID_CSI2_RX_IRQ_MASK	0x24
+#define CSID_CSI2_RX_IRQ_CLEAR	0x28
+
+#define CSID_CSI2_RDIN_IRQ_STATUS(rdi)		((IS_LITE ? 0x30 : 0x40) \
+						 + 0x10 * (rdi))
+#define CSID_CSI2_RDIN_IRQ_MASK(rdi)		((IS_LITE ? 0x34 : 0x44) \
+						 + 0x10 * (rdi))
+#define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)		((IS_LITE ? 0x38 : 0x48) \
+						 + 0x10 * (rdi))
+#define CSID_CSI2_RDIN_IRQ_SET(rdi)		((IS_LITE ? 0x3C : 0x4C) \
+						 + 0x10 * (rdi))
+
+#define CSID_TOP_IRQ_STATUS	0x70
+#define		TOP_IRQ_STATUS_RESET_DONE 0
+#define CSID_TOP_IRQ_MASK	0x74
+#define CSID_TOP_IRQ_CLEAR	0x78
+#define CSID_TOP_IRQ_SET	0x7C
+#define CSID_IRQ_CMD		0x80
+#define		IRQ_CMD_CLEAR	0
+#define		IRQ_CMD_SET	4
+
+#define CSID_CSI2_RX_CFG0	0x100
+#define		CSI2_RX_CFG0_NUM_ACTIVE_LANES	0
+#define		CSI2_RX_CFG0_DL0_INPUT_SEL	4
+#define		CSI2_RX_CFG0_DL1_INPUT_SEL	8
+#define		CSI2_RX_CFG0_DL2_INPUT_SEL	12
+#define		CSI2_RX_CFG0_DL3_INPUT_SEL	16
+#define		CSI2_RX_CFG0_PHY_NUM_SEL	20
+#define		CSI2_RX_CFG0_PHY_TYPE_SEL	24
+
+#define CSID_CSI2_RX_CFG1	0x104
+#define		CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN		0
+#define		CSI2_RX_CFG1_DE_SCRAMBLE_EN			1
+#define		CSI2_RX_CFG1_VC_MODE				2
+#define		CSI2_RX_CFG1_COMPLETE_STREAM_EN			4
+#define		CSI2_RX_CFG1_COMPLETE_STREAM_FRAME_TIMING	5
+#define		CSI2_RX_CFG1_MISR_EN				6
+#define		CSI2_RX_CFG1_CGC_MODE				7
+#define			CGC_MODE_DYNAMIC_GATING		0
+#define			CGC_MODE_ALWAYS_ON		1
+
+#define CSID_RDI_CFG0(rdi)			((IS_LITE ? 0x200 : 0x300) \
+						 + 0x100 * (rdi))
+#define		RDI_CFG0_BYTE_CNTR_EN		0
+#define		RDI_CFG0_FORMAT_MEASURE_EN	1
+#define		RDI_CFG0_TIMESTAMP_EN		2
+#define		RDI_CFG0_DROP_H_EN		3
+#define		RDI_CFG0_DROP_V_EN		4
+#define		RDI_CFG0_CROP_H_EN		5
+#define		RDI_CFG0_CROP_V_EN		6
+#define		RDI_CFG0_MISR_EN		7
+#define		RDI_CFG0_CGC_MODE		8
+#define			CGC_MODE_DYNAMIC	0
+#define			CGC_MODE_ALWAYS_ON	1
+#define		RDI_CFG0_PLAIN_ALIGNMENT	9
+#define			PLAIN_ALIGNMENT_LSB	0
+#define			PLAIN_ALIGNMENT_MSB	1
+#define		RDI_CFG0_PLAIN_FORMAT		10
+#define		RDI_CFG0_DECODE_FORMAT		12
+#define		RDI_CFG0_DATA_TYPE		16
+#define		RDI_CFG0_VIRTUAL_CHANNEL	22
+#define		RDI_CFG0_DT_ID			27
+#define		RDI_CFG0_EARLY_EOF_EN		29
+#define		RDI_CFG0_PACKING_FORMAT		30
+#define		RDI_CFG0_ENABLE			31
+
+#define CSID_RDI_CFG1(rdi)			((IS_LITE ? 0x204 : 0x304)\
+						+ 0x100 * (rdi))
+#define		RDI_CFG1_TIMESTAMP_STB_SEL	0
+
+#define CSID_RDI_CTRL(rdi)			((IS_LITE ? 0x208 : 0x308)\
+						+ 0x100 * (rdi))
+#define		RDI_CTRL_HALT_CMD		0
+#define			ALT_CMD_RESUME_AT_FRAME_BOUNDARY	1
+#define		RDI_CTRL_HALT_MODE		2
+
+#define CSID_RDI_FRM_DROP_PATTERN(rdi)			((IS_LITE ? 0x20C : 0x30C)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_FRM_DROP_PERIOD(rdi)			((IS_LITE ? 0x210 : 0x310)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_IRQ_SUBSAMPLE_PATTERN(rdi)		((IS_LITE ? 0x214 : 0x314)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)		((IS_LITE ? 0x218 : 0x318)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_RPP_PIX_DROP_PATTERN(rdi)		((IS_LITE ? 0x224 : 0x324)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_RPP_PIX_DROP_PERIOD(rdi)		((IS_LITE ? 0x228 : 0x328)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_RPP_LINE_DROP_PATTERN(rdi)		((IS_LITE ? 0x22C : 0x32C)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_RPP_LINE_DROP_PERIOD(rdi)		((IS_LITE ? 0x230 : 0x330)\
+							+ 0x100 * (rdi))
+
+#define CSID_TPG_CTRL		0x600
+#define		TPG_CTRL_TEST_EN		0
+#define		TPG_CTRL_FS_PKT_EN		1
+#define		TPG_CTRL_FE_PKT_EN		2
+#define		TPG_CTRL_NUM_ACTIVE_LANES	4
+#define		TPG_CTRL_CYCLES_BETWEEN_PKTS	8
+#define		TPG_CTRL_NUM_TRAIL_BYTES	20
+
+#define CSID_TPG_VC_CFG0	0x604
+#define		TPG_VC_CFG0_VC_NUM			0
+#define		TPG_VC_CFG0_NUM_ACTIVE_SLOTS		8
+#define			NUM_ACTIVE_SLOTS_0_ENABLED	0
+#define			NUM_ACTIVE_SLOTS_0_1_ENABLED	1
+#define			NUM_ACTIVE_SLOTS_0_1_2_ENABLED	2
+#define			NUM_ACTIVE_SLOTS_0_1_3_ENABLED	3
+#define		TPG_VC_CFG0_LINE_INTERLEAVING_MODE	10
+#define			INTELEAVING_MODE_INTERLEAVED	0
+#define			INTELEAVING_MODE_ONE_SHOT	1
+#define		TPG_VC_CFG0_NUM_FRAMES			16
+
+#define CSID_TPG_VC_CFG1	0x608
+#define		TPG_VC_CFG1_H_BLANKING_COUNT		0
+#define		TPG_VC_CFG1_V_BLANKING_COUNT		12
+#define		TPG_VC_CFG1_V_BLANK_FRAME_WIDTH_SEL	24
+
+#define CSID_TPG_LFSR_SEED	0x60C
+
+#define CSID_TPG_DT_n_CFG_0(n)	(0x610 + (n) * 0xC)
+#define		TPG_DT_n_CFG_0_FRAME_HEIGHT	0
+#define		TPG_DT_n_CFG_0_FRAME_WIDTH	16
+
+#define CSID_TPG_DT_n_CFG_1(n)	(0x614 + (n) * 0xC)
+#define		TPG_DT_n_CFG_1_DATA_TYPE	0
+#define		TPG_DT_n_CFG_1_ECC_XOR_MASK	8
+#define		TPG_DT_n_CFG_1_CRC_XOR_MASK	16
+
+#define CSID_TPG_DT_n_CFG_2(n)	(0x618 + (n) * 0xC)
+#define		TPG_DT_n_CFG_2_PAYLOAD_MODE		0
+#define		TPG_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD	4
+#define		TPG_DT_n_CFG_2_ENCODE_FORMAT		16
+
+#define CSID_TPG_COLOR_BARS_CFG	0x640
+#define		TPG_COLOR_BARS_CFG_UNICOLOR_BAR_EN	0
+#define		TPG_COLOR_BARS_CFG_UNICOLOR_BAR_SEL	4
+#define		TPG_COLOR_BARS_CFG_SPLIT_EN		5
+#define		TPG_COLOR_BARS_CFG_ROTATE_PERIOD	8
+
+#define CSID_TPG_COLOR_BOX_CFG	0x644
+#define		TPG_COLOR_BOX_CFG_MODE		0
+#define		TPG_COLOR_BOX_PATTERN_SEL	2
+
+
+static const struct csid_format csid_formats[] = {
+	{
+		MEDIA_BUS_FMT_UYVY8_2X8,
+		DATA_TYPE_YUV422_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		2,
+	},
+	{
+		MEDIA_BUS_FMT_VYUY8_2X8,
+		DATA_TYPE_YUV422_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		2,
+	},
+	{
+		MEDIA_BUS_FMT_YUYV8_2X8,
+		DATA_TYPE_YUV422_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		2,
+	},
+	{
+		MEDIA_BUS_FMT_YVYU8_2X8,
+		DATA_TYPE_YUV422_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		2,
+	},
+	{
+		MEDIA_BUS_FMT_SBGGR8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SBGGR10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_Y10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SBGGR12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SBGGR14_1X14,
+		DATA_TYPE_RAW_14BIT,
+		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
+		14,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG14_1X14,
+		DATA_TYPE_RAW_14BIT,
+		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
+		14,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG14_1X14,
+		DATA_TYPE_RAW_14BIT,
+		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
+		14,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB14_1X14,
+		DATA_TYPE_RAW_14BIT,
+		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
+		14,
+		1,
+	},
+};
+
+static void csid_configure_stream(struct csid_device *csid, u8 enable)
+{
+	struct csid_testgen_config *tg = &csid->testgen;
+	u32 val;
+	u32 phy_sel = 0;
+	u8 lane_cnt = csid->phy.lane_cnt;
+	struct v4l2_mbus_framefmt *input_format =
+			&csid->fmt[MSM_CSID_PAD_SRC];
+	const struct csid_format *format = csid_get_fmt_entry(
+			csid->formats, csid->nformats, input_format->code);
+	if (!lane_cnt)
+		lane_cnt = 4;
+
+	if (!tg->enabled)
+		phy_sel = csid->phy.csiphy_id;
+
+	if (enable) {
+		u8 vc = 0; /* Virtual Channel 0 */
+		u8 dt_id = vc * 4;
+
+		if (tg->enabled) {
+			/* Config Test Generator */
+			vc = 0xa;
+
+			/* configure one DT, infinite frames */
+			val = vc << TPG_VC_CFG0_VC_NUM;
+			val |= INTELEAVING_MODE_ONE_SHOT << TPG_VC_CFG0_LINE_INTERLEAVING_MODE;
+			val |= 0 << TPG_VC_CFG0_NUM_FRAMES;
+			writel_relaxed(val, csid->base + CSID_TPG_VC_CFG0);
+
+			val = 0x740 << TPG_VC_CFG1_H_BLANKING_COUNT;
+			val |= 0x3ff << TPG_VC_CFG1_V_BLANKING_COUNT;
+			writel_relaxed(val, csid->base + CSID_TPG_VC_CFG1);
+
+			writel_relaxed(0x12345678, csid->base + CSID_TPG_LFSR_SEED);
+
+			val = input_format->height & 0x1fff << TPG_DT_n_CFG_0_FRAME_HEIGHT;
+			val |= input_format->width & 0x1fff << TPG_DT_n_CFG_0_FRAME_WIDTH;
+			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_0(0));
+
+			val = DATA_TYPE_RAW_10BIT << TPG_DT_n_CFG_1_DATA_TYPE;
+			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_1(0));
+
+			val = tg->mode << TPG_DT_n_CFG_2_PAYLOAD_MODE;
+			val |= 0xBE << TPG_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD;
+			val |= format->decode_format << TPG_DT_n_CFG_2_ENCODE_FORMAT;
+			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_2(0));
+
+			writel_relaxed(0, csid->base + CSID_TPG_COLOR_BARS_CFG);
+
+			writel_relaxed(0, csid->base + CSID_TPG_COLOR_BOX_CFG);
+		}
+
+		val = 1 << RDI_CFG0_BYTE_CNTR_EN;
+		val |= 1 << RDI_CFG0_FORMAT_MEASURE_EN;
+		val |= 1 << RDI_CFG0_TIMESTAMP_EN;
+		val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
+		val |= DATA_TYPE_RAW_10BIT << RDI_CFG0_DATA_TYPE;
+		val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
+		val |= dt_id << RDI_CFG0_DT_ID;
+		writel_relaxed(val, csid->base + CSID_RDI_CFG0(0));
+
+		/* CSID_TIMESTAMP_STB_POST_IRQ */
+		val = 2 << RDI_CFG1_TIMESTAMP_STB_SEL;
+		writel_relaxed(val, csid->base + CSID_RDI_CFG1(0));
+
+		val = 1;
+		writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PERIOD(0));
+
+		val = 0;
+		writel_relaxed(0, csid->base + CSID_RDI_FRM_DROP_PATTERN(0));
+
+		val = 1;
+		writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(0));
+
+		val = 0;
+		writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(0));
+
+		val = 1;
+		writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PERIOD(0));
+
+		val = 0;
+		writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PATTERN(0));
+
+		val = 1;
+		writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PERIOD(0));
+
+		val = 0;
+		writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PATTERN(0));
+
+		val = 0;
+		writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
+
+		val = readl_relaxed(csid->base + CSID_RDI_CFG0(0));
+		val |=  1 << RDI_CFG0_ENABLE;
+		writel_relaxed(val, csid->base + CSID_RDI_CFG0(0));
+	}
+
+	if (tg->enabled) {
+		val = enable << TPG_CTRL_TEST_EN;
+		val |= 1 << TPG_CTRL_FS_PKT_EN;
+		val |= 1 << TPG_CTRL_FE_PKT_EN;
+		val |= (lane_cnt - 1) << TPG_CTRL_NUM_ACTIVE_LANES;
+		val |= 0x64 << TPG_CTRL_CYCLES_BETWEEN_PKTS;
+		val |= 0xA << TPG_CTRL_NUM_TRAIL_BYTES;
+		writel_relaxed(val, csid->base + CSID_TPG_CTRL);
+	}
+
+	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
+	val |= csid->phy.lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
+	val |= phy_sel << CSI2_RX_CFG0_PHY_NUM_SEL;
+	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
+
+
+	val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
+	val |= 1 << CSI2_RX_CFG1_MISR_EN;
+	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1); // csi2_vc_mode_shift_val ?
+
+	/* error irqs start at BIT(11) */
+	writel_relaxed(~0u, csid->base + CSID_CSI2_RX_IRQ_MASK);
+
+	/* RDI irq */
+	writel_relaxed(~0u, csid->base + CSID_TOP_IRQ_MASK);
+
+	val = 1 << RDI_CTRL_HALT_CMD;
+	writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
+}
+
+static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
+{
+	if (val > 0 && val <= csid->testgen.nmodes)
+		csid->testgen.mode = val;
+
+	return 0;
+}
+
+/*
+ * csid_hw_version - CSID hardware version query
+ * @csid: CSID device
+ *
+ * Return HW version or error
+ */
+static u32 csid_hw_version(struct csid_device *csid)
+{
+	u32 hw_version;
+	u32 hw_gen;
+	u32 hw_rev;
+	u32 hw_step;
+
+	hw_version = readl_relaxed(csid->base + CSID_HW_VERSION);
+	hw_gen = (hw_version >> HW_VERSION_GENERATION) & 0xF;
+	hw_rev = (hw_version >> HW_VERSION_REVISION) & 0xFFF;
+	hw_step = (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
+	dev_dbg(csid->camss->dev, "CSID HW Version = %u.%u.%u\n",
+		hw_gen, hw_rev, hw_step);
+
+	return hw_version;
+}
+
+/*
+ * csid_isr - CSID module interrupt service routine
+ * @irq: Interrupt line
+ * @dev: CSID device
+ *
+ * Return IRQ_HANDLED on success
+ */
+static irqreturn_t csid_isr(int irq, void *dev)
+{
+	struct csid_device *csid = dev;
+	u32 val;
+	u8 reset_done;
+
+	val = readl_relaxed(csid->base + CSID_TOP_IRQ_STATUS);
+	writel_relaxed(val, csid->base + CSID_TOP_IRQ_CLEAR);
+	reset_done = val & BIT(TOP_IRQ_STATUS_RESET_DONE);
+
+	val = readl_relaxed(csid->base + CSID_CSI2_RX_IRQ_STATUS);
+	writel_relaxed(val, csid->base + CSID_CSI2_RX_IRQ_CLEAR);
+
+	val = readl_relaxed(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(0));
+	writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(0));
+
+	val = 1 << IRQ_CMD_CLEAR;
+	writel_relaxed(val, csid->base + CSID_IRQ_CMD);
+
+	if (reset_done)
+		complete(&csid->reset_complete);
+
+	return IRQ_HANDLED;
+}
+
+/*
+ * csid_reset - Trigger reset on CSID module and wait to complete
+ * @csid: CSID device
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csid_reset(struct csid_device *csid)
+{
+	unsigned long time;
+	u32 val;
+
+	reinit_completion(&csid->reset_complete);
+
+	writel_relaxed(1, csid->base + CSID_TOP_IRQ_CLEAR);
+	writel_relaxed(1, csid->base + CSID_IRQ_CMD);
+	writel_relaxed(1, csid->base + CSID_TOP_IRQ_MASK);
+	writel_relaxed(1, csid->base + CSID_IRQ_CMD);
+
+	/* preserve registers */
+	val = 0x1e << RST_STROBES;
+	writel_relaxed(val, csid->base + CSID_RST_STROBES);
+
+	time = wait_for_completion_timeout(&csid->reset_complete,
+		msecs_to_jiffies(CSID_RESET_TIMEOUT_MS));
+	if (!time) {
+		dev_err(csid->camss->dev, "CSID reset timeout\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
+			     unsigned int match_format_idx, u32 match_code)
+{
+	switch (sink_code) {
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	{
+		u32 src_code[] = {
+			MEDIA_BUS_FMT_SBGGR10_1X10,
+			MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE,
+		};
+
+		return csid_find_code(src_code, ARRAY_SIZE(src_code),
+				      match_format_idx, match_code);
+	}
+	case MEDIA_BUS_FMT_Y10_1X10:
+	{
+		u32 src_code[] = {
+			MEDIA_BUS_FMT_Y10_1X10,
+			MEDIA_BUS_FMT_Y10_2X8_PADHI_LE,
+		};
+
+		return csid_find_code(src_code, ARRAY_SIZE(src_code),
+				      match_format_idx, match_code);
+	}
+	default:
+		if (match_format_idx > 0)
+			return 0;
+
+		return sink_code;
+	}
+}
+
+static void csid_subdev_init(struct csid_device *csid)
+{
+	csid->formats = csid_formats;
+	csid->nformats = ARRAY_SIZE(csid_formats);
+	csid->testgen.modes = csid_testgen_modes;
+	csid->testgen.nmodes = CSID_PAYLOAD_MODE_NUM_SUPPORTED_GEN2;
+}
+
+const struct csid_hw_ops csid_ops_170 = {
+	.configure_stream = csid_configure_stream,
+	.configure_testgen_pattern = csid_configure_testgen_pattern,
+	.hw_version = csid_hw_version,
+	.isr = csid_isr,
+	.reset = csid_reset,
+	.src_pad_code = csid_src_pad_code,
+	.subdev_init = csid_subdev_init,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index cb8b755a7b9b..7cd708ce1da3 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -122,6 +122,8 @@ static int csid_set_clock_rates(struct csid_device *csid)
 				dev_err(dev, "clk set rate failed: %d\n", ret);
 				return ret;
 			}
+		} else if (clock->nfreqs) {
+			clk_set_rate(clock->clk, clock->freq[0]);
 		}
 	}
 
@@ -543,6 +545,8 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 	} else if (camss->version == CAMSS_8x96 ||
 		   camss->version == CAMSS_660) {
 		csid->ops = &csid_ops_4_7;
+	} else if (camss->version == CAMSS_845) {
+		csid->ops = &csid_ops_170;
 	} else {
 		return -EINVAL;
 	}
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 089db257bd22..8ab78a006f1b 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -57,6 +57,10 @@ enum csid_testgen_mode {
 	CSID_PAYLOAD_MODE_RANDOM = 5,
 	CSID_PAYLOAD_MODE_USER_SPECIFIED = 6,
 	CSID_PAYLOAD_MODE_NUM_SUPPORTED_GEN1 = 6, /* excluding disabled */
+	CSID_PAYLOAD_MODE_COMPLEX_PATTERN = 7,
+	CSID_PAYLOAD_MODE_COLOR_BOX = 8,
+	CSID_PAYLOAD_MODE_COLOR_BARS = 9,
+	CSID_PAYLOAD_MODE_NUM_SUPPORTED_GEN2 = 9, /* excluding disabled */
 };
 
 static const char * const csid_testgen_modes[] = {
@@ -67,6 +71,9 @@ static const char * const csid_testgen_modes[] = {
 	"All Ones 0xFF",
 	"Pseudo-random Data",
 	"User Specified",
+	"Complex pattern",
+	"Color box",
+	"Color bars",
 };
 
 struct csid_format {
@@ -212,5 +219,7 @@ void msm_csid_get_csid_id(struct media_entity *entity, u8 *id);
 
 extern const struct csid_hw_ops csid_ops_4_1;
 extern const struct csid_hw_ops csid_ops_4_7;
+extern const struct csid_hw_ops csid_ops_170;
+
 
 #endif /* QC_MSM_CAMSS_CSID_H */
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
index 9ab5964b1e99..ce1130108e01 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-170.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
@@ -274,7 +274,6 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 	writel_relaxed(val, vfe->base + VFE_BUS_WM_PACKER_CFG(wm)); // XXX 1 for PLAIN8?
 
 	/* Configure stride for RDIs */
-	//val = pix->plane_fmt[0].bytesperline;
 	val = WM_STRIDE_DEFAULT_STRIDE;
 	writel_relaxed(val, vfe->base + VFE_BUS_WM_STRIDE(wm));
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index be879f5bd4c7..862edf5020a2 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -465,6 +465,68 @@ static const struct resources vfe_res_660[] = {
 	}
 };
 
+static const struct resources csid_res_845[] = {
+	/* CSID0 */
+	{
+		.regulator = { "vdda-csi0" },
+		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
+				"soc_ahb", "vfe0", "vfe0_src",
+				"vfe0_cphy_rx", "csi0",
+				"csi0_src" },
+		.clock_rate = { { 0 },
+				{ 384000000 },
+				{ 80000000 },
+				{ 0 },
+				{ 19200000, 100000000, 320000000, 404000000, 480000000, 600000000 },
+				{ 320000000 },
+				{ 0 },
+				{ 19200000, 75000000, 384000000, 538666667 },
+				{ 384000000 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" }
+	},
+
+	/* CSID1 */
+	{
+		.regulator = { "vdda-csi1" },
+		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
+				"soc_ahb", "vfe1", "vfe1_src",
+				"vfe1_cphy_rx", "csi1",
+				"csi1_src" },
+		.clock_rate = { { 0 },
+				{ 384000000 },
+				{ 80000000 },
+				{ 0 },
+				{ 19200000, 100000000, 320000000, 404000000, 480000000, 600000000 },
+				{ 320000000 },
+				{ 0 },
+				{ 19200000, 75000000, 384000000, 538666667 },
+				{ 384000000 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" }
+	},
+
+	/* CSID2 */
+	{
+		.regulator = { "vdda-csi2" },
+		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
+				"soc_ahb", "vfe_lite", "vfe_lite_src",
+				"vfe_lite_cphy_rx", "csi2",
+				"csi2_src" },
+		.clock_rate = { { 0 },
+				{ 384000000 },
+				{ 80000000 },
+				{ 0 },
+				{ 19200000, 100000000, 320000000, 404000000, 480000000, 600000000 },
+				{ 320000000 },
+				{ 0 },
+				{ 19200000, 75000000, 384000000, 538666667 },
+				{ 384000000 } },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" }
+	}
+};
+
 static const struct resources vfe_res_845[] = {
 	/* VFE0 */
 	{
-- 
2.27.0

