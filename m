Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D628F5E8C71
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 14:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233102AbiIXMgS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 08:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231944AbiIXMgR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 08:36:17 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD5DEE676
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 05:36:16 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id bu25so2243149lfb.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 05:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=2rC5Rchk8Av3pvvEimOqZHjNpVOqnGT2anEFSOvGN64=;
        b=YjdcxLVE7Jnc7UN8j9yJfN7Uq50cbwaisIpdqncEjDWorGISw1Q4bIKzMJIHsa/bAy
         AMfavFSP3/Qc2gdTAFR+To5CtXlwV2QpXwu0w7uPF3jknJ0QsIO9bkoKnYFZeococFcG
         2DbZQrRLMtHN6UiwwznxNBPD3hzxcwqKygIr1+I90nKMpmt8Urpt7DUvPXX5S2+Lj85L
         g5/vt77teDhlPPGjfzX2Z3wlIVobDGOILB+aUE4J9xdW0OsPXaXBYDW7Xi9wJ4YCPMnw
         uwFftEXjuxx1KkQW1BmhwnAPlaVkXlrv8CTWjZP05jutqnONp/hz5+w7AvUtfICtfuqR
         tTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=2rC5Rchk8Av3pvvEimOqZHjNpVOqnGT2anEFSOvGN64=;
        b=zAN8BsCiJ5TB0rVRZaMCyzpfV/ExKkMZBkJUArjLPhDknVx2E4CJi/7XAxbz7hEGu3
         t3sDMGI3gGjsr+IHz2BUzjR/HUqezSu/OaWpFwxiMSgiaCC3CN9zI+IWjCKr8O+6NCKz
         f1VIys8LN0BXLPcSwTpYMIuccaVN3nXQC/pH2+gRuTIxV3T9V72AgMiEh1OJJSU40LYW
         V/lgqj945Uqlh4t0G7Ltz8fTDUBZ1DD3ZxpwwgzbTDrOkBVT3xdY93nXSi7ked/8B6C/
         7Bz+eJu5E1Vu1KUBoiVyCjgddz10tZPc7SCZVYFekKVEudq1odr5L1cmf1l27/LIESUm
         1u5g==
X-Gm-Message-State: ACrzQf0WuSL47v/Epwi5B918xh5CsZM1xoPJEldcJFw6XenI3+6MHFRQ
        HGytKPdJA6JR1FqQ+TrXSE5jdg==
X-Google-Smtp-Source: AMsMyM5ixskLg7xVsV1hW57LtjoKOpXeFjGXeiUbfvieg+SAtmquiWpBYXiKkUwsw9gdF5SKBAnDWw==
X-Received: by 2002:a19:6555:0:b0:49e:7d52:a4ca with SMTP id c21-20020a196555000000b0049e7d52a4camr5487418lfj.198.1664022974550;
        Sat, 24 Sep 2022 05:36:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u18-20020a2eb812000000b0026c4113c160sm1707269ljo.109.2022.09.24.05.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 05:36:14 -0700 (PDT)
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
        freedreno@lists.freedesktop.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v8 02/12] dt-bindings: display/msm: add gcc-bus clock to dpu-smd845
Date:   Sat, 24 Sep 2022 15:36:01 +0300
Message-Id: <20220924123611.225520-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

