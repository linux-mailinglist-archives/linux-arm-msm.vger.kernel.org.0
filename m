Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFC5D56AD9D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 23:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236793AbiGGVcV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 17:32:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236797AbiGGVcR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 17:32:17 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14D6C4D173
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 14:32:14 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id e12so33301959lfr.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 14:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IhjBNRgDY3D4V2rQwtlvIRuVCHJhruesxJluDAINOWs=;
        b=VUbk51kgK6DWakFxbopkmxoVeUdQfuTBMzzkRp1o9o0TohK4VU5w6H0cmE9AGZ/IgD
         5zFriWo3SMyG9WWdwzHFq+HAHv28Y1gLiWW8GxYjMVpjuS1LJFxYkryE1PmDoGTYp451
         z4dts5pr+AxlcwoM0jDhH96C/wiYS+kL/sJG4MQTHbzc8nil0XiZ1LtYJuSW0bXYk9cA
         95YOvAJJWSWwNCkJqN0k6RUh54ADoFCr6z2cNdvqxmCFU97OZwsHL+/GcElb1I94kOgx
         h1cgYs/y5OFeYYfYtVDyhG0D3/BDp3gTQCbOdqN0Ejv9M2m5ypPZ7KoF19Fq44nV6SwH
         XvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IhjBNRgDY3D4V2rQwtlvIRuVCHJhruesxJluDAINOWs=;
        b=v9M0zTHtoDCTZBcbSHKnfJ/GIrcw8AE/pT1aPF/siNMw0KEeNB7glQJVb3/C/1qOAT
         U07Tki+9KfX4MHh3hn9bYH5YPdHAqOqOPukire/RgdnaAvySDUU+seE/IVLaZWynNak4
         0DLOdsefO84kp4I8YkC/reaXHReBetf+DvbH+2mmXeUSOYMjZ1GgVZzhK6kgC02YYOPc
         2DM1xlLtRX4/o3B70tWXVYUXevPPbQRt2cIl8ipgTi1X8D1kCsYBJdVufVEwE4JX0Y5R
         DKTfMCLBN6zChQdIYzDrbymcHHZ3dOmdZJHu/KKXfpHihqiM0/hGJu4vANgmm0JHG6Np
         Bwsg==
X-Gm-Message-State: AJIora+MNIAUq0nZSZDd2qbzAuhX9p8wT8pDVIXtT6PGoY+gHRCYizev
        m17jdwZ7WY5XYegP9OfhD2+bdQ==
X-Google-Smtp-Source: AGRyM1vTK4quBnMmp1glbsvEm1q+zLVGJvI7AgXn5761ZrteP/d/rp7gn6cwUMDjPfLOSwVH2NZtsQ==
X-Received: by 2002:a05:6512:1043:b0:481:31f:5505 with SMTP id c3-20020a056512104300b00481031f5505mr163208lfb.112.1657229532475;
        Thu, 07 Jul 2022 14:32:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o19-20020ac24e93000000b0047f8cb94004sm7046709lfr.35.2022.07.07.14.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 14:32:12 -0700 (PDT)
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
        freedreno@lists.freedesktop.org
Subject: [PATCH 7/9] arm64: dts: qcom: sc7180: drop #clock-cells from displayport-controller
Date:   Fri,  8 Jul 2022 00:32:02 +0300
Message-Id: <20220707213204.2605816-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
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
before splitting the it into controller and PHY devices. Now clocks are
provided by the PHY, while the controller doesn't provide any clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 47ce5787ed5b..dc2767cd852d 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3092,7 +3092,6 @@ mdss_dp: displayport-controller@ae90000 {
 					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
 				clock-names = "core_iface", "core_aux", "ctrl_link",
 					      "ctrl_link_iface", "stream_pixel";
-				#clock-cells = <1>;
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
 				assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
-- 
2.35.1

