Return-Path: <linux-arm-msm+bounces-111371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5ijHH1OqImoqbwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:52:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7154464786B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:52:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="a+/SXAiZ";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111371-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111371-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B886A30362DC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 10:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB484C0410;
	Fri,  5 Jun 2026 10:38:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E7C4BC012;
	Fri,  5 Jun 2026 10:37:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780655881; cv=none; b=bewW/IKB7SM74lJGXlRjQhAimp8NC+jzQ2lb9F1aNftbp3q1yx2HX9LCt4Yx5B00yqRbniL1Pp2QSEemn0zG8n7XIObYcf7tLup1hJGhid4ZFwoUdocqDqXHUF1rpjkezrgdbxouBIOGWhCASbZNpbDwayczWE7dF398y32gJt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780655881; c=relaxed/simple;
	bh=6Bau6eWF3OGZbph4DhBnNqwUvTGQCcIfsMmBpA4jPbU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s0XE2ferCnZCPNIiEM22QSaFGyHcTuGAB3Xygkj596P8lSs9FDua3CuLVQ38MNHgZAK9m/6ASvjP38WlcQ0JGAAuKQgqmmHPvuOdsKta4KoKFmWks8Qh4ObdnzZHAega7Wyg0Clj4HNpgCtsCXKIhbcO28QA/pnCQsJfLVhgdM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a+/SXAiZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 655A4KC82975103;
	Fri, 5 Jun 2026 10:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FJ9WJrzJB+H
	GT0aua/Hyv4If1KBHQbm8D8NXwMK4R14=; b=a+/SXAiZbwPCz8uAyh2znQ7ukSl
	ZGcR057e8tlZeKDcDTP+t2SYgOUOn277qmdmjkWpXUv8fLyJL6W5va2Qu5/4Zyqt
	fptrmmdxy6z9G/n3cuf/bHC0wCmSvTAC5Z8YDuriiKoMm2qiDAKIPA67fcPZRywe
	9InirxmuHMdTqrz5BAMO8KVibUmf1BDKH31VAVBMxva6Myk50RhLo78yJNABewcg
	eHhoe1Q8Z6i0AgvG4Xax3hz83lwHI1Cv5sknGtDux1yVYCw2nwUCpYUpVnkMnBJW
	KHPNilVJirEfYhSkkJjI/4+/iC0JCOzTRcVuQYcaakdn5G0v/odmwYUdIEQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekpnu9hcm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jun 2026 10:37:54 +0000 (GMT)
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 655Abk6p011714;
	Fri, 5 Jun 2026 10:37:51 GMT
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/13] ASoC: qcom: Add QAIF hardware register map
Date: Fri,  5 Jun 2026 16:07:30 +0530
Message-Id: <20260605103739.3557573-5-harendra.gautam@oss.qualcomm.com>
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
X-Proofpoint-GUID: H8DTCX_OFun0ds8cmRJPFzlTsv4_np-F
X-Authority-Analysis: v=2.4 cv=Ksl9H2WN c=1 sm=1 tr=0 ts=6a22a703 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=WaxOdm7N1IIUbwD4DyAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDEwMyBTYWx0ZWRfX27Lgy26aXFeI
 IDlF2xXlsByQ2DUuvDcxOAbkCRVEw6ERYb8H8ClIQH6xo6gzhi/uc7OiKfgEcR6u1ih8G4abEOb
 FLbv2DGcIjX2KvTvDtqSXmKelaWHRWt12/1qqtxGai+YfG5OKkC7EPx2GVP3q8WWHHh1u2ehMop
 HrXC2Z6hSTbYNlPeYcIhuHe2CriSDpZ2CKdEs7MbiQ889OOlhy/Eyg+dmmcjXhctPFNA9/tFrPN
 1RzA7T4Sz/cmOu+YWFURv+YzZsVoH4Rc5sDmDORPkg0dp/pl27WMkucsKYSMNGHFTr13mzck3pz
 DOi9aCn7618h2qmNtOchI6aQqD1sMgpry6Zqt3tYLW/uukALKtu3sCaJkODL8tRNO2RwS5DY/Ce
 MxdW2XclVwpjCeptdFVDkKREJ3H/qGY+ZwuKqjyYwaF/v2q4qvizMJgS577s6cKNb/hs4a8TA4i
 iFPo0Ke3EocuYsJTs1Q==
X-Proofpoint-ORIG-GUID: H8DTCX_OFun0ds8cmRJPFzlTsv4_np-F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050103
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111371-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7154464786B

Add qaif-reg.h with the MMIO register definitions for the Qualcomm Audio
Interface (QAIF) hardware block.

The QAIF driver needs these definitions to program the core registers,
audio interfaces, AIF/CIF DMA channels, interrupt registers, SHRAM/QXM
routing, and SID maps. Also add common accessor macros so the driver can
select the appropriate AIF or CIF DMA register set based on the DAI ID.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 sound/soc/qcom/qaif-reg.h | 405 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 405 insertions(+)
 create mode 100644 sound/soc/qcom/qaif-reg.h

diff --git a/sound/soc/qcom/qaif-reg.h b/sound/soc/qcom/qaif-reg.h
new file mode 100644
index 000000000000..1034b50b431a
--- /dev/null
+++ b/sound/soc/qcom/qaif-reg.h
@@ -0,0 +1,405 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * qaif-reg.h -- ALSA SoC CPU-Platform DAI driver register header file for QTi QAIF
+ */
+#ifndef __QAIF_REG_H__
+#define __QAIF_REG_H__
+
+#include "qaif.h"
+
+#define QAIF_SUMMARY_IRQSTAT_REG(v)					(0x19188 + (0x1000 * (v->ee)))
+
+
+/* Core HW info */
+#define QAIF_HW_VERSION_REG                                 (0x0000)
+#define QAIF_HW_INFO_REG                                    (0x0004)
+#define QAIF_HW_INFO2_REG                                   (0x0008)
+
+/* Interface lane and channel info */
+#define QAIF_AUD_INTF_LANE_INFO_REG                         (0x0020)
+#define QAIF_AUD_INTF_LANE_INFO2_REG                        (0x0024)
+#define QAIF_CODEC_TX_INTF_CH_INFO_REG(n)                   (0x0028 + (0x4 * (n)))
+#define QAIF_CODEC_RX_INTF_CH_INFO_REG(n)                   (0x0068 + (0x4 * (n)))
+#define QAIF_QXM1_SHRAM_LENGTH_INFO_REG                     (0x0088)
+#define QAIF_QXM0_SHRAM_LENGTH_INFO_REG                     (0x008C)
+#define QAIF_NUM_AUD_INTF_TO_RAIL_INFO_REG                  (0x0090)
+
+/* Debug/control and status */
+#define QAIF_DEBUG_CTL_REG                                  (0x0200)
+#define QAIF_WRDMA_LOOPBACK_EN_REG                          (0x0204)
+#define QAIF_WRDMA_LOOPBACK_SEL_REG                         (0x0208)
+#define QAIF_SHRAM_DYNAMIC_CLK_GATING_EN_REG                (0x0300)
+#define QAIF_AXI_STATUS_REG                                 (0x0304)
+#define QAIF_QSB_DYNAMIC_CLK_GATING_EN_REG                  (0x0308)
+#define QAIF_START_STOP_CTRL_BYPASS_EN_REG                  (0x030C)
+#define QAIF_QXM0_AXI_ATTR_CFG_REG                          (0x040C)
+
+/* QXM request/grant debug */
+#define QAIF_QXM0_AUD_WR_REQ_GNT_DBG_STAT_REG               (0x0500)
+#define QAIF_QXM1_AUD_WR_REQ_GNT_DBG_STAT_REG               (0x0504)
+#define QAIF_QXM0_CODEC_RX_WR_REQ_DBG_STAT_REG              (0x0508)
+#define QAIF_QXM0_CODEC_RX_WR_GNT_DBG_STAT_REG              (0x050C)
+#define QAIF_QXM1_CODEC_RX_WR_REQ_DBG_STAT_REG              (0x0510)
+#define QAIF_QXM1_CODEC_RX_WR_GNT_DBG_STAT_REG              (0x0514)
+#define QAIF_QXM0_AUD_RD_REQ_GNT_DBG_STAT_REG               (0x0518)
+#define QAIF_QXM1_AUD_RD_REQ_GNT_DBG_STAT_REG               (0x051C)
+#define QAIF_QXM0_CODEC_TX_RD_REQ_DBG_STAT_REG              (0x0520)
+#define QAIF_QXM0_CODEC_TX_RD_GNT_DBG_STAT_REG              (0x0524)
+#define QAIF_QXM1_CODEC_TX_RD_REQ_DBG_STAT_REG              (0x0528)
+#define QAIF_QXM1_CODEC_TX_RD_GNT_DBG_STAT_REG              (0x052C)
+#define QAIF_QXM0_EXT_RDDMA_RD_REQ_GNT_DBG_STAT_REG         (0x0530)
+#define QAIF_QXM1_EXT_RDDMA_RD_REQ_GNT_DBG_STAT_REG         (0x0534)
+
+/* QSB transaction debug */
+#define QAIF_QSB_AUD_WR_TXN_DBG_STAT_REG                    (0x0538)
+#define QAIF_QSB_CODEC_RX_WR_TXN_ERR_DBG_STAT_REG           (0x053C)
+#define QAIF_QSB_CODEC_RX_WR_TXN_OKAY_DBG_STAT_REG          (0x0540)
+#define QAIF_QSB_AUD_ADDR_SENT_DBG_STAT_REG                 (0x0544)
+#define QAIF_QSB_CODEC_TX_RD_ADDR_SENT_DBG_STAT_REG         (0x0548)
+#define QAIF_QSB_EXT_RDDMA_RD_ADDR_SENT_DBG_STAT_REG        (0x054C)
+#define QAIF_QSB_CODEC_RX_WR_ADDR_SENT_DBG_STAT_REG         (0x0550)
+#define QAIF_QSB_AUD_RD_TXN_DBG_STAT_REG                    (0x0554)
+#define QAIF_QSB_CODEC_TX_RD_TXN_ERR_DBG_STAT_REG           (0x0558)
+#define QAIF_QSB_CODEC_TX_RD_TXN_RCVD_DBG_STAT_REG          (0x055C)
+#define QAIF_QSB_EXT_RDDMA_RD_TXN_DBG_STAT_REG              (0x0560)
+#define QAIF_QSB_MISC_DBG_STATUS_REG                        (0x0564)
+
+/* Global spare and HWE */
+#define QAIF_GLOBAL_SPARE_IN_REG                            (0x0B00)
+#define QAIF_GLOBAL_SPARE_OUT_REG                           (0x0B04)
+#define QAIF_HWE_CFG_REG                                    (0x0B08)
+
+/* SID maps */
+#define QAIF_WRDMA_SID_MAP_REG                              (0x1B00)
+#define QAIF_CODEC_WRDMA_SID_MAP_REG                        (0x1B40)
+#define QAIF_RDDMA_SID_MAP_REG                              (0x1C00)
+#define QAIF_CODEC_RDDMA_SID_MAP_REG                        (0x1C40)
+
+/* EE overlap interrupts */
+#define QAIF_EE_OVERLAP_IRQ_EN_REG                          (0x1D00)
+#define QAIF_EE_OVERLAP_IRQ_RAW_STATUS_REG                  (0x1D04)
+#define QAIF_EE_OVERLAP_IRQ_CLEAR_REG                       (0x1D08)
+#define QAIF_EE_OVERLAP_IRQ_FORCE_REG                       (0x1D0C)
+
+/* EE assignments and maps */
+#define QAIF_EE_RDDMA_ASSIGNMENT_REG(v)                     (0x19148 + (0x1000 * (v->ee)))
+#define QAIF_EE_WRDMA_ASSIGNMENT_REG(v)                     (0x19150 + (0x1000 * (v->ee)))
+#define QAIF_EE_INTF_ASSIGNMENT_REG(v)                      (0x19158 + (0x1000 * (v->ee)))
+#define QAIF_EE_CODEC_RDDMA_ASSIGNMENT_REG(v)               (0x19308 + (0x1000 * (v->ee)))
+#define QAIF_EE_CODEC_WRDMA_ASSIGNMENT_REG(v)               (0x19318 + (0x1000 * (v->ee)))
+#define QAIF_EE_RDDMA_MAP_REG(v)                            (0x1920 + (0x1000 * (v->ee)))
+#define QAIF_EE_WRDMA_MAP_REG(v)                            (0x1940 + (0x1000 * (v->ee)))
+#define QAIF_EE_INTF_MAP_REG(v)                             (0x1960 + (0x1000 * (v->ee)))
+#define QAIF_EE_CODEC_RDDMA_MAP_REG(v)                      (0x1980 + (0x1000 * (v->ee)))
+#define QAIF_EE_CODEC_WRDMA_MAP_REG(v)                      (0x1A00 + (0x1000 * (v->ee)))
+
+/* EE rate-detection and VFR interrupts */
+#define QAIF_EE_RATE_DET_IRQ_EN_REG(v)                      (0x190F0 + (0x1000 * (v->ee)))
+#define QAIF_EE_RATE_DET_IRQ_STATUS_REG(v)                  (0x190F4 + (0x1000 * (v->ee)))
+#define QAIF_EE_RATE_DET_IRQ_RAW_STATUS_REG(v)              (0x190F8 + (0x1000 * (v->ee)))
+#define QAIF_EE_RATE_DET_IRQ_CLEAR_REG(v)                   (0x190FC + (0x1000 * (v->ee)))
+#define QAIF_EE_RATE_DET_IRQ_FORCE_REG(v)                   (0x19100 + (0x1000 * (v->ee)))
+
+#define QAIF_EE_VFR_IRQ_EN_REG(v)                           (0x19104 + (0x1000 * (v->ee)))
+#define QAIF_EE_VFR_IRQ_STATUS_REG(v)                       (0x19108 + (0x1000 * (v->ee)))
+#define QAIF_EE_VFR_IRQ_RAW_STATUS_REG(v)                   (0x1910C + (0x1000 * (v->ee)))
+#define QAIF_EE_VFR_IRQ_CLEAR_REG(v)                        (0x19110 + (0x1000 * (v->ee)))
+#define QAIF_EE_VFR_IRQ_FORCE_REG(v)                        (0x19114 + (0x1000 * (v->ee)))
+
+/* EE AUD_INTF underflow/overflow interrupts */
+#define QAIF_EE_AUD_INTF_UNDERFLOW_IRQ_EN_REG(v)            (0x19160 + (0x1000 * (v->ee)))
+#define QAIF_EE_AUD_INTF_UNDERFLOW_IRQ_STATUS_REG(v)        (0x19164 + (0x1000 * (v->ee)))
+#define QAIF_EE_AUD_INTF_UNDERFLOW_IRQ_RAW_STATUS_REG(v)    (0x19168 + (0x1000 * (v->ee)))
+#define QAIF_EE_AUD_INTF_UNDERFLOW_IRQ_CLEAR_REG(v)         (0x1916C + (0x1000 * (v->ee)))
+#define QAIF_EE_AUD_INTF_UNDERFLOW_IRQ_FORCE_REG(v)         (0x19170 + (0x1000 * (v->ee)))
+
+#define QAIF_EE_AUD_INTF_OVERFLOW_IRQ_EN_REG(v)             (0x19174 + (0x1000 * (v->ee)))
+#define QAIF_EE_AUD_INTF_OVERFLOW_IRQ_STATUS_REG(v)         (0x19178 + (0x1000 * (v->ee)))
+#define QAIF_EE_AUD_INTF_OVERFLOW_IRQ_RAW_STATUS_REG(v)     (0x1917C + (0x1000 * (v->ee)))
+#define QAIF_EE_AUD_INTF_OVERFLOW_IRQ_CLEAR_REG(v)          (0x19180 + (0x1000 * (v->ee)))
+#define QAIF_EE_AUD_INTF_OVERFLOW_IRQ_FORCE_REG(v)          (0x19184 + (0x1000 * (v->ee)))
+
+/* EE L2 Period IRQ mux selection */
+#define QAIF_EE_L2_PERIOD_IRQ_0_3_MUX_SEL_REG(v)            (0x19F00 + (0x1000 * (v->ee)))
+#define QAIF_EE_L2_PERIOD_IRQ_4_7_MUX_SEL_REG(v)            (0x19F04 + (0x1000 * (v->ee)))
+
+/* AUD_INTF block (per interface, stride 0x1000 starting at 0x4000) */
+#define QAIF_AUD_INTF_REG_ADDR(offset, intf)                (0x4000 + (offset) + (0x1000 * (intf)))
+
+#define QAIF_AUD_INTF_CTL_REG(intf)                          QAIF_AUD_INTF_REG_ADDR(0x0000, (intf))
+#define QAIF_AUD_INTF_SYNC_CFG_REG(intf)                     QAIF_AUD_INTF_REG_ADDR(0x0004, (intf))
+#define QAIF_AUD_INTF_BIT_WIDTH_CFG_REG(intf)                QAIF_AUD_INTF_REG_ADDR(0x0008, (intf))
+#define QAIF_AUD_INTF_FRAME_CFG_REG(intf)                    QAIF_AUD_INTF_REG_ADDR(0x000C, (intf))
+#define QAIF_AUD_INTF_ACTV_SLOT_EN_TX_REG(intf)              QAIF_AUD_INTF_REG_ADDR(0x0010, (intf))
+#define QAIF_AUD_INTF_ACTV_SLOT_EN_RX_REG(intf)              QAIF_AUD_INTF_REG_ADDR(0x0030, (intf))
+#define QAIF_AUD_INTF_LANE_CFG_REG(intf)                     QAIF_AUD_INTF_REG_ADDR(0x0050, (intf))
+#define QAIF_AUD_INTF_MI2S_CFG_REG(intf)                     QAIF_AUD_INTF_REG_ADDR(0x0054, (intf))
+#define QAIF_AUD_INTF_CFG_REG(intf)                          QAIF_AUD_INTF_REG_ADDR(0x0058, (intf))
+#define QAIF_AUD_INTF_CHAR_CTL_REG(intf)                     QAIF_AUD_INTF_REG_ADDR(0x005C, (intf))
+#define QAIF_AUD_INTF_CHAR_CFG_REG(intf)                     QAIF_AUD_INTF_REG_ADDR(0x0060, (intf))
+#define QAIF_AUD_INTF_CHAR_DATA_REG(intf)                    QAIF_AUD_INTF_REG_ADDR(0x0064, (intf))
+#define QAIF_AUD_INTF_CHAR_DATA_EXT_REG(intf)                QAIF_AUD_INTF_REG_ADDR(0x0068, (intf))
+#define QAIF_AUD_INTF_CHAR_SYNC_REG(intf)                    QAIF_AUD_INTF_REG_ADDR(0x006C, (intf))
+#define QAIF_AUD_INTF_INIT_DBG_STATUS_REG(intf)              QAIF_AUD_INTF_REG_ADDR(0x0FF0, (intf))
+#define QAIF_AUD_INTF_TX_DBG_STATUS_REG(intf)                QAIF_AUD_INTF_REG_ADDR(0x0FF4, (intf))
+#define QAIF_AUD_INTF_RX_DBG_STATUS_REG(intf)                QAIF_AUD_INTF_REG_ADDR(0x0FF8, (intf))
+
+/* RATE_DET block (per detector, stride 0x1000 starting at 0x1E000) */
+#define QAIF_RATE_DET_REG_ADDR(offset, det)                  (0x1E000 + (offset) + (0x1000 * (det)))
+
+#define QAIF_RATE_DET_CONFIG_REG(det)                        QAIF_RATE_DET_REG_ADDR(0x0000, (det))
+#define QAIF_RATE_DET_TARGET1_CONFIG_REG(det)                QAIF_RATE_DET_REG_ADDR(0x0004, (det))
+#define QAIF_RATE_DET_TARGET2_CONFIG_REG(det)                QAIF_RATE_DET_REG_ADDR(0x0008, (det))
+#define QAIF_RATE_DET_BIN_REG(det)                           QAIF_RATE_DET_REG_ADDR(0x000C, (det))
+#define QAIF_RATE_DET_STC_DIFF_REG(det)                      QAIF_RATE_DET_REG_ADDR(0x0010, (det))
+#define QAIF_RATE_DET_SEL_REG(det)                           QAIF_RATE_DET_REG_ADDR(0x0014, (det))
+#define QAIF_RATE_DET_TIMEOUT_CFG_REG(det)                   QAIF_RATE_DET_REG_ADDR(0x0018, (det))
+
+#define QAIF_WRDMA_MAP_QXM									(0X1000)
+#define QAIF_CODEC_WRDMA_MAP_QXM							(0X1004)
+#define QAIF_RDDMA_MAP_QXM									(0X1010)
+#define QAIF_CODEC_RDDMA_MAP_QXM							(0X1014)
+#define QAIF_RDDMA_QXM1_SHRAM_ST_ADDR(i)					(0X1100 + (0x4 * (i)))
+#define QAIF_CODEC_RDDMA_QXM1_SHRAM_ST_ADDR(i)				(0X1140 + (0x4 * (i)))
+#define QAIF_RDDMA_QXM0_SHRAM_ST_ADDR(i)					(0X1200 + (0x4 * (i)))
+#define QAIF_CODEC_RDDMA_QXM0_SHRAM_ST_ADDR(i)				(0X1240 + (0x4 * (i)))
+#define QAIF_RDDMA_QXM1_SHRAM_LEN(i)						(0x1300 + (0x4 * (i)))
+#define QAIF_CODEC_RDDMA_QXM1_SHRAM_LEN(i)					(0x1340 + (0x4 * (i)))
+#define QAIF_RDDMA_QXM0_SHRAM_LEN(i)						(0x1400 + (0x4 * (i)))
+#define QAIF_CODEC_RDDMA_QXM0_SHRAM_LEN(i)					(0x1440 + (0x4 * (i)))
+#define QAIF_WRDMA_QXM1_SHRAM_ST_ADDR(i)					(0x1500 + (0x4 * (i)))
+#define QAIF_CODEC_WRDMA_QXM1_SHRAM_ST_ADDR(i)				(0x1540 + (0x4 * (i)))
+#define QAIF_WRDMA_QXM0_SHRAM_ST_ADDR(i)					(0x1600 + (0x4 * (i)))
+#define QAIF_CODEC_WRDMA_QXM0_SHRAM_ST_ADDR(i)				(0x1640 + (0x4 * (i)))
+#define QAIF_WRDMA_QXM1_SHRAM_LEN(i)						(0x1700 + (0x4 * (i)))
+#define QAIF_CODEC_WRDMA_QXM1_SHRAM_LEN(i)					(0x1740 + (0x4 * (i)))
+#define QAIF_WRDMA_QXM0_SHRAM_LEN(i)						(0x1800 + (0x4 * (i)))
+#define QAIF_CODEC_WRDMA_QXM0_SHRAM_LEN(i)					(0x1840 + (0x4 * (i)))
+
+/* RDDMA
+ * v : ptr to qaif_variant
+ */
+#define QAIF_RDDMA_REG_ADDR(v, offset, chan) \
+	(v->rddma_reg_base + (offset) + v->rddma_stride * (chan))
+#define QAIF_RDDMA_CTL_REG(v, chan)							QAIF_RDDMA_REG_ADDR(v, 0x00, (chan))
+#define QAIF_RDDMA_CFG_REG(v, chan)							QAIF_RDDMA_REG_ADDR(v, 0x04, (chan))
+#define QAIF_RDDMA_BASE_ADDR_REG(v, chan)					QAIF_RDDMA_REG_ADDR(v, 0x08, (chan))
+#define	QAIF_RDDMA_BUFF_LEN_REG(v, chan)					QAIF_RDDMA_REG_ADDR(v, 0x10, (chan))
+#define QAIF_RDDMA_CURR_ADDR_REG(v, chan)					QAIF_RDDMA_REG_ADDR(v, 0x14, (chan))
+#define	QAIF_RDDMA_PERIOD_LEN_REG(v, chan)					QAIF_RDDMA_REG_ADDR(v, 0x1C, (chan))
+#define	QAIF_RDDMA_PERIOD_CNT_REG(v, chan)					QAIF_RDDMA_REG_ADDR(v, 0x20, (chan))
+#define QAIF_RDDMA_SHRAM_WORDCNT_REG(v, chan)				QAIF_RDDMA_REG_ADDR(v, 0x24, (chan))
+#define QAIF_RDDMA_FRAME_STATUS_REG(v, chan)				QAIF_RDDMA_REG_ADDR(v, 0x28, (chan))
+#define QAIF_RDDMA_FRAME_STATUS_EXTN_REG(v, chan)			QAIF_RDDMA_REG_ADDR(v, 0x2C, (chan))
+#define QAIF_RDDMA_FRAME_STATUS_CLR_REG(v, chan)			QAIF_RDDMA_REG_ADDR(v, 0x30, (chan))
+#define QAIF_RDDMA_SET_BUFF_CNT_REG(v, chan)				QAIF_RDDMA_REG_ADDR(v, 0x34, (chan))
+#define QAIF_RDDMA_SET_PERIOD_CNT_REG(v, chan)				QAIF_RDDMA_REG_ADDR(v, 0x38, (chan))
+#define QAIF_RDDMA_STC_LSB_REG(v, chan)						QAIF_RDDMA_REG_ADDR(v, 0x3C, (chan))
+#define QAIF_RDDMA_STC_MSB_REG(v, chan)						QAIF_RDDMA_REG_ADDR(v, 0x40, (chan))
+#define QAIF_RDDMA_PERIOD_DET_STAT_REG(v, chan)				QAIF_RDDMA_REG_ADDR(v, 0x44, (chan))
+#define QAIF_RDDMA_PERIOD_DET_CLR_REG(v, chan)				QAIF_RDDMA_REG_ADDR(v, 0x48, (chan))
+#define QAIF_RDDMA_FORMAT_ERR_REG(v, chan)					QAIF_RDDMA_REG_ADDR(v, 0x4C, (chan))
+#define QAIF_RDDMA_AHB_BYPASS_REG(v, chan)					QAIF_RDDMA_REG_ADDR(v, 0x50, (chan))
+#define QAIF_RDDMA_SHUTDOWN_STAT_REG(v, chan)				QAIF_RDDMA_REG_ADDR(v, 0x54, (chan))
+#define QAIF_RDDMA_PADDING_CFG_REG(v, chan)					QAIF_RDDMA_REG_ADDR(v, 0x58, (chan))
+#define QAIF_RDDMA_STATUS_REG(v, chan)						QAIF_RDDMA_REG_ADDR(v, 0x60, (chan))
+#define QAIF_RDDMA_DBG_STATUS_REG(v, chan)					QAIF_RDDMA_REG_ADDR(v, 0xFF0, (chan))
+
+#define QAIF_CODEC_RDDMA_REG_ADDR(v, offset, chan) \
+	(v->codec_rddma_reg_base + (offset) + v->codec_rddma_stride * (chan))
+#define QAIF_CODEC_RDDMA_CTL_REG(v, chan)					QAIF_CODEC_RDDMA_REG_ADDR(v, 0x00, (chan))
+#define QAIF_CODEC_RDDMA_CFG_REG(v, chan)					QAIF_CODEC_RDDMA_REG_ADDR(v, 0x04, (chan))
+#define QAIF_CODEC_RDDMA_BASE_ADDR_REG(v, chan)				QAIF_CODEC_RDDMA_REG_ADDR(v, 0x08, (chan))
+#define QAIF_CODEC_RDDMA_BUFF_LEN_REG(v, chan)				QAIF_CODEC_RDDMA_REG_ADDR(v, 0x10, (chan))
+#define QAIF_CODEC_RDDMA_CURR_ADDR_REG(v, chan)				QAIF_CODEC_RDDMA_REG_ADDR(v, 0x14, (chan))
+#define QAIF_CODEC_RDDMA_PERIOD_LEN_REG(v, chan)			QAIF_CODEC_RDDMA_REG_ADDR(v, 0x1C, (chan))
+#define QAIF_CODEC_RDDMA_PERIOD_CNT_REG(v, chan)			QAIF_CODEC_RDDMA_REG_ADDR(v, 0x20, (chan))
+#define QAIF_CODEC_RDDMA_SHRAM_WORDCNT_REG(v, chan)			QAIF_CODEC_RDDMA_REG_ADDR(v, 0x24, (chan))
+#define QAIF_CODEC_RDDMA_FRAME_STATUS_REG(v, chan)			QAIF_CODEC_RDDMA_REG_ADDR(v, 0x28, (chan))
+#define QAIF_CODEC_RDDMA_FRAME_STATUS_EXTN_REG(v, chan)		QAIF_CODEC_RDDMA_REG_ADDR(v, 0x2C, (chan))
+#define QAIF_CODEC_RDDMA_FRAME_STATUS_CLR_REG(v, chan)		QAIF_CODEC_RDDMA_REG_ADDR(v, 0x30, (chan))
+#define QAIF_CODEC_RDDMA_SET_BUFF_CNT_REG(v, chan)			QAIF_CODEC_RDDMA_REG_ADDR(v, 0x34, (chan))
+#define QAIF_CODEC_RDDMA_SET_PERIOD_CNT_REG(v, chan)		QAIF_CODEC_RDDMA_REG_ADDR(v, 0x38, (chan))
+#define QAIF_CODEC_RDDMA_STC_LSB_REG(v, chan)				QAIF_CODEC_RDDMA_REG_ADDR(v, 0x3C, (chan))
+#define QAIF_CODEC_RDDMA_STC_MSB_REG(v, chan)				QAIF_CODEC_RDDMA_REG_ADDR(v, 0x40, (chan))
+#define QAIF_CODEC_RDDMA_PERIOD_DET_STAT_REG(v, chan)		QAIF_CODEC_RDDMA_REG_ADDR(v, 0x44, (chan))
+#define QAIF_CODEC_RDDMA_PERIOD_DET_CLR_REG(v, chan)		QAIF_CODEC_RDDMA_REG_ADDR(v, 0x48, (chan))
+#define QAIF_CODEC_RDDMA_FORMAT_ERR_REG(v, chan)			QAIF_CODEC_RDDMA_REG_ADDR(v, 0x4C, (chan))
+#define QAIF_CODEC_RDDMA_AHB_BYPASS_REG(v, chan)			QAIF_CODEC_RDDMA_REG_ADDR(v, 0x50, (chan))
+#define QAIF_CODEC_RDDMA_SHUTDOWN_STAT_REG(v, chan)			QAIF_CODEC_RDDMA_REG_ADDR(v, 0x54, (chan))
+#define QAIF_CODEC_RDDMA_PADDING_CFG_REG(v, chan)			QAIF_CODEC_RDDMA_REG_ADDR(v, 0x58, (chan))
+#define QAIF_CODEC_RDDMA_INTF_CFG_REG(v, chan)				QAIF_CODEC_RDDMA_REG_ADDR(v, 0x5C, (chan))
+#define QAIF_CODEC_RDDMA_STATUS_REG(v, chan)				QAIF_CODEC_RDDMA_REG_ADDR(v, 0x60, (chan))
+#define QAIF_CODEC_RDDMA_DBG_STATUS_REG(v, chan)			QAIF_CODEC_RDDMA_REG_ADDR(v, 0xFF0, (chan))
+#define QAIF_CODEC_RDDMA_INTF_DBG_STATUS_REG(v, chan)		QAIF_CODEC_RDDMA_REG_ADDR(v, 0xFF4, (chan))
+
+/* WRDMA
+ * v : ptr to qaif_variant
+ */
+#define QAIF_WRDMA_REG_ADDR(v, offset, chan) \
+	(v->wrdma_reg_base + (offset) + v->wrdma_stride * (chan))
+#define QAIF_WRDMA_CTL_REG(v, chan)							QAIF_WRDMA_REG_ADDR(v, 0x00, (chan))
+#define QAIF_WRDMA_CFG_REG(v, chan)							QAIF_WRDMA_REG_ADDR(v, 0x04, (chan))
+#define QAIF_WRDMA_BASE_ADDR_REG(v, chan)					QAIF_WRDMA_REG_ADDR(v, 0x08, (chan))
+#define QAIF_WRDMA_BUFF_LEN_REG(v, chan)					QAIF_WRDMA_REG_ADDR(v, 0x10, (chan))
+#define QAIF_WRDMA_CURR_ADDR_REG(v, chan)					QAIF_WRDMA_REG_ADDR(v, 0x14, (chan))
+#define QAIF_WRDMA_PERIOD_LEN_REG(v, chan)					QAIF_WRDMA_REG_ADDR(v, 0x1C, (chan))
+#define QAIF_WRDMA_PERIOD_CNT_REG(v, chan)					QAIF_WRDMA_REG_ADDR(v, 0x20, (chan))
+#define QAIF_WRDMA_SHRAM_WORDCNT_REG(v, chan)				QAIF_WRDMA_REG_ADDR(v, 0x24, (chan))
+#define QAIF_WRDMA_FRAME_STATUS_REG(v, chan)				QAIF_WRDMA_REG_ADDR(v, 0x28, (chan))
+#define QAIF_WRDMA_FRAME_STATUS_EXTN_REG(v, chan)			QAIF_WRDMA_REG_ADDR(v, 0x2C, (chan))
+#define QAIF_WRDMA_FRAME_STATUS_CLR_REG(v, chan)			QAIF_WRDMA_REG_ADDR(v, 0x30, (chan))
+#define QAIF_WRDMA_SET_BUFF_CNT_REG(v, chan)				QAIF_WRDMA_REG_ADDR(v, 0x34, (chan))
+#define QAIF_WRDMA_SET_PERIOD_CNT_REG(v, chan)				QAIF_WRDMA_REG_ADDR(v, 0x38, (chan))
+#define QAIF_WRDMA_STC_LSB_REG(v, chan)						QAIF_WRDMA_REG_ADDR(v, 0x3C, (chan))
+#define QAIF_WRDMA_STC_MSB_REG(v, chan)						QAIF_WRDMA_REG_ADDR(v, 0x40, (chan))
+#define QAIF_WRDMA_PERIOD_DET_STAT_REG(v, chan)				QAIF_WRDMA_REG_ADDR(v, 0x44, (chan))
+#define QAIF_WRDMA_PERIOD_DET_CLR_REG(v, chan)				QAIF_WRDMA_REG_ADDR(v, 0x48, (chan))
+#define QAIF_WRDMA_FORMAT_ERR_REG(v, chan)					QAIF_WRDMA_REG_ADDR(v, 0x4C, (chan))
+#define QAIF_WRDMA_AHB_BYPASS_REG(v, chan)					QAIF_WRDMA_REG_ADDR(v, 0x50, (chan))
+#define QAIF_WRDMA_SHUTDOWN_STAT_REG(v, chan)				QAIF_WRDMA_REG_ADDR(v, 0x54, (chan))
+#define QAIF_WRDMA_DBG_STATUS_REG(v, chan)					QAIF_WRDMA_REG_ADDR(v, 0xFF0, (chan))
+
+#define QAIF_CODEC_WRDMA_REG_ADDR(v, offset, chan) \
+	(v->codec_wrdma_reg_base + (offset) + v->codec_wrdma_stride * (chan))
+#define QAIF_CODEC_WRDMA_CTL_REG(v, chan)					QAIF_CODEC_WRDMA_REG_ADDR(v, 0x00, (chan))
+#define QAIF_CODEC_WRDMA_CFG_REG(v, chan)					QAIF_CODEC_WRDMA_REG_ADDR(v, 0x04, (chan))
+#define QAIF_CODEC_WRDMA_BASE_ADDR_REG(v, chan)				QAIF_CODEC_WRDMA_REG_ADDR(v, 0x08, (chan))
+#define QAIF_CODEC_WRDMA_BUFF_LEN_REG(v, chan)				QAIF_CODEC_WRDMA_REG_ADDR(v, 0x10, (chan))
+#define QAIF_CODEC_WRDMA_CURR_ADDR_REG(v, chan)				QAIF_CODEC_WRDMA_REG_ADDR(v, 0x14, (chan))
+#define QAIF_CODEC_WRDMA_PERIOD_LEN_REG(v, chan)			QAIF_CODEC_WRDMA_REG_ADDR(v, 0x1C, (chan))
+#define QAIF_CODEC_WRDMA_PERIOD_CNT_REG(v, chan)			QAIF_CODEC_WRDMA_REG_ADDR(v, 0x20, (chan))
+#define QAIF_CODEC_WRDMA_SHRAM_WORDCNT_REG(v, chan)			QAIF_CODEC_WRDMA_REG_ADDR(v, 0x24, (chan))
+#define QAIF_CODEC_WRDMA_FRAME_STATUS_REG(v, chan)			QAIF_CODEC_WRDMA_REG_ADDR(v, 0x28, (chan))
+#define QAIF_CODEC_WRDMA_FRAME_STATUS_EXTN_REG(v, chan)		QAIF_CODEC_WRDMA_REG_ADDR(v, 0x2C, (chan))
+#define QAIF_CODEC_WRDMA_FRAME_STATUS_CLR_REG(v, chan)		QAIF_CODEC_WRDMA_REG_ADDR(v, 0x30, (chan))
+#define QAIF_CODEC_WRDMA_SET_BUFF_CNT_REG(v, chan)			QAIF_CODEC_WRDMA_REG_ADDR(v, 0x34, (chan))
+#define QAIF_CODEC_WRDMA_SET_PERIOD_CNT_REG(v, chan)		QAIF_CODEC_WRDMA_REG_ADDR(v, 0x38, (chan))
+#define QAIF_CODEC_WRDMA_STC_LSB_REG(v, chan)				QAIF_CODEC_WRDMA_REG_ADDR(v, 0x3C, (chan))
+#define QAIF_CODEC_WRDMA_STC_MSB_REG(v, chan)				QAIF_CODEC_WRDMA_REG_ADDR(v, 0x40, (chan))
+#define QAIF_CODEC_WRDMA_PERIOD_DET_STAT_REG(v, chan)		QAIF_CODEC_WRDMA_REG_ADDR(v, 0x44, (chan))
+#define QAIF_CODEC_WRDMA_PERIOD_DET_CLR_REG(v, chan)		QAIF_CODEC_WRDMA_REG_ADDR(v, 0x48, (chan))
+#define QAIF_CODEC_WRDMA_FORMAT_ERR_REG(v, chan)			QAIF_CODEC_WRDMA_REG_ADDR(v, 0x4C, (chan))
+#define QAIF_CODEC_WRDMA_AHB_BYPASS_REG(v, chan)			QAIF_CODEC_WRDMA_REG_ADDR(v, 0x50, (chan))
+#define QAIF_CODEC_WRDMA_SHUTDOWN_STAT_REG(v, chan)			QAIF_CODEC_WRDMA_REG_ADDR(v, 0x54, (chan))
+#define QAIF_CODEC_WRDMA_INTF_CFG_REG(v, chan)				QAIF_CODEC_WRDMA_REG_ADDR(v, 0x58, (chan))
+#define QAIF_CODEC_WRDMA_DBG_STATUS_REG(v, chan)			QAIF_CODEC_WRDMA_REG_ADDR(v, 0xFF0, (chan))
+#define QAIF_CODEC_WRDMA_INTF_DBG_STATUS_REG(v, chan)		QAIF_CODEC_WRDMA_REG_ADDR(v, 0xFF4, (chan))
+
+
+#define QAIF_EE_RDDMA_IRQ_REG_ADDR(v, dma_type, offset) \
+	(dma_type == QAIF_AIF_IRQ ? (v->rddma_irq_reg_base + (offset) + v->rddma_irq_stride * (v->ee)) : \
+	(v->codec_rddma_irq_reg_base + (offset) + v->codec_rddma_irq_stride * (v->ee)))
+
+/* RDDMA Period Interrupts */
+#define QAIF_EE_RDDMA_PERIOD_IRQ_EN_REG(v, i)				QAIF_EE_RDDMA_IRQ_REG_ADDR(v, i, 0x00)
+#define QAIF_EE_RDDMA_PERIOD_IRQ_STAT_REG(v, i)				QAIF_EE_RDDMA_IRQ_REG_ADDR(v, i, 0x08)
+#define QAIF_EE_RDDMA_PERIOD_IRQ_RAW_STAT_REG(v, i)			QAIF_EE_RDDMA_IRQ_REG_ADDR(v, i, 0x10)
+#define QAIF_EE_RDDMA_PERIOD_IRQ_CLR_REG(v, i)				QAIF_EE_RDDMA_IRQ_REG_ADDR(v, i, 0x18)
+#define QAIF_EE_RDDMA_PERIOD_IRQ_FORCE_REG(v, i)			QAIF_EE_RDDMA_IRQ_REG_ADDR(v, i, 0x20)
+/* RDDMA Underflow Interrupts */
+#define QAIF_EE_RDDMA_UNDERFLOW_IRQ_EN_REG(v, i)			QAIF_EE_RDDMA_IRQ_REG_ADDR(v, i, 0x28)
+#define QAIF_EE_RDDMA_UNDERFLOW_IRQ_STAT_REG(v, i)			QAIF_EE_RDDMA_IRQ_REG_ADDR(v, i, 0x30)
+#define QAIF_EE_RDDMA_UNDERFLOW_IRQ_RAW_STAT_REG(v, i)		QAIF_EE_RDDMA_IRQ_REG_ADDR(v, i, 0x38)
+#define QAIF_EE_RDDMA_UNDERFLOW_IRQ_CLR_REG(v, i)			QAIF_EE_RDDMA_IRQ_REG_ADDR(v, i, 0x40)
+#define QAIF_EE_RDDMA_UNDERFLOW_IRQ_FORCE_REG(v, i)			QAIF_EE_RDDMA_IRQ_REG_ADDR(v, i, 0x48)
+/* RDDMA Error Response Interrupts */
+#define QAIF_EE_RDDMA_ERR_RSP_IRQ_EN_REG(v, i)				QAIF_EE_RDDMA_IRQ_REG_ADDR(v, i, 0x50)
+#define QAIF_EE_RDDMA_ERR_RSP_IRQ_STAT_REG(v, i)			QAIF_EE_RDDMA_IRQ_REG_ADDR(v, i, 0x58)
+#define QAIF_EE_RDDMA_ERR_RSP_IRQ_RAW_STAT_REG(v, i)		QAIF_EE_RDDMA_IRQ_REG_ADDR(v, i, 0x60)
+#define QAIF_EE_RDDMA_ERR_RSP_IRQ_CLR_REG(v, i)				QAIF_EE_RDDMA_IRQ_REG_ADDR(v, i, 0x68)
+#define QAIF_EE_RDDMA_ERR_RSP_IRQ_FORCE_REG(v, i)			QAIF_EE_RDDMA_IRQ_REG_ADDR(v, i, 0x70)
+
+#define QAIF_EE_WRDMA_IRQ_REG_ADDR(v, dma_type, offset) \
+	(dma_type == QAIF_AIF_IRQ ? (v->wrdma_irq_reg_base + (offset) + v->wrdma_irq_stride * (v->ee)) : \
+	(v->codec_wrdma_irq_reg_base + (offset) + v->codec_wrdma_irq_stride * (v->ee)))
+
+/* WRDMA Period Interrupts */
+#define QAIF_EE_WRDMA_PERIOD_IRQ_EN_REG(v, i)				QAIF_EE_WRDMA_IRQ_REG_ADDR(v, i, 0x00)
+#define QAIF_EE_WRDMA_PERIOD_IRQ_STAT_REG(v, i)				QAIF_EE_WRDMA_IRQ_REG_ADDR(v, i, 0x08)
+#define QAIF_EE_WRDMA_PERIOD_IRQ_RAW_STAT_REG(v, i)			QAIF_EE_WRDMA_IRQ_REG_ADDR(v, i, 0x10)
+#define QAIF_EE_WRDMA_PERIOD_IRQ_CLR_REG(v, i)				QAIF_EE_WRDMA_IRQ_REG_ADDR(v, i, 0x18)
+#define QAIF_EE_WRDMA_PERIOD_IRQ_FORCE_REG(v, i)			QAIF_EE_WRDMA_IRQ_REG_ADDR(v, i, 0x20)
+/* WRDMA Overflow Interrupts */
+#define QAIF_EE_WRDMA_OVERFLOW_IRQ_EN_REG(v, i)				QAIF_EE_WRDMA_IRQ_REG_ADDR(v, i, 0x28)
+#define QAIF_EE_WRDMA_OVERFLOW_IRQ_STAT_REG(v, i)			QAIF_EE_WRDMA_IRQ_REG_ADDR(v, i, 0x30)
+#define QAIF_EE_WRDMA_OVERFLOW_IRQ_RAW_STAT_REG(v, i)		QAIF_EE_WRDMA_IRQ_REG_ADDR(v, i, 0x38)
+#define QAIF_EE_WRDMA_OVERFLOW_IRQ_CLR_REG(v, i)			QAIF_EE_WRDMA_IRQ_REG_ADDR(v, i, 0x40)
+#define QAIF_EE_WRDMA_OVERFLOW_IRQ_FORCE_REG(v, i)			QAIF_EE_WRDMA_IRQ_REG_ADDR(v, i, 0x48)
+/* WRDMA Error Response Interrupts */
+#define QAIF_EE_WRDMA_ERR_RSP_IRQ_EN_REG(v, i)				QAIF_EE_WRDMA_IRQ_REG_ADDR(v, i, 0x50)
+#define QAIF_EE_WRDMA_ERR_RSP_IRQ_STAT_REG(v, i)			QAIF_EE_WRDMA_IRQ_REG_ADDR(v, i, 0x58)
+#define QAIF_EE_WRDMA_ERR_RSP_IRQ_RAW_STAT_REG(v, i)		QAIF_EE_WRDMA_IRQ_REG_ADDR(v, i, 0x60)
+#define QAIF_EE_WRDMA_ERR_RSP_IRQ_CLR_REG(v, i)				QAIF_EE_WRDMA_IRQ_REG_ADDR(v, i, 0x68)
+#define QAIF_EE_WRDMA_ERR_RSP_IRQ_FORCE_REG(v, i)			QAIF_EE_WRDMA_IRQ_REG_ADDR(v, i, 0x70)
+
+
+#define QAIF_DMACFG_REG(v, chan, dir, dai_id) \
+	(is_cif_dma_port(dai_id) ? \
+	__QAIF_CDC_DMA_REG(v, chan, dir, CFG) : \
+	__QAIF_DMA_REG(v, chan, dir, CFG))
+
+#define QAIF_DMACTL_REG(v, chan, dir, dai_id) \
+	(is_cif_dma_port(dai_id) ? \
+	__QAIF_CDC_DMA_REG(v, chan, dir, CTL) : \
+	__QAIF_DMA_REG(v, chan, dir, CTL))
+
+#define QAIF_DMABUFF_REG(v, chan, dir, dai_id) \
+	(is_cif_dma_port(dai_id) ? \
+	__QAIF_CDC_DMA_REG(v, chan, dir, BUFF_LEN) : \
+	__QAIF_DMA_REG(v, chan, dir, BUFF_LEN))
+
+#define QAIF_DMACURR_REG(v, chan, dir, dai_id) \
+	(is_cif_dma_port(dai_id) ? \
+	__QAIF_CDC_DMA_REG(v, chan, dir, CURR_ADDR) : \
+	__QAIF_DMA_REG(v, chan, dir, CURR_ADDR))
+
+#define QAIF_DMAPER_REG(v, chan, dir, dai_id)  \
+	(is_cif_dma_port(dai_id) ? \
+	__QAIF_CDC_DMA_REG(v, chan, dir, PERIOD_CNT) : \
+	__QAIF_DMA_REG(v, chan, dir, PERIOD_CNT))
+
+#define QAIF_DMAPER_LEN_REG(v, chan, dir, dai_id)  \
+	(is_cif_dma_port(dai_id) ? \
+	__QAIF_CDC_DMA_REG(v, chan, dir, PERIOD_LEN) : \
+	__QAIF_DMA_REG(v, chan, dir, PERIOD_LEN))
+
+#define QAIF_DMABASE_REG(v, chan, dir, dai_id) \
+	(is_cif_dma_port(dai_id) ? \
+	__QAIF_CDC_DMA_REG(v, chan, dir, BASE_ADDR) : \
+	__QAIF_DMA_REG(v, chan, dir, BASE_ADDR))
+
+#define __QAIF_CDC_DMA_REG(v, chan, dir, reg) \
+		(((dir) ==  SNDRV_PCM_STREAM_PLAYBACK) ? \
+			__QAIF_CDC_RDDMA_REG(v, chan, reg) : \
+			__QAIF_CDC_WRDMA_REG(v, chan, reg))
+
+#define __QAIF_DMA_REG(v, chan, dir, reg)  \
+	(((dir) ==  SNDRV_PCM_STREAM_PLAYBACK) ? \
+		(QAIF_RDDMA_##reg##_REG(v, chan)) : \
+		QAIF_WRDMA_##reg##_REG(v, chan))
+
+#define __QAIF_CDC_RDDMA_REG(v, chan, reg) \
+			QAIF_CODEC_RDDMA_##reg##_REG(v, chan)
+
+#define __QAIF_CDC_WRDMA_REG(v, chan, reg) \
+			QAIF_CODEC_WRDMA_##reg##_REG(v, chan)
+
+#define QAIF_SID_MAP_REG(dir, dai_id) \
+	(is_cif_dma_port(dai_id) ? \
+	__QAIF_CDC_SID_MAP_REG(dir) : \
+	__QAIF_SID_MAP_REG(dir))
+
+#define __QAIF_SID_MAP_REG(dir)  \
+	(((dir) ==  SNDRV_PCM_STREAM_PLAYBACK) ? \
+		QAIF_RDDMA_SID_MAP_REG : \
+		QAIF_WRDMA_SID_MAP_REG)
+
+#define __QAIF_CDC_SID_MAP_REG(dir)  \
+	(((dir) ==  SNDRV_PCM_STREAM_PLAYBACK) ? \
+		QAIF_CODEC_RDDMA_SID_MAP_REG : \
+		QAIF_CODEC_WRDMA_SID_MAP_REG)
+
+#endif /* __QAIF_REG_H__ */
-- 
2.34.1


