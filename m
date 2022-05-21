Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E51C52FDAF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 17:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231316AbiEUPVJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 11:21:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349696AbiEUPU6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 11:20:58 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 012AAB499
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 08:20:56 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id h8so12516086ljb.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 08:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ypxafSXytWa1pPBeHJ41K2y3Cfr7QvnghKr6SvtMtAA=;
        b=sVsrPGNl4w2uM81jjBcYdQWuayrXckKNcmFuPozmWDjyR1Fr/gclJnqTXGjwv4X+V8
         RIO5brmBADLHDtD2Sv42lztYE6yDr3XIuXEERzf79palc/9uCf9xyKQAE8oLlI7GjebC
         B8ZNG9MRjNPwEMY57cuhbYmgzRYeSLP4/2t3H0Fi4WSyfItMM8Et4NrxH8/MF3g4HzQO
         u7/Efrqfn0bteeC0GeX/urzw2m+g9Be+eFyguzvjQQeJUtRNcTk5m233e4QgXt+X619v
         fCe12CBt588MrgYSDFgDUpWZP4LrlBcCyPGz1rpZaO4ppugEMvEeqse/LV6+6VoJPeKA
         Cm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ypxafSXytWa1pPBeHJ41K2y3Cfr7QvnghKr6SvtMtAA=;
        b=S6FubrothOrtbW7meZj7XqXsx47Q/jbr+cU5NLwzCerCk2eoH/j4OJ975XEfV1mo1L
         /4FlObrZbt38A9Lv6bRVllZzuhDkBcSPjC6moV7gPDZq9NowH42NDL7HTWT7qS1SY2Di
         n/T0BCcbcRoxqnaHO4UTUOH3dBswegC5KR4KtXxIiBnIT44CWxWMdM/vgHSD6dAtP6gC
         pPxR6Ewvf3ESjLZQn8UWxMGP+FczmnUFHPArvBGkQjwvz4F9FONB7y8rs5A6/BKAzMAB
         VLFNhs+yNdHPFNsjwqMygMeoYjv4K4Iq68+GM/LmPoP+l7Q9MjwSlYP2cV3qf0Vrrdfa
         grJQ==
X-Gm-Message-State: AOAM531mMc0FTsxVmK8AllvPcdM//EwRgvywm5oeqk0aGRfykWYMzjc+
        8qknZlxtsW8OwORNUsSg3c1P5g==
X-Google-Smtp-Source: ABdhPJzPKkNLgObUuVY2ib/KxfYASVtn+LlCqft0cS9/wYeLPNO8+2KpiQEhJi0Xu54U92os4NOANA==
X-Received: by 2002:a2e:bf27:0:b0:246:7ed6:33b0 with SMTP id c39-20020a2ebf27000000b002467ed633b0mr8271812ljr.167.1653146454828;
        Sat, 21 May 2022 08:20:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([94.25.229.156])
        by smtp.gmail.com with ESMTPSA id k8-20020a2e92c8000000b0024f3d1daeccsm739933ljh.84.2022.05.21.08.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 08:20:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v6 02/11] arm64: dts: qcom: sdm660: disable dsi1/dsi1_phy by default
Date:   Sat, 21 May 2022 18:20:40 +0300
Message-Id: <20220521152049.1490220-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220521152049.1490220-1-dmitry.baryshkov@linaro.org>
References: <20220521152049.1490220-1-dmitry.baryshkov@linaro.org>
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

Follow the typical practice and keep DSI1/DSI1 PHY disabled by default.
They should be enabled in the board DT files. No existing boards use
them at this moment.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index eccf6fde16b4..023b0ac4118c 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -192,6 +192,8 @@ dsi1: dsi@c996000 {
 		phys = <&dsi1_phy>;
 		phy-names = "dsi";
 
+		status = "disabled";
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -225,6 +227,7 @@ dsi1_phy: dsi-phy@c996400 {
 
 		clocks = <&mmcc MDSS_AHB_CLK>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
 		clock-names = "iface", "ref";
+		status = "disabled";
 	};
 };
 
-- 
2.35.1

