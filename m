Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08080347C47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 16:20:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236583AbhCXPUR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 11:20:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236582AbhCXPTj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 11:19:39 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D654EC0617A9
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:19:24 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id u20so30646228lja.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uOwO8iANW7saI2yo/rKV3plq3B/8JH8KOWGKGoDTU2M=;
        b=HSrTD8Xdjt+QEKCvw5WgkS71Vcl/EUopfIf3Af5r8fWOFz5Cym7/FQ+BFQIbmz8GFm
         cx296qZIIxdNR+2dlViqrjUNR3z6Ny7uz1sRisaFEpwEZL36NaNh6HQVdamNVdDzYEXF
         Ou2rzif4QfT4B4Dw22StjRHcQzPJCR0NSZ/TGTarLcPlvTEBDDQMnVdHqagDh51mfDBR
         KK3H86b9Dp5r4fZnexUoHrDBp9KArCKfj+sDZhBejAl5NfoNc/VLLZOQgKWcwV+xE/58
         Y0bOgbHVSax9IPD4RGuNie0gL1y/QMv60SLXAj9nKUyvgapz5z+gUlaJKH9llFBMXT2h
         Pvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uOwO8iANW7saI2yo/rKV3plq3B/8JH8KOWGKGoDTU2M=;
        b=p31ISQS/FpBAWH6yXYcIQT5TwNoTKHG5gzn8glbd8pk/3bZC3Gkyx5KdWUlDb4dGE2
         WnTIkkZfwSV19W0sEydVkS8wKmwO8tFYw71NYF0FlBpDPs+E+AUNdxKDXMnShbXKyVnx
         wwukruFW0bAVKUbbb1eoiq2E7o7M7rDiYjL8Hj3Ckna4V9mAmWOlmZjsKOG4fQ8Erxgu
         NubOqPdHALYe+qrPVupQygssmTPDv+8oN9B6Z+sYYK56ngmVGa+o7BwStLWr2nCIFVVo
         WS1WNrj23NTU+F4ErwFT9/5/i4w+8H1ttoWQWJhDRvC8RHb6/3+MY5dqraAvYIx0d5wc
         97Uw==
X-Gm-Message-State: AOAM533c6wSlAuhLH3fxkDI5m8sUinLUBTga7aEO8cXqPINwE5Vu3G8T
        VxG1ntX+AkQjNN7gSTt7+79ZTQ==
X-Google-Smtp-Source: ABdhPJxJPE/lsidWG4sbxqSE0fAKJ8DVwJ4yZRMkgFbAdV1HDkewtc2cAtHfGeQhL7IK39T6JBQWAA==
X-Received: by 2002:a2e:b6c7:: with SMTP id m7mr2386715ljo.241.1616599163322;
        Wed, 24 Mar 2021 08:19:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:19:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 12/28] arm64: dts: qcom: sdm845: assign DSI clock source parents
Date:   Wed, 24 Mar 2021 18:18:30 +0300
Message-Id: <20210324151846.2774204-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Assign DSI clock source parents to DSI PHY clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index bcf888381f14..8e0c5dfbd639 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4115,6 +4115,9 @@ dsi0: dsi@ae94000 {
 					      "core",
 					      "iface",
 					      "bus";
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SDM845_CX>;
 
@@ -4181,6 +4184,9 @@ dsi1: dsi@ae96000 {
 					      "core",
 					      "iface",
 					      "bus";
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SDM845_CX>;
 
-- 
2.30.2

