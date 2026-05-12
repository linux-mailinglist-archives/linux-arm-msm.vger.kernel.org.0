Return-Path: <linux-arm-msm+bounces-107024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOWAFiihAmpwvAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 05:40:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC70519632
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 05:40:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0285F3044F20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 03:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628BD27A107;
	Tue, 12 May 2026 03:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UcILo+2j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RmvlkuAk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA7A28505E
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 03:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778557081; cv=none; b=IlqgV+COTJzJCzV/pojsg3q/mBx9r6AR7egxDeLOZtC5ubVmj6PkljVtQH69sXxvjWZZsBY/UbBwrEzwLwg6Uf7iuZIeDCC2kEKI115EkaZrzV4EwsaOvZN2GTDWbUxNdqqv2lV+to120ca1VSCSKtUJm8x3S4dmLFv6fau7w7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778557081; c=relaxed/simple;
	bh=k+d951Qvi+Dcbct+bPdWAZBcVUO5zA4xMaJyBHeyrMU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y3A3wSBdBo37AhLoAllOWJnlTPh1rhA74gRxqQlKnjA2mY/BEk8hAILMRFijL78pRdjh9vkxbYzU+tvmxBFqkA4V/CWC3W8clT5uL5k8s8GxOij+OLbSRBjXWrJIU251RshNC5LZxvGZIlSl3nHbtkTHzftxwhTUG/Ou0yB2lhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UcILo+2j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RmvlkuAk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK7E5i867733
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 03:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=f6Lh5X695h3
	Y6NxGVDMp4XhoibCMZmokmWWM3MAxEng=; b=UcILo+2jc+3KmjBTxKd068qfIbH
	KBGjSXiKo3UPXDkBewH0e0Wza+R8yO2WSUvcijjciKy+UhG/MJtwPPnJJtuWyoPz
	f9SLDKJ1ZiiUfBkMyNumsdjTuTfGSc6ltVeUXO+3/xEGfnQK3outRRMKQjww6Jw4
	Rljl24l+5Wx+Ol5LjjY5wr30saI6pXCHeR2Y0e6ZtOATd9M6HyOqjvYsU0BtcQyt
	+TY8x6lzOP38ZMNJrOlTgOzpYNAjADTpPlMkJ0WjzZcqTHp9EJ7zQC1d9RzQ29jU
	yOaxyio7+inqqEpc0kquLJFuW2AgOK2j8UmOuzGtA17ds5x/VJai3j7WLbw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv292w8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 03:37:58 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso3525003eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 20:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778557077; x=1779161877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6Lh5X695h3Y6NxGVDMp4XhoibCMZmokmWWM3MAxEng=;
        b=RmvlkuAkmlyH1r5XIzf/OapV3JDFOk03GKwkzzzTvG4y5HOLIusVrMwPjS4GNszX90
         NTSK5NB87sTt7/T38XNcdwavghRuEgXwH8AybT2/e/Z/xyPMz9cSKwNWOJnxfDTbZDK8
         4Bic12bSaxxwBnNSv9tFLx21jHzgcCig1t23p0SRIuM1iRa3LlYOAZSNsWbQoxo7lZpO
         i02hz8ijaasxSuJZkG/TzmBOD5VGOLdW2ayhxy9XkAgXUcLwRl5syuUHxha6O/8PAtGM
         NWTLeJ39/WK4Hnw1Rp7DF0GV9Mj4w1cQQ6u1IWRX4VJ+lMihsJGkveTHiUeD8ujvH3nP
         E6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778557077; x=1779161877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f6Lh5X695h3Y6NxGVDMp4XhoibCMZmokmWWM3MAxEng=;
        b=QVRGxf8CklheBYRSJkxmAUGpJJpQ/Fy09f9h+HL5LI+0trJS8+TMA63cOQoGiDb41x
         2iBDKh+v0zOEaBBzJtqAvQc10a0+yeYC4vRXAeI8NzTgtBmGzWJz7wtdQaztHN7YkQn7
         T6jrnzMH92zk9vGIxICTLSSzAsFxmxBsS+ePbA7+tKVqpkSAOIBs8SVDKJA59Cpnf6nC
         nOBjFXsQTUAi/ZslKXFoWdAdVYBJw7t6sUutpv86z7XHRtZdIknSKK8cJweK9PjvZdS9
         vmIJgZtqX5L2pGlEw0WrmQL3gJC14kDush9vJmohWzfq4hqK4v7NOQiv14mqrS/NkxCk
         i9KA==
X-Forwarded-Encrypted: i=1; AFNElJ+WZnDjxYvZhKbdGkoCZ3LPVO3IG/gwq86PcPJ/M+a+LEU3Ko0RzRIsmGULTboF88MydfV/JBSeLliwQ3J1@vger.kernel.org
X-Gm-Message-State: AOJu0YymLpTul5ghOsgtam9D++s0o0fFGqgt4t/EqPhFW7iqrqF/fuRK
	EBnaBCUkjM0vmJhpt4LPxBMdmdXra1bpDnyZ/OMWZHsVOTJ+4EPWtyB+CtDHv1y9Vsm8EktYrLd
	g30kfD8LP9vKBYwbXkTUM0+THXQb9KQCdu5lFeZeCU8YTg3TNW4LtwgljGhRlN2VbBUKf
X-Gm-Gg: Acq92OG/8dHCCnklrkQBTeKJjyxvrVMucweAt3o1aDM8XQnFdV4xJfBS6pTyZxxU+FI
	kcNl2VsjhmIlzQivx4zxyIQ3MxjLPlln42BoChmXzexs5EYx2cgiZXMPtWlZG40J6dNzAUm0cry
	m2eBuk7qB9BleMftT9Q8PG0vhp14lZwPwMHmtSEOg0Fmn/YJV57VnTBF2ynePAt1FWoStifV1Hl
	y1Gh9Dy/aJF97yEOOOnKla9d+NQJUGvXpvR2ECLHimBwxu7wpaA54aLNMdDGNJ1mTy8sWR0Rvl3
	J3gRbKOnvQqoVwO2xnLShU/kxQ8kS9hB5u7QzjRsGLSu0SrJWssPUMazGkepFnnmLl70XrQEc3p
	iynz3RSPJbC49uMdilj6Spod8dT4RXDMOYb/VLcYXRRLXC/S5TUBecJbcNTuMrqjYzNIf0/d7Fp
	cgNuOl
X-Received: by 2002:a05:7301:6589:b0:2ea:edc0:4fbe with SMTP id 5a478bee46e88-2fb4bff7bdfmr5950465eec.14.1778557077397;
        Mon, 11 May 2026 20:37:57 -0700 (PDT)
X-Received: by 2002:a05:7301:6589:b0:2ea:edc0:4fbe with SMTP id 5a478bee46e88-2fb4bff7bdfmr5950442eec.14.1778557076836;
        Mon, 11 May 2026 20:37:56 -0700 (PDT)
Received: from u20-san1p10573.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eb4b7sm16730109eec.2.2026.05.11.20.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 20:37:56 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Subject: [PATCH v2 2/3] soc: qcom: ice: Enable PM runtime for ICE driver
Date: Mon, 11 May 2026 20:37:49 -0700
Message-Id: <20260512033750.3393050-3-linlin.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260512033750.3393050-1-linlin.zhang@oss.qualcomm.com>
References: <20260512033750.3393050-1-linlin.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: khPIi5r-JEoyAeCOyXV4C5hyXz8f3gjh
X-Authority-Analysis: v=2.4 cv=Mv9iLWae c=1 sm=1 tr=0 ts=6a02a096 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=7JBRkwD79zxFga_vYKgA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: khPIi5r-JEoyAeCOyXV4C5hyXz8f3gjh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAzMCBTYWx0ZWRfX06ZNKUNwWUii
 1sJ9/GHljycnFqxWbHhyM9gfGxBWG6BLjWaTnLLixTIqLqlRIa1x2G6zkJHcLvZ3yjHqN59Cm02
 F21lkzWJPNl+FRV55Q4TGBZVa7SMCXy45WsmeJLZWDQZ7WziSrATw7rxI1xT8kv1Da/P0hATr9T
 Md8/mUycoFgePFPemvlfYyKzO/BGqond8tl8S74vnDSWDw6mS6WpyEGx+6baRy/h4gqHD5Qtr42
 y9l1c1SM4YNeQcFqho6KurKnp8Q9PRPkgsf2Jft6lAiFnOxoVjvwqLU4sLlswQ5nO47jF0KJo4K
 X5urUNhPaVPOsBTi+3Nca5vY0t8Zk+RuFbmDYc+rLZYD6FiVHrBpRyjDL45QclcR4tFZQOGN6uG
 +ymCJkBBzDb0kRDJvoQdeea9Ycjw/pqzWDDAF6OmqWb2lVQ4EQrS84+rtEf/KMfCRDG2s5/eOBn
 ri8+jDtveNWOx6P1sIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120030
X-Rspamd-Queue-Id: EDC70519632
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107024-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linlin.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
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


