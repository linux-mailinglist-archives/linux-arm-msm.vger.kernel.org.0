Return-Path: <linux-arm-msm+bounces-74273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4015B8BE5E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 05:24:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CE24179D91
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 03:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F7C22CBE6;
	Sat, 20 Sep 2025 03:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k5t3ABKb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84458225A34
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 03:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758338524; cv=none; b=H9zItS1+3MKqXhOI6vCN9khj0ynPQeBHmEv1dGtk07Qr48epFke2z21eL0cmCqmrT5x5LCubGHQREJrrwCRoGfej374AeES+I3wDH/YMpFMoa3dThECl5aeZeCppvgk8XHym7oqDF5itag8yIeLfvkXkeg+RkXOHv8bJ3LMGhHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758338524; c=relaxed/simple;
	bh=0xFRrxPf1HgCf/uIpvSwdyWaSlw0SJxq9j5r8OfcLSM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ukssCZme6arWysyAoYZK9mtUqULQNXBOsqoUUhxs/j15nNLsG7SnQzU2bszzs9/APE7h01poWvk8H4L1VYN5M1S/dzYDTFSXoJK5Z5wJNJIHB7iTY9UuFXUc1Uj3byFKHv677k7SpRfK4w2d2XjA6g0kzd15PDSRQXk3LadNjI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k5t3ABKb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58K3FYWi011324
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 03:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vuZU5U4R9Rryr7IdAfkxs753zdgqirIJxPG
	858BKWwE=; b=k5t3ABKb2GvmSXeB4L3qyWcAYWv5GOpbrwGW+IExQE1comiVw9E
	ufPeF4cJJ7qL+T4YI2BBhXvKmXrX68hUmV/WZaehLJ/YiOIbqZFcBF1oCjbIPwM6
	lzLPk5OTNYfyltG8g4gxAzEYzii1sIrdstgY/9nnyxxS/68jD72JN1L14PwkJbVJ
	2XJXH8KI3+c2owvmLYP57zqvFY6+E7wIyWy2UuL+XNko0BgJ56aA/LkK/+p7IYqC
	RUI5Hwitgf1h12SB6TXEy5uASbJL8QU/VX6Aovv9yoip7N8ftZzg3JCKkMNcorWn
	42GzpCK37ZzvaYhVs+BIb6eysOaEto+PC1w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxy4fbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 03:22:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2681623f927so26483335ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 20:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758338522; x=1758943322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vuZU5U4R9Rryr7IdAfkxs753zdgqirIJxPG858BKWwE=;
        b=gsHr6mEqc85mTUseeq8M4BZv3XAP318WB4WnLzW7U7AS4kLcTxIblNTxFT2ABabWmA
         oQkXI47ElnTBdrBX+HiDinN6b0fswds6Z6JcHiPp2Vew6JdUV0Br96RstlG1RM7yoWBh
         unREX4De+sQCK7FPd1RFznKNODcC1JbfjsZfNmuLBdNQsuNEusmqJHjk4jQX6ru5tFwB
         R4iqqX46ICQ0Zlxubjjx+SrJ0J/MiP3oFQgFs1b5RS3Mp2QjL0SHGjj46kaAI90lnuJv
         KH8ZeoutCZgyW41+cwhYKxbmJ4wS6dQfcBlkFRI9wbRUFA4hVNnwrLTr/SaXl+AIeJRa
         6VHA==
X-Gm-Message-State: AOJu0YzqbetbUYmDnZnFQf4Hn2ARn60culrQd5ccpoABmQnAhOwI04/0
	hoFyjyl1CU76Io33oyUjRSgSdXhlssNJ3bpJWTz5eNRqsWvyycLVogwKTlhNJqipJ8PsHlouCa4
	qBT87e8uC3FxfL+0hAYj0SfvTeZKcOUtyMiCZnDHruntBzWAZ2TYOwUpyH7G17NqKQ/5J
X-Gm-Gg: ASbGnctu/QJ35BwbDgUJbfJBOMyImQk+AGFzpYQL1XllyfzL0YwkHGQFZApZ4EKGB0J
	Lhk33B218ZU3OAJPlNMupREhDhlJBZK1vRfLumb6BW0t0PNxNL0uufZELjtghn6FYPU1DCXjZVu
	7rdDyU3F5LMb9MMp4L1P1pUTsAY0q/eW5vfn2z81ZrDRQJdUzXWQioC247GDGU/vIAOP+xVZ9wn
	KkzkaLhcmxKjz42aDxSzQinWFTzpZP2HaPTkuQ3Pv5zVWsz2BkGnCtqDp7ryHX4+Bav+gjNAiLK
	LiYPNgdpxfTXqcmDwyatc+OJ6qFeqn1Y2//Psds/zvPShUaNzr3Zx5yLT3Ida/x/dTE7WVR+TF5
	9JUnLoHIprkqT1Pxr
X-Received: by 2002:a17:90a:ec83:b0:32e:9da9:3e60 with SMTP id 98e67ed59e1d1-3309838e41emr6060605a91.36.1758338522085;
        Fri, 19 Sep 2025 20:22:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnfgc9WbLWRAMVvDv9SHJUx3qQPyX7uwJoFjB6p+plahvgBOQhzvbXnu4sxjxYoajBAIfINg==
X-Received: by 2002:a17:90a:ec83:b0:32e:9da9:3e60 with SMTP id 98e67ed59e1d1-3309838e41emr6060577a91.36.1758338521632;
        Fri, 19 Sep 2025 20:22:01 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3306082eff4sm6660409a91.25.2025.09.19.20.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 20:22:01 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: kishon@kernel.org, vkoul@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH] phy: qcom: m31-eusb2: Update init sequence to set PHY_ENABLE
Date: Fri, 19 Sep 2025 20:21:58 -0700
Message-Id: <20250920032158.242725-1-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX52/Phvd6jIyT
 Y+5USv/DbrmsYk1olwtuGDaCakBm3DahQ5xasEF1+9/r5GZ0YSf/NlhyTqebU4AiKwu2VBGZpVb
 ovOTOSOJjhTE4Q9HcuISXLTqVE79V349oXS4v+76zURG1nLiqfqtXLGCf+zAOg45G0yqM7+vkz7
 +V7cNYw5il6n4hzUW8rsODD0wyR87zLiUdk1cPBJ2k9zdwPagbpnoyUh1JCSb06/0wM3zt/HPyg
 gcx1fxxxO/rT/0FvnnwI9b2rv89JiSA9AU6Ryfy2kY7AcMG5/V5x63xw3LyQIssi08R32gQOBVN
 nI8H/aMM+mECq7+gIDb1QYt9oCjY/z4fbnlV8/gSoEwAQZOrhnfBKqfI7h6Sd3qYZHkdwKsOlfr
 fVBdHBJX
X-Proofpoint-ORIG-GUID: 8Cx9uK0tAI3pPRSB__u80jrs8Onti9oj
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68ce1dda cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=y6qI-x7cYgrOQfqpg38A:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 8Cx9uK0tAI3pPRSB__u80jrs8Onti9oj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>

Certain platforms may not have the PHY_ENABLE bit set on power on reset.
Update the current sequence to explicitly write to enable the PHY_ENABLE
bit.  This ensures that regardless of the platform, the PHY is properly
enabled.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index bf32572566c4..fbf5e999ca7a 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -25,6 +25,7 @@
 #define POR				BIT(1)
 
 #define USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
+#define PHY_ENABLE			BIT(0)
 #define SIDDQ_SEL			BIT(1)
 #define SIDDQ				BIT(2)
 #define FSEL				GENMASK(6, 4)
@@ -81,6 +82,7 @@ struct m31_eusb2_priv_data {
 static const struct m31_phy_tbl_entry m31_eusb2_setup_tbl[] = {
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 1),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL5, POR, 1),
+	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL_COMMON0, PHY_ENABLE, 1),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG1, PLL_EN, 1),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_FSEL_SEL, FSEL_SEL, 1),
 };

