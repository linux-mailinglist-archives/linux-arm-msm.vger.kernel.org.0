Return-Path: <linux-arm-msm+bounces-67933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C720BB1C932
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 17:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9494E567856
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 15:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7BE29E103;
	Wed,  6 Aug 2025 15:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QVl9K2I1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CD229CB3E;
	Wed,  6 Aug 2025 15:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754495052; cv=none; b=ncxL32KMn7lFTGn1HHzE9+xH+J1Y04z0DmHfmFCjVWUNak0Y6M6Q5TQLoNIIk+mYmnv4jVGp8WnUIB5Gn7HZ8PVqEbDxZAN351eT1MAWWPtG0RUW/lOZqN1FzOhDFS6dPnOlznYsASOIQZ/+gRMBTVehNp99zv2jgPsZC2hQMm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754495052; c=relaxed/simple;
	bh=EjZ/DqORYPlgqOegKmCXffYhm7VH9ePWwNyMgG4EBiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LjSub2ofV0UyPbAzofMjkaG7dZ4CXituc6DK2P/2Ka9wgtduoiACeshFuplUlP21rTS98ARB9Hl74kKcnWEpynUX9doLqqJ1iEvnAVLQ++yUPqjDtmGDg60LmLePUlHRIYtOZb8yemuGh4yrRTGl36JNzoBdkVbEcVMtODHb6LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QVl9K2I1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576Cieg0031794;
	Wed, 6 Aug 2025 15:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ajTxLat5914
	gJlG1INUPF3AMODh4GFphEfW4X7h3aag=; b=QVl9K2I1lw23w8LqQ+HGeuzryKc
	PueOEREy/jxyfb1J132s3V6f1e587WwhiFIcJ0wLbnYBH4WVRDF11+65z94uSsem
	1XUUUW9++9Uml9tNRbQwBrySuvbw6tKjRE388qvZLJ+xLsEDoG6k3ID+goiLydsY
	WJ+Mb2aqgftZweEU5HfMkHQ6TBYZQYQQHc9R+eL/7hE/KcMTR7ugdlMbw8sTPhuQ
	Hg2ubaiwBfJldj8oe4PzBEZQrFwp5t4QmRocvlfEwGEWLPvn2s0L4ZN/2z2MWL2h
	VmAqv1rH31+hdum1RVZT0eHWyUav+PJ2GzJix9fVL0J1IfhEHGRtBkBPW3Q==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpybb9gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 15:43:51 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 576Fhm9E022987;
	Wed, 6 Aug 2025 15:43:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 489brkx9v1-1;
	Wed, 06 Aug 2025 15:43:48 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 576FhhfY022934;
	Wed, 6 Aug 2025 15:43:48 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 576FhlIp022976;
	Wed, 06 Aug 2025 15:43:48 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 39E0D571922; Wed,  6 Aug 2025 21:13:47 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, mani@kernel.org, conor+dt@kernel.org,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org,
        krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V1 4/4] phy: qcom-qmp-ufs: read max-microamp values from device tree
Date: Wed,  6 Aug 2025 21:13:40 +0530
Message-ID: <20250806154340.20122-5-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
References: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX0gO8BORbdZ9o
 O+S8NO+74WjIl33VTMsn3nyMohNGrru8UXtySi9HwxIOq74Z8uD3rHd3I/7W5UlZS+C9CR4/b0l
 ddbDYGhW0pNS3UgWTV39Y8tEV/8oAsijxwNjS3j6MG4FafoRv9BubOwsaZCiBB84p7a8r8YEsVh
 m3CRICd0Ag/19246bISZIlLUMs5i2R7ck/5MBjEi9aWD1NMM0odKTc/ZjRLMlh0Zax2+fqs4Msr
 wBpyjtQOLr4ev5vKh9NCEK8AY1SlkoJv3sBm2sZ5nE7A7EMKU2Z8EF3FVVoH8eqscaF/iemXcD3
 Pkc0H64rAeOwglNyTA70mK0zv4S7KAmTxhLbutixc940zf9JoBiUlN/s5389092qjQ/xgbxFuAz
 O9f0/TB3
X-Proofpoint-GUID: qR9AKQ1lFiuSarQ5PofuYQekFUHDsni2
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=68937837 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=MdcHHQUUFhuGihZeNYkA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: qR9AKQ1lFiuSarQ5PofuYQekFUHDsni2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

Add support in QMP PHY driver to read optional vdda-phy-max-microamp
and vdda-pll-max-microamp properties from the device tree.

These properties define the expected maximum current (in microamps) for
each supply. The driver uses this information to configure regulators
more accurately and ensure they operate in the correct mode based on
client load requirements.

If the property is not present, the driver defaults load to
`QMP_VREG_UNUSED`.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 9c69c77d10c8..6e116f7370c3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -39,6 +39,8 @@
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 
 #define NUM_OVERLAY				2
+#define QMP_VREG_UNUSED				-1
+#define MAX_PROP_NAME				32
 
 /* set of registers with offsets different per-PHY */
 enum qphy_reg_layout {
@@ -1894,15 +1896,29 @@ static int qmp_ufs_vreg_init(struct qmp_ufs *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	struct device *dev = qmp->dev;
+	struct device_node *np = dev->of_node;
+	char prop_name[MAX_PROP_NAME];
 	int num = cfg->num_vregs;
-	int i;
+	const char *supply;
+	int i, ret;
 
 	qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
 	if (!qmp->vregs)
 		return -ENOMEM;
 
-	for (i = 0; i < num; i++)
-		qmp->vregs[i].supply = cfg->vreg_list[i];
+	for (i = 0; i < num; i++) {
+		supply = cfg->vreg_list[i];
+		qmp->vregs[i].supply = supply;
+
+		/* Defaults to unused */
+		qmp->vregs[i].init_load_uA = QMP_VREG_UNUSED;
+
+		snprintf(prop_name, sizeof(prop_name), "%s-max-microamp", supply);
+		ret = of_property_read_u32(np, prop_name, &qmp->vregs[i].init_load_uA);
+		if (ret)
+			dev_dbg(qmp->dev, "No max microamp for %s, using default %d\n",
+				supply, QMP_VREG_UNUSED);
+	}
 
 	return devm_regulator_bulk_get(dev, num, qmp->vregs);
 }
-- 
2.48.1


