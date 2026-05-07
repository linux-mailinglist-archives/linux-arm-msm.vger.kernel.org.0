Return-Path: <linux-arm-msm+bounces-106342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNSDNZh3/Gm3QQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 13:29:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF6D4E779D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 13:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C30BE302A6AF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 11:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB3339B97A;
	Thu,  7 May 2026 11:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ciacuSRN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aASEQXpO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE3730E82B
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 11:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778153193; cv=none; b=Y20uyeo0ONEhVVP4v9OvcQK0K0XK69HhYOerWnN1jmVlkvQUjBFBEBeg95OA6wOQcQVsHls68YryfBClAIuPdCt/cd63URgfnW8/32FnKJAmTKJUF6CZrk24pcuoJ1nhwbZCIIMNihdQU2tdAvpkifQK7FSbxWL2iN6xv9LYvzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778153193; c=relaxed/simple;
	bh=k+d951Qvi+Dcbct+bPdWAZBcVUO5zA4xMaJyBHeyrMU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NJTxgqXWokNhB95ikV6YvfvClPBfvWMzzlVrbZqSk/jq4E0FMnu+V478h3ohKDb2o/OzVYcEHAWdf8m7/UyeBaKN6IpiYbSrNmtpWdIbDTj+6AUqhSFiKV4+E86LIjqIOF9j5JxGwoItJ9QrG6wH8EDG+KTcw3XHAurUTtOa3Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ciacuSRN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aASEQXpO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6479G9bW3463998
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 11:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=f6Lh5X695h3Y6NxGVDMp4XhoibCMZmokmWW
	M3MAxEng=; b=ciacuSRNFHbf9BzlD/7kk9502VEZtfrvAWrxBX/vNaOTdrXzvsN
	lYxsBsQrJiJNmlgj4oLbYIKAtrXL5NGdv2fJiZpeIdlruuGK9J5jodMlqvYjd4N/
	aqdRnW9Hj/9lHK3zlWMJsfwa5qhDW8jc73KLHyHRh5YAi9LbAB2zVSJUgHiaVvAA
	GmspbDLO5QpesQJBAfFW19t8w9BHXdUpfSyqsARl4McFHba+lrbqKZaTFdLP3HmA
	+W/V05ajdp38QK5ADrFuGHqGKT8kizfqzEQYhEGUFQxAqBwKKYkyb5nMEvdbmg3t
	aR2oa6mqR8mOECV4ud4z3T01wUWdjzs+toA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hvn1ug5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 11:26:31 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2efc342ef15so881870eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 04:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778153191; x=1778757991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f6Lh5X695h3Y6NxGVDMp4XhoibCMZmokmWWM3MAxEng=;
        b=aASEQXpOTvdyvK83pe8rLDm5wcDegeIZIaNfZKiWx42H7ZsFL8nfuO5BvWJ4hphoJk
         0+VfTWrBTesULLLkzX4WokicOrN0cqd698rSdynRtgxqCJSWT1d4EhflI9gfRimm8mX2
         Xkb/dprPwf+EHB/kvfPCuljIfZKAJ0Mj9QLAQ7Wu/QobufdQPSEMn5NBDtfHNiwXBmvZ
         lQlxay4Dh8Kyx08AHS4qnjzOwwbMphciJ7amHDxqB4hV1BsspFURsifX0+s5XkszGM9x
         AyGZ1GQLSyEzLF9+JXByBJ2e2vdlZvw/0LLaOPncYsRE7qQzhXuS+cKsL2pb0boJ5Ziv
         YCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778153191; x=1778757991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6Lh5X695h3Y6NxGVDMp4XhoibCMZmokmWWM3MAxEng=;
        b=kFZhl8v9BOvztXckzkhi8u5m/cdrrIQYTq51lxMs8V0q78kgKh3lgfOO1COi5U8ptT
         m8WE4osvhRws0bg9zdBxbplzDAyGuosE60yTMxISHYqOhUiGKkLKcPWfWY/c3n+f3fBK
         3Gkx4XeDgmo07DHySC3M89hZ3PEVzUr8xnRGdw5ll33Bency8oWDpd+xGTDEYoEYCaIz
         N5knlWtTrd8t27vih6+8REJVVP8zW4i7uV9Ao3B7CSNOIfFmpyztkPOnHTvAbfxT3y6T
         Hic/3f0wcfhEUWYUZgRQ++iVAkmTDWeA40PVtjB4SE/GN/HIBzZcUIYea1rODyXpITri
         gZVw==
X-Gm-Message-State: AOJu0YzSn6rO625w1WN3XdEafOXcA+nzuR3Wzg3jhWKuUBVQGFjh7v0e
	slpJvqnOyzcdjPCfr3gmfvKuL8T/610k2c33UubFKzeI2WoU+i/L+RZW1m826RB4isNWOiSpqdx
	98aJfQ4dRrtA5ZQ4MH5qukbZR+STPA7jR8moIlUJDUMGr3iAa0uG+M+JSJJbRqUYq+iDo
X-Gm-Gg: AeBDiet65b91WL/7G20KRWDbS+OV1Rtlf/Gm4V8E/59tXbIKeLHHXLXXE0V1HUOhfRX
	GJZeAL6lNT7Bh++qTtsIbT2a5JmEUvDivNKsAM+DGJkr1hCAvJkMcSafPjtXbILCyDCaipy6rWg
	eIDWxzVVDYuF7u8hjnJa8OhTt9bSRwjWTtb0BBG+8mvrOoORNXG+CZflumn5PUbLSIrSDcNW6eU
	2nbu6xNfIH9/ay9dCGTLp0xZDdrw5jEoDAZ2TTHGqHSYIhPx34XKSHwxR+tMKNru5b5xCczyFlk
	R8nZeQuDOfaAn8zOzdv9PGM4Wp6fzoNu90Ji9ToRCXJ/NVRu5K0JWyGjjWVK4JYD20XZVXN526Z
	I6ArxUmYzuwxx9qTLuTNaZvB/5nuOeHxSnCrN1T0MshJE84EAweGs9ycOCpNDuEfqnaIBxQuKPk
	wN4hmDKQF5abWlmxg=
X-Received: by 2002:a05:7300:641d:b0:2ed:e14:7f57 with SMTP id 5a478bee46e88-2f54e47e697mr3527363eec.33.1778153190524;
        Thu, 07 May 2026 04:26:30 -0700 (PDT)
X-Received: by 2002:a05:7300:641d:b0:2ed:e14:7f57 with SMTP id 5a478bee46e88-2f54e47e697mr3527343eec.33.1778153189933;
        Thu, 07 May 2026 04:26:29 -0700 (PDT)
Received: from u20-san1p10573.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56fd92780sm8373295eec.23.2026.05.07.04.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 04:26:29 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Subject: [PATCH v2 2/3] soc: qcom: ice: Enable PM runtime for ICE driver
Date: Thu,  7 May 2026 04:26:24 -0700
Message-Id: <20260507112626.2527413-1-linlin.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDExNCBTYWx0ZWRfXy9bBqsNvZwSx
 x6ZLaLt2P9RLvs3X0UV9Pf2NyVpQoL064QBTCBk7SF2m4Y873hPsOGEtP2PVWmyheK5OIBo1/+j
 2caI4yLR6tyEfnzDOh7N+Xq/UmUCA43O+2eQW4CKIu4xe+lGLE9ei1FfMadvFs+a8kMOrWARC62
 jehmc7FyZID5p1vnw7AmqjUT2sW75WVdCW+FwGYHuwZ8WvvsUKVWqXCW8pAdSUYZBwZPxJclY2J
 cw4ILq1uqUKOp9NElL5w3KGv5xXEljWNzuZFPHbsQGhGYICyNo9mapxF4XXsR8QEea6q3+DKsHV
 0hXkdoq/7RFjlOqWmI/7U294HPZzRUxT3tqir9dtIykuBE6ctquEqBX5+SDW8qLS3XuJHzr3xZT
 OAJh+xxMyTef8ifiPrdc1vG9UmwDAEM7Uox5CMHBnEmjVTqz0tPaFZXFLZpUTJmTg+npO2rO+w/
 roJ6IZiuGXEi4B4ZyuQ==
X-Proofpoint-ORIG-GUID: 1BiaLQbkSx3jIS3-5oFuLLZ9fc4l9KLd
X-Proofpoint-GUID: 1BiaLQbkSx3jIS3-5oFuLLZ9fc4l9KLd
X-Authority-Analysis: v=2.4 cv=ZZ4t8MVA c=1 sm=1 tr=0 ts=69fc76e7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=7JBRkwD79zxFga_vYKgA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070114
X-Rspamd-Queue-Id: 2EF6D4E779D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106342-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linlin.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The QCOM ICE driver manages the ICE core clock through direct calls to
clk_prepare_enable() and clk_disable_unprepare(), which limits integration
with platforms that rely on firmware-managed resources or platform-specific
power management mechanisms.

Replace direct clock management with runtime PM support by moving clock
enable and disable into runtime PM callbacks. Use
pm_runtime_resume_and_get() and pm_runtime_put_sync() in qcom_ice_resume()
and qcom_ice_suspend() to drive power state transitions, and enable runtime
PM in qcom_ice_probe().

Reviewed-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Reviewed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 58 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 53 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index b203bc685cad..6f9d679b530c 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 
 #include <linux/firmware/qcom/qcom_scm.h>
 
@@ -310,8 +311,8 @@ int qcom_ice_resume(struct qcom_ice *ice)
 	struct device *dev = ice->dev;
 	int err;
 
-	err = clk_prepare_enable(ice->core_clk);
-	if (err) {
+	err = pm_runtime_resume_and_get(dev);
+	if (err < 0) {
 		dev_err(dev, "failed to enable core clock (%d)\n",
 			err);
 		return err;
@@ -323,7 +324,7 @@ EXPORT_SYMBOL_GPL(qcom_ice_resume);
 
 int qcom_ice_suspend(struct qcom_ice *ice)
 {
-	clk_disable_unprepare(ice->core_clk);
+	pm_runtime_put_sync(ice->dev);
 	ice->hwkm_init_complete = false;
 
 	return 0;
@@ -716,24 +717,69 @@ EXPORT_SYMBOL_GPL(devm_of_qcom_ice_get);
 
 static int qcom_ice_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct qcom_ice *engine;
 	void __iomem *base;
+	int ret;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
-		dev_warn(&pdev->dev, "ICE registers not found\n");
+		dev_warn(dev, "ICE registers not found\n");
 		return PTR_ERR(base);
 	}
 
-	engine = qcom_ice_create(&pdev->dev, base);
+	engine = qcom_ice_create(dev, base);
 	if (IS_ERR(engine))
 		return PTR_ERR(engine);
 
 	platform_set_drvdata(pdev, engine);
 
+	ret = devm_pm_runtime_enable(dev);
+	if (ret) {
+		dev_warn(dev, "Enable runtime PM failed, ret: %d\n", ret);
+		return ret;
+	}
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		dev_warn(dev, "Runtime PM fails to resume, ret: %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
+static void qcom_ice_remove(struct platform_device *pdev)
+{
+	pm_runtime_put_sync(&pdev->dev);
+}
+
+static int ice_runtime_resume(struct device *dev)
+{
+	struct qcom_ice *ice = dev_get_drvdata(dev);
+	int err = 0;
+
+	err = clk_prepare_enable(ice->core_clk);
+	if (err) {
+		dev_err(dev, "failed to enable core clock (%d)\n",
+			err);
+	}
+
+	return err;
+}
+
+static int ice_runtime_suspend(struct device *dev)
+{
+	struct qcom_ice *ice = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(ice->core_clk);
+	return 0;
+}
+
+static const struct dev_pm_ops ice_pm_ops = {
+	SET_RUNTIME_PM_OPS(ice_runtime_suspend, ice_runtime_resume, NULL)
+};
+
 static const struct of_device_id qcom_ice_of_match_table[] = {
 	{ .compatible = "qcom,inline-crypto-engine" },
 	{ },
@@ -742,8 +788,10 @@ MODULE_DEVICE_TABLE(of, qcom_ice_of_match_table);
 
 static struct platform_driver qcom_ice_driver = {
 	.probe	= qcom_ice_probe,
+	.remove = qcom_ice_remove,
 	.driver = {
 		.name = "qcom-ice",
+		.pm = &ice_pm_ops,
 		.of_match_table = qcom_ice_of_match_table,
 	},
 };
-- 
2.34.1


