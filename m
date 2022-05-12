Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7725258A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 01:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359601AbiELXoC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 19:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359602AbiELXny (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 19:43:54 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C319289BE3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 16:43:52 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id bq30so11756923lfb.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 16:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ypxafSXytWa1pPBeHJ41K2y3Cfr7QvnghKr6SvtMtAA=;
        b=HYYWbtOp+pyhDnTUwDvvkj8h1srbhPIfBQrtpDMd0/p71LPYf9kNeLldexP27+/IlA
         DKmuRETGMWTAzbrZXw7ckynx1W+70H39NaJvvf3MT69Hn5G51O66aJSgEGvPOCwCo8qF
         Di3kWKlEj/8J0u5nO6JkSomyt10yZY/QZ1ppBaBSlz6AGsaIV1xb6B1LEokUNgBZHD7J
         wX/bTUVuObqRSVHL8bZ/bI4jPbPt7yFJCf6WFHsZhrEx58he4AP6Dsi7KIQlhVzZ30sz
         CTfKOXYgA6Bs0sxGhywL77zjYp20skxWDiwfxpjBEZ1DD6SP2lOz9w9T39W7h6lFlF55
         POJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ypxafSXytWa1pPBeHJ41K2y3Cfr7QvnghKr6SvtMtAA=;
        b=46wo18Q8jctD3R9Vmf5w+rn94lKoSebH3IOQ55+8Nt2+PZGyxjRff1IV+VO9HD3A3R
         fb4MUItnl1s5mzTAA40i9uSaB2I47qlzBqv8aoYNWBQvZqX507eT+fBinxFy6EmLvLVS
         4/F8RU9rXzYk9/EpWsqtTxWrlXr/7n5xIascl0c1xoiIGsTV2DUwb+DnqTYELuO95w80
         IJkCK9uRBU8UDarylLa1y4sCQrgFX7RnfNt2tpptheSgqwrmzMZSrkPMOIoUkIpmDFU8
         W09i945LiyqUynFtBB3jJ7+UKt2X2+kWwnyinIqScxSn1zHXK8XFTDuqgcMykfXvlE1y
         jDTg==
X-Gm-Message-State: AOAM531PJBsahl8rk8/V710xbxBrAhqjrvAlB3NQwc65XIuoqpXCmbWp
        JjJrEDX9l62GQs9HdudhPun0Hw==
X-Google-Smtp-Source: ABdhPJzwJLrVsnKk3326SVHGPojUnjR52rHNQWh4Cw/dHGdl35TF1oIKYJTfyCkzUa59MR836Hx4hw==
X-Received: by 2002:a05:6512:22c1:b0:46b:a2b7:2edd with SMTP id g1-20020a05651222c100b0046ba2b72eddmr1501962lfu.133.1652399030979;
        Thu, 12 May 2022 16:43:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u10-20020ac248aa000000b0047255d211b8sm129976lfg.231.2022.05.12.16.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 16:43:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [RESEND v2 1/8] arm64: dts: qcom: sdm660: disable dsi1/dsi1_phy by default
Date:   Fri, 13 May 2022 02:43:42 +0300
Message-Id: <20220512234349.2673724-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512234349.2673724-1-dmitry.baryshkov@linaro.org>
References: <20220512234349.2673724-1-dmitry.baryshkov@linaro.org>
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

