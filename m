Return-Path: <linux-arm-msm+bounces-111368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id axUbJhWnImolbgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:38:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A74647672
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:38:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cTIan2iI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111368-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111368-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7D8363026E71
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 10:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5621744CF4A;
	Fri,  5 Jun 2026 10:37:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B2A3FAE0D;
	Fri,  5 Jun 2026 10:37:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780655875; cv=none; b=L+mdr+C8sEUMr6D9lEeLR81hCSVmGsqEB1k+JICF4i4dg3085V4cWMeAiF0GSu5TAEh7TrnN30x24DNnbCFw1lMhrGLTLSbQk+7YWj9ocJrRy2o8b3b0z3FTARpxcf73EUNg2dU/Ghohs622E/rHaNi95XaBL3WPsBELNW10n0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780655875; c=relaxed/simple;
	bh=xLBsme/Ea4oMRLJLKcTPHkyOiT08PdUw9WlQvI5WHhM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BOjA4Nv5AfBab0mUmexcggOnAw/ZxSslEEvtdjZ/4cMeb6iccG+SNEeB30K66pBOBqcmYgu8rKhBoVMZ6bIbAI3zjuhlFD3Nezj4ndGwVBfkzHSZXwBtxljDnb3p6sm2wTmVexWk8fW4mHatnDDYcwB9kCGc1pBopH8zPOaHkeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cTIan2iI; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6559mDT93016242;
	Fri, 5 Jun 2026 10:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RIVwUJVZcPN
	1G/p+YHx/6pmQFMGEdXIrdWEcjNOBQ80=; b=cTIan2iIOFx++eZLrgoOig0Keje
	nM8XLKcJNOEHGOviuHdR1iWVGPwisngKnfIVp4QuYqkIHuZNYch128TTI+0dZgtj
	GdOMJno58efduA3bmFYBw8WHfU1YICuKk3mjlaejRuFS6H8TBlbu02RRUMe2JPDh
	PABW29wCx1mCjH/WowGQTVqv2KgqKRdseUgroizr5MaD5gY6aC5Q3Z6k1R8GQTBz
	o3+2th7xsyjvQCSjqsXNRfcrXWLDFcJeklKwjOhM5I/TM8vMKzqMUztN8iYQtMuQ
	TjWjJB2JzFNTkwnoyrlu9pk5Hdr8f13tIYc9zEO+AbRUrKGmIdA2VoFnGwA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekv56g6hd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jun 2026 10:37:50 +0000 (GMT)
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 655Abk6m011714;
	Fri, 5 Jun 2026 10:37:47 GMT
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/13] dt-bindings: sound: Add Qualcomm QAIF DAI ID header
Date: Fri,  5 Jun 2026 16:07:27 +0530
Message-Id: <20260605103739.3557573-2-harendra.gautam@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDEwMyBTYWx0ZWRfX4EhBkmCBtwGC
 eBCNppk5nn/JzpSIo58Saw7jRw1uDwcHDSwGg0gG0uhIp6GOyuBHEPGRlBaB7KGNcH+24BVzRBL
 xjkc4WkmOM4Wct3e8D8igGI4tLB1UL13Dxi7FOPLfSaEf1jGzqXbAtMb7AmHMsxq3Wu9H2nzAXF
 sRhs1UAzv+Xv96Oj26OdKmVOVt6dSplgUk23VnGv5OkEXie5Jal2g36ZspEyCoMf11MMMtjf1HD
 nf+M8dz7NpjT/CY/WsvV4ybfmTILJ2yeGXoyL04TUBF+scKOpG1LKMHsA1iZr0xjoNbOpYVDCOo
 DktKNvZuy9thtXGUb8JT+jWwwUYKbqB3SVkzBn6/BCtZAAzJeWedFXmVDXZd/JX/N1qAdYIk47j
 1Spo5NeDi7zBvMB+dzntJWHbvCuw9asnUvkAZLZfmz9w5sbvm9WIVkRmoVAac+FJKf95qQr29rJ
 7N0EmCPdJM9MXwBlbTA==
X-Authority-Analysis: v=2.4 cv=eJsjSnp1 c=1 sm=1 tr=0 ts=6a22a6ff cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=OsoMfA4h_Qp2qOXqBcMA:9
X-Proofpoint-ORIG-GUID: 5uD3dJG6nEtM2gNOaVexCrQf6vSFebWb
X-Proofpoint-GUID: 5uD3dJG6nEtM2gNOaVexCrQf6vSFebWb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1011 spamscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606050103
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111368-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39A74647672

Add a dt-bindings header for the Qualcomm Audio Interface (QAIF) controller
DAI IDs. This provides shared constants for devicetree sound-dai references
and QAIF aif-interface reg values instead of using raw numeric IDs.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 include/dt-bindings/sound/qcom,qaif.h | 92 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 include/dt-bindings/sound/qcom,qaif.h

diff --git a/include/dt-bindings/sound/qcom,qaif.h b/include/dt-bindings/sound/qcom,qaif.h
new file mode 100644
index 000000000000..72030838c26b
--- /dev/null
+++ b/include/dt-bindings/sound/qcom,qaif.h
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * DAI IDs for the Qualcomm Audio Interface (QAIF) controller.
+ * These values are used in devicetree sound-dai references and as
+ * the reg value of aif-interface child nodes.
+ */
+#ifndef __DT_QCOM_QAIF_H
+#define __DT_QCOM_QAIF_H
+
+/* qcom,qaif-aif-sync-mode values */
+#define QAIF_AIF_SYNC_MODE_SHORT	0	/* Short (pulse) sync */
+#define QAIF_AIF_SYNC_MODE_LONG		1	/* Long (level) sync */
+
+/* qcom,qaif-aif-sync-src values */
+#define QAIF_AIF_SYNC_SRC_SLAVE		0	/* Sync slave -- clock from external */
+#define QAIF_AIF_SYNC_SRC_MASTER	1	/* Sync master -- drive clock/frame */
+
+/* qcom,qaif-aif-lane-config enable values */
+#define QAIF_AIF_LANE_DISABLE		0
+#define QAIF_AIF_LANE_ENABLE		1
+
+/* qcom,qaif-aif-lane-config direction values */
+#define QAIF_AIF_LANE_DIR_TX		0	/* TX (playback, speaker) */
+#define QAIF_AIF_LANE_DIR_RX		1	/* RX (capture, mic) */
+
+/*
+ * AIF (Unified Audio Interface) DAI IDs -- AIF0 through AIF12.
+ * Each AIF supports PCM, TDM and MI2S serial protocols over up to
+ * 8 independent data lanes sharing a single bit clock and frame sync.
+ */
+#define QAIF_MI2S_TDM_AIF0	0
+#define QAIF_MI2S_TDM_AIF1	1
+#define QAIF_MI2S_TDM_AIF2	2
+#define QAIF_MI2S_TDM_AIF3	3
+#define QAIF_MI2S_TDM_AIF4	4
+#define QAIF_MI2S_TDM_AIF5	5
+#define QAIF_MI2S_TDM_AIF6	6
+#define QAIF_MI2S_TDM_AIF7	7
+#define QAIF_MI2S_TDM_AIF8	8
+#define QAIF_MI2S_TDM_AIF9	9
+#define QAIF_MI2S_TDM_AIF10	10
+#define QAIF_MI2S_TDM_AIF11	11
+#define QAIF_MI2S_TDM_AIF12	12
+
+/*
+ * CIF (Codec Interface) RX DAI IDs -- playback to internal codec.
+ * RDDMA channels fetch audio from memory and drain it to the codec.
+ */
+#define QAIF_CDC_DMA_RX0	13
+#define QAIF_CDC_DMA_RX1	14
+#define QAIF_CDC_DMA_RX2	15
+#define QAIF_CDC_DMA_RX3	16
+#define QAIF_CDC_DMA_RX4	17
+#define QAIF_CDC_DMA_RX5	18
+#define QAIF_CDC_DMA_RX6	19
+#define QAIF_CDC_DMA_RX7	20
+#define QAIF_CDC_DMA_RX8	21
+#define QAIF_CDC_DMA_RX9	22
+
+/*
+ * CIF (Codec Interface) TX DAI IDs -- capture from internal codec.
+ * WRDMA channels collect audio from the codec and write it to memory.
+ */
+#define QAIF_CDC_DMA_TX0	23
+#define QAIF_CDC_DMA_TX1	24
+#define QAIF_CDC_DMA_TX2	25
+#define QAIF_CDC_DMA_TX3	26
+#define QAIF_CDC_DMA_TX4	27
+#define QAIF_CDC_DMA_TX5	28
+#define QAIF_CDC_DMA_TX6	29
+#define QAIF_CDC_DMA_TX7	30
+#define QAIF_CDC_DMA_TX8	31
+#define QAIF_CDC_DMA_TX9	32
+
+/*
+ * CIF (Codec Interface) VA TX DAI IDs -- capture from voice activity codec.
+ * WRDMA channels collect audio from the VA codec and write it to memory.
+ */
+#define QAIF_CDC_DMA_VA_TX0	33
+#define QAIF_CDC_DMA_VA_TX1	34
+#define QAIF_CDC_DMA_VA_TX2	35
+#define QAIF_CDC_DMA_VA_TX3	36
+#define QAIF_CDC_DMA_VA_TX4	37
+#define QAIF_CDC_DMA_VA_TX5	38
+#define QAIF_CDC_DMA_VA_TX6	39
+#define QAIF_CDC_DMA_VA_TX7	40
+#define QAIF_CDC_DMA_VA_TX8	41
+#define QAIF_CDC_DMA_VA_TX9	42
+
+#endif /* __DT_QCOM_QAIF_H */
--
2.34.1

