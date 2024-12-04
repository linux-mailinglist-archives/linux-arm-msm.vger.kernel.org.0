Return-Path: <linux-arm-msm+bounces-40208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EC79E37F0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 11:53:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF7531697B4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 10:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7081B392D;
	Wed,  4 Dec 2024 10:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BKuGG3mI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4E81B2180;
	Wed,  4 Dec 2024 10:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733309586; cv=none; b=gWBAlWPJbkB2jYkNLLC2QcQKj5YuLwX6pnhvnrmYB0+z039LCH840GSLez7IFLGlPB+Eotu922+QBsLoquxKvV6nkbUbl2dILoetTXXKKaQQN1AUydNsK4QxYFh8QdaAFrivTL+dFDVTtFA45CufBPYv8oIy4efEQU9kXocpLd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733309586; c=relaxed/simple;
	bh=MM+tJ5yO0W2ar750uCN/4vzYsJVzOQjnJU7ahFv3K9o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K3KIL+xpsUFs7TbV88LEkQkfsYkjnpJVnfaHMPbUHB29F03Ppk5vFD+aWjjtywfZxJ0TdXAvI1LaZkpG7yF3iyztVzvTYkSdmgTQMX+wQUZ+8Ya7Og/gWH0qIfHR6Jo8Ih3k7etMX8uZ51oaTX/hd5rUpwmPkhW0oAnPTnS9XZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BKuGG3mI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B47FHP6024766;
	Wed, 4 Dec 2024 10:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ndaeEycShep
	uNA8YzZcaOi84nQFXF657VVUeij9O+bk=; b=BKuGG3mI/nDpstJ9GOlbO3Hof8E
	QiqFNQZySQQPnCucdLsN1q/thqV/zDdGBVHBXED+Yj/wB6FzQqFJOmudFZMql3xY
	1BBbzdurlUH3O4itZsES78XN7qii+D8lW97CYhCjUDeOyqCzn4HG6JxZDvt7lYHX
	iyOUd/0pX8Ljc3ylDFst0D/8C70fdDu11s5PVynKtlKqPIqrzyFL9qwntqiuKGGG
	M7h+qvcppj7sqES0u3BqclCRPWcYRUG/uW+RuEaB7fJrbxOjOp/u2VXZgRFJGaJr
	RIqSI2n/3Iv94ziNFob1rmMeL7/OsHYR54AfEHHkvy2Y9ULbIlRQgOPSOLQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439vnyuyft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 10:52:58 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4AqtOk008986;
	Wed, 4 Dec 2024 10:52:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 437uskmrtm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 10:52:55 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4B4AqsDt008980;
	Wed, 4 Dec 2024 10:52:55 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (cse-cd02-lnx.qualcomm.com [10.64.75.246])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4B4AqsHj008971
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 10:52:54 +0000
Received: by cse-cd02-lnx.ap.qualcomm.com (Postfix, from userid 4438065)
	id 5568219E7; Wed,  4 Dec 2024 18:52:53 +0800 (CST)
From: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, dmitry.baryshkov@linaro.org,
        abel.vesa@linaro.org, neil.armstrong@linaro.org,
        manivannan.sadhasivam@linaro.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Subject: [PATCH 2/3] phy: qcom: qmp-pcie: add current load vote/devote for PCIe PHY
Date: Wed,  4 Dec 2024 18:52:48 +0800
Message-Id: <20241204105249.3544114-3-quic_ziyuzhan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241204105249.3544114-1-quic_ziyuzhan@quicinc.com>
References: <20241204105249.3544114-1-quic_ziyuzhan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: igVsU6bqkqVrkfhZhbB7AnerrjJHwSGZ
X-Proofpoint-GUID: igVsU6bqkqVrkfhZhbB7AnerrjJHwSGZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040085

On some platform (eg.qcs615), the current that phy consumes will exceed
the maximum current the regulator can provide in LPM mode, leading to
over current protection and system boot up stuck. Fix this issue by
setting regulator load to an expected value getting from phy device tree
node during init so that the regulator can scale up to HPM to allow a
larger current load.
This change will also set load to zero during deinit to let regulator
scale down to LPM mode to reduce itself's power consumptionif PCIe
suspend.

Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 35 ++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index c8e39c147ba4..782d51ab5cf1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -39,6 +39,7 @@
 #include "phy-qcom-qmp-pcie-qhp.h"
 
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
+#define MAX_PROP_SIZE		   32
 
 /* set of registers with offsets different per-PHY */
 enum qphy_reg_layout {
@@ -2905,6 +2906,7 @@ struct qmp_pcie {
 	struct reset_control_bulk_data *resets;
 	struct reset_control *nocsr_reset;
 	struct regulator_bulk_data *vregs;
+	u32 *max_current_load;
 
 	struct phy *phy;
 	int mode;
@@ -4087,6 +4089,17 @@ static int qmp_pcie_init(struct phy *phy)
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	int ret;
 
+	for (int i = 0; i < cfg->num_vregs; i++) {
+		if (qmp->max_current_load[i]) {
+			ret = regulator_set_load(qmp->vregs[i].consumer, qmp->max_current_load[i]);
+			if (ret) {
+				dev_err(&phy->dev,
+					"failed to set load at %s\n", qmp->vregs[i].supply);
+				return ret;
+			}
+		}
+	}
+
 	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
 	if (ret) {
 		dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
@@ -4129,6 +4142,7 @@ static int qmp_pcie_init(struct phy *phy)
 
 static int qmp_pcie_exit(struct phy *phy)
 {
+	int ret;
 	struct qmp_pcie *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
@@ -4137,7 +4151,16 @@ static int qmp_pcie_exit(struct phy *phy)
 	clk_bulk_disable_unprepare(ARRAY_SIZE(qmp_pciephy_clk_l), qmp->clks);
 
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
-
+	for (int i = 0; i < cfg->num_vregs; i++) {
+		if (qmp->max_current_load[i]) {
+			ret = regulator_set_load(qmp->vregs[i].consumer, 0);
+			if (ret) {
+				dev_err(&phy->dev,
+					"failed to set load at %s\n", qmp->vregs[i].supply);
+				return ret;
+			}
+		}
+	}
 	return 0;
 }
 
@@ -4274,14 +4297,22 @@ static int qmp_pcie_vreg_init(struct qmp_pcie *qmp)
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	struct device *dev = qmp->dev;
 	int num = cfg->num_vregs;
+	char prop_name[MAX_PROP_SIZE];
 	int i;
 
 	qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
 	if (!qmp->vregs)
 		return -ENOMEM;
 
-	for (i = 0; i < num; i++)
+	qmp->max_current_load = devm_kcalloc(dev, num, sizeof(*qmp->max_current_load), GFP_KERNEL);
+	if (!qmp->max_current_load)
+		return -ENOMEM;
+
+	for (i = 0; i < num; i++) {
 		qmp->vregs[i].supply = cfg->vreg_list[i];
+		snprintf(prop_name, MAX_PROP_SIZE, "%s-max-microamp", qmp->vregs[i].supply);
+		of_property_read_u32(qmp->dev->of_node, prop_name, &qmp->max_current_load[i]);
+	}
 
 	return devm_regulator_bulk_get(dev, num, qmp->vregs);
 }
-- 
2.34.1


