Return-Path: <linux-arm-msm+bounces-106754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKqlM39y/mmhqwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 01:32:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D694FCC28
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 01:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F070830416C3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 23:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F2FF364931;
	Fri,  8 May 2026 23:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ROPJ/LjC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ePFF6o6H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6623D7261C
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 23:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283090; cv=none; b=axodBxKB12HO+UHUkjV0bTNMbET61yVcHSA4lJP5mdFtStpoy6Gwdfei4RXn3VCU04iaLmoiq4PyMQLbm332/s0aizGXgbZN9dFlOEL1T146J8x7iVJTUusid7OSvzlbbQenjRPMKT0On7d1I6PSOA1HZydFjqglF1pHUjdZ0DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283090; c=relaxed/simple;
	bh=cIrdj8/8qr+RDIhnZn+O7Cu+D6iGtXuFpw2ZdlFjXfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c8c2aiTlv3XgN/avjD7NweZlj6VFC7RCYlfoPul6n4O/HcKAgoTnfFa+HsoBr8g57hAAm1px6WdRmK5pkdPfkmvGRgfogOyZRrbYTWfmrCV2/ZzKk1OTJvPG22jFdS3WnPUWDYq9Gk/o1pcxOI++q/Nsw91krlbhHeGRG3+3db0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ROPJ/LjC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ePFF6o6H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648G4uBc1116670
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 23:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5szkIkAg1aH60/0f1WIg1hk6vms8CLlPDs5chmgmuhs=; b=ROPJ/LjCIc1DR3eZ
	v1WNL9kdHP5iNDEDcHBm1qIGwEe19cdwPtdEgvleGl2iK+fLIPPuvq/ZysX+hIct
	7o/7ux6OXmfEvIzg/9Xlpd2xkHAKpmHYIQPeUQPHsCRzNYEyphET4Ly+lmuKuHi4
	t4j0ieGhHjnpN2wKx7JEB+x+uh1y/3p72ukGSkNlQQAFEUn+uH0H6ChxTxBnA6c6
	yOU5N5ORLiCJpvtLVB6MGkRNhVXkvrVZkaKG762zMqvNIyVU40XDwFRFsm5T0L5B
	XVGyZtnPFZ5YqK4PME+w56TFQ+xY3OQ0nh1k6MkVkmdmuh8yApinxKHIx5+OU2qP
	IaiguA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1k1ph9av-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 23:31:27 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ee1da7a13fso3567949eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 16:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778283087; x=1778887887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5szkIkAg1aH60/0f1WIg1hk6vms8CLlPDs5chmgmuhs=;
        b=ePFF6o6HO6pz0QsKRmJtCDEdDH2PwGvY3YgtcA7xsp2B0wJd0Tpo5+cKxQobSi8zLc
         6uDb/d/eowZjL2OBT5qH1XnXgI3SBT2oY4BKqLWkVnJC0h1F+0MWP8rk7CoN/bcTmXZv
         ArX9QpZ0CyD4X34AxxXoew4p9ZxR1Xy7jla+nTZk0FXASSIANQf45xMdqjF3P26VEBgd
         mbMYeJJ+iafD31B6cPzITjYvnIdpb6HMDzMcwx+nKCaxnEACjFVpoYVioOyomMv5D1DI
         /XItinPKu4u6ZmTzn3/71vhrdpbxQJnnN6ghG4WIhnF5AcgMxiBfo63GlQTQjA6ELgmT
         hfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778283087; x=1778887887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5szkIkAg1aH60/0f1WIg1hk6vms8CLlPDs5chmgmuhs=;
        b=kvp8Fp5vZTlvbAasBGYApIVb1pAkXrRyNVzjAmGkaKZpIh1X7tfpz7rA453bV0O+Hx
         cm4TJEaUbUnVN2z0XHky83GzkyuRqj/iyc5hzLbyiNydpG6FR6DkvoakZA6prLuBzkAa
         moqrUcMNWUK8hi/diBnEV1bQue+8ujBphpd+R/kPQA9lWo3kW8uKJdLc+GfPcIKI+mmO
         xW6RaaNbQvwvhprl88X52mThha01Zq98HVlc6DqPaPlfBtEtTRXKA8fH4kRa2b8dXdYP
         qZ/pwqW/2/WhtYBZGceSgG0adepeRh9icb7jn8F1psbXcQm4TMWBJELcEK93Fu6xO+p2
         t15w==
X-Gm-Message-State: AOJu0YxIxHtxHXBvBBxccd7CZs7TaylYEY8CAlsRkBLm3P2pcP7aqwzU
	g62HuUWS2BwHeZZhi25VnmDAivyyxpxkXnokifCAFncIfdbFMhSOuX/7IGRM725ss4M6tUAOtj1
	IymMKGYBu7uwCmharJtFB7kXEllNtXOgb9/D49yloL4pvFP/YNs/n0kDmaBsAjIcURlqN
X-Gm-Gg: Acq92OHfBoX1/zFudcZCGkuAdTmwg+W+dRhDV/63x6ewmLfy/l56lN2CjTxXoDkcmrI
	SSC5dAFCuY5gnOyw6A4qKozrNK+fHQjJj1ayRYYVyYahp1xKFDEB8UKY/CgT4WM+N1jJVFL2+BC
	+ESXvGnTX1BZZCrdJS4cgVxPvZ0mM3SxZuxuncXFDi/ldo9gDSlyvcrGUcyl68DulbRWYrjtp/F
	m/DavEMQi+fN9EComobbrK7xEjDge1hK2nnmO0C6Af0N/v4okKUIYwu3nCVyO786NJVdnEtg7CL
	j6fYGfICrgoJUwVBjdZ8ylCxZEXbToe+sd56Sz/00M040+bBHUkowaqDjIY1Nrb3qHzfgbUYSb+
	+HRh4nUFEz+KIMWJ9vHdP7zxjslG2R4/hBpM+yAC5FsFGpvuWk85Pyyr3f38=
X-Received: by 2002:a05:7300:a984:b0:2d8:df01:d9f6 with SMTP id 5a478bee46e88-2f55034e59emr6633381eec.23.1778283086840;
        Fri, 08 May 2026 16:31:26 -0700 (PDT)
X-Received: by 2002:a05:7300:a984:b0:2d8:df01:d9f6 with SMTP id 5a478bee46e88-2f55034e59emr6633361eec.23.1778283086298;
        Fri, 08 May 2026 16:31:26 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885b87dsm5033122eec.21.2026.05.08.16.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 16:31:25 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Fri, 08 May 2026 23:31:19 +0000
Subject: [PATCH 04/10] phy: qcom-qmp: pcs: Add v10 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hawi-phy-pcie-v1-4-237b894353fc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778283082; l=1794;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=cIrdj8/8qr+RDIhnZn+O7Cu+D6iGtXuFpw2ZdlFjXfY=;
 b=DZrp6nGndGGIUXZ2z75/ZcS2WjopRR3r0Xsvb3cmS+jabNrLAgCtaAcPUoKLvM8PWYZ55UtWB
 yB2Kp5XKO8sBIaBPBHWVWreIFMhtj3iU6kJtEvXIcuMNmDCFXGW6/Hp
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-GUID: 5hRW4ecFqQTt5XV3W9wifz7klfY1Gb-E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIzMiBTYWx0ZWRfX3NkjjsKSwjQE
 20V9+TFWsnapvmCQcFTPKjlqtPj+eZZsjlce3ppo5SRS8sa+lTT6vLumYDq1fbxgR/OVD2BH/KV
 9TDIESI8RA8Nb6g36qnULHHymM5mtX94ZbcgDhKn0bYeyhopCMA+h8IEq88cdWOqLpHID48/YDm
 HJtjWZU3yNUQkkwc5grurAB/P+fPUh32ZrpbCAk2nqlEugGNZ+uJjPGQm2bk94t5vIMhc8AN0wm
 wcqztR6vD109Jc9WwdOlArJrpNhlJRZrHPucsbiObv/Xr0OWInwGL7s7nvvsk8DA0x7UMExKimo
 MstHf0LLNjLvs/i83iHa21WoK9PfQEYDJrCOmivMzaRC/FgWyY8Ii7qDr8dRMzmTqQqxb/qHc4q
 X4NQ7w+zwKq0GJruWWCS+gLYNeTFfZ9MbMJNo1VGxcIfWxvBQ5a7Q0cvV8l9M1VFj3hL/u7mnBe
 b8NxVKXpmJGJ/iV9+Kw==
X-Authority-Analysis: v=2.4 cv=COwamxrD c=1 sm=1 tr=0 ts=69fe724f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=TapfYG-AjLmxlko4O74A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 5hRW4ecFqQTt5XV3W9wifz7klfY1Gb-E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080232
X-Rspamd-Queue-Id: 67D694FCC28
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106754-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hawi SoC bumps up the HW version of QMP phy to v10 for PCIe Gen3 x2.
Add the new PCS offsets in a dedicated header file.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h | 22 ++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h         |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h
new file mode 100644
index 000000000000..6faca6d8736a
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_V10_H_
+#define QCOM_PHY_QMP_PCS_V10_H_
+
+/* Only for QMP V10 PHY - USB/PCIe PCS registers */
+#define QPHY_V10_PCS_SW_RESET				0x000
+#define QPHY_V10_PCS_PCS_STATUS1			0x014
+#define QPHY_V10_PCS_POWER_DOWN_CONTROL			0x040
+#define QPHY_V10_PCS_START_CONTROL			0x044
+#define QPHY_V10_PCS_REFGEN_REQ_CONFIG1			0x0dc
+#define QPHY_V10_PCS_G12S1_TXDEEMPH_M6DB		0x168
+#define QPHY_V10_PCS_G3S2_PRE_GAIN			0x170
+#define QPHY_V10_PCS_RX_SIGDET_LVL			0x188
+#define QPHY_V10_PCS_RATE_SLEW_CNTRL1			0x198
+#define QPHY_V10_PCS_PCS_TX_RX_CONFIG			0x1d0
+#define QPHY_V10_PCS_EQ_CONFIG2				0x1e4
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 76ac72410d31..7af77572970e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -68,6 +68,8 @@
 
 #include "phy-qcom-qmp-pcs-v8_50.h"
 
+#include "phy-qcom-qmp-pcs-v10.h"
+
 /* QPHY_SW_RESET bit */
 #define SW_RESET				BIT(0)
 /* QPHY_POWER_DOWN_CONTROL */

-- 
2.34.1


