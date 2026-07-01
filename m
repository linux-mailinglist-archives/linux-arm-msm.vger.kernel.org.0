Return-Path: <linux-arm-msm+bounces-115664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oQz8KAXzRGpC3woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:59:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C356EC755
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:59:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XQW9QprO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115664-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115664-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C379C30500C2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 10:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E6043D4EC;
	Wed,  1 Jul 2026 10:58:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AA443C054;
	Wed,  1 Jul 2026 10:58:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903498; cv=none; b=WCXyb/2wqVF7AMoAYsb49J+lFJ+/xhbMxV4zXhS6+7pdrQo0DJupGgNi9wXDdRJYzeKvSHdgJC5LgbDwyIzRk4QDc2mgwCwU4jB2TEcrvqAjW2R7L/kxyRaKXl4eGoLbr/SuS/QHjWXiCZAiFzJR3tyr+h8/sazkoDuM74t7siQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903498; c=relaxed/simple;
	bh=7r/qYh7mF1hEjiFDFlWEtaDDhLcSZJa0aGdY9evLFWU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Aj9uVBjwqY3YcPQH1CHh+e3230Qc0a0sVJQmBuhAZ76I7IV2CaH6GDVuWxijkzmruDIFXEKJcPP2Uqo93Vb3n+QpbviSaUVtMKSOTpoBxF2apq6Xosb6vR38Xuabd8+HdNfdfwg8fLPl3W2fsNWw6FPeYkABdFHGdNJUgNZTWnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XQW9QprO; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AGJER793847;
	Wed, 1 Jul 2026 10:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3pWxCFkQ6kQ
	ZSUAvMQVReaT65jnuQRIoNVfRtMg76M4=; b=XQW9QprO90kjF1PheUmtmoNoeCL
	S6gE3/umy4ZZubojF8NrvDO5Y9xriQoMJEWSN2NnYuXpu96i8ZrZR4Gv2vw/g6YV
	Qy/nb0BqlwaFD68bGwP6IADvFWx1p577HsUf0ME5sNXsAdiIrel8rdLJTyIcY3Jc
	OwwXWsbk/FbpTlfKxGWyHer4G+vXA6Taf/dbwR1fE5G2OP8Z7xX/fZUSLqa8Yras
	Bh4uiX4PGasmy8YvlP7mnUPA3AGf+/U3Qg0TARQbrXfKB1Ac5rYl/NEIcK0bdzup
	tUdy/edVjifd+IgEYVU7TcuGo5EgNo6yvZ6OZa6p9TQvbx9jrN3RcTsYQbQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f510ag606-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 10:58:13 +0000 (GMT)
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 661Aw2J9011886;
	Wed, 1 Jul 2026 10:58:10 GMT
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/11] ASoC: qcom: Add QAIF AIF DAI ops
Date: Wed,  1 Jul 2026 16:27:51 +0530
Message-Id: <20260701105757.2779738-6-harendra.gautam@oss.qualcomm.com>
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
X-Proofpoint-GUID: RdfewrdHdF62-R4iQ-_7oYVtM0H7Dcz5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfX/AeNOj9vYclL
 w4j1QfLseBS/eC6MAbQK4gP6Wu+IyVu144ApwAuudF6JMcO6bbmd5NMreQ6IzovgVCNnpE2fUzm
 UWUH2wtnyL6A/itH7XixlJXFZEHQqzr6QOOgZHJImf9VTLQojSfjHTseUOpRFVjeLzcbCDWRKWZ
 wsEfB0MfY46NIx2445zT9Agwzj1NL0E8qOyi7TFuIEjSgHXZJtf7kYaTfSIlkruvlUiiPUjS/cf
 b7JfvKTKU+V0PGB7aTGtJMBrbcmf0NpOk/jvDxMnLb6DxFmRpUPh8rWvns/2bcq266n4WdYPnLb
 2tN7MChGKWUfXyYoqkrFnSn0fFxy8kV8jeynzLdFfs7O4bnb7zYE6Jz+o+uNvKqT4mj4ubDgQuo
 AsgLR2hXTpO/WnNuOCRLSUBs3nEnRnVKFZcGxIt/UONGT5eWEKW4s6/cp+qNo1OVPSzai+HjIB9
 DS+Z/bgB3j1C007jFXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfXxI66m6Ml/sqi
 BpitXvC7rSngd57qR73bWOkoi47IEUq7b2E+p6mQBsASUbaVhVUocrYGClgcAfn0Wd3om7QMPEE
 KW4NS17SW4oU/XIDOGZwvhJ2aeVJRNs=
X-Authority-Analysis: v=2.4 cv=JpXBas4C c=1 sm=1 tr=0 ts=6a44f2c6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=MYsBvJ0p-XDPe8fRrhQA:9
X-Proofpoint-ORIG-GUID: RdfewrdHdF62-R4iQ-_7oYVtM0H7Dcz5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-115664-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 15C356EC755

Add the CPU DAI operations and regmap field setup needed to use the QAIF
AIF (MI2S) path.

The existing QAIF CPU support does not provide the AIF callbacks needed to
configure and control MI2S playback and capture streams. Add the AIF-
specific register field allocation and DAI callbacks to program the
AUD_INTF configuration, set the MI2S bit clock, configure the codec DAI TDM
format, and enable or disable the interface during stream triggers.

This allows QAIF to route playback through RDDMA channels and capture
through WRDMA channels to external serial audio devices over MI2S.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 sound/soc/qcom/qaif-cpu.c | 474 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 474 insertions(+)

diff --git a/sound/soc/qcom/qaif-cpu.c b/sound/soc/qcom/qaif-cpu.c
index 18df81e3ed9d..be524e64f806 100644
--- a/sound/soc/qcom/qaif-cpu.c
+++ b/sound/soc/qcom/qaif-cpu.c
@@ -319,3 +319,477 @@ const struct snd_soc_dai_ops asoc_qcom_qaif_cif_dai_ops = {
 	.trigger	= qaif_cif_daiops_trigger,
 };
 EXPORT_SYMBOL_GPL(asoc_qcom_qaif_cif_dai_ops);
+
+static int qaif_aif_cfg_cpu_init_bitfields(struct device *dev,
+					   struct regmap *map)
+{
+	struct qaif_drv_data *drvdata = dev_get_drvdata(dev);
+	const struct qaif_variant *v = drvdata->variant;
+	struct qaif_aud_intfctl *aif_intfctl;
+
+	aif_intfctl = devm_kzalloc(dev, sizeof(*aif_intfctl), GFP_KERNEL);
+	if (!aif_intfctl)
+		return -ENOMEM;
+
+	/*
+	 * Bulk-allocate all AIF intfctl fields in one call.
+	 * Order must match struct qaif_aud_intfctl member order:
+	 * inv_sync, sync_delay, sync_mode, sync_src,
+	 * slot_width_rx, slot_width_tx, sample_width_rx, sample_width_tx,
+	 * mono_mode_rx, mono_mode_tx,
+	 * lane_en, lane_dir, loopback_en, ctrl_data_oe,
+	 * slot_en_rx_mask, slot_en_tx_mask,
+	 * full_cycle_en, bits_per_lane,
+	 * enable, enable_tx, enable_rx,
+	 * reset, reset_tx, reset_rx
+	 */
+	{
+		const struct reg_field aif_intfctl_fields[] = {
+			v->aif_inv_sync,
+			v->aif_sync_delay,
+			v->aif_sync_mode,
+			v->aif_sync_src,
+			v->aif_slot_width_rx,
+			v->aif_slot_width_tx,
+			v->aif_sample_width_rx,
+			v->aif_sample_width_tx,
+			v->aif_mono_mode_rx,
+			v->aif_mono_mode_tx,
+			v->aif_lane_en,
+			v->aif_lane_dir,
+			v->aif_loopback_en,
+			v->aif_ctrl_data_oe,
+			v->aif_slot_en_rx_mask,
+			v->aif_slot_en_tx_mask,
+			v->aif_full_cycle_en,
+			v->aif_bits_per_lane,
+			v->aif_enable,
+			v->aif_enable_tx,
+			v->aif_enable_rx,
+			v->aif_reset,
+			v->aif_reset_tx,
+			v->aif_reset_rx,
+		};
+		int ret = devm_regmap_field_bulk_alloc(dev, map,
+						       &aif_intfctl->inv_sync,
+						       aif_intfctl_fields,
+						       ARRAY_SIZE(aif_intfctl_fields));
+		if (ret) {
+			dev_err(dev, "error allocating AIF interface regmap fields: %d\n", ret);
+			return ret;
+		}
+	}
+
+	drvdata->aif_intfctl = aif_intfctl;
+
+	return 0;
+}
+
+static int qaif_aif_cpu_init_bitfields(struct device *dev,
+				       struct regmap *map)
+{
+	struct qaif_drv_data *drvdata = dev_get_drvdata(dev);
+	const struct qaif_variant *v = drvdata->variant;
+	struct qaif_dmactl *rd_dmactl;
+	struct qaif_dmactl *wr_dmactl;
+
+	rd_dmactl = devm_kzalloc(dev, sizeof(*rd_dmactl), GFP_KERNEL);
+	if (!rd_dmactl)
+		return -ENOMEM;
+
+	wr_dmactl = devm_kzalloc(dev, sizeof(*wr_dmactl), GFP_KERNEL);
+	if (!wr_dmactl)
+		return -ENOMEM;
+
+	/*
+	 * Bulk-allocate AIF RDDMA dmactl fields.
+	 * Order must match struct qaif_dmactl member order:
+	 * enable, reset, num_ot, dma_dyncclk, burst16, burst8, burst4, burst2, burst1, shram_wm
+	 */
+	{
+		const struct reg_field aif_rd_dmactl_fields[] = {
+			v->rddma_enable,
+			v->rddma_reset,
+			v->rddma_num_ot,
+			v->rddma_dma_dyncclk,
+			v->rddma_burst16,
+			v->rddma_burst8,
+			v->rddma_burst4,
+			v->rddma_burst2,
+			v->rddma_burst1,
+			v->rddma_shram_wm,
+		};
+		int ret = devm_regmap_field_bulk_alloc(dev, map,
+						       &rd_dmactl->enable,
+						       aif_rd_dmactl_fields,
+						       ARRAY_SIZE(aif_rd_dmactl_fields));
+		if (ret) {
+			dev_err(dev, "error allocating AIF RDDMA dmactl regmap fields: %d\n", ret);
+			return ret;
+		}
+	}
+
+	/*
+	 * Bulk-allocate AIF WRDMA dmactl fields.
+	 * Order must match struct qaif_dmactl member order:
+	 * enable, reset, num_ot, dma_dyncclk, burst16, burst8, burst4, burst2, burst1, shram_wm
+	 */
+	{
+		const struct reg_field aif_wr_dmactl_fields[] = {
+			v->wrdma_enable,
+			v->wrdma_reset,
+			v->wrdma_num_ot,
+			v->wrdma_dma_dyncclk,
+			v->wrdma_burst16,
+			v->wrdma_burst8,
+			v->wrdma_burst4,
+			v->wrdma_burst2,
+			v->wrdma_burst1,
+			v->wrdma_shram_wm,
+		};
+		int ret = devm_regmap_field_bulk_alloc(dev, map,
+						       &wr_dmactl->enable,
+						       aif_wr_dmactl_fields,
+						       ARRAY_SIZE(aif_wr_dmactl_fields));
+		if (ret) {
+			dev_err(dev, "error allocating AIF WRDMA dmactl regmap fields: %d\n", ret);
+			return ret;
+		}
+	}
+
+	drvdata->aif_rd_dmactl = rd_dmactl;
+	drvdata->aif_wr_dmactl = wr_dmactl;
+
+	return 0;
+}
+
+static int qaif_aif_cpu_daiops_startup(struct snd_pcm_substream *substream,
+				       struct snd_soc_dai *dai)
+{
+	struct qaif_drv_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	const struct qaif_variant *v = drvdata->variant;
+	int idx, ret = 0;
+
+	idx = v->get_dma_idx(dai->driver->id);
+	if (idx < 0) {
+		dev_err(dai->dev, "%s: Invalid DMA index: %d\n", __func__, idx);
+		return -EINVAL;
+	}
+
+	ret = clk_prepare(drvdata->mi2s_bit_clk[idx]);
+	if (ret) {
+		dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
+		return ret;
+	}
+	return 0;
+}
+
+static void qaif_aif_cpu_daiops_shutdown(struct snd_pcm_substream *substream,
+					 struct snd_soc_dai *dai)
+{
+	struct qaif_drv_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	const struct qaif_variant *v = drvdata->variant;
+	struct qaif_aud_intfctl *aif_intfctl = drvdata->aif_intfctl;
+	const struct qaif_aif_config *aif_intf_cfg;
+	int idx = v->get_dma_idx(dai->driver->id);
+
+	if (idx < 0) {
+		dev_err(dai->dev, "%s: Invalid DMA index: %d\n", __func__, idx);
+		return;
+	}
+
+	aif_intf_cfg = &drvdata->aif_intf_cfg[idx];
+
+	if (aif_intf_cfg->loopback_en)
+		regmap_fields_write(aif_intfctl->enable, idx, QAIF_AIF_CTL_ENABLE_OFF);
+	else if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		regmap_fields_write(aif_intfctl->enable_tx, idx, QAIF_AIF_CTL_ENABLE_OFF);
+	else
+		regmap_fields_write(aif_intfctl->enable_rx, idx, QAIF_AIF_CTL_ENABLE_OFF);
+
+	clk_unprepare(drvdata->mi2s_bit_clk[idx]);
+}
+
+static int qaif_aif_cpu_daiops_hw_free(struct snd_pcm_substream *substream,
+				       struct snd_soc_dai *dai)
+{
+	struct qaif_drv_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	const struct qaif_variant *v = drvdata->variant;
+	int idx = v->get_dma_idx(dai->driver->id);
+
+	if (idx < 0)
+		return 0;
+
+	clk_disable(drvdata->mi2s_bit_clk[idx]);
+	return 0;
+}
+
+static int qaif_aif_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
+					 struct snd_pcm_hw_params *params,
+					 struct snd_soc_dai *dai)
+{
+	struct qaif_drv_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	const struct qaif_variant *v = drvdata->variant;
+	struct qaif_aud_intfctl *aif_intfctl = drvdata->aif_intfctl;
+	const struct qaif_aif_config *aif_intf_cfg = NULL;
+	int idx;
+	snd_pcm_format_t format = params_format(params);
+	unsigned int channels = params_channels(params);
+	unsigned int rate = params_rate(params);
+	unsigned int slot_width = 32;
+	int bitwidth, ret;
+
+	if (!aif_intfctl) {
+		dev_err(dai->dev, "AIF interface control not initialized\n");
+		return -EINVAL;
+	}
+
+	idx = v->get_dma_idx(dai->driver->id);
+
+	if (idx < 0) {
+		dev_err(dai->dev, "%s: Invalid DMA index: %d\n", __func__, idx);
+		return -EINVAL;
+	}
+
+	aif_intf_cfg = &drvdata->aif_intf_cfg[idx];
+
+	if (!aif_intf_cfg) {
+		dev_err(dai->dev, "AIF interface config not found\n");
+		return -EINVAL;
+	}
+	bitwidth = snd_pcm_format_width(format);
+	if (bitwidth < 0) {
+		dev_err(dai->dev, "invalid bit width given: %d\n", bitwidth);
+		return bitwidth;
+	}
+
+	/* SYNC_CFG: write all four sync fields */
+	ret = regmap_fields_write(aif_intfctl->inv_sync, idx, aif_intf_cfg->invert_sync);
+	if (ret) {
+		dev_err(dai->dev, "Failed to write inv_sync: %d\n", ret);
+		return ret;
+	}
+	ret = regmap_fields_write(aif_intfctl->sync_delay, idx, aif_intf_cfg->sync_delay);
+	if (ret) {
+		dev_err(dai->dev, "Failed to write sync_delay: %d\n", ret);
+		return ret;
+	}
+	ret = regmap_fields_write(aif_intfctl->sync_mode, idx, aif_intf_cfg->sync_mode);
+	if (ret) {
+		dev_err(dai->dev, "Failed to write sync_mode: %d\n", ret);
+		return ret;
+	}
+	ret = regmap_fields_write(aif_intfctl->sync_src, idx, aif_intf_cfg->sync_src);
+	if (ret) {
+		dev_err(dai->dev, "Failed to write sync_src: %d\n", ret);
+		return ret;
+	}
+
+	/* LANE_CFG: write all four lane fields */
+	ret = regmap_fields_write(aif_intfctl->loopback_en, idx, aif_intf_cfg->loopback_en);
+	if (ret) {
+		dev_err(dai->dev, "Failed to write loopback_en: %d\n", ret);
+		return ret;
+	}
+	ret = regmap_fields_write(aif_intfctl->ctrl_data_oe, idx, aif_intf_cfg->ctrl_data_oe);
+	if (ret) {
+		dev_err(dai->dev, "Failed to write ctrl_data_oe: %d\n", ret);
+		return ret;
+	}
+	ret = regmap_fields_write(aif_intfctl->lane_en, idx, aif_intf_cfg->lane_en_mask);
+	if (ret) {
+		dev_err(dai->dev, "Failed to write lane_en (mask=0x%02X): %d\n",
+			aif_intf_cfg->lane_en_mask, ret);
+		return ret;
+	}
+	ret = regmap_fields_write(aif_intfctl->lane_dir, idx, aif_intf_cfg->lane_dir_mask);
+	if (ret) {
+		dev_err(dai->dev, "Failed to write lane_dir (mask=0x%02X): %d\n",
+			aif_intf_cfg->lane_dir_mask, ret);
+		return ret;
+	}
+
+	/* CFG: full_cycle_en */
+	ret = regmap_fields_write(aif_intfctl->full_cycle_en, idx, aif_intf_cfg->full_cycle_en);
+	if (ret) {
+		dev_err(dai->dev, "Failed to write full_cycle_en: %d\n", ret);
+		return ret;
+	}
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		slot_width = aif_intf_cfg->slot_width_tx;
+		/* BIT_WIDTH_CFG: TX slot width and sample width */
+		ret = regmap_fields_write(aif_intfctl->slot_width_tx, idx,
+					  QAIF_AIF_SLOT_WIDTH(slot_width));
+		if (ret) {
+			dev_err(dai->dev, "Failed to write slot_width_tx: %d\n", ret);
+			return ret;
+		}
+		ret = regmap_fields_write(aif_intfctl->sample_width_tx, idx,
+					  QAIF_AIF_SAMPLE_WIDTH(bitwidth));
+		if (ret) {
+			dev_err(dai->dev, "Failed to write sample_width_tx: %d\n", ret);
+			return ret;
+		}
+
+		/* ACTV_SLOT_EN_TX */
+		ret = regmap_fields_write(aif_intfctl->slot_en_tx_mask, idx,
+					  aif_intf_cfg->slot_en_tx_mask);
+		if (ret) {
+			dev_err(dai->dev, "Failed to write slot_en_tx_mask (0x%08X): %d\n",
+				aif_intf_cfg->slot_en_tx_mask, ret);
+			return ret;
+		}
+
+		/* FRAME_CFG: bits_per_lane */
+		ret = regmap_fields_write(aif_intfctl->bits_per_lane, idx,
+					  (slot_width * aif_intf_cfg->bits_per_lane) - 1);
+		if (ret) {
+			dev_err(dai->dev, "Failed to write bits_per_lane: %d\n", ret);
+			return ret;
+		}
+
+		/* MI2S_CFG: TX mono mode */
+		ret = regmap_fields_write(aif_intfctl->mono_mode_tx, idx,
+					  (channels >= 2) ? QAIF_AUD_INTF_CTL_STEREO
+					  : QAIF_AUD_INTF_CTL_MONO);
+		if (ret) {
+			dev_err(dai->dev, "Failed to write mono_mode_tx: %d\n", ret);
+			return ret;
+		}
+	} else {
+		slot_width = aif_intf_cfg->slot_width_rx;
+		/* BIT_WIDTH_CFG: RX slot width and sample width */
+		ret = regmap_fields_write(aif_intfctl->slot_width_rx, idx,
+					  QAIF_AIF_SLOT_WIDTH(slot_width));
+		if (ret) {
+			dev_err(dai->dev, "Failed to write slot_width_rx: %d\n", ret);
+			return ret;
+		}
+		ret = regmap_fields_write(aif_intfctl->sample_width_rx, idx,
+					  QAIF_AIF_SAMPLE_WIDTH(bitwidth));
+		if (ret) {
+			dev_err(dai->dev, "Failed to write sample_width_rx: %d\n", ret);
+			return ret;
+		}
+
+		/* ACTV_SLOT_EN_RX */
+		ret = regmap_fields_write(aif_intfctl->slot_en_rx_mask, idx,
+					  aif_intf_cfg->slot_en_rx_mask);
+		if (ret) {
+			dev_err(dai->dev, "Failed to write slot_en_rx_mask (0x%08X): %d\n",
+				aif_intf_cfg->slot_en_rx_mask, ret);
+			return ret;
+		}
+
+		/* FRAME_CFG: bits_per_lane */
+		ret = regmap_fields_write(aif_intfctl->bits_per_lane, idx,
+					  (slot_width * aif_intf_cfg->bits_per_lane) - 1);
+		if (ret) {
+			dev_err(dai->dev, "Failed to write bits_per_lane: %d\n", ret);
+			return ret;
+		}
+
+		/* MI2S_CFG: RX mono mode */
+		ret = regmap_fields_write(aif_intfctl->mono_mode_rx, idx,
+					  (channels >= 2) ? QAIF_AUD_INTF_CTL_STEREO
+					  : QAIF_AUD_INTF_CTL_MONO);
+		if (ret) {
+			dev_err(dai->dev, "Failed to write mono_mode_rx: %d\n", ret);
+			return ret;
+		}
+	}
+
+	ret = clk_set_rate(drvdata->mi2s_bit_clk[idx],
+			   rate * slot_width * aif_intf_cfg->bits_per_lane);
+	if (ret) {
+		dev_err(dai->dev, "error setting mi2s bitclk to %u: %d\n",
+			rate * slot_width * aif_intf_cfg->bits_per_lane, ret);
+		return ret;
+	}
+	dev_dbg(dai->dev, "setting IBIT clock to %u\n",
+		rate * slot_width * aif_intf_cfg->bits_per_lane);
+
+	ret = clk_enable(drvdata->mi2s_bit_clk[idx]);
+	if (ret) {
+		dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
+		return ret;
+	}
+	snd_soc_dai_set_tdm_slot(codec_dai, 0x0f, 0b11, aif_intf_cfg->bits_per_lane, slot_width);
+	snd_soc_dai_set_sysclk(codec_dai, 0, rate * aif_intf_cfg->bits_per_lane * slot_width, 0);
+
+	return 0;
+}
+
+static int qaif_aif_cpu_daiops_trigger(struct snd_pcm_substream *substream,
+				       int cmd, struct snd_soc_dai *dai)
+{
+	struct qaif_drv_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	const struct qaif_variant *v = drvdata->variant;
+	int idx, ret = -EINVAL;
+	const struct qaif_aif_config *aif_intf_cfg;
+
+	idx = v->get_dma_idx(dai->driver->id);
+	if (idx < 0) {
+		dev_err(dai->dev, "%s: Invalid DMA index: %d\n", __func__, idx);
+		return -EINVAL;
+	}
+
+	aif_intf_cfg = &drvdata->aif_intf_cfg[idx];
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		if (aif_intf_cfg->loopback_en)
+			ret = regmap_fields_write(drvdata->aif_intfctl->enable,
+						  idx, QAIF_AIF_CTL_ENABLE_ON);
+		else if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			ret = regmap_fields_write(drvdata->aif_intfctl->enable_tx,
+						  idx, QAIF_AIF_CTL_ENABLE_ON);
+		else
+			ret = regmap_fields_write(drvdata->aif_intfctl->enable_rx,
+						  idx, QAIF_AIF_CTL_ENABLE_ON);
+		if (ret)
+			dev_err(dai->dev, "error writing to AIF CTL reg: %d\n", ret);
+
+		ret = clk_enable(drvdata->mi2s_bit_clk[idx]);
+		if (ret) {
+			dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
+			return ret;
+		}
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+
+		if (aif_intf_cfg->loopback_en)
+			ret = regmap_fields_write(drvdata->aif_intfctl->enable,
+						  idx, QAIF_AIF_CTL_ENABLE_OFF);
+		else if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			ret = regmap_fields_write(drvdata->aif_intfctl->enable_tx,
+						  idx, QAIF_AIF_CTL_ENABLE_OFF);
+		else
+			ret = regmap_fields_write(drvdata->aif_intfctl->enable_rx,
+						  idx, QAIF_AIF_CTL_ENABLE_OFF);
+		if (ret)
+			dev_err(dai->dev, "error writing to AIF CTL reg: %d\n", ret);
+
+		clk_disable(drvdata->mi2s_bit_clk[idx]);
+
+		break;
+	}
+
+	return ret;
+}
+
+const struct snd_soc_dai_ops asoc_qcom_qaif_aif_cpu_dai_ops = {
+	.startup	= qaif_aif_cpu_daiops_startup,
+	.shutdown	= qaif_aif_cpu_daiops_shutdown,
+	.hw_free	= qaif_aif_cpu_daiops_hw_free,
+	.hw_params	= qaif_aif_cpu_daiops_hw_params,
+	.trigger	= qaif_aif_cpu_daiops_trigger,
+};
+EXPORT_SYMBOL_GPL(asoc_qcom_qaif_aif_cpu_dai_ops);
-- 
2.34.1


