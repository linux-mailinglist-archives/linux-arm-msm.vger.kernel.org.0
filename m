Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD6744C9A22
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Mar 2022 01:52:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238798AbiCBAxA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 19:53:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236551AbiCBAw7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 19:52:59 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C396C90240
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Mar 2022 16:52:17 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id j7so90891lfu.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Mar 2022 16:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W7xjJAoU4ptNKmChTRqSq+Gw3fZE/TkYmjx78F7vN8w=;
        b=SqcH/IEbxNgW8RlMnRkRygD6MkdViXJQvrlfxNoJUJCJR0ZdJj+CgIx6VxTEZ04HoP
         1xG8gwhfYcIwabk3J5QzmieP52ooJj48NvR8ong99VN35W2bysOjAzt3qjqHv7s3yql7
         VqoSZjS84zcg2owgSzOD/4JqTcFS3oCiD+Qv2DObxFYUb9x27J4KiYG0yoaKnTryPzX2
         o+NO6q8VE65DaFd40zPcauyUNqukTHRuO02t3ev/m0Z0g7VE+KJa+7UMOJbB9JpD2weW
         B/Wsx/FfaIoKmdm6Slfxo/mFjYegaE7EVDyyVzNuZnlhKOC7B23NipjkLmZGgywowxN+
         n7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W7xjJAoU4ptNKmChTRqSq+Gw3fZE/TkYmjx78F7vN8w=;
        b=LrLfdT9Puh31ysIGSC96ZX33q8Xudukbp4dD4X6m/6dS3PjugJHzuiVzzYDHksPLwh
         j2EABtLY2PqepdajwTLdkUtO9E6BfOriwTbmqBOa8+67hCIgRGtPGN4uJ5U9cXZwRQqM
         5VJq8JyBabeOII7rdt8A7QuqXraNf8csUCbHS+sjAqi6inZ3J8fsqu+4nxyA/Nh29OXi
         Blnd6Calgazp/SPG6wxEDqdl02Int1/AzHsPnfAyW1X7TgQTcBqiMdRUlhb1SYJop10J
         a4sqOvJLGwpRSpTWu5kgZn9be0dk5hWJG/e0KhZ5codpZRlwUUFP929opUUjleiGw6EL
         5fXw==
X-Gm-Message-State: AOAM533YXtSFZXEQVCY8skXk/jA/jonUWEdEebZX7KOlXGg+O0hMV1xG
        y5RgHWgBlha+tyFusaYjbevzVg==
X-Google-Smtp-Source: ABdhPJxEK0920YIHgw1rH58z3JYo6bDjeyqPPqzTPpGMsRoCZxGvGLI3sDe8vWPkrwdDoOkc6Nm5DA==
X-Received: by 2002:a05:6512:3f0d:b0:443:5f35:6360 with SMTP id y13-20020a0565123f0d00b004435f356360mr16505159lfa.661.1646182336144;
        Tue, 01 Mar 2022 16:52:16 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0:5258:5528:7624:3edd])
        by smtp.gmail.com with ESMTPSA id n23-20020a19ef17000000b00445b8db3c42sm198171lfh.172.2022.03.01.16.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 16:52:15 -0800 (PST)
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
Subject: [PATCH 4/5] arm64: dts: qcom: sdm845: Drop flags for mdss irqs
Date:   Wed,  2 Mar 2022 03:52:09 +0300
Message-Id: <20220302005210.2267725-4-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 41f4e46e1f85..95e6a97c2170 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4281,7 +4281,7 @@ mdss_mdp: mdp@ae01000 {
 				power-domains = <&rpmhpd SDM845_CX>;
 
 				interrupt-parent = <&mdss>;
-				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <0>;
 
 				ports {
 					#address-cells = <1>;
@@ -4333,7 +4333,7 @@ dsi0: dsi@ae94000 {
 				reg-names = "dsi_ctrl";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <4>;
 
 				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
 					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
@@ -4405,7 +4405,7 @@ dsi1: dsi@ae96000 {
 				reg-names = "dsi_ctrl";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <5>;
 
 				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
 					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
-- 
2.34.1

