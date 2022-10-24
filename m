Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 102C160B79F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 21:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233249AbiJXT1s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 15:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232988AbiJXT11 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 15:27:27 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95E7B2BCD
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 10:59:22 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id ud5so3301431ejc.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 10:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rC5Rchk8Av3pvvEimOqZHjNpVOqnGT2anEFSOvGN64=;
        b=QDZDSBW5anamlQS8GPZPxxzWcygPwO2VSgV3gBG9Z0ZJr5rKWNvdIP8qEdqNANCTD4
         i2NFLMFUHC/GOw/12mTQMMy+lzf2lsdPf9o4g0820J7qi04eyf1jMZl8Z6RwnMgVXtQT
         xx4P+L50dU7Wy1hzT3eaWuj7UrX4/m17z0m613Mugj+Wtd0mVCTQZirwrKCUZjDqZdzm
         jPOrrwmXI+dqMQMyaVQvMbMNZVcxN3BHlLuxiQmxMn0KHvha6K8wNrci7jxyAAymBkED
         Q/jeiiNi4kwh6aR0TKu1QJ8B6kXbth8BODvdqBwgzfGAe6GOiUnGwSUm+JZNPo182vrh
         T3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2rC5Rchk8Av3pvvEimOqZHjNpVOqnGT2anEFSOvGN64=;
        b=NKrCXdYbSEXU1BpcbKGw+QqYuZGKaI3Xk10PdxMirFhATO2ozG4PcIU9CJ1JQ49ae3
         t3UoBo92sGSsqkHztWzBYHa4O7seYFbBtKdGL4Ws/ddvle8kLkU7dxmFPsUIxjHwyVJf
         ygSFbIbk13/6KVUb8xdXf6X/0C9v80nkzV637yUC20/8MHFfK7PVD6lyMr8amQvXB8Le
         7j11tNjx8jK8R7HSjZ17cUVX5xjQRMdLWeEFXZszmf4aDsZwmqXkcZWHqWWiCYIb1G38
         Wg5O2RAjFe9P2RENxiaC6J2wFqXFO28P4wNIaBqxzwJilq3zTnsVN0QMPrBYptD6noOw
         OdaQ==
X-Gm-Message-State: ACrzQf3J9VmA1y974YE++EqF5qYyaBr9WyY9e0r3TpIcxwOL/GGFyRgE
        ogN2G6CA0AGB3GOqkFZk4nbh5+/zXk2limNz
X-Google-Smtp-Source: AMsMyM4wlpbgXydVg//p39YiLJv0ozNQ9bid8NqJHFnhVklpcpHnZ//ofwjtv7I+1UMzDD/wusMVTw==
X-Received: by 2002:a05:6512:3053:b0:4a2:6b9c:a853 with SMTP id b19-20020a056512305300b004a26b9ca853mr11679525lfb.666.1666629748475;
        Mon, 24 Oct 2022 09:42:28 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k14-20020ac2456e000000b004948378080csm4593978lfm.290.2022.10.24.09.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 09:42:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v9 02/12] dt-bindings: display/msm: add gcc-bus clock to dpu-smd845
Date:   Mon, 24 Oct 2022 19:42:15 +0300
Message-Id: <20221024164225.3236654-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
References: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
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

Add gcc-bus clock required for the SDM845 DPU device tree node. This
change was made in the commit 111c52854102 ("arm64: dts: qcom: sdm845:
move bus clock to mdp node for sdm845 target"), but was not reflected in
the schema.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dpu-sdm845.yaml        | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index 7d1037373175..3cb2ae336996 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -84,6 +84,7 @@ patternProperties:
 
       clocks:
         items:
+          - description: Display GCC bus clock
           - description: Display ahb clock
           - description: Display axi clock
           - description: Display core clock
@@ -91,6 +92,7 @@ patternProperties:
 
       clock-names:
         items:
+          - const: gcc-bus
           - const: iface
           - const: bus
           - const: core
@@ -183,11 +185,12 @@ examples:
                           <0x0aeb0000 0x2008>;
                     reg-names = "mdp", "vbif";
 
-                    clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                    clocks = <&gcc GCC_DISP_AXI_CLK>,
+                             <&dispcc DISP_CC_MDSS_AHB_CLK>,
                              <&dispcc DISP_CC_MDSS_AXI_CLK>,
                              <&dispcc DISP_CC_MDSS_MDP_CLK>,
                              <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
-                    clock-names = "iface", "bus", "core", "vsync";
+                    clock-names = "gcc-bus", "iface", "bus", "core", "vsync";
 
                     interrupt-parent = <&mdss>;
                     interrupts = <0>;
-- 
2.35.1

