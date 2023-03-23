Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0AF26C7420
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 00:37:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231328AbjCWXht (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 19:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230489AbjCWXhs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 19:37:48 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C618F2CFC3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 16:37:41 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id j11so12569lfg.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 16:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679614660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o07buN/HRuobmAQ+KkVeJRRlmdYaWjl/QV1UabYdb4s=;
        b=Pd/avFwuIxfoEIsL8Ol+tNu8Kp1QuJvMpvVVGzjCcluIhGeaJapsFAX35/yX2T2fLZ
         NgHdXxKC1G4c25KDjWVANSSaQz7R1z0EA6KqJYrf62u2WVFJKmS3U2FfktK36hpvx0wV
         ep6x36bnp0ONExyqU0lHEFu16O7XOrEBnTUtkVvJ0Td9QFOIXsKWpVbro6tWo8pOGXv7
         9Qgg56ePyy6OZAZVDVaOKPL6fm8EHqGN0LCHu8hjCBNwcg0UMb831nrpcvjqz476UU7h
         2R4PRIdLPJPZ1WhulAZWvF5rxh9PO8m7N/JTUiXs9hNqQFfhfxhYBWuy5SXJPeDOWz57
         EDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679614660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o07buN/HRuobmAQ+KkVeJRRlmdYaWjl/QV1UabYdb4s=;
        b=a3s/0oZq5edgz8ZTixyUeRFmm1yry0NiYZwndEnOC2cKOWYys89X3Rq9WfxNSGstpN
         g2QS4w4tLMSUbatlqg1CGUyHmY0/h5k7wTwXT7KFHRUXhcvrz8RlXqcVIDjUWO+EGHIo
         0duca4b1hUx521PWA9uXi+BwisNaRNaurE2Ea6Jr5F8rd+Bx/pNfObqRTEBbh+NhC5xb
         pY2zkpU2p8XvJkN5FcxS/b6wy/F09gZpw1OZVrmoFfY5146T9IaLZRaaIg8hgYvIwPaY
         bUjkfjZzpLt2RkkbPvA/rYcfpivkbU6NsFmq1x55yxp1XCelcZR1r02miPUxT4ex9Epc
         cdUg==
X-Gm-Message-State: AAQBX9fTpiPk7f882Q1GwuhPrJTRwYOqhKhsTKIl/XCKekC4pDKsF+vE
        6NGn4kIkiT960NbJuwET5+r2WQ==
X-Google-Smtp-Source: AKy350bpYcxGJgy3ZamzBHh2LlTEdsqS/ijaqu3zHZghVZIfQR5LpR/cZxXFaFrXkUT1jEum5bowwg==
X-Received: by 2002:a19:5211:0:b0:4ea:e573:f0e7 with SMTP id m17-20020a195211000000b004eae573f0e7mr129828lfb.5.1679614660172;
        Thu, 23 Mar 2023 16:37:40 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id w9-20020ac254a9000000b004e845b49d81sm3105264lfk.140.2023.03.23.16.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 16:37:39 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/5] arm: dts: qcom: ipq4019: update a compatible for QCE IP on IPQ4019 SoC
Date:   Fri, 24 Mar 2023 01:37:31 +0200
Message-Id: <20230323233735.2131020-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230323233735.2131020-1-vladimir.zapolskiy@linaro.org>
References: <20230323233735.2131020-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the old deprecated compatible name to a new one, which is specific
to IPQ4019 SoC.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index dfcfb3339c23..3968bf0f585b 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -315,7 +315,7 @@ cryptobam: dma-controller@8e04000 {
 		};
 
 		crypto: crypto@8e3a000 {
-			compatible = "qcom,crypto-v5.1";
+			compatible = "qcom,ipq4019-qce", "qcom,qce";
 			reg = <0x08e3a000 0x6000>;
 			clocks = <&gcc GCC_CRYPTO_AHB_CLK>,
 				 <&gcc GCC_CRYPTO_AXI_CLK>,
-- 
2.33.0

