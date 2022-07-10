Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F52356CDE8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Jul 2022 10:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbiGJIlp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jul 2022 04:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbiGJIlo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jul 2022 04:41:44 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71CA718B2E
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 01:41:43 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id p6so214646ljc.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 01:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oNLGCTerIVU1NE0L2+9ZJZEaHYA06VymBP0XUK3FvOI=;
        b=f1xZvLdxIkr/qu2hjEDFS8sXYLdPm7Jtl0doodfayg3Vd0Wsfirqs5uPdAGaih45Bn
         jJaZ2nLWojWiJFP5bCZfyeUnHN22yuHH9Xe/YVxItgOa6egYddq/OJ43eby/JqyueMpJ
         MXS4oTxiCtadilu93wXnJz6ZJakP1PTK60Z27+9QZdNU7oZFBUN0kvGN3ZW7gHM3fNUS
         3gufFqAeuvwVWaP1M8IajxlauhOuUCfbTDYaBS/ezl612F6ruN9sVYbjFPNyD21yXd6g
         UhXEaWJGkq3HtsGfd53APbxKuk5GIZmAWoMvTZEbZjmA7sEjiDr9jHQla+GmY1qdk0to
         pRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oNLGCTerIVU1NE0L2+9ZJZEaHYA06VymBP0XUK3FvOI=;
        b=bI0gffpNhRHzbokLOYWhoHZSJlhdGft2X03pOn1Q/Y98oP5uJHCw+Vr29DtqRBf3Vr
         V0/KU2rAN06dSz99a9lunovo8qfqhg/iDDwhuqxaBKDtmwXYMh8WN3f+tOwFezSFuA0N
         td8LxUA6AEkDxvD8z/mV/r9mjuh9iHhgqslMM6LtggqEUERZIdzBT6mcNYJbt6S6+M9M
         q5pCFPEgWMkDBfr2cAb2plVVYG7wU3qoPiZoObB/GudpKcPYDZKkyzTL6vRf3RG2YZNq
         i0S3PMMKcmHZZFhxY7IxDfjyhOP4fLR1kQ2k7cqCLSmFLXP4JqO0n9SOgdkg4ZBlYE7Z
         dSMg==
X-Gm-Message-State: AJIora9Sln+rUoCDThHc5lvwLb9PP1quvXSpLQ2Rv2fGBC9njFouXQ1H
        FjRp8azv2xQNT9hxpuh6FOgoLg==
X-Google-Smtp-Source: AGRyM1uMQ+Au377P7UQcUkkMJiumuyq+AuV4ZGQK5zcJ79AGgiGLygxHH0WKoJXCOE4P7zCEhBnN5Q==
X-Received: by 2002:a2e:b049:0:b0:25a:89a2:df44 with SMTP id d9-20020a2eb049000000b0025a89a2df44mr7018017ljl.207.1657442501548;
        Sun, 10 Jul 2022 01:41:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i21-20020a2ea235000000b0025d4addbad4sm912536ljm.91.2022.07.10.01.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 01:41:41 -0700 (PDT)
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
        freedreno@lists.freedesktop.org,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: [PATCH v2 6/9] arm64: dts: qcom: sc7280: drop unused clocks from eDP node
Date:   Sun, 10 Jul 2022 11:41:30 +0300
Message-Id: <20220710084133.30976-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
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

The eDP node includes two clocks which are used by the eDP PHY rather
than eDP controller itself. Drop these clocks to remove extra difference
between eDP and DP controllers.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 13590e84772e..5bb536d76f5e 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3716,16 +3716,12 @@ mdss_edp: edp@aea0000 {
 				interrupt-parent = <&mdss>;
 				interrupts = <14>;
 
-				clocks = <&rpmhcc RPMH_CXO_CLK>,
-					 <&gcc GCC_EDP_CLKREF_EN>,
-					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
 					 <&dispcc DISP_CC_MDSS_EDP_AUX_CLK>,
 					 <&dispcc DISP_CC_MDSS_EDP_LINK_CLK>,
 					 <&dispcc DISP_CC_MDSS_EDP_LINK_INTF_CLK>,
 					 <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK>;
-				clock-names = "core_xo",
-					      "core_ref",
-					      "core_iface",
+				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-- 
2.35.1

