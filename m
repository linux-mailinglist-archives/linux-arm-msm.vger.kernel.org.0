Return-Path: <linux-arm-msm+bounces-111380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FpetASmsImqnbwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:59:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A56C647922
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:59:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mF2M6UGQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111380-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111380-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2A273122606
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 10:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BC584D2EDE;
	Fri,  5 Jun 2026 10:38:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CFE4D2ECB;
	Fri,  5 Jun 2026 10:38:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780655897; cv=none; b=Obt94J6a/Zu22dpcj8V6CI/YCKNef/bOp6TUHUBBvBNxCdm9IWCvd8teoNMcDlXcrZAbkTP9yQqXTGWniWOgqdjOB4vpKMlUTAK9wlh8Jj5cl4vsHKzxQrCnVbQPAYVzW4XyFNBKrFw8myI6c6eIaOGXgE8+1s52JaZxLef4hLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780655897; c=relaxed/simple;
	bh=H8rGZ3yNybqBJBxxGIBM3YM9b8+tlwzUmmqSqBOgG2c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dDxIDsPWQJtKTrsiZCI2HGNAlvHT1wqlu1K9kprQoaVqMTDi5bxzRu/T/rEz0FKxNmTd7dnuShyw78+ucNQfWBcGeLkmHxqL0JhSiYs1R86j24Z6trup4snKxXj/B2JDFxFuBPg65Q7S2sh64imfe5GYrdtxJkkVXRs1MBXfkRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mF2M6UGQ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6558nXUJ1957488;
	Fri, 5 Jun 2026 10:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YlUj89zQv1z
	Yv0lyYj7V8q5ErTAibhjcillqMYZNRm4=; b=mF2M6UGQAT28Mkb1c3hLX9eT6IX
	t3RlMIfIFjupJTeNO6Om6iQfj4lNL9Mhormy8XdifoIal/XfYkNCkaixD2og+806
	9emo1NB+GqGViTZbU00NllXCJYxOyevan7/hi6bli4Tf8tkGKC0p/T8TDsAgTNCa
	uY6oZ8S2F87Di/JbbNVhAKaPl3J1CXhkQ/1J71rWViGtEuwnxsIoAk52b/3rpwJM
	y3QDy7fsT/Pt8xB0xi5CJzIurvzoH8+YiJZPmXPHvYIWRzlsXECMCfhroFs0ld9G
	02b8xB7Bv2SQdLwAFhPqTFHl+xfy3oSPUYssLy6waDCbIlZLoTdAuBGOArA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekckpv7ac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jun 2026 10:38:11 +0000 (GMT)
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 655Abk70011714;
	Fri, 5 Jun 2026 10:38:08 GMT
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 13/13] ASoC: qcom: Add Shikra QAIF support
Date: Fri,  5 Jun 2026 16:07:39 +0530
Message-Id: <20260605103739.3557573-14-harendra.gautam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-Proofpoint-GUID: X2dl4WA4lQdx9XkJc80dF57YId1mVOyK
X-Proofpoint-ORIG-GUID: X2dl4WA4lQdx9XkJc80dF57YId1mVOyK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDEwMyBTYWx0ZWRfX01l/33eaI+V/
 PXbGoW20M6Di3a2LaxmhHbM7QzX3eJkSGzZoPN1aeZS6XtrpP+0MyYuCEtuo6bv6BlB/g/IXOnw
 FqU6SnGeDibZMemKhprj8/Pm2UMNNoMQPVia3JJ/zQey3Q+96LKa9xrL9CD93a5zmCdZMkV95m+
 JYqISWJjdtAU6zgzsCFXdUX7PCasunzxfRT6eFWgjon6ZLcfShcCNEEsq8E4WXrJELyzoa9e+y6
 Wcdqf9F434M3HjMI+3jheKJKsdB3ydowXH7Gjw5baa64WLPkMB/6jWH7sEjhWsk8tBbQ9brVtMA
 kNgJPRzDC+P8coQOa2FAVUqO7Wf9wJyN6dZh83J+uV1uj6IweP7iJOcUba7BtdsSpFUdu4L1cX3
 zm9aBqVO4VsYBqr3/B+E7XNc6fHiMs6CUEYsDd1NBQV4TwvITgkat5EA83ePHcuJKystQDdYyAS
 meXrlilzs+lxxxFXV8g==
X-Authority-Analysis: v=2.4 cv=H9jrBeYi c=1 sm=1 tr=0 ts=6a22a714 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=sd0t3XC7S1sX9aJXo7sA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050103
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111380-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A56C647922

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
 sound/soc/qcom/qaif-shikra.c | 585 +++++++++++++++++++++++++++++++++++
 3 files changed, 598 insertions(+)
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
index 000000000000..e83564503087
--- /dev/null
+++ b/sound/soc/qcom/qaif-shikra.c
@@ -0,0 +1,585 @@
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
+struct qaif_dmaidx_dai_map shikra_aif_dma_dai_map[] = {
+		{ QAIF_MI2S_TDM_AIF0 },
+		{ QAIF_MI2S_TDM_AIF1 },
+		{ QAIF_MI2S_TDM_AIF2 },
+		{ QAIF_MI2S_TDM_AIF3 }
+};
+
+struct qaif_dmaidx_dai_map shikra_cif_rx_dma_dai_map[] = {
+		{ QAIF_CDC_DMA_RX0 },
+		{ QAIF_CDC_DMA_RX1 },
+		{ QAIF_CDC_DMA_RX2 },
+		{ QAIF_CDC_DMA_RX3 }
+};
+
+struct qaif_dmaidx_dai_map shikra_cif_tx_dma_dai_map[] = {
+		{ QAIF_CDC_DMA_TX0 },
+		{ QAIF_CDC_DMA_TX1 },
+		{ QAIF_CDC_DMA_TX2 },
+		{ QAIF_CDC_DMA_TX3 }
+};
+
+struct qaif_dmaidx_dai_map shikra_cif_va_dma_dai_map[] = {
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
+					  int direction, unsigned int dai_id)
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
+		if (test_bit(index, &drvdata->aif_dma_idx_bit_map))
+			return -EBUSY;
+
+		set_bit(index, &drvdata->aif_dma_idx_bit_map);
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
+		if (test_bit(index, &drvdata->cif_dma_idx_bit_map))
+			return -EBUSY;
+
+		set_bit(index, &drvdata->cif_dma_idx_bit_map);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return index;
+}
+
+static int shikra_qaif_free_stream_dma_idx(struct qaif_drv_data *drvdata,
+				 int index, unsigned int dai_id)
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
+static int shikra_qaif_init(struct platform_device *pdev)
+{
+	struct qaif_drv_data *drvdata = platform_get_drvdata(pdev);
+	const struct qaif_variant *v = drvdata->variant;
+	struct device *dev = &pdev->dev;
+	int ret, i;
+
+	if (!v) {
+		dev_err(dev, "No variant data\n");
+		return -EINVAL;
+	}
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
+	if (ret) {
+		dev_err(dev, "Failed to get clocks %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
+	if (ret) {
+		dev_err(dev, "shikra clk_enable failed\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int shikra_qaif_exit(struct platform_device *pdev)
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
+					shikra_qaif_dev_resume)
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
+	/* AUDIO_CORE_QAIF_RDDMAa_CTL (0x8000 + 0x1000*a) */
+	.rddma_enable							= REG_FIELD_ID(0x8000, 0, 0, 4, 0x1000),
+	.rddma_reset							= REG_FIELD_ID(0x8000, 4, 4, 4, 0x1000),
+
+	/* AUDIO_CORE_QAIF_RDDMAa_CFG (0x8004 + 0x1000*a) */
+	.rddma_shram_wm							= REG_FIELD_ID(0x8004, 0, 11, 4, 0x1000),
+	.rddma_burst1							= REG_FIELD_ID(0x8004, 16, 16, 4, 0x1000),
+	.rddma_burst2							= REG_FIELD_ID(0x8004, 17, 17, 4, 0x1000),
+	.rddma_burst4							= REG_FIELD_ID(0x8004, 18, 18, 4, 0x1000),
+	.rddma_burst8							= REG_FIELD_ID(0x8004, 19, 19, 4, 0x1000),
+	.rddma_burst16							= REG_FIELD_ID(0x8004, 20, 20, 4, 0x1000),
+	.rddma_dma_dyncclk						= REG_FIELD_ID(0x8004, 24, 24, 4, 0x1000),
+	.rddma_num_ot							= REG_FIELD_ID(0x8004, 28, 29, 4, 0x1000),
+
+	/* AUDIO_CORE_QAIF_WRDMAa_CTL (0x11000 + 0x1000*a) */
+	.wrdma_enable							= REG_FIELD_ID(0x11000, 0, 0, 4, 0x1000),
+	.wrdma_reset							= REG_FIELD_ID(0x11000, 4, 4, 4, 0x1000),
+
+	/* AUDIO_CORE_QAIF_WRDMAa_CFG (0x11004 + 0x1000*a) */
+	.wrdma_shram_wm							= REG_FIELD_ID(0x11004, 0, 11, 4, 0x1000),
+	.wrdma_burst1							= REG_FIELD_ID(0x11004, 16, 16, 4, 0x1000),
+	.wrdma_burst2							= REG_FIELD_ID(0x11004, 17, 17, 4, 0x1000),
+	.wrdma_burst4							= REG_FIELD_ID(0x11004, 18, 18, 4, 0x1000),
+	.wrdma_burst8							= REG_FIELD_ID(0x11004, 19, 19, 4, 0x1000),
+	.wrdma_burst16							= REG_FIELD_ID(0x11004, 20, 20, 4, 0x1000),
+	.wrdma_dma_dyncclk						= REG_FIELD_ID(0x11004, 24, 24, 4, 0x1000),
+	.wrdma_num_ot							= REG_FIELD_ID(0x11004, 28, 29, 4, 0x1000),
+
+	/* AUDIO_CORE_QAIF_CODEC_RDDMAa_CTL (0xC000 + 0x1000*a) */
+	.cif_rddma_enable						= REG_FIELD_ID(0xC000, 0, 0, 4, 0x1000),
+	.cif_rddma_reset						= REG_FIELD_ID(0xC000, 4, 4, 4, 0x1000),
+
+	/* AUDIO_CORE_QAIF_CODEC_RDDMAa_CFG (0xC004 + 0x1000*a) */
+	.cif_rddma_shram_wm						= REG_FIELD_ID(0xC004, 0, 11, 4, 0x1000),
+	.cif_rddma_burst1						= REG_FIELD_ID(0xC004, 16, 16, 4, 0x1000),
+	.cif_rddma_burst2						= REG_FIELD_ID(0xC004, 17, 17, 4, 0x1000),
+	.cif_rddma_burst4						= REG_FIELD_ID(0xC004, 18, 18, 4, 0x1000),
+	.cif_rddma_burst8						= REG_FIELD_ID(0xC004, 19, 19, 4, 0x1000),
+	.cif_rddma_burst16						= REG_FIELD_ID(0xC004, 20, 20, 4, 0x1000),
+	.cif_rddma_dma_dyncclk					= REG_FIELD_ID(0xC004, 24, 24, 4, 0x1000),
+	.cif_rddma_num_ot						= REG_FIELD_ID(0xC004, 28, 29, 4, 0x1000),
+
+	/* AUDIO_CORE_QAIF_CODEC_RDDMAa_INTF_CFG (0xC05C + 0x1000*a) */
+	.cif_rddma_en_16bit_unpack				= REG_FIELD_ID(0xC05C, 0, 0, 4, 0x1000),
+	.cif_rddma_intf_dyncclk					= REG_FIELD_ID(0xC05C, 2, 2, 4, 0x1000),
+	.cif_rddma_fs_out_gate					= REG_FIELD_ID(0xC05C, 3, 3, 4, 0x1000),
+	.cif_rddma_fs_sel						= REG_FIELD_ID(0xC05C, 4, 7, 4, 0x1000),
+	.cif_rddma_fs_delay						= REG_FIELD_ID(0xC05C, 8, 11, 4, 0x1000),
+	.cif_rddma_active_ch_en					= REG_FIELD_ID(0xC05C, 12, 27, 4, 0x1000),
+
+	/* AUDIO_CORE_QAIF_CODEC_WRDMAa_CTL (0x15000 + 0x1000*a) */
+	.cif_wrdma_enable						= REG_FIELD_ID(0x15000, 0, 0, 4, 0x1000),
+	.cif_wrdma_reset						= REG_FIELD_ID(0x15000, 4, 4, 4, 0x1000),
+
+	/* AUDIO_CORE_QAIF_CODEC_WRDMAa_CFG (0x15004 + 0x1000*a) */
+	.cif_wrdma_shram_wm						= REG_FIELD_ID(0x15004, 0, 11, 4, 0x1000),
+	.cif_wrdma_burst1						= REG_FIELD_ID(0x15004, 16, 16, 4, 0x1000),
+	.cif_wrdma_burst2						= REG_FIELD_ID(0x15004, 17, 17, 4, 0x1000),
+	.cif_wrdma_burst4						= REG_FIELD_ID(0x15004, 18, 18, 4, 0x1000),
+	.cif_wrdma_burst8						= REG_FIELD_ID(0x15004, 19, 19, 4, 0x1000),
+	.cif_wrdma_burst16						= REG_FIELD_ID(0x15004, 20, 20, 4, 0x1000),
+	.cif_wrdma_dma_dyncclk					= REG_FIELD_ID(0x15004, 24, 24, 4, 0x1000),
+	.cif_wrdma_num_ot						= REG_FIELD_ID(0x15004, 28, 29, 4, 0x1000),
+
+	/* AUDIO_CORE_QAIF_CODEC_WRDMAa_INTF_CFG (0x15058 + 0x1000*a) */
+	.cif_wrdma_en_16bit_unpack				= REG_FIELD_ID(0x15058, 0, 0, 4, 0x1000),
+	.cif_wrdma_intf_dyncclk					= REG_FIELD_ID(0x15058, 2, 2, 4, 0x1000),
+	.cif_wrdma_fs_out_gate					= REG_FIELD_ID(0x15058, 3, 3, 4, 0x1000),
+	.cif_wrdma_fs_sel						= REG_FIELD_ID(0x15058, 4, 7, 4, 0x1000),
+	.cif_wrdma_fs_delay						= REG_FIELD_ID(0x15058, 8, 11, 4, 0x1000),
+	.cif_wrdma_active_ch_en					= REG_FIELD_ID(0x15058, 12, 27, 4, 0x1000),
+
+	/* AUDIO_CORE_QAIF_AUD_INTFa_CTL (0x4000 + 0x1000*a) */
+	.aif_enable								= REG_FIELD_ID(0x4000, 0, 0, 4, 0x1000),
+	.aif_enable_tx							= REG_FIELD_ID(0x4000, 4, 4, 4, 0x1000),
+	.aif_enable_rx							= REG_FIELD_ID(0x4000, 8, 8, 4, 0x1000),
+	.aif_reset								= REG_FIELD_ID(0x4000, 12, 12, 4, 0x1000),
+	.aif_reset_tx							= REG_FIELD_ID(0x4000, 16, 16, 4, 0x1000),
+	.aif_reset_rx							= REG_FIELD_ID(0x4000, 20, 20, 4, 0x1000),
+
+	/* AUDIO_CORE_QAIF_AUD_INTFa_SYNC_CFG (0x4004 + 0x1000*a) */
+	.aif_inv_sync							= REG_FIELD_ID(0x4004, 12, 12, 4, 0x1000),
+	.aif_sync_delay							= REG_FIELD_ID(0x4004, 8, 9, 4, 0x1000),
+	.aif_sync_mode							= REG_FIELD_ID(0x4004, 4, 5, 4, 0x1000),
+	.aif_sync_src							= REG_FIELD_ID(0x4004, 0, 0, 4, 0x1000),
+
+	/* AUDIO_CORE_QAIF_AUD_INTFa_BIT_WIDTH_CFG (0x4008 + 0x1000*a) */
+	.aif_sample_width_rx					= REG_FIELD_ID(0x4008, 24, 28, 4, 0x1000),
+	.aif_sample_width_tx					= REG_FIELD_ID(0x4008, 16, 20, 4, 0x1000),
+	.aif_slot_width_rx						= REG_FIELD_ID(0x4008, 8, 12, 4, 0x1000),
+	.aif_slot_width_tx						= REG_FIELD_ID(0x4008, 0, 4, 4, 0x1000),
+
+	/* AUDIO_CORE_QAIF_AUD_INTFa_FRAME_CFG (0x400C + 0x1000*a) */
+	.aif_bits_per_lane						= REG_FIELD_ID(0x400C, 0, 9, 4, 0x1000),
+
+	/* AUDIO_CORE_QAIF_AUD_INTFa_ACTV_SLOT_EN_TX (0x4010 + 0x1000*a) */
+	.aif_slot_en_tx_mask					= REG_FIELD_ID(0x4010, 0, 31, 4, 0x1000),
+
+	/* AUDIO_CORE_QAIF_AUD_INTFa_ACTV_SLOT_EN_RX (0x4030 + 0x1000*a) */
+	.aif_slot_en_rx_mask					= REG_FIELD_ID(0x4030, 0, 31, 4, 0x1000),
+
+	/* AUDIO_CORE_QAIF_AUD_INTFa_LANE_CFG (0x4050 + 0x1000*a) */
+	.aif_loopback_en						= REG_FIELD_ID(0x4050, 31, 31, 4, 0x1000),
+	.aif_ctrl_data_oe						= REG_FIELD_ID(0x4050, 16, 16, 4, 0x1000),
+	.aif_lane_en							= REG_FIELD_ID(0x4050, 8, 15, 4, 0x1000),
+	.aif_lane_dir							= REG_FIELD_ID(0x4050, 0, 7, 4, 0x1000),
+
+	/* AUDIO_CORE_QAIF_AUD_INTFa_MI2S_CFG (0x4054 + 0x1000*a) */
+	.aif_mono_mode_rx						= REG_FIELD_ID(0x4054, 1, 1, 4, 0x1000),
+	.aif_mono_mode_tx						= REG_FIELD_ID(0x4054, 0, 0, 4, 0x1000),
+
+	/* AUDIO_CORE_QAIF_AUD_INTFa_CFG (0x4058 + 0x1000*a) */
+	.aif_full_cycle_en						= REG_FIELD_ID(0x4058, 0, 0, 4, 0x1000),
+
+	.clk_name			= (const char*[]) {
+							"lpass_config_clk",
+							"lpass_core_axim_clk",
+							"bus_clk"
+						},
+	.num_clks			= 3,
+
+	.dai_driver			= shikra_qaif_cpu_dai_driver,
+	.num_dai			= ARRAY_SIZE(shikra_qaif_cpu_dai_driver),
+
+	.dai_osr_clk_names		= (const char *[]) {
+							"null"
+							},
+	.dai_bit_clk_names		= (const char *[]) {
+							"aif_if0_ibit_clk",
+							"aif_if1_ibit_clk",
+							"aif_if2_ibit_clk",
+							"aif_if3_ibit_clk"
+							},
+	.init					= shikra_qaif_init,
+	.exit					= shikra_qaif_exit,
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
+		.of_match_table = of_match_ptr(shikra_qaif_cpu_device_id),
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


