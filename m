Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 757AB5E8A5B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 11:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233437AbiIXJBP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 05:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233537AbiIXJBM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 05:01:12 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1455814C2
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:01:11 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id b24so2391003ljk.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=QP8oHGThdjIPJ6Bvh0wbUBRr02al19D0DbDwHW8eD1Q=;
        b=LtiWl78tulO0DQf22boMhab7npcGDLc1zNzvhm+Q1bZY2YDwTfmByGUtvoacbRBhux
         2Trj5EaQ/PUB+RHtIYKUOfJxh6CXfrvWbdTOPsaKpqn0R49dk2A1SJmVab0UUaGh++bg
         3h0TbMWHSQxQmcR+ICwnjLY6FLLLe8J/qqrivd96x05/HIuRsxE7SvSRALvmgRc5l/4p
         GQcNYQPLXkptEqFo9qelVlW/BSLNGaLbPRdx2idVGYXQuI9O9LCjmppMIwlIKfcuvhlb
         PaETTdHxKUlCI1XSoE/s6e58eV/1OGydwtI2wZAZoWu1nzvV/09Ido6eYcOHj9OCqmJr
         TjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=QP8oHGThdjIPJ6Bvh0wbUBRr02al19D0DbDwHW8eD1Q=;
        b=Y8wayDWF7o5/qnaGF9ilx0r7li8KS08hzI8OpqlNKnJ2C0ugmrJ+PeDEdrI05Vj1I5
         zCJ+UE+rTYILRYYPAsiySOsTPMXubYbzDwb91sTQO72l116QL95PPFnd2RmsNcTytyC/
         kgSX/ClM/p65/+jcfGFuGhruJq+87UiN2puS5CDoWBZOPjxvcu/dqrPQQUS5gepLXZ/m
         XZBXMqbhtKan+pHCe2GH61vNz/r7I8nrdn7rYuuk3xmmqvQJORkh2gWtV5psYYO3Ml9N
         HnQHE6Nb77U8BJapQYvELoflcMIGkfDCl+aX7Ih12Kianuwhx9RnlGPNGnFRPA7OdFxR
         bTJQ==
X-Gm-Message-State: ACrzQf1stZ15b3BKHxuYx5/v2Xjxbhvg5y4gN5veDY8SuQ7COW8QoNFL
        IhFl24VVpBFUM9HrdSL5mwjxHA==
X-Google-Smtp-Source: AMsMyM7rhEhnNp3jHlIaDTHQIMDh0oXWzm6sxtj0R7KWmfAFkk+tBThQyFwkdqryE9tZKqyU3agaxQ==
X-Received: by 2002:a2e:bc28:0:b0:26b:d979:fc72 with SMTP id b40-20020a2ebc28000000b0026bd979fc72mr4450263ljf.292.1664010070260;
        Sat, 24 Sep 2022 02:01:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o4-20020a198c04000000b0049f54a976efsm1830024lfd.29.2022.09.24.02.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 02:01:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 1/9] ARM: dts: qcom-apq8064: change DSI PHY node name to generic one
Date:   Sat, 24 Sep 2022 12:01:00 +0300
Message-Id: <20220924090108.166934-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
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

Change DSI PHY node names from custom 'dsi-phy' to the generic 'phy'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts | 2 +-
 arch/arm/boot/dts/qcom-apq8064.dtsi                | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
index fee278e32cb6..2c5ee2e98fe2 100644
--- a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
@@ -252,7 +252,7 @@ dsi0_out: endpoint {
 			};
 		};
 
-		dsi-phy@4700200 {
+		phy@4700200 {
 			status = "okay";
 			vddio-supply = <&pm8921_lvs7>;/*VDD_PLL2_1 to 7*/
 		};
diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index ada4c828bf2f..1b704c7ea890 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1303,7 +1303,7 @@ dsi0_out: endpoint {
 		};
 
 
-		dsi0_phy: dsi-phy@4700200 {
+		dsi0_phy: phy@4700200 {
 			compatible = "qcom,dsi-phy-28nm-8960";
 			#clock-cells = <1>;
 			#phy-cells = <0>;
-- 
2.35.1

