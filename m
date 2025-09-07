Return-Path: <linux-arm-msm+bounces-72435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B07F1B47BDC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 16:52:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC4D31789AA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 14:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B2C27E1D5;
	Sun,  7 Sep 2025 14:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LV/byqxI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BE427B328
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Sep 2025 14:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757256743; cv=none; b=SVq8+UGs+wUoK81ncJ8sGm24a/PxKUpyS1Jjy5KTAxgpO2q1b3Yygs/pYx07TlyIsm6VES3jW6z8Tmz39wmmNtfcOf2bOtOZqPP20OBtw6aFXeXQ0EfacHwG9kK+midxMbEQbIlvMKbLMlbyw21dlLLwiR/7uRNeDmpvY/U1x+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757256743; c=relaxed/simple;
	bh=q8/D+ukM0Z8xbt2NzOinEuwjlyUq60k42C13C/W8iPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P68tQrV3ALJ+3ZbBNsSkCy5qqH8uduuiy4EiKazp+dC4AYiJSbS2dPfuJ/wwtnEMKvxHIKqRY27/hHJ12FTnElnmZSvVbbUUHZYVesEQcAe4waOkS0NvWbWT2lJ51n3dpmJObOSskzTWgvWYKbh3v2SJ2Vz+6Jn2ySTznCjWy+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LV/byqxI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5878jU0L020053
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Sep 2025 14:52:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZNffsrN8dmCEs7HAgfangQEaiQquRtqWha57sIIZbzU=; b=LV/byqxIELLLV8Wt
	PIucgDdkvSiw+ADNd6dsCnOoVXjpSsd3e7y0+uzzz7P8BHWCiXbS3WHHfTghrreK
	NH8UOqkGVjTWkETnEXWmC1pddlecVzrD1ZHrsFRpZHXNueCAw5jZAIGjWJ+lXero
	98j+98G2+ziy7fExLuVU+WKhovILxBuXmlF1FFf0cDT1iqWRpN+KUYp3SrU7c2S4
	6wO/GETmZkuwBuhUMNgud83yfvCD3H8Ov7nvTtRA4iagVDisIxhzL1z/PJmUWNDP
	hd73S9Fx7XNRLvZztPUhUDfjc9c6I6Q17BcD5Aru4BbjoA/yq4F7y6q6RwKz0aDH
	iP0KoA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490anfae27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 14:52:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b345aff439so103355771cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 07:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757256739; x=1757861539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNffsrN8dmCEs7HAgfangQEaiQquRtqWha57sIIZbzU=;
        b=h7G6ZWPc7hNhJ1n1L4JuBE16zhjx8SYEdW3GPLF/YxHwc+PmP2fFN/Ydd9beGzXM21
         F2ecNTrRwa6LCJ7XGoNOxga8uQn+gAF9WfM/8qA5wo0EDs8Zm+eU69iAQtOnMwTfJkI0
         0RpGudhtXhHWdGoOZbw+1ehkz+e4z+/7eMo18QduPo+cTW+YrwsjegKIFiN+lFJ5wMi5
         dOqsHaKZSJh7khRar0/GFbx3hjQZhiImy4lXJlR9RMLUe0e+gegDGxkPFa19jKftj4mI
         mHvjZ4ymE+MWkb3Dda4xTS9Hvq1IxdpHKhjgtilKt+/OA7KxW4NonNjI2//0s6n6rxVQ
         zUnw==
X-Gm-Message-State: AOJu0YyaET8vQN/f5Oh61fOhhCipNxfCV5C7ycif8vFkahHXzhjjdVg5
	gcX8jkaSS6s/9/BdwrJqMnBIN+4IzpwL8Ljhil45jG/1s3NY8PzZSetCzDWRH5icCMSP7LEGpVy
	TT9WSqihNefK79P5YnhAvjmMd2c/RklK7EDG0Fkby7/eyGBv09z4Cbg0STdcp1Dy/G8O6y0LwQI
	kl
X-Gm-Gg: ASbGncv0HQ3YqANY5JDhyvamrxiG2jqdTquAXkdIk+U4l3KUj5XoGGhY3wYgVSonUM0
	l8swSNqsh/UknlYnLm/G/Jq6tlJk19RGt+iH+lEuA+ekIg/7QpVAhcpTxLDWjadzsm87CdSd6aR
	2VC9m7z5nNa3YzQl6w484eCHDwFCk7z9BjhGvs5Q2Q5184NTLlHdp0a2X6RXWA22rNJjzwQLb3/
	O3iZVoOqKU41LrMWIwNGDrP1ccCECSxEZf5D/xuO2r5A7/d1K7ShurltUF0GYzAdPV2V9C7d1gh
	0N8Y62/PxN1BsoAiNgu+dJIiXWB4Z6e45CYAS/sxBpd+wgK/+Jf7X+/1D799jkpZn3Yjx2SUK+g
	MZeqTkk7tT+0h0fxo3AD0H97g3DCn+8srLQgh+KQNkevPrImSCu3F
X-Received: by 2002:a05:622a:1823:b0:4b4:9084:d003 with SMTP id d75a77b69052e-4b5f844d4d8mr46652011cf.40.1757256738920;
        Sun, 07 Sep 2025 07:52:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7WElD3JmL2LHfSpTpNmNOEL8oEqj3NvSXEnxSgRINrKywiinX54RHXhg9TR6yFPcmw+sgyQ==
X-Received: by 2002:a05:622a:1823:b0:4b4:9084:d003 with SMTP id d75a77b69052e-4b5f844d4d8mr46651891cf.40.1757256738457;
        Sun, 07 Sep 2025 07:52:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ab939d5sm2936738e87.46.2025.09.07.07.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 07:52:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 07 Sep 2025 17:52:10 +0300
Subject: [PATCH 1/4] phy: qcom: qmp-usb-legacy: switch to common helpers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-qcom-dp-phy-v1-1-46634a6a980b@oss.qualcomm.com>
References: <20250907-qcom-dp-phy-v1-0-46634a6a980b@oss.qualcomm.com>
In-Reply-To: <20250907-qcom-dp-phy-v1-0-46634a6a980b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3537;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=q8/D+ukM0Z8xbt2NzOinEuwjlyUq60k42C13C/W8iPg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBovZwftYjKqkW+00RmQtqC0KhBlt2jfoXYBgS3A
 /rpxiFSJfuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaL2cHwAKCRCLPIo+Aiko
 1dSoB/9jtszJionNXNnZ+AaJemPRe2skJQAhLH9BcZxp34aGVp32MUdJfEUkHw3JSKEe/XlKSwP
 kEW/aO/Qc2lrvpZhgceKuvz2a9jw9jPjsR76Fzr0TmhHo3/XGmSsaqhQ6LBjH2OwE/UBZqzKGnF
 Id89N2qu+GVmJ+6hu8FX3Pw3bD7kkwcbT9M5Y7mkwBlUviVUg1LRYSJCMPWhW5KR/bf+wYXwjqd
 kR5UCSG2UNO7OByDakClnQleBg1nUHk/DrlcUo94soHRd5K6FMMnNL5iP360bgU/qOwfwKqqkep
 u5wKXh0hUpXEHZP9ijpFIcf99GIamcmG7tDToI+cfdaypTNu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 6OQgo0f_y361y2DSR_1bzLmJWMxfmY3z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwNCBTYWx0ZWRfX3vvK7Gqk1NmD
 baTnB/CZ1ho5PkGezlxcsnEu1uisEn4Jl97+ph1DMWjV8ll2QSWBj/1H50GSeWUfocJQcEnP0ho
 dMOesLKZ1q7zC60RUZfquXE2dVeMcvfPbqtbszFDR3/Eusnb3JGQez6u+PF3gC0oGNOLIh0UZlE
 hME41lkSbZfkaacgQHX4WfZzmP9B1XUAfoHqmQwcUvyU7JlU/rurjjwWPf6vnAf9Vz2pWjc39+2
 LtVH9BM2YOCYznI4Yk3fVFtZvlCUKCmQLYH+Nhwg3GK9pfcWa0o0DGiyVtrZJ37+REG6heHtbjP
 ZSoOekuZqsuJEYT/MURpJnYaXGl1VAxn3E/pOwcKAStuc2lS55yJHjzZN+FyKRRGInYeAiaYefF
 nVHN98VP
X-Proofpoint-GUID: 6OQgo0f_y361y2DSR_1bzLmJWMxfmY3z
X-Authority-Analysis: v=2.4 cv=CaoI5Krl c=1 sm=1 tr=0 ts=68bd9c24 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=AjFrHIIk6tpMehmkB6kA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060004

Instead of having a copy of the common definitions and functions inside
the usb-legacy PHY driver, use the phy-qcom-qmp-common.h header.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c | 64 ++++----------------------
 1 file changed, 8 insertions(+), 56 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
index 8bf951b0490cfd811635df8940de1b789e21b46c..ddb52c1812dd02e15a840deee934c849405c2a98 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
@@ -20,6 +20,8 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include "phy-qcom-qmp-common.h"
+
 #include "phy-qcom-qmp.h"
 #include "phy-qcom-qmp-pcs-misc-v3.h"
 #include "phy-qcom-qmp-pcs-usb-v4.h"
@@ -43,30 +45,6 @@
 
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 
-struct qmp_phy_init_tbl {
-	unsigned int offset;
-	unsigned int val;
-	/*
-	 * mask of lanes for which this register is written
-	 * for cases when second lane needs different values
-	 */
-	u8 lane_mask;
-};
-
-#define QMP_PHY_INIT_CFG(o, v)		\
-	{				\
-		.offset = o,		\
-		.val = v,		\
-		.lane_mask = 0xff,	\
-	}
-
-#define QMP_PHY_INIT_CFG_LANE(o, v, l)	\
-	{				\
-		.offset = o,		\
-		.val = v,		\
-		.lane_mask = l,		\
-	}
-
 /* set of registers with offsets different per-PHY */
 enum qphy_reg_layout {
 	/* PCS registers */
@@ -698,32 +676,6 @@ static const struct qmp_phy_cfg sm8350_usb3phy_cfg = {
 	.pcs_usb_offset		= 0x300,
 };
 
-static void qmp_usb_legacy_configure_lane(void __iomem *base,
-					const struct qmp_phy_init_tbl tbl[],
-					int num,
-					u8 lane_mask)
-{
-	int i;
-	const struct qmp_phy_init_tbl *t = tbl;
-
-	if (!t)
-		return;
-
-	for (i = 0; i < num; i++, t++) {
-		if (!(t->lane_mask & lane_mask))
-			continue;
-
-		writel(t->val, base + t->offset);
-	}
-}
-
-static void qmp_usb_legacy_configure(void __iomem *base,
-				   const struct qmp_phy_init_tbl tbl[],
-				   int num)
-{
-	qmp_usb_legacy_configure_lane(base, tbl, num, 0xff);
-}
-
 static int qmp_usb_legacy_serdes_init(struct qmp_usb *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -731,7 +683,7 @@ static int qmp_usb_legacy_serdes_init(struct qmp_usb *qmp)
 	const struct qmp_phy_init_tbl *serdes_tbl = cfg->serdes_tbl;
 	int serdes_tbl_num = cfg->serdes_tbl_num;
 
-	qmp_usb_legacy_configure(serdes, serdes_tbl, serdes_tbl_num);
+	qmp_configure(qmp->dev, serdes, serdes_tbl, serdes_tbl_num);
 
 	return 0;
 }
@@ -840,13 +792,13 @@ static int qmp_usb_legacy_power_on(struct phy *phy)
 	}
 
 	/* Tx, Rx, and PCS configurations */
-	qmp_usb_legacy_configure_lane(tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
-	qmp_usb_legacy_configure_lane(rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
+	qmp_configure_lane(qmp->dev, tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
+	qmp_configure_lane(qmp->dev, rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
 
-	qmp_usb_legacy_configure_lane(qmp->tx2, cfg->tx_tbl, cfg->tx_tbl_num, 2);
-	qmp_usb_legacy_configure_lane(qmp->rx2, cfg->rx_tbl, cfg->rx_tbl_num, 2);
+	qmp_configure_lane(qmp->dev, qmp->tx2, cfg->tx_tbl, cfg->tx_tbl_num, 2);
+	qmp_configure_lane(qmp->dev, qmp->rx2, cfg->rx_tbl, cfg->rx_tbl_num, 2);
 
-	qmp_usb_legacy_configure(pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
+	qmp_configure(qmp->dev, pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
 
 	usleep_range(10, 20);
 

-- 
2.47.3


