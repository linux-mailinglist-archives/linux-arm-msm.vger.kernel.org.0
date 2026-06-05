Return-Path: <linux-arm-msm+bounces-111372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rQpcBN+rImqNbwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:58:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BBB6478FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:58:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=E4f1e7iZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111372-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111372-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21E6830EB757
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 10:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83FF64C043E;
	Fri,  5 Jun 2026 10:38:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3509F4C043F;
	Fri,  5 Jun 2026 10:37:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780655884; cv=none; b=YWAnY+KnbuGZDqHOYdBaqUoTQ3A+cW9odeUZ0V79NaB/7jwdihC3QkTxueyvE+e0rAvblHKYV3tg3AXbZOuPpzbJtAYdHaaLNZJq6iiGX4Ijy9vPpudE4sE4PbOUhOTe43zTMk/ly8ODeznRb4rAFymG8R2PyCIJnQX4zGCePIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780655884; c=relaxed/simple;
	bh=tgPLGgEL1WIVqyIUWygbIykv+8YCLINwZtrCrgU5Tf8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LSH2sG4jihJDiyXs6t395girmvJ/uP6XVOg8p/o+PoqsdT/leu0Elb90fsWRp2Ff0KOD776Fee7+4Om0gfg86UBKC8HYrylemePcr9YLIWg2o5DzF9kstJ2rZd9N1UTFl/yjxuOSPUk6TKFn3ie5uMqQ7UHN8TsGccLVeyN1ZZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E4f1e7iZ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6555qPj72428829;
	Fri, 5 Jun 2026 10:37:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BmF+aXXZbqh
	Vw67+TZaXy17m4bxIpW8WFDWoHX9fzZE=; b=E4f1e7iZxsIx7ubTQDusu/iTIJP
	jwZtslK4V32CSw88bY/TezJNmmPw7jtfljAsR7a1+PvuSMWMibvGrO+4JfrWPuTG
	J5aCuAO4wk2rM6F68TIpum5UOzKd2PLn1LYthpRmchEgSW1a6i1BASuSHxcOoj7R
	awFPjYnMEHNNhktx1IKeK7rtc/qNYdd9l9X5zIWLvZl1YW1e71IYOMamKq9k/x85
	ypmwKmdy0jphze6aDU5ZGiiCH2fWsV6AhTBpTXUdFUoenMmaBh0RZJ7cQlsQJ/D2
	PfLuXrVxBLZbjSfBKvr/Vm+RG+c0+5VP0wbXDxCfw4uveIkLzMnFJNeYlwA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekrphh43q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jun 2026 10:37:57 +0000 (GMT)
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 655Abk6r011714;
	Fri, 5 Jun 2026 10:37:53 GMT
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/13] ASoC: qcom: Add QAIF CIF (CDC DMA) DAI ops
Date: Fri,  5 Jun 2026 16:07:32 +0530
Message-Id: <20260605103739.3557573-7-harendra.gautam@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 7nzNKJ343RlZnlTbSxsNhKRf6P5sgiIf
X-Proofpoint-GUID: 7nzNKJ343RlZnlTbSxsNhKRf6P5sgiIf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDEwMyBTYWx0ZWRfXy9OIh0IdsDVI
 OB3xbh6slyvxvQGxDDmG4XwuNxtXUkS4CZsiaFBP2hLo5QyvhGu3dQdtI6QR+63LO480ieEHMt0
 i/rJ3Bc3FedlLHjsKiDd6IiSm3Jgcgp/5k4WwG+VAFbg0fVeO8qCQHPiV3349bhXnl4Pvr1Hy6T
 2e1qIe8GIksnlGpUqK6y8avnhVKCNVpo4g9es/tuhHGPzIK8x9xiYHcdnS6586fitCD1+PbW8v6
 dASeEkdT0XzzelEY2Ln2j+Hi5laLdu5drbursScSpULymAck3EFlLmpp5MPEER0cjG2/eK3lU5p
 85iM82yZt3jfRhv8sBGnlOL+Zym2y1vrcxVxZTYuD+j074b0tYRYZzyX3Cwaz6eA9OGYPRsOov/
 9lO7Zu1zjVJIM6rLtYg3NF6wFtVl3D/gWNOqoY7vZtp3n1KI4i4L92s8LRApYppodq23kq447Lh
 z1xHU1NnWcczvJ7I7UQ==
X-Authority-Analysis: v=2.4 cv=T9a8ifKQ c=1 sm=1 tr=0 ts=6a22a705 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=Pf6h_ZWO9tHXqwoccAgA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606050103
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
	TAGGED_FROM(0.00)[bounces-111372-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 99BBB6478FB

Add DAI operations for the QAIF Codec Interface (CIF), which connects the
QAIF DMA engine to the internal Bolero digital codec.

The CIF CDC DMA DAIs need to program the interface configuration for each
allocated RDDMA or WRDMA channel. Without these ops, the driver cannot
configure the active channel mask or enable the interface control bits
required when starting a playback or capture stream.

Initialize the CIF DMA and interface regmap fields, program the active
channel mask from hw_params(), and update the CIF interface controls from
trigger() for stream start, stop, suspend, resume and pause transitions.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 sound/soc/qcom/qaif-cpu.c | 315 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 315 insertions(+)
 create mode 100644 sound/soc/qcom/qaif-cpu.c

diff --git a/sound/soc/qcom/qaif-cpu.c b/sound/soc/qcom/qaif-cpu.c
new file mode 100644
index 000000000000..8eedbccd8805
--- /dev/null
+++ b/sound/soc/qcom/qaif-cpu.c
@@ -0,0 +1,317 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * qaif-cpu.c -- ALSA SoC CPU-Platform DAI driver for QTi QAIF
+ */
+
+#include <linux/clk.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+#include "qaif-reg.h"
+#include "qaif.h"
+#include "common.h"
+
+
+static int qaif_cif_cpu_init_bitfields(struct device *dev,
+			struct regmap *map)
+{
+	struct qaif_drv_data *drvdata = dev_get_drvdata(dev);
+	const struct qaif_variant *v = drvdata->variant;
+	struct qaif_dmactl *rd_dmactl;
+	struct qaif_dmactl *wr_dmactl;
+	struct qaif_cdc_intfctl *rd_intfctl;
+	struct qaif_cdc_intfctl *wr_intfctl;
+
+	rd_dmactl = devm_kzalloc(dev, sizeof(struct qaif_dmactl), GFP_KERNEL);
+	if (!rd_dmactl)
+		return -ENOMEM;
+
+	wr_dmactl = devm_kzalloc(dev, sizeof(struct qaif_dmactl), GFP_KERNEL);
+	if (!wr_dmactl)
+		return -ENOMEM;
+
+	rd_intfctl = devm_kzalloc(dev, sizeof(struct qaif_cdc_intfctl), GFP_KERNEL);
+	if (!rd_intfctl)
+		return -ENOMEM;
+
+	wr_intfctl = devm_kzalloc(dev, sizeof(struct qaif_cdc_intfctl), GFP_KERNEL);
+	if (!wr_intfctl)
+		return -ENOMEM;
+
+	/*
+	 * Bulk-allocate CIF RDDMA dmactl fields.
+	 * Order must match struct qaif_dmactl member order:
+	 * enable, reset, num_ot, dma_dyncclk, burst16, burst8, burst4, burst2, burst1, shram_wm
+	 */
+	{
+		const struct reg_field cif_rd_dmactl_fields[] = {
+			v->cif_rddma_enable,
+			v->cif_rddma_reset,
+			v->cif_rddma_num_ot,
+			v->cif_rddma_dma_dyncclk,
+			v->cif_rddma_burst16,
+			v->cif_rddma_burst8,
+			v->cif_rddma_burst4,
+			v->cif_rddma_burst2,
+			v->cif_rddma_burst1,
+			v->cif_rddma_shram_wm,
+		};
+		int ret = devm_regmap_field_bulk_alloc(dev, map,
+					&rd_dmactl->enable,
+					cif_rd_dmactl_fields,
+					ARRAY_SIZE(cif_rd_dmactl_fields));
+		if (ret) {
+			dev_err(dev, "error allocating CIF RDDMA dmactl regmap fields: %d\n", ret);
+			return ret;
+		}
+	}
+
+	/*
+	 * Bulk-allocate CIF RDDMA intfctl fields.
+	 * Order must match struct qaif_cdc_intfctl member order:
+	 * active_ch_en, fs_sel, fs_delay, fs_out_gate, intf_dyncclk, en_16bit_unpack
+	 */
+	{
+		const struct reg_field cif_rd_intfctl_fields[] = {
+			v->cif_rddma_active_ch_en,
+			v->cif_rddma_fs_sel,
+			v->cif_rddma_fs_delay,
+			v->cif_rddma_fs_out_gate,
+			v->cif_rddma_intf_dyncclk,
+			v->cif_rddma_en_16bit_unpack,
+		};
+		int ret = devm_regmap_field_bulk_alloc(dev, map,
+					&rd_intfctl->active_ch_en,
+					cif_rd_intfctl_fields,
+					ARRAY_SIZE(cif_rd_intfctl_fields));
+		if (ret) {
+			dev_err(dev, "error allocating CIF RDDMA intfctl regmap fields: %d\n", ret);
+			return ret;
+		}
+	}
+
+	/*
+	 * Bulk-allocate CIF WRDMA dmactl fields.
+	 * Order must match struct qaif_dmactl member order:
+	 * enable, reset, num_ot, dma_dyncclk, burst16, burst8, burst4, burst2, burst1, shram_wm
+	 */
+	{
+		const struct reg_field cif_wr_dmactl_fields[] = {
+			v->cif_wrdma_enable,
+			v->cif_wrdma_reset,
+			v->cif_wrdma_num_ot,
+			v->cif_wrdma_dma_dyncclk,
+			v->cif_wrdma_burst16,
+			v->cif_wrdma_burst8,
+			v->cif_wrdma_burst4,
+			v->cif_wrdma_burst2,
+			v->cif_wrdma_burst1,
+			v->cif_wrdma_shram_wm,
+		};
+		int ret = devm_regmap_field_bulk_alloc(dev, map,
+					&wr_dmactl->enable,
+					cif_wr_dmactl_fields,
+					ARRAY_SIZE(cif_wr_dmactl_fields));
+		if (ret) {
+			dev_err(dev, "error allocating CIF WRDMA dmactl regmap fields: %d\n", ret);
+			return ret;
+		}
+	}
+
+	/*
+	 * Bulk-allocate CIF WRDMA intfctl fields.
+	 * Order must match struct qaif_cdc_intfctl member order:
+	 * active_ch_en, fs_sel, fs_delay, fs_out_gate, intf_dyncclk, en_16bit_unpack
+	 */
+	{
+		const struct reg_field cif_wr_intfctl_fields[] = {
+			v->cif_wrdma_active_ch_en,
+			v->cif_wrdma_fs_sel,
+			v->cif_wrdma_fs_delay,
+			v->cif_wrdma_fs_out_gate,
+			v->cif_wrdma_intf_dyncclk,
+			v->cif_wrdma_en_16bit_unpack,
+		};
+		int ret = devm_regmap_field_bulk_alloc(dev, map,
+					&wr_intfctl->active_ch_en,
+					cif_wr_intfctl_fields,
+					ARRAY_SIZE(cif_wr_intfctl_fields));
+		if (ret) {
+			dev_err(dev, "error allocating CIF WRDMA intfctl regmap fields: %d\n", ret);
+			return ret;
+		}
+	}
+
+	drvdata->cif_rd_dmactl = rd_dmactl;
+	drvdata->cif_wr_dmactl = wr_dmactl;
+	drvdata->cif_rddma_intfctl = rd_intfctl;
+	drvdata->cif_wrdma_intfctl = wr_intfctl;
+
+	return 0;
+}
+
+static struct qaif_cdc_intfctl *qaif_get_cif_intfctl_handle(struct snd_pcm_substream *substream,
+					struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
+	struct qaif_drv_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	const struct qaif_variant *v = drvdata->variant;
+	unsigned int dai_id = cpu_dai->driver->id;
+	struct qaif_cdc_intfctl *intfctl = NULL;
+
+	if (!v) {
+		dev_err(soc_runtime->dev, "No variant data\n");
+		return intfctl;
+	}
+
+	switch (dai_id) {
+	case QAIF_CDC_DMA_RX0 ... QAIF_CDC_DMA_RX9:
+		intfctl = drvdata->cif_rddma_intfctl;
+		break;
+	case QAIF_CDC_DMA_TX0 ... QAIF_CDC_DMA_TX9:
+	case QAIF_CDC_DMA_VA_TX0 ... QAIF_CDC_DMA_VA_TX9:
+		intfctl = drvdata->cif_wrdma_intfctl;
+		break;
+	default:
+		dev_err(soc_runtime->dev, "invalid dai id for dma ctl: %d\n", dai_id);
+		break;
+	}
+	return intfctl;
+}
+
+static int qaif_cif_daiops_hw_params(struct snd_pcm_substream *substream,
+				      struct snd_pcm_hw_params *params,
+				      struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
+	struct qaif_drv_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	const struct qaif_variant *v = drvdata->variant;
+	struct qaif_cdc_intfctl *intfctl = NULL;
+	unsigned int dai_id = cpu_dai->driver->id;
+	int ret;
+	unsigned int regval;
+	unsigned int channels = params_channels(params);
+	int idx;
+
+	switch (channels) {
+	case 1:
+		regval = QAIF_CIF_DMA_INTF_ONE_CHANNEL;
+		break;
+	case 2:
+		regval = QAIF_CIF_DMA_INTF_TWO_CHANNEL;
+		break;
+	case 4:
+		regval = QAIF_CIF_DMA_INTF_FOUR_CHANNEL;
+		break;
+	case 6:
+		regval = QAIF_CIF_DMA_INTF_SIX_CHANNEL;
+		break;
+	case 8:
+		regval = QAIF_CIF_DMA_INTF_EIGHT_CHANNEL;
+		break;
+	default:
+		dev_err(soc_runtime->dev, "invalid PCM config\n");
+		return -EINVAL;
+	}
+
+	intfctl = qaif_get_cif_intfctl_handle(substream, dai);
+	if (!intfctl) {
+		dev_err(soc_runtime->dev, "Invalid intfctl: %d\n", dai_id);
+		return -EINVAL;
+	}
+	idx = v->get_dma_idx(dai_id);
+	if (idx < 0) {
+		dev_err(soc_runtime->dev, "Invalid DMA index: %d\n", idx);
+		return -EINVAL;
+	}
+	ret = regmap_fields_write(intfctl->active_ch_en, idx, regval);
+	if (ret) {
+		dev_err(soc_runtime->dev,
+			"error writing to intfctl active_ch_en reg field: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int qaif_cif_daiops_trigger(struct snd_pcm_substream *substream,
+				    int cmd, struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
+	struct qaif_drv_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	const struct qaif_variant *v = drvdata->variant;
+	unsigned int dai_id = cpu_dai->driver->id;
+	struct qaif_cdc_intfctl *intfctl = NULL;
+	int ret = 0, idx;
+
+	intfctl = qaif_get_cif_intfctl_handle(substream, dai);
+	if (!intfctl) {
+		dev_err(soc_runtime->dev, "Invalid intfctl: %d\n", dai_id);
+		return -EINVAL;
+	}
+	idx = v->get_dma_idx(dai_id);
+	if (idx < 0) {
+		dev_err(soc_runtime->dev, "Invalid DMA index: %d\n", idx);
+		return -EINVAL;
+	}
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		ret = regmap_fields_write(intfctl->intf_dyncclk, idx, QAIF_DMACTL_DYNCLK_ON);
+		if (ret) {
+			dev_err(soc_runtime->dev, "error writing to dmactl intf_dyncclk reg field: %d\n", ret);
+			return ret;
+		}
+		ret = regmap_fields_write(intfctl->fs_sel, idx, QAIF_CIF_DMA_FS_SEL_DEFAULT);
+		if (ret) {
+			dev_err(soc_runtime->dev, "error writing to dmactl codec_fs_sel reg field: %d\n", ret);
+			return ret;
+		}
+
+		ret = regmap_fields_write(intfctl->en_16bit_unpack, idx, QAIF_CIF_16BIT_UNPACK_ENABLE);
+		if (ret) {
+			dev_err(soc_runtime->dev, "error writing to dmactl en_16bit_unpack reg field: %d\n", ret);
+			return ret;
+		}
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		ret = regmap_fields_write(intfctl->intf_dyncclk, idx, QAIF_DMACTL_DYNCLK_OFF);
+		if (ret) {
+			dev_err(soc_runtime->dev, "error writing to dmactl intf_dyncclk reg field: %d\n", ret);
+			return ret;
+		}
+		ret = regmap_fields_write(intfctl->en_16bit_unpack, idx, QAIF_CIF_16BIT_UNPACK_DISABLE);
+		if (ret) {
+			dev_err(soc_runtime->dev, "error writing to dmactl en_16bit_unpack reg field: %d\n", ret);
+			return ret;
+		}
+		break;
+	default:
+		ret = -EINVAL;
+		dev_err(soc_runtime->dev, "%s: invalid %d interface\n", __func__, cmd);
+		break;
+	}
+	return ret;
+}
+
+const struct snd_soc_dai_ops asoc_qcom_qaif_cif_dai_ops = {
+	.hw_params	= qaif_cif_daiops_hw_params,
+	.trigger	= qaif_cif_daiops_trigger,
+};
+EXPORT_SYMBOL_GPL(asoc_qcom_qaif_cif_dai_ops);
-- 
2.34.1


