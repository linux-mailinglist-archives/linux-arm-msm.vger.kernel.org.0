Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78E55636F57
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Nov 2022 01:49:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbiKXAtP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 19:49:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbiKXAs6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 19:48:58 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59E8FFCDED
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 16:48:20 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5so257278wmo.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 16:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G7igFHyhmHKVMXZXEAa2K1RzngdOwodMFmdy9026aRg=;
        b=YEe/hyEyRdcFpHn2Lry6PI9e8vGou4lqu2Uskax8y5DfDT18K9yhn+xY241N5V/tr8
         QhE2JGxzmfNEldWqkV4HG5VxG7cCPaeiEnoHytGpbw/Cr361+rpIzvDQ2QPT8BcnmGoL
         6qLxU5uoWQmqnLXOB0Cvg3JFoG24thWU/tOFbp6bAFLWsow3EikljXNqGwLwVtl+9lzY
         XNN7D1bxz5K5IST/GZo7LfJgnuuPQ9kwrBD05HX7Gr+UXpNxUPEJW7ymqqhbf4hXUTVi
         BCWLREPMRwoQ+2Qnv4NMDHsPENh9DB93FBnqNcizOrZBGIm87lc/UARi108ETS3XXqyw
         rIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G7igFHyhmHKVMXZXEAa2K1RzngdOwodMFmdy9026aRg=;
        b=mVHsbgoiQTfNVyGNI7bZ7NEdOTPNMaobv0ufkVvZAfUZWG6pSljKzNB3YeevDdgU8y
         6Jx99Jc09My3+4S+uuX4uRfXjLcO1G7FnaIyjwibsk1mpfO9bBxQO3aWEZHSVQYmyj2l
         4qciP31vOPKoqiFUc5KES49vdSTYGb3M/s5z0p9ybXEp5HUZVCqQe3yHYL/N7DnTl6c7
         LfHY47frdoZwuTErSmC1A392JeeUwrj9U5I6IoTGK94gP18sYxNC2KS2oZyo2VJj7qlu
         dOkJgh9rfEqqqu2jp9sKwAPpv+f5Gr9i3KW8NWy2DA+byr7G/p86T4m8V0uo4+QcpzN0
         wwWw==
X-Gm-Message-State: ANoB5pkYo0xtyudMWQlP2M/Xc1TDPRfIPe1XceJIoQd+ihLNLEwzQDfl
        yLqYZ+tFTDML1OdxAuTNA2QUSjxJb23vSw==
X-Google-Smtp-Source: AA0mqf5OriOC9F/2TwTB4Y4eYvlM0v1V9cnS9OKowIQTOHik3qyaYvVjqSvphXR3oB61luMGH0dQKQ==
X-Received: by 2002:a05:600c:354d:b0:3cf:45ff:aca with SMTP id i13-20020a05600c354d00b003cf45ff0acamr12885545wmq.53.1669250899212;
        Wed, 23 Nov 2022 16:48:19 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 16:48:18 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org, dianders@chromium.org,
        david@ixit.cz, krzysztof.kozlowski+dt@linaro.org,
        swboyd@chromium.org, konrad.dybcio@somainline.org,
        agross@kernel.org, andersson@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v3 12/18] arm64: dts: qcom: msm8996: Add compat qcom,msm8996-dsi-ctrl
Date:   Thu, 24 Nov 2022 00:47:55 +0000
Message-Id: <20221124004801.361232-13-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,msm8996-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for msm8996 against the yaml documentation.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 081e20a63c610..9f6543579dcf0 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -968,7 +968,8 @@ mdp5_intf2_out: endpoint {
 			};
 
 			dsi0: dsi@994000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8996-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x00994000 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -1035,7 +1036,8 @@ dsi0_phy: dsi-phy@994400 {
 			};
 
 			dsi1: dsi@996000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8996-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x00996000 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

