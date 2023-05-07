Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 434716F9AAD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 May 2023 19:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbjEGRpX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 May 2023 13:45:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjEGRpW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 May 2023 13:45:22 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B1C11154E
        for <linux-arm-msm@vger.kernel.org>; Sun,  7 May 2023 10:45:20 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-956ff2399c9so694208666b.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 May 2023 10:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683481519; x=1686073519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FnaFvQtk5RCbSc0HkQXo9hYUcfwd4yGfUrY8gg7fPlc=;
        b=partaccxiKHpy3EN6jq6pZQtPzZPOfgYbaywUdTjL6gqDZMHKy4Qav/tPgr89P1Xs7
         TnEmTjrU95alEm/0ki5zyTAjpxYKtt58cSG3Vzz+IZaZk2J4ZGLoPdpHcgp9OvX0B+Wg
         DHmbSKEqGh3Df/rjC4ZjGKMZObHaO6N305DR6VT6mUPKRtgkcZhvqDbo3qwnxBQ7gKeY
         SSTcFPi471K3BymgubZNAJdAUh0fkSHpHfekwaB1yrehuvbqoc0zsLYp0/iKXZJAsf60
         J19BO/Amwb38tLH+YvFBQNJveFjs98nThke5C9cRv8vCSRN51oTwQb+Oc5DStp8qABsD
         owTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683481519; x=1686073519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FnaFvQtk5RCbSc0HkQXo9hYUcfwd4yGfUrY8gg7fPlc=;
        b=Tk2l7ssT8TQH4o3ENnylw60arA/keNsmInpIqnId9hijl1xfRwEXaLBAC4jl3h1sGp
         hpYKD6BVcRUu5rcZL7KZZAdcWXue6v50kcRhcBw5AE06jEDs7uqlqJBPVWcpj9QVh69d
         Wqnt+S7AeyqkwoLJb7prK6F70nFYM22c2dxqfj6wpZSwHFHm5c7/ga06M8WW6Qk8KO5l
         uhcWfexa9HYMXu2swYT4IJY+AKt26mshIuLJxKla9t0i2rW+Px/vPzhH3mH6T0UyUXz6
         1pyCeirai7ySR7Jt9aCQ+CDoU0egAu9GhfbI3HJaeYmAMOs2EIq4nVmFOVBd+1ejMqXH
         oKvg==
X-Gm-Message-State: AC+VfDwiz1v/VXarpRN/iqK3MtA+pX41r9ABCap8q/rkt80zIDlDifOx
        Lbog6Cj4xBpBMzyyx8bH43txIw==
X-Google-Smtp-Source: ACHHUZ6lLf0xi9P2OkgQO+mMJLYRLDg8Zti2jPttS7o9cBg/yBDcsVuwbHOHn9nLxdZrnNUr/rkgNQ==
X-Received: by 2002:a17:907:9708:b0:94a:8b35:f15d with SMTP id jg8-20020a170907970800b0094a8b35f15dmr7589305ejc.45.1683481519023;
        Sun, 07 May 2023 10:45:19 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:1757:b51a:9965:e81])
        by smtp.gmail.com with ESMTPSA id jl3-20020a17090775c300b009655eb8be26sm3950864ejc.73.2023.05.07.10.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 10:45:18 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] arm64: dts: qcom: msm8916: correct LPASS CPU clocks order
Date:   Sun,  7 May 2023 19:45:14 +0200
Message-Id: <20230507174516.264936-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Re-order the clocks for LPASS CPU node to match the bindings (Linux
driver takes by name):

  msm8916-asus-z00l.dtb: audio-controller@7708000: clock-names:1: 'mi2s-bit-clk0' was expected
  msm8916-asus-z00l.dtb: audio-controller@7708000: clock-names:2: 'mi2s-bit-clk1' was expected
  msm8916-asus-z00l.dtb: audio-controller@7708000: clock-names:3: 'mi2s-bit-clk2' was expected
  msm8916-asus-z00l.dtb: audio-controller@7708000: clock-names:4: 'mi2s-bit-clk3' was expected
  msm8916-asus-z00l.dtb: audio-controller@7708000: clock-names:5: 'pcnoc-mport-clk' was expected
  msm8916-asus-z00l.dtb: audio-controller@7708000: clock-names:6: 'pcnoc-sway-clk' was expected

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index bf88c10ff55b..e7ae81296b20 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1520,20 +1520,20 @@ lpass: audio-controller@7708000 {
 			 * Primary/Secondary MI2S both use the PRI_I2S_CLK.
 			 */
 			clocks = <&gcc GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_CLK>,
-				 <&gcc GCC_ULTAUDIO_PCNOC_MPORT_CLK>,
-				 <&gcc GCC_ULTAUDIO_PCNOC_SWAY_CLK>,
 				 <&gcc GCC_ULTAUDIO_LPAIF_PRI_I2S_CLK>,
 				 <&gcc GCC_ULTAUDIO_LPAIF_PRI_I2S_CLK>,
 				 <&gcc GCC_ULTAUDIO_LPAIF_SEC_I2S_CLK>,
-				 <&gcc GCC_ULTAUDIO_LPAIF_AUX_I2S_CLK>;
+				 <&gcc GCC_ULTAUDIO_LPAIF_AUX_I2S_CLK>,
+				 <&gcc GCC_ULTAUDIO_PCNOC_MPORT_CLK>,
+				 <&gcc GCC_ULTAUDIO_PCNOC_SWAY_CLK>;
 
 			clock-names = "ahbix-clk",
-					"pcnoc-mport-clk",
-					"pcnoc-sway-clk",
 					"mi2s-bit-clk0",
 					"mi2s-bit-clk1",
 					"mi2s-bit-clk2",
-					"mi2s-bit-clk3";
+					"mi2s-bit-clk3",
+					"pcnoc-mport-clk",
+					"pcnoc-sway-clk";
 			#sound-dai-cells = <1>;
 
 			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1

