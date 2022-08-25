Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B87165A0D57
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Aug 2022 11:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240687AbiHYJyE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 05:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240737AbiHYJxl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 05:53:41 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C566AE23B
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 02:51:40 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id d23so23146155lfl.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 02:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=b0csbqWjuX0z1ouVyH85kpMRal2rBTuFqDlpM2dtaGs=;
        b=eNCIILDIJzua2xb3HJ/jtB91lR7e4w0zBqPlbkTItj1VqOdfvGDP4RPXgxztpdSeLK
         OFEeze1xWYIfqA8D91PkGqTvSZEoQkvo1XRjtGmnSV8/IuFIzc/+TnCqVeZozvNLM7Tq
         MfyMN2N4r2aBliR4GI76ByROek6aAU6rI8CaEHBiVOiZVnNF+86sH5tiJ0cLgldwXQ8g
         PVLYaNr9sJpPR6Q8LKHBdPY7XkBWEY/3bLbfZtjw6luo6cZjLxrtBy/1SvIZmFcmCS/i
         50g2sq2PZ8kNk1q2UR49VJKb8spoBHcR2iFL0VojSuheoOoTdEu1aZHHKX1Pt9fAL/UW
         9ycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=b0csbqWjuX0z1ouVyH85kpMRal2rBTuFqDlpM2dtaGs=;
        b=xX+Ugrds3J9Rdyh7M4z7Tp4Yd5B+dQH85FdwdvMZoxT9SRJrjyt1oAFEg78bObv4Id
         0IpyOkt1t/ZcGKQKz+qetmgZJWUp1RnJUry4DKW1ekQa7RNgnhUVq4IVrdZELXbAxT1N
         Of7gSBTe60tOp6LgaOBEyHVoQuaVXNvBr5QLQJGV4WQhwDOJQ9FutewNyqVs/thel7V7
         OS781ir+c1bLqJ9IJvvN+vNCpG9Ms3m7IQ/7EF6SXy4yOH6drR6BepLjs2JG8FnE3HkC
         ql3CqjKVy21WnkpDYUSL87/szIj+UA34eNnH5aTO5EaFRqmUgHIz9FbpkVCW8QzAr/jf
         iknw==
X-Gm-Message-State: ACgBeo2tfd/eot9iBs9H3xpq3shwxZStIpWOeIQwZZbMEOsnYgIHOhVc
        exfCpFxALmlt2R/It4SE4J1Ziw==
X-Google-Smtp-Source: AA6agR5FxI3LjNhtKaRXTDtQoJj06JpTJUkI9fx15d6tYKnc1zDcxDgsSF79bDFFEOtFgJHx+28sSg==
X-Received: by 2002:a05:6512:1101:b0:492:da22:bc58 with SMTP id l1-20020a056512110100b00492da22bc58mr959116lfg.219.1661421071551;
        Thu, 25 Aug 2022 02:51:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h10-20020a056512220a00b00492cfecf1c0sm398502lfu.245.2022.08.25.02.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 02:51:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v4 07/10] dt-bindings: display/mdm: add gcc-bus clock to dpu-smd845
Date:   Thu, 25 Aug 2022 12:51:00 +0300
Message-Id: <20220825095103.624891-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
References: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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
index 2074e954372f..42ff85e80f45 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -29,6 +29,7 @@ properties:
 
   clocks:
     items:
+      - description: Display GCC bus clock
       - description: Display ahb clock
       - description: Display axi clock
       - description: Display core clock
@@ -36,6 +37,7 @@ properties:
 
   clock-names:
     items:
+      - const: gcc-bus
       - const: iface
       - const: bus
       - const: core
@@ -114,11 +116,12 @@ examples:
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

