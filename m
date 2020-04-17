Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D9CE1AD6B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 09:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728197AbgDQHBO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Apr 2020 03:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728223AbgDQHBM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Apr 2020 03:01:12 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78991C0610D6
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2020 00:01:12 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id u9so628474pfm.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2020 00:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ffzp9Kx/9Feguerds3JewgyWlb5mJPvucz6Zy5UrO6o=;
        b=N4bjOMVjFE/KTqsJdI5p3UEjAQyPEEG3xNNkG7mjkY+SgnYGVah4pKGM5vT0VDIwJW
         t1O/6ZzeIOKlb8zO6NYN4egOsRzoR9IPAwBQRa3+Uz3cUG6tK+FRLaATtPAXqiSWFH5r
         vfTNkDd+vAbkBkgk7ywi19rXrO533ygRQENPZgaEOhxfQWC1yxNHPVHvwZP2UcyNWh+P
         y7VywLugAVhSTTvEVo7foEyI5z2IA2euN/pNz7SPJuPB3Ioyq28xbQN7I3If+mZ4ny68
         vX2AWm9oU0RGdVUDq3D9ivUaYspy/QdnYInQ/piPO3GwjHYYGVgcC/bOQFQPzH94nHEs
         RoLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ffzp9Kx/9Feguerds3JewgyWlb5mJPvucz6Zy5UrO6o=;
        b=jEcYqF7sWNbkEyTkDI2/5K6eJINHOthjhMoO85vMveRhnd9vHbeDjWcPj+2UXD5w+k
         EuKEKqqgwLGGYSMNGEWUadbCs+AvUg3viuyQy/km2cCH7HwnUikqPBirc2lAV0NAWGBL
         a5pZ+GZUhVXjcWJpQGM9aYzWVInE4RcHfHuFjJ2W4lsiW1hRi0eQKseiSKsU84LIqWdS
         bz7kj2A3td6sSEJiy7KvDHu1wMaxQmhufp2alAc/plT2sTArghmVAQR1sWvcl4wsdYuc
         P5Bfq9GwisIr/JaGduJK4S5Swr00G5L8B4JaHR05n1L/t3bVupyqB3Ipj8g37UAtpcGH
         Pe7w==
X-Gm-Message-State: AGi0PuZ+CaIKEhQRF1ERV4dIIfZ2qy00nUD7exdzRSpbsRp0jS3kMy2D
        DN0Q8GoYDpeTKiwczpIdq28gBQ==
X-Google-Smtp-Source: APiQypK+WugUyCOVGXvV9lrDjeTm6cJ1Ol1CBO5gmJifWOcICb4insgy672g8q2pfzAGGWrwFoOSgw==
X-Received: by 2002:aa7:94a8:: with SMTP id a8mr1730586pfl.44.1587106871993;
        Fri, 17 Apr 2020 00:01:11 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c125sm18561609pfa.142.2020.04.17.00.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 00:01:11 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] clk: qcom: mmcc-msm8996: Properly describe GPU_GX gdsc
Date:   Fri, 17 Apr 2020 00:00:42 -0700
Message-Id: <20200417070044.1376212-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200417070044.1376212-1-bjorn.andersson@linaro.org>
References: <20200417070044.1376212-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The GPU_GX GDSC depends on both GPU GDSC being enabled and that the
VDD_GX rail is powered, so update the description of the node to cover
these requirements.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- vdd_gfx -> vdd-gfx

 Documentation/devicetree/bindings/clock/qcom,mmcc.yaml | 4 ++++
 drivers/clk/qcom/mmcc-msm8996.c                        | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
index acc31b3991bd..1b16a863b355 100644
--- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
@@ -67,6 +67,10 @@ properties:
     description:
        Protected clock specifier list as per common clock binding
 
+  vdd-gfx-supply:
+    description:
+      Regulator supply for the GPU_GX GDSC
+
 required:
   - compatible
   - reg
diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index 6c7592ddf8bb..3b3aac07fb2d 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -3064,7 +3064,9 @@ static struct gdsc gpu_gx_gdsc = {
 		.name = "gpu_gx",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &gpu_gdsc.pd,
 	.flags = CLAMP_IO,
+	.supply = "vdd-gfx",
 };
 
 static struct clk_regmap *mmcc_msm8996_clocks[] = {
-- 
2.24.0

