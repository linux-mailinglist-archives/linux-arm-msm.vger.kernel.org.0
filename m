Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A989E6C9672
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Mar 2023 17:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232628AbjCZP6X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Mar 2023 11:58:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232566AbjCZP6K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Mar 2023 11:58:10 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E034C02
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 08:58:06 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id h8so26200250ede.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 08:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679846286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUZO+ORdbt5gtxFXtN1M8FjeBkFUtE/ZKLUoQlYTbZQ=;
        b=VwGnsnKnOojswfK55Dj2BtFo/c/mYINye6vfN3NHn7ZRHzxECZUx3xlvrHOqPr59II
         /gxQ6yFiC8GNLImcLJXc/WDwJKLgTFPWLpZiKilFLQMgzfo6TNdtYR5kDIKD6l4xWh7P
         VumDslXOd/JS5iLcZTkQ1+YBq7QZBstIt+BSHiH2aGTsCV2zQOd0kLe1Ng+H6CI24Vs3
         EJ7l5t0PjpljQwkjs3kK5Dtsfb20Upef+MAUvOnTpbcCB4tuwmpQtxfowSAnyHObgyw/
         TlluVvzS6E3qqBzjvHm8BnzSe2lbpPlWpAqHy/eWrLfphE49y7XZpB9uJn4MBT1CrePT
         PZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679846286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KUZO+ORdbt5gtxFXtN1M8FjeBkFUtE/ZKLUoQlYTbZQ=;
        b=CafCH4erByOdf5H7zavDdB8aP73Uj+kTCr/hKc+kqSsxoQMHljgJqo79Tn6IP4ol7o
         QmtIbLfKPOnAR+ZCKSdUxI3uvOCU5iT3MWHZUiB8jOkBz+nfRTGGYl5Pvga1fV87GTKA
         BQzWYkCNV5q34YoRZHA4tNVkB8YCLnl3EJVkv6LjsMiHRFI2fRqQenIgGXRCZFo0pqd+
         9JrcwXAmhgDDHDqHYmlnoe1xg/838EcoC58PS07cWp55nuOlIhfsmtifYp/SpSbOxjka
         H1O0IffEF04DMJi4AGBYoDZuJQSHuio57IQN4b79lQGQ/mqGpDKuRKHv3u63eRFDCmrb
         iB4w==
X-Gm-Message-State: AAQBX9cnHVzuvkHcFrcJ93vblO9oa+a+dB+m9eOB9tU97Su3th5Hv2lN
        VigMspItEL5m5+H9fJ/PcKLgdw==
X-Google-Smtp-Source: AKy350YPtSDES281wsfVsDQaksITG1/vZ/cULADAj6H4uWJXLtyjTbBd3Ar43HoFXckxXEZvzPSHBg==
X-Received: by 2002:a17:907:1628:b0:931:af6a:ad0f with SMTP id hb40-20020a170907162800b00931af6aad0fmr11768309ejc.76.1679846285869;
        Sun, 26 Mar 2023 08:58:05 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:eca3:3b8f:823b:2669])
        by smtp.gmail.com with ESMTPSA id q3-20020a50cc83000000b004fc86fcc4b3sm13705502edi.80.2023.03.26.08.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 08:58:05 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 10/11] arm64: dts: qcom: sdm845-xiaomi-beryllium: drop invalid panel properties
Date:   Sun, 26 Mar 2023 17:57:52 +0200
Message-Id: <20230326155753.92007-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230326155753.92007-1-krzysztof.kozlowski@linaro.org>
References: <20230326155753.92007-1-krzysztof.kozlowski@linaro.org>
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

Panel does not have children with unit-addresses thus address/size-cells
are not valid:

  sdm845-xiaomi-beryllium-tianma.dtb: panel@0: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index e0fda4d754fe..e444ef1cd742 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -232,9 +232,6 @@ display_panel: panel@0 {
 		vddpos-supply = <&lab>;
 		vddneg-supply = <&ibb>;
 
-		#address-cells = <1>;
-		#size-cells = <0>;
-
 		backlight = <&pmi8998_wled>;
 		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
 
-- 
2.34.1

