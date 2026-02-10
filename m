Return-Path: <linux-arm-msm+bounces-92409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIVQF+vMimndNwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 07:15:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E7F11750A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 07:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AC5B300A765
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 06:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051CD32B9AE;
	Tue, 10 Feb 2026 06:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bA0kx4VB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655EC32B983;
	Tue, 10 Feb 2026 06:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770704103; cv=none; b=QN/eDknWoYrrh8etWgNsDB4xjVilAZPM0PDr/9/2/0CN5uLpX8og/Gp6N3fRG69cINaXsfXqUQK9LkEH/3c/XSpEL6OW3plcbjg0MhpQGJ23/dZB7Y6Ly+YeNPcDyst1Emy2FPZ8tkaFzkk9RZeDsCPUSbBppxkAoAkEFlQOLGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770704103; c=relaxed/simple;
	bh=cX3G6q3zRwBTX6CaCzC0f872taJV7Egp8MXV9kgRDxw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NNGByQEWhLfq8KYKaS0HVVCyqJJkQLnSGkoXrBuVJXrIjna9bI0TkVIsYeyqNH1/qHs1HF4kXvRf6BYI1EYDLRp43Vp5tZJ7c1ftxzAR23AIJ12opEWpWYoeuHSy8Q9wC94+T7NB/t3mjNI23vN1L+essQtJaOlGajbFWDqBrHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bA0kx4VB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A53i5Y801095;
	Tue, 10 Feb 2026 06:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=01+gzjkAVfY+zxJPrcftUM
	6fYNSdr/4DZKjfqOgyfjM=; b=bA0kx4VBV/rhvNqotAiKQu/AKgAwY74xpqqUOj
	Vhp5lWMkQW6JliIAC4xGxQyS8POffpc96mMabSrXrFVzPhsWkuKEBvFqssCYKyuw
	IFy2d9IHXazCvJY0RD7fZbp3ElGGjv2R+tCwp+Jah0X4Nt2viDK1RdPllblIDNym
	y6kyY4Xf8jOOQmpBUsjo5sip0OjTb1ebQB5kw+T8gerqESe8CmleVP5zvPv/H/76
	ncjVn9I3/VErZqo8gZIsGjYE+pJyCumZUoKo06vE0jssPrH3hSXwLqA1G1N5lmVZ
	f4rgk+xoq82W0mQ4pEwXesqtbepKAX5Heqmagz5V9QRUiMsg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7x6u06d4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Feb 2026 06:14:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 61A6EtLi007840
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Feb 2026 06:14:55 GMT
Received: from hu-utiwari-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 9 Feb 2026 22:14:51 -0800
From: <quic_utiwari@quicinc.com>
To: <konrad.dybcio@oss.qualcomm.com>, <herbert@gondor.apana.org.au>,
        <thara.gopinath@gmail.com>, <davem@davemloft.net>
CC: <linux-crypto@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_neersoni@quicinc.com>,
        <quic_kuldsing@quicinc.com>
Subject: [PATCH v6] crypto: qce - Add runtime PM and interconnect bandwidth scaling support
Date: Tue, 10 Feb 2026 11:44:37 +0530
Message-ID: <20260210061437.2293654-1-quic_utiwari@quicinc.com>
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
X-Proofpoint-GUID: _Iq4mG6d_36xi-4UVPOjvKcaJ8Pn65Mh
X-Proofpoint-ORIG-GUID: _Iq4mG6d_36xi-4UVPOjvKcaJ8Pn65Mh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA1MCBTYWx0ZWRfX0Gu1xERLXh52
 ddP/EmDV2kDrkztA1dgfdzCRgQUCpYRmaNVTNFiPCNZaL6Y+YaxTYctYcT7B8PVNl37PChlkNjt
 jhL3NSp/cfyzWn2WPPDjkI5IXPpX2zz7F+GRMsZDe4SSncLZdupNB0cviGr90ILlk2FRkcHOqlN
 xHJ2MGc348RYQXbtPwnYJDLOJbhaDPbKQEFwzjnv1scKBlJn/7H71BCYgUPaOmDvaNxdYIs35dr
 u/LKIVyGC3L6tabObuVvuMvST9dMkFgYbDQlRgbDrgPRjMSmIWdRpKJGi+wdE0HDskAnzO7u2H6
 8A2n5y/ETzPMxMADF5UCEZCwQfKr/YaFs3Uf7XgZaoPuvp99gk4lXxOqdm1V4J4/t515tVPQ3aT
 U1M4whEFKDgBm0OTj3JWzGL+dMC5GA70zUvV55/pDCheP3oc/hhG1T3l3qeFduKY+sNkwuQYN8E
 yVRR+/WotOJRNWr2e2Q==
X-Authority-Analysis: v=2.4 cv=YfmwJgRf c=1 sm=1 tr=0 ts=698acce0 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=HUPvR95Ouy4MFf8pceUA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100050
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92409-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,gmail.com,davemloft.net];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_utiwari@quicinc.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A2E7F11750A
X-Rspamd-Action: no action

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
Changes in v6:
- Adopt ACQUIRE(pm_runtime_active_try, ...) for scoped runtime PM management
  in qce_handle_queue(). This removes the need for manual put calls and
  goto labels in the error paths, as suggested by Konrad.

Changes in v5:
- Drop Reported-by and Closes tags for kernel test robot W=1 warnings, as
  the issue was fixed within the same patch series.
- Fix a minor comment indentation/style issue.
- Link to v5: https://lore.kernel.org/lkml/20251120062443.2016084-1-quic_utiwari@quicinc.com/

Changes in v4:
- Annotate runtime PM callbacks with __maybe_unused to silence W=1 warnings.
- Add Reported-by and Closes tags for kernel test robot warning.
- Link to v4: https://lore.kernel.org/lkml/20251117062737.3946074-1-quic_utiwari@quicinc.com/

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
 drivers/crypto/qce/core.c | 98 +++++++++++++++++++++++++++++++++------
 1 file changed, 83 insertions(+), 15 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index b966f3365b7d..2e1e4db93682 100644
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
@@ -90,6 +93,11 @@ static int qce_handle_queue(struct qce_device *qce,
 	struct crypto_async_request *async_req, *backlog;
 	int ret = 0, err;
 
+	ACQUIRE(pm_runtime_active_try, pm)(qce->dev);
+	ret = ACQUIRE_ERR(pm_runtime_active_auto_try, &pm);
+	if (ret)
+		return ret;
+
 	scoped_guard(mutex, &qce->lock) {
 		if (req)
 			ret = crypto_enqueue_request(&qce->queue, req);
@@ -207,37 +215,47 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	qce->core = devm_clk_get_optional_enabled(qce->dev, "core");
-	if (IS_ERR(qce->core))
-		return PTR_ERR(qce->core);
+	/* PM clock helpers: register device clocks */
+	ret = devm_pm_clk_create(dev);
+	if (ret)
+		return ret;
+
+	ret = pm_clk_add(dev, "core");
+	if (ret)
+		return ret;
 
-	qce->iface = devm_clk_get_optional_enabled(qce->dev, "iface");
-	if (IS_ERR(qce->iface))
-		return PTR_ERR(qce->iface);
+	ret = pm_clk_add(dev, "iface");
+	if (ret)
+		return ret;
 
-	qce->bus = devm_clk_get_optional_enabled(qce->dev, "bus");
-	if (IS_ERR(qce->bus))
-		return PTR_ERR(qce->bus);
+	ret = pm_clk_add(dev, "bus");
+	if (ret)
+		return ret;
 
-	qce->mem_path = devm_of_icc_get(qce->dev, "memory");
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
@@ -245,9 +263,58 @@ static int qce_crypto_probe(struct platform_device *pdev)
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
 }
 
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
@@ -261,6 +328,7 @@ static struct platform_driver qce_crypto_driver = {
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.of_match_table = qce_crypto_of_match,
+		.pm = &qce_crypto_pm_ops,
 	},
 };
 module_platform_driver(qce_crypto_driver);
-- 
2.34.1


