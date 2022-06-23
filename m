Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90F5E5579E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jun 2022 14:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231717AbiFWMEp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jun 2022 08:04:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231708AbiFWMEi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jun 2022 08:04:38 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 685974B42F
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 05:04:32 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id i18so19326888lfu.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 05:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l4v06pir8BnrBBj0ls39eeym2+zaCxMALQgwSDSsGCU=;
        b=X555fxSbDxrZ/6MCXqe5e46ShTfmWHcALxDAYr0dEE+Imn2jzLWlbdqbTphVAWO2WZ
         y4VGGgiruzIXa8MC2XiayZz2q+LUTsBIZuG8YUEaCv+0MV1qk9VlG/BIdS4SzeSOr+5U
         iOp5Nz/xf76vP1bO2hNR0HVscCpZtlg+i4q8FDxDrURUfog6bJLdbr+1SZNvCe6MU89D
         qJ5cW7bLMlvMNTTdaY4z63rNH5GeM4amNH/1XTmTjLaCXwLifyP5dD5G9gqy8NCm21pK
         aOuajA5Dtns7XOx/aGMY4e1nevJ/cLys9/iMQs7cAhdqRt5OCdZdvl8ylkwgMgJQzGkp
         x7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l4v06pir8BnrBBj0ls39eeym2+zaCxMALQgwSDSsGCU=;
        b=QPlLyBV0bpjxHThYkmzy5jgGLa8IWyShgVKM3yXASM/wrK8QHDRevgVfZ88BYM4CUi
         qqgXMA+KrospZc/sy9b3TUjWYRvML0+ARJNk+1t/9mafOTW7ye4xJUEUT6KFajypuFI3
         42a5bhu3DUDq+dBHMfQr+ZZcK0yyTMb6Y3p5wEWyHk83ALJYwGxwVKo2UXJXD9Zu0SiR
         gdKB3vCeUbLeCdN/t+ByBDwYtSEaX8NM5DCmLsB+yTGEwvkn9xOtAQHcsni4jalhw3UM
         UcdnMSPO5maVlZChbclO+RKSeZlJTyHcUlN75DQgENiB7y1cFAhqR479793w37RgxzyQ
         LJqQ==
X-Gm-Message-State: AJIora/FD1JgJeWowvQIXp+hZCL5jeQ/IsRaSoWVnW0VflEdDh6xzoQn
        Gigm6KPguLpoBgCBWf2KgAqsiQ==
X-Google-Smtp-Source: AGRyM1u16w/dCwSh8ku2jFBX2Bo79H8keNAp4wo9dIxNAU9PbQpArZOt7sEcbqpxdXflkdhCczQlpQ==
X-Received: by 2002:a05:6512:3f1e:b0:47f:40e2:9fd8 with SMTP id y30-20020a0565123f1e00b0047f40e29fd8mr5398055lfa.110.1655985870502;
        Thu, 23 Jun 2022 05:04:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 18-20020ac25f52000000b0047f6b4a53cdsm1799888lfz.172.2022.06.23.05.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 05:04:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 14/15] ARM: dts: qcom: apq8064: add clocks to the MMCC device node
Date:   Thu, 23 Jun 2022 15:04:17 +0300
Message-Id: <20220623120418.250589-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
References: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As we are converting this platform to use DT clock bindings, add clocks
and clock-names properties to the MMCC device tree node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 9ea279f04a78..87b92cb95e77 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -861,6 +861,22 @@ mmcc: clock-controller@4000000 {
 			#clock-cells = <1>;
 			#power-domain-cells = <1>;
 			#reset-cells = <1>;
+			clocks = <&pxo_board>,
+				 <&gcc PLL3>,
+				 <&gcc PLL8_VOTE>,
+				 <&dsi0_phy 1>,
+				 <&dsi0_phy 0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "pxo",
+				      "pll3",
+				      "pll8_vote",
+				      "dsi1pll",
+				      "dsi1pllbyte",
+				      "dsi2pll",
+				      "dsi2pllbyte",
+				      "hdmipll";
 		};
 
 		l2cc: clock-controller@2011000 {
-- 
2.35.1

