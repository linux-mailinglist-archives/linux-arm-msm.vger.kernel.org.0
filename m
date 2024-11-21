Return-Path: <linux-arm-msm+bounces-38628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 689489D4887
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 09:10:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBE9AB22DA8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 08:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415231C9B8C;
	Thu, 21 Nov 2024 08:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c56IFFaz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4901CB333;
	Thu, 21 Nov 2024 08:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732176630; cv=none; b=CzPMMpVvwS4w75vBLAAOCgHY0RadNisq+ACzddBxXROOdZuZHc4dqVcmZx3+mim4n0rBEJT1KGxAcbfIutJi1rdi7bCOgo7X4NmIFi/v55lwjI+5b9Wun56VdmLF/l8IA/nNeEIrhRxQ0boe9Lk6a0/FZSN4ZjgyRc82C7ZN70E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732176630; c=relaxed/simple;
	bh=GtdOn5caD6WDaF75AVnYYBQ49F6yfgI1vqYP++FRU+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=r92jgQGyD6ZRucFHLaMzM2h9VYewlbtcMNWZvVomHC+HUWuI1rvQsnE6BC2gDyerVwgXyZOeWA3hOHuPsPhQjCBra4v1GhVatbbIlsk0tU0FF665ZmKqgJrbqgMXuTReycP1bb6WmmtnRzgGUnOomZots64ZVpbb93kzmNeupBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c56IFFaz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKNS1rO026218;
	Thu, 21 Nov 2024 08:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9718PP5vwJYML5it2cCaHG
	BMkJMGUFgBa/1hAUHZiTs=; b=c56IFFazZWBzTIPSitQkIcyxI9Hha6L8k2QeXZ
	zIDypEIGuqH6quNNBvs5dYEiLgfNauQ5IYjHqJ7tRYMOOnmyXFY0JLFFQw+82q6m
	t9v495YXM7DZ3laiyAfiUc0n3AK5/9yh1g5rXlaoIZUh/mpQvsxL1u4FzPHsPaWI
	d20P26iaXAuxBbzyeS74YiYJwPHzOdI7oxoCX7t80l2yJoSIhskxLWjQbf0U54Nw
	H5i1KPo3gLKSt5LdlgnrQ/oIeiHD/EZFbeS3lsIfXNAl283XkVoDF0LzlwfefCDC
	/+RkueQ84DrClm/wsEv/a3dS35UWqOtctWhjaDWo6uZGWWvA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ebyaut0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 08:09:48 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL89lMb025550
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 08:09:48 GMT
Received: from songxue-gv.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 21 Nov 2024 00:09:42 -0800
From: Song Xue <quic_songxue@quicinc.com>
Date: Thu, 21 Nov 2024 16:09:27 +0800
Subject: [PATCH v2] phy: qcom-qusb2: Add regulator_set_load to Qualcomm usb
 phy
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241121-add_set_load_to_qusb_phy-v2-1-1c5da1befec0@quicinc.com>
X-B4-Tracking: v=1; b=H4sIALbqPmcC/42NQQqDMBBFryKzbooTBbGr3qNISJNJHWiNJlEU8
 e5NPUGX78F/f4dIgSnCrdgh0MKR/ZBBXgowvR5eJNhmBlnKGlGi0NaqSEm9vbYqeTXN8anGfhM
 WK9mYpm2cI8jzMZDj9Uw/usw9x+TDdj4t+LN/RBcUKEpX167SlWxLuk8zGx7M1fgPdMdxfAGUR
 Ud9wgAAAA==
X-Change-ID: 20241121-add_set_load_to_qusb_phy-d1327c797ffe
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Vivek Gautam
	<vivek.gautam@codeaurora.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Song Xue
	<quic_songxue@quicinc.com>
X-Mailer: b4 0.15-dev-88a27
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732176582; l=2374;
 i=quic_songxue@quicinc.com; s=20240911; h=from:subject:message-id;
 bh=GtdOn5caD6WDaF75AVnYYBQ49F6yfgI1vqYP++FRU+4=;
 b=m7q607AhxgWCnNKJedUv5yCkwm5V4EzgpxtgWsMUI5z25i9x34scQbzWzuyVQHM7PIJH0v8yq
 E+8z+jY1SfBB5+m05d/LovfK1ZOPGWkjiC6kgey4sVFMv6ej1FpbIWI
X-Developer-Key: i=quic_songxue@quicinc.com; a=ed25519;
 pk=Z6tjs+BBbyg1kYqhBq0EfW2Pl/yZdOPXutG9TOVA1yc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tvG0gxE5FvIXz39goYgIkl8CDBeNLfju
X-Proofpoint-ORIG-GUID: tvG0gxE5FvIXz39goYgIkl8CDBeNLfju
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411210063

Set the current load before enable regulator supplies at QUSB phy.

Encountered one issue where the board powered down instantly once the UVC
camera was attached to USB port while adding host mode on usb port and
testing a UVC camera with the driver on QCS615 platform. The extensible
boot loader mentioned that OCP(Over Current Protection) occurred at LDO12
from regulators-0 upon powered on board again. That indicates that the
current load set for QUSB phy, which use the regulator supply, is lower
than expected.

As per QUSB spec, set the maximum current load at 30mA to avoid overcurrent
load when attach a device to the USB port.

Fixes: 937e17f36a32 ("phy: qcom-qusb2: Power-on PHY before initialization")
Signed-off-by: Song Xue <quic_songxue@quicinc.com>
---
Changes in v2:
- Removed "---" above the Fixes. 
- Link to v1: https://lore.kernel.org/r/20241121-add_set_load_to_qusb_phy-v1-1-0f44f3a3290e@quicinc.com
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index c52655a383cef008552ed4533b9f31d1cbf34a13..80f0d17c42717e843937255a9a780bbae5998535 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -722,16 +722,27 @@ static int __maybe_unused qusb2_phy_runtime_resume(struct device *dev)
 	return ret;
 }
 
+#define QUSB2PHY_HPM_LOAD 30000 /*uA*/
+
 static int qusb2_phy_init(struct phy *phy)
 {
 	struct qusb2_phy *qphy = phy_get_drvdata(phy);
 	const struct qusb2_phy_cfg *cfg = qphy->cfg;
 	unsigned int val = 0;
 	unsigned int clk_scheme;
-	int ret;
+	int ret, i;
 
 	dev_vdbg(&phy->dev, "%s(): Initializing QUSB2 phy\n", __func__);
 
+	/* set the current load */
+	for (i = 0; i < ARRAY_SIZE(qphy->vregs); i++) {
+		ret = regulator_set_load(qphy->vregs[i].consumer, QUSB2PHY_HPM_LOAD);
+		if (ret) {
+			dev_err(&phy->dev, "failed to set load at %s\n", qphy->vregs[i].supply);
+			return ret;
+		}
+	}
+
 	/* turn on regulator supplies */
 	ret = regulator_bulk_enable(ARRAY_SIZE(qphy->vregs), qphy->vregs);
 	if (ret)

---
base-commit: decc701f41d07481893fdea942c0ac6b226e84cd
change-id: 20241121-add_set_load_to_qusb_phy-d1327c797ffe

Best regards,
-- 
Song Xue <quic_songxue@quicinc.com>


