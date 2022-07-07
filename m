Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ABEB56ADA5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 23:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236800AbiGGVcX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 17:32:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236587AbiGGVcR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 17:32:17 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD5DA4D4DC
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 14:32:15 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id t24so33339996lfr.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 14:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LmG27VAvPqwLokCgRV28hmE5ll7C/l8IW7AnNAbPsYQ=;
        b=jDaLV0ZBuyPjn14Y17cRatbbTN/Tkwejw4WZCqmEGWAVvzFp01TyY1lb64FKqPlpYy
         eiLpoye+eG9hRhG2corcbLnLmL06G3Wqmp0K8G+bh4rBR9T8hX5Rji1Eaq+Fm+JCK5Tw
         vsUAMAY+2SS0uWh+gmcBL9AatnNo/C3ffGAnS6eAhcW5qOdILnjx6kkxPdVsxCgCPS84
         md7dr7V/DVs2gt0zvyoB8+7rJ25h082E8Ju/0CGiSExSSk/y7QvDUOqRs8QadyMjyw7n
         F7vrk3O66oVEGvZUCZ2hUdvkkVNaUL0A8ADnCYayOxEupDTsERiQioKlE/p40Uw8vFR8
         KUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LmG27VAvPqwLokCgRV28hmE5ll7C/l8IW7AnNAbPsYQ=;
        b=8Pm0p+iSQ078W1+1wNuG+AelnLP1MXU/b2lc+hOwcDYOGoOFepz/iWv4IuIKkxou6/
         QOA9kvnemBdz4va5moB0XD0Lz50V7MP3HIjdF5QDfwGQMNTsWQ0clU0YYU6hNeGbYLCX
         My2f4yRNUGsY8sjwGuVgXMWJgNjM+m897Kw7q0U9/eUszDg1yDd4+mohiYfOX7aQiwej
         3sYoC5nsYQ80cw6vvd9Zg/Lpp4iA5Axke4//oz+pWe6WXNUAOtMABWboIJYEbEbGEhzp
         xSJpVcrYWguVp1R8Hd3fBZX3qVlUGxJ+5FiUHO/8xUn4l6b68O2/Tif1n+y8p5fWVm5x
         mR0Q==
X-Gm-Message-State: AJIora/viEHbfmYNIWtCzS5H4qHV4aOL5jCWdCBNNbld7UQ72yqZd6BT
        9dGmW0MyBdXaEX7MNaCLTDk0cA==
X-Google-Smtp-Source: AGRyM1smbr0/8AujEHBcLyNC+lvRU2ijM+Qi7JuhUY4++YSEHvrLz3qMQdbflIiMW/6j79iVTBfIag==
X-Received: by 2002:ac2:53b6:0:b0:486:3357:c67d with SMTP id j22-20020ac253b6000000b004863357c67dmr128289lfh.433.1657229534248;
        Thu, 07 Jul 2022 14:32:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o19-20020ac24e93000000b0047f8cb94004sm7046709lfr.35.2022.07.07.14.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 14:32:13 -0700 (PDT)
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
Subject: [PATCH 9/9] arm64: dts: qcom: sc7280: drop address/size-cells from eDP node
Date:   Fri,  8 Jul 2022 00:32:04 +0300
Message-Id: <20220707213204.2605816-10-dmitry.baryshkov@linaro.org>
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

Drop #address/#size-cells from eDP device node. For eDP the panels are
not described directly under the controller node. They are either
present under aux-bus child node, or they are declared separately (e.g.
in a /soc node).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 21ab986968e2..004cbbb084a2 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3740,9 +3740,6 @@ mdss_edp: edp@aea0000 {
 				operating-points-v2 = <&edp_opp_table>;
 				power-domains = <&rpmhpd SC7280_CX>;
 
-				#address-cells = <1>;
-				#size-cells = <0>;
-
 				status = "disabled";
 
 				ports {
-- 
2.35.1

