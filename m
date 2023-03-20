Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A333E6C228F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 21:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbjCTUZ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 16:25:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbjCTUZC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 16:25:02 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B8B449F7
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 13:24:57 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id 97so8414371qvb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 13:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679343896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OQxDG5amR5cswHb/RAqeiUTnzI2VXZp+SKvSyTSD3s=;
        b=Ypcgr8kOGa45535sIAt6r0aleuaMi/tF3sj4Tka4hpSYifTF00rI+gRqTuXKo7HX/K
         Rrpw1/IxDoKKWopQHaVSEwycDB/1v/YvxZPJU5j3RUnfYzf43YhGVAI4LXuS/6ByAcqI
         5npJmvEXxQv0wlwzAyPxVnnew04NGsXh7Rc3mlTBfd5Sbb3+5sjGyWSZ3IvsAl2LjX3A
         /PIjH8c/oghcUndkYtXUAS+aJh9p/DT/fR0QuIoE5vic7oy1UwSQi8zbYhIyq3sHrm8/
         tC8Dne9h3L2tJP5/1nYpTVscrHRFLHuZ4Wc0HKNZagzrxDI38OFZLZtZ5gzPeAA8Hx1a
         f5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679343896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8OQxDG5amR5cswHb/RAqeiUTnzI2VXZp+SKvSyTSD3s=;
        b=huYJRLqE2qQiDw7erm9X2tfqX23OwTM5FeA4LBjKX6FOt5wFnWrbkY7kVbsmpl/cOP
         1mk5UUsqxakq0uUFy+F8DGZWoFi5cytHYHJjE7+aQ6W8Wl1xwOSYhEh0uIu29iUjMfyu
         XQ5HBeZISSBDk7c/Wm8D6h/Qbg0Vl4H+iJwgmknpN+k974jU4DvfhUFJsmhrUOA9HFjo
         sAx444m8m2HzPlUUjCYIWaN7NeJLJvnirsbprinUE1ohTpHxOizlgHFnV1DeW4ylyjLq
         418AE7p07tCor7MaUjWGT07CMXvKdCkCsg8qUWam8wSYnCgCXYw+cj/IbGY1b1wqIMfi
         ZGxg==
X-Gm-Message-State: AO0yUKXiuur0Tn1YONbVTdgvBKsFZ6yPisn3v+YhfyFnesNaf+3sWfUV
        bxlTHoR4aCEyZyIFR8wMMLeLjg==
X-Google-Smtp-Source: AK7set8ckFtGA8Wk+MsGNUxAUr0+NgORHlYoBV3qKrOAAta4/pHxH0XT8sM9GhUfXuMa+g7prrvWtw==
X-Received: by 2002:a05:6214:2485:b0:5b1:9c9f:d4d6 with SMTP id gi5-20020a056214248500b005b19c9fd4d6mr334222qvb.37.1679343895898;
        Mon, 20 Mar 2023 13:24:55 -0700 (PDT)
Received: from localhost.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id d184-20020a3768c1000000b0074688c36facsm2568371qkc.56.2023.03.20.13.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 13:24:55 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     caleb.connolly@linaro.org, mka@chromium.org, evgreen@chromium.org,
        andersson@kernel.org, quic_cpratapa@quicinc.com,
        quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
        quic_subashab@quicinc.com, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 3/3] net: ipa: add IPA v5.0 configuration data
Date:   Mon, 20 Mar 2023 15:24:47 -0500
Message-Id: <20230320202447.2048016-4-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320202447.2048016-1-elder@linaro.org>
References: <20230320202447.2048016-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the configuration data required for IPA v5.0, which is used in
the SDX65 SoC.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/data/ipa_data-v5.0.c | 481 +++++++++++++++++++++++++++
 drivers/net/ipa/ipa_data.h           |   3 +-
 drivers/net/ipa/ipa_main.c           |   6 +-
 3 files changed, 488 insertions(+), 2 deletions(-)
 create mode 100644 drivers/net/ipa/data/ipa_data-v5.0.c

diff --git a/drivers/net/ipa/data/ipa_data-v5.0.c b/drivers/net/ipa/data/ipa_data-v5.0.c
new file mode 100644
index 0000000000000..4d8171dae4cd7
--- /dev/null
+++ b/drivers/net/ipa/data/ipa_data-v5.0.c
@@ -0,0 +1,481 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright (C) 2023 Linaro Ltd. */
+
+#include <linux/log2.h>
+
+#include "../gsi.h"
+#include "../ipa_data.h"
+#include "../ipa_endpoint.h"
+#include "../ipa_mem.h"
+
+/** enum ipa_resource_type - IPA resource types for an SoC having IPA v5.0 */
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
+/* Resource groups used for an SoC having IPA v5.0 */
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
+	IPA_RSRC_GROUP_DST_DMA,
+	IPA_RSRC_GROUP_DST_QDSS,
+	IPA_RSRC_GROUP_DST_CV2X,
+	IPA_RSRC_GROUP_DST_UC,
+	IPA_RSRC_GROUP_DST_DRB_IP,
+	IPA_RSRC_GROUP_DST_COUNT,	/* Last; not a destination group */
+};
+
+/* QSB configuration data for an SoC having IPA v5.0 */
+static const struct ipa_qsb_data ipa_qsb_data[] = {
+	[IPA_QSB_MASTER_DDR] = {
+		.max_writes		= 0,
+		.max_reads		= 0,	/* no limit (hardware max) */
+		.max_reads_beats	= 0,
+	},
+	[IPA_QSB_MASTER_PCIE] = {
+		.max_writes		= 0,
+		.max_reads		= 0,	/* no limit (hardware max) */
+		.max_reads_beats	= 0,
+	},
+};
+
+/* Endpoint configuration data for an SoC having IPA v5.0 */
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
+/* Source resource configuration data for an SoC having IPA v5.0 */
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
+/* Destination resource configuration data for an SoC having IPA v5.0 */
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
+/* Resource configuration data for an SoC having IPA v5.0 */
+static const struct ipa_resource_data ipa_resource_data = {
+	.rsrc_group_dst_count	= IPA_RSRC_GROUP_DST_COUNT,
+	.rsrc_group_src_count	= IPA_RSRC_GROUP_SRC_COUNT,
+	.resource_src_count	= ARRAY_SIZE(ipa_resource_src),
+	.resource_src		= ipa_resource_src,
+	.resource_dst_count	= ARRAY_SIZE(ipa_resource_dst),
+	.resource_dst		= ipa_resource_dst,
+};
+
+/* IPA-resident memory region data for an SoC having IPA v5.0 */
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
+		.id		= IPA_MEM_AP_V4_FILTER,
+		.offset		= 0x2918,
+		.size		= 0x0118,
+		.canary_count	= 2,
+	},
+	{
+		.id		= IPA_MEM_AP_V6_FILTER,
+		.offset		= 0x2aa0,
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
+/* Memory configuration data for an SoC having IPA v5.0 */
+static const struct ipa_mem_data ipa_mem_data = {
+	.local_count	= ARRAY_SIZE(ipa_mem_local_data),
+	.local		= ipa_mem_local_data,
+	.imem_addr	= 0x14688000,
+	.imem_size	= 0x00003000,
+	.smem_id	= 497,
+	.smem_size	= 0x00009000,
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
+/* Clock and interconnect configuration data for an SoC having IPA v5.0 */
+static const struct ipa_power_data ipa_power_data = {
+	.core_clock_rate	= 120 * 1000 * 1000,	/* Hz */
+	.interconnect_count	= ARRAY_SIZE(ipa_interconnect_data),
+	.interconnect_data	= ipa_interconnect_data,
+};
+
+/* Configuration data for an SoC having IPA v5.0. */
+const struct ipa_data ipa_data_v5_0 = {
+	.version		= IPA_VERSION_5_0,
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
index 818e64114ed50..ce82b00fdc498 100644
--- a/drivers/net/ipa/ipa_data.h
+++ b/drivers/net/ipa/ipa_data.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
 /* Copyright (c) 2012-2018, The Linux Foundation. All rights reserved.
- * Copyright (C) 2019-2022 Linaro Ltd.
+ * Copyright (C) 2019-2023 Linaro Ltd.
  */
 #ifndef _IPA_DATA_H_
 #define _IPA_DATA_H_
@@ -249,5 +249,6 @@ extern const struct ipa_data ipa_data_v4_5;
 extern const struct ipa_data ipa_data_v4_7;
 extern const struct ipa_data ipa_data_v4_9;
 extern const struct ipa_data ipa_data_v4_11;
+extern const struct ipa_data ipa_data_v5_0;
 
 #endif /* _IPA_DATA_H_ */
diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 4cc8d8d6bc9b7..6a2f2fc2f501e 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -285,7 +285,7 @@ static void ipa_hardware_config_comp(struct ipa *ipa)
 	} else if (ipa->version < IPA_VERSION_4_5) {
 		val |= reg_bit(reg, GSI_MULTI_AXI_MASTERS_DIS);
 	} else {
-		/* For IPA v4.5 FULL_FLUSH_WAIT_RS_CLOSURE_EN is 0 */
+		/* For IPA v4.5+ FULL_FLUSH_WAIT_RS_CLOSURE_EN is 0 */
 	}
 
 	val |= reg_bit(reg, GSI_MULTI_INORDER_RD_DIS);
@@ -684,6 +684,10 @@ static const struct of_device_id ipa_match[] = {
 		.compatible	= "qcom,sc7280-ipa",
 		.data		= &ipa_data_v4_11,
 	},
+	{
+		.compatible	= "qcom,sdx65-ipa",
+		.data		= &ipa_data_v5_0,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, ipa_match);
-- 
2.34.1

