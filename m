Return-Path: <linux-arm-msm+bounces-115667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xFxLEGjzRGqX3woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:00:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EE10D6EC7AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:00:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=c88dTSn7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115667-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115667-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A7D01308DECA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 10:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21808449ED2;
	Wed,  1 Jul 2026 10:58:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722F543E9F4;
	Wed,  1 Jul 2026 10:58:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903504; cv=none; b=eI0hXRoGG3eO2/P/lgAPX85Ne2ivCYDR4/Fb5qowQ4d5ND0AfhbX1sP3PhIihjbqn/VYco3PYORjzYDxDkiAjHE0HSt9Fv8HfhXQMnbBsVNpnj91yt8046HLGpmULEsZ2bf4+Dq7jEmtmXYbVDcKAy6nufQGtNT6jxDJWe/Lg2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903504; c=relaxed/simple;
	bh=/n62jFsvCOVA0PSuGE6pG99fXE+YfKy+eW4dnK1/AEE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yz35+vkcuNqJFChfUChgdFcxb8gFrIwbu2L095/5YReLH6akXzj6T/9m3SRlziTW+J48cr0jujFXLoWleFEQ/PS1HpvqbzfnmEyWXLDTFLgsykjwHbjM3M9bwXIRItYMDAjgExiWUsfc1UeV5YmodslncNLZbjSX2T3XXrpvjLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c88dTSn7; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8hvm683257;
	Wed, 1 Jul 2026 10:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yqFxmf9Z1nw2m6rrkzuZwrWAZ7zKKTh5DpQAgpwYQ/A=; b=c88dTSn75sLUDNb6
	Ui2uxAniUJRm0+6XJrZoLBzu+pAsF1Vy8TOMmUHuzFH0oz4C8N7sgG3tqA/AtgGD
	7GF4/WhhlQyVo8ScKTmpjF68OKZI9HgU0v8x5TzLo1OHXAYjxPfDcVU7UgnnaWU5
	jyESLmNosbaLVxsjQO9kSZrLzmn44OStq1HqOCH5U/BAhrs8bFJTlhnbCK9I3KSr
	EQCw7aUaaRZby3Z8lmW15VTXBYHYObuV2TPoGg3pHo+aV/uwy9SECW5EWBAY6ok9
	YHU+ZM/YO+kGngl1a+HNYx/dqHCySH8PLguLUAOVsWVa2mG1VOgf9rGawX9oRDpF
	3GemVg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jtqkujn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 10:58:17 +0000 (GMT)
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 661Aw2JB011886;
	Wed, 1 Jul 2026 10:58:14 GMT
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/11] ASoC: qcom: Add QAIF regmap, DT parsing and platform init
Date: Wed,  1 Jul 2026 16:27:53 +0530
Message-Id: <20260701105757.2779738-8-harendra.gautam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: sJAPw0Ax8KUhlFUPwg5Z9PwtHPyMb2R3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfX1/Fe0Hj6lj1J
 08T7ltHXEISztEFmEvQnptS/dWoY+qMC9yyLs7qhRZrXpFVyoTWKQR6j8BEpbiPEMZCIUr2T45H
 GqgDEDuqXaLIOfj08Wf2QO/pgorgoAXNs3l8u4dSZU4cCtAlK62qwjcN2ZM0C3RkZVJSdDw/csb
 F6Zn4EM8nsrMF1cHZvm3LXw66hKTpOih8VkpQf0xR1QQb5LnERFSTZEaKBp6ff8zajmMci6F8rS
 HAOPKVMhUbpIeVEfKcvFcnuH9HLN3l5FO/9w3r44HMtWf5Q995iTjmxd5WGKg4q274hwZZI1ww7
 CQgcrumYc3FZoIBcvTp3vhOv+JnDynWY5Yp3N/M0QcPSyndhrydJ/ASCiu5mheH/6Anszz7GqXy
 2HbmkXPFVSVsWV18XwvK85x+uOHEYzjuLe28GjSPaNRaFOurnGya5lYBMRwXBK9eX0wba9DFzM6
 ZgpijxGpSu0hCn+K21w==
X-Proofpoint-GUID: sJAPw0Ax8KUhlFUPwg5Z9PwtHPyMb2R3
X-Authority-Analysis: v=2.4 cv=LIZWhpW9 c=1 sm=1 tr=0 ts=6a44f2c9 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=1Fgo0t1f-OoWx1_SSeUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfX2EKkOYsXzdXP
 slhVQMRqDZaKdw/W/Jovo0kwS/3tX7PHregyMdUt3m6t+FjDZjOrwOFjJJ9UFL7LlNX7kHsnY5q
 tISZ3LhZU+ngq/ggRCje+xyevBxU3pI=
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
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115667-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE10D6EC7AF

Add the core CPU and platform bring-up needed for the Qualcomm Audio
Interface driver.

The existing QAIF DAI code needs device-level infrastructure before it can
configure interfaces or run PCM streams. Add the MMIO regmap setup,
including readable, writable and volatile register tables, so the driver
can safely access QAIF control, DMA, interrupt and SHRAM registers.

Parse the QAIF AIF child nodes from devicetree and store the per-interface
PCM, TDM or MI2S configuration for use when programming the AUD_INTF
registers. Add the platform probe, remove and shutdown entry points to map
the device registers, initialize variant-specific resources, allocate
regmap fields, acquire clocks and register the CPU DAI component.

Add the QAIF PCM platform support needed for DMA streams, including PCM
hardware constraints, coherent DMA buffer allocation using
dma_alloc_coherent(), EE resource mapping, QXM DMA routing and SHRAM
partitioning for AIF and CIF DMA channels.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 sound/soc/qcom/qaif-cpu.c      | 799 +++++++++++++++++++++++++++++++++
 sound/soc/qcom/qaif-platform.c | 292 ++++++++++++
 2 files changed, 1091 insertions(+)
 create mode 100644 sound/soc/qcom/qaif-platform.c

diff --git a/sound/soc/qcom/qaif-cpu.c b/sound/soc/qcom/qaif-cpu.c
index 93b75ea8e48f..371d7ef2f57b 100644
--- a/sound/soc/qcom/qaif-cpu.c
+++ b/sound/soc/qcom/qaif-cpu.c
@@ -809,3 +809,802 @@ static const struct snd_soc_component_driver qaif_cpu_comp_driver = {
 	.name = "qaif-cpu",
 	.of_xlate_dai_name = qaif_cpu_of_xlate_dai_name,
 };
+
+static bool audio_qaif_regmap_writeable(struct device *dev, unsigned int reg)
+{
+	struct qaif_drv_data *drvdata = dev_get_drvdata(dev);
+	const struct qaif_variant *v = drvdata->variant;
+	int i;
+
+	/* EE maps */
+	if (reg == QAIF_EE_RDDMA_MAP_REG(v))
+		return true;
+	if (reg == QAIF_EE_WRDMA_MAP_REG(v))
+		return true;
+	if (reg == QAIF_EE_INTF_MAP_REG(v))
+		return true;
+	if (reg == QAIF_EE_CODEC_RDDMA_MAP_REG(v))
+		return true;
+	if (reg == QAIF_EE_CODEC_WRDMA_MAP_REG(v))
+		return true;
+
+	/* QXM DMA path mapping */
+	if (reg == QAIF_RDDMA_MAP_QXM)
+		return true;
+	if (reg == QAIF_WRDMA_MAP_QXM)
+		return true;
+	if (reg == QAIF_CODEC_RDDMA_MAP_QXM)
+		return true;
+	if (reg == QAIF_CODEC_WRDMA_MAP_QXM)
+		return true;
+
+	/* SID maps */
+	if (reg == QAIF_WRDMA_SID_MAP_REG)
+		return true;
+	if (reg == QAIF_CODEC_WRDMA_SID_MAP_REG)
+		return true;
+	if (reg == QAIF_RDDMA_SID_MAP_REG)
+		return true;
+	if (reg == QAIF_CODEC_RDDMA_SID_MAP_REG)
+		return true;
+
+	/* SHRAM QXM0 start address and length */
+	for (i = 0; i < v->num_rddma; i++) {
+		if (reg == QAIF_RDDMA_QXM0_SHRAM_ST_ADDR(i))
+			return true;
+		if (reg == QAIF_RDDMA_QXM0_SHRAM_LEN(i))
+			return true;
+	}
+	for (i = 0; i < v->num_codec_rddma; i++) {
+		if (reg == QAIF_CODEC_RDDMA_QXM0_SHRAM_ST_ADDR(i))
+			return true;
+		if (reg == QAIF_CODEC_RDDMA_QXM0_SHRAM_LEN(i))
+			return true;
+	}
+	for (i = 0; i < v->num_wrdma; i++) {
+		if (reg == QAIF_WRDMA_QXM0_SHRAM_ST_ADDR(i))
+			return true;
+		if (reg == QAIF_WRDMA_QXM0_SHRAM_LEN(i))
+			return true;
+	}
+	for (i = 0; i < v->num_codec_wrdma; i++) {
+		if (reg == QAIF_CODEC_WRDMA_QXM0_SHRAM_ST_ADDR(i))
+			return true;
+		if (reg == QAIF_CODEC_WRDMA_QXM0_SHRAM_LEN(i))
+			return true;
+	}
+
+	/* EE IRQ EN and CLR */
+	for (i = 0; i < QAIF_DMA_TYPE_MAX; i++) {
+		if (reg == QAIF_EE_RDDMA_PERIOD_IRQ_EN_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_RDDMA_PERIOD_IRQ_CLR_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_RDDMA_UNDERFLOW_IRQ_EN_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_RDDMA_UNDERFLOW_IRQ_CLR_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_RDDMA_ERR_RSP_IRQ_EN_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_RDDMA_ERR_RSP_IRQ_CLR_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_WRDMA_PERIOD_IRQ_EN_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_WRDMA_PERIOD_IRQ_CLR_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_WRDMA_OVERFLOW_IRQ_EN_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_WRDMA_OVERFLOW_IRQ_CLR_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_WRDMA_ERR_RSP_IRQ_EN_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_WRDMA_ERR_RSP_IRQ_CLR_REG(v, i))
+			return true;
+	}
+
+	/* AUD_INTF control and configuration */
+	for (i = 0; i < v->num_intf; i++) {
+		if (reg == QAIF_AUD_INTF_CTL_REG(i))
+			return true;
+		if (reg == QAIF_AUD_INTF_SYNC_CFG_REG(i))
+			return true;
+		if (reg == QAIF_AUD_INTF_BIT_WIDTH_CFG_REG(i))
+			return true;
+		if (reg == QAIF_AUD_INTF_FRAME_CFG_REG(i))
+			return true;
+		if (reg == QAIF_AUD_INTF_ACTV_SLOT_EN_TX_REG(i))
+			return true;
+		if (reg == QAIF_AUD_INTF_ACTV_SLOT_EN_RX_REG(i))
+			return true;
+		if (reg == QAIF_AUD_INTF_LANE_CFG_REG(i))
+			return true;
+		if (reg == QAIF_AUD_INTF_MI2S_CFG_REG(i))
+			return true;
+		if (reg == QAIF_AUD_INTF_CFG_REG(i))
+			return true;
+	}
+
+	/* RDDMA control and configuration */
+	for (i = 0; i < v->num_rddma; i++) {
+		if (reg == QAIF_RDDMA_CTL_REG(v, i))
+			return true;
+		if (reg == QAIF_RDDMA_CFG_REG(v, i))
+			return true;
+		if (reg == QAIF_RDDMA_BASE_ADDR_REG(v, i))
+			return true;
+		if (reg == QAIF_RDDMA_BUFF_LEN_REG(v, i))
+			return true;
+		if (reg == QAIF_RDDMA_PERIOD_LEN_REG(v, i))
+			return true;
+	}
+
+	/* CODEC RDDMA control and configuration */
+	for (i = 0; i < v->num_codec_rddma; i++) {
+		if (reg == QAIF_CODEC_RDDMA_CTL_REG(v, i))
+			return true;
+		if (reg == QAIF_CODEC_RDDMA_CFG_REG(v, i))
+			return true;
+		if (reg == QAIF_CODEC_RDDMA_BASE_ADDR_REG(v, i))
+			return true;
+		if (reg == QAIF_CODEC_RDDMA_BUFF_LEN_REG(v, i))
+			return true;
+		if (reg == QAIF_CODEC_RDDMA_PERIOD_LEN_REG(v, i))
+			return true;
+		if (reg == QAIF_CODEC_RDDMA_INTF_CFG_REG(v, i))
+			return true;
+	}
+
+	/* WRDMA control and configuration */
+	for (i = 0; i < v->num_wrdma; i++) {
+		if (reg == QAIF_WRDMA_CTL_REG(v, i))
+			return true;
+		if (reg == QAIF_WRDMA_CFG_REG(v, i))
+			return true;
+		if (reg == QAIF_WRDMA_BASE_ADDR_REG(v, i))
+			return true;
+		if (reg == QAIF_WRDMA_BUFF_LEN_REG(v, i))
+			return true;
+		if (reg == QAIF_WRDMA_PERIOD_LEN_REG(v, i))
+			return true;
+	}
+
+	/* CODEC WRDMA control and configuration */
+	for (i = 0; i < v->num_codec_wrdma; i++) {
+		if (reg == QAIF_CODEC_WRDMA_CTL_REG(v, i))
+			return true;
+		if (reg == QAIF_CODEC_WRDMA_CFG_REG(v, i))
+			return true;
+		if (reg == QAIF_CODEC_WRDMA_BASE_ADDR_REG(v, i))
+			return true;
+		if (reg == QAIF_CODEC_WRDMA_BUFF_LEN_REG(v, i))
+			return true;
+		if (reg == QAIF_CODEC_WRDMA_PERIOD_LEN_REG(v, i))
+			return true;
+		if (reg == QAIF_CODEC_WRDMA_INTF_CFG_REG(v, i))
+			return true;
+	}
+
+	return false;
+}
+
+static bool audio_qaif_regmap_readable(struct device *dev, unsigned int reg)
+{
+	struct qaif_drv_data *drvdata = dev_get_drvdata(dev);
+	const struct qaif_variant *v = drvdata->variant;
+	int i;
+
+	/* Summary IRQ status */
+	if (reg == QAIF_SUMMARY_IRQSTAT_REG(v))
+		return true;
+
+	/* EE maps */
+	if (reg == QAIF_EE_RDDMA_MAP_REG(v))
+		return true;
+	if (reg == QAIF_EE_WRDMA_MAP_REG(v))
+		return true;
+	if (reg == QAIF_EE_INTF_MAP_REG(v))
+		return true;
+	if (reg == QAIF_EE_CODEC_RDDMA_MAP_REG(v))
+		return true;
+	if (reg == QAIF_EE_CODEC_WRDMA_MAP_REG(v))
+		return true;
+
+	/* QXM DMA path mapping */
+	if (reg == QAIF_RDDMA_MAP_QXM)
+		return true;
+	if (reg == QAIF_WRDMA_MAP_QXM)
+		return true;
+	if (reg == QAIF_CODEC_RDDMA_MAP_QXM)
+		return true;
+	if (reg == QAIF_CODEC_WRDMA_MAP_QXM)
+		return true;
+
+	/* SID maps */
+	if (reg == QAIF_WRDMA_SID_MAP_REG)
+		return true;
+	if (reg == QAIF_CODEC_WRDMA_SID_MAP_REG)
+		return true;
+	if (reg == QAIF_RDDMA_SID_MAP_REG)
+		return true;
+	if (reg == QAIF_CODEC_RDDMA_SID_MAP_REG)
+		return true;
+
+	/* SHRAM QXM0 start address and length */
+	for (i = 0; i < v->num_rddma; i++) {
+		if (reg == QAIF_RDDMA_QXM0_SHRAM_ST_ADDR(i))
+			return true;
+		if (reg == QAIF_RDDMA_QXM0_SHRAM_LEN(i))
+			return true;
+	}
+	for (i = 0; i < v->num_codec_rddma; i++) {
+		if (reg == QAIF_CODEC_RDDMA_QXM0_SHRAM_ST_ADDR(i))
+			return true;
+		if (reg == QAIF_CODEC_RDDMA_QXM0_SHRAM_LEN(i))
+			return true;
+	}
+	for (i = 0; i < v->num_wrdma; i++) {
+		if (reg == QAIF_WRDMA_QXM0_SHRAM_ST_ADDR(i))
+			return true;
+		if (reg == QAIF_WRDMA_QXM0_SHRAM_LEN(i))
+			return true;
+	}
+	for (i = 0; i < v->num_codec_wrdma; i++) {
+		if (reg == QAIF_CODEC_WRDMA_QXM0_SHRAM_ST_ADDR(i))
+			return true;
+		if (reg == QAIF_CODEC_WRDMA_QXM0_SHRAM_LEN(i))
+			return true;
+	}
+
+	/* EE IRQ EN, CLR and STATUS */
+	for (i = 0; i < QAIF_DMA_TYPE_MAX; i++) {
+		if (reg == QAIF_EE_RDDMA_PERIOD_IRQ_EN_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_RDDMA_PERIOD_IRQ_CLR_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_RDDMA_PERIOD_IRQ_STAT_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_RDDMA_UNDERFLOW_IRQ_EN_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_RDDMA_UNDERFLOW_IRQ_CLR_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_RDDMA_UNDERFLOW_IRQ_STAT_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_RDDMA_ERR_RSP_IRQ_EN_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_RDDMA_ERR_RSP_IRQ_CLR_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_RDDMA_ERR_RSP_IRQ_STAT_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_WRDMA_PERIOD_IRQ_EN_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_WRDMA_PERIOD_IRQ_CLR_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_WRDMA_PERIOD_IRQ_STAT_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_WRDMA_OVERFLOW_IRQ_EN_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_WRDMA_OVERFLOW_IRQ_CLR_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_WRDMA_OVERFLOW_IRQ_STAT_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_WRDMA_ERR_RSP_IRQ_EN_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_WRDMA_ERR_RSP_IRQ_CLR_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_WRDMA_ERR_RSP_IRQ_STAT_REG(v, i))
+			return true;
+	}
+
+	/* AUD_INTF control and configuration */
+	for (i = 0; i < v->num_intf; i++) {
+		if (reg == QAIF_AUD_INTF_CTL_REG(i))
+			return true;
+		if (reg == QAIF_AUD_INTF_SYNC_CFG_REG(i))
+			return true;
+		if (reg == QAIF_AUD_INTF_BIT_WIDTH_CFG_REG(i))
+			return true;
+		if (reg == QAIF_AUD_INTF_FRAME_CFG_REG(i))
+			return true;
+		if (reg == QAIF_AUD_INTF_ACTV_SLOT_EN_TX_REG(i))
+			return true;
+		if (reg == QAIF_AUD_INTF_ACTV_SLOT_EN_RX_REG(i))
+			return true;
+		if (reg == QAIF_AUD_INTF_LANE_CFG_REG(i))
+			return true;
+		if (reg == QAIF_AUD_INTF_MI2S_CFG_REG(i))
+			return true;
+		if (reg == QAIF_AUD_INTF_CFG_REG(i))
+			return true;
+	}
+
+	/* RDDMA control, configuration and current address */
+	for (i = 0; i < v->num_rddma; i++) {
+		if (reg == QAIF_RDDMA_CTL_REG(v, i))
+			return true;
+		if (reg == QAIF_RDDMA_CFG_REG(v, i))
+			return true;
+		if (reg == QAIF_RDDMA_BASE_ADDR_REG(v, i))
+			return true;
+		if (reg == QAIF_RDDMA_BUFF_LEN_REG(v, i))
+			return true;
+		if (reg == QAIF_RDDMA_CURR_ADDR_REG(v, i))
+			return true;
+		if (reg == QAIF_RDDMA_PERIOD_LEN_REG(v, i))
+			return true;
+	}
+
+	/* CODEC RDDMA control, configuration and current address */
+	for (i = 0; i < v->num_codec_rddma; i++) {
+		if (reg == QAIF_CODEC_RDDMA_CTL_REG(v, i))
+			return true;
+		if (reg == QAIF_CODEC_RDDMA_CFG_REG(v, i))
+			return true;
+		if (reg == QAIF_CODEC_RDDMA_BASE_ADDR_REG(v, i))
+			return true;
+		if (reg == QAIF_CODEC_RDDMA_BUFF_LEN_REG(v, i))
+			return true;
+		if (reg == QAIF_CODEC_RDDMA_CURR_ADDR_REG(v, i))
+			return true;
+		if (reg == QAIF_CODEC_RDDMA_PERIOD_LEN_REG(v, i))
+			return true;
+		if (reg == QAIF_CODEC_RDDMA_INTF_CFG_REG(v, i))
+			return true;
+	}
+
+	/* WRDMA control, configuration and current address */
+	for (i = 0; i < v->num_wrdma; i++) {
+		if (reg == QAIF_WRDMA_CTL_REG(v, i))
+			return true;
+		if (reg == QAIF_WRDMA_CFG_REG(v, i))
+			return true;
+		if (reg == QAIF_WRDMA_BASE_ADDR_REG(v, i))
+			return true;
+		if (reg == QAIF_WRDMA_BUFF_LEN_REG(v, i))
+			return true;
+		if (reg == QAIF_WRDMA_CURR_ADDR_REG(v, i))
+			return true;
+		if (reg == QAIF_WRDMA_PERIOD_LEN_REG(v, i))
+			return true;
+	}
+
+	/* CODEC WRDMA control, configuration and current address */
+	for (i = 0; i < v->num_codec_wrdma; i++) {
+		if (reg == QAIF_CODEC_WRDMA_CTL_REG(v, i))
+			return true;
+		if (reg == QAIF_CODEC_WRDMA_CFG_REG(v, i))
+			return true;
+		if (reg == QAIF_CODEC_WRDMA_BASE_ADDR_REG(v, i))
+			return true;
+		if (reg == QAIF_CODEC_WRDMA_BUFF_LEN_REG(v, i))
+			return true;
+		if (reg == QAIF_CODEC_WRDMA_CURR_ADDR_REG(v, i))
+			return true;
+		if (reg == QAIF_CODEC_WRDMA_PERIOD_LEN_REG(v, i))
+			return true;
+		if (reg == QAIF_CODEC_WRDMA_INTF_CFG_REG(v, i))
+			return true;
+	}
+
+	return false;
+}
+
+static bool audio_qaif_regmap_volatile(struct device *dev, unsigned int reg)
+{
+	struct qaif_drv_data *drvdata = dev_get_drvdata(dev);
+	const struct qaif_variant *v = drvdata->variant;
+	int i;
+
+	/* Summary IRQ status - hardware updated on any interrupt */
+	if (reg == QAIF_SUMMARY_IRQSTAT_REG(v))
+		return true;
+
+	/* EE IRQ status - hardware updated on interrupt */
+	for (i = 0; i < QAIF_DMA_TYPE_MAX; i++) {
+		if (reg == QAIF_EE_RDDMA_PERIOD_IRQ_STAT_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_RDDMA_UNDERFLOW_IRQ_STAT_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_RDDMA_ERR_RSP_IRQ_STAT_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_WRDMA_PERIOD_IRQ_STAT_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_WRDMA_OVERFLOW_IRQ_STAT_REG(v, i))
+			return true;
+		if (reg == QAIF_EE_WRDMA_ERR_RSP_IRQ_STAT_REG(v, i))
+			return true;
+	}
+
+	/* DMA current address - hardware updated during streaming */
+	for (i = 0; i < v->num_rddma; i++) {
+		if (reg == QAIF_RDDMA_CURR_ADDR_REG(v, i))
+			return true;
+	}
+	for (i = 0; i < v->num_wrdma; i++) {
+		if (reg == QAIF_WRDMA_CURR_ADDR_REG(v, i))
+			return true;
+	}
+	for (i = 0; i < v->num_codec_rddma; i++) {
+		if (reg == QAIF_CODEC_RDDMA_CURR_ADDR_REG(v, i))
+			return true;
+	}
+	for (i = 0; i < v->num_codec_wrdma; i++) {
+		if (reg == QAIF_CODEC_WRDMA_CURR_ADDR_REG(v, i))
+			return true;
+	}
+
+	return false;
+}
+
+static struct regmap_config audio_qaif_regmap_config = {
+	.name = "audio_qaif_cpu",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.writeable_reg = audio_qaif_regmap_writeable,
+	.readable_reg = audio_qaif_regmap_readable,
+	.volatile_reg = audio_qaif_regmap_volatile,
+	.cache_type = REGCACHE_FLAT,
+};
+
+static int of_qaif_parse_aif_intf_cfg(struct device *dev,
+				      struct qaif_drv_data *data)
+{
+	const struct qaif_variant *v = data->variant;
+	struct device_node *np = dev->of_node;
+	struct device_node *intf_np;
+	struct qaif_aif_config *cfg;
+	const __be32 *lane_cfg_prop;
+	int ret, j;
+	int lane_cfg_len;
+	u32 dai_id, intf_idx;
+	int num_interfaces = 0;
+
+	if (!v) {
+		dev_err(dev, "No variant data\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * Iterate over all child nodes of qaif_cpu and process only those
+	 * with a recognised AIF interface compatible. The compatible string
+	 * identifies the serial protocol the interface is wired for on the
+	 * board: qcom,qaif-pcm-dai, qcom,qaif-tdm-dai or qcom,qaif-mi2s-dai.
+	 * Other child nodes are silently skipped.
+	 */
+	for_each_child_of_node(np, intf_np) {
+		enum qaif_aif_mode mode;
+
+		if (of_device_is_compatible(intf_np, "qcom,qaif-pcm-dai"))
+			mode = QAIF_AIF_MODE_PCM;
+		else if (of_device_is_compatible(intf_np, "qcom,qaif-tdm-dai"))
+			mode = QAIF_AIF_MODE_TDM;
+		else if (of_device_is_compatible(intf_np, "qcom,qaif-mi2s-dai"))
+			mode = QAIF_AIF_MODE_MI2S;
+		else
+			continue;
+
+		if (num_interfaces >= QAIF_MAX_AIF_CFG_CNT) {
+			dev_warn(dev, "Too many AIF interfaces, limiting to %d\n",
+				 QAIF_MAX_AIF_CFG_CNT);
+			of_node_put(intf_np);
+			break;
+		}
+
+		ret = of_property_read_u32(intf_np, "reg", &dai_id);
+		if (ret) {
+			dev_err(dev, "Missing reg for interface %d: %s\n",
+				num_interfaces, intf_np->name);
+			continue;
+		}
+
+		if (v->get_dma_idx) {
+			intf_idx = v->get_dma_idx(dai_id);
+			if (intf_idx < 0) {
+				dev_err(dev, "Invalid DAI ID %d for interface '%s' (node %d)\n",
+					dai_id, intf_np->name, num_interfaces);
+				continue;
+			}
+			if (intf_idx >= ARRAY_SIZE(data->aif_intf_cfg)) {
+				dev_err(dev, "DAI ID %d maps to out-of-range intf_idx %d\n",
+					dai_id, intf_idx);
+				continue;
+			}
+		} else {
+			dev_err(dev, "can not get intf idx for : %d: %s\n",
+				num_interfaces, intf_np->name);
+			of_node_put(intf_np);
+			return -EINVAL;
+		}
+		cfg = &data->aif_intf_cfg[intf_idx];
+		cfg->mode = mode;
+
+		/* Parse sync configuration — mode-specific */
+		if (mode == QAIF_AIF_MODE_MI2S) {
+			/* MI2S: sync mode is fixed (long sync = 1, WS-based) */
+			cfg->sync_mode = 1;
+		} else {
+			/* PCM/TDM: sync mode comes from DT (0=short, 1=long) */
+			ret = of_property_read_u32(intf_np, "qcom,qaif-aif-sync-mode",
+						   &cfg->sync_mode);
+			if (ret) {
+				dev_err(dev, "Missing sync-mode for interface %d\n",
+					num_interfaces);
+				of_node_put(intf_np);
+				return -EINVAL;
+			}
+		}
+
+		ret = of_property_read_u32(intf_np, "qcom,qaif-aif-sync-src", &cfg->sync_src);
+		if (ret) {
+			dev_warn(dev, "Missing sync-src for interface %d\n", num_interfaces);
+			cfg->sync_src = 0;
+		}
+
+		cfg->invert_sync = of_property_read_bool(intf_np, "qcom,qaif-aif-invert-sync");
+
+		ret = of_property_read_u32(intf_np, "qcom,qaif-aif-sync-delay", &cfg->sync_delay);
+		if (ret) {
+			dev_warn(dev, "Missing sync-delay for interface %d\n", num_interfaces);
+			cfg->sync_delay = 0;
+		}
+
+		/* Parse slot and sample width configuration */
+		ret = of_property_read_u32(intf_np,
+					   "qcom,qaif-aif-slot-width-rx",
+					   &cfg->slot_width_rx);
+		if (ret) {
+			dev_warn(dev, "Missing slot-width-rx for interface %d\n", num_interfaces);
+			cfg->slot_width_rx = 0;
+		}
+
+		ret = of_property_read_u32(intf_np,
+					   "qcom,qaif-aif-slot-width-tx",
+					   &cfg->slot_width_tx);
+		if (ret) {
+			dev_warn(dev, "Missing slot-width-tx for interface %d\n", num_interfaces);
+			cfg->slot_width_tx = 0;
+		}
+
+		/* Parse slot enable masks — mode-specific */
+		if (mode == QAIF_AIF_MODE_MI2S) {
+			/* MI2S: always 2 active slots (left + right) */
+			cfg->slot_en_rx_mask = 0x3;
+			cfg->slot_en_tx_mask = 0x3;
+		} else {
+			/* PCM/TDM: active slot mask comes from DT */
+			ret = of_property_read_u32(intf_np, "qcom,qaif-aif-slot-en-rx-mask",
+						   &cfg->slot_en_rx_mask);
+			if (ret) {
+				dev_warn(dev, "Missing slot-en-rx-mask for interface %d\n",
+					 num_interfaces);
+				cfg->slot_en_rx_mask = 0;
+			}
+			ret = of_property_read_u32(intf_np, "qcom,qaif-aif-slot-en-tx-mask",
+						   &cfg->slot_en_tx_mask);
+			if (ret) {
+				dev_warn(dev, "Missing slot-en-tx-mask for interface %d\n",
+					 num_interfaces);
+				cfg->slot_en_tx_mask = 0;
+			}
+		}
+
+		/* Parse control configuration */
+		cfg->loopback_en = of_property_read_bool(intf_np, "qcom,qaif-aif-loopback");
+
+		cfg->ctrl_data_oe = of_property_read_bool(intf_np, "qcom,qaif-aif-ctrl-data-oe");
+
+		/* Parse lane configuration */
+		lane_cfg_prop = of_get_property(intf_np,
+						"qcom,qaif-aif-lane-config",
+						&lane_cfg_len);
+		if (lane_cfg_prop) {
+			/* Each lane config has 2 u32 values: enable and direction */
+			cfg->num_lanes = lane_cfg_len / (2 * sizeof(u32));
+			if (cfg->num_lanes > QAIF_MAX_LANES) {
+				dev_warn(dev, "Too many lanes (%d), limiting to %d\n",
+					 cfg->num_lanes, QAIF_MAX_LANES);
+				cfg->num_lanes = QAIF_MAX_LANES;
+			}
+
+			for (j = 0; j < cfg->num_lanes; j++) {
+				cfg->lane_cfg[j].enable = be32_to_cpup(lane_cfg_prop + (j * 2));
+				if (cfg->lane_cfg[j].enable)
+					cfg->lane_en_mask |= BIT(j);
+
+				cfg->lane_cfg[j].direction =
+					be32_to_cpup(lane_cfg_prop + (j * 2 + 1));
+				if (cfg->lane_cfg[j].direction)
+					cfg->lane_dir_mask |= BIT(j);
+			}
+
+		} else {
+			dev_warn(dev, "Missing lane-config for interface %d\n", num_interfaces);
+			cfg->num_lanes = 0;
+		}
+
+		/* Mono/stereo mode is written directly from params_channels() in hw_params */
+
+		/* Parse frame configuration */
+		cfg->full_cycle_en = of_property_read_bool(intf_np, "qcom,qaif-aif-full-cycle-en");
+
+		ret = of_property_read_u32(intf_np,
+					   "qcom,qaif-aif-bits-per-lane",
+					   &cfg->bits_per_lane);
+		if (ret) {
+			dev_warn(dev, "Missing bits-per-lane for interface %d\n", num_interfaces);
+			cfg->bits_per_lane = 0;
+		}
+
+		num_interfaces++;
+	}
+
+	if (num_interfaces == 0) {
+		dev_err(dev, "No AIF child nodes with qcom,qaif-{pcm,tdm,mi2s}-dai compatible found\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int of_qaif_cdc_dma_clks_parse(struct device *dev,
+				      struct qaif_drv_data *data)
+{
+	data->aud_dma_clk = devm_clk_get(dev, "aud_dma");
+	if (IS_ERR(data->aud_dma_clk))
+		return PTR_ERR(data->aud_dma_clk);
+
+	data->aud_dma_mem_clk = devm_clk_get(dev, "aud_dma_mem");
+	if (IS_ERR(data->aud_dma_mem_clk))
+		return PTR_ERR(data->aud_dma_mem_clk);
+
+	return 0;
+}
+
+/**
+ * asoc_qcom_qaif_cpu_platform_probe - Probe the QAIF CPU and platform driver
+ * @pdev: Platform device
+ *
+ * Initialises the QAIF regmap, parses DT, sets up clocks and registers
+ * the CPU DAI component and PCM platform.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int asoc_qcom_qaif_cpu_platform_probe(struct platform_device *pdev)
+{
+	struct qaif_drv_data *drvdata;
+	struct resource *res;
+	const struct qaif_variant *variant;
+	struct device *dev = &pdev->dev;
+	const struct of_device_id *match;
+	int ret, i, dai_id, idx;
+	bool variant_init_done = false;
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, drvdata);
+
+	match = of_match_device(dev->driver->of_match_table, dev);
+	if (!match || !match->data)
+		return -EINVAL;
+
+	drvdata->variant = match->data;
+	variant = drvdata->variant;
+
+	ret = of_qaif_parse_aif_intf_cfg(dev, drvdata);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to parse aif interfaces\n");
+
+	drvdata->audio_qaif =
+			devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(drvdata->audio_qaif))
+		return PTR_ERR(drvdata->audio_qaif);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+
+	audio_qaif_regmap_config.max_register = resource_size(res);
+	drvdata->audio_qaif_map =
+		devm_regmap_init_mmio(dev, drvdata->audio_qaif,
+				      &audio_qaif_regmap_config);
+	if (IS_ERR(drvdata->audio_qaif_map))
+		return PTR_ERR(drvdata->audio_qaif_map);
+
+	ret = of_qaif_cdc_dma_clks_parse(dev, drvdata);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get cdc dma clocks\n");
+
+	if (variant->clk_init) {
+		ret = variant->clk_init(pdev);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to initialize variant\n");
+		variant_init_done = true;
+	}
+
+	for (i = 0; i < variant->num_dai; i++) {
+		dai_id = variant->dai_driver[i].id;
+		if (is_cif_dma_port(dai_id))
+			continue;
+		idx = variant->get_dma_idx(dai_id);
+		if (idx < 0)
+			continue;
+
+		drvdata->mi2s_bit_clk[idx] = devm_clk_get(dev,
+							  variant->dai_bit_clk_names[idx]);
+		if (IS_ERR(drvdata->mi2s_bit_clk[idx])) {
+			ret = PTR_ERR(drvdata->mi2s_bit_clk[idx]);
+			dev_err_probe(dev, ret, "error getting %s\n",
+				      variant->dai_bit_clk_names[idx]);
+			goto err;
+		}
+	}
+
+	ret = qaif_aif_cpu_init_bitfields(dev, drvdata->audio_qaif_map);
+	if (ret) {
+		dev_err_probe(dev, ret, "error init aif bitfields\n");
+		goto err;
+	}
+
+	ret = qaif_aif_cfg_cpu_init_bitfields(dev, drvdata->audio_qaif_map);
+	if (ret) {
+		dev_err_probe(dev, ret, "error init aif intfctl fields\n");
+		goto err;
+	}
+
+	ret = qaif_cif_cpu_init_bitfields(dev, drvdata->audio_qaif_map);
+	if (ret) {
+		dev_err_probe(dev, ret, "error init cif bitfields\n");
+		goto err;
+	}
+
+	ret = devm_snd_soc_register_component(dev,
+					      &qaif_cpu_comp_driver,
+					      variant->dai_driver,
+					      variant->num_dai);
+	if (ret) {
+		dev_err_probe(dev, ret, "error registering cpu driver\n");
+		goto err;
+	}
+
+	ret = asoc_qcom_qaif_platform_register(pdev);
+	if (ret) {
+		dev_err_probe(dev, ret, "error registering platform driver\n");
+		goto err;
+	}
+err:
+	if (ret && variant_init_done && variant->clk_deinit)
+		variant->clk_deinit(pdev);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(asoc_qcom_qaif_cpu_platform_probe);
+
+/**
+ * asoc_qcom_qaif_cpu_platform_remove - Remove the QAIF CPU and platform driver
+ * @pdev: Platform device
+ */
+void asoc_qcom_qaif_cpu_platform_remove(struct platform_device *pdev)
+{
+	struct qaif_drv_data *drvdata = platform_get_drvdata(pdev);
+
+	if (drvdata->variant->clk_deinit)
+		drvdata->variant->clk_deinit(pdev);
+}
+EXPORT_SYMBOL_GPL(asoc_qcom_qaif_cpu_platform_remove);
+
+/**
+ * asoc_qcom_qaif_cpu_platform_shutdown - Shutdown the QAIF CPU and platform driver
+ * @pdev: Platform device
+ */
+void asoc_qcom_qaif_cpu_platform_shutdown(struct platform_device *pdev)
+{
+	struct qaif_drv_data *drvdata = platform_get_drvdata(pdev);
+
+	if (drvdata->variant->clk_deinit)
+		drvdata->variant->clk_deinit(pdev);
+}
+EXPORT_SYMBOL_GPL(asoc_qcom_qaif_cpu_platform_shutdown);
+
+MODULE_DESCRIPTION("Qualcomm Audio Interface (QAIF) CPU DAI driver");
+MODULE_AUTHOR("Harendra Gautam <harendra.gautam@oss.qualcomm.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/qaif-platform.c b/sound/soc/qcom/qaif-platform.c
new file mode 100644
index 000000000000..1856389e643b
--- /dev/null
+++ b/sound/soc/qcom/qaif-platform.c
@@ -0,0 +1,292 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * qaif-platform.c -- ALSA SoC PCM platform driver for the Qualcomm Audio Interface (QAIF)
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/export.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <sound/pcm_params.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+#include "qaif-reg.h"
+#include "qaif.h"
+
+#define DRV_NAME "qaif-platform"
+
+/* 20 ms period at 48 kHz S16 stereo = 3840 bytes */
+#define QAIF_PLATFORM_BUFFER_MIN_SIZE		(960 * 2 * 2)
+#define QAIF_PLATFORM_PERIOD_BYTES_MIN		(960 * 2 * 2)
+#define QAIF_PLATFORM_BUFFER_SIZE			(4 * QAIF_PLATFORM_BUFFER_MIN_SIZE)
+#define QAIF_PLATFORM_PERIODS_MIN			2
+#define QAIF_PLATFORM_PERIODS_MAX			4
+
+static const struct snd_pcm_hardware qaif_platform_aif_hardware = {
+	.info			=	SNDRV_PCM_INFO_MMAP |
+					SNDRV_PCM_INFO_MMAP_VALID |
+					SNDRV_PCM_INFO_INTERLEAVED |
+					SNDRV_PCM_INFO_PAUSE |
+					SNDRV_PCM_INFO_RESUME,
+	.formats		=	SNDRV_PCM_FMTBIT_S16 |
+					SNDRV_PCM_FMTBIT_S24 |
+					SNDRV_PCM_FMTBIT_S32,
+	.rates			=	SNDRV_PCM_RATE_8000_192000,
+	.rate_min		=	8000,
+	.rate_max		=	192000,
+	.channels_min		=	1,
+	.channels_max		=	8,
+	.buffer_bytes_max	=	QAIF_PLATFORM_BUFFER_SIZE,
+	.period_bytes_min	=	QAIF_PLATFORM_PERIOD_BYTES_MIN,
+	.period_bytes_max	=	QAIF_PLATFORM_BUFFER_SIZE / QAIF_PLATFORM_PERIODS_MIN,
+	.periods_min		=	QAIF_PLATFORM_PERIODS_MIN,
+	.periods_max		=	QAIF_PLATFORM_PERIODS_MAX,
+	.fifo_size		=	0,
+};
+
+static const struct snd_pcm_hardware qaif_platform_cif_hardware = {
+	.info			=	SNDRV_PCM_INFO_MMAP |
+					SNDRV_PCM_INFO_MMAP_VALID |
+					SNDRV_PCM_INFO_INTERLEAVED |
+					SNDRV_PCM_INFO_PAUSE |
+					SNDRV_PCM_INFO_RESUME,
+	.formats		=	SNDRV_PCM_FMTBIT_S16 |
+					SNDRV_PCM_FMTBIT_S24 |
+					SNDRV_PCM_FMTBIT_S32,
+	.rates			=	SNDRV_PCM_RATE_8000_192000,
+	.rate_min		=	8000,
+	.rate_max		=	192000,
+	.channels_min		=	1,
+	.channels_max		=	8,
+	.buffer_bytes_max	=	QAIF_PLATFORM_BUFFER_SIZE,
+	.period_bytes_min	=	QAIF_PLATFORM_PERIOD_BYTES_MIN,
+	.period_bytes_max	=	QAIF_PLATFORM_BUFFER_SIZE / QAIF_PLATFORM_PERIODS_MIN,
+	.periods_min		=	QAIF_PLATFORM_PERIODS_MIN,
+	.periods_max		=	QAIF_PLATFORM_PERIODS_MAX,
+	.fifo_size		=	0,
+};
+
+static struct qaif_dma_mem_info *
+qaif_mem_alloc_attach(struct snd_soc_component *component,
+		      size_t alloc_size)
+{
+	struct device *dev = component->dev;
+	struct qaif_dma_mem_info *dma_mem_info;
+
+	dma_mem_info = kzalloc(sizeof(*dma_mem_info), GFP_KERNEL);
+	if (!dma_mem_info)
+		return NULL;
+
+	dma_mem_info->alloc_size = alloc_size;
+
+	dma_mem_info->vaddr = dma_alloc_coherent(dev, alloc_size,
+						 &dma_mem_info->dma_addr,
+						 GFP_KERNEL);
+	if (!dma_mem_info->vaddr) {
+		dev_err(dev, "dma_alloc_coherent failed for %zu bytes\n", alloc_size);
+		kfree(dma_mem_info);
+		return NULL;
+	}
+
+	dev_dbg(dev, "%s: dma_addr=%pad vaddr=%p\n",
+		__func__, &dma_mem_info->dma_addr,
+		dma_mem_info->vaddr);
+	return dma_mem_info;
+}
+
+static void qaif_mem_dealloc_detach(struct device *dev,
+				    struct qaif_dma_mem_info *dma_info)
+{
+	if (!dma_info)
+		return;
+
+	if (dma_info->vaddr)
+		dma_free_coherent(dev, dma_info->alloc_size,
+				  dma_info->vaddr, dma_info->dma_addr);
+
+	kfree(dma_info);
+}
+
+static struct qaif_dmactl *qaif_get_dmactl_handle(const struct snd_pcm_substream *substream,
+						  struct snd_soc_component *component)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
+	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
+	struct qaif_dmactl *dmactl = NULL;
+
+	switch (cpu_dai->driver->id) {
+	case QAIF_MI2S_TDM_AIF0 ... QAIF_MI2S_TDM_AIF12:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			dmactl = drvdata->aif_rd_dmactl;
+		else
+			dmactl = drvdata->aif_wr_dmactl;
+		break;
+	case QAIF_CDC_DMA_RX0 ... QAIF_CDC_DMA_RX9:
+		dmactl = drvdata->cif_rd_dmactl;
+		break;
+	case QAIF_CDC_DMA_TX0 ... QAIF_CDC_DMA_TX9:
+	case QAIF_CDC_DMA_VA_TX0 ... QAIF_CDC_DMA_VA_TX9:
+		dmactl = drvdata->cif_wr_dmactl;
+		break;
+	}
+
+	return dmactl;
+}
+
+static int qaif_map_ee_resource(struct qaif_drv_data *drvdata)
+{
+	const struct qaif_variant *v = drvdata->variant;
+	struct regmap *map = drvdata->audio_qaif_map;
+	int ret = 0;
+	u32 mask;
+
+	mask = GENMASK(v->num_rddma - 1, 0);
+	ret |= regmap_write(map, QAIF_EE_RDDMA_MAP_REG(v), mask);
+
+	mask = GENMASK(v->num_wrdma - 1, 0);
+	ret |= regmap_write(map, QAIF_EE_WRDMA_MAP_REG(v), mask);
+
+	if (v->num_intf > 0) {
+		mask = GENMASK(v->num_intf - 1, 0);
+		ret |= regmap_write(map, QAIF_EE_INTF_MAP_REG(v), mask);
+	}
+
+	mask = GENMASK(v->num_codec_rddma - 1, 0);
+	ret |= regmap_write(map, QAIF_EE_CODEC_RDDMA_MAP_REG(v), mask);
+
+	mask = GENMASK(v->num_codec_wrdma - 1, 0);
+	ret |= regmap_write(map, QAIF_EE_CODEC_WRDMA_MAP_REG(v), mask);
+
+	if (ret)
+		return ret;
+	return 0;
+}
+
+static int qaif_map_dma_path(struct qaif_drv_data *drvdata)
+{
+	struct regmap *map = drvdata->audio_qaif_map;
+	const struct qaif_variant *v = drvdata->variant;
+	int ret = 0;
+	int qxm_sel = v->qxm_type;
+
+	if (qxm_sel != QXM0) {
+		dev_err(regmap_get_device(map),
+			"%s: only QXM0 is supported, qxm_type=%d\n",
+			__func__, qxm_sel);
+		return -EINVAL;
+	}
+
+	ret |= regmap_write(map, QAIF_RDDMA_MAP_QXM, qxm_sel);
+	ret |= regmap_write(map, QAIF_WRDMA_MAP_QXM, qxm_sel);
+	ret |= regmap_write(map, QAIF_CODEC_RDDMA_MAP_QXM, qxm_sel);
+	ret |= regmap_write(map, QAIF_CODEC_WRDMA_MAP_QXM, qxm_sel);
+
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int qaif_config_shram(struct qaif_drv_data *drvdata)
+{
+	const struct qaif_variant *v = drvdata->variant;
+	u32 start_addr, shram_len;
+	int ret = 0, i = 0;
+	struct regmap *map = drvdata->audio_qaif_map;
+
+	if (v->qxm_type != QXM0) {
+		dev_err(regmap_get_device(map),
+			"%s: only QXM0 is supported, qxm_type=%d\n",
+			__func__, v->qxm_type);
+		return -EINVAL;
+	}
+	start_addr = v->rddma_shram_start_addr[QAIF_AIF_DMA];
+	shram_len = v->rddma_shram_len;
+	for (i = 0; i < v->num_rddma; i++) {
+		ret = regmap_write(map,
+				   QAIF_RDDMA_QXM0_SHRAM_ST_ADDR(i),
+				   start_addr + (shram_len * i));
+		if (ret)
+			return ret;
+		ret = regmap_write(map, QAIF_RDDMA_QXM0_SHRAM_LEN(i), shram_len);
+		if (ret)
+			return ret;
+	}
+	start_addr = v->wrdma_shram_start_addr[QAIF_AIF_DMA];
+	shram_len = v->wrdma_shram_len;
+	for (i = 0; i < v->num_wrdma; i++) {
+		ret = regmap_write(map,
+				   QAIF_WRDMA_QXM0_SHRAM_ST_ADDR(i),
+				   start_addr + (shram_len * i));
+		if (ret)
+			return ret;
+		ret = regmap_write(map, QAIF_WRDMA_QXM0_SHRAM_LEN(i), shram_len);
+		if (ret)
+			return ret;
+	}
+	start_addr = v->rddma_shram_start_addr[QAIF_CIF_DMA];
+	shram_len = v->rddma_shram_len;
+	for (i = 0; i < v->num_codec_rddma; i++) {
+		ret = regmap_write(map,
+				   QAIF_CODEC_RDDMA_QXM0_SHRAM_ST_ADDR(i),
+				   start_addr + (shram_len * i));
+		if (ret)
+			return ret;
+		ret = regmap_write(map, QAIF_CODEC_RDDMA_QXM0_SHRAM_LEN(i), shram_len);
+		if (ret)
+			return ret;
+	}
+	start_addr = v->wrdma_shram_start_addr[QAIF_CIF_DMA];
+	shram_len = v->wrdma_shram_len;
+	for (i = 0; i < v->num_codec_wrdma; i++) {
+		ret = regmap_write(map,
+				   QAIF_CODEC_WRDMA_QXM0_SHRAM_ST_ADDR(i),
+				   start_addr + (shram_len * i));
+		if (ret)
+			return ret;
+		ret = regmap_write(map, QAIF_CODEC_WRDMA_QXM0_SHRAM_LEN(i), shram_len);
+
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+static int qaif_init(struct snd_soc_component *component)
+{
+	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
+	int ret = 0;
+
+	if (drvdata->qaif_init_ref_cnt) {
+		dev_dbg(component->dev,
+			"%s: QAIF init is done already: ref cnt: %d\n",
+			__func__, drvdata->qaif_init_ref_cnt);
+		return 0;
+	}
+
+	ret = qaif_config_shram(drvdata);
+	if (ret) {
+		dev_err(component->dev, "QAIF: Failed to config shram: %d\n", ret);
+		return ret;
+	}
+
+	ret = qaif_map_ee_resource(drvdata);
+	if (ret) {
+		dev_err(component->dev, "QAIF: Failed to map EE resources: %d\n", ret);
+		return ret;
+	}
+
+	ret = qaif_map_dma_path(drvdata);
+	if (ret) {
+		dev_err(component->dev, "QAIF: Failed to map DMA path: %d\n", ret);
+		return ret;
+	}
+	dev_dbg(component->dev,
+		"%s: QAIF init is done ref cnt: %d\n",
+		__func__, drvdata->qaif_init_ref_cnt);
+	return 0;
+}
-- 
2.34.1


