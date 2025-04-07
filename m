Return-Path: <linux-arm-msm+bounces-53377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C552CA7E16D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 16:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6DB2169912
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 14:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2F21D90B3;
	Mon,  7 Apr 2025 14:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jtqTBtVl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD7E1D8E10
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Apr 2025 14:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035689; cv=none; b=QpoLFNuHqROSRn22x8JzUz9vluqSUU4Co9Xg/JA7w0/Jodd2kXR8PYAXhX0pktQXCAv++8oPyI0D3soOSoNQRo9ClwpFWPcqVy27ZAVvGUO6o4ZwM5SFnX7b1YOW2gcfskHT6nafE/xy+Q42eQtrZTpD7iUZK+HZj1hudaWpx2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035689; c=relaxed/simple;
	bh=dzE1HWCAbIlovD3ylh8gnjP7z03csLo26efJxL1PvO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Cv0ZUgCGMpTkQ/Ek7FH5yRa0X+PQ4KR24xjTZb/TTXwMPaLgQA4E5ZvvbJRikEi4LsqEqIbKdqfGDlJxpuwg8MNmyYV8DbQuFvaESkk8bxB8N5ChuGD8IdPuu+D6qDiCKaAxhxcE3egNj2lZ+pdezIlDngQETW8RqTqJqcd1H6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jtqTBtVl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dmQh009202
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Apr 2025 14:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CwSbBrXfS6Q75dvQ5OFQ3E
	oVcgAuH0NLnZgqci7OVjg=; b=jtqTBtVlFDFJgHBmqqQzV5HufjZLaHfkqMRXhH
	PUwBsuxSbPJntYnsZxrmNvkx3BXivkpnE6QM8M74ect1CMYSXQv8DmwTOz0zwyfp
	YkMbRZiEV8WwRZnoHBGN/YWBX+eROMAWCy7oIQfE2FAOqBPDbQPd0xQcRpbuvJDA
	ZycY+guOzTs6zVQrCzdZOGzOIHjKzF1tW/T3dHmcI3yB8gCKvTLXyrDqX9apQkKM
	+Ro5WUGWnGKpTqlUe67e5o7tYy8WhjJc2QF0gjV0qO2v+INQtvklLoTNs1mkfS2u
	XHkX4nzxP2YDjMSAbbxYETOakQV+90LMAFHHnC7OvFUjuHOQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbucg3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Apr 2025 14:21:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-227ea16b03dso63263745ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Apr 2025 07:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744035686; x=1744640486;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CwSbBrXfS6Q75dvQ5OFQ3EoVcgAuH0NLnZgqci7OVjg=;
        b=bKJicM158OLFYihYbhft7rKyAmlg4HOLPWk9v4k3WC8z66UsUEX14INXISg2ZdP21O
         tBKmHK/Atnhx9JfLWFfqnS3KxjwrUJs5nqU+6m0dook1JgFgeMiKCS10q3fqoOmDhXuj
         2CxhEjl/dag5BmA7VXW8E8tLy1vZW7V+ylYyW1qlmPMc6gOec6F16daQTsmmFSnffIZn
         G+NmGjjWIQQJB9/nL50dqrpShXSlA0sEIpvh2Hr/vd0a/wWCPSx6cMB9xzZspPPBXkp5
         NGtQSfZGq/zFNg6R8hyqRMktgD6OxAaY+qiql5yKttFhupoSNDXY3+WOxBBbfCrWvoRc
         EBhQ==
X-Gm-Message-State: AOJu0YxsXm+eJ+sZmBXB8ZiLzCqGUILlh32aHiu+ImIn9B8gaM3krr6b
	5KJe1fPOLPYtVVw4wgWP6CSRBU5zq57UT/0jXJclp7q+YtJwqfRsY0NpYTnk2+mgnyM913RePBg
	D3rmR+R5QWuiT/9Fdea2MZyZJNWxds0MVwr/kV8TrIQw1Sr4AXkbxldFIOvbNTLJcbm5mUI6r
X-Gm-Gg: ASbGncvrbjwTG73yltB26SyoEYa42DGEumoWBoep8ATHqsKH0yBUpdCQTyaazViHt4k
	+j1c9bjbi83HV8BdGjGgOYwaUW/NKKTEYImXO7vdM9w1cFUxWYoRPz9LL5MWJvAW4SFpvkdgcSh
	EvZq5lHLkE45QVCcoo57Z+TcAY2uz5KakesqXGXsp1//3uwVo3BkFn33ZHGdGz88CTRAr9ERRCM
	+zKP0tRetRnZgvjy6z4ExES2QfXC6mofgf6O2p3tjZgrOI8kXE+d/EmAZapJwDmeIG1UKcMpPuz
	cvacYonaYxjyNW2EsX6bXwCDRwtm0A/x7zSqYwAcadwpACHmIfcVgP0O3Ff3Dr7rfB5ar9Un5pZ
	GqNJd/lWErVJPJLZlbb6ItebxwAsRRT7kUNmKctFkNizUUMo7GSg=
X-Received: by 2002:a17:902:c943:b0:220:c86d:d7eb with SMTP id d9443c01a7336-22a8a0a381cmr158971195ad.36.1744035686123;
        Mon, 07 Apr 2025 07:21:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHz1xFJAWKNFlff2dP27w7LQzbBRsHcd82SHSqknDBxkMIW7Hb99wQELM+zJzzGCvqq7OP4Ag==
X-Received: by 2002:a17:902:c943:b0:220:c86d:d7eb with SMTP id d9443c01a7336-22a8a0a381cmr158970795ad.36.1744035685713;
        Mon, 07 Apr 2025 07:21:25 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b3feesm8774877b3a.140.2025.04.07.07.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 07:21:25 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 19:51:17 +0530
Subject: [PATCH] phy: qcom-qusb2: Update the phy settings for IPQ5424
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-revert_hs_phy_settings-v1-1-ec94e316ea19@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFzf82cC/4WNTQ6CMBCFr0JmbUlbFcSV9zCEQJnSSYRipxIJ4
 e5WL+DmJd/L+9mAMRAyXLMNAi7E5KcE6pCBce00oKA+MWipz/IkS5FCGGLjuJnd2jDGSNPAwhZ
 dhabotK5KSOU5oKX3b/heJ3bE0Yf197Oor/t3clFCid5KpY9VZ82lvXnm/PlqH8aPY54E6n3fP
 1gCGVLDAAAA
X-Change-ID: 20250407-revert_hs_phy_settings-f6b9ec6b2297
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744035683; l=2972;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=dzE1HWCAbIlovD3ylh8gnjP7z03csLo26efJxL1PvO8=;
 b=hDsoWguSNfzwvOHoNVYe3omJP1fRy9CR2nBN0ll9hxrZVsbYN7jwZADIXwVsYz0swcJLnUtB6
 AyHzKIZ3uwnDqvjh3tqWccv3NUzyhTPpsYcwCJ6gcYar2Odhjp/Bf35
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: ncHegKSAt-ikxm_fb2B0sAljGKKwHKiY
X-Proofpoint-ORIG-GUID: ncHegKSAt-ikxm_fb2B0sAljGKKwHKiY
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f3df67 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=EUmpfdxrmR1wFgAKqUcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504070101

Update the phy settings for IPQ5424 to meet compliance requirements.
The current settings do not meet the requirements, and the design team
has requested to use the settings used for IPQ6018.

Revert the commit 9c56a1de296e ("phy: qcom-qusb2: add QUSB2 support for
IPQ5424") and reuse the IPQ6018 settings.

Fixes: 9c56a1de296e ("phy: qcom-qusb2: add QUSB2 support for IPQ5424")
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 27 +--------------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 1f5f7df14d5a2ff041fe15aaeb6ec5ce52ab2a81..49c37c53b38e70db2a1591081a1a12db7092555d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -151,21 +151,6 @@ static const struct qusb2_phy_init_tbl ipq6018_init_tbl[] = {
 	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_AUTOPGM_CTL1, 0x9F),
 };
 
-static const struct qusb2_phy_init_tbl ipq5424_init_tbl[] = {
-	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL, 0x14),
-	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE1, 0x00),
-	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE2, 0x53),
-	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE4, 0xc3),
-	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_TUNE, 0x30),
-	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL1, 0x79),
-	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL2, 0x21),
-	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE5, 0x00),
-	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_PWR_CTRL, 0x00),
-	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TEST2, 0x14),
-	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_TEST, 0x80),
-	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_AUTOPGM_CTL1, 0x9f),
-};
-
 static const struct qusb2_phy_init_tbl qcs615_init_tbl[] = {
 	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE1, 0xc8),
 	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE2, 0xb3),
@@ -359,16 +344,6 @@ static const struct qusb2_phy_cfg ipq6018_phy_cfg = {
 	.autoresume_en   = BIT(0),
 };
 
-static const struct qusb2_phy_cfg ipq5424_phy_cfg = {
-	.tbl            = ipq5424_init_tbl,
-	.tbl_num        = ARRAY_SIZE(ipq5424_init_tbl),
-	.regs           = ipq6018_regs_layout,
-
-	.disable_ctrl   = POWER_DOWN,
-	.mask_core_ready = PLL_LOCKED,
-	.autoresume_en   = BIT(0),
-};
-
 static const struct qusb2_phy_cfg qcs615_phy_cfg = {
 	.tbl            = qcs615_init_tbl,
 	.tbl_num        = ARRAY_SIZE(qcs615_init_tbl),
@@ -955,7 +930,7 @@ static const struct phy_ops qusb2_phy_gen_ops = {
 static const struct of_device_id qusb2_phy_of_match_table[] = {
 	{
 		.compatible	= "qcom,ipq5424-qusb2-phy",
-		.data		= &ipq5424_phy_cfg,
+		.data		= &ipq6018_phy_cfg,
 	}, {
 		.compatible	= "qcom,ipq6018-qusb2-phy",
 		.data		= &ipq6018_phy_cfg,

---
base-commit: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
change-id: 20250407-revert_hs_phy_settings-f6b9ec6b2297

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


