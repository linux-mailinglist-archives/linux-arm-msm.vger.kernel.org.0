Return-Path: <linux-arm-msm+bounces-70885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 123C7B35ABF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 13:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13AE07B3091
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 11:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EDF329D280;
	Tue, 26 Aug 2025 11:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MNUnQ5X3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5C9199935;
	Tue, 26 Aug 2025 11:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756206594; cv=none; b=e7ml7PzhRsUX725bScvciZ3HkA2HodlQOaAdt6FU8OwinruyJp27lpEf3OydOsRi9t5CLJ16fIcdGSnjyHGVN0RHxepB7B8/FWjz3yW6l0byd4srVM/ABirfOjeFsiuxCpPsA0bU0Ot7tdxTipGTX+5mnWxriI3t1IC0CrlK6Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756206594; c=relaxed/simple;
	bh=CkeQv8JCpXRiBeQmeJclVsjkmIRNHeTxVyCEIZHQ8rQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DCElgWg0vkI5zMe0OOvr3EUG4SgBQe/Q0XmVPfPOsBBex1cRdEPBEEZ5PTlPxyLQxdJ3LOM76SUU9K7/MZ3bdGXMyMjT1lgiu2LThS7v0Kk7pz4KNYiCFvkQYh+d5oieJISxKNvArz2GqIIioIHzK/Woq3NRzMdHn/xWnqNB7vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MNUnQ5X3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q5QUxZ013270;
	Tue, 26 Aug 2025 11:09:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=09+H95LC1jngBr5AC9iW5D
	m3V6CiAv4To8aTiQJrTxI=; b=MNUnQ5X3rp/xo8H82qRgjQ5/x57h+2rnX3kuUC
	/8B4pVwZ1k6g3HhpKuXENJ1M4kOLq/ac5Fe4E2DQFcv6VlZxZSrSJSElYDfVSYrr
	onJgslfjRePHFxixLF1gIZO3nHvNI1GL82+QaaK5B5dmtuDu+ypdscaEmWwHCmRp
	X478Enjh83ZbCkZfLHJmkJidqVL9hcwNb1TuPcqZxEtEJRG8GG8f0UShrM2GZ4Je
	olPy/n/Cjgi+F17tGWEOhrUJ3gxccLjPE0k5GjrjBMwQC7JFxAHd1q27LDTz2nAa
	GnmKEPqdv3fcE4SBsvgL3ATJkOLBO2ul4Ep7w8oErPl6T9eA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xprphh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 11:09:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57QB9j1t012202
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 11:09:45 GMT
Received: from hu-utiwari-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 26 Aug 2025 04:09:42 -0700
From: <quic_utiwari@quicinc.com>
To: <herbert@gondor.apana.org.au>, <thara.gopinath@gmail.com>,
        <davem@davemloft.net>
CC: <linux-crypto@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_neersoni@quicinc.com>,
        <quic_kuldsing@quicinc.com>, <quic_gaurkash@quicinc.com>
Subject: [PATCH v2] crypto: qce - Add runtime PM and interconnect bandwidth scaling support
Date: Tue, 26 Aug 2025 16:39:17 +0530
Message-ID: <20250826110917.3383061-1-quic_utiwari@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68ad95f9 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=gfq5eMhS0q4ALXmgQ6sA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 2ztlS_nzhQaM33PpZ_r-n1R9_lc-9BQn
X-Proofpoint-ORIG-GUID: 2ztlS_nzhQaM33PpZ_r-n1R9_lc-9BQn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX64+Q3TqHQmz1
 X3o10Q8C6eQCiZNDbYTRF2/KdM8W/0SMSSOoq2x3heea+8ZVkr9vXw0C1a9YbaFaxNmeLyv/Kly
 QdzAD/ZzmxM0ZHXSvDyWPtB0hd3dsg4ZaocbaYbcAAA3RIpq0tzQfTNWMPJACCh5GY/8rr/FqOG
 hTjccLMEp8CnzWukqkzD+1Qv7iK6POi0O8rfnmPSJL9GonN3VfmNuwOIUx6sN9o4fTXR2KasfOT
 Wlj2idq+yGe7OR9GmHzTnIrDohOu8fdm8EC8zCyRnF4WEO7MNIg/Ae3GqCk7KtL5apLdz5kaP8f
 om5l3kIcm09hrg/vIDu2m3TyLH9Ht157RpADN4aqDPTWGxTw/+nmQUQKxO7LZkg4ir/lBxv9WWA
 TnMMtIis
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

From: Udit Tiwari <quic_utiwari@quicinc.com>

The Qualcomm Crypto Engine (QCE) driver currently lacks support for
runtime power management (PM) and interconnect bandwidth control.
As a result, the hardware remains fully powered and clocks stay
enabled even when the device is idle. Additionally, static
interconnect bandwidth votes are held indefinitely, preventing the
system from reclaiming unused bandwidth.

Address this by enabling runtime PM and dynamic interconnect
bandwidth scaling to allow the system to suspend the device when idle
and scale interconnect usage based on actual demand. Improve overall
system efficiency by reducing power usage and optimizing interconnect
resource allocation.

Make the following changes as part of this integration:

- Add support for pm_runtime APIs to manage device power state
  transitions.
- Implement runtime_suspend() and runtime_resume() callbacks to gate
  clocks and vote for interconnect bandwidth only when needed.
- Replace devm_clk_get_optional_enabled() with
  devm_clk_get_optional() and move clock enabling to the resume path.
- Register dev_pm_ops with the platform driver to hook into the PM
  framework.

Tested:

- Verify that ICC votes drop to zero after probe and upon request
  completion.
- Confirm that runtime PM usage count increments during active
  requests and decrements afterward.
- Observe that the device correctly enters the suspended state when
  idle.

Signed-off-by: Udit Tiwari <quic_utiwari@quicinc.com>
---
Changes in v2:
- Extend suspend/resume support to include runtime PM and ICC scaling.
- Register dev_pm_ops and implement runtime_suspend/resume callbacks.
- Link to v1: https://lore.kernel.org/lkml/20250606105808.2119280-1-quic_utiwari@quicinc.com/
---
 drivers/crypto/qce/core.c | 120 ++++++++++++++++++++++++++++++++++----
 1 file changed, 108 insertions(+), 12 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index e95e84486d9a..70b9d9e739be 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/types.h>
 #include <crypto/algapi.h>
 #include <crypto/internal/hash.h>
@@ -91,22 +92,28 @@ static int qce_handle_queue(struct qce_device *qce,
 	struct crypto_async_request *async_req, *backlog;
 	int ret = 0, err;
 
+	ret = pm_runtime_get_sync(qce->dev);
+	if (ret < 0) {
+		pr_err("error with pm_runtime_get_sync");
+		pm_runtime_put_noidle(qce->dev);
+		return ret;
+	}
+
 	scoped_guard(mutex, &qce->lock) {
 		if (req)
 			ret = crypto_enqueue_request(&qce->queue, req);
 
 		/* busy, do not dequeue request */
 		if (qce->req)
-			return ret;
+			goto qce_suspend;
 
 		backlog = crypto_get_backlog(&qce->queue);
 		async_req = crypto_dequeue_request(&qce->queue);
 		if (async_req)
 			qce->req = async_req;
 	}
-
 	if (!async_req)
-		return ret;
+		goto qce_suspend;
 
 	if (backlog) {
 		scoped_guard(mutex, &qce->lock)
@@ -119,6 +126,8 @@ static int qce_handle_queue(struct qce_device *qce,
 		schedule_work(&qce->done_work);
 	}
 
+qce_suspend:
+	pm_runtime_put_autosuspend(qce->dev);
 	return ret;
 }
 
@@ -208,37 +217,43 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	qce->core = devm_clk_get_optional_enabled(qce->dev, "core");
+	qce->core = devm_clk_get_optional(dev, "core");
 	if (IS_ERR(qce->core))
 		return PTR_ERR(qce->core);
 
-	qce->iface = devm_clk_get_optional_enabled(qce->dev, "iface");
+	qce->iface = devm_clk_get_optional(dev, "iface");
 	if (IS_ERR(qce->iface))
 		return PTR_ERR(qce->iface);
 
-	qce->bus = devm_clk_get_optional_enabled(qce->dev, "bus");
+	qce->bus = devm_clk_get_optional(dev, "bus");
 	if (IS_ERR(qce->bus))
 		return PTR_ERR(qce->bus);
 
-	qce->mem_path = devm_of_icc_get(qce->dev, "memory");
+	qce->mem_path = devm_of_icc_get(dev, "memory");
 	if (IS_ERR(qce->mem_path))
 		return PTR_ERR(qce->mem_path);
 
-	ret = icc_set_bw(qce->mem_path, QCE_DEFAULT_MEM_BANDWIDTH, QCE_DEFAULT_MEM_BANDWIDTH);
+	/* Enable runtime PM after clocks and ICC are acquired */
+
+	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		return ret;
 
-	ret = devm_qce_dma_request(qce->dev, &qce->dma);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
 		return ret;
 
+	ret = devm_qce_dma_request(qce->dev, &qce->dma);
+	if (ret)
+		goto err_pm;
+
 	ret = qce_check_version(qce);
 	if (ret)
-		return ret;
+		goto err_pm;
 
 	ret = devm_mutex_init(qce->dev, &qce->lock);
 	if (ret)
-		return ret;
+		goto err_pm;
 
 	INIT_WORK(&qce->done_work, qce_req_done_work);
 	crypto_init_queue(&qce->queue, QCE_QUEUE_LENGTH);
@@ -246,9 +261,89 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
-	return devm_qce_register_algs(qce);
+	ret = devm_qce_register_algs(qce);
+	if (ret)
+		goto err_pm;
+
+	/* Configure autosuspend after successful init */
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return 0;
+
+err_pm:
+	pm_runtime_put(dev);
+
+	return ret;
+}
+
+static int qce_runtime_suspend(struct device *dev)
+{
+	struct qce_device *qce = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(qce->bus);
+	clk_disable_unprepare(qce->iface);
+	clk_disable_unprepare(qce->core);
+	icc_disable(qce->mem_path);
+
+	return 0;
+}
+
+static int qce_runtime_resume(struct device *dev)
+{
+	struct qce_device *qce = dev_get_drvdata(dev);
+	int ret = 0;
+
+	ret = icc_enable(qce->mem_path);
+	if (ret)
+		return ret;
+
+	ret = icc_set_bw(qce->mem_path, QCE_DEFAULT_MEM_BANDWIDTH, QCE_DEFAULT_MEM_BANDWIDTH);
+	if (ret)
+		goto err_icc;
+
+	ret = clk_prepare_enable(qce->core);
+	if (ret)
+		goto err_icc;
+
+	ret = clk_prepare_enable(qce->iface);
+	if (ret)
+		goto err_core;
+
+	ret = clk_prepare_enable(qce->bus);
+	if (ret)
+		goto err_iface;
+
+	return 0;
+
+err_iface:
+	clk_disable_unprepare(qce->iface);
+err_core:
+	clk_disable_unprepare(qce->core);
+err_icc:
+	icc_disable(qce->mem_path);
+	return ret;
 }
 
+static int qce_suspend(struct device *dev)
+{
+	return qce_runtime_suspend(dev);
+}
+
+static int qce_resume(struct device *dev)
+{
+	return qce_runtime_resume(dev);
+}
+
+static const struct dev_pm_ops qce_crypto_pm_ops = {
+	.runtime_suspend = qce_runtime_suspend,
+	.runtime_resume  = qce_runtime_resume,
+	.suspend         = qce_suspend,
+	.resume          = qce_resume,
+};
+
 static const struct of_device_id qce_crypto_of_match[] = {
 	{ .compatible = "qcom,crypto-v5.1", },
 	{ .compatible = "qcom,crypto-v5.4", },
@@ -262,6 +357,7 @@ static struct platform_driver qce_crypto_driver = {
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.of_match_table = qce_crypto_of_match,
+		.pm = &qce_crypto_pm_ops,
 	},
 };
 module_platform_driver(qce_crypto_driver);
-- 
2.34.1


