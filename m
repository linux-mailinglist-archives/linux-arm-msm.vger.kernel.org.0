Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F5CD62455F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 16:18:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231230AbiKJPR6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 10:17:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231359AbiKJPRz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 10:17:55 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72FC931EC9
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 07:17:51 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id x21so1367244ljg.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 07:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbQznSb+wFqLy2HcBXlIBiqg0pLGuNPn6ZTMMPpMP08=;
        b=NJZBH+bUTAN6LToP/lQVUOtU6xRnQfGMSENBFt/kJwPlJ6KdryPRcgU/76Dy0p5pJl
         a9cvkEPin2scdvEY+2QhlW4WZ05lG/y4rPe8NVhVHm8djUOzZzev7iicmDH6RB6S6xnV
         65cCN7/LvoINp2MYI7hy9D3AvCPgYn01m7By7F+LdSYPehenrruXyZ2DlCCK/0shgKNu
         qilIGasMItKDWAkz+PnwK+48jNr1Xf26UDUEQx1LoUNv3pp6F+zrIXuUilam7ejwbOOa
         ln7ip7h5RBTwg+vAdfDDkvo4HFzRWRavLIS9o4DmZEKvgDmG+0L5ALszzG3sHANTU8KT
         BNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jbQznSb+wFqLy2HcBXlIBiqg0pLGuNPn6ZTMMPpMP08=;
        b=4OI67r/Mv8CC7P+171xazClLwCEgTrVFs6ARaUhSNX4AwcM9mLRq+dFNoLqf+e8A7q
         KO+2iBj3FpxOxF0DUxSfkmw+d9df8wsZ4y5WJW0CDcGopz4nbjm4NmuTToaY4S9WBoPP
         TfZx+s8gsDfCknI6wOQz5UF+hQsUXOcXR6AqHCYQmGnb7MFRu7hc/2X9Ez4z2MGSzUld
         qS8epXujAW0d1NmRkVh69JPwk7mHZzorTwxJvK3HOVogLUvEN6Pd6qNsSyoDNUfe8lkZ
         YAm+h4DuFoeMZONUvMZ/2CXPHXoUyQtLTlRhW2vAqBWqZefEVAS97Ng0k2FzFmVoo7hw
         GfKw==
X-Gm-Message-State: ACrzQf0iDC+o+jXPz+n/QJVJkOrseE74NFczAPQyVJh+Zl/g3ViVGUez
        Efeyozv2ebZG+yrmCY4JU39lmg==
X-Google-Smtp-Source: AMsMyM40MD54Ti3W926Yrdnye+Fcqn5AQBkXm00rZi7PD6JJvmEc8UiE+zZ0P/piCo8AhKh95I9yYA==
X-Received: by 2002:a05:651c:50c:b0:277:31b0:8ba3 with SMTP id o12-20020a05651c050c00b0027731b08ba3mr9531076ljp.290.1668093469744;
        Thu, 10 Nov 2022 07:17:49 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p22-20020a2eb7d6000000b002774e7267a7sm2719591ljo.25.2022.11.10.07.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 07:17:49 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: [PATCH v7 1/4] dt-bindings: phy: qcom,*-qmp-ufs-phy: add clock-cells property
Date:   Thu, 10 Nov 2022 18:17:45 +0300
Message-Id: <20221110151748.795767-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221110151748.795767-1-dmitry.baryshkov@linaro.org>
References: <20221110151748.795767-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add #clock-cells property to the QMP UFS PHYs to describe them as clock
providers. The QMP PHY provides rx and tx symbol clocks for the GCC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/phy/qcom,msm8996-qmp-ufs-phy.yaml      | 3 +++
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml     | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-ufs-phy.yaml
index be41acbd3b6c..80a5348dbfde 100644
--- a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-ufs-phy.yaml
@@ -75,6 +75,9 @@ patternProperties:
         minItems: 3
         maxItems: 6
 
+      "#clock-cells":
+        const: 1
+
       "#phy-cells":
         const: 0
 
diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index dde86a19f792..32ed1886fbae 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -43,6 +43,9 @@ properties:
 
   vdda-pll-supply: true
 
+  "#clock-cells":
+    const: 1
+
   "#phy-cells":
     const: 0
 
-- 
2.35.1

