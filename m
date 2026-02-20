Return-Path: <linux-arm-msm+bounces-93458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OyBJjwNmGlF/gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 08:29:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8B416544C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 08:28:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3F2B6300443F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 07:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C96331A4B;
	Fri, 20 Feb 2026 07:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BqaysPY9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2621315793;
	Fri, 20 Feb 2026 07:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771572535; cv=none; b=I+hPKajv+5TnKZWjxYF081Vlarf+2bVPrRLpjNin7Lna9dAC2/zJP2IIdtpmg/ZXsDTUdUFCQxlqPJziS7Ri0PF6zi6sAY0wGvnmeXrHltYJ/8XRNGg4f2OeMiNyeDda4G9eR56nVLPx+x0iRfuFu6keA0oSEvC5GAgchVeoZe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771572535; c=relaxed/simple;
	bh=1+5uWV0n9MfffP4DHGOhg63kVFPBHl2PY9yZvMx7vqY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e4FG8QEcIsNTSSP+ceYHAfnS20ntSSYWAh09kgWi8lFaDqIUIGGW3U1q6SRfSy0PN5cEyPr4Jt3LRa+CvbzRsqI+UVa/ECI5+ZOVVxAnBZNsyjeODr/7eXEHVrvz40STTsSHGYSS/rWWLOKJ7ECTv3ejLSN7nsy+4bDOrbnwDvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BqaysPY9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5SJGk2380873;
	Fri, 20 Feb 2026 07:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9aCQNjqRlo1QXlDE4Kpjsw
	45ZhfYEFhie75EX5cRAV8=; b=BqaysPY9qu5iVO7wWEWqL064lz04wgJ3lzDN2d
	twwULGzeOpGWTYcWodWOIkDyXdn0BEVdMytnnpBZyIqNSACH7N1rnSIgCt1Lhtsj
	tvIpXAR8tgP1g8APKY0AiAfqR4Irqx+TLE5TB8y89A99MmsPQLAx85aw7QizN2KF
	JGfKpnW/2lBtPu8mDEf4PaEFX/+i0GQ30CnnmsAZUDK3X3RTd8U1pmboorWycvVt
	K3E1IQ4DE6C43XGWaTlBRe3QNU7MUHEOztNeypu3uOhrVWr41221Bt3sfftthDCw
	K3EwkrTJmHjATbaYLnsHfB9UVUtfj6bOC6y04FWuqkoWUkVg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cechh8ycr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Feb 2026 07:28:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 61K7Skj0019673
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Feb 2026 07:28:46 GMT
Received: from hu-utiwari-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 19 Feb 2026 23:28:43 -0800
From: <quic_utiwari@quicinc.com>
To: <konrad.dybcio@oss.qualcomm.com>, <herbert@gondor.apana.org.au>,
        <thara.gopinath@gmail.com>, <davem@davemloft.net>
CC: <linux-crypto@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_neersoni@quicinc.com>,
        <quic_utiwari@quicinc.com>
Subject: [PATCH v7] crypto: qce - Add runtime PM and interconnect bandwidth scaling support
Date: Fri, 20 Feb 2026 12:58:18 +0530
Message-ID: <20260220072818.2921517-1-quic_utiwari@quicinc.com>
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
X-Proofpoint-GUID: QQ1hI3qG8i579mXomr2Pm_O3zTiqWmx2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA2NCBTYWx0ZWRfX1bCdc1t8yE2c
 FY2JLzvy8UV1Ih4J5Bj7+XK1IxfVgWe4fkWtspdaOFjqNNgzIwb/8U3I9+rB2TO5PYW7X0F4ono
 QCQ4ULhoEts5BpIgXruWbmey2ZXVU42L2h4vaLQyq+NfzNNnkzcYv49Qm0zK7qWyvhLCM6RYDe1
 kAT9p5lPImo0B0n4B9DkKU4lhyoz+kXyTQ/DANGOIwRJw/t8nFvyklmmYPt/wwTgqwUXXqWFTlP
 NATCl08+Ja3p3zZxJW4dsIWed4fghyBtrP+7/Xp0fb0djFESAwBPt37xZEM41K/CaDINXjzbJa2
 Rh5Yzu7KiHhiNcXPe5raiWkkGi9NJY1m5vSwCs/Rd3qUR5BKc5REku/rQ50i89Skz3aP0xIJZrC
 rMG9UwS3GgNSGHtqpCGsp/teHhPGB+DgU70ota5Rkk7GBU2E3lqSai/2ja/1Fi68U6RAylno5/8
 va6jhv6p45VdehJZJvA==
X-Proofpoint-ORIG-GUID: QQ1hI3qG8i579mXomr2Pm_O3zTiqWmx2
X-Authority-Analysis: v=2.4 cv=KYzfcAYD c=1 sm=1 tr=0 ts=69980d2f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=HUPvR95Ouy4MFf8pceUA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_06,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602200064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,gmail.com,davemloft.net];
	TAGGED_FROM(0.00)[bounces-93458-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_utiwari@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:mid,quicinc.com:dkim,quicinc.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BF8B416544C
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
Changes in v7:
- Use ACQUIRE guard in probe to simplify runtime PM management and error paths.
- Drop redundant icc_enable() call in runtime resume path.
- Explicitly call pm_clk_suspend(dev) and pm_clk_resume(dev) within the 
  custom runtime PM callbacks. Since custom callbacks are provided to handle 
  interconnect scaling, the standard PM clock helpers must be invoked manually 
  to ensure clocks are gated/ungated.

Changes in v6:
- Adopt ACQUIRE(pm_runtime_active_try, ...) for scoped runtime PM management
  in qce_handle_queue(). This removes the need for manual put calls and
  goto labels in the error paths, as suggested by Konrad.
- Link to v6: https://lore.kernel.org/lkml/20260210061437.2293654-1-quic_utiwari@quicinc.com/

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
 drivers/crypto/qce/core.c | 87 +++++++++++++++++++++++++++++++++------
 1 file changed, 75 insertions(+), 12 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index b966f3365b7d..776a08340b08 100644
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
@@ -207,23 +215,34 @@ static int qce_crypto_probe(struct platform_device *pdev)
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
+	if (ret)
+		return ret;
+
+	ACQUIRE(pm_runtime_active_try, pm)(dev);
+	ret = ACQUIRE_ERR(pm_runtime_active_auto_try, &pm);
 	if (ret)
 		return ret;
 
@@ -245,9 +264,52 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
-	return devm_qce_register_algs(qce);
+	ret = devm_qce_register_algs(qce);
+	if (ret)
+		return ret;
+
+	/* Configure autosuspend after successful init */
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_mark_last_busy(dev);
+
+	return 0;
 }
 
+static int __maybe_unused qce_runtime_suspend(struct device *dev)
+{
+	struct qce_device *qce = dev_get_drvdata(dev);
+
+	icc_disable(qce->mem_path);
+
+	return pm_clk_suspend(dev);
+}
+
+static int __maybe_unused qce_runtime_resume(struct device *dev)
+{
+	struct qce_device *qce = dev_get_drvdata(dev);
+	int ret = 0;
+
+	ret = pm_clk_resume(dev);
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
+	pm_clk_suspend(dev);
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
@@ -261,6 +323,7 @@ static struct platform_driver qce_crypto_driver = {
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.of_match_table = qce_crypto_of_match,
+		.pm = &qce_crypto_pm_ops,
 	},
 };
 module_platform_driver(qce_crypto_driver);
-- 
2.34.1


