Return-Path: <linux-arm-msm+bounces-81934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 01399C6019C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 09:50:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8BBA64E159D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 08:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE91D1E1C02;
	Sat, 15 Nov 2025 08:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FqOAo04y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9A83594F;
	Sat, 15 Nov 2025 08:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763196599; cv=none; b=TMVjYmTmgizgkXMG7/mIo56LNhWrJqQF8tomWWU9rBThtmITzRbypmGj6rKEUcX1Alk9U+TrDNDq29+1T+Ja8yGaEMtiysA2ZR2XYXAUghi1V1s/V2RqTXG9ENLnxUXt/E1Cg+USTJBUsp2QIZspEoMCc/cmVaxtYvQA8L5ncwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763196599; c=relaxed/simple;
	bh=WPeZ2K9xwtPxTbsXplpRKYXcSleJmAUeDkSfkT08GQ8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j4uEzAs1JlKKgErXa0mNtfzFiE0W4OPggspJZaCOBtE5fHSn12ibVBZ7G8HwQgTG/Twn/OIT1eoNQG1d/eUHSqoei6eYmvdNVRB0PbDmhQWKJT8UAC+FB03KI4kOhfYbmRhZuP9Knh8y5nB2u9S81kCjcN9GulR9/C55AoCPmxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FqOAo04y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AF4T1Ic1292054;
	Sat, 15 Nov 2025 08:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YB+XuaY7R6m8H1sXldfmD8
	Pyhrmey7X5nIWEhzrSI6w=; b=FqOAo04yB/7+QTGIorCUne8645WC4A/hZgkVJe
	cFdIMFwjCMmqPKUh9128oCCHJ8TfHmjqPrrS3/jN1Nav3888p9tZJS+qoQX0ZGh7
	vU1G0GRF3Jixo1t7r8GpxkYGoyUNTJRl7B2eWdxaHY2cBs/CMIdtRY8yVWESKHiS
	KqYzejNr1nV6J3OCy92nalr3gPuff60SXQPZbBFfFQTLJ0ZHdrZkC2BSWfAMMObA
	itTSyG03aocCMalSPXEwxYGbsY9CtT6D9qGeC54JYeCYtzszMuiHLtTrXOMTRk9u
	Fc8Hy8IcBXtJ9M1cQWiKgtdQ7GAL9eyLNdERfXGmAHQDkCCw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejh08a0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Nov 2025 08:49:46 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AF8njPj003170
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Nov 2025 08:49:45 GMT
Received: from hu-utiwari-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sat, 15 Nov 2025 00:49:43 -0800
From: <quic_utiwari@quicinc.com>
To: <herbert@gondor.apana.org.au>, <thara.gopinath@gmail.com>,
        <davem@davemloft.net>
CC: <linux-crypto@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_neersoni@quicinc.com>
Subject: [PATCH v3] crypto: qce - Add runtime PM and interconnect bandwidth scaling support
Date: Sat, 15 Nov 2025 14:18:51 +0530
Message-ID: <20251115084851.2750446-1-quic_utiwari@quicinc.com>
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
X-Proofpoint-ORIG-GUID: i_bS2geTWCKFnsp32xXHMZkSsVsK7y8p
X-Authority-Analysis: v=2.4 cv=A8lh/qWG c=1 sm=1 tr=0 ts=69183eaa cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=tY3p4qJyD-uLZWqq6sMA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: i_bS2geTWCKFnsp32xXHMZkSsVsK7y8p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDA3MCBTYWx0ZWRfX9N1qBSrCY1mx
 E+n7tJtSc5Zy99gykPOQp6bWdQ244E4kk5WtPKbviUwVWTMy/bZjaDYjuEyif/u4hTsipluTpBT
 CwKBjJEQpqFH5XtLR4+lZVQybLP5XUqbkupXShKRDpGXOMoxEC2t0R4wbTzKbXksUVh4IH0+yhj
 CfBAaBMpDsdrb7s792qbuJ7hfjZspV2fs3fhSnqrdqQHocGeiH20KKpYCLgGLuoBzr7uYNfSqZO
 dq8AZNAZrQclIFmWn5MZ4XWQvHsEKKTwtQA3WZvrfRZxxAGTJH3M4XxtOGAnA9psZqIBYQGk4lF
 bBVFFowKUW9orMWINmCGZLowCvLky+DXybRSl+m38fLEwFLde/qvB17yh8QOxsW37oKb8CTm7Kt
 26S97dPrDyQ2TzeBzm9LaMH3gJdROw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-15_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511150070

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
- Replace devm_clk_get_optional_enabled() with devm_pm_clk_create() +
  pm_clk_add() and let the PM core manage device clocks during runtime
  PM and system sleep.
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
Changes in v3:
- Switch from manual clock management to PM clock helpers
  (devm_pm_clk_create() + pm_clk_add()); no direct clk_* enable/disable
  in runtime callbacks.
- Replace pm_runtime_get_sync() with pm_runtime_resume_and_get(); remove
  pm_runtime_put_noidle() on error.
- Define PM ops using helper macros and reuse runtime callbacks for system
  sleep via pm_runtime_force_suspend()/pm_runtime_force_resume().
- Link to v2: https://lore.kernel.org/lkml/20250826110917.3383061-1-quic_utiwari@quicinc.com/

Changes in v2:
- Extend suspend/resume support to include runtime PM and ICC scaling.
- Register dev_pm_ops and implement runtime_suspend/resume callbacks.
- Link to v1: https://lore.kernel.org/lkml/20250606105808.2119280-1-quic_utiwari@quicinc.com/
---
 drivers/crypto/qce/core.c | 104 +++++++++++++++++++++++++++++++-------
 1 file changed, 87 insertions(+), 17 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index b966f3365b7d..726c162f6ee7 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -12,6 +12,9 @@
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+#include <linux/pm_clock.h>
 #include <linux/types.h>
 #include <crypto/algapi.h>
 #include <crypto/internal/hash.h>
@@ -90,13 +93,17 @@ static int qce_handle_queue(struct qce_device *qce,
 	struct crypto_async_request *async_req, *backlog;
 	int ret = 0, err;
 
+	ret = pm_runtime_resume_and_get(qce->dev);
+	if (ret < 0)
+		return ret;
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
@@ -105,7 +112,7 @@ static int qce_handle_queue(struct qce_device *qce,
 	}
 
 	if (!async_req)
-		return ret;
+		goto qce_suspend;
 
 	if (backlog) {
 		scoped_guard(mutex, &qce->lock)
@@ -118,6 +125,8 @@ static int qce_handle_queue(struct qce_device *qce,
 		schedule_work(&qce->done_work);
 	}
 
+qce_suspend:
+	pm_runtime_put_autosuspend(qce->dev);
 	return ret;
 }
 
@@ -207,37 +216,48 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	qce->core = devm_clk_get_optional_enabled(qce->dev, "core");
-	if (IS_ERR(qce->core))
-		return PTR_ERR(qce->core);
+/* PM clock helpers: register device clocks */
+	ret = devm_pm_clk_create(dev);
+	if (ret)
+		return ret;
 
-	qce->iface = devm_clk_get_optional_enabled(qce->dev, "iface");
-	if (IS_ERR(qce->iface))
-		return PTR_ERR(qce->iface);
+	ret = pm_clk_add(dev, "core");
+	if (ret)
+		return ret;
 
-	qce->bus = devm_clk_get_optional_enabled(qce->dev, "bus");
-	if (IS_ERR(qce->bus))
-		return PTR_ERR(qce->bus);
+	ret = pm_clk_add(dev, "iface");
+	if (ret)
+		return ret;
 
-	qce->mem_path = devm_of_icc_get(qce->dev, "memory");
+	ret = pm_clk_add(dev, "bus");
+	if (ret)
+		return ret;
+
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
@@ -245,9 +265,58 @@ static int qce_crypto_probe(struct platform_device *pdev)
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
 }
 
+static int qce_runtime_suspend(struct device *dev)
+{
+	struct qce_device *qce = dev_get_drvdata(dev);
+
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
+	return 0;
+
+err_icc:
+	icc_disable(qce->mem_path);
+	return ret;
+}
+
+static const struct dev_pm_ops qce_crypto_pm_ops = {
+	SET_RUNTIME_PM_OPS(qce_runtime_suspend, qce_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+};
+
 static const struct of_device_id qce_crypto_of_match[] = {
 	{ .compatible = "qcom,crypto-v5.1", },
 	{ .compatible = "qcom,crypto-v5.4", },
@@ -261,6 +330,7 @@ static struct platform_driver qce_crypto_driver = {
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.of_match_table = qce_crypto_of_match,
+		.pm = &qce_crypto_pm_ops,
 	},
 };
 module_platform_driver(qce_crypto_driver);
-- 
2.34.1


