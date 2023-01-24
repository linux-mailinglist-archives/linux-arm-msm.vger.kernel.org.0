Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA18E67937F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jan 2023 09:50:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233391AbjAXIuO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 03:50:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233259AbjAXIuL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 03:50:11 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C74BD3F2BB
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 00:50:04 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id f19-20020a1c6a13000000b003db0ef4dedcso12278106wmc.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 00:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mINvInL15zkPC1A/khy7KRKihohfos6iJmfsJcygUoI=;
        b=dWCywYrXtrYLY3bQ0NDq/kA/CBmW5rZ+LaIJsKWsgb5/dTuVF8nWm0XZoLRiuyVjZz
         yICvCiJIe6VFyq5D9QBJnjNo8De+08H3KoLTvMi6xOrItsfHWROm1lU7JgaCzlcJ4zrL
         sm9VKawk1+k3Y/LOeFvwaUQLCCKH1Oh7zQrJLV3TBvTtL4KJkK+zCZCzZ0DUkImHIaso
         nACzqzbI2yJ0/7VOfyg3+dn4ibo3vdMNR75hqzDVnZREP6Pamc/CGxUt6xzIKO5pqpZL
         TE2s9eWKdgYYVOe7RWUd/+lT2gYmw/+1wjBI0YFs+8j1AvDZ2xkW8Ud8+PGqllgQlBUm
         CPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mINvInL15zkPC1A/khy7KRKihohfos6iJmfsJcygUoI=;
        b=2Ma1W4tqOMMmAryTa2INpOl/NFwvWmiaXt+1WVAUqMrL/6yXermZRh3HUnrSAm2JDw
         e8MeUrxwatZTVhT4WhndTS/vDgKaETCI6L7nNfjyVmYi6+RF+7NViOUHUaLcsTHYTx62
         LufnD7ZS3vJifgpaRTZiPwjUOgpls/dJrExTpNp89S5/PKLazZb+EtnCerLon9yTVmlp
         pDJj06vRTmAC0WI8PclZ9Qlglqlct3KpmXBjyH+UgaaAP1DRvfwiI6SDduoylhnRZZVA
         Y4t2Q7YVBqVQEILB2HCwnhXSgQyW5BKByaYLTxA28+rDjHOcRJ6SxVNFpM9yXuxKODvE
         Smdw==
X-Gm-Message-State: AFqh2ko1KgJnFHPBUp5EgpEHWgfj3f+lE65VqwGkhQJ90Ly8DanIhLm4
        9OKeA7U0gkUYHFy8283SrVonVA==
X-Google-Smtp-Source: AMrXdXtsDtTago74US23BpS2ek377xae47ILUPxf0vTMEZSfBojeGh+syIfZ1o8ehzbaoAC06nUCow==
X-Received: by 2002:a05:600c:214f:b0:3d9:ecae:84f2 with SMTP id v15-20020a05600c214f00b003d9ecae84f2mr25649246wml.25.1674550203304;
        Tue, 24 Jan 2023 00:50:03 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p18-20020a05600c431200b003dab40f9eafsm1340036wme.35.2023.01.24.00.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 00:50:02 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 4/4] arm64: dts: qcom: sm8550: drop incorrect cells from serial
Date:   Tue, 24 Jan 2023 09:49:51 +0100
Message-Id: <20230124084951.38195-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124084951.38195-1-krzysztof.kozlowski@linaro.org>
References: <20230124084951.38195-1-krzysztof.kozlowski@linaro.org>
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

The serial/UART device node does not have children with unit addresses,
so address/size cells are not correct.

Fixes: 377972ac743f ("arm64: dts: qcom: sm8550: add I2C Master Hub nodes")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

---

Changes since v2:
1. Add tag
2. Correct typo in commit msg

Changes since v1:
1. New patch
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 59756ec11564..c183eb5cb406 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1487,8 +1487,6 @@ uart7: serial@a9c000 {
 				interconnect-names = "qup-core", "qup-config";
 				interconnects =	<&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 				status = "disabled";
 			};
 		};
-- 
2.34.1

