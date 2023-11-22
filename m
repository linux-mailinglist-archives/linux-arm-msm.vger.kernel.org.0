Return-Path: <linux-arm-msm+bounces-1605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2877B7F544C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 00:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 105A01C20BD3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 23:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C681C22086;
	Wed, 22 Nov 2023 23:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wjl9wGd5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6DB3D54
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 15:09:20 -0800 (PST)
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-35930447ae9so964295ab.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 15:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700694560; x=1701299360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0edA2W8OPVHUseYwIjpZXpoIxZHEQrfzpABBu7++cOw=;
        b=wjl9wGd5nvN8wGtMgSba2KpR2EXFy/7Gj6vGnu0YuUz0Hseklhct5pzy7a3MdeDmKF
         UBs27jj6VzsSZJ00873O+5TUfXmjkTyUkWQKa7uWmkpiQl7vrq2rURNAxl9VbhRG0TKO
         LxCBYKhXSQD2cTkDsvf1EHl+LwS3EVkok8IttEUHAIFrSNZiQ8I9CA1u/hHUnMhdnKtn
         mIoIgnvUAYNX8qvvGieiYN4RlZrbZ6X0CBKXrfAqu1iehTx8I7Y/yI/aUSgpgDjc4zDu
         bwrfULhH4ll/dZsBE0wKUb/B4Rd3GeRk7LoUSJxmnrik6U3qc95OlUaf8IbKjvA14T42
         CSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700694560; x=1701299360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0edA2W8OPVHUseYwIjpZXpoIxZHEQrfzpABBu7++cOw=;
        b=X1x7ofpKJsIq9ys/L/I/8iEWsV4KpBzNKvFhrjcI+dl/0PhMfhNDbspSJ9090rh7Rc
         vff0FiKbrmExudA/zy12sBN88Q3jokw/xiB9WsrNjANoSGhvLKsnFpQez9EER5KyFQNt
         8bBbZNOe6Do9ixsiftRyQ7pPP5DnmAnMVe4vvlYIl/703rlUgu9IVlAJZi+us2I5cjLX
         BlyU4kQvOwOsV97dcM3CrzdSAFRtmFyRTaGbbKNcZspi2MfpHQMePrgl7Jf+r3yTpA9X
         2ftkLqYVygdfLHrRNx7ucm5QLDgDIH5EFcFAviFJRUupPnoTif3rG+lRPHKstMzC+mqZ
         NXWQ==
X-Gm-Message-State: AOJu0YzTXahBmZKtuykRLOoeNdTD+hkRlhrvswsF/L0tlRWBmQRnzoFm
	9bs7jnKHZb81JWX/A0AYRwAlTw==
X-Google-Smtp-Source: AGHT+IEamTDA56lJdliwOkPowtvOqQwJAuPSp0z+mCi3nOKYpaN/dLMMcHNyYd1Ko4ZD/DimAqEC+A==
X-Received: by 2002:a05:6e02:240d:b0:35b:3481:879c with SMTP id bs13-20020a056e02240d00b0035b3481879cmr5043888ilb.31.1700694560086;
        Wed, 22 Nov 2023 15:09:20 -0800 (PST)
Received: from localhost.localdomain (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.gmail.com with ESMTPSA id fm29-20020a0566382b1d00b0043a20ad93c8sm117754jab.41.2023.11.22.15.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 15:09:19 -0800 (PST)
From: Alex Elder <elder@linaro.org>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	agross@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	mka@chromium.org,
	quic_cpratapa@quicinc.com,
	quic_avuyyuru@quicinc.com,
	quic_jponduru@quicinc.com,
	quic_subashab@quicinc.com,
	elder@kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 5/5] net: ipa: add IPA v5.5 configuration data
Date: Wed, 22 Nov 2023 17:09:09 -0600
Message-Id: <20231122230909.895482-6-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231122230909.895482-1-elder@linaro.org>
References: <20231122230909.895482-1-elder@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the configuration data required for IPA v5.5, which is used in
the Qualcomm SM8550 SoC.  With that, the driver supports IPA v5.5.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/Makefile             |   2 +-
 drivers/net/ipa/data/ipa_data-v5.5.c | 487 +++++++++++++++++++++++++++
 drivers/net/ipa/ipa_data.h           |   1 +
 drivers/net/ipa/ipa_main.c           |   4 +
 drivers/net/ipa/ipa_version.h        |   1 +
 5 files changed, 494 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/ipa/data/ipa_data-v5.5.c

diff --git a/drivers/net/ipa/Makefile b/drivers/net/ipa/Makefile
index 9d2182068e1cd..d3abb38633e08 100644
--- a/drivers/net/ipa/Makefile
+++ b/drivers/net/ipa/Makefile
@@ -7,7 +7,7 @@ IPA_REG_VERSIONS	:=	3.1 3.5.1 4.2 4.5 4.7 4.9 4.11 5.0 5.5
 # Some IPA versions can reuse another set of GSI register definitions.
 GSI_REG_VERSIONS	:=	3.1 3.5.1 4.0 4.5 4.9 4.11 5.0
 
-IPA_DATA_VERSIONS	:=	3.1 3.5.1 4.2 4.5 4.7 4.9 4.11 5.0
+IPA_DATA_VERSIONS	:=	3.1 3.5.1 4.2 4.5 4.7 4.9 4.11 5.0 5.5
 
 obj-$(CONFIG_QCOM_IPA)	+=	ipa.o
 
diff --git a/drivers/net/ipa/data/ipa_data-v5.5.c b/drivers/net/ipa/data/ipa_data-v5.5.c
new file mode 100644
index 0000000000000..2c6390f11354b
--- /dev/null
+++ b/drivers/net/ipa/data/ipa_data-v5.5.c
@@ -0,0 +1,487 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright (C) 2023 Linaro Ltd. */
+
+#include <linux/kernel.h>
+#include <linux/log2.h>
+
+#include "../ipa_data.h"
+#include "../ipa_endpoint.h"
+#include "../ipa_mem.h"
+
+/** enum ipa_resource_type - IPA resource types for an SoC having IPA v5.5 */
+enum ipa_resource_type {
+	/* Source resource types; first must have value 0 */
+	IPA_RESOURCE_TYPE_SRC_PKT_CONTEXTS		= 0,
+	IPA_RESOURCE_TYPE_SRC_DESCRIPTOR_LISTS,
+	IPA_RESOURCE_TYPE_SRC_DESCRIPTOR_BUFF,
+	IPA_RESOURCE_TYPE_SRC_HPS_DMARS,
+	IPA_RESOURCE_TYPE_SRC_ACK_ENTRIES,
+
+	/* Destination resource types; first must have value 0 */
+	IPA_RESOURCE_TYPE_DST_DATA_SECTORS		= 0,
+	IPA_RESOURCE_TYPE_DST_DPS_DMARS,
+	IPA_RESOURCE_TYPE_DST_ULSO_SEGMENTS,
+};
+
+/* Resource groups used for an SoC having IPA v5.5 */
+enum ipa_rsrc_group_id {
+	/* Source resource group identifiers */
+	IPA_RSRC_GROUP_SRC_UL				= 0,
+	IPA_RSRC_GROUP_SRC_DL,
+	IPA_RSRC_GROUP_SRC_UNUSED_2,
+	IPA_RSRC_GROUP_SRC_UNUSED_3,
+	IPA_RSRC_GROUP_SRC_URLLC,
+	IPA_RSRC_GROUP_SRC_U_RX_QC,
+	IPA_RSRC_GROUP_SRC_COUNT,	/* Last in set; not a source group */
+
+	/* Destination resource group identifiers */
+	IPA_RSRC_GROUP_DST_UL				= 0,
+	IPA_RSRC_GROUP_DST_DL,
+	IPA_RSRC_GROUP_DST_UNUSED_2,
+	IPA_RSRC_GROUP_DST_UNUSED_3,
+	IPA_RSRC_GROUP_DST_UNUSED_4,
+	IPA_RSRC_GROUP_DST_UC,
+	IPA_RSRC_GROUP_DST_DRB_IP,
+	IPA_RSRC_GROUP_DST_COUNT,	/* Last; not a destination group */
+};
+
+/* QSB configuration data for an SoC having IPA v5.5 */
+static const struct ipa_qsb_data ipa_qsb_data[] = {
+	[IPA_QSB_MASTER_DDR] = {
+		.max_writes		= 0,	/* Unlimited */
+		.max_reads		= 12,
+		.max_reads_beats	= 0,
+	},
+	[IPA_QSB_MASTER_PCIE] = {
+		.max_writes		= 0,	/* Unlimited */
+		.max_reads		= 8,
+		.max_reads_beats	= 0,
+	},
+};
+
+/* Endpoint configuration data for an SoC having IPA v5.5 */
+static const struct ipa_gsi_endpoint_data ipa_gsi_endpoint_data[] = {
+	[IPA_ENDPOINT_AP_COMMAND_TX] = {
+		.ee_id		= GSI_EE_AP,
+		.channel_id	= 12,
+		.endpoint_id	= 14,
+		.toward_ipa	= true,
+		.channel = {
+			.tre_count	= 256,
+			.event_count	= 256,
+			.tlv_count	= 20,
+		},
+		.endpoint = {
+			.config = {
+				.resource_group	= IPA_RSRC_GROUP_SRC_UL,
+				.dma_mode	= true,
+				.dma_endpoint	= IPA_ENDPOINT_AP_LAN_RX,
+				.tx = {
+					.seq_type = IPA_SEQ_DMA,
+				},
+			},
+		},
+	},
+	[IPA_ENDPOINT_AP_LAN_RX] = {
+		.ee_id		= GSI_EE_AP,
+		.channel_id	= 13,
+		.endpoint_id	= 16,
+		.toward_ipa	= false,
+		.channel = {
+			.tre_count	= 256,
+			.event_count	= 256,
+			.tlv_count	= 9,
+		},
+		.endpoint = {
+			.config = {
+				.resource_group	= IPA_RSRC_GROUP_DST_UL,
+				.aggregation	= true,
+				.status_enable	= true,
+				.rx = {
+					.buffer_size	= 8192,
+					.pad_align	= ilog2(sizeof(u32)),
+					.aggr_time_limit = 500,
+				},
+			},
+		},
+	},
+	[IPA_ENDPOINT_AP_MODEM_TX] = {
+		.ee_id		= GSI_EE_AP,
+		.channel_id	= 11,
+		.endpoint_id	= 2,
+		.toward_ipa	= true,
+		.channel = {
+			.tre_count	= 512,
+			.event_count	= 512,
+			.tlv_count	= 25,
+		},
+		.endpoint = {
+			.filter_support	= true,
+			.config = {
+				.resource_group	= IPA_RSRC_GROUP_SRC_UL,
+				.checksum       = true,
+				.qmap		= true,
+				.status_enable	= true,
+				.tx = {
+					.seq_type = IPA_SEQ_2_PASS_SKIP_LAST_UC,
+					.status_endpoint =
+						IPA_ENDPOINT_MODEM_AP_RX,
+				},
+			},
+		},
+	},
+	[IPA_ENDPOINT_AP_MODEM_RX] = {
+		.ee_id		= GSI_EE_AP,
+		.channel_id	= 1,
+		.endpoint_id	= 23,
+		.toward_ipa	= false,
+		.channel = {
+			.tre_count	= 256,
+			.event_count	= 256,
+			.tlv_count	= 9,
+		},
+		.endpoint = {
+			.config = {
+				.resource_group	= IPA_RSRC_GROUP_DST_DL,
+				.checksum       = true,
+				.qmap		= true,
+				.aggregation	= true,
+				.rx = {
+					.buffer_size	= 8192,
+					.aggr_time_limit = 500,
+					.aggr_close_eof	= true,
+				},
+			},
+		},
+	},
+	[IPA_ENDPOINT_MODEM_AP_TX] = {
+		.ee_id		= GSI_EE_MODEM,
+		.channel_id	= 0,
+		.endpoint_id	= 12,
+		.toward_ipa	= true,
+		.endpoint = {
+			.filter_support	= true,
+		},
+	},
+	[IPA_ENDPOINT_MODEM_AP_RX] = {
+		.ee_id		= GSI_EE_MODEM,
+		.channel_id	= 7,
+		.endpoint_id	= 21,
+		.toward_ipa	= false,
+	},
+	[IPA_ENDPOINT_MODEM_DL_NLO_TX] = {
+		.ee_id		= GSI_EE_MODEM,
+		.channel_id	= 2,
+		.endpoint_id	= 15,
+		.toward_ipa	= true,
+		.endpoint = {
+			.filter_support	= true,
+		},
+	},
+};
+
+/* Source resource configuration data for an SoC having IPA v5.5 */
+static const struct ipa_resource ipa_resource_src[] = {
+	[IPA_RESOURCE_TYPE_SRC_PKT_CONTEXTS] = {
+		.limits[IPA_RSRC_GROUP_SRC_UL] = {
+			.min = 3,	.max = 9,
+		},
+		.limits[IPA_RSRC_GROUP_SRC_DL] = {
+			.min = 4,	.max = 10,
+		},
+		.limits[IPA_RSRC_GROUP_SRC_URLLC] = {
+			.min = 1,	.max = 63,
+		},
+		.limits[IPA_RSRC_GROUP_SRC_U_RX_QC] = {
+			.min = 0,	.max = 63,
+		},
+	},
+	[IPA_RESOURCE_TYPE_SRC_DESCRIPTOR_LISTS] = {
+		.limits[IPA_RSRC_GROUP_SRC_UL] = {
+			.min = 9,	.max = 9,
+		},
+		.limits[IPA_RSRC_GROUP_SRC_DL] = {
+			.min = 12,	.max = 12,
+		},
+		.limits[IPA_RSRC_GROUP_SRC_URLLC] = {
+			.min = 10,	.max = 10,
+		},
+	},
+	[IPA_RESOURCE_TYPE_SRC_DESCRIPTOR_BUFF] = {
+		.limits[IPA_RSRC_GROUP_SRC_UL] = {
+			.min = 9,	.max = 9,
+		},
+		.limits[IPA_RSRC_GROUP_SRC_DL] = {
+			.min = 24,	.max = 24,
+		},
+		.limits[IPA_RSRC_GROUP_SRC_URLLC] = {
+			.min = 20,	.max = 20,
+		},
+	},
+	[IPA_RESOURCE_TYPE_SRC_HPS_DMARS] = {
+		.limits[IPA_RSRC_GROUP_SRC_UL] = {
+			.min = 0,	.max = 63,
+		},
+		.limits[IPA_RSRC_GROUP_SRC_DL] = {
+			.min = 0,	.max = 63,
+		},
+		.limits[IPA_RSRC_GROUP_SRC_URLLC] = {
+			.min = 1,	.max = 63,
+		},
+		.limits[IPA_RSRC_GROUP_SRC_U_RX_QC] = {
+			.min = 0,	.max = 63,
+		},
+	},
+	[IPA_RESOURCE_TYPE_SRC_ACK_ENTRIES] = {
+		.limits[IPA_RSRC_GROUP_SRC_UL] = {
+			.min = 22,	.max = 22,
+		},
+		.limits[IPA_RSRC_GROUP_SRC_DL] = {
+			.min = 16,	.max = 16,
+		},
+		.limits[IPA_RSRC_GROUP_SRC_URLLC] = {
+			.min = 16,	.max = 16,
+		},
+	},
+};
+
+/* Destination resource configuration data for an SoC having IPA v5.5 */
+static const struct ipa_resource ipa_resource_dst[] = {
+	[IPA_RESOURCE_TYPE_DST_DATA_SECTORS] = {
+		.limits[IPA_RSRC_GROUP_DST_UL] = {
+			.min = 6,	.max = 6,
+		},
+		.limits[IPA_RSRC_GROUP_DST_DL] = {
+			.min = 5,	.max = 5,
+		},
+		.limits[IPA_RSRC_GROUP_DST_DRB_IP] = {
+			.min = 39,	.max = 39,
+		},
+	},
+	[IPA_RESOURCE_TYPE_DST_DPS_DMARS] = {
+		.limits[IPA_RSRC_GROUP_DST_UL] = {
+			.min = 0,	.max = 3,
+		},
+		.limits[IPA_RSRC_GROUP_DST_DL] = {
+			.min = 0,	.max = 3,
+		},
+	},
+	[IPA_RESOURCE_TYPE_DST_ULSO_SEGMENTS] = {
+		.limits[IPA_RSRC_GROUP_DST_UL] = {
+			.min = 0,	.max = 63,
+		},
+		.limits[IPA_RSRC_GROUP_DST_DL] = {
+			.min = 0,	.max = 63,
+		},
+	},
+};
+
+/* Resource configuration data for an SoC having IPA v5.5 */
+static const struct ipa_resource_data ipa_resource_data = {
+	.rsrc_group_dst_count	= IPA_RSRC_GROUP_DST_COUNT,
+	.rsrc_group_src_count	= IPA_RSRC_GROUP_SRC_COUNT,
+	.resource_src_count	= ARRAY_SIZE(ipa_resource_src),
+	.resource_src		= ipa_resource_src,
+	.resource_dst_count	= ARRAY_SIZE(ipa_resource_dst),
+	.resource_dst		= ipa_resource_dst,
+};
+
+/* IPA-resident memory region data for an SoC having IPA v5.5 */
+static const struct ipa_mem ipa_mem_local_data[] = {
+	{
+		.id		= IPA_MEM_UC_EVENT_RING,
+		.offset		= 0x0000,
+		.size		= 0x1000,
+		.canary_count	= 0,
+	},
+	{
+		.id		= IPA_MEM_UC_SHARED,
+		.offset		= 0x1000,
+		.size		= 0x0080,
+		.canary_count	= 0,
+	},
+	{
+		.id		= IPA_MEM_UC_INFO,
+		.offset		= 0x1080,
+		.size		= 0x0200,
+		.canary_count	= 0,
+	},
+	{
+		.id		= IPA_MEM_V4_FILTER_HASHED,
+		.offset		= 0x1288,
+		.size		= 0x0078,
+		.canary_count	= 2,
+	},
+	{
+		.id		= IPA_MEM_V4_FILTER,
+		.offset		= 0x1308,
+		.size		= 0x0078,
+		.canary_count	= 2,
+	},
+	{
+		.id		= IPA_MEM_V6_FILTER_HASHED,
+		.offset		= 0x1388,
+		.size		= 0x0078,
+		.canary_count	= 2,
+	},
+	{
+		.id		= IPA_MEM_V6_FILTER,
+		.offset		= 0x1408,
+		.size		= 0x0078,
+		.canary_count	= 2,
+	},
+	{
+		.id		= IPA_MEM_V4_ROUTE_HASHED,
+		.offset		= 0x1488,
+		.size		= 0x0098,
+		.canary_count	= 2,
+	},
+	{
+		.id		= IPA_MEM_V4_ROUTE,
+		.offset		= 0x1528,
+		.size		= 0x0098,
+		.canary_count	= 2,
+	},
+	{
+		.id		= IPA_MEM_V6_ROUTE_HASHED,
+		.offset		= 0x15c8,
+		.size		= 0x0098,
+		.canary_count	= 2,
+	},
+	{
+		.id		= IPA_MEM_V6_ROUTE,
+		.offset		= 0x1668,
+		.size		= 0x0098,
+		.canary_count	= 2,
+	},
+	{
+		.id		= IPA_MEM_MODEM_HEADER,
+		.offset		= 0x1708,
+		.size		= 0x0240,
+		.canary_count	= 2,
+	},
+	{
+		.id		= IPA_MEM_AP_HEADER,
+		.offset		= 0x1948,
+		.size		= 0x01e0,
+		.canary_count	= 0,
+	},
+	{
+		.id		= IPA_MEM_MODEM_PROC_CTX,
+		.offset		= 0x1b40,
+		.size		= 0x0b20,
+		.canary_count	= 2,
+	},
+	{
+		.id		= IPA_MEM_AP_PROC_CTX,
+		.offset		= 0x2660,
+		.size		= 0x0200,
+		.canary_count	= 0,
+	},
+	{
+		.id		= IPA_MEM_STATS_QUOTA_MODEM,
+		.offset		= 0x2868,
+		.size		= 0x0060,
+		.canary_count	= 2,
+	},
+	{
+		.id		= IPA_MEM_STATS_QUOTA_AP,
+		.offset		= 0x28c8,
+		.size		= 0x0048,
+		.canary_count	= 0,
+	},
+	{
+		.id		= IPA_MEM_STATS_TETHERING,
+		.offset		= 0x2910,
+		.size		= 0x03c0,
+		.canary_count	= 0,
+	},
+	{
+		.id		= IPA_MEM_AP_V4_FILTER,
+		.offset		= 0x29b8,
+		.size		= 0x0188,
+		.canary_count	= 2,
+	},
+	{
+		.id		= IPA_MEM_AP_V6_FILTER,
+		.offset		= 0x2b40,
+		.size		= 0x0228,
+		.canary_count	= 0,
+	},
+	{
+		.id		= IPA_MEM_STATS_FILTER_ROUTE,
+		.offset		= 0x2cd0,
+		.size		= 0x0ba0,
+		.canary_count	= 2,
+	},
+	{
+		.id		= IPA_MEM_STATS_DROP,
+		.offset		= 0x3870,
+		.size		= 0x0020,
+		.canary_count	= 0,
+	},
+	{
+		.id		= IPA_MEM_MODEM,
+		.offset		= 0x3898,
+		.size		= 0x0d48,
+		.canary_count	= 2,
+	},
+	{
+		.id		= IPA_MEM_NAT_TABLE,
+		.offset		= 0x45e0,
+		.size		= 0x0900,
+		.canary_count	= 0,
+	},
+	{
+		.id		= IPA_MEM_PDN_CONFIG,
+		.offset		= 0x4ee8,
+		.size		= 0x0100,
+		.canary_count	= 2,
+	},
+};
+
+/* Memory configuration data for an SoC having IPA v5.5 */
+static const struct ipa_mem_data ipa_mem_data = {
+	.local_count	= ARRAY_SIZE(ipa_mem_local_data),
+	.local		= ipa_mem_local_data,
+	.imem_addr	= 0x14688000,
+	.imem_size	= 0x00002000,
+	.smem_id	= 497,
+	.smem_size	= 0x0000b000,
+};
+
+/* Interconnect rates are in 1000 byte/second units */
+static const struct ipa_interconnect_data ipa_interconnect_data[] = {
+	{
+		.name			= "memory",
+		.peak_bandwidth		= 1900000,	/* 1.9 GBps */
+		.average_bandwidth	= 600000,	/* 600 MBps */
+	},
+	/* Average rate is unused for the next interconnect */
+	{
+		.name			= "config",
+		.peak_bandwidth		= 76800,	/* 76.8 MBps */
+		.average_bandwidth	= 0,		/* unused */
+	},
+};
+
+/* Clock and interconnect configuration data for an SoC having IPA v5.5 */
+static const struct ipa_power_data ipa_power_data = {
+	.core_clock_rate	= 120 * 1000 * 1000,	/* Hz */
+	.interconnect_count	= ARRAY_SIZE(ipa_interconnect_data),
+	.interconnect_data	= ipa_interconnect_data,
+};
+
+/* Configuration data for an SoC having IPA v5.5. */
+const struct ipa_data ipa_data_v5_5 = {
+	.version		= IPA_VERSION_5_5,
+	.qsb_count		= ARRAY_SIZE(ipa_qsb_data),
+	.qsb_data		= ipa_qsb_data,
+	.modem_route_count	= 11,
+	.endpoint_count		= ARRAY_SIZE(ipa_gsi_endpoint_data),
+	.endpoint_data		= ipa_gsi_endpoint_data,
+	.resource_data		= &ipa_resource_data,
+	.mem_data		= &ipa_mem_data,
+	.power_data		= &ipa_power_data,
+};
diff --git a/drivers/net/ipa/ipa_data.h b/drivers/net/ipa/ipa_data.h
index ce82b00fdc498..2a1605e67b65d 100644
--- a/drivers/net/ipa/ipa_data.h
+++ b/drivers/net/ipa/ipa_data.h
@@ -250,5 +250,6 @@ extern const struct ipa_data ipa_data_v4_7;
 extern const struct ipa_data ipa_data_v4_9;
 extern const struct ipa_data ipa_data_v4_11;
 extern const struct ipa_data ipa_data_v5_0;
+extern const struct ipa_data ipa_data_v5_5;
 
 #endif /* _IPA_DATA_H_ */
diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 8893290e132b4..86884c21e7922 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -691,6 +691,10 @@ static const struct of_device_id ipa_match[] = {
 		.compatible	= "qcom,sdx65-ipa",
 		.data		= &ipa_data_v5_0,
 	},
+	{
+		.compatible	= "qcom,sm8550-ipa",
+		.data		= &ipa_data_v5_5,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, ipa_match);
diff --git a/drivers/net/ipa/ipa_version.h b/drivers/net/ipa/ipa_version.h
index 06e75b8ece7ee..38150345b607e 100644
--- a/drivers/net/ipa/ipa_version.h
+++ b/drivers/net/ipa/ipa_version.h
@@ -56,6 +56,7 @@ static inline bool ipa_version_supported(enum ipa_version version)
 	case IPA_VERSION_4_9:
 	case IPA_VERSION_4_11:
 	case IPA_VERSION_5_0:
+	case IPA_VERSION_5_5:
 		return true;
 	default:
 		return false;
-- 
2.34.1


