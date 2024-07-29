Return-Path: <linux-arm-msm+bounces-27298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 608BF93FE80
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 21:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C4861C225AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 19:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02169189F33;
	Mon, 29 Jul 2024 19:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DYDNzClN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22561891AA
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 19:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722282742; cv=none; b=MDAXjKyoxPAC1rsAphoW3VbahH0GwxiO2JKjAx1/0KdgVnr8kK5CiJHDURV2odz8GbO58BHWf/Upho1PmqI3I9xezwgS7D3AChhKMzG2+az2x7IsANN02el/l1p8ZprgtwrKpxYJGxCQpXzTYpnxO9VSyqEWA1iSQATUGzaxTVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722282742; c=relaxed/simple;
	bh=eAWrLr7syK4v9OEqvlyX0jICgB4CRiMGpoCpwqQgJpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DnIHwI0Oe7cCJ9qYmS9AXRZN1gE4g9fbbsnG8+/I0XKriJzsgRL8D4BA9avFA+ZXiDnXNp7L+0GSzbXXnPxEHEEYIs7zq5xqCHcHMm21us/I+9RR1C94ElI6ZbWbQ4T5UBokLD9PtbWKLeiW+srxOgrdB5iVidsIy52Oooxrohk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DYDNzClN; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52efaae7edfso4319924e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 12:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722282739; x=1722887539; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nvigx8ftGFF7H3oC6jrwYCq182+kCMKq67geJyZJwro=;
        b=DYDNzClN3HjqbPrO9e2tHHpL8Vua6aB0g5eAW6bFL+y0NslgYm1GZs+Z2h33uSrtcP
         dqqQWBd4t3bHqrpU92YQjuSb111rT5KvHN1Ku2Amuafa20ab28NQdxPUmoZzVCyjV31E
         eIQ6bx8khWnhMNK4O/Im4JMA+nqyhkJlrBTh9iy/ar8QN78VTmSjgyiUVK8R1EJ6IOif
         z0BsvwiIb6pjlQFuLJMNEMZo2WUJ8FiST8An5/nNIk4siJOOC/zouJ/swmZB/HzzLrRY
         bter5rw4aDWzfeh7HrkZ74uk+8SX/fFVHYNCGqE6L84MC/sCoc3hs79cRH1jLeNaN2sQ
         9DPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722282739; x=1722887539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nvigx8ftGFF7H3oC6jrwYCq182+kCMKq67geJyZJwro=;
        b=qH/AcgwOVCxj0bhQqDxqA+c7v/m6oxLyILBqsWxFDyAYm4gDIKuEqY6KNIoI/vZ2fH
         21KkEc8ivDCM0xUHzreltpeqJZF2laq0al05s4YRTPtGXR0aqoUyDkBv81KkycwJ6mAo
         e29o/A1cl3DN7L2CGyMZUHEiub3kLznb6jjyx/o06GfosnQjdEhtoBrfmufc9bYORLmP
         X691k8RcHzSichotsZGKOHLsEKEsRxiAblpMbT/U4TdA95/sqGyrWmjwmrebuSSEAMWK
         TcBjiDTbBgR2h1jdV1Wo2FxgmZ9lSriCLXId67kDMawSU1ozWRlf3nOG9AhCuxjtI2K+
         H6wA==
X-Gm-Message-State: AOJu0Yyv7R/JwofqFSkgK6IYb/xhKyM60miSz6gK9bheAs/0rM1+lsiS
	g28jP8t/8T7bTXKP2kasFOGscH9wvB2UuhiXkDjFvGbcaGgoN+HhpEvqW9ptSTY=
X-Google-Smtp-Source: AGHT+IGZlWDv3cUJamS7yAPDFJ6RuaWt80rzcBym584uDDeV+HSA4wGbfxK7k/Vq0NoejHp/4NZMYA==
X-Received: by 2002:a05:6512:39c2:b0:52e:9f6b:64 with SMTP id 2adb3069b0e04-5309b280988mr6581712e87.34.1722282738946;
        Mon, 29 Jul 2024 12:52:18 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bd1088sm1615590e87.106.2024.07.29.12.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 12:52:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jul 2024 22:52:14 +0300
Subject: [PATCH v2 1/5] Revert "soc: qcom: smd-rpm: Match rpmsg channel
 instead of compatible"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240729-fix-smd-rpm-v2-1-0776408a94c5@linaro.org>
References: <20240729-fix-smd-rpm-v2-0-0776408a94c5@linaro.org>
In-Reply-To: <20240729-fix-smd-rpm-v2-0-0776408a94c5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Stephan Gerhold <stephan@gerhold.net>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2654;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=eAWrLr7syK4v9OEqvlyX0jICgB4CRiMGpoCpwqQgJpI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmp/LwCTuCYU/6YSCjas4tG0SVviSh/CHbKxAIY
 fuevwTc63KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZqfy8AAKCRCLPIo+Aiko
 1al3B/sHtT2AVBPTL48APedB46dbqPApKIDMgtlWXbXRRqxinGGdDTVgPF+JEQXY43+bzpO5X9H
 kP603xOrJ0y9Iq+d5Xnz0sRHcKENQMXbiNV2jmpFwuoe/4SORdHShTmrwIpIC/65GegFokHc3Y9
 nP9aCSfF1WbV2JSzSRR7QKWoWbHk7o6a51sClz/cBepB3iOKObdLvbPLC5DOqgyjNFTHeN2orME
 7lnDmaH7pnIV+5CQ/V7Q2rIHU+0pb9t9RlWC7uzdS05a+5x8UXmSAbHMugoo6OV7KqNRx3WfHGd
 FabAM4MlzKiRgXvJ4uG7ZXdhfEeONdh6eQ2G5BskecsAX0rw
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The rpm_requests device nodes have the compatible node. As such the
rpmsg core uses OF modalias instead of a native rpmsg modalias. Thus if
smd-rpm is built as a module, it doesn't get autoloaded for the device.

Revert the commit bcabe1e09135 ("soc: qcom: smd-rpm: Match rpmsg channel
instead of compatible")

Fixes: bcabe1e09135 ("soc: qcom: smd-rpm: Match rpmsg channel instead of compatible")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/smd-rpm.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
index b7056aed4c7d..9d64283d2125 100644
--- a/drivers/soc/qcom/smd-rpm.c
+++ b/drivers/soc/qcom/smd-rpm.c
@@ -196,9 +196,6 @@ static int qcom_smd_rpm_probe(struct rpmsg_device *rpdev)
 {
 	struct qcom_smd_rpm *rpm;
 
-	if (!rpdev->dev.of_node)
-		return -EINVAL;
-
 	rpm = devm_kzalloc(&rpdev->dev, sizeof(*rpm), GFP_KERNEL);
 	if (!rpm)
 		return -ENOMEM;
@@ -218,18 +215,38 @@ static void qcom_smd_rpm_remove(struct rpmsg_device *rpdev)
 	of_platform_depopulate(&rpdev->dev);
 }
 
-static const struct rpmsg_device_id qcom_smd_rpm_id_table[] = {
-	{ .name = "rpm_requests", },
-	{ /* sentinel */ }
+static const struct of_device_id qcom_smd_rpm_of_match[] = {
+	{ .compatible = "qcom,rpm-apq8084" },
+	{ .compatible = "qcom,rpm-ipq6018" },
+	{ .compatible = "qcom,rpm-ipq9574" },
+	{ .compatible = "qcom,rpm-msm8226" },
+	{ .compatible = "qcom,rpm-msm8909" },
+	{ .compatible = "qcom,rpm-msm8916" },
+	{ .compatible = "qcom,rpm-msm8936" },
+	{ .compatible = "qcom,rpm-msm8953" },
+	{ .compatible = "qcom,rpm-msm8974" },
+	{ .compatible = "qcom,rpm-msm8976" },
+	{ .compatible = "qcom,rpm-msm8994" },
+	{ .compatible = "qcom,rpm-msm8996" },
+	{ .compatible = "qcom,rpm-msm8998" },
+	{ .compatible = "qcom,rpm-sdm660" },
+	{ .compatible = "qcom,rpm-sm6115" },
+	{ .compatible = "qcom,rpm-sm6125" },
+	{ .compatible = "qcom,rpm-sm6375" },
+	{ .compatible = "qcom,rpm-qcm2290" },
+	{ .compatible = "qcom,rpm-qcs404" },
+	{}
 };
-MODULE_DEVICE_TABLE(rpmsg, qcom_smd_rpm_id_table);
+MODULE_DEVICE_TABLE(of, qcom_smd_rpm_of_match);
 
 static struct rpmsg_driver qcom_smd_rpm_driver = {
 	.probe = qcom_smd_rpm_probe,
 	.remove = qcom_smd_rpm_remove,
 	.callback = qcom_smd_rpm_callback,
-	.id_table = qcom_smd_rpm_id_table,
-	.drv.name = "qcom_smd_rpm",
+	.drv  = {
+		.name  = "qcom_smd_rpm",
+		.of_match_table = qcom_smd_rpm_of_match,
+	},
 };
 
 static int __init qcom_smd_rpm_init(void)

-- 
2.39.2


