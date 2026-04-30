Return-Path: <linux-arm-msm+bounces-105276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFqwB+XK8mlpuQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 05:22:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DFF49CC67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 05:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 213293024283
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 03:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69EBA340A57;
	Thu, 30 Apr 2026 03:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BFrCAxCL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R1z5c4ol"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871E830100E
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 03:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519307; cv=none; b=Teg6uNVKkk3MpcuvhRLXRViinuTJ8OY9E97isX0TRWT4GZLVTQpWv173i1ARV5uegYfl6lvd1syX9SLTISW0wxiB1KGN2ibLoPgnLyiwOCGSD1LYeXkniHQ+f7Y1Jsk11u33M1bvvBnQ4VF1QYfV5lNdPxcz7HJv3jkZdaQRpsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519307; c=relaxed/simple;
	bh=k+d951Qvi+Dcbct+bPdWAZBcVUO5zA4xMaJyBHeyrMU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hqWZWM3GrkgBaI5l6hEsx0WbWOu/zyrcGWhG1YUVkL+334lsXAy4XloosxGugZeKDmQuE7DPeRP7e7oMRa9L3l0MK7XNWr/3r8DCBf3iV4K6QsiHr0yDFpMo2FYHhaksTwiIzEeDJOTGbXM8ez6x24l2w1zDtIxmdw0KFW+H444=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BFrCAxCL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R1z5c4ol; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TNurqP3732570
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 03:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=f6Lh5X695h3
	Y6NxGVDMp4XhoibCMZmokmWWM3MAxEng=; b=BFrCAxCLqiXdEyuXTHziAjQN3bl
	bnzRIce/n1/6ahja6WUfK+wgwyK3zAvLAU5L4EVwgfRVAU5lEZ9n+g4OLVdyoO4w
	6NB4mzOELXnNie0JxGj2dMzFrLj2kUvoDNvXY7X/ka/DANO/FKvC2bMGB4vtp4Sp
	fINacM/xFZdABUmy6UB7R4YnwIBwy60cnYY30kVLjQ2y8y9xdz29mrG3WOtcDJvy
	rcGlPt4wkIzyq7egtSvso0OKpL20vWA6M0na4ie8wmJqy9AhGvKfOE1UavsHOybE
	J+e+6JjJ4CRJOvCrvUPnPjkjy2HN3GTT5WXLQmdHwxvbE6eQOTWNQathm4A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duv3x8jyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 03:21:44 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c16233ee11so726105eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 20:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777519303; x=1778124103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6Lh5X695h3Y6NxGVDMp4XhoibCMZmokmWWM3MAxEng=;
        b=R1z5c4olriJuwLJ10mYo7rUHtYUTmStg6k4AcvISey7VZB06XbTKmpdUZHCBaBTAN1
         eZREaPAry/X6RiKfoQbtXGT6O+YwrJzRF4tiTlujhSCQg6wTx18Vf5YtmSUpklLJwUcI
         owmlHm48IIGIB5Bmfr1G//qWyAlA0OF5NWwqV2xi7hudGd5cEdSmb7+sq0R+MirsACfp
         jzk9gJeqWpEa3ElECuJ/CB3vN0HTTk1Xp6XFdv/Vr1ehlZ0L9RCQNllsEu0JK8kibWp6
         7VPAxioR6IHsT1V+OKFezS5eTJdo4QcFqr+PfxInyh1uHV+wlxE3rRmzPo3BN70/tbzC
         OLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777519303; x=1778124103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f6Lh5X695h3Y6NxGVDMp4XhoibCMZmokmWWM3MAxEng=;
        b=rVGm2vRBxlr2eHgAYgBF+GJRNRfuxDInug+OFL3SQePyzCigjTk3CMFcEW5LshQ7uK
         3OVM8EqHO9R2uafxF1coUn/eg6Gb9yoLGHIBnuOcfpuDPtnLuzJG4+UglyrmZYvlTX3N
         FukqSdn3X6K0mg3pakDEQhOzoWdLOEylZuXz7DF8Wa4DBwhC67M2h/JOmCZvFzfCizUO
         LfWmkP+4DcxXI8coCFH1E8Bj/l1tuCW/RZW7lZIjz2BmEnokyvtFq4U+cAlf7w8Billk
         rVnx7IXuqJYTD3j+BH/mrGpywxMYIb/8x7woL6opIT/UU5jC912/J+IaytvcqPEXU2KK
         9KYg==
X-Gm-Message-State: AOJu0YzK+IhLIS0axQIBcVeguBBD0QosrQZ987cTeTaEKwRslmAcY8rc
	HWSfuct0ux8UDCJo5u9o1lNuyGyqzpoVx4XTZ0VQlscssa1ph0rA0Ns+Ek80X+lcDcuCKXH6qco
	gkMLOMFw2//EP30ovva7vq7xnKAj3Qus6m6z4PtIaxTegjEX5MujVs3n/rnG/3Tm1vbSuE47Wvy
	ze
X-Gm-Gg: AeBDietiAOYkzcszrZx4yrcMIbFwOiyDjbVTjLFtE8jd0/lf26UUlQ7wWw+rG6tLvZS
	F/isrQutu0Fj8XLdG8P5zF16KB5qbPpz4txhbmU58LG9QpsTzXIxqOK6xWMOgtiTpwHfvWU1UHO
	zysZ62Hd6D0k5aXlq9Sss3K0UQ7ZZ0VLXmeC6/7wAWdQM98mHg5K78xcqr031IkKrR2edbloxfa
	MrnIqgISNFXBYtFBEh0ZcOW9+JfoBjdlO4Ck/76T4nqCVJu7FbE+dNnWLN1V79l6p+ywqofweY4
	STVHISmSNPhL1oALj6r7yaioPXmXPzF2F4JUFjsEEIMGq5eSSnsin1pisSt4zO8DqNLvZh6SfG0
	11BpIqZO7wHNfVnE9y2f1ReciLV0TmIA2ikR0WQrrYeVJn1NfFNlsqV5pafECHN5Cu8302Z8uZH
	A+fPt30CepNtbn4GI=
X-Received: by 2002:a05:7022:1281:b0:12d:b175:2573 with SMTP id a92af1059eb24-12deac4f473mr617845c88.7.1777519303423;
        Wed, 29 Apr 2026 20:21:43 -0700 (PDT)
X-Received: by 2002:a05:7022:1281:b0:12d:b175:2573 with SMTP id a92af1059eb24-12deac4f473mr617831c88.7.1777519302926;
        Wed, 29 Apr 2026 20:21:42 -0700 (PDT)
Received: from u20-san1p10573.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12de321df36sm7572644c88.7.2026.04.29.20.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 20:21:42 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, ebiggers@google.com
Cc: neeraj.soni@oss.qualcomm.com, gaurav.kashyap@oss.qualcomm.com,
        deepti.jaggi@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        quic_shazhuss@quicinc.com, trilok.soni@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Subject: [PATCH v6 2/3] soc: qcom: ice: Enable PM runtime for ICE driver
Date: Wed, 29 Apr 2026 20:21:34 -0700
Message-Id: <20260430032136.3058773-3-linlin.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260430032136.3058773-1-linlin.zhang@oss.qualcomm.com>
References: <20260430032136.3058773-1-linlin.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDAzMSBTYWx0ZWRfXzMx4P5HxVElE
 yzErB2+vMYbY1GWDzvIBLbPddT+11zfIzcKp/7lTGgaerV5uORlU+BDjurDbDnP8YihnsjDhjpU
 J93w7mxDvteLN1JyTE/Bgb9WRIdkEU3+C1CfK79SS1Yp3fGKxSyiw0TrOcxHx4zFieb6S7CvqIQ
 U+kaKvSIN8LKvSprOleaWnRzdQyWDQBxvuTgBsD4+3ydCu9fTcXCq+6AqkcXhZaTDryPsRK4DqQ
 6b/+g/XhAARd4Y1dSuU5dzGG5kgDCmiL2OLFuToC7IW+QvrtG9s6K58D3GmrVR2Yq/V4p34ratZ
 qjDtQ+unU/EMA2xvPUSeqFkWNaxWdYkgGAEzm1NUWO/+M6pcVQxhXLXxzZoOHjhovd9+EM+MId8
 1OCFbzDFy7fE6mxl6Pq6zctnL9hCxaZ5g+zbTlcPQ1yeIb8LNuOB0NWas2NmAQGyJhm1ytdscmT
 +A3m4PwkyV5XpyyYkgg==
X-Authority-Analysis: v=2.4 cv=Oc2oyBTY c=1 sm=1 tr=0 ts=69f2cac8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=7JBRkwD79zxFga_vYKgA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: gsToAiU-fF2fSYQzhA-E27jmTzUUUL9O
X-Proofpoint-ORIG-GUID: gsToAiU-fF2fSYQzhA-E27jmTzUUUL9O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300031
X-Rspamd-Queue-Id: D0DFF49CC67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-105276-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linlin.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

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


