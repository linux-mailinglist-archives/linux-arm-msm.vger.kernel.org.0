Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2EFA56CDE3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Jul 2022 10:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbiGJIln (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jul 2022 04:41:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiGJIll (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jul 2022 04:41:41 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F02818B32
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 01:41:41 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id e28so643157lfj.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 01:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4OZQG4ziutxO+vr4IL5ovGIJyJUy264W5pL1ERzKToc=;
        b=aSnR1KlqkJAwzidfnsEtuoVyifv19Ox8XAsqdSeYtG1gY5vZD7VRZySSfWjelSxiQn
         qv8G3t7EDTg+w/iNuDWKfD/EeQlOYihRLqSdpv8Gqg4TiEN+ZFTwjXamioNIo5LzxOwz
         DTwxCu7BWw7wIcJTwT31ufCDknzXPjy3YT5lw2KGNMvjuRn2Q7VB6cg008oMcgPwc63d
         X2ewPJoHDMKX1wVrqmHsLNWTSaLOwLxfvFTdGPFiLRNG0SHDGpaEYSzeu2ZY3Z2z7TJ3
         gcnUPXrvSgp8EV7XW6HW23x7baoU+3idrt/YP+cjaPE3tUsWAX1VJRPEbb7/3T9io0Ve
         Snrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4OZQG4ziutxO+vr4IL5ovGIJyJUy264W5pL1ERzKToc=;
        b=0QUT1dRbfA7noVoJm/MTKPWcxLQGQLNSOVf8YU+4BD6UQjCPLxCzWG4AaGPCUKbMXr
         Q2ZvH1eyWhJ2Q3QDaDOtd8/tiTv55Rs+YWUsM7MnEQEAN2Aggr6KWsXbluj3nUKBdgjs
         XDi0KjW/c0nk6HmWsOREabOk0lwUB+snNmkYpCc7CwJKgyf3urxKCsKDo/tA5MBP4sy4
         UVP8KobzGa8hcNUjXRtGNJdUXiHn1V6B22y7wxoBi2WTOw/hQ6mDE7IqgYBSEBL2bO0f
         okdEB84kIwueoleXSkfi4/0hSjaLp407HHSFL3cH4OGM5ND9WfbT7GdgeM9QGcQggYvC
         m69w==
X-Gm-Message-State: AJIora9ZGYUAHS/CZCOkPU/f1g+I/axLqfWQ1KrRGLinxFYprTyu/fpg
        KmomFhRKWLhLlAjCRgtaEQSCXg==
X-Google-Smtp-Source: AGRyM1vjwaXauptf9hMMQNsrlj0OmtsRIyP1YM4c/ZfAhApj4tbXxqwM6A77bt447uzqxOg9fH3HaA==
X-Received: by 2002:a19:f208:0:b0:481:163a:b07c with SMTP id q8-20020a19f208000000b00481163ab07cmr8585126lfh.613.1657442499446;
        Sun, 10 Jul 2022 01:41:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i21-20020a2ea235000000b0025d4addbad4sm912536ljm.91.2022.07.10.01.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 01:41:38 -0700 (PDT)
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
Subject: [PATCH v2 4/9] arm64: dts: qcom: sc7280: drop #clock-cells from displayport-controller
Date:   Sun, 10 Jul 2022 11:41:28 +0300
Message-Id: <20220710084133.30976-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
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

Drop #clock-cells from DP device node. It is a leftover from the times
before splitting the deviice into controller and PHY devices. Now the
clocks are provided by the PHY, while the controller doesn't provide any
clocks.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index e54c2000b098..a55e6caaaadc 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3730,7 +3730,6 @@ mdss_edp: edp@aea0000 {
 					      "ctrl_link",
 					      "ctrl_link_iface",
 					      "stream_pixel";
-				#clock-cells = <1>;
 				assigned-clocks = <&dispcc DISP_CC_MDSS_EDP_LINK_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK_SRC>;
 				assigned-clock-parents = <&mdss_edp_phy 0>, <&mdss_edp_phy 1>;
@@ -3829,7 +3828,6 @@ mdss_dp: displayport-controller@ae90000 {
 						"ctrl_link",
 						"ctrl_link_iface",
 						"stream_pixel";
-				#clock-cells = <1>;
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
 				assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
-- 
2.35.1

