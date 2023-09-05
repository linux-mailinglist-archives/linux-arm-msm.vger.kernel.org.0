Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87058792B06
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Sep 2023 19:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238147AbjIEQqQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 12:46:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356688AbjIEQdn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Sep 2023 12:33:43 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E2B5E52
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Sep 2023 09:32:48 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5007c8308c3so4319750e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Sep 2023 09:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693931477; x=1694536277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trFwEkPHlkfNhWfOX9Zlwo/iFiG9jTiXGcKaA8Pa3TY=;
        b=S3pOonpO07hOoGmp+eJeRfE5WigcH4vcmAQfuEavI46T2XPpsZMbubjUb4vUAgXohQ
         vNyr6qwF/8o1G1xczLgOlSBlkmoOmi2Tntegidmp2oOfMww+iny7Hemev+LWvaLcBB3z
         XENvkP6Fo8WYUV+3xduNlR6WKqmUK1slDlEfjWZJZRr/ec1R4R/9LqM+Bu8Kmy9YK8XU
         2EkwVuOUZ3uvqxad5aZJEy6nfPDIk7jXRNPEKxpapiPwQw8SoskplfEJAA64hNFbQMq5
         DbeuR7SnRnl/eLrgIA17TExO48vVqCFvdPRX+03GJR3a5jC+jRqyRWtCFNiYZwdRYQGW
         TS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693931477; x=1694536277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=trFwEkPHlkfNhWfOX9Zlwo/iFiG9jTiXGcKaA8Pa3TY=;
        b=CGFCimiS+6ip5ZmQ32PS4nS+rBjGCHE3EvaFPVzeEDpA9T6GpXkD+C9HeiZBw7vYcK
         3bgSJxbppTIhAKmUL9BOY30YeCFcNlemRKWiP6waGaR7++nu+G//rvpixu8lBBd2d9lK
         PGKBC5xwSWgzuaceOUGQafkse7raREF/uA4SY5RaKP/YenNr2ngY1xIiuBGpQLezOBEb
         LcKA8t81pxDYkYfZ+TcY17FE/xyivPttVdLxzAnKYlCLbj41sMP7qPb4iJQJfl4XXwGT
         4ixsjvRIvA+ifya+FAJHuN1ZHTh+ND/sAW4EXb6hQjWZPGEoeyds/tL2eZZyQmZyltYR
         rbVA==
X-Gm-Message-State: AOJu0Yzdp6YCCt3UKb21ysCwbdoPxNCQpxrI4w0aDmIHPNNB9E/Ofh7b
        6dpMKwqEe7hm1jq9hHlwHPwtmui/OY4aERDhkC8=
X-Google-Smtp-Source: AGHT+IEmQSd2edyvfFattJQO+ByTRQHwtfpRZPVH9fJSPo0gW/FR1OCbHCt1pdWtw63JsCDL0UuBEA==
X-Received: by 2002:a17:907:789a:b0:9a5:b874:93d5 with SMTP id ku26-20020a170907789a00b009a5b87493d5mr254649ejc.76.1693930779404;
        Tue, 05 Sep 2023 09:19:39 -0700 (PDT)
Received: from krzk-bin.. (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id v26-20020a170906489a00b0099cc36c4681sm7743165ejq.157.2023.09.05.09.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 09:19:39 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 10/12] arm64: dts: qcom: msm8998-oneplus: correct UFS pad supply
Date:   Tue,  5 Sep 2023 18:19:18 +0200
Message-Id: <20230905161920.252013-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230905161920.252013-1-krzysztof.kozlowski@linaro.org>
References: <20230905161920.252013-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm UFS phy switched from dedicated driver to QMP phy driver.
Eventually the old driver was removed in commit 02dca8c981b5 ("phy:
qcom: remove ufs qmp phy driver").  The original driver and its binding
used vddp-ref-clk regulator supply, but the new one did not and left the
supply unused.

The Qualcomm UFS phy bindings were also migrated to newer ones and
dropped support for vddp-ref-clk regulator in commit dc5cb63592bd
("dt-bindings: phy: migrate QMP UFS PHY bindings to
qcom,sc8280xp-qmp-ufs-phy.yaml").

It turns out that this regulator, although with inaccurate name
vddp-ref-clk, is actually needed to provide supply for VDD_PX10 (or
similar, depending on the SoC) used by UFS controller.

Bring back handling of this supply by using more appropriate regulator -
UFS controller host supply.  This also fixes dtbs_check warning:

  msm8998-oneplus-dumpling.dtb: phy@1da7000: 'vddp-ref-clk-supply' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
index 68e634f8212c..e6a69d942a4a 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
@@ -534,6 +534,7 @@ &ufshc {
 	vcc-supply = <&vreg_l20a_2p95>;
 	vccq-supply = <&vreg_l26a_1p2>;
 	vccq2-supply = <&vreg_s4a_1p8>;
+	vdd-hba-supply = <&vreg_l26a_1p2>;
 	vcc-max-microamp = <750000>;
 	vccq-max-microamp = <560000>;
 	vccq2-max-microamp = <750000>;
@@ -544,7 +545,6 @@ &ufsphy {
 
 	vdda-phy-supply = <&vreg_l1a_0p875>;
 	vdda-pll-supply = <&vreg_l2a_1p2>;
-	vddp-ref-clk-supply = <&vreg_l26a_1p2>;
 };
 
 &usb3 {
-- 
2.34.1

