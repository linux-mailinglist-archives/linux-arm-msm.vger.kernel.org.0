Return-Path: <linux-arm-msm+bounces-106753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONFQI2Vy/mmhqwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 01:31:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2B84FCBFC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 01:31:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B752F302BEBC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 23:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33507363C48;
	Fri,  8 May 2026 23:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KLt3faeP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZxSZTC5E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7608D36308D
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 23:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283089; cv=none; b=jFTzTydfarZKEGLFiZ/bmRak0OlY2MgxOvGo6koXujz98MiXJSRLdIGtTCwMjiohqRI8veJu/hG3yjVteRfrqcHuQl5AYQ9saWaB2JcX0uh0imEZCQaHfc7JivG7/pBfnQkoLFZEs7pnMhFaWuOmaYTniNYAqOF0N5V8IhcFsxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283089; c=relaxed/simple;
	bh=DOGsd2u7iW9cMvj4+PDQls+GBNWh6gWdVwXtre2Q3s8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dIrm9ufsJZ+nE6m+1W+8PzWKndtGYqWqvC0/H5fgmtnZSXNvfQXP2Q1lwhRag60kMJvnSGTOLft+76flb/BueiA1PWrzxN0jG/gF9ZIuXnEMN+0NvJBM60GP+8pua1OQMzmetuEeNOsW9JjcSFP8FsHzx5p2T6T+5Hjqn0BT2Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KLt3faeP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZxSZTC5E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648LIdp3317490
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 23:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qj0nAIAK4LBbELZANLlnfukG9vwKdKBxFr9Mk7W/Rt0=; b=KLt3faeP/lLN18pd
	/YXJDoRxk2OzVCKNu40kf3n4u+J5/K2uf1TXIyqQyUDFnG+MpwcEKkPkOtJ/toS0
	WMTgYYS3XQ/7RcEGB6GXOBbK/ukjHZZChnBUILC2lTIuIGwmENtX4eB2gr0BnbJH
	l7YKFqF8Dh8A2Xg77h+Hnak8l7Uvxg+gXMed4vSdd7I+eOl6NhINhczVJNv6qNkI
	IlflYRbjvUapd7OtnTH7aRol1JorJ/iPQPOANNUgLWIl5pqYrloNNs8/egnuuxGR
	0wvosPohCVKdQyD+0yDEo5AUZNMVFPodt0M/jBcSTJ5zaHp5odmr1ANah/e87FHc
	8YDICA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1bc03gn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 23:31:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2f2d983d109so4244166eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 16:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778283086; x=1778887886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qj0nAIAK4LBbELZANLlnfukG9vwKdKBxFr9Mk7W/Rt0=;
        b=ZxSZTC5E9W2yNSHePCL8sQ1j0Di6oVkyx+5LT5jxT9eEcqRc7PlX3uupff03lKof5B
         r4azA9cSCR3dSRvAV4rPqF2BE7sZuqhywN7uPEcHaTfEGAXD5bUBBhZG64ENGfQVloK/
         7GZTg+pyZjz5NCpXTBjbHPZ7d4pMnSLVCJeRlskeJ0Mm1R3X/jZaZ1fXnCbs/fqvc0cZ
         JNmcGdgu2eOmeVjsHMfYODmo/F1L/NIiXiha20PyyGRiKhvEgC4avAnz/PV81UNfVDXO
         LofNvPmBux3HsHE0NKMvRtbvW6symuWt2T9OTQBLn29UGTejEYvXFrhc7GjOGwS1KqNu
         wtpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778283086; x=1778887886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qj0nAIAK4LBbELZANLlnfukG9vwKdKBxFr9Mk7W/Rt0=;
        b=rH/ao2HoYc0HTp891W3u0Q2VhmgasrL8y6N7d47DnJO1uAiHWu+w5LJEvDpEnpj5mF
         vfAGlYi9Uh9PDnNF3uWllmAKgTjdGsqJdr9xRtgQPBZkv9aJqTD0yYNPAkuz02vG0I+H
         0iRzV5QPupcEq3hXbXyX9sd/9uWZpAjAH7VhOZIM69sMwiM+KBQfGF3EqHsILayE8U8E
         ZE2qHXwMpIDcR7UtwZdk+PxRFJCmrhF3RCbYEC7WfRsBL5bF8FB42QskSAb68s+DW1Qx
         S5C+3Q4HXbsi3eTJtXRRa+oSUJ3u0tAPcWakdbIgYjZYMUxDYqEyGCxAZh3ZKtoJdTNV
         JD9w==
X-Gm-Message-State: AOJu0Yy/pSGPT0GfmHmqgfofgyGybFzz8BM0YgOCBzT4YeuFfNizfXv+
	RbdqxeZtC3BEPc5Hr6S9UGTiDjYedXepdKXL6dtWXa6+MUOPCeW0xM5A4oRYQl0BJLPUDZ30ykM
	OLzFDw9HXR5Vu8KYfTY5XrO6CqJJ1dYiEVF0ms5zHJ8UwdmYtYYrem1tisaga2/j+f6R1
X-Gm-Gg: Acq92OEq7+X1rGnub/DV3XfJaBtITLqoJ7hAwGLjtNwS5LW3ADOVNU8u9KXabyHvZfJ
	uiY7uTBdA7iXdpC4SvJguLjrlmZd8+wkL+pcF3PjznGIu9BIWFHK3LLEUK13Eirs47i8ygB17ay
	3LPc5bRLmK5Oa3OQ1RqZYh0kddA0k3kmvI2Lb1Z8EYiC7wPcynt05FNFWXMOVv3E35vTHCZrGK6
	eDxLmnl6bjEEGO3cn5SA6X1etFXuKLQOpI2A2xLVOZevv3jOAy7+kDh6wZvn8DrQHA44sLh2mdZ
	wKxEdVirbzUr8XbCCqHoW/MePn/mdgPwL9HUtGoD/dNAXii3hRmcokieiohcgI0hV5uecZ3XXsl
	E921seqSqEmZKhNWzrgleXApLOnn1XcnRVl9K5lITGRupPstWMaGymRmrqNk=
X-Received: by 2002:a05:7300:b10b:b0:2d8:97d6:6ac8 with SMTP id 5a478bee46e88-2f85d94b2ccmr2176670eec.21.1778283086100;
        Fri, 08 May 2026 16:31:26 -0700 (PDT)
X-Received: by 2002:a05:7300:b10b:b0:2d8:97d6:6ac8 with SMTP id 5a478bee46e88-2f85d94b2ccmr2176653eec.21.1778283085572;
        Fri, 08 May 2026 16:31:25 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885b87dsm5033122eec.21.2026.05.08.16.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 16:31:25 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Fri, 08 May 2026 23:31:18 +0000
Subject: [PATCH 03/10] phy: qcom-qmp: qserdes-txrx: Add v10 register
 offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hawi-phy-pcie-v1-3-237b894353fc@oss.qualcomm.com>
References: <20260508-hawi-phy-pcie-v1-0-237b894353fc@oss.qualcomm.com>
In-Reply-To: <20260508-hawi-phy-pcie-v1-0-237b894353fc@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778283082; l=3118;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=DOGsd2u7iW9cMvj4+PDQls+GBNWh6gWdVwXtre2Q3s8=;
 b=M1NyJKqphIbPzN87ChMeDEtvOTQSa6ZIZzdv/CNOEy7e57CCQ2Lrmmn85iAua2MC3d1PwM7b/
 7b2XupfrAtPBX3Kh1MMkpTDtgeQjcqgXlxpxrNtHsG8d1RKmpC/bVUQ
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIzMiBTYWx0ZWRfX9EcblJyg71RI
 K3nAzRtupsJmJkZHD6hnEEssmBIPNiQYQOAyNX/93EP2a55O4M7+RVWS6nHexXGYX5YdtLvgUL9
 bZJaHF2rAoE+3cdImeFUspJIf62/7IEcQb9vc2QZe1IJn/vYDFBD3Fd+ZKCNymh/812HxdRoN2+
 B20Oa6pnEyEDskxPMfppiWXF0gpQClplWHXFUv6KV1R2z5PmYaX2PU4Hw6q8E41QpvwwMM9R88q
 pzjAalRsTBV520k5/1QFbh4VNaupv3Wo1c0vAAoXW7ZCxon2GiH/kJ3S2/g3c/QzQwpw5xv1OJV
 TUVF13A4AXOqdIHG4Pob6V7X+DUn6A3N9/jsia/ImsL5E55ct3PfIHKq51i61xPS8qUf6d7czQT
 fMTYeELMQtzHaI145mRRYXZh2KP8s4uo+iv6ak1RtRaSNobIosVHehA/zXmyJgRreVIndN6t7l1
 BuC25ckPhZ6srEa8sKw==
X-Proofpoint-GUID: fQAz2h-DiUKUJVU8K3kRUqn-RUTnnbzi
X-Authority-Analysis: v=2.4 cv=JJQLdcKb c=1 sm=1 tr=0 ts=69fe724e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=A1tEKnX2-cfyyskZ8tQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: fQAz2h-DiUKUJVU8K3kRUqn-RUTnnbzi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080232
X-Rspamd-Queue-Id: 2D2B84FCBFC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106753-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hawi SoC bumps the HW version of QMP phy to v10 for USB and PCIe. Add
the new qserdes TX RX offsets in a dedicated header file.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h   | 47 ++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  1 +
 2 files changed, 48 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h
new file mode 100644
index 000000000000..d81ebdde0063
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_TXRX_V10_H_
+#define QCOM_PHY_QMP_QSERDES_TXRX_V10_H_
+
+#define QSERDES_V10_TX_RES_CODE_LANE_OFFSET_TX			0x03c
+#define QSERDES_V10_TX_RES_CODE_LANE_OFFSET_RX			0x040
+#define QSERDES_V10_TX_LANE_MODE_1				0x084
+#define QSERDES_V10_TX_LANE_MODE_3				0x08c
+#define QSERDES_V10_TX_LANE_MODE_4				0x090
+#define QSERDES_V10_TX_LANE_MODE_5				0x094
+#define QSERDES_V10_TX_PI_QEC_CTRL				0x0e4
+
+#define QSERDES_V10_RX_UCDR_FO_GAIN				0x008
+#define QSERDES_V10_RX_UCDR_SO_GAIN				0x014
+#define QSERDES_V10_RX_UCDR_SB2_THRESH1				0x04c
+#define QSERDES_V10_RX_UCDR_SB2_THRESH2				0x050
+#define QSERDES_V10_RX_TX_ADAPT_PRE_THRESH1			0x0c4
+#define QSERDES_V10_RX_TX_ADAPT_PRE_THRESH2			0x0c8
+#define QSERDES_V10_RX_TX_ADAPT_POST_THRESH			0x0cc
+#define QSERDES_V10_RX_VGA_CAL_CNTRL2				0x0d8
+#define QSERDES_V10_RX_GM_CAL					0x0dc
+#define QSERDES_V10_RX_RX_IDAC_TSETTLE_LOW			0x0f8
+#define QSERDES_V10_RX_SIGDET_ENABLES				0x118
+#define QSERDES_V10_RX_SIGDET_CNTRL				0x11c
+#define QSERDES_V10_RX_RX_MODE_00_LOW				0x15c
+#define QSERDES_V10_RX_RX_MODE_00_HIGH				0x160
+#define QSERDES_V10_RX_RX_MODE_00_HIGH2				0x164
+#define QSERDES_V10_RX_RX_MODE_00_HIGH3				0x168
+#define QSERDES_V10_RX_RX_MODE_00_HIGH4				0x16c
+#define QSERDES_V10_RX_RX_MODE_01_LOW				0x170
+#define QSERDES_V10_RX_RX_MODE_01_HIGH				0x174
+#define QSERDES_V10_RX_RX_MODE_01_HIGH2				0x178
+#define QSERDES_V10_RX_RX_MODE_01_HIGH3				0x17c
+#define QSERDES_V10_RX_RX_MODE_01_HIGH4				0x180
+#define QSERDES_V10_RX_RX_MODE_10_LOW				0x184
+#define QSERDES_V10_RX_RX_MODE_10_HIGH				0x188
+#define QSERDES_V10_RX_RX_MODE_10_HIGH2				0x18c
+#define QSERDES_V10_RX_RX_MODE_10_HIGH3				0x190
+#define QSERDES_V10_RX_RX_MODE_10_HIGH4				0x194
+#define QSERDES_V10_RX_DFE_CTLE_POST_CAL_OFFSET			0x1a4
+#define QSERDES_V10_RX_SIGDET_CAL_TRIM				0x1f8
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 3ac5af7cde6a..76ac72410d31 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -40,6 +40,7 @@
 #include "phy-qcom-qmp-qserdes-lalb-v8.h"
 
 #include "phy-qcom-qmp-qserdes-com-v10.h"
+#include "phy-qcom-qmp-qserdes-txrx-v10.h"
 
 #include "phy-qcom-qmp-qserdes-pll.h"
 

-- 
2.34.1


