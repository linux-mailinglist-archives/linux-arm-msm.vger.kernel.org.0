Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F41E55A8628
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Aug 2022 20:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230350AbiHaS7j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Aug 2022 14:59:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233111AbiHaS7f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Aug 2022 14:59:35 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0290B8F04
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 11:58:34 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id z23so12725679ljk.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 11:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=2rC5Rchk8Av3pvvEimOqZHjNpVOqnGT2anEFSOvGN64=;
        b=L5Y6zK9Qr0xcbp78v7bQxiyL3TAyZwkOUimBE/5UGE5zcaIUxJkgP4UCFuvAlCDj49
         GRYguV3KU49eQhGjyMQD69CCGev0YYIuulCdTn0wyJ0Gxm9bgqPs0+qVmT8bvay3v56l
         sx4qTSB6M2H6bH/0dMQ5p/Qzcyg16YSAblRJwi8zKD+0H/uoiaWatVYxyKWQsjNcxzXd
         4ZTaDkyKPDWaamEdkaN1nKx60ffx6FTbaogc10q26g1nNd0kB3YYGff1sG++YHIx1053
         9UuQdmAVBp8k8qon0OpdOKnOvrSEldVZL/x4iFvfqZHczrm/dhYOdFA8JaEVYsnx7Fhz
         aSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=2rC5Rchk8Av3pvvEimOqZHjNpVOqnGT2anEFSOvGN64=;
        b=k7pZVwj/DNP/9ZsQ9uD4rmRTQ9AH8mXu5uJX5F2DkUvZ+rNwqL3BX5BOo+7Jou6tGt
         sE6BLOeuGREY6Ch8KAeJmbKaKX7kY3AQowH7Ur+TsmGPihvcxMkIJTwT2lqH5menoWH4
         ZHc44cMXKCCJZzppridR38laVuOAKAbWysW4dSKtcNnsRpsoZSkefNL43Dhmzh3FMik1
         DhC/1ONc9OJvmZCll+eNlNtIXI45JsZVBECrWG8jKm2bdlEtgCgVojYcW8NEkn+88Wsg
         Ik8YViKz6NvqjyznGN18wndTrNTt3AV9eXEgSyyn+x49SzRe++QdYrmCHN0//FxAyw9K
         +N9w==
X-Gm-Message-State: ACgBeo0YM6ai21P/XItunXGV2JSxBQct611yYwLz2bd3/k0IRPAR8rAS
        mNWhHgf7LP4GIpc2ntWZtqkbvA==
X-Google-Smtp-Source: AA6agR53ei7kqILtqO74xnJm6x4qOHNE0Yb5V6hqOGtwZRlWJQsioDF4yI+vS4cE2mpCHRK1LDzlKQ==
X-Received: by 2002:a2e:a99b:0:b0:25e:be66:72f2 with SMTP id x27-20020a2ea99b000000b0025ebe6672f2mr8297835ljq.27.1661972313039;
        Wed, 31 Aug 2022 11:58:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g1-20020a0565123b8100b004948f583e6bsm322422lfv.138.2022.08.31.11.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 11:58:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 02/12] dt-bindings: display/mdm: add gcc-bus clock to dpu-smd845
Date:   Wed, 31 Aug 2022 21:58:20 +0300
Message-Id: <20220831185830.1798676-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220831185830.1798676-1-dmitry.baryshkov@linaro.org>
References: <20220831185830.1798676-1-dmitry.baryshkov@linaro.org>
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

