Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6103C64A0F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 14:33:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232359AbiLLNdM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 08:33:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232186AbiLLNdL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 08:33:11 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B72D763C1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 05:33:08 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id z26so694618lfu.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 05:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nQaNe1YlwQpI932W71SvBf5OrdAprQKocQe4vybQdGk=;
        b=gSGlJpBogJp7YC/e7sOnzf3ZmZSAWSHDJZltZFbNvXy/zkz6SpDI+7ukaYLhfHhLdj
         mfg7FuGBMyJWMm4KjfGJfJjfyTKiavfzXg1NXewLymjJIBPcyI19FkVF9gvsLfog1B7f
         JNJSzjUYs9syUsPE8qae4sR9WZLKZY9w8pMWU6oosE5VhQ+pDXEtvoQNHPVmo6efwHW9
         xJl0PvPBXN1hipby5GloirZ53fuvaaigmbgGX02S6ljj4lZU+1Zpx6WknEOOUfi9mJ/E
         mqezUo9h1spsFZ78TszkDzWZpY2t2QgTNdL3T/DgPXA7RTu0JHRC6ZOztANolPevqVpx
         sq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQaNe1YlwQpI932W71SvBf5OrdAprQKocQe4vybQdGk=;
        b=MldOSLEHEW8pTRkry5Yz7maq2IEzqjRoXZ/pkra3G8w2SEbc8RH34fcPmReNHhUjWm
         E/qh3qw9dJt6OexIdONdffhxIh6KGHgQyXIWM42q8nx8yC8hcddsMd+wxDR9IWQR2XGC
         tpTzbTuhhY1qRD4ZgJ119G8/hlonH6ouwp7wt2tZsxyqi7OlE9u14vZwKbcIn0MtEW4N
         GVbGWMyj0KAcp6jANLSdgFmmkhM9K0Alvw1aIcJmbjZwyuBk6G3u9Slyyr8cUevHSSRi
         BD5i83kizxiGqIVGBY2u0IOXTdiTpgVQYACVAXJwR4PVpTvtRKtDEoNe1apJoT9ysevo
         sTNQ==
X-Gm-Message-State: ANoB5pnvpXNMAU+6UCjuJb9xcDrE/xSDLooP+x3V7x3tLlDfZmMY8QdJ
        sJu7zrbVbyoeha2PQ60LcsbqWQ==
X-Google-Smtp-Source: AA0mqf4aMs/lvVUJWTvlZrlh5LlBj39FTnM/zXaO+YiWmgvmxnLcNtbFnwfHSPHmAxOqQ7ENyaVOKA==
X-Received: by 2002:a05:6512:963:b0:4a4:68b9:1a0a with SMTP id v3-20020a056512096300b004a468b91a0amr3947925lft.50.1670851987076;
        Mon, 12 Dec 2022 05:33:07 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a18-20020a194f52000000b0049478cc4eb9sm1624435lfk.230.2022.12.12.05.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 05:33:06 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] arm64: dts: qcom: sc7180: correct SPMI bus address cells
Date:   Mon, 12 Dec 2022 14:32:59 +0100
Message-Id: <20221212133303.39610-1-krzysztof.kozlowski@linaro.org>
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

The SPMI bus uses two address cells and zero size cells (secoond reg
entry - SPMI_USID - is not the size):

  spmi@c440000: #address-cells:0:0: 2 was expected

Fixes: 0f9dc5f09fbd ("arm64: dts: qcom: sc7180: Add SPMI PMIC arbiter device")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index eb1e1ea12ff6..906fb9343bcc 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3274,8 +3274,8 @@ spmi_bus: spmi@c440000 {
 			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
 			qcom,ee = <0>;
 			qcom,channel = <0>;
-			#address-cells = <1>;
-			#size-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
 			interrupt-controller;
 			#interrupt-cells = <4>;
 			cell-index = <0>;
-- 
2.34.1

