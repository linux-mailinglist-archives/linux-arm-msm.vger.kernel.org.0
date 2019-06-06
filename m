Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACCC737CBD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2019 20:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727808AbfFFSww (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jun 2019 14:52:52 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36596 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727572AbfFFSww (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jun 2019 14:52:52 -0400
Received: by mail-pg1-f194.google.com with SMTP id a3so1861195pgb.3;
        Thu, 06 Jun 2019 11:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2QCsw+gA+NPdEFQB5c0NGkHe0GOzzrEqSJ0EJ9N8L18=;
        b=IOrFsGzE/OkoIoODg5tlLMkjPi1INtt/OoS3GPP9Zq6RTNQRUtJUTiCcAtIX1EtQ+6
         JHuj52dRXNqJoIWEXaLh5i9Rl0i7nspdUHmxfqyg9kpEtg0Gsl7p1n7Yj3BJQqSAEGS6
         FFcVIsajLeL77M6tkFE26b2QaAhQ+FSmt2TvSw0M/GyErD3MJ0ZI839kmiYoviSB321r
         WsJ9jBad8Cxp7+MHjhhcYlEISsRk4bMh0y+CQDHo+gwbNmFTUIBfZlqtggGy0cCUqGP4
         qKiBy6QCXhFiZi2sqA4UMxAMDRfVL1tEDbtbIStzFSkvtXqMx3kAKOagb8DNcQXvffSk
         0B2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2QCsw+gA+NPdEFQB5c0NGkHe0GOzzrEqSJ0EJ9N8L18=;
        b=p0HMUDVuRv0fTgWMSjtxIvG6xW/UY9a8d8a+47cl6xsQO7FApziyPy+6PhfemVdwDR
         iOiEyN9y99tnmhmclfct92OPwGL60vHL5xdCrgLgphwg3xrlCTwl17ArphdBUpcT31KO
         ES9sXOKLLhReJV56fTjrQ3BXcugmkKUwsJNoOzqr7e/sTOszp6yn98g8QAgD6mEfR2G5
         eyUBWuqeL2W//90pQaGe0b9g8jKk7SGuShSPiea0U9I9mFaGfCmhdrSXD7rbwq508ZVt
         LXfqAtT93NA9XvCCyRk8VwcxktTSkcZBUXtzXacJkragEpT2Aev191YAr6qTjtsPb3EC
         MBiA==
X-Gm-Message-State: APjAAAW0WWRSnfAMMuuYk8xPUBhaJCzULO5XDbWVf6jE41zII5wXmDXa
        ejBov9sJywLhzd0E1ljZjDE=
X-Google-Smtp-Source: APXvYqxiBiy6dJlmeu3uMScnISQG7sRB0defVl8xmI3tP+rGO5gTCvmoUUVi4dQrvk7MoDYV/SAx7g==
X-Received: by 2002:a65:4c07:: with SMTP id u7mr6071pgq.93.1559847171593;
        Thu, 06 Jun 2019 11:52:51 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id x8sm3136807pfa.46.2019.06.06.11.52.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 11:52:51 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     lgirdwood@gmail.com, broonie@kernel.org
Cc:     agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, jorge.ramirez-ortiz@linaro.org,
        niklas.cassel@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v2 6/7] dt-bindings: qcom_spmi: Document pms405 support
Date:   Thu,  6 Jun 2019 11:51:26 -0700
Message-Id: <20190606185126.39839-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606184842.39484-1-jeffrey.l.hugo@gmail.com>
References: <20190606184842.39484-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>

The PMS405 supports 5 SMPS and 13 LDO regulators.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 .../regulator/qcom,spmi-regulator.txt         | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
index ba94bc2d407a..19cffb239094 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
@@ -10,6 +10,7 @@ Qualcomm SPMI Regulators
 			"qcom,pm8941-regulators"
 			"qcom,pm8994-regulators"
 			"qcom,pmi8994-regulators"
+			"qcom,pms405-regulators"
 
 - interrupts:
 	Usage: optional
@@ -111,6 +112,29 @@ Qualcomm SPMI Regulators
 	Definition: Reference to regulator supplying the input pin, as
 		    described in the data sheet.
 
+- vdd_s1-supply:
+- vdd_s2-supply:
+- vdd_s3-supply:
+- vdd_s4-supply:
+- vdd_s5-supply:
+- vdd_l1-supply:
+- vdd_l2-supply:
+- vdd_l3-supply:
+- vdd_l4-supply:
+- vdd_l5-supply:
+- vdd_l6-supply:
+- vdd_l7-supply:
+- vdd_l8-supply:
+- vdd_l9-supply:
+- vdd_l10-supply:
+- vdd_l11-supply:
+- vdd_l12-supply:
+- vdd_l13-supply:
+	Usage: optional (pms405 only)
+	Value type: <phandle>
+	Definition: Reference to regulator supplying the input pin, as
+		    described in the data sheet.
+
 - qcom,saw-reg:
 	Usage: optional
 	Value type: <phandle>
-- 
2.17.1

