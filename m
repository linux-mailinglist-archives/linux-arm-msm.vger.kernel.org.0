Return-Path: <linux-arm-msm+bounces-21442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE54E8D7C8C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 09:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E08111C21F04
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 07:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676F24F1F8;
	Mon,  3 Jun 2024 07:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ow+ndGbe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BC34DA06;
	Mon,  3 Jun 2024 07:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717400236; cv=none; b=Bi/9XQy0km6nAs/zODUeATGfVrYQmA67P5j8eciNuNJ4DpmHUK7dIBbFYpqhdn8JF5X1j8IDyoT2z+bY3m0j6I9pehqiwiZkpBfBtIKvKpmtjckUccRKGJVy0DmV4F3MMbWD4IvxtUU2FquqdC7uXm/r21A6gLNIKhHxNHdPsig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717400236; c=relaxed/simple;
	bh=YrD1TeY+Zqn5mqS68Rc/BXAkFalRcdLmLF90a5+aRf4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GGAT81tx7GUpsaN8JyDhMMR14pT/lzR5Mtw4LYc9ws5KhwHYFDvMeEyeFPkMj/eMnahp6rpwBHiehDKdC10z3drX4YYo/SihNvOvDahydCWie2U5DVw+FLXDfIy0dc8oc8hFJ4KmOGruu1ead5sCmvRLJag4+PM6kbI66vOii5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ow+ndGbe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 452Lu1gi000710;
	Mon, 3 Jun 2024 07:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=elIZI+0QGYBcCHC97gkGU8
	OEiqo46K6nDcE6IeB7xhs=; b=ow+ndGbeid/o3aIiwDCtDJpUZLIZRvCL1OoEIV
	jlFJ2DTNiSVz+Lpo3hSOzrvO7U3zjOHiditGtl4nb2Aq1XnZhby+ucTaEaDvUuU2
	fiVQco/FaR7w7eHLv0hR2gn1UsgB7IoqXeKv6fip2SsQygGq1siTbkPfeOLy/S3R
	LS26YLgOPXKrA4ujjQ2Ho/gCWpW0TiVYbyEKDatq2E/n2UVDloKRME/OCH8+CMOP
	1OCiX1ZxN0DiMDL4Sy1ovaUliIbRbDhtgMvw/Q+DyzmV1U7ANHrG2/Re1hQRDYBg
	G7Tv57VI5B0HpD9XcyOt4sX3up6OQoTPJfh53VrxVgssak0Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw5kkegk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 07:37:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4537bAqe013568
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 07:37:10 GMT
Received: from hu-deesin-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Jun 2024 00:37:06 -0700
From: Deepak Kumar Singh <quic_deesin@quicinc.com>
To: <quic_bjorande@quicinc.com>, <andersson@kernel.org>,
        <quic_clew@quicinc.com>, <mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <quic_sarannya@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        "Deepak
 Kumar Singh" <quic_deesin@quicinc.com>
Subject: [PATCH V1] rpmsg: glink: Make glink smem interrupt wakeup capable
Date: Mon, 3 Jun 2024 13:06:48 +0530
Message-ID: <20240603073648.3475123-1-quic_deesin@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sr0nk5k29uS2yIlRr3w11-nlJf5Hd-sf
X-Proofpoint-ORIG-GUID: sr0nk5k29uS2yIlRr3w11-nlJf5Hd-sf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_04,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1011 phishscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 mlxlogscore=716 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030063

There are certain usecases which require glink interrupt to be
wakeup capable. For example if handset is in sleep state and
usb charger is plugged in, dsp wakes up and sends glink interrupt
to host for glink pmic channel communication. Glink is suppose to
wakeup host processor completely for further glink data handling.
IRQF_NO_SUSPEND does not gurantee complete wakeup, system may again
enter sleep after interrupt handling and glink data may not be
handled by pmic client driver.

To ensure data handling by client configure glink smem device as
wakeup source and attach glink interrupt as wakeup irq. Remove
IRQF_NO_SUSPEND flag as it is no longer required.

Signed-off-by: Deepak Kumar Singh <quic_deesin@quicinc.com>
---
 drivers/rpmsg/qcom_glink_smem.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 7a982c60a8dd..f1b553efab13 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -22,6 +22,7 @@
 #include <linux/regmap.h>
 #include <linux/workqueue.h>
 #include <linux/list.h>
+#include <linux/pm_wakeirq.h>
 
 #include <linux/rpmsg/qcom_glink.h>
 
@@ -306,8 +307,7 @@ struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
 
 	smem->irq = of_irq_get(smem->dev.of_node, 0);
 	ret = devm_request_irq(&smem->dev, smem->irq, qcom_glink_smem_intr,
-			       IRQF_NO_SUSPEND | IRQF_NO_AUTOEN,
-			       "glink-smem", smem);
+			       IRQF_NO_AUTOEN, "glink-smem", smem);
 	if (ret) {
 		dev_err(&smem->dev, "failed to request IRQ\n");
 		goto err_put_dev;
@@ -346,6 +346,8 @@ struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
 
 	smem->glink = glink;
 
+	device_init_wakeup(dev, true);
+	dev_pm_set_wake_irq(dev, smem->irq);
 	enable_irq(smem->irq);
 
 	return smem;
@@ -365,6 +367,8 @@ void qcom_glink_smem_unregister(struct qcom_glink_smem *smem)
 	struct qcom_glink *glink = smem->glink;
 
 	disable_irq(smem->irq);
+	dev_pm_clear_wake_irq(&smem->dev);
+	device_init_wakeup(&smem->dev, false);
 
 	qcom_glink_native_remove(glink);
 
-- 
2.34.1


