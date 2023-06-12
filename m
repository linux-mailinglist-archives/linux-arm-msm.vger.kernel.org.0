Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A11572BCA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 11:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234825AbjFLJcS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 05:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234846AbjFLJaj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 05:30:39 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5262D35AD
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 02:24:55 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f6e4554453so29317695e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 02:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686561894; x=1689153894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/BwPT61gNb/fpvsQAhaitGbvL3MEPuuuuNNy2pTzoE=;
        b=KHKdjQnx0PTEmRzkJeZY3O856gAgS3Hdc359skiRzSs2ciEHOPaOFgjUVc/wO0JOvu
         8QRdBnSv+EpJxtw+vLXcuZ2cXgNGtF894/O/Z/fQDBOMUUO//qoKGVyNWVnPGZblfP7S
         9fuhxIDMQebFvrJhPuZ4btq9pjjepa44vnED5QD5aXI9zMok4d/PF4D+0jEWDMXfujCn
         oPpYG9VmBg5YBg8Rw5qGxzf6uNUd6/FJit9UvVSVn7GOGDFdSxBGLyVDpcVg6UUUn4Py
         1unlaSr7kVEPk0ryxuCCi9hRPqDELZuCqySYJWzNODdIiuQcCRL71x4NS7A49Xm3HIc2
         nw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686561894; x=1689153894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/BwPT61gNb/fpvsQAhaitGbvL3MEPuuuuNNy2pTzoE=;
        b=G3ArESPGDeKYouE8n5qFc7zWQIzIk/OatBa1NrGOyBvEulpdRgj6ASwauBC/FCVNQ0
         rLxTYQUP5GlgO3z5JCE9RNWInokygkZWqETMV/egiG1ndgzp0VgsiOijC9yucNLkYUa1
         jy4gLaWgP9o6taNTVLtvA8dOhOcXwr6ecFviqVYctKlXyz5bbNk1KhszAA1cel1PhRKW
         7R8zgkygQGvpYkM7liMp1C+lIZMxMTiHRkOkvYmCI3Cz5WR9Vu5x8HG9BNHs6s3uxSpU
         dSbyPIc6ef0Bq+pgIvUUjajcTk9S8JfZx54zG/QnGsjhUVBF17Hc92tdwfKLOCTEuSOE
         GDow==
X-Gm-Message-State: AC+VfDziAK56tEKs+nn72qDnCLycXQZq+OtPZ7q4ibb/GdSt+OwZeJ0E
        CwDbZKm3IzX/OSW6F0zg3h2/tA==
X-Google-Smtp-Source: ACHHUZ4E3nyef5IaWSpbvQhPsPLIUwzbLrCVEH1BYy2PCoLie+du+ZB9jNZyHE7R35n0ahbM/lttWA==
X-Received: by 2002:a05:600c:299:b0:3f6:444:b344 with SMTP id 25-20020a05600c029900b003f60444b344mr5600857wmk.34.1686561893854;
        Mon, 12 Jun 2023 02:24:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a222:bbe9:c688:33ae])
        by smtp.gmail.com with ESMTPSA id p14-20020a7bcc8e000000b003f727764b10sm10892044wma.4.2023.06.12.02.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:24:53 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>
Cc:     netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 19/26] dt-bindings: net: snps,dwmac: add compatible for sa8775p ethqos
Date:   Mon, 12 Jun 2023 11:23:48 +0200
Message-Id: <20230612092355.87937-20-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612092355.87937-1-brgl@bgdev.pl>
References: <20230612092355.87937-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the compatible string for the MAC controller on sa8775p platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 363b3e3ea3a6..ddf9522a5dc2 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -67,6 +67,7 @@ properties:
         - loongson,ls2k-dwmac
         - loongson,ls7a-dwmac
         - qcom,qcs404-ethqos
+        - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
         - qcom,sm8150-ethqos
         - renesas,r9a06g032-gmac
@@ -582,6 +583,7 @@ allOf:
               - ingenic,x1600-mac
               - ingenic,x1830-mac
               - ingenic,x2000-mac
+              - qcom,sa8775p-ethqos
               - qcom,sc8280xp-ethqos
               - snps,dwmac-3.50a
               - snps,dwmac-4.10a
@@ -638,6 +640,7 @@ allOf:
               - ingenic,x1830-mac
               - ingenic,x2000-mac
               - qcom,qcs404-ethqos
+              - qcom,sa8775p-ethqos
               - qcom,sc8280xp-ethqos
               - qcom,sm8150-ethqos
               - snps,dwmac-4.00
-- 
2.39.2

