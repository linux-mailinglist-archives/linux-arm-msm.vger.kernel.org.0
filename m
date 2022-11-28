Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5079363A94D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Nov 2022 14:18:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231567AbiK1NS5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Nov 2022 08:18:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231706AbiK1NS1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Nov 2022 08:18:27 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDD6422504
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 05:15:57 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id p8so17259005lfu.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 05:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFUGrGulSqeLcudYT6o+J8i07U+IR9phc3EsZvzsY2g=;
        b=YwogcFBW6P99XURzXY2P3bZL/y5V2KbfLgkN9yeiinGBzmHWYeTQCgnAZkXIocQYrk
         Lljz2szTgAs8xkonxFRvGtx+nelCX26MhXHvH2umtYm0fcuG1eU2aM2JJeHXCY733MFS
         NeKqw9bRFRIjc2vXdP/I4fhHbkWDWPWtG1K0rvPzgh+bunA883hyAZxKTCuHsyM2fIPB
         EkFEsflgiNX+T5N+q2YcJEXUwuX/2Rp7YB1FuSK+NH4sjtfAoUmaZg9cPtol4nFcRsPu
         sEvMtnCET/wjRhV6kSYnnEdVgrQCXpN3KyMe8in5XOuc31eYg0vcDmN4N2mji17uN7cm
         oEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pFUGrGulSqeLcudYT6o+J8i07U+IR9phc3EsZvzsY2g=;
        b=6z2UXkqCWE5eSLu+YtlSBfy9+0GuOPH6tvLOzuYt9qmBdXhA0ihBjHFEKiJM05xF+S
         YlE6qxo0wu5Q0V2E1rCuoiqWrUYN3I/LKxdhvHWZSvMEYYAdCo3qWIT7CzUauyYNFdyV
         6a04IkCzDGa/IsmEvzTtWAlBIbEUUCJNtLoffI3VVDqESCRWGyz3nNZ8xETZr02MomFW
         e945xbEJw2o8z59ejYq8E0ADtlkFoCmEPi8ypF2maDeUKN4EaquCrJnZS67VA5TVBbor
         hUyO7kOEZQIqs1GcUMkEmm4QjWDfCFQ/uCeBqOKNQL9Gf9JRizzeM7mcjB7KOOO4sEit
         ayuw==
X-Gm-Message-State: ANoB5pkAABYZeVVe6rrLbHUOGan2MPTeTgOBzx58J8BvvltRNvpYSPFD
        3Suc/dTcYap+2q6tF0z2I0tFKA==
X-Google-Smtp-Source: AA0mqf73+jgZnwYM5AAMKzPSbH0jz6Q6He8rw8CjfkpV976BOc3ycXESmVTaxeC48Ydd5ankvzpaVA==
X-Received: by 2002:a05:6512:39d4:b0:4b3:b6db:8cb5 with SMTP id k20-20020a05651239d400b004b3b6db8cb5mr13994342lfu.599.1669641354666;
        Mon, 28 Nov 2022 05:15:54 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id r2-20020ac25c02000000b004b4e373df2bsm1739044lfp.202.2022.11.28.05.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 05:15:54 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] arm: dts: qcom: use qcom,msm8974pro for pro devices
Date:   Mon, 28 Nov 2022 15:15:50 +0200
Message-Id: <20221128131550.858724-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221128131550.858724-1-dmitry.baryshkov@linaro.org>
References: <20221128131550.858724-1-dmitry.baryshkov@linaro.org>
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

Use new qcom,msm8974pro compatible string instead of qcom,msm8974 to
clearly mark that the device is using the Pro version of the SoC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts             | 2 +-
 arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts              | 2 +-
 .../arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts b/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
index 38e69ed4fd1b..6523257815a0 100644
--- a/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
+++ b/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
@@ -8,7 +8,7 @@
 
 / {
 	model = "Fairphone 2";
-	compatible = "fairphone,fp2", "qcom,msm8974";
+	compatible = "fairphone,fp2", "qcom,msm8974pro", "qcom,msm8974";
 	chassis-type = "handset";
 
 	aliases {
diff --git a/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
index 38a95430c7d4..52ece17986e4 100644
--- a/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
@@ -7,7 +7,7 @@
 
 / {
 	model = "Samsung Galaxy S5";
-	compatible = "samsung,klte", "qcom,msm8974";
+	compatible = "samsung,klte", "qcom,msm8974pro", "qcom,msm8974";
 	chassis-type = "handset";
 
 	aliases {
diff --git a/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts b/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
index 8265a0ff7857..07131db2e35d 100644
--- a/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
+++ b/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
@@ -8,7 +8,7 @@
 
 / {
 	model = "Sony Xperia Z2 Tablet";
-	compatible = "sony,xperia-castor", "qcom,msm8974";
+	compatible = "sony,xperia-castor", "qcom,msm8974pro", "qcom,msm8974";
 	chassis-type = "tablet";
 
 	aliases {
-- 
2.35.1

