Return-Path: <linux-arm-msm+bounces-82614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F2163C72584
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 07:29:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8CFD04E77AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 06:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B8F2F6160;
	Thu, 20 Nov 2025 06:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Yg1g4UIR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E242DECD2;
	Thu, 20 Nov 2025 06:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763619911; cv=none; b=HnS/TNNupiC3Na6zEfRyViqwxQ1gM+86bo7LAC/yTO56posS0V6ACEYyLTv8zx1nlLT2Rt5/K9SHvmTap7dQLpZyjKrlic2+MlM7Gggn0su1kMirulofWBw6k/pmej97yjzOwq6b5PeHfYYVQHALB2y9KRKbWHqENCFSJR1Vdh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763619911; c=relaxed/simple;
	bh=24/4EwMfY2f7465Cyam41CVmzrHz5CcrlMxrLmS0Xns=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ecmVycFLWir9iLK7DfRPHlyW1LDhD5PZpZpzFNzhvOcdwHqn4sZ3k5fmzVH16LbY9sGVcaywIM3/7cz2befyM7sZes2mqeFqS8KMGojaXF9hR6ZqZ/OOAOJtfThTr3huLIWqsmuxHw7I56sVZS4aCh60+zfcQxdPzaZM4XVBok8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Yg1g4UIR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK64IrG3925993;
	Thu, 20 Nov 2025 06:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hyVxV7yR/QWeZeAzmOTtMw
	ls/oLG4k6t5fu24Py0I5k=; b=Yg1g4UIREHyyDXx7Zigb0hsvQ7rGw8loK21nuU
	CMqDsAuSD3BlsmxD8XNQgHd6iqvjy4igMGkD9ycOgxlRkrhlUgfCdsCMOGgy1r3k
	0qtE0M6x/ISGXocjRMziPwoN/U2j7mrJyNPPQdTlG/9AOIlSe6kXBnUl8fiImgp1
	jd3UdvGH4670Ma5t8F+wOPtsTMGDqI5miEY9rU2AZnyx13Cf+rgIwRwvXTs+el9q
	8TYrKaifjCkLM14KEr4Ul5/HHiVuMO7SWVoRaLHFTpLW7FxXgYVa9xm2TxTLuTYR
	xYtHAI8irDWoK/QjAxg7dOLzIs8WxIgvXLOTLSShXS4gq0bw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahwd781nh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 06:25:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AK6P4Y1012817
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 06:25:04 GMT
Received: from hu-utiwari-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 19 Nov 2025 22:25:01 -0800
From: <quic_utiwari@quicinc.com>
To: <konrad.dybcio@oss.qualcomm.com>, <herbert@gondor.apana.org.au>,
        <thara.gopinath@gmail.com>, <davem@davemloft.net>
CC: <linux-crypto@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_neersoni@quicinc.com>
Subject: [PATCH v5] crypto: qce - Add runtime PM and interconnect bandwidth scaling support
Date: Thu, 20 Nov 2025 11:54:43 +0530
Message-ID: <20251120062443.2016084-1-quic_utiwari@quicinc.com>
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
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=691eb441 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=tY3p4qJyD-uLZWqq6sMA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Uc6Jp052qTlDkaFUboa9yNrVLLweSxhf
X-Proofpoint-GUID: Uc6Jp052qTlDkaFUboa9yNrVLLweSxhf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDAzNiBTYWx0ZWRfX+AInOhd1AyoZ
 iZbXvw3vg6ANPkVRNulj20Q8k1lDYvdKul6N/rV/z+MdOEGyrhwLcYK8ucVsqs4N96Z0uGtLTnp
 LuqqYjZwwmrlhIXnGO8x1SNHzPFh5oqEn9JKjRgcN0FFW5MqVGYl5N1+MPM6KVBUKJD4TvRWOCI
 OoZ4EyTMsZA2/8s1djeB4Kd2N+NbPe3TEJseuUF0Bc+n7WQXAo57Lh6q0GfMNEwwvxugc/JoJXA
 CX1IYZusOh77u3tTHCgo0qC6LofE+IUwXCBQ3O08fZ+aACJB3RI+LEZFsmg7piYLErRBpBtrmT+
 pxFkNTrMIafVyIaYjre5MtdpdIUbcuKcQMj+Q0ZYLbj6D9wAMVWllUUfeXjqeAUIgurw4fXS95p
 LADcIdg7WXxXdjAgBhpf46xwMykktQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200036

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
Changes in v5:
- Drop Reported-by and Closes tags for kernel test robot W=1 warnings, as
  the issue was fixed within the same patch series.
- Fix a minor comment indentation/style issue.

Changes in v4:
- Annotate runtime PM callbacks with __maybe_unused to silence W=1 warnings.
- Add Reported-by and Closes tags for kernel test robot warning.

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
 drivers/crypto/qce/core.c | 103 +++++++++++++++++++++++++++++++-------
 1 file changed, 86 insertions(+), 17 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index b966f3365b7d..2f07cc479998 100644
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
 
@@ -207,37 +216,47 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	qce->core = devm_clk_get_optional_enabled(qce->dev, "core");
-	if (IS_ERR(qce->core))
-		return PTR_ERR(qce->core);
+	/* PM clock helpers: register device clocks */
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
@@ -245,9 +264,58 @@ static int qce_crypto_probe(struct platform_device *pdev)
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
+static int __maybe_unused qce_runtime_suspend(struct device *dev)
+{
+	struct qce_device *qce = dev_get_drvdata(dev);
+
+	icc_disable(qce->mem_path);
+
+	return 0;
+}
+
+static int __maybe_unused qce_runtime_resume(struct device *dev)
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
 }
 
+static const struct dev_pm_ops qce_crypto_pm_ops = {
+	SET_RUNTIME_PM_OPS(qce_runtime_suspend, qce_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+};
+
 static const struct of_device_id qce_crypto_of_match[] = {
 	{ .compatible = "qcom,crypto-v5.1", },
 	{ .compatible = "qcom,crypto-v5.4", },
@@ -261,6 +329,7 @@ static struct platform_driver qce_crypto_driver = {
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.of_match_table = qce_crypto_of_match,
+		.pm = &qce_crypto_pm_ops,
 	},
 };
 module_platform_driver(qce_crypto_driver);
-- 
2.34.1


