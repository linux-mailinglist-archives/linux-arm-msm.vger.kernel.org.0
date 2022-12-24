Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 326EA655B5D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Dec 2022 22:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbiLXVoB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Dec 2022 16:44:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbiLXVoA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Dec 2022 16:44:00 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 535A6BC0D
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Dec 2022 13:43:58 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id f34so11433978lfv.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Dec 2022 13:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tzz+BP69NAct4xSytGrEtJG8lGhPYUMzf/5vG9X4+Ps=;
        b=w8U8ZHfSAS0HK7Nj9h2jGYe8lct0qZlXSdiyx7S4Q707B0DTMdFZDG8uifTX3jp/Qu
         5/DvyefC9yxvCCiK3rb0SQQjKxDoIZlM/JgqCPd6wp1+OhtjgS6cLZEBQn2yxJrDgc1F
         r8s3Vt0ohIZ9jz1zFL015Z3+ddZRx1LN11+HVUN/gaBZZv01oO3bO/7tToBSFvdb0v9p
         OGXTKIwRdg4e4gjirE0jyH0OVpJa/lB3bk2S/vA/FHrAto0XllJZmkRioNFD4N0ZndRO
         fKnRznYqDrCT4BgLPih1VVi9iBqjztfGXbyHPlf0j2iro6TETC2a1FqG+WDnrsgkFmXI
         jUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tzz+BP69NAct4xSytGrEtJG8lGhPYUMzf/5vG9X4+Ps=;
        b=3m2UfXuA0+oxtZhdADfdHb/pWrq3/ftyvCAkF3QiHXjvq/CiqzML7jqXNVUzfwx2Di
         5jURzUWKZBFOvU3NMyG8DW53GeHy2qK0AA9AMwaL4F2MPXgwiP3BFR3ezbDnKV2FzH/L
         P05kvFdxWIkzFM1Js5vv5NTkc0LmIEB6XZ3d44TcHxxbrQJsjNQpfbRtCoifOR3Hl1IF
         D1HvWmAg+On5MrtGgKZHUFnZP0AfKWluwKq1EQ1w3RbFUh+O8cWTa0PFgKTG13u3OES/
         o6L6ESJ2uD/SIYBtouQrEDt6aAInav5kMuxoUBpOY456r6QI2EgtbEzHUvMkjtUJMbOY
         3FUQ==
X-Gm-Message-State: AFqh2kpShi2nwlnyaXiY8GHuHenf65dna+2CaETT4rwushYqIlVW3MEX
        J37AySSlu7uu5ezriIqnvbVF6A==
X-Google-Smtp-Source: AMrXdXtLkrVO94d3AI+pDVIzVjoeW9kMIQB460bixhhadhOrpeWKsfMz5O1mCw12RV1VBi3tVyNzFQ==
X-Received: by 2002:a19:7414:0:b0:4b4:bea4:15c9 with SMTP id v20-20020a197414000000b004b4bea415c9mr4302729lfe.21.1671918236644;
        Sat, 24 Dec 2022 13:43:56 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id j13-20020ac2454d000000b004c7d0ed9619sm1117861lfm.123.2022.12.24.13.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Dec 2022 13:43:56 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sm8350: correct SDHCI interconnect arguments
Date:   Sat, 24 Dec 2022 22:43:51 +0100
Message-Id: <20221224214351.18215-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The interconnect providers accept only one argument (cells == 1), so fix
a copy&paste from SM8450:

  sm8350-hdk.dtb: mmc@8804000: interconnects: [[74, 9, 0], [75, 1, 0], [76, 2, 0], [77, 36, 0]] is too long

Fixes: 60477435e4de ("arm64: dts: qcom: sm8350: Add SDHCI2")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Fix for v6.2-rc merge window.
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 4fc15cc69b8c..0726930c9e28 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2382,8 +2382,8 @@ sdhc_2: mmc@8804000 {
 				 <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "iface", "core", "xo";
 			resets = <&gcc GCC_SDCC2_BCR>;
-			interconnects = <&aggre2_noc MASTER_SDCC_2 0 &mc_virt SLAVE_EBI1 0>,
-					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SDCC_2 0>;
+			interconnects = <&aggre2_noc MASTER_SDCC_2 &mc_virt SLAVE_EBI1>,
+					<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_SDCC_2>;
 			interconnect-names = "sdhc-ddr","cpu-sdhc";
 			iommus = <&apps_smmu 0x4a0 0x0>;
 			power-domains = <&rpmhpd SM8350_CX>;
-- 
2.34.1

