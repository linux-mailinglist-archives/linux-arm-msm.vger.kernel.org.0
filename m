Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA0A460023F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Oct 2022 19:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbiJPRXC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Oct 2022 13:23:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbiJPRWz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Oct 2022 13:22:55 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EF2D3B96F
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 10:22:45 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id o22so5446984qkl.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 10:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6vI3gh6pA16f+b7Nkc67CezWdqlEu9BiPUuRLstOuE=;
        b=t0KzpitwrS2e9NREnPOgmb8Z/DVoB0xyKvidZi1W/Z5ae+xK3IalQ8ZloSIfehoaDR
         lTEees7sw/JvgPX0Whh3ztc6SWlG10rzy5i3xbfSB8EjRDyqv5FysM6kChaznPdlktDb
         qmeMHP7fXvyUpy1xjW90JUteNetKis3K6uJIy9ajfhi8g5AikwF39x+hG1dp2e+m38Th
         ofc1mddhF8eCQx1lG19ocRysw4dj2Diyg6dScP+/Am4WK/lxuhISXC3VK0pObG8ED8Ec
         MmHWJXpb6Dc/rBuhFobfOflWEKtocMwepLJM9ZnlVzudy9LaG960ciiUupnQJnjHioyP
         4NSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i6vI3gh6pA16f+b7Nkc67CezWdqlEu9BiPUuRLstOuE=;
        b=mNF9hexhljlUt50xcGrO/rNBhSjPXFYSJe+UatmQDJYXsIZ8VUT58kAuio3OEY2kKf
         UmbVH57wKK8ks2lLO2+amWqgq2V4lZy6td8hAYmuFeNele1ukMeU6GrczGZx5LprxrIN
         zFuvgGMvkVkpp0HIgen+xDMwf1TXI1Vh6xgO+QMCBvZLmobujRQdiC8Rn+zSE1UPekaj
         nr3b9lvY1w4+WXZofO+ElxGnEOCzx9bXPamo1NkN2aAgQ+OTGeKn/ajrRuzIPauXzQDx
         WN8SBVOl+Lroi11YA3yTnJhtVuGA3OHWZ9WkVmjFv0DqjB+Ro3lzot+GVQIQYlhB+HUw
         7fRA==
X-Gm-Message-State: ACrzQf2jpMjv6Pf+iVpLFsBjHukmrGJvUmcZI0Syk1/T/Lfgtn+X4DeC
        A8ErWeAqLL7GENH+jaZOQFtuWA==
X-Google-Smtp-Source: AMsMyM7HF6YRUzz90dWR9kYbyCPfX2em5p39ivmAmU7YXxJtIyz6b/3xIZ/fUIvZ8Nyo705olRfcog==
X-Received: by 2002:ae9:f205:0:b0:6bc:2d40:2f3d with SMTP id m5-20020ae9f205000000b006bc2d402f3dmr5048025qkg.448.1665940965509;
        Sun, 16 Oct 2022 10:22:45 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id r5-20020ac87945000000b003431446588fsm6051008qtt.5.2022.10.16.10.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 10:22:44 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 10/17] arm64: dts: qcom: sm6125: align TLMM pin configuration with DT schema
Date:   Sun, 16 Oct 2022 13:22:05 -0400
Message-Id: <20221016172212.49105-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016172212.49105-1-krzysztof.kozlowski@linaro.org>
References: <20221016172212.49105-1-krzysztof.kozlowski@linaro.org>
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

DT schema expects TLMM pin configuration nodes to be named with
'-state' suffix and their optional children with '-pins' suffix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 1fe3fa3ad877..af49a748e511 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -407,13 +407,13 @@ data-pins {
 			};
 
 			sdc2_on_state: sdc2-on-state {
-				clk {
+				clk-pins {
 					pins = "sdc2_clk";
 					drive-strength = <16>;
 					bias-disable;
 				};
 
-				cmd-pins-pins {
+				cmd-pins {
 					pins = "sdc2_cmd";
 					drive-strength = <10>;
 					bias-pull-up;
-- 
2.34.1

