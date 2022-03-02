Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A28284C9A24
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Mar 2022 01:52:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238802AbiCBAxD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 19:53:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236551AbiCBAxB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 19:53:01 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BAD98F9B5
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Mar 2022 16:52:19 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id u7so85076ljk.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Mar 2022 16:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mdO1kFafRmQB1ylhJ2FjgGW8EzDUwR+K8t4/Xs4kq9Q=;
        b=Fxtmo3aMycl7xk+Lul0LSWm5TG/mfwTVTqYPa+KjBqw5rC0QwR7Ao0sUfevGtF5LD4
         k64tX8Oo4Lji0Neh2ivP2XcbTNozVjQZ02oR1Nq42hy8yNDHgzFbvVup1KAMGd/AUj4z
         J5bd2yGF/yd/cXGRy8M0E6h1bI/X2QcQUDBFaSpPSmogfHEwn3hhkFEkxYGOVvU0fhVW
         uEVLgFXq+9blz33lpJTojXDydraVexwlMs0VZ/Ra4aQG66KwSwbME0Ze4wWQuv4GjwkD
         SnEsJAQw7eFWZc2JRZ+m931di+scS7Ohj+zfIR4887/m6dwmD/D6YZCL7mvTovY+c/w7
         +zNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mdO1kFafRmQB1ylhJ2FjgGW8EzDUwR+K8t4/Xs4kq9Q=;
        b=AqfSRbCAWzdh7FnbFE4gfFpdpden6hONkaAPxibBfwPZDbH4nJNwIqDK8LSmlvcYZ9
         zJA2TAWZcIVAS5nnttfjaG/lgPAF2rAc7cKcJ1VfcwIeHoexsXQF07peYd+OlmGQH3O2
         pAtXB/ONyWIXarmXj2Tl4SKQB+dCv97sslpdDhmOc+NCtSqcRw+ARLsmnuQ//EQ8SFL+
         9c7L8OQb4x6oJPUqEBimpyEY+TpAXNoez6+V7YIpjaCO7SU1wahECnG8g7+nZ5QK8nJ+
         ltS+L4P4TRs8WN/arMDKh8JPGSp3g8pFvF3XAuC7X5O1kVNtQiVdZFgeOSTDU4hW6jr/
         Cm/w==
X-Gm-Message-State: AOAM5334EVE/EkFV2UWaUMrL0WtyMBZY5UzHJB5Ww1c/zk8KiQ+MX1MH
        oyfs6Y//7pCAPfsmMk+d6I2lqQ==
X-Google-Smtp-Source: ABdhPJxpIAoiAGbopIhIpyPpAucdmEDZ21agCkEkSvjzXqvdU+rcmpCfmeynxX6N0Hks9plHTf6bhQ==
X-Received: by 2002:a05:651c:1209:b0:22e:353c:76c0 with SMTP id i9-20020a05651c120900b0022e353c76c0mr18589141lja.139.1646182337477;
        Tue, 01 Mar 2022 16:52:17 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0:5258:5528:7624:3edd])
        by smtp.gmail.com with ESMTPSA id n23-20020a19ef17000000b00445b8db3c42sm198171lfh.172.2022.03.01.16.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 16:52:17 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 5/5] arm64: dts: qcom: sm8250: Drop flags for mdss irqs
Date:   Wed,  2 Mar 2022 03:52:10 +0300
Message-Id: <20220302005210.2267725-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org>
References: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org>
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

The number of interrupt cells for the mdss interrupt controller is 1,
meaning there should only be one cell for the interrupt number, not two.
Drop the second cell containing (unused) irq flags.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index fdaf303ba047..956848068871 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3200,7 +3200,7 @@ mdss_mdp: mdp@ae01000 {
 				power-domains = <&rpmhpd SM8250_MMCX>;
 
 				interrupt-parent = <&mdss>;
-				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <0>;
 
 				ports {
 					#address-cells = <1>;
@@ -3252,7 +3252,7 @@ dsi0: dsi@ae94000 {
 				reg-names = "dsi_ctrl";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <4>;
 
 				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
 					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
@@ -3325,7 +3325,7 @@ dsi1: dsi@ae96000 {
 				reg-names = "dsi_ctrl";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <5>;
 
 				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
 					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
-- 
2.34.1

