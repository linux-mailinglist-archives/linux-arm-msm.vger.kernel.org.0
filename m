Return-Path: <linux-arm-msm+bounces-62279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7BCAE77A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:01:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4D801BC4281
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 07:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF5C1917F4;
	Wed, 25 Jun 2025 07:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dkbs6VOQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2D979F2
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 07:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750834857; cv=none; b=MvtmJgtx1kzhpHR0l1A3yAzOZ1NIq7YcKF2vwrIs88GIy8lLYSVdGJjYBN/sFP25z1XY8gVVCk+ID2NEG6vUNV5R9Xyfqnnp1Tt9oR61ZLHauv2TAhBh5o+afaAitFlXq89Hj4qD2aO397ctG3FagTjjXTWGGxJn+VNMsoWrJIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750834857; c=relaxed/simple;
	bh=IOojmDcfA7xALANINpGpb3cHe1paDntB33v0oamHVOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nG9BmWBYEkn/7C8EciVIR6VpknBFjPdcpcV9c+bwWLSTbHGOjpvhb3Ltn6W0dEEuU9m2ZvRHHH6j7Cq1ShpwruYcxztfF4adrL/7zFVTvQN3BEGX1YVroONICRcYp9iTfTAqLOgAmC5khTz6XTuKq2QgMHpdFHjbILWM9idTDZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dkbs6VOQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P5UaDN014612
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 07:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pyzM2HxTz6vkcldnXZPq//
	68fgMJwv6Rt9/cCgUKmGA=; b=dkbs6VOQuI2DV+BLwNtRkPU/722Zy3D6A25Dw7
	4YQ7zjZEDOt9kKFSPRQBx4VVlaSWUaBqdyIOleW49kgF93GextQFFsBXYlx2bQoA
	9go23sKh53SRAZ4MxpG0H3z6dZVTp/71MfCjj/WOy0oPLNdNnkgIEAD5Vso0b/A0
	RaFPEXkbFx07VslLJv653uMuWqLzqA+H/wFT4jg2MtriYB/Caw+2vHD68ZtwfXx5
	784vzZ760hMGfP1f78xIbt8n0Q+YtlCwcVKv+RA5hMteik0RWHfcN7h1Wm5nzBg7
	ycwjN9aXHAIRBk0ZUXq/JSv6D2DOVm+zVG8q1khvctFLM2ow==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpy3mf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 07:00:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-313d6d671ffso1318037a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 00:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750834853; x=1751439653;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pyzM2HxTz6vkcldnXZPq//68fgMJwv6Rt9/cCgUKmGA=;
        b=DPBcQAzXZURskllr6nUH7w7jsQ4BvFSpM0zORKzdhyYy94sevbDXdn4pLdt00lqxwt
         Ss1GYd9gqrkz9mYx48RjimZRig6rVx4cNtbMGg4yCQMwcRfVedt8iVuRXXHiXa5Ha7IG
         qEIjslaREF2umCk45G74C8peUMTSMeYX50pmkEhvM6OYSm6mqX2ASKIeqL244qbuNhHr
         gmIJ+tJOeLfM3Nf39wwGghcau8pxadzwfee0TJcXImLcfjdPGvCc65Pjpypyu0yMQJJ/
         8jmxx9A64jSlVmrk5U1pjrrfSVG1/tsSWWIbbBVPHwMXMt+CPJZHHZueRn36Ys7cBCEq
         Ke2g==
X-Gm-Message-State: AOJu0YzSJ95BerMjylNFMvj5iHNj1M0roMt+Rs/W5mTam0VaHa85aTPN
	CO3dAdNJzABXorV+tuUUqHlfQ4QL2MSnOQCc9XtKWTPfJXwSbktRVkZfaBRMwpwM9+liJc3bugq
	gPgJaY66wRLAH81hMdIhAh350UiUKQyD7rgYa459JXLJEajS+pQwMFi8o6KJqjcdbL8qZ
X-Gm-Gg: ASbGncsxWIKNjWd4wXc+MqiDg0Vy7l6RBd8nEwWpvsUNc7bFJXzk3hYoRLkk/t1kQdc
	EvQ+Jyec8ixFlAmIVzJpt/HwuROlQms04yHFq3+0H+bUrEoc5qt/P7AE2jCB/+63gNgOcpv+i/i
	8WUGkQJoZpxeK4Q45BjCqTLW+WHORK3gIgrGt+ROY3Core8mpB91e6RLv8Ca0VEjipzPFwpISY9
	5Vjyw95LNhzC/4HHJyQfWfbJDFnBW3sLCndVHfj+sZ0QMxadh5f1Kc8Z94pJl4h27CJtEWVey79
	DEAAvXl+BcolJ7JseW5DeOFx/zztmivFu450taUmTHF83IMgj9h1V8IycIxdI5nz4BiNu/Ld2r9
	g4QLgZN33rh1Tuu3lcVDxt/VwtinzENGqV1BIJ8HdkSrVqzzk8w8KcbyE/g==
X-Received: by 2002:a17:90b:2c85:b0:312:e6f1:c05d with SMTP id 98e67ed59e1d1-315f25e7388mr3143096a91.2.1750834853034;
        Wed, 25 Jun 2025 00:00:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxulghq1aqMwRhsLHx6rKcs8jeRMiEBRz4TjDDZ8DEU2FlXcgU6xVBPD0ZuaW69ijwzrAUMA==
X-Received: by 2002:a17:90b:2c85:b0:312:e6f1:c05d with SMTP id 98e67ed59e1d1-315f25e7388mr3143032a91.2.1750834852497;
        Wed, 25 Jun 2025 00:00:52 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f539e6aasm968494a91.15.2025.06.25.00.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 00:00:51 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 12:30:46 +0530
Subject: [PATCH] phy: qcom: phy-qcom-m31: Update IPQ5332 M31 USB phy
 initialization sequence
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-ipq5332_hsphy_complaince-v1-1-06b4b8e66bc6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJ2eW2gC/x3M0QpAMBSA4VfRubbiMMqrSGvmsFPMbCWSd7dcf
 hf//0CkwBShyx4IdHLk3SWUeQbGareQ4CkZsEBZNCgF+0NWFSobvb2V2Te/anaGhKnlSEgtYq0
 h5T7QzNe/7of3/QAYkKSIagAAAA==
X-Change-ID: 20250625-ipq5332_hsphy_complaince-c45be2e7224a
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750834849; l=2192;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=IOojmDcfA7xALANINpGpb3cHe1paDntB33v0oamHVOM=;
 b=SfKStKtNZyQJPNsfLoRZyp+/DtgguNjygO9NJmA3gnpnwmFv0LidhX3Pu+AggbylOqiCisoe0
 YMm/lDizgcgCv3T56wFgVHhpoj6NLR9rz5wJdWsRjHDgCC/gx3LeZCe
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685b9ea6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=j3_UZ-iYLL1He1QCjhoA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA1MSBTYWx0ZWRfX6QRibkozBkK/
 ZYV8OzDSsc7NOG9m42RJQKOQmJaYL/Cuj0PXddfM3+A20OwR4GkzyI8pqqbeThGXfIIEGt3Ig7F
 bqEZAwbaDlbJWQJv8pTrLu5z7JqhTZb6WP6qg7uvJOCYLZzvTiNwH/AX8nfa8e2lbWO5VdJ6tV7
 KWXSgetrwo31Cuz32j+rHZnmiMn3ypBaQINIqT9imMb1NXT0sLf/qdJI1p/jQrmSISy6Wdfwx5n
 Akh9XykVUWhJtMdMrFVMRpTiZiKMunRIs+KsEpI6TNQE+cLAb00X+O3zOmKjlVCDKByxNDXBZwr
 NTvQje7HlWZbRAwR/hL8rdwE4uIwW+4TvOzYrLJVhq5MQuQm1XHpkNrIjKEIQxylvljg9Z7wwfL
 7M4ayTHGb9g0Az67q94VTXqWQX4dXv1qbH2iGbgIKuQCZcKyhw/nSz+wDDLgBLGUPMgb4V2t
X-Proofpoint-ORIG-GUID: QJvyIRluQ1NuMCC5DbH-d3cHwgRJK6kZ
X-Proofpoint-GUID: QJvyIRluQ1NuMCC5DbH-d3cHwgRJK6kZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=983 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250051

The current configuration used for the IPQ5332 M31 USB PHY fails the
Near End High Speed Signal Quality compliance test. To resolve this,
update the initialization sequence as specified in the Hardware Design
Document.

Fixes: 08e49af50701 ("phy: qcom: Introduce M31 USB PHY driver")
Cc: stable@kernel.org
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-m31.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31.c b/drivers/phy/qualcomm/phy-qcom-m31.c
index 7caeea1b109e922c0cd12e985bc8868d5bce8b4f..1a8a0f1262cd95bc00dfbf7397a1c48d88d52327 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31.c
@@ -58,12 +58,14 @@
  #define USB2_0_TX_ENABLE		BIT(2)
 
 #define USB2PHY_USB_PHY_M31_XCFGI_4	0xc8
- #define HSTX_SLEW_RATE_565PS		GENMASK(1, 0)
+ #define HSTX_SLEW_RATE_400PS		GENMASK(2, 0)
  #define PLL_CHARGING_PUMP_CURRENT_35UA	GENMASK(4, 3)
  #define ODT_VALUE_38_02_OHM		GENMASK(7, 6)
 
+#define USB2PHY_USB_PHY_M31_XCFGI_9	0xDC
+#define HSTX_CURRENT_17_1MA_385MV	BIT(1)
+
 #define USB2PHY_USB_PHY_M31_XCFGI_5	0xcc
- #define ODT_VALUE_45_02_OHM		BIT(2)
  #define HSTX_PRE_EMPHASIS_LEVEL_0_55MA	BIT(0)
 
 #define USB2PHY_USB_PHY_M31_XCFGI_11	0xe4
@@ -164,7 +166,7 @@ static struct m31_phy_regs m31_ipq5332_regs[] = {
 	},
 	{
 		USB2PHY_USB_PHY_M31_XCFGI_4,
-		HSTX_SLEW_RATE_565PS | PLL_CHARGING_PUMP_CURRENT_35UA | ODT_VALUE_38_02_OHM,
+		HSTX_SLEW_RATE_400PS | PLL_CHARGING_PUMP_CURRENT_35UA | ODT_VALUE_38_02_OHM,
 		0
 	},
 	{
@@ -174,9 +176,13 @@ static struct m31_phy_regs m31_ipq5332_regs[] = {
 	},
 	{
 		USB2PHY_USB_PHY_M31_XCFGI_5,
-		ODT_VALUE_45_02_OHM | HSTX_PRE_EMPHASIS_LEVEL_0_55MA,
+		HSTX_PRE_EMPHASIS_LEVEL_0_55MA,
 		4
 	},
+	{
+		USB2PHY_USB_PHY_M31_XCFGI_9,
+		HSTX_CURRENT_17_1MA_385MV,
+	},
 	{
 		USB_PHY_UTMI_CTRL5,
 		0x0,

---
base-commit: 2ae2aaafb21454f4781c30734959cf223ab486ef
change-id: 20250625-ipq5332_hsphy_complaince-c45be2e7224a

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


