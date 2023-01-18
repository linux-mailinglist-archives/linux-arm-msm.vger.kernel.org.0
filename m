Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1E636711AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 04:17:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbjARDR1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 22:17:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjARDRZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 22:17:25 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04F525086E
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 19:17:25 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id u19so80023883ejm.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 19:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxuWlUI/PcZStTas2G6sOrezS1sqVdlcznrK0ab6Pgo=;
        b=ViRt+oxiXo/beRGmqh2R7Vt++z4Ji56XtaeVEfunsPZdfelpwHdtKML7eKpPrHmkl6
         4RHsud7MW8TPXi49/7jKgw+8O/iqWZc8e0RaplhIpVBBL6q2wJeWeWpVYcwEA4WICyZr
         yCkYLGXSiWWejwRfp+NQKgqASvfyOXK97z3okpNoaKZnCgDZJMX+v5d7AgZQBPmyjh7W
         WOb/AvzaKMdoJZEjJx1Gm73IjNfRnoXHmlgKrjpKoclx3nihVQzoiwniaPN14HW970uU
         I5d/0q0zSvvcL5kC2Sw6Wdmk9rRP+Q49CW9TzBYqqXPNYSrpQa56z7fWdvYAImJLFlIG
         7tbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxuWlUI/PcZStTas2G6sOrezS1sqVdlcznrK0ab6Pgo=;
        b=r2Csc0yfQZXVFu6O6TywLre8s3XmZOcLtjZ9flGa1yip54liura4TZPTSrSCpGRaew
         Q7fNB9iuN7mELjX6nq3Jcc+iYTYOuMSfraenBkYkV/hw/WJxaAPzGASdT3V1ayuQ1QKR
         F1mKBYyFCYUlAgc7P1hbkVlV2Iwu22cY0K3Vg8hSPD8njGW6dsd/kHGe0dxNwaWbsGqD
         1B6rD/ZQCtMl6gfORw34WGarlBOC/4uzxwDLOa0jKQZGjnXDqARTGNQF8EwzSmiFJpxm
         Ppa10l0eeGI2VuGR68gfqCLtUyuW5ipwkQ0oa5bDuHnSSOZql4ixcrtzUosa0ExUnVQq
         F3Bw==
X-Gm-Message-State: AFqh2kq1ep7uICFxJBtMApeo2A5zZIo5qIxWfQsvG0ojFEmTOTRTqyR5
        O2q+8NQOiRuZgYTsnLdLglK8BA==
X-Google-Smtp-Source: AMrXdXtBtKIdExTwOXf4FveFWN9yH+Z1q36Rfnh+ukpilSiCiS1HU+9ZMx8dngkQH3OIX3AMMd1z7w==
X-Received: by 2002:a17:907:6e05:b0:871:dd2:4afb with SMTP id sd5-20020a1709076e0500b008710dd24afbmr10953246ejc.42.1674011843554;
        Tue, 17 Jan 2023 19:17:23 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 2-20020a170906210200b00876479361edsm535639ejt.149.2023.01.17.19.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 19:17:23 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 4/4] arm64: dts: qcom: sc8280xp: add p1 register blocks to DP nodes
Date:   Wed, 18 Jan 2023 05:17:18 +0200
Message-Id: <20230118031718.1714861-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118031718.1714861-1-dmitry.baryshkov@linaro.org>
References: <20230118031718.1714861-1-dmitry.baryshkov@linaro.org>
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

Per DT bindings add p1 register blocks to all DP controllers on SC8280XP
platform.

Fixes: 6f299ae7f96d ("arm64: dts: qcom: sc8280xp: add p1 register blocks to DP nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index ea2c8ad37ccb..ed11fb89cdc7 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -2448,7 +2448,8 @@ mdss0_dp2: displayport-controller@ae9a000 {
 				reg = <0 0xae9a000 0 0x200>,
 				      <0 0xae9a200 0 0x200>,
 				      <0 0xae9a400 0 0x600>,
-				      <0 0xae9b000 0 0x400>;
+				      <0 0xae9b000 0 0x400>,
+				      <0 0xae9b400 0 0x400>;
 
 				clocks = <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
 					 <&dispcc0 DISP_CC_MDSS_DPTX2_AUX_CLK>,
@@ -2519,7 +2520,8 @@ mdss0_dp3: displayport-controller@aea0000 {
 				reg = <0 0xaea0000 0 0x200>,
 				      <0 0xaea0200 0 0x200>,
 				      <0 0xaea0400 0 0x600>,
-				      <0 0xaea1000 0 0x400>;
+				      <0 0xaea1000 0 0x400>,
+				      <0 0xaea1400 0 0x400>;
 
 				clocks = <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
 					 <&dispcc0 DISP_CC_MDSS_DPTX3_AUX_CLK>,
@@ -3394,7 +3396,8 @@ mdss1_dp0: displayport-controller@22090000 {
 				reg = <0 0x22090000 0 0x200>,
 				      <0 0x22090200 0 0x200>,
 				      <0 0x22090400 0 0x600>,
-				      <0 0x22091000 0 0x400>;
+				      <0 0x22091000 0 0x400>,
+				      <0 0x22091400 0 0x400>;
 
 				clocks = <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
 					 <&dispcc1 DISP_CC_MDSS_DPTX0_AUX_CLK>,
@@ -3466,7 +3469,8 @@ mdss1_dp1: displayport-controller@22098000 {
 				reg = <0 0x22098000 0 0x200>,
 				      <0 0x22098200 0 0x200>,
 				      <0 0x22098400 0 0x600>,
-				      <0 0x22099000 0 0x400>;
+				      <0 0x22099000 0 0x400>,
+				      <0 0x22099400 0 0x400>;
 
 				clocks = <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
 					 <&dispcc1 DISP_CC_MDSS_DPTX1_AUX_CLK>,
@@ -3537,7 +3541,8 @@ mdss1_dp2: displayport-controller@2209a000 {
 				reg = <0 0x2209a000 0 0x200>,
 				      <0 0x2209a200 0 0x200>,
 				      <0 0x2209a400 0 0x600>,
-				      <0 0x2209b000 0 0x400>;
+				      <0 0x2209b000 0 0x400>,
+				      <0 0x2209b400 0 0x400>;
 
 				clocks = <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
 					 <&dispcc1 DISP_CC_MDSS_DPTX2_AUX_CLK>,
@@ -3608,7 +3613,8 @@ mdss1_dp3: displayport-controller@220a0000 {
 				reg = <0 0x220a0000 0 0x200>,
 				      <0 0x220a0200 0 0x200>,
 				      <0 0x220a0400 0 0x600>,
-				      <0 0x220a1000 0 0x400>;
+				      <0 0x220a1000 0 0x400>,
+				      <0 0x220a1400 0 0x400>;
 
 				clocks = <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
 					 <&dispcc1 DISP_CC_MDSS_DPTX3_AUX_CLK>,
-- 
2.39.0

