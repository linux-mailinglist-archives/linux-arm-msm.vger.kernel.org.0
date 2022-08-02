Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5400C587F17
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Aug 2022 17:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbiHBPkK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Aug 2022 11:40:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231199AbiHBPkI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Aug 2022 11:40:08 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D1BA220C4
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Aug 2022 08:40:05 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id e15so12475911lfs.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Aug 2022 08:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dwlezbvhXuRvV5TPdrQiV7stHxCGcT+SmzyEBBd3qdo=;
        b=N0cpFWI/ylXfaxwVjxPbWzBvKvt2QFKUdosx2mmu90xftITQDuB0ZYnRy7mwtY9V4S
         fKV4N4a0JXLzQGnTEkQ0zKxN4fPSw9cy1PHUakHUNQDMT+OPvI5WdBz6isCELWkd8yMd
         HnSEtmi+U9i7LIPXMJ3duagQEsLMFapZZM9faQ/RZqzwltCwg6mER+DOUhNQpPuKePte
         ayhHMD3GmAdEZQTX8syhL0/vfofvEbJBPqRP6v+jNDICrFtFQaU2hY6Uu/TUMZNHk4X6
         ua3w22EcHqHW6WSNXICyCSPN47Mo9agZPv6RmLvHMkjrh+/JZ2STYwpZ2PzV30Qy/3u2
         rrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dwlezbvhXuRvV5TPdrQiV7stHxCGcT+SmzyEBBd3qdo=;
        b=ZSaREuw/w43fxK+PzIzaeudltFTZT6ZdQOTymhmypoqsV2CHFuoLbB6HzOl+l+97di
         OBpaby7Gnb/D0oAWihpWexgu1mAmOZ++ceOGIFwImt+PGdwN/SjKYjW2e9X2tz7sqXg+
         ZFt6oSly+qd7PMQM5v/7Qw8avBXZT0bTcDKpmdrtQ+5Crc03ls2BzOae9w+zkk/Zkz30
         vxr3NBlFUA4Ad21nxQD3+aV3yMtbQh36+Z0e0+Eg8I+wjfa4SnQhSIjmE93HSSC7ewKE
         5uOfq6MPIWHen462CEP98Jt1uLx1GlROjIPFRLGHfWwAzsqIKiWhwDReJN5ufhmjDKaV
         Haiw==
X-Gm-Message-State: ACgBeo1gdWwSfBYAiU1Bkem27hizgQYQUnIt9+43OlFnqtk3nPTiV0DY
        SFCusZ+8zw0cgqxC7XIGzzVZkQ==
X-Google-Smtp-Source: AA6agR5oggDH/S0CVwXycN1Z+nIz4U3RvOhhs5EFFUPMEIJLcH2s8mt3kCdoQKDVs+D3+6ECHMGMlQ==
X-Received: by 2002:a05:6512:12c9:b0:48b:138d:c84f with SMTP id p9-20020a05651212c900b0048b138dc84fmr950215lfg.391.1659454803659;
        Tue, 02 Aug 2022 08:40:03 -0700 (PDT)
Received: from krzk-bin.. ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id c2-20020a056512074200b0048b06f34566sm407669lfs.76.2022.08.02.08.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 08:40:03 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     corbet@lwn.net,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/5] arm64: dts: qcom: sdm845-db845c: drop gpios from CCI I2C sensors
Date:   Tue,  2 Aug 2022 17:39:44 +0200
Message-Id: <20220802153947.44457-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220802153947.44457-1-krzysztof.kozlowski@linaro.org>
References: <20220802153947.44457-1-krzysztof.kozlowski@linaro.org>
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

The OV7251 and OV8856 camera sensor bindings do not allow
property "gpios" and Linux driver does not parse it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not tested on hardware.
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index b9304f81290a..f313f6964810 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1214,8 +1214,6 @@ camera@10 {
 		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&cam0_default>;
-		gpios = <&tlmm 13 0>,
-			<&tlmm 9 GPIO_ACTIVE_LOW>;
 
 		clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
 		clock-names = "xvclk";
@@ -1256,8 +1254,6 @@ camera@60 {
 		enable-gpios = <&tlmm 21 0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&cam3_default>;
-		gpios = <&tlmm 16 0>,
-			<&tlmm 21 0>;
 
 		clocks = <&clock_camcc CAM_CC_MCLK3_CLK>;
 		clock-names = "xclk";
-- 
2.34.1

