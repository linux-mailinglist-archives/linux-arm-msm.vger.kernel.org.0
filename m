Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 430444C578F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Feb 2022 19:41:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232730AbiBZSlp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Feb 2022 13:41:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232747AbiBZSlp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Feb 2022 13:41:45 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D673227EC34
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Feb 2022 10:41:08 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id y5so7511166pfe.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Feb 2022 10:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yWkjgQc5GaTMGsYymmiKClwt0+YbyyBGXguYRPAW+yA=;
        b=Eu0uapRjn2wC4kS5EHa8fE5lKLqZkoR+LaAkeaidWEfjT+vS+GS247YSJUBjs/4Ew5
         MHF/+6rGDStMlvvSZ1PCbd/j5jTPFr3zp3SLIOG0CSfDpNZSXfksYNsCil0U0QSg8GRX
         rGwornii8S8E4vBBcPUXngd2t0laT0neWey8QlSgjdjVGQ5KBza6gInmfRzi+iI5anRq
         Zpvdylv24EL9KqqB1xKgZ53dRw/fToCz5ybQX2iwQvaIy5PQ4rSMTF3ie3NvoON4orkU
         R6f6oTgY1/N2CxxdoNX3gon7+HLEa68pthIBt/UH++rNfH1WlR5bxHbWQCJA2OWL/jyb
         uknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yWkjgQc5GaTMGsYymmiKClwt0+YbyyBGXguYRPAW+yA=;
        b=CKJ9WBVIjOy+Wk9OKKO21YYqqrCmD1ylEd4GeR6zBmqvtXUm/idz6aR3Q49slrDKm/
         B6Gy7tRC3dM4w9MIq1ur8sdRXcFbKSEloST8uBq2aDk4kJ+rDq61czvWaMyo8jX2o5dc
         nYbuSIaOCq7OzTlG6y89zXKRJF7FKX9FPNu2QdZpGar29bdDjz0IGDIbVWG4tqh5tnw+
         /Xi670aJid6Aup9WmCwOEsQVL1VQxP2CIwTUWh0x4pldQuOAsAKnIAskYQv99V52kmCs
         c8AW8PIMNTnzw2P0X5JxhOtZDB/tvVBxaGmwpJMyEZt22YL0BDatM4/N7pODuse46J0G
         0kFA==
X-Gm-Message-State: AOAM532l37wDrxKUSDMG7HYk3gz/VgS5h2H+WWwCTfz4Z09U0Vm6KYGx
        gDwjJbwhU9+CT9CV+DQMAzbDn+LGDwARpw==
X-Google-Smtp-Source: ABdhPJz8U7fmifOHyEShGlwoTHzRdUeqY64mXKnpivuz4+VjwvLzJXYZX0n5/MvUS8+z8s4i5TMRcA==
X-Received: by 2002:a05:6a00:2313:b0:4e0:ffa7:bbe0 with SMTP id h19-20020a056a00231300b004e0ffa7bbe0mr13698980pfh.53.1645900867596;
        Sat, 26 Feb 2022 10:41:07 -0800 (PST)
Received: from localhost.localdomain ([223.179.136.225])
        by smtp.gmail.com with ESMTPSA id b187-20020a621bc4000000b004f3c8f3b560sm7049319pfb.129.2022.02.26.10.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 10:41:07 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, maz@kernel.org,
        quic_mkshah@quicinc.com, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 4/4] arm64: dts: qcom: sm8150: Add PDC as the interrupt parent for tlmm
Date:   Sun, 27 Feb 2022 00:10:28 +0530
Message-Id: <20220226184028.111566-5-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220226184028.111566-1-bhupesh.sharma@linaro.org>
References: <20220226184028.111566-1-bhupesh.sharma@linaro.org>
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

Several wakeup gpios supported by the Top Level Mode Multiplexer (TLMM)
block on sm8150 can be used as interrupt sources and these interrupts
are routed to the PDC interrupt controller.

So, specify PDC as the interrupt parent for the TLMM block.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index aaeacd379460..6e6fa7811c7a 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1937,6 +1937,7 @@ tlmm: pinctrl@3100000 {
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+			wakeup-parent = <&pdc>;
 
 			qup_i2c0_default: qup-i2c0-default {
 				mux {
-- 
2.35.1

