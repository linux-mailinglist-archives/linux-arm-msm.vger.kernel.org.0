Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF14526F51
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 09:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbiENBlN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 21:41:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbiENBk7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 21:40:59 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 521883A9C93
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 16:45:43 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id p26so16935178lfh.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 16:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=azPGR+vZJiRZ8wrc365ZR8Nim5+sjCT0QCeZdqg0Fso=;
        b=tLX7iIWQN0MaA9bCcqHBAJailxCpxzFiocc1kjv911EMS9wlACNcgn7mcOi9N7pP6y
         3RgSJdKa1a+UNfTvso3bzum4wKkU7KKqWzigv3PETuL68i3jPb0jJA5Whtyt/vK/F3qY
         X0toXYeODLdUZ8PEQRO50Wr009pjokkOW9qpMrcyozqEAimLIgfuqF7jN4gpAmM0zEUW
         pMS2KdlnL72f2w3+lDPfJCQb1LKlUr/6XKfGFzyHK0xpez2RseaZQ70XB08riyQ2yrvB
         IbBeRiXsLGmNmTBe3mYX4xEsCwusYzsdFx2K2nheoS6TGoVK1l2+ymDjWPyQKa6EGygU
         AtTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=azPGR+vZJiRZ8wrc365ZR8Nim5+sjCT0QCeZdqg0Fso=;
        b=DDgRAl6KHjFmlhelA8MiPxOgsdo8H9BbUoxN60jK1B5C+QwpZFfRfCeMC/qm3A0Emc
         Wh+8EyDkA2TSNZ6ky5yHL09XDTgZtQgicRmMbrp6IJ3k74LyecP3msi34d9SNcFYfNqM
         i7IQL6KGcGm3F4N49j5FIO36z2BcalYBkFHJuOJHDeBKJ/YlijMpy2jY2YePq6+Wz47l
         AIxlpNpXLAGzi5kCzvoEga4zfiEwfVz/YeObiCyUq5WEa034rYWPN2cb8R38JDWhvZqp
         b7lzytp+/tgKYt8iXJnNIpWPtMBphymoQ28KJCu3penIY9OhQKu5kFKj5a+vX/IxHMPC
         YsTg==
X-Gm-Message-State: AOAM530MRO4LXhQLWFI7EP3sZFrhVhoLuO3752maIhOMXrbnz/HfzDps
        VeF7S6hbL7nHoR6wiv/FfOUaKA==
X-Google-Smtp-Source: ABdhPJwbf1YnNnKsUh7jswHCcTiVi6hxvSITTeIKu1qKT+R8IDeznnXIe3k4oWr7S149yb6OwIRgWg==
X-Received: by 2002:a05:6512:401d:b0:473:c7e2:f3ca with SMTP id br29-20020a056512401d00b00473c7e2f3camr5212065lfb.153.1652485521236;
        Fri, 13 May 2022 16:45:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o8-20020a05651205c800b0047255d2118csm527342lfo.187.2022.05.13.16.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 16:45:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 2/8] arm64: dts: qcom: sdm630: disable dsi1/dsi1_phy by default
Date:   Sat, 14 May 2022 02:45:12 +0300
Message-Id: <20220513234518.3068480-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513234518.3068480-1-dmitry.baryshkov@linaro.org>
References: <20220513234518.3068480-1-dmitry.baryshkov@linaro.org>
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

Follow the typical practice and keep DSI0/DSI0 PHY disabled by default.
They should be enabled in the board DT files. No existing boards use
them at this moment.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 240293592ef9..8697d40e9b74 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1559,6 +1559,8 @@ dsi0: dsi@c994000 {
 				phys = <&dsi0_phy>;
 				phy-names = "dsi";
 
+				status = "disabled";
+
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -1592,6 +1594,7 @@ dsi0_phy: dsi-phy@c994400 {
 
 				clocks = <&mmcc MDSS_AHB_CLK>, <&xo_board>;
 				clock-names = "iface", "ref";
+				status = "disabled";
 			};
 		};
 
-- 
2.35.1

