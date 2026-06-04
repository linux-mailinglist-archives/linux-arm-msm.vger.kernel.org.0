Return-Path: <linux-arm-msm+bounces-111093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ySqWFmTWIGpp8QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 03:35:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A7E63C38D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 03:35:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SnNdOSZe;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ehWtcJ4g;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111093-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111093-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6926830701FF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 01:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19AA51A23A4;
	Thu,  4 Jun 2026 01:33:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345051F30A9
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 01:33:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780536815; cv=none; b=gLDbjAcZ23dSYZZeaHYRlHDYhnhH8dwPRDXlPlxENwlyk7r+La4b7sr7LMlerkXXgJrmIlZ7jxfLQh6BiWjBtFgTKwnSV8A5AeIh++dG+z3bljliIs5cUSmoMCJcfcuA29rq6oAbgXaiD7SqQwWmfFtpoOBaGyrclAPtBhKkATM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780536815; c=relaxed/simple;
	bh=cIrdj8/8qr+RDIhnZn+O7Cu+D6iGtXuFpw2ZdlFjXfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pdkPi/y/sUV6bTyUhW1a22vhggXdglLFFNTfGItOIA6tZcLHkhiePPdIv8BcAjtf1jM9qoADH8GkrsdGpfLrEDJol5OtAvHOOUGMpi8T0mS+jp6HYZykrtlt5qgRdJbfh+xRe8AMhLBtekgfFiZFBNDQzrkjVD9LYan1mp1yhMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SnNdOSZe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ehWtcJ4g; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653HwBAo3234986
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 01:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5szkIkAg1aH60/0f1WIg1hk6vms8CLlPDs5chmgmuhs=; b=SnNdOSZeKhssPxQC
	QMtHA/xZnx8Si1YycqNUHJQts9sxukl2UWWywAvRHztMmxYkews3X85S11pnaI1A
	W2qQN0lGk7tLQxpjorS9Pa+MBJetPzrW/ILCcyz9it+ik2RODqE/TJ+wPSa8WbWB
	gtARacqercKZ+aaJcOGsHZRMadi9zuridx4DaDwIWIv+HSKczYANnagKSoOMjtCM
	NgSjx5XH5j80nwEwMLzF5VybESt6VGAzSAz6hZB6coEQ8Gtd/Xx26KFf9vvidejO
	E+bOQx/brVbiIVL8egRqRtPMlJIP3SVj1LqtrvBG3igUIlVnyroA42SJfKCtneT1
	jHXHyg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs4s1ffd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 01:33:31 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-137f81004cbso724934c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 18:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780536810; x=1781141610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5szkIkAg1aH60/0f1WIg1hk6vms8CLlPDs5chmgmuhs=;
        b=ehWtcJ4gTJ/5qDcpHRodQBJEYg2jMZuCeHusHKMokIUpKLcfTQoFhX62ZY6bhXKOza
         4OZUIY8A0tssxgj7V/boyiVS0T7FrkPCF+PAx8zGI3FRL8xTNsjUN03rxHw6anVfeBvV
         Kq52MaasLSUm4em5UhP2lPQkLDLF57YpZ4d8KZ9ggDXL6AZPJrTBN2G+B1EoXbEszZxo
         MGxI2p8yB4heIedsrHZSWYfxb291SYeNYGNDwYDLY0PQbX3VLqvR6PHmO4hiLdKjZLrW
         D70cJnUKc0hS/Me73HEtc9Z71T8UStsaB3NantuK+mbDdtWdSl4KgaxHPxqUGdeW0B1X
         KQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780536810; x=1781141610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5szkIkAg1aH60/0f1WIg1hk6vms8CLlPDs5chmgmuhs=;
        b=IrnQRyDnnMZgI5zjAoxUvNFNOwxb5YsQZOqVQakGdOgF05IAW1pSAIg63dLEpS4R+y
         KArT3nYRa2b2WYjYA3FWE2EABzObdcs8wKVKozEJQUubnJYLQlIVLO8Bo/V+CxLgDduT
         P/vKuPZV/w83Iewal9x0At/mQNzNHVAlFjgfkm5/lHPN7nR5QhgHT0gxvDStM6OSs8OO
         TKcB1h4KS6kFEQ9E8A/jSuY0r8+qIP4hQCe6IZC9tUk0nSReu0lqGg0nXM6aP1gSQm/n
         dpXPDGvuZhWnK7EVADhVe0RgztvVCQTCgRiDvX7vrlfqx7VTyh5p6nzI0yoAjHBuErEQ
         s8DA==
X-Gm-Message-State: AOJu0YzLaf9O21TLSrIsU3ygHr2kruaNDoEWxZSUrAItuoYisQNd7saA
	QH8P37H1lOQj4ON7ey3L1gzrMz+lcRS+ypxrY0LsxMDanFNF9cEhDhi3lrjrfuhg05FtAWPyWEq
	U651wX+mNz8FTKurGW36XjU20VGAHPE/6cJ4T2IrSd76O80sAUqZiBxkl4VRQrkI/0IB/
X-Gm-Gg: Acq92OEwUeR6qL9W9bcn/EOReyt+FhxbYzdtc7f/haMZUipntbgFci/tn5fShyGPqG1
	HFAEMFzW4EEGwRIJyhX7l2KuYanx+VvRKMWDGO9QU0+KfsgMx+M5sRysXGvRUwxbXu6ZrbpC0i1
	muufhopcoGkDqaYvB8E7QdIhEtRTpCH40C7Y5m7DdoBAC+JEhJJ0RE8BDw+UTy7SK1mMmiiLAk5
	xV+S/kJYoCwm5vfufNeGrqKPvbHAdgyCPzmWWqKK0LEoT2gXm9z7jlG4YQ+29rq+2J5AmzrqAnb
	1W+V7mLb+FszhmOZgBko2d4YMNEFRVB5i/XEhgazj6JyI8KwX5pXPr8gSHFSKzLFk5E89ba7FX4
	kh0VbnWZPQZxd88MnG7IG+oGUyrLW/70CFBMcaqZkvg70gHBfsLGqyT9QEf//IFB14Wlu5Q==
X-Received: by 2002:a05:7022:e15:b0:137:f5dd:84a4 with SMTP id a92af1059eb24-137f6bf51d0mr2802492c88.41.1780536810206;
        Wed, 03 Jun 2026 18:33:30 -0700 (PDT)
X-Received: by 2002:a05:7022:e15:b0:137:f5dd:84a4 with SMTP id a92af1059eb24-137f6bf51d0mr2802466c88.41.1780536809695;
        Wed, 03 Jun 2026 18:33:29 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f553ab33sm2870659c88.10.2026.06.03.18.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 18:33:28 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 01:32:58 +0000
Subject: [PATCH v2 04/10] phy: qcom-qmp: pcs: Add v10 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-hawi-phy-pcie-v2-4-be908d3560db@oss.qualcomm.com>
References: <20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com>
In-Reply-To: <20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780536795; l=1794;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=cIrdj8/8qr+RDIhnZn+O7Cu+D6iGtXuFpw2ZdlFjXfY=;
 b=c6mBXCFpB6UsMq03JTTOU5Ckldp+W9UICY4nsLzcYP1H1ervM9SbUDwq8/pltZxG6OW6CT+9w
 SHHiFgKUtWrCFIRuLbLmY9uNsfsrzrdrE9G+/NQaM4UcjhMfkew5l/6
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-ORIG-GUID: z3ucjgK-xtFcaIHSVcdSgjcqUV--Rw1F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAxMiBTYWx0ZWRfX1XB8zjr2NQLP
 r9YFcRARbfo/Si9ubJcoQxOgRUWaq3IYJoRLgZRAPMNJCQtLJNG8NUVyG+eC3akjbwN7Ys0bxpm
 6Iydmavnqa5woTzT92KqO9eE/iGFtvfJI1L0gd6hI0O+My5oCbfjHTEYK7OmmD1dYpKp6Dbi63n
 9HNER+/wU0cG3heegIqOO1kiK72xNFXX3zhqKz/+taEiqRO7NVcNuAI6jIcCy03QfEx6LNGrc+3
 pgaDzyPYahsW6lvj4gfTpNCVPCgEun4VT+pNVe4IDllfBq0poz9AVrSpGJPXUWvqCsroO53RbdL
 Kd22hKl3AzkXlaGhALjbU48r/Rg2NeQOmSF8h3L9r1WDmsELILQs2XWl1WtHY6LG8Cw6r2tSCZs
 3juH2Jup2p5Ndr0Br4dBRvEVVPfzlkbKmqno5gbODljAVOGutJWFP4Ff/JrTt1Rl/f4KzJlWnzN
 QpMKCmAslIl0t3Fum5w==
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a20d5eb cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=TapfYG-AjLmxlko4O74A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: z3ucjgK-xtFcaIHSVcdSgjcqUV--Rw1F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040012
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111093-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:matthew.leung@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0A7E63C38D

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


