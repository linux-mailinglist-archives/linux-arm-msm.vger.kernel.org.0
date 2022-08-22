Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7866559C9D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Aug 2022 22:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236399AbiHVUSW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 16:18:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236343AbiHVUSU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 16:18:20 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A74AF634E
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 13:18:18 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id q7so13153391lfu.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 13:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=b0csbqWjuX0z1ouVyH85kpMRal2rBTuFqDlpM2dtaGs=;
        b=RHkeOH/N8akKNzr5gPA24Je9viNjwBNlXDv55rzedGRjiMavLWCWofoMhLB49bN82+
         1PQU+/3Zwdsh5Vv65WlZAcp7VJGGai8hcLK1JPOb/jyZtlfctUch/8yDEDG1QiQPqLGA
         tQX6F8vNX8f9hCGtGXiBBiqUINhD0iAhcqoUvB0BCuZwVTnuB2GRqam3MNjLNpuib6SH
         HIgsSvTYbMhIHQqxRTjV4EJRcqUn++7ISlBJpiyHDIkd6NplmjGIKdqYxWPj1zLEIUho
         K15DViPkBTBFdHTcP8gX91xjRqlHBTC51h2N+oqKB+HO9cqYSLZXM3hzeJCHGj091o7A
         8laA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=b0csbqWjuX0z1ouVyH85kpMRal2rBTuFqDlpM2dtaGs=;
        b=aI1bcN0zAKouHiuykQEOLS8AK1SA5FHRgwGaDlpjacn5quBdsoqOh6EUA/Oj9zSCx2
         IcW4j853V0QLJ7Ehzxus1vtoINQxEZQwugbJNfW6+73HZjNtOlc3bSSePwDPF5HRcKoB
         WhdgWIcKsR3Mw6JCIWYU3QIGTo5AsPLn918UOtulAae05kUe398dlFt9AR1Gerp/Vqcn
         78/KMjkdrTMzAs7maSnwwsOhZIYO0o9D0/Q+7mpqfe5sRgr26OXLlwk/MT0ubvs5oVvj
         Ty9hUfKi51hCTACda1QAAitO0m0Ey+ql1DXHzg8Y02M1YEnBZbBBS6sts6cytIKgSr+Y
         byPg==
X-Gm-Message-State: ACgBeo236FjoZNrM93J5vxgCkQ8zTvmvPTORHfHNjSk05cU12JyCiByJ
        KVLSEB46YO7WDVj/Fw4EUPpXNA==
X-Google-Smtp-Source: AA6agR68PJLvmGpy9/so9cyjZeepliYHidSqKXbaWXAiZpKWlnOVUiWZYg2lkmplE2B5xZd4BztLsA==
X-Received: by 2002:a19:5e01:0:b0:492:c03a:aa8e with SMTP id s1-20020a195e01000000b00492c03aaa8emr7659198lfb.139.1661199497047;
        Mon, 22 Aug 2022 13:18:17 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h16-20020a2e5310000000b0025e5cd1620fsm2000429ljb.57.2022.08.22.13.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 13:18:16 -0700 (PDT)
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
Subject: [PATCH v3 7/9] dt-bindings: display/mdm: add gcc-bus clock to dpu-smd845
Date:   Mon, 22 Aug 2022 23:18:06 +0300
Message-Id: <20220822201808.347783-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220822201808.347783-1-dmitry.baryshkov@linaro.org>
References: <20220822201808.347783-1-dmitry.baryshkov@linaro.org>
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

