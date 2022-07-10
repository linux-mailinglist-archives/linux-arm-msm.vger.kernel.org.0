Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9354356CDDE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Jul 2022 10:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbiGJIll (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jul 2022 04:41:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbiGJIlj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jul 2022 04:41:39 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F238518B2E
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 01:41:38 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id a10so1197853ljj.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 01:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7M3y/J4ATzgpaOrUJ14mMptYBHdlqkPMj1D3F6zPoH4=;
        b=cH002AB92AASL9wrQ5HxkfCa6l25MS5KotB317WZgLYyFbYY7PtrWaswbjbokpxtE0
         SlR3+x8WxzRH0oTX1am2pz/YVj2TJyRIntMHEVJP08zV7/BcsLa44o43EPN+vdXqgR64
         pxOZH2IcIW2KaAOM9Xlfpmi3DG3E/DMGYM/zhIxJmb8zOMLDO9ymiEqKBSBi9y8TkeZA
         8yYOCWdFhb0wBUTu8gan61Ib1Uy+oNnhlzxZPaUaofkWQj7akL/0zFkq35pUCm170g3L
         JhTOjDJuX2EDADtrNiLbajb1Sa2VQo61pCmJGKN3SIjq+jiIRcJ9RjlamPXho0fO9R/G
         OZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7M3y/J4ATzgpaOrUJ14mMptYBHdlqkPMj1D3F6zPoH4=;
        b=IsnVhffCGJSViKy7yfABN/OgePYeSMzevVF3k17DveTMcLWYqiu9vU6Xxoa/kxR6Me
         dg6uTqTl7z1Ay8W7LgdS9Rvj2Th6ku9Z340CaFLFKLQ/cGx9vcHFR5U+Q77dSqwG3tSf
         9UXG131aci39E5BFbjXJBYclSUm/4hqa1Fts4rUwmRpQAsldvzS75JOdPQsYRmn8ubyn
         1R5dDkF8uwaJdP1kyu0BS8gj/n5ijyW/ZrLs+z6Uwhn38EagCyrZ7ZYy2Z65F8qBZmPW
         VPHnPy0R+SBt2Tm8dASCB4W09cyNS4kjts2yhjTAhuYg2jm3eWaEwjUXXls+z3wTv23U
         l8AQ==
X-Gm-Message-State: AJIora+nBta/AKfACuq93PsDXjGkHDaCuaSuXoO/zjiZIaSp4Bhj9fll
        m+xgLtbwwNoWUXfcL3W887bwuQ==
X-Google-Smtp-Source: AGRyM1sl9NGcTZmyumXtmZ2RVVLDVy2Mq/fdERhaARyqxx6aJwhnlr2/a6sqie0ewZ8peKHzAcxh0w==
X-Received: by 2002:a05:651c:248:b0:25d:4f99:683d with SMTP id x8-20020a05651c024800b0025d4f99683dmr7040851ljn.366.1657442497254;
        Sun, 10 Jul 2022 01:41:37 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i21-20020a2ea235000000b0025d4addbad4sm912536ljm.91.2022.07.10.01.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 01:41:36 -0700 (PDT)
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
Subject: [PATCH v2 2/9] arm64: dts: qcom: sc7180: drop #clock-cells from displayport-controller
Date:   Sun, 10 Jul 2022 11:41:26 +0300
Message-Id: <20220710084133.30976-3-dmitry.baryshkov@linaro.org>
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

Drop #clock-cells from DP device node. It is a leftover from the times
before splitting the device into controller and PHY devices. Now the
clocks are provided by the PHY, while the controller doesn't provide any
clocks.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 875808cf0614..72994f599825 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3096,7 +3096,6 @@ mdss_dp: displayport-controller@ae90000 {
 					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
 				clock-names = "core_iface", "core_aux", "ctrl_link",
 					      "ctrl_link_iface", "stream_pixel";
-				#clock-cells = <1>;
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
 				assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
-- 
2.35.1

