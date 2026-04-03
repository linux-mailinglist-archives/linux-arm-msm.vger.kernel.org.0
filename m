Return-Path: <linux-arm-msm+bounces-101692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDhQDLPwz2mt1wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 18:54:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 24608396A63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 18:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2B2BC30419CD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 16:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC1E3CF02C;
	Fri,  3 Apr 2026 16:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="npZTOynJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C983CF05C
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 16:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775234650; cv=none; b=gpKLGfdnT/hW5RCjtzyZHSpSKCf79aj6VSj4J3ZlCYC7pjPOLjM+HY6L00nW7v85rrGIofQdjhtWajWQ+aEIcpvqXTzcEy/UA+6D2gDe3CZSw79nuCq4YV2ps+Xi3DrXkv4oDQvVmJckENynZuEZnTLLLQ1dHFm7jMEPgQLD2CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775234650; c=relaxed/simple;
	bh=jUo7g6I6p1JHRet0ueHk1c8pIkO2J9jMZW92HH837/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tDxZ/8i0dK5CShUr33Or4iWHuvSjjOS6hh4/IXWEHEylUXaop3La1w6GgWbppcQRIPawcE+zzNpCEaVtw47iywBh0xXEh0S1Xo0kzYdHAZqcfl5iw0I+vgBal3Ur5PQMl10BWB30UGZKLT+uw3fd66aExSszobLVbDpS9WIQiUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=npZTOynJ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9c01854477so340663266b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 09:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775234646; x=1775839446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QjmM2Mpf5DG2HMl6DFCBhwEENmYRUZMzi1UWvgQwg/I=;
        b=npZTOynJAVlQA/w7DPNPyaTcZ2lY8vtTPgacoSer+GuOj+uOljtK37q/P4SRsF3KK9
         wP0XN5+6dcN2/hiePC0xPn+4ShGmXKy6D1kJYSowSdJrFY13qPj2gB22+iyAKGz0M/ee
         ZOuEpRDfOlgKV5O6wz71EeKK1ekZJNyuHdIrd1wDrTrmABYYvITjwzp/feoq7+BiVUfU
         0MptLTtZHPQl52OuL1nQCAKDWJLKgyIisWkUL8Krnz+8sqpDwgdFWIDY1cx54cy3DLDo
         H8TE82qFTDQkQ6I+RHUXX5u1EB3HZrSPsMQ0PD2br9hV4s+AXiMHSUhemLCNvjP9mPye
         j/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775234646; x=1775839446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QjmM2Mpf5DG2HMl6DFCBhwEENmYRUZMzi1UWvgQwg/I=;
        b=ix5dngY0zM0YJ/xtJ0+glKRIVkMcPLJtGpsKZr8zIudwQ4r6pJVEUeIoBysTnvUciV
         sUsXhCJP79G/VaAyMDUYyeeHJ7pmb/ZUz9Wl+qKsmpqNcrssuD80EnTd30ADyl2Xk+EI
         6/gRVFo8dqdkl+21unoDvI77L0uDNG5ViNqxzECkqTT1r3+ZovZSvGw1Kt6gnCZeGFM7
         765TZdhxILIqpUgJtd6lwmsbsKogd2wN5OjCsUqDJFh/XTJmiS6Zgh8VTp6oVxm4UKvJ
         9ThDwBnRY5/N4dPtKzMyPeBPMxgsDVu/w1hIlly7kgEb2+So3zuma9JdwjOA9BAciE+f
         Xtyw==
X-Forwarded-Encrypted: i=1; AJvYcCXEkQiqicx1p1l07I5nEUD28dB6ic8A78CBcEad4D5C+Uo6gC76NYagxfSJkMy2HbiUfZm5eOdt/cOIdP+l@vger.kernel.org
X-Gm-Message-State: AOJu0YyRxyfoJkmb6ojjmaMXHd2UcoCmzuqioR2PmeHHPE6jFkKLxMXt
	VCJoS5fZxdGLCyBxco+ZtiAT51NcqvZbytPEDzkFdR2v0Iv7CUXRrXmF70zAWzB1ny4=
X-Gm-Gg: AeBDiesz3buTxWXN1yPUZboVByfUghsxRqvQ+9fBSnZlEF7DqWMGUgvkZRTF1cZDuwF
	ToeAXlMhach8TS8jZt9oUfd+6zICqfRtMMJolcULQcEe30RAxnxHCX/GRBJaLVLkJUT5BHH4cAk
	4mGY5LgpDi+0l6FdPAcSnZfSB1gWgdGSOHNPPq453PqdnAHpUAOwAC+9X8wOaqs8/0W2KDrTuFE
	d1rsJOs7oBwety1gzAjN4HPCK0dqxbXWggzxscaaMQ8PQZn1CUiArQPrEFFjXK3bmk7kVErllV4
	3sdWuDRBoEJ8k+jVxVilkCakSjxEPrUMfBkDz1zwYOOPyfZzhteyt0M26xPiHDMLONjNkaO6FMP
	guGn2YCVHMLeQa4kL6Nc4yWWE+Rkup/T+AaMsSVa9YIezYuXYWBkqo6NE15bktyljyITDzwbMiT
	dXlX3qecCJVoBl+E2wJ/1hOcgbFLoX1CwiuPv9gH2MsffnbKpUFfzdt72yCRHtMTejIqkRwVmcv
	121u5s3yEAOWm2JPsbJNaR47mJd/D5IyVz57YW8A/9OqWQx
X-Received: by 2002:a17:907:6eab:b0:b98:4a7a:d5f8 with SMTP id a640c23a62f3a-b9c67a10a6fmr185072266b.46.1775234645548;
        Fri, 03 Apr 2026 09:44:05 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3ca9a145sm213492566b.25.2026.04.03.09.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 09:44:04 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 18:43:50 +0200
Subject: [PATCH 4/6] net: ipa: add IPA v5.2 configuration data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-ipa-v1-4-01e9e4e03d3e@fairphone.com>
References: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
In-Reply-To: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
To: Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775234639; l=15389;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=jUo7g6I6p1JHRet0ueHk1c8pIkO2J9jMZW92HH837/g=;
 b=FFV557m6AuzXzr7rZcZPUpu6eFseOqmjavF2MzNSYrIvBbIFl1EDhWxwMFEJ8Yf1rL0hk93Or
 hCbkN2iIGXDCmgefKfNZH9TcWhFG0l4wH++5hpdN2yWYR6hKMI3S6Ko
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101692-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 24608396A63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the configuration data required for IPA v5.2, which is used in
the Qualcomm Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/net/ipa/Makefile             |   2 +-
 drivers/net/ipa/data/ipa_data-v5.2.c | 452 +++++++++++++++++++++++++++++++++++
 drivers/net/ipa/gsi_reg.c            |   1 +
 drivers/net/ipa/ipa_data.h           |   1 +
 drivers/net/ipa/ipa_main.c           |   4 +
 drivers/net/ipa/ipa_reg.c            |   1 +
 drivers/net/ipa/ipa_sysfs.c          |   2 +
 drivers/net/ipa/ipa_version.h        |   2 +
 8 files changed, 464 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ipa/Makefile b/drivers/net/ipa/Makefile
index d3abb38633e0..e148ec3c1a10 100644
--- a/drivers/net/ipa/Makefile
+++ b/drivers/net/ipa/Makefile
@@ -7,7 +7,7 @@ IPA_REG_VERSIONS	:=	3.1 3.5.1 4.2 4.5 4.7 4.9 4.11 5.0 5.5
 # Some IPA versions can reuse another set of GSI register definitions.
 GSI_REG_VERSIONS	:=	3.1 3.5.1 4.0 4.5 4.9 4.11 5.0
 
-IPA_DATA_VERSIONS	:=	3.1 3.5.1 4.2 4.5 4.7 4.9 4.11 5.0 5.5
+IPA_DATA_VERSIONS	:=	3.1 3.5.1 4.2 4.5 4.7 4.9 4.11 5.0 5.2 5.5
 
 obj-$(CONFIG_QCOM_IPA)	+=	ipa.o
 
diff --git a/drivers/net/ipa/data/ipa_data-v5.2.c b/drivers/net/ipa/data/ipa_data-v5.2.c
new file mode 100644
index 000000000000..c56c4f1836ae
--- /dev/null
+++ b/drivers/net/ipa/data/ipa_data-v5.2.c
@@ -0,0 +1,452 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023-2024 Linaro Ltd.
+ * Copyright (c) 2026, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#include <linux/array_size.h>
+#include <linux/log2.h>
+
+#include "../ipa_data.h"
+#include "../ipa_endpoint.h"
+#include "../ipa_mem.h"
+#include "../ipa_version.h"
+
+/** enum ipa_resource_type - IPA resource types for an SoC having IPA v5.2 */
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
+/* Resource groups used for an SoC having IPA v5.2 */
+enum ipa_rsrc_group_id {
+	/* Source resource group identifiers */
+	IPA_RSRC_GROUP_SRC_UL				= 0,
+	IPA_RSRC_GROUP_SRC_DL,
+	IPA_RSRC_GROUP_SRC_URLLC,
+	IPA_RSRC_GROUP_SRC_COUNT,	/* Last in set; not a source group */
+
+	/* Destination resource group identifiers */
+	IPA_RSRC_GROUP_DST_UL				= 0,
+	IPA_RSRC_GROUP_DST_DL,
+	IPA_RSRC_GROUP_DST_UNUSED_1,
+	IPA_RSRC_GROUP_DST_DRB_IP,
+	IPA_RSRC_GROUP_DST_COUNT,	/* Last; not a destination group */
+};
+
+/* QSB configuration data for an SoC having IPA v5.2 */
+static const struct ipa_qsb_data ipa_qsb_data[] = {
+	[IPA_QSB_MASTER_DDR] = {
+		.max_writes		= 13,
+		.max_reads		= 13,
+		.max_reads_beats	= 0,
+	},
+};
+
+/* Endpoint configuration data for an SoC having IPA v5.2 */
+static const struct ipa_gsi_endpoint_data ipa_gsi_endpoint_data[] = {
+	[IPA_ENDPOINT_AP_COMMAND_TX] = {
+		.ee_id		= GSI_EE_AP,
+		.channel_id	= 6,
+		.endpoint_id	= 9,
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
+		.channel_id	= 7,
+		.endpoint_id	= 11,
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
+		.channel_id	= 5,
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
+		.channel_id	= 9,
+		.endpoint_id	= 18,
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
+		.endpoint_id	= 7,
+		.toward_ipa	= true,
+		.endpoint = {
+			.filter_support	= true,
+		},
+	},
+	[IPA_ENDPOINT_MODEM_AP_RX] = {
+		.ee_id		= GSI_EE_MODEM,
+		.channel_id	= 7,
+		.endpoint_id	= 16,
+		.toward_ipa	= false,
+	},
+	[IPA_ENDPOINT_MODEM_DL_NLO_TX] = {
+		.ee_id		= GSI_EE_MODEM,
+		.channel_id	= 2,
+		.endpoint_id	= 10,
+		.toward_ipa	= true,
+		.endpoint = {
+			.filter_support	= true,
+		},
+	},
+};
+
+/* Source resource configuration data for an SoC having IPA v5.2 */
+static const struct ipa_resource ipa_resource_src[] = {
+	[IPA_RESOURCE_TYPE_SRC_PKT_CONTEXTS] = {
+		.limits[IPA_RSRC_GROUP_SRC_UL] = {
+			.min = 1,	.max = 7,
+		},
+		.limits[IPA_RSRC_GROUP_SRC_DL] = {
+			.min = 1,	.max = 7,
+		},
+		.limits[IPA_RSRC_GROUP_SRC_URLLC] = {
+			.min = 0,	.max = 5,
+		},
+	},
+	[IPA_RESOURCE_TYPE_SRC_DESCRIPTOR_LISTS] = {
+		.limits[IPA_RSRC_GROUP_SRC_UL] = {
+			.min = 8,	.max = 8,
+		},
+		.limits[IPA_RSRC_GROUP_SRC_DL] = {
+			.min = 8,	.max = 8,
+		},
+		.limits[IPA_RSRC_GROUP_SRC_URLLC] = {
+			.min = 8,	.max = 8,
+		},
+	},
+	[IPA_RESOURCE_TYPE_SRC_DESCRIPTOR_BUFF] = {
+		.limits[IPA_RSRC_GROUP_SRC_UL] = {
+			.min = 10,	.max = 10,
+		},
+		.limits[IPA_RSRC_GROUP_SRC_DL] = {
+			.min = 12,	.max = 12,
+		},
+		.limits[IPA_RSRC_GROUP_SRC_URLLC] = {
+			.min = 12,	.max = 12,
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
+			.min = 0,	.max = 63,
+		},
+	},
+	[IPA_RESOURCE_TYPE_SRC_ACK_ENTRIES] = {
+		.limits[IPA_RSRC_GROUP_SRC_UL] = {
+			.min = 15,	.max = 15,
+		},
+		.limits[IPA_RSRC_GROUP_SRC_DL] = {
+			.min = 15,	.max = 15,
+		},
+		.limits[IPA_RSRC_GROUP_SRC_URLLC] = {
+			.min = 12,	.max = 12,
+		},
+	},
+};
+
+/* Destination resource configuration data for an SoC having IPA v5.2 */
+static const struct ipa_resource ipa_resource_dst[] = {
+	[IPA_RESOURCE_TYPE_DST_DATA_SECTORS] = {
+		.limits[IPA_RSRC_GROUP_DST_UL] = {
+			.min = 3,	.max = 3,
+		},
+		.limits[IPA_RSRC_GROUP_DST_DL] = {
+			.min = 3,	.max = 3,
+		},
+		.limits[IPA_RSRC_GROUP_DST_DRB_IP] = {
+			.min = 23,	.max = 23,
+		},
+	},
+	[IPA_RESOURCE_TYPE_DST_DPS_DMARS] = {
+		.limits[IPA_RSRC_GROUP_DST_UL] = {
+			.min = 1,	.max = 2,
+		},
+		.limits[IPA_RSRC_GROUP_DST_DL] = {
+			.min = 1,	.max = 2,
+		},
+	},
+	[IPA_RESOURCE_TYPE_DST_ULSO_SEGMENTS] = {
+		.limits[IPA_RSRC_GROUP_DST_UL] = {
+			.min = 1,	.max = 63,
+		},
+		.limits[IPA_RSRC_GROUP_DST_DL] = {
+			.min = 1,	.max = 63,
+		},
+	},
+};
+
+/* Resource configuration data for an SoC having IPA v5.2 */
+static const struct ipa_resource_data ipa_resource_data = {
+	.rsrc_group_dst_count	= IPA_RSRC_GROUP_DST_COUNT,
+	.rsrc_group_src_count	= IPA_RSRC_GROUP_SRC_COUNT,
+	.resource_src_count	= ARRAY_SIZE(ipa_resource_src),
+	.resource_src		= ipa_resource_src,
+	.resource_dst_count	= ARRAY_SIZE(ipa_resource_dst),
+	.resource_dst		= ipa_resource_dst,
+};
+
+/* IPA-resident memory region data for an SoC having IPA v5.2 */
+static const struct ipa_mem ipa_mem_local_data[] = {
+	{
+		.id		= IPA_MEM_UC_SHARED,
+		.offset		= 0x0000,
+		.size		= 0x0080,
+		.canary_count	= 0,
+	},
+	{
+		.id		= IPA_MEM_UC_INFO,
+		.offset		= 0x0080,
+		.size		= 0x0200,
+		.canary_count	= 0,
+	},
+	{
+		.id		= IPA_MEM_V4_FILTER_HASHED,
+		.offset		= 0x0288,
+		.size		= 0x0078,
+		.canary_count	= 2,
+	},
+	{
+		.id		= IPA_MEM_V4_FILTER,
+		.offset		= 0x0308,
+		.size		= 0x0078,
+		.canary_count	= 2,
+	},
+	{
+		.id		= IPA_MEM_V6_FILTER_HASHED,
+		.offset		= 0x0388,
+		.size		= 0x0078,
+		.canary_count	= 2,
+	},
+	{
+		.id		= IPA_MEM_V6_FILTER,
+		.offset		= 0x0408,
+		.size		= 0x0078,
+		.canary_count	= 2,
+	},
+	{
+		.id		= IPA_MEM_V4_ROUTE_HASHED,
+		.offset		= 0x0488,
+		.size		= 0x0098,
+		.canary_count	= 2,
+	},
+	{
+		.id		= IPA_MEM_V4_ROUTE,
+		.offset		= 0x0528,
+		.size		= 0x0098,
+		.canary_count	= 2,
+	},
+	{
+		.id		= IPA_MEM_V6_ROUTE_HASHED,
+		.offset		= 0x05c8,
+		.size		= 0x0098,
+		.canary_count	= 2,
+	},
+	{
+		.id		= IPA_MEM_V6_ROUTE,
+		.offset		= 0x0668,
+		.size		= 0x0098,
+		.canary_count	= 2,
+	},
+	{
+		.id		= IPA_MEM_MODEM_HEADER,
+		.offset		= 0x0708,
+		.size		= 0x0240,
+		.canary_count	= 2,
+	},
+	{
+		.id		= IPA_MEM_AP_HEADER,
+		.offset		= 0x0948,
+		.size		= 0x01e0,
+		.canary_count	= 0,
+	},
+	{
+		.id		= IPA_MEM_MODEM_PROC_CTX,
+		.offset		= 0x0b40,
+		.size		= 0x0b20,
+		.canary_count	= 2,
+	},
+	{
+		.id		= IPA_MEM_AP_PROC_CTX,
+		.offset		= 0x1660,
+		.size		= 0x0200,
+		.canary_count	= 0,
+	},
+	{
+		.id		= IPA_MEM_STATS_QUOTA_MODEM,
+		.offset		= 0x1868,
+		.size		= 0x0060,
+		.canary_count	= 2,
+	},
+	{
+		.id		= IPA_MEM_STATS_QUOTA_AP,
+		.offset		= 0x18c8,
+		.size		= 0x0048,
+		.canary_count	= 0,
+	},
+	{
+		.id		= IPA_MEM_STATS_TETHERING,
+		.offset		= 0x1910,
+		.size		= 0x03c0,
+		.canary_count	= 0,
+	},
+	{
+		.id		= IPA_MEM_STATS_FILTER_ROUTE,
+		.offset		= 0x1cd0,
+		.size		= 0x0ba0,
+		.canary_count	= 0,
+	},
+	{
+		.id		= IPA_MEM_STATS_DROP,
+		.offset		= 0x2870,
+		.size		= 0x0020,
+		.canary_count	= 0,
+	},
+	{
+		.id		= IPA_MEM_MODEM,
+		.offset		= 0x2898,
+		.size		= 0x0d48,
+		.canary_count	= 2,
+	},
+	{
+		.id		= IPA_MEM_NAT_TABLE,
+		.offset		= 0x35e0,
+		.size		= 0x0900,
+		.canary_count	= 0,
+	},
+	{
+		.id		= IPA_MEM_PDN_CONFIG,
+		.offset		= 0x3ee8,
+		.size		= 0x0100,
+		.canary_count	= 2,
+	},
+};
+
+/* Memory configuration data for an SoC having IPA v5.2 */
+static const struct ipa_mem_data ipa_mem_data = {
+	.local_count	= ARRAY_SIZE(ipa_mem_local_data),
+	.local		= ipa_mem_local_data,
+	.smem_size	= 0x0000b000,
+};
+
+/* Interconnect rates are in 1000 byte/second units */
+static const struct ipa_interconnect_data ipa_interconnect_data[] = {
+	{
+		.name			= "memory",
+		.peak_bandwidth		= 1300000,	/* 1.3 GBps */
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
+/* Clock and interconnect configuration data for an SoC having IPA v5.2 */
+static const struct ipa_power_data ipa_power_data = {
+	.core_clock_rate	= 120 * 1000 * 1000,	/* Hz */
+	.interconnect_count	= ARRAY_SIZE(ipa_interconnect_data),
+	.interconnect_data	= ipa_interconnect_data,
+};
+
+/* Configuration data for an SoC having IPA v5.2. */
+const struct ipa_data ipa_data_v5_2 = {
+	.version		= IPA_VERSION_5_2,
+	.qsb_count		= ARRAY_SIZE(ipa_qsb_data),
+	.qsb_data		= ipa_qsb_data,
+	.modem_route_count	= 11,
+	.endpoint_count		= ARRAY_SIZE(ipa_gsi_endpoint_data),
+	.endpoint_data		= ipa_gsi_endpoint_data,
+	.resource_data		= &ipa_resource_data,
+	.mem_data		= &ipa_mem_data,
+	.power_data		= &ipa_power_data,
+};
diff --git a/drivers/net/ipa/gsi_reg.c b/drivers/net/ipa/gsi_reg.c
index 825598661188..e13cf835a013 100644
--- a/drivers/net/ipa/gsi_reg.c
+++ b/drivers/net/ipa/gsi_reg.c
@@ -110,6 +110,7 @@ static const struct regs *gsi_regs(struct gsi *gsi)
 		return &gsi_regs_v4_11;
 
 	case IPA_VERSION_5_0:
+	case IPA_VERSION_5_2:
 	case IPA_VERSION_5_5:
 		return &gsi_regs_v5_0;
 
diff --git a/drivers/net/ipa/ipa_data.h b/drivers/net/ipa/ipa_data.h
index f3bdc64cef05..3eb9dc2ce339 100644
--- a/drivers/net/ipa/ipa_data.h
+++ b/drivers/net/ipa/ipa_data.h
@@ -253,6 +253,7 @@ extern const struct ipa_data ipa_data_v4_7;
 extern const struct ipa_data ipa_data_v4_9;
 extern const struct ipa_data ipa_data_v4_11;
 extern const struct ipa_data ipa_data_v5_0;
+extern const struct ipa_data ipa_data_v5_2;
 extern const struct ipa_data ipa_data_v5_5;
 
 #endif /* _IPA_DATA_H_ */
diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index edead9c48d1f..8e2b4bf7b14e 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -669,6 +669,10 @@ static const struct of_device_id ipa_match[] = {
 		.compatible	= "qcom,sdx65-ipa",
 		.data		= &ipa_data_v5_0,
 	},
+	{
+		.compatible	= "qcom,milos-ipa",
+		.data		= &ipa_data_v5_2,
+	},
 	{
 		.compatible	= "qcom,sm8550-ipa",
 		.data		= &ipa_data_v5_5,
diff --git a/drivers/net/ipa/ipa_reg.c b/drivers/net/ipa/ipa_reg.c
index c574f798fdc9..30bd69f4c147 100644
--- a/drivers/net/ipa/ipa_reg.c
+++ b/drivers/net/ipa/ipa_reg.c
@@ -125,6 +125,7 @@ static const struct regs *ipa_regs(enum ipa_version version)
 	case IPA_VERSION_4_11:
 		return &ipa_regs_v4_11;
 	case IPA_VERSION_5_0:
+	case IPA_VERSION_5_2:
 		return &ipa_regs_v5_0;
 	case IPA_VERSION_5_5:
 		return &ipa_regs_v5_5;
diff --git a/drivers/net/ipa/ipa_sysfs.c b/drivers/net/ipa/ipa_sysfs.c
index a53e9e6f6cdf..8b805a9d49e6 100644
--- a/drivers/net/ipa/ipa_sysfs.c
+++ b/drivers/net/ipa/ipa_sysfs.c
@@ -39,6 +39,8 @@ static const char *ipa_version_string(struct ipa *ipa)
 		return "5.0";
 	case IPA_VERSION_5_1:
 		return "5.1";
+	case IPA_VERSION_5_2:
+		return "5.2";
 	case IPA_VERSION_5_5:
 		return "5.5";
 	default:
diff --git a/drivers/net/ipa/ipa_version.h b/drivers/net/ipa/ipa_version.h
index 38c47f51a50c..c157c72a5bad 100644
--- a/drivers/net/ipa/ipa_version.h
+++ b/drivers/net/ipa/ipa_version.h
@@ -23,6 +23,7 @@
  * @IPA_VERSION_4_11:	IPA version 4.11/GSI version 2.11 (2.1.1)
  * @IPA_VERSION_5_0:	IPA version 5.0/GSI version 3.0
  * @IPA_VERSION_5_1:	IPA version 5.1/GSI version 3.0
+ * @IPA_VERSION_5_2:	IPA version 5.2/GSI version 5.2
  * @IPA_VERSION_5_5:	IPA version 5.5/GSI version 5.5
  * @IPA_VERSION_COUNT:	Number of defined IPA versions
  *
@@ -43,6 +44,7 @@ enum ipa_version {
 	IPA_VERSION_4_11,
 	IPA_VERSION_5_0,
 	IPA_VERSION_5_1,
+	IPA_VERSION_5_2,
 	IPA_VERSION_5_5,
 	IPA_VERSION_COUNT,			/* Last; not a version */
 };

-- 
2.53.0


