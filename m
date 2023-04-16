Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3836B6E39AD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Apr 2023 17:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbjDPPNV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Apr 2023 11:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbjDPPNU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Apr 2023 11:13:20 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A972712
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Apr 2023 08:13:18 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id xd13so23919298ejb.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Apr 2023 08:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681657997; x=1684249997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1fA94NAcl87+C/afR7aU2FClgyJ4wBG784WxvcOq8o=;
        b=mKGjfJXnxdsyCrYyFNzn0vT0G4Zi+94W3E7p/gcYBoeWn7MTlwc92KsbnxL1BT4wxq
         2VE8Qh1fgAhk7gnCgoWkmrqTNST7VnsxTwFS7siQJOTUzofyOy1+9n9/8RW3DA7DOD3b
         rGtlJyYHHZHWSbkNX7V61zUrirkhxnIFPn0EBwlM9dhzD8rJQlVTaeJCo1TyBtyKvBQL
         975jn08KEIlwsZw/CewkyqmpssdqfMw8CElQtaRJX96WL4/cG7VeZtcarh384QI6o1GJ
         AYxTD6q61Rx6GVQxOJ5Np3bXqe0NqKM1jWeuFUONHg8cmCyTYp1SaEBqLRWdgvMdwtTP
         8dBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681657997; x=1684249997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1fA94NAcl87+C/afR7aU2FClgyJ4wBG784WxvcOq8o=;
        b=kfxg6IeOVimRoPoBspLRGSyfdFoWRDhXUDMkUApgT9jyjjv8IA/8E3VXNbLCoLW93F
         QrzcgE55BYaaVn4uhheQwFSwxpOjW49p627X0JXNq0PrV1a598tBXScoLHIUto4WobmR
         wq6wfseAHh1W5gRrKi8BwyQYpS0MnRf2MBAlMQI1FjXepxHtXhnKSwA3G2bE29PSWUjC
         URhPlCv42L0+O41LhoOfInYiMrIEuEn6yA+r71tJzzND2vB5flnTPGWoUKZnAjt3W7Tj
         Bo0NHVwRGkb1jOnEu+IGLuqtQbxVaxxdCk7tb+w+o5wGToeEar+gxUIKbrm+vmkI3TEQ
         OPpg==
X-Gm-Message-State: AAQBX9facmu/qkk2A+6QZWJ/MoKaFA363L1hPv5Ne0UOFZMpIcXUve5G
        qhskf1EYc5tBx2U4XUMv3Y9J9g==
X-Google-Smtp-Source: AKy350Y05MF3d2vyxqLW7Lc7rHVFJsG/aqfTtQVTToYdEpNdzaUly++NgBkdcQSYghDNABRI5awcCg==
X-Received: by 2002:a17:907:4ce:b0:94e:be0:97 with SMTP id vz14-20020a17090704ce00b0094e0be00097mr4577184ejb.26.1681657996890;
        Sun, 16 Apr 2023 08:13:16 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:ba4d:301c:484d:5c9])
        by smtp.gmail.com with ESMTPSA id v2-20020a1709064e8200b0094efcc4a076sm3009201eju.164.2023.04.16.08.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 08:13:16 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/4] arm64: dts: qcom: sc8280xp: correct GIC child node name
Date:   Sun, 16 Apr 2023 17:13:11 +0200
Message-Id: <20230416151311.346596-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230416151311.346596-1-krzysztof.kozlowski@linaro.org>
References: <20230416151311.346596-1-krzysztof.kozlowski@linaro.org>
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

GIC child node is supposed to be named msi-controller:

  sa8295p-adp.dtb: interrupt-controller@17a00000: gic-its@17a40000: False schema does not allow

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 6d3780a75024..5532bf8af211 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -3907,7 +3907,7 @@ intc: interrupt-controller@17a00000 {
 			#size-cells = <2>;
 			ranges;
 
-			gic-its@17a40000 {
+			msi-controller@17a40000 {
 				compatible = "arm,gic-v3-its";
 				reg = <0 0x17a40000 0 0x20000>;
 				msi-controller;
-- 
2.34.1

