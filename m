Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6777B6FB4A4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 18:05:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232861AbjEHQFC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 12:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233098AbjEHQEz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 12:04:55 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4331F5B84
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 09:04:53 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f00d41df22so29680736e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 09:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683561891; x=1686153891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKq23YAf45bB0TY5A8OYCdd/tqcQK4TJNEhLnPPrGR8=;
        b=fMejH7OI3jTpCpUsJRMmUV4I00OHmD8ftPe30OWp84O+fa/MjW/fNXnoie1kAa7bZx
         785wggFXlUGLB/ZJ4SrKzb9v6EQrqmHc3drrnMR4m5i6sHxODC7d+JsTIrwkqxBsYhTI
         J6/B0PVlAPr6pE5VfDE1CthunRXHeFruSfGOnb4i/91em2iStnAXFNYnJaDDV2xmc1Pl
         Mfyea7N03uveuhDaGlQeGOD/Nqdc2kfQq4rbcLRQ9fo1O8TO1Tr/MicR0GvkXlDZIn22
         HlCTHAGyUVCl8HJqSS7gmIeaxZ/t64nV7mBMoRd3CfBGOPE7SR52jZbsEkx/WoyXyKAX
         7lpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683561891; x=1686153891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKq23YAf45bB0TY5A8OYCdd/tqcQK4TJNEhLnPPrGR8=;
        b=fbr0Z9O3u0lJVMEOfKIWyIlUGPT2EZg10JN0kYXbr87qTeD1GLxj2ArQn8wzwLdzsQ
         QLpMn56dWgbSdNtcqUJX9l39LjbF9nvJwlSRW4WO+nsruA81huG6CjDNAxyc1saKMhB8
         3l49v6gS2BJaRuude1vAo+hCuhgNluvmNCt46JG+MFReSYv+xk6GTpIJa0ikCYO6V4a7
         pgIWIqiEsXjY0I0VsX0Spc2GhJXsNSRhkcO3cAM7UHXHpg3ArxxFHSpeYjpsy8Uo6v90
         9Ws4NQjjAquA5KSOwDrQXOWh2LrvXbVc5P9y6fydNix3ajcLe84NLjc6Uf2xKVkEtZdd
         G4nw==
X-Gm-Message-State: AC+VfDxU3dpdAI2AYV47CWUDP61uI48jYf69CdZNyzEg6kOW1VvEFlvj
        INTCObjmwfuZsX4s0kEI6ig81dssXKXkE0WMd20=
X-Google-Smtp-Source: ACHHUZ67HLlNh7sz9XqBc5R+t1LfTYoV3VXRMEklPkO33kY/pgfGyU1P2d6KcQIh8NcphpWz3SBL9w==
X-Received: by 2002:a05:6512:2351:b0:4eb:412e:b06a with SMTP id p17-20020a056512235100b004eb412eb06amr4019579lfu.22.1683561891620;
        Mon, 08 May 2023 09:04:51 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id h3-20020ac25963000000b004eff4ea8dd3sm32372lfp.76.2023.05.08.09.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 09:04:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 3/6] ARM: dts: qcom-pm8941: add resin support
Date:   Mon,  8 May 2023 19:04:43 +0300
Message-Id: <20230508160446.2374438-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508160446.2374438-1-dmitry.baryshkov@linaro.org>
References: <20230508160446.2374438-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Wrap existing pwrkey and new resin nodes into the new pon node to enable
volume-down key support on platforms using pm8941 PMIC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-pm8941.dtsi | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
index a821f0368a28..cf1fcf97fa88 100644
--- a/arch/arm/boot/dts/qcom-pm8941.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
@@ -19,12 +19,24 @@ rtc@6000 {
 			interrupts = <0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
 		};
 
-		pwrkey@800 {
-			compatible = "qcom,pm8941-pwrkey";
+		pon@800 {
+			compatible = "qcom,pm8941-pon";
 			reg = <0x800>;
-			interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
-			debounce = <15625>;
-			bias-pull-up;
+
+			pwrkey {
+				compatible = "qcom,pm8941-pwrkey";
+				interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				bias-pull-up;
+			};
+
+			pm8941_resin: resin {
+				compatible = "qcom,pm8941-resin";
+				interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				bias-pull-up;
+				status = "disabled";
+			};
 		};
 
 		usb_id: usb-detect@900 {
-- 
2.39.2

