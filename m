Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7A261A9325
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 08:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732711AbgDOGWY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 02:22:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2393544AbgDOGWT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 02:22:19 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B1AAC061A41
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 23:22:19 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id np9so6343557pjb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 23:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m0wKJOnOp7WnSwAhhU9/YwBjXZo896nHbiajmhX/TkI=;
        b=X7rhER9V+7D6xbrDFU5DyH6dKQUob8pQjifY3E+BOrJAbC90Wl9+qWdKont6wNvyRL
         wRlM/Yof+1XQ1RbYJ4gPkJZoCogepwr8C+vcziATrQtSqM0rC0dMvjYW53NEcns2gaXm
         Q4aFN5LSYyLt/25CSC5OojAbDmBSjIoIxNpgiKtXEUlqHF4HTM+iRCM3l6ioft0bDdHD
         yAOqAzmWDBXpTYfLwh0zrlVuqpeKpvo9mGXZH41BfzI+E9zZn3L3k3lLBkO2zU3XSgH9
         66qEpZgkyeQyHv3spFbB8HfWdqVWNhgymKgr7YDvXpAnhV39VzvASbbDBZ7uQ+f37ppA
         bnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m0wKJOnOp7WnSwAhhU9/YwBjXZo896nHbiajmhX/TkI=;
        b=RE1ap9yF2T4mwD/ioyMKVlel5bUI+KwH2aXyWiyUUAt9jBJfA9XvuB4HUpZqKK6DaM
         1SKqEmdLfrhBT7aXP8EnGT+ox16AmUgEvdHAEm1a/Af5KoDDrdydx9UtoGSB3noapAmK
         LsvgjQ7Yf2gYYHEI8AWqPVd8IK+tdNKhctfTz+XRk2mxim/u+zEVPUzKxLOPCD2KW74P
         WAYONwJBtYlOzaXd0UFJqRgkrtKnDP48A3dZ2Sk+8OmS2oo08W/tbcu2NR5WaqUGt4+X
         OwQTeVsl3N7/QKicmfbKzb6WJeETulq6EI2Fu+q3yeZu0jDn9RcOtDwhm3rAPIMET5rW
         yktA==
X-Gm-Message-State: AGi0PubG49wZGN2x33tnNXCC9KtH43iDR8MfT+YuOnhbLwOTLE6NPw00
        MAWCSyIWuAC7aLtzOwC1ExAZGg==
X-Google-Smtp-Source: APiQypLBvo8HG6RqaxwQaTA2YJFeNp3xTsShLNtx1gsmY1f1yHP5m1Ijxq1G2gYLXswby7M/CyILNw==
X-Received: by 2002:a17:902:7c8f:: with SMTP id y15mr3390229pll.202.1586931738637;
        Tue, 14 Apr 2020 23:22:18 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id nu13sm14032899pjb.22.2020.04.14.23.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 23:22:18 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] soc: qcom: rpmhpd: Add SM8250 power domains
Date:   Tue, 14 Apr 2020 23:21:53 -0700
Message-Id: <20200415062154.741179-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200415062154.741179-1-bjorn.andersson@linaro.org>
References: <20200415062154.741179-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
 drivers/soc/qcom/rpmhpd.c                     | 19 +++++++++++++++++++
 include/dt-bindings/power/qcom-rpmpd.h        | 12 ++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index ba605310abeb..8058955fb3b9 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -23,6 +23,7 @@ properties:
       - qcom,sc7180-rpmhpd
       - qcom,sdm845-rpmhpd
       - qcom,sm8150-rpmhpd
+      - qcom,sm8250-rpmhpd
 
   '#power-domain-cells':
     const: 1
diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index 4d264d0672c4..7baa39a91412 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -166,6 +166,24 @@ static const struct rpmhpd_desc sm8150_desc = {
 	.num_pds = ARRAY_SIZE(sm8150_rpmhpds),
 };
 
+static struct rpmhpd *sm8250_rpmhpds[] = {
+	[SM8250_CX] = &sdm845_cx,
+	[SM8250_CX_AO] = &sdm845_cx_ao,
+	[SM8250_EBI] = &sdm845_ebi,
+	[SM8250_GFX] = &sdm845_gfx,
+	[SM8250_LCX] = &sdm845_lcx,
+	[SM8250_LMX] = &sdm845_lmx,
+	[SM8250_MMCX] = &sm8150_mmcx,
+	[SM8250_MMCX_AO] = &sm8150_mmcx_ao,
+	[SM8250_MX] = &sdm845_mx,
+	[SM8250_MX_AO] = &sdm845_mx_ao,
+};
+
+static const struct rpmhpd_desc sm8250_desc = {
+	.rpmhpds = sm8250_rpmhpds,
+	.num_pds = ARRAY_SIZE(sm8250_rpmhpds),
+};
+
 /* SC7180 RPMH powerdomains */
 static struct rpmhpd *sc7180_rpmhpds[] = {
 	[SC7180_CX] = &sdm845_cx,
@@ -187,6 +205,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,sc7180-rpmhpd", .data = &sc7180_desc },
 	{ .compatible = "qcom,sdm845-rpmhpd", .data = &sdm845_desc },
 	{ .compatible = "qcom,sm8150-rpmhpd", .data = &sm8150_desc },
+	{ .compatible = "qcom,sm8250-rpmhpd", .data = &sm8250_desc },
 	{ }
 };
 
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 3f74096d5a7c..dc146e44228b 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -28,6 +28,18 @@
 #define SM8150_MMCX	9
 #define SM8150_MMCX_AO	10
 
+/* SM8250 Power Domain Indexes */
+#define SM8250_CX	0
+#define SM8250_CX_AO	1
+#define SM8250_EBI	2
+#define SM8250_GFX	3
+#define SM8250_LCX	4
+#define SM8250_LMX	5
+#define SM8250_MMCX	6
+#define SM8250_MMCX_AO	7
+#define SM8250_MX	8
+#define SM8250_MX_AO	9
+
 /* SC7180 Power Domain Indexes */
 #define SC7180_CX	0
 #define SC7180_CX_AO	1
-- 
2.24.0

