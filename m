Return-Path: <linux-arm-msm+bounces-114078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jZ23BB7lOWokywcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 03:45:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B25EF6B355D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 03:45:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=lvq8GiGz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114078-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114078-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C52F630517BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 01:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44D5385D85;
	Tue, 23 Jun 2026 01:44:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BB43859E9;
	Tue, 23 Jun 2026 01:44:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782179061; cv=none; b=Qyyv2R+y4wlTvesA+TmcPedsIrI+0Vb0YWX9kfU9MSXresdBDV1W3yxd1aZSSNTcBiuErnEGTo13nGuPY9xs71f1zTl2yzmdlgIFIkEPbzTfYmqVP43gMQSTiiGrf22i1Hul84ePuo6PbL3CGnycqrO8YxlgAXf09WcnNbwN1kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782179061; c=relaxed/simple;
	bh=DCS1za55/rSsh5bVMlsWkkrErILlwbOCuD+tx0Uth0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DU4iKxZ/U7RVyiA2WENpt5DIETst0rENYbI/LGjFwXQVudFxf/0uLiqrNJMDNkrk6X2z7ESPkZTjy2L4CVZgKoofOVGY5Q/ib75ykBgaFS360cg5rJb/BtAhIAdN//DKwDMgOsAxDet+0cGq4PWZcoTWAeY11hP6X2LuFn+Ytgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lvq8GiGz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 295A2C2BCF5;
	Tue, 23 Jun 2026 01:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782179061;
	bh=DCS1za55/rSsh5bVMlsWkkrErILlwbOCuD+tx0Uth0Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lvq8GiGzZIFbKTZVhko78Cpje5g94kLeO4//dcm61AQo1LKfChrWQ4E22D8nOvb4V
	 2LFb4r4iAp7BDHTpaaBs1HXBE9oLW8L+JkZTklMZJDSnQ6mM7R+XQHMgLV4xYpIFrv
	 OxxyxwOGeerCfY7KbultwcDvfqxZIT3UXDzXL2/tan415mVpAcOo/plbPA7AxjZm7x
	 OSs7NF3oJorx4QkoHIbrDL1zgxTFqOuy+IZKRqu3amtDMn3eweIO19zBaR29CvYi/l
	 AaFTqn33lC7nq7ZWkfCNcb87S1Vcqu7ENsngSWf/AYi6/XDgtXdjsfOyAyThl5/F2x
	 +0wvg/jgDaRrQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDEACDB46F;
	Tue, 23 Jun 2026 01:44:21 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Mon, 22 Jun 2026 21:44:19 -0400
Subject: [PATCH 3/3] net: ipa: Add IPA v5.1 data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-sm8450-ipa-v1-3-532f0299f96e@proton.me>
References: <20260622-sm8450-ipa-v1-0-532f0299f96e@proton.me>
In-Reply-To: <20260622-sm8450-ipa-v1-0-532f0299f96e@proton.me>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782179059; l=14925;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=v6K46HlhdIU4i2Dn8Ai622b7nj00uVugNirCPctoJHI=;
 b=2/O8lsVT4VXuTaZBQvcfRZjMvLG4DGx4PWEFk4fFKFDulVH1gP1sI00PGZnLiao7pPH1vDJ9s
 iPZDQV/oGiTC3IuZjI7c0O1sccOmOzEuFN5l6o4oFH8tXrmuSj0oPkm
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114078-lists,linux-arm-msm=lfdr.de,esteuwu.proton.me];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:elder@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:esteuwu@proton.me,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[esteuwu@proton.me];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,proton.me:replyto,proton.me:email,proton.me:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B25EF6B355D

From: Esteban Urrutia <esteuwu@proton.me>

Add the required ipa_data-v5.1.c file for IPA v5.1 along with changes
that declare IPA v5.1 support.
This version of IPA is used in both SM8450 and SM8475 SoCs.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 drivers/net/ipa/Makefile             |   2 +-
 drivers/net/ipa/data/ipa_data-v5.1.c | 477 +++++++++++++++++++++++++++++++++++
 drivers/net/ipa/gsi_reg.c            |   1 +
 drivers/net/ipa/ipa_data.h           |   1 +
 drivers/net/ipa/ipa_main.c           |   4 +
 drivers/net/ipa/ipa_reg.c            |   1 +
 6 files changed, 485 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ipa/Makefile b/drivers/net/ipa/Makefile
index e148ec3c1a10..d4995c2e8ca0 100644
--- a/drivers/net/ipa/Makefile
+++ b/drivers/net/ipa/Makefile
@@ -7,7 +7,7 @@ IPA_REG_VERSIONS	:=	3.1 3.5.1 4.2 4.5 4.7 4.9 4.11 5.0 5.5
 # Some IPA versions can reuse another set of GSI register definitions.
 GSI_REG_VERSIONS	:=	3.1 3.5.1 4.0 4.5 4.9 4.11 5.0
 
-IPA_DATA_VERSIONS	:=	3.1 3.5.1 4.2 4.5 4.7 4.9 4.11 5.0 5.2 5.5
+IPA_DATA_VERSIONS	:=	3.1 3.5.1 4.2 4.5 4.7 4.9 4.11 5.0 5.1 5.2 5.5
 
 obj-$(CONFIG_QCOM_IPA)	+=	ipa.o
 
diff --git a/drivers/net/ipa/data/ipa_data-v5.1.c b/drivers/net/ipa/data/ipa_data-v5.1.c
new file mode 100644
index 000000000000..85b21efa1224
--- /dev/null
+++ b/drivers/net/ipa/data/ipa_data-v5.1.c
@@ -0,0 +1,477 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright (C) 2023-2024 Linaro Ltd. */
+/* Copyright (C) 2026 Esteban Urrutia <esteuwu@proton.me> */
+
+#include <linux/array_size.h>
+#include <linux/log2.h>
+
+#include "../ipa_data.h"
+#include "../ipa_endpoint.h"
+#include "../ipa_mem.h"
+#include "../ipa_version.h"
+
+/** enum ipa_resource_type - IPA resource types for an SoC having IPA v5.1 */
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
+/* Resource groups used for an SoC having IPA v5.1 */
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
+/* QSB configuration data for an SoC having IPA v5.1 */
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
+/* Endpoint configuration data for an SoC having IPA v5.1 */
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
+				.resource_group	= IPA_RSRC_GROUP_DST_UL,
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
+/* Source resource configuration data for an SoC having IPA v5.1 */
+static const struct ipa_resource ipa_resource_src[] = {
+	[IPA_RESOURCE_TYPE_SRC_PKT_CONTEXTS] = {
+		.limits[IPA_RSRC_GROUP_SRC_UL] = {
+			.min = 7,	.max = 12,
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
+			.min = 21,	.max = 21,
+		},
+		.limits[IPA_RSRC_GROUP_SRC_URLLC] = {
+			.min = 10,	.max = 10,
+		},
+	},
+	[IPA_RESOURCE_TYPE_SRC_DESCRIPTOR_BUFF] = {
+		.limits[IPA_RSRC_GROUP_SRC_UL] = {
+			.min = 33,	.max = 33,
+		},
+		.limits[IPA_RSRC_GROUP_SRC_URLLC] = {
+			.min = 20,	.max = 20,
+		},
+	},
+	[IPA_RESOURCE_TYPE_SRC_HPS_DMARS] = {
+		.limits[IPA_RSRC_GROUP_SRC_UL] = {
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
+			.min = 38,	.max = 38,
+		},
+		.limits[IPA_RSRC_GROUP_SRC_URLLC] = {
+			.min = 16,	.max = 16,
+		},
+	},
+};
+
+/* Destination resource configuration data for an SoC having IPA v5.1 */
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
+/* Resource configuration data for an SoC having IPA v5.1 */
+static const struct ipa_resource_data ipa_resource_data = {
+	.rsrc_group_dst_count	= IPA_RSRC_GROUP_DST_COUNT,
+	.rsrc_group_src_count	= IPA_RSRC_GROUP_SRC_COUNT,
+	.resource_src_count	= ARRAY_SIZE(ipa_resource_src),
+	.resource_src		= ipa_resource_src,
+	.resource_dst_count	= ARRAY_SIZE(ipa_resource_dst),
+	.resource_dst		= ipa_resource_dst,
+};
+
+/* IPA-resident memory region data for an SoC having IPA v5.1 */
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
+/* Memory configuration data for an SoC having IPA v5.1 */
+static const struct ipa_mem_data ipa_mem_data = {
+	.local_count	= ARRAY_SIZE(ipa_mem_local_data),
+	.local		= ipa_mem_local_data,
+	.imem_addr	= 0x146a8000,
+	.imem_size	= 0x00002000,
+	/*
+	 * While this value is 0xb000 on SM8450 and 0x9000 on SM8475,
+	 * it has been left set to 0x9000 for compatibility with SM8475
+	 */
+	.smem_size	= 0x00009000,
+};
+
+/* Interconnect rates are in 1000 byte/second units */
+static const struct ipa_interconnect_data ipa_interconnect_data[] = {
+	{
+		.name			= "memory",
+		.peak_bandwidth		= 1900000,	/* 1.9 GBps */
+		.average_bandwidth	= 590000,	/* 590 MBps */
+	},
+	/* Average rate is unused for the next interconnect */
+	{
+		.name			= "config",
+		.peak_bandwidth		= 76800,	/* 76.8 MBps */
+		.average_bandwidth	= 0,		/* unused */
+	},
+};
+
+/* Clock and interconnect configuration data for an SoC having IPA v5.1 */
+static const struct ipa_power_data ipa_power_data = {
+	.core_clock_rate	= 120 * 1000 * 1000,	/* Hz */
+	.interconnect_count	= ARRAY_SIZE(ipa_interconnect_data),
+	.interconnect_data	= ipa_interconnect_data,
+};
+
+/* Configuration data for an SoC having IPA v5.1. */
+const struct ipa_data ipa_data_v5_1 = {
+	.version		= IPA_VERSION_5_1,
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
index e13cf835a013..a57072ba4bef 100644
--- a/drivers/net/ipa/gsi_reg.c
+++ b/drivers/net/ipa/gsi_reg.c
@@ -110,6 +110,7 @@ static const struct regs *gsi_regs(struct gsi *gsi)
 		return &gsi_regs_v4_11;
 
 	case IPA_VERSION_5_0:
+	case IPA_VERSION_5_1:
 	case IPA_VERSION_5_2:
 	case IPA_VERSION_5_5:
 		return &gsi_regs_v5_0;
diff --git a/drivers/net/ipa/ipa_data.h b/drivers/net/ipa/ipa_data.h
index 3eb9dc2ce339..fe6f7d5bfe88 100644
--- a/drivers/net/ipa/ipa_data.h
+++ b/drivers/net/ipa/ipa_data.h
@@ -253,6 +253,7 @@ extern const struct ipa_data ipa_data_v4_7;
 extern const struct ipa_data ipa_data_v4_9;
 extern const struct ipa_data ipa_data_v4_11;
 extern const struct ipa_data ipa_data_v5_0;
+extern const struct ipa_data ipa_data_v5_1;
 extern const struct ipa_data ipa_data_v5_2;
 extern const struct ipa_data ipa_data_v5_5;
 
diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 788dd99af2a4..6c449032ae45 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -669,6 +669,10 @@ static const struct of_device_id ipa_match[] = {
 		.compatible	= "qcom,sdx65-ipa",
 		.data		= &ipa_data_v5_0,
 	},
+	{
+		.compatible	= "qcom,sm8450-ipa",
+		.data		= &ipa_data_v5_1,
+	},
 	{
 		.compatible	= "qcom,milos-ipa",
 		.data		= &ipa_data_v5_2,
diff --git a/drivers/net/ipa/ipa_reg.c b/drivers/net/ipa/ipa_reg.c
index 30bd69f4c147..5f22ca6295b1 100644
--- a/drivers/net/ipa/ipa_reg.c
+++ b/drivers/net/ipa/ipa_reg.c
@@ -125,6 +125,7 @@ static const struct regs *ipa_regs(enum ipa_version version)
 	case IPA_VERSION_4_11:
 		return &ipa_regs_v4_11;
 	case IPA_VERSION_5_0:
+	case IPA_VERSION_5_1:
 	case IPA_VERSION_5_2:
 		return &ipa_regs_v5_0;
 	case IPA_VERSION_5_5:

-- 
2.54.0



