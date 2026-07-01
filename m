Return-Path: <linux-arm-msm+bounces-115670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wQKhI5vzRGqm3woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:01:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BFF6EC7E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:01:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UxZtzAcX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115670-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115670-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E582E30A15F7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 10:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C7A44CF2C;
	Wed,  1 Jul 2026 10:58:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E31A3B5835;
	Wed,  1 Jul 2026 10:58:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903507; cv=none; b=cbDB294NbpUqAswU2n/ECvhCPA0t5l/UsFIXsZxTA4xOEUK+ZN9eR4RP4ap1WUkBOskRrB+ghxrDVjzNOGNymcXfGgp76EAgd7sFmiSLJqKdfRQH0oJVy4jmy0FZ5ygUbjN5Quy1IiP2KpqZBjonUW9jql/zgt+mLbtwSXytGfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903507; c=relaxed/simple;
	bh=cY4AHz177hUAp0VHyF7+j0tVcJ903LxFD7QhWuSaovM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mULeKaL7MBGlnKqdiMDYc8ijoqQECnYy33wY46Vjogq6jXtWqyVfLUkoyHrPYrqy0UEZdrzBymfQ4ktSefkrvWrwuY0dLvL5kSLtbCTNjn6HCrC3IRAONGuJWV2buXKhIeRMIGzrYcLrDxIhkp7+dgXE3JISb3UD7SO3j9DW5Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UxZtzAcX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8hgx683205;
	Wed, 1 Jul 2026 10:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QINZiTkE0FU
	aNALRMjoqsT5kW2ZCNfprMWdirguOei8=; b=UxZtzAcXyMwxeAegd/vhn3ltK8g
	CGAAntnGS1gasPShbVAIK+LyXS7rVnRXR8dmX9KZU5R4aBQG0CEM7fnNEWsFoY0u
	Qzbq0elZENEDAF+xWCwjqA2k0eYVCx8ZKsBxkpteu/GlEenG8lkvw2vI57fcj8PO
	QMIEt70wicLyRx45fGa6tMgKVCN9ZuAI4f1ITVr0ACUY5kVpyJVF7ug+D0aLi9Ic
	FzaRJxsx1Ba6JOlx8xGQDNynphvXRg3RD1wr18Xh/fypfLXfVr3t8dL6Tx5kgBkX
	xZGmhahmfMCwamYd1NN2QNYABuk9yg/nvlvbZhDDC52/F6N6cNfIvZM00vA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jtqkuk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 10:58:22 +0000 (GMT)
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 661Aw2JE011886;
	Wed, 1 Jul 2026 10:58:19 GMT
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/11] ASoC: qcom: Add Shikra QAIF support
Date: Wed,  1 Jul 2026 16:27:56 +0530
Message-Id: <20260701105757.2779738-11-harendra.gautam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: mhoSH9OPkLgOju5qo1HqKwGdTkFzRdmS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfX1n6xQsyIB+zo
 QihN4EpvxRkfIDs7WGzzzlqjxM7S1bnd462S9eXo6qocFHSdId1KyAH4d2IZJ06rmxonHxR5VTT
 WQTjjbyE3TlSB9CLrzZcfyGS5YJNNhZcKrhHCJBz4FTLsVrvPe6T/odYf30O6Wx2rrCZPdURQkH
 6feA4QoXKdaoRmyBG2ucUY9t27W1Zb+ghKD3PNviSBlq55uzXcIhY6+OW1KyhZ6MWN9O3Ute4YC
 URjDPyl7NevXDDkrCLk5KWYNTIm0PJl0PLdc1fTUdifbICwsZ71wTmAt7LiZtY+2090c/l3TwkQ
 p1QYGcK+k/64/cZX2MYwY00EXCBpyhgnjWGqkClaE+9ge33G8GxnCtNddYiKx9s1X8xWRel9dIV
 yP+inz825mH12YAnu7Joit4ehrAvuqVqcrNS7BvX2aP3Pp9SwBqsRKOHcz/fLWQ/nX8swV4mfXC
 zD7+HparIZFxvMVVsvQ==
X-Proofpoint-GUID: mhoSH9OPkLgOju5qo1HqKwGdTkFzRdmS
X-Authority-Analysis: v=2.4 cv=LIZWhpW9 c=1 sm=1 tr=0 ts=6a44f2ce cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=EF1geXD8g3NidPiEAMMA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfXz2ty0ptCt4aQ
 hgcvIgQN1WqPO6PA0/BrZbA5ZDa1HuvlQj4ZMuTJhuNugsqGP62FOJm4a7PVyIoG//edAaK9wIc
 pTuS6IJBvZWpV1Ls0G+sW2j1z9sfi7I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-115670-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68BFF6EC7E0

Add the Shikra variant data for the Qualcomm Audio Interface driver and
hook it up to Kconfig and the qcom ASoC Makefile.

Shikra uses QAIF to move PCM data between memory, MI2S interfaces and the
Bolero codec CDC DMA paths. Without the SoC-specific register layout, DMA-
to-DAI mappings, clock list and DAI descriptors, Shikra-based platforms
cannot enable playback or capture through this block.

Provide the Shikra QAIF register field definitions, DMA mappings, DAI
descriptors, clock configuration and platform match data, and build them as
part of the snd-soc-qcom-qaif module.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 sound/soc/qcom/Kconfig       |  11 +
 sound/soc/qcom/Makefile      |   2 +
 sound/soc/qcom/qaif-shikra.c | 556 +++++++++++++++++++++++++++++++++++
 3 files changed, 569 insertions(+)
 create mode 100644 sound/soc/qcom/qaif-shikra.c

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index e6e24f3b9922..2eca25478fd4 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -71,6 +71,17 @@ config SND_SOC_QCOM_COMMON
 config SND_SOC_QCOM_SDW
 	tristate
 
+config SND_SOC_QCOM_QAIF
+	tristate "Qualcomm QAIF audio interface support"
+	depends on COMMON_CLK
+	select REGMAP_MMIO
+	help
+	  Say Y or M to enable the Qualcomm Audio Interface (QAIF) driver
+	  used on the Shikra audio platform. QAIF is the DMA controller
+	  that moves PCM data between the codec and memory over AIF (MI2S)
+	  and CIF (CDC DMA) paths. Required for audio playback and capture
+	  on Shikra-based platforms.
+
 config SND_SOC_QDSP6_COMMON
 	tristate
 
diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
index 985ce2ae286b..857bb2a032a2 100644
--- a/sound/soc/qcom/Makefile
+++ b/sound/soc/qcom/Makefile
@@ -31,6 +31,7 @@ snd-soc-qcom-common-y := common.o
 snd-soc-qcom-sdw-y := sdw.o
 snd-soc-x1e80100-y := x1e80100.o
 snd-soc-qcom-offload-utils-objs := usb_offload_utils.o
+snd-soc-qcom-qaif-y := qaif-cpu.o qaif-platform.o qaif-shikra.o
 
 obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
 obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
@@ -44,6 +45,7 @@ obj-$(CONFIG_SND_SOC_QCOM_COMMON) += snd-soc-qcom-common.o
 obj-$(CONFIG_SND_SOC_QCOM_SDW) += snd-soc-qcom-sdw.o
 obj-$(CONFIG_SND_SOC_X1E80100) += snd-soc-x1e80100.o
 obj-$(CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS) += snd-soc-qcom-offload-utils.o
+obj-$(CONFIG_SND_SOC_QCOM_QAIF) += snd-soc-qcom-qaif.o
 
 #DSP lib
 obj-$(CONFIG_SND_SOC_QDSP6) += qdsp6/
diff --git a/sound/soc/qcom/qaif-shikra.c b/sound/soc/qcom/qaif-shikra.c
new file mode 100644
index 000000000000..de8803d5a044
--- /dev/null
+++ b/sound/soc/qcom/qaif-shikra.c
@@ -0,0 +1,556 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * qaif-shikra.c -- ALSA SoC CPU-Platform DAI driver for QTi QAIF
+ */
+
+#include <linux/module.h>
+#include <sound/pcm.h>
+#include <sound/soc.h>
+#include <linux/pm.h>
+#include "qaif.h"
+
+static const struct qaif_dmaidx_dai_map shikra_aif_dma_dai_map[] = {
+		{ QAIF_MI2S_TDM_AIF0 },
+		{ QAIF_MI2S_TDM_AIF1 },
+		{ QAIF_MI2S_TDM_AIF2 },
+		{ QAIF_MI2S_TDM_AIF3 }
+};
+
+static const struct qaif_dmaidx_dai_map shikra_cif_rx_dma_dai_map[] = {
+		{ QAIF_CDC_DMA_RX0 },
+		{ QAIF_CDC_DMA_RX1 },
+		{ QAIF_CDC_DMA_RX2 },
+		{ QAIF_CDC_DMA_RX3 }
+};
+
+static const struct qaif_dmaidx_dai_map shikra_cif_tx_dma_dai_map[] = {
+		{ QAIF_CDC_DMA_TX0 },
+		{ QAIF_CDC_DMA_TX1 },
+		{ QAIF_CDC_DMA_TX2 },
+		{ QAIF_CDC_DMA_TX3 }
+};
+
+static const struct qaif_dmaidx_dai_map shikra_cif_va_dma_dai_map[] = {
+		{ QAIF_CDC_DMA_VA_TX0 },
+		{ QAIF_CDC_DMA_VA_TX1 },
+		{ QAIF_CDC_DMA_VA_TX2 },
+		{ QAIF_CDC_DMA_VA_TX3 }
+};
+
+static struct snd_soc_dai_driver shikra_qaif_cpu_dai_driver[] = {
+	{
+		.id = QAIF_MI2S_TDM_AIF0,
+		.name = "Audio Interface Zero",
+		.playback = {
+			.stream_name = "AIF Zero Playback",
+			.formats	= SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 2,
+			.channels_max	= 2,
+		},
+		.capture = {
+			.stream_name = "AIF Zero Capture",
+			.formats = SNDRV_PCM_FMTBIT_S16 |
+				SNDRV_PCM_FMTBIT_S32,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 2,
+			.channels_max	= 2,
+		},
+		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
+	}, {
+		.id = QAIF_MI2S_TDM_AIF1,
+		.name = "Audio Interface One",
+		.playback = {
+			.stream_name = "AIF One Playback",
+			.formats	= SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 2,
+			.channels_max	= 2,
+		},
+		.capture = {
+			.stream_name = "AIF One Capture",
+			.formats = SNDRV_PCM_FMTBIT_S16 |
+				SNDRV_PCM_FMTBIT_S32,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 2,
+			.channels_max	= 2,
+		},
+		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
+	}, {
+		.id = QAIF_MI2S_TDM_AIF2,
+		.name = "Audio Interface Two",
+		.playback = {
+			.stream_name = "AIF Two Playback",
+			.formats	= SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 2,
+			.channels_max	= 2,
+		},
+		.capture = {
+			.stream_name = "AIF Two Capture",
+			.formats = SNDRV_PCM_FMTBIT_S16 |
+				SNDRV_PCM_FMTBIT_S32,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 2,
+			.channels_max	= 2,
+		},
+		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
+	}, {
+		.id = QAIF_MI2S_TDM_AIF3,
+		.name = "Audio Interface Three",
+		.playback = {
+			.stream_name = "AIF Three Playback",
+			.formats	= SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 2,
+			.channels_max	= 2,
+		},
+		.capture = {
+			.stream_name = "AIF Three Capture",
+			.formats = SNDRV_PCM_FMTBIT_S16 |
+				SNDRV_PCM_FMTBIT_S32,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 2,
+			.channels_max	= 2,
+		},
+		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
+	}, {
+		.id = QAIF_CDC_DMA_RX0,
+		.name = "CDC DMA RX0",
+		.playback = {
+			.stream_name = "WCD Playback0",
+			.formats = SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 1,
+			.channels_max	= 2,
+		},
+		.ops	= &asoc_qcom_qaif_cif_dai_ops,
+	}, {
+		.id = QAIF_CDC_DMA_RX1,
+		.name = "CDC DMA RX1",
+		.playback = {
+			.stream_name = "WCD Playback1",
+			.formats = SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 1,
+			.channels_max	= 2,
+		},
+		.ops	= &asoc_qcom_qaif_cif_dai_ops,
+	}, {
+		.id = QAIF_CDC_DMA_VA_TX0,
+		.name = "CDC DMA VA0",
+		.capture = {
+			.stream_name = "DMIC Capture0",
+			.formats = SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 1,
+			.channels_max	= 4,
+		},
+		.ops	= &asoc_qcom_qaif_cif_dai_ops,
+	}, {
+		.id = QAIF_CDC_DMA_VA_TX1,
+		.name = "CDC DMA VA1",
+		.capture = {
+			.stream_name = "DMIC Capture1",
+			.formats = SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 1,
+			.channels_max	= 4,
+		},
+		.ops	= &asoc_qcom_qaif_cif_dai_ops,
+	},
+};
+
+static int shikra_qaif_get_dma_idx(unsigned int dai_id)
+{
+	int i;
+
+	switch (dai_id) {
+	case QAIF_MI2S_TDM_AIF0 ... QAIF_MI2S_TDM_AIF12:
+		for (i = 0; i < ARRAY_SIZE(shikra_aif_dma_dai_map); i++) {
+			if (shikra_aif_dma_dai_map[i].dai_id == dai_id)
+				return i;
+		}
+		break;
+	case QAIF_CDC_DMA_RX0 ... QAIF_CDC_DMA_RX9:
+		for (i = 0; i < ARRAY_SIZE(shikra_cif_rx_dma_dai_map); i++) {
+			if (shikra_cif_rx_dma_dai_map[i].dai_id == dai_id)
+				return i;
+		}
+		break;
+	case QAIF_CDC_DMA_TX0 ... QAIF_CDC_DMA_TX9:
+		for (i = 0; i < ARRAY_SIZE(shikra_cif_tx_dma_dai_map); i++) {
+			if (shikra_cif_tx_dma_dai_map[i].dai_id == dai_id)
+				return i;
+		}
+		break;
+	case QAIF_CDC_DMA_VA_TX0 ... QAIF_CDC_DMA_VA_TX9:
+		for (i = 0; i < ARRAY_SIZE(shikra_cif_va_dma_dai_map); i++) {
+			if (shikra_cif_va_dma_dai_map[i].dai_id == dai_id)
+				return i;
+		}
+		break;
+	default:
+		pr_debug("DAI ID not Supported\n");
+		break;
+	}
+
+	pr_debug("DAI ID %u not found in map\n", dai_id);
+	return -EINVAL;
+}
+
+static int shikra_qaif_alloc_stream_dma_idx(struct qaif_drv_data *drvdata,
+					    int direction,
+					    unsigned int dai_id)
+{
+	const struct qaif_variant *v = drvdata->variant;
+	int dma_idx;
+	int index = 0;
+
+	if (!v)
+		return -EINVAL;
+
+	switch (dai_id) {
+	case QAIF_MI2S_TDM_AIF0 ... QAIF_MI2S_TDM_AIF12:
+		dma_idx = shikra_qaif_get_dma_idx(dai_id);
+		if (dma_idx < 0)
+			return dma_idx;
+
+		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+			index = dma_idx;
+			if (index >= v->num_rddma)
+				return -EBUSY;
+		} else {
+			index = v->wrdma_start + dma_idx;
+			if (index >= v->wrdma_start + v->num_wrdma)
+				return -EBUSY;
+		}
+		if (test_and_set_bit(index, &drvdata->aif_dma_idx_bit_map))
+			return -EBUSY;
+		break;
+	case QAIF_CDC_DMA_RX0 ... QAIF_CDC_DMA_RX9:
+	case QAIF_CDC_DMA_TX0 ... QAIF_CDC_DMA_TX9:
+	case QAIF_CDC_DMA_VA_TX0 ... QAIF_CDC_DMA_VA_TX9:
+		dma_idx = shikra_qaif_get_dma_idx(dai_id);
+		if (dma_idx < 0)
+			return dma_idx;
+
+		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+			index = dma_idx;
+			if (index >= v->num_codec_rddma)
+				return -EBUSY;
+		} else {
+			index = v->codec_wrdma_start + dma_idx;
+			if (index >= v->codec_wrdma_start + v->num_codec_wrdma)
+				return -EBUSY;
+		}
+		if (test_and_set_bit(index, &drvdata->cif_dma_idx_bit_map))
+			return -EBUSY;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return index;
+}
+
+static int shikra_qaif_free_stream_dma_idx(struct qaif_drv_data *drvdata,
+					   int index,
+					   unsigned int dai_id)
+{
+	switch (dai_id) {
+	case QAIF_MI2S_TDM_AIF0 ... QAIF_MI2S_TDM_AIF12:
+		clear_bit(index, &drvdata->aif_dma_idx_bit_map);
+		break;
+	case QAIF_CDC_DMA_RX0 ... QAIF_CDC_DMA_RX9:
+	case QAIF_CDC_DMA_TX0 ... QAIF_CDC_DMA_TX9:
+	case QAIF_CDC_DMA_VA_TX0 ... QAIF_CDC_DMA_VA_TX9:
+		clear_bit(index, &drvdata->cif_dma_idx_bit_map);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int shikra_qaif_clk_init(struct platform_device *pdev)
+{
+	struct qaif_drv_data *drvdata = platform_get_drvdata(pdev);
+	const struct qaif_variant *v = drvdata->variant;
+	struct device *dev = &pdev->dev;
+	int ret, i;
+
+	if (v->num_clks == 0 || v->num_clks > QAIF_MAX_VARIANT_CLKS) {
+		dev_err(dev, "Invalid clock count: %d\n", v->num_clks);
+		return -EINVAL;
+	}
+	drvdata->clks = devm_kcalloc(dev, v->num_clks,
+				     sizeof(*drvdata->clks), GFP_KERNEL);
+	if (!drvdata->clks)
+		return -ENOMEM;
+
+	drvdata->num_clks = v->num_clks;
+
+	for (i = 0; i < drvdata->num_clks; i++)
+		drvdata->clks[i].id = v->clk_name[i];
+
+	ret = devm_clk_bulk_get(dev, drvdata->num_clks, drvdata->clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get clocks\n");
+
+	ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable clocks\n");
+
+	return 0;
+}
+
+static int shikra_qaif_clk_deinit(struct platform_device *pdev)
+{
+	struct qaif_drv_data *drvdata = platform_get_drvdata(pdev);
+
+	if (!drvdata || !drvdata->clks)
+		return -EINVAL;
+
+	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
+	return 0;
+}
+
+static int __maybe_unused shikra_qaif_dev_resume(struct device *dev)
+{
+	struct qaif_drv_data *drvdata = dev_get_drvdata(dev);
+
+	if (!drvdata || !drvdata->clks) {
+		dev_err(dev, "Invalid drvdata in resume\n");
+		return -EINVAL;
+	}
+	return clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
+}
+
+static int __maybe_unused shikra_qaif_dev_suspend(struct device *dev)
+{
+	struct qaif_drv_data *drvdata = dev_get_drvdata(dev);
+
+	if (!drvdata || !drvdata->clks) {
+		dev_err(dev, "Invalid drvdata in suspend\n");
+		return -EINVAL;
+	}
+	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
+	return 0;
+}
+
+static const struct dev_pm_ops shikra_qaif_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(shikra_qaif_dev_suspend,
+				shikra_qaif_dev_resume)
+};
+
+static const struct qaif_variant shikra_qaif_data = {
+	.ee = 0,
+	.qaif_type = QAIF,
+
+	.num_rddma = 4,
+	.num_wrdma = 4,
+	.wrdma_start = 4,
+
+	.num_codec_rddma = 4,
+	.num_codec_wrdma = 4,
+	.codec_wrdma_start = 4,
+	.num_intf = 4,
+
+	.rddma_reg_base = 0x8000,
+	.rddma_stride = 0x1000,
+	.codec_rddma_reg_base = 0xC000,
+	.codec_rddma_stride = 0x1000,
+
+	.wrdma_reg_base = 0x11000,
+	.wrdma_stride = 0x1000,
+	.codec_wrdma_reg_base = 0x15000,
+	.codec_wrdma_stride = 0x1000,
+
+	.rddma_irq_reg_base = 0x19000,
+	.rddma_irq_stride = 0x1000,
+	.codec_rddma_irq_reg_base = 0x191A0,
+	.codec_rddma_irq_stride = 0x1000,
+
+	.wrdma_irq_reg_base = 0x19078,
+	.wrdma_irq_stride = 0x1000,
+	.codec_wrdma_irq_reg_base = 0x19290,
+	.codec_wrdma_irq_stride = 0x1000,
+
+	.qxm_type = QXM0,
+	.rd_len = 512,
+	.rddma_shram_len = 64,
+	.rddma_shram_start_addr = {0, 256},
+	.wr_len = 512,
+	.wrdma_shram_len = 64,
+	.wrdma_shram_start_addr = {0, 256},
+
+	.rddma_enable	= REG_FIELD_ID(0x8000, 0, 0, 4, 0x1000),
+	.rddma_reset	= REG_FIELD_ID(0x8000, 4, 4, 4, 0x1000),
+
+	.rddma_shram_wm	= REG_FIELD_ID(0x8004, 0, 11, 4, 0x1000),
+	.rddma_burst1	= REG_FIELD_ID(0x8004, 16, 16, 4, 0x1000),
+	.rddma_burst2	= REG_FIELD_ID(0x8004, 17, 17, 4, 0x1000),
+	.rddma_burst4	= REG_FIELD_ID(0x8004, 18, 18, 4, 0x1000),
+	.rddma_burst8	= REG_FIELD_ID(0x8004, 19, 19, 4, 0x1000),
+	.rddma_burst16	= REG_FIELD_ID(0x8004, 20, 20, 4, 0x1000),
+	.rddma_dma_dyncclk	= REG_FIELD_ID(0x8004, 24, 24, 4, 0x1000),
+	.rddma_num_ot	= REG_FIELD_ID(0x8004, 28, 29, 4, 0x1000),
+
+	.wrdma_enable	= REG_FIELD_ID(0x11000, 0, 0, 4, 0x1000),
+	.wrdma_reset	= REG_FIELD_ID(0x11000, 4, 4, 4, 0x1000),
+
+	.wrdma_shram_wm	= REG_FIELD_ID(0x11004, 0, 11, 4, 0x1000),
+	.wrdma_burst1	= REG_FIELD_ID(0x11004, 16, 16, 4, 0x1000),
+	.wrdma_burst2	= REG_FIELD_ID(0x11004, 17, 17, 4, 0x1000),
+	.wrdma_burst4	= REG_FIELD_ID(0x11004, 18, 18, 4, 0x1000),
+	.wrdma_burst8	= REG_FIELD_ID(0x11004, 19, 19, 4, 0x1000),
+	.wrdma_burst16	= REG_FIELD_ID(0x11004, 20, 20, 4, 0x1000),
+	.wrdma_dma_dyncclk	= REG_FIELD_ID(0x11004, 24, 24, 4, 0x1000),
+	.wrdma_num_ot	= REG_FIELD_ID(0x11004, 28, 29, 4, 0x1000),
+
+	.cif_rddma_enable	= REG_FIELD_ID(0xC000, 0, 0, 4, 0x1000),
+	.cif_rddma_reset	= REG_FIELD_ID(0xC000, 4, 4, 4, 0x1000),
+
+	.cif_rddma_shram_wm	= REG_FIELD_ID(0xC004, 0, 11, 4, 0x1000),
+	.cif_rddma_burst1	= REG_FIELD_ID(0xC004, 16, 16, 4, 0x1000),
+	.cif_rddma_burst2	= REG_FIELD_ID(0xC004, 17, 17, 4, 0x1000),
+	.cif_rddma_burst4	= REG_FIELD_ID(0xC004, 18, 18, 4, 0x1000),
+	.cif_rddma_burst8	= REG_FIELD_ID(0xC004, 19, 19, 4, 0x1000),
+	.cif_rddma_burst16	= REG_FIELD_ID(0xC004, 20, 20, 4, 0x1000),
+	.cif_rddma_dma_dyncclk	= REG_FIELD_ID(0xC004, 24, 24, 4, 0x1000),
+	.cif_rddma_num_ot	= REG_FIELD_ID(0xC004, 28, 29, 4, 0x1000),
+
+	.cif_rddma_en_16bit_unpack	= REG_FIELD_ID(0xC05C, 0, 0, 4, 0x1000),
+	.cif_rddma_intf_dyncclk	= REG_FIELD_ID(0xC05C, 2, 2, 4, 0x1000),
+	.cif_rddma_fs_out_gate	= REG_FIELD_ID(0xC05C, 3, 3, 4, 0x1000),
+	.cif_rddma_fs_sel	= REG_FIELD_ID(0xC05C, 4, 7, 4, 0x1000),
+	.cif_rddma_fs_delay	= REG_FIELD_ID(0xC05C, 8, 11, 4, 0x1000),
+	.cif_rddma_active_ch_en	= REG_FIELD_ID(0xC05C, 12, 27, 4, 0x1000),
+
+	.cif_wrdma_enable	= REG_FIELD_ID(0x15000, 0, 0, 4, 0x1000),
+	.cif_wrdma_reset	= REG_FIELD_ID(0x15000, 4, 4, 4, 0x1000),
+
+	.cif_wrdma_shram_wm	= REG_FIELD_ID(0x15004, 0, 11, 4, 0x1000),
+	.cif_wrdma_burst1	= REG_FIELD_ID(0x15004, 16, 16, 4, 0x1000),
+	.cif_wrdma_burst2	= REG_FIELD_ID(0x15004, 17, 17, 4, 0x1000),
+	.cif_wrdma_burst4	= REG_FIELD_ID(0x15004, 18, 18, 4, 0x1000),
+	.cif_wrdma_burst8	= REG_FIELD_ID(0x15004, 19, 19, 4, 0x1000),
+	.cif_wrdma_burst16	= REG_FIELD_ID(0x15004, 20, 20, 4, 0x1000),
+	.cif_wrdma_dma_dyncclk	= REG_FIELD_ID(0x15004, 24, 24, 4, 0x1000),
+	.cif_wrdma_num_ot	= REG_FIELD_ID(0x15004, 28, 29, 4, 0x1000),
+
+	.cif_wrdma_en_16bit_unpack	= REG_FIELD_ID(0x15058, 0, 0, 4, 0x1000),
+	.cif_wrdma_intf_dyncclk	= REG_FIELD_ID(0x15058, 2, 2, 4, 0x1000),
+	.cif_wrdma_fs_out_gate	= REG_FIELD_ID(0x15058, 3, 3, 4, 0x1000),
+	.cif_wrdma_fs_sel	= REG_FIELD_ID(0x15058, 4, 7, 4, 0x1000),
+	.cif_wrdma_fs_delay	= REG_FIELD_ID(0x15058, 8, 11, 4, 0x1000),
+	.cif_wrdma_active_ch_en	= REG_FIELD_ID(0x15058, 12, 27, 4, 0x1000),
+
+	.aif_enable	= REG_FIELD_ID(0x4000, 0, 0, 4, 0x1000),
+	.aif_enable_tx	= REG_FIELD_ID(0x4000, 4, 4, 4, 0x1000),
+	.aif_enable_rx	= REG_FIELD_ID(0x4000, 8, 8, 4, 0x1000),
+	.aif_reset	= REG_FIELD_ID(0x4000, 12, 12, 4, 0x1000),
+	.aif_reset_tx	= REG_FIELD_ID(0x4000, 16, 16, 4, 0x1000),
+	.aif_reset_rx	= REG_FIELD_ID(0x4000, 20, 20, 4, 0x1000),
+
+	.aif_inv_sync	= REG_FIELD_ID(0x4004, 12, 12, 4, 0x1000),
+	.aif_sync_delay	= REG_FIELD_ID(0x4004, 8, 9, 4, 0x1000),
+	.aif_sync_mode	= REG_FIELD_ID(0x4004, 4, 5, 4, 0x1000),
+	.aif_sync_src	= REG_FIELD_ID(0x4004, 0, 0, 4, 0x1000),
+
+	.aif_sample_width_rx	= REG_FIELD_ID(0x4008, 24, 28, 4, 0x1000),
+	.aif_sample_width_tx	= REG_FIELD_ID(0x4008, 16, 20, 4, 0x1000),
+	.aif_slot_width_rx	= REG_FIELD_ID(0x4008, 8, 12, 4, 0x1000),
+	.aif_slot_width_tx	= REG_FIELD_ID(0x4008, 0, 4, 4, 0x1000),
+
+	.aif_bits_per_lane	= REG_FIELD_ID(0x400C, 0, 9, 4, 0x1000),
+
+	.aif_slot_en_tx_mask	= REG_FIELD_ID(0x4010, 0, 31, 4, 0x1000),
+
+	.aif_slot_en_rx_mask	= REG_FIELD_ID(0x4030, 0, 31, 4, 0x1000),
+
+	.aif_loopback_en	= REG_FIELD_ID(0x4050, 31, 31, 4, 0x1000),
+	.aif_ctrl_data_oe	= REG_FIELD_ID(0x4050, 16, 16, 4, 0x1000),
+	.aif_lane_en	= REG_FIELD_ID(0x4050, 8, 15, 4, 0x1000),
+	.aif_lane_dir	= REG_FIELD_ID(0x4050, 0, 7, 4, 0x1000),
+
+	.aif_mono_mode_rx	= REG_FIELD_ID(0x4054, 1, 1, 4, 0x1000),
+	.aif_mono_mode_tx	= REG_FIELD_ID(0x4054, 0, 0, 4, 0x1000),
+
+	.aif_full_cycle_en	= REG_FIELD_ID(0x4058, 0, 0, 4, 0x1000),
+
+	.clk_name			= (const char * const []) {
+						"lpass_config",
+						"lpass_core_axim",
+						"bus",
+					},
+	.num_clks			= 3,
+
+	.dai_driver			= shikra_qaif_cpu_dai_driver,
+	.num_dai			= ARRAY_SIZE(shikra_qaif_cpu_dai_driver),
+
+	.dai_osr_clk_names		= (const char * const []) {
+						"null",
+					},
+	.dai_bit_clk_names		= (const char * const []) {
+						"aif_if0_ibit",
+						"aif_if1_ibit",
+						"aif_if2_ibit",
+						"aif_if3_ibit",
+					},
+	.clk_init				= shikra_qaif_clk_init,
+	.clk_deinit				= shikra_qaif_clk_deinit,
+	.alloc_stream_dma_idx	= shikra_qaif_alloc_stream_dma_idx,
+	.free_stream_dma_idx	= shikra_qaif_free_stream_dma_idx,
+	.get_dma_idx			= shikra_qaif_get_dma_idx,
+};
+
+static const struct of_device_id shikra_qaif_cpu_device_id[] = {
+	{.compatible = "qcom,shikra-qaif-cpu", .data = &shikra_qaif_data},
+	{}
+};
+MODULE_DEVICE_TABLE(of, shikra_qaif_cpu_device_id);
+
+static struct platform_driver shikra_qaif_cpu_platform_driver = {
+	.driver = {
+		.name = "shikra-qaif-cpu",
+		.of_match_table = shikra_qaif_cpu_device_id,
+		.pm = &shikra_qaif_pm_ops,
+	},
+	.probe = asoc_qcom_qaif_cpu_platform_probe,
+	.remove = asoc_qcom_qaif_cpu_platform_remove,
+	.shutdown = asoc_qcom_qaif_cpu_platform_shutdown,
+};
+module_platform_driver(shikra_qaif_cpu_platform_driver);
+
+MODULE_DESCRIPTION("Qualcomm Audio Interface (QAIF) Shikra variant driver");
+MODULE_AUTHOR("Harendra Gautam <harendra.gautam@oss.qualcomm.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1


