Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2324C3C2AA5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 23:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbhGIVKY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 17:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230401AbhGIVKW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 17:10:22 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36739C0613EF
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 14:07:38 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id q4so10091184ljp.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 14:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8ruiXLO7i2Zgr/es66juPmk5DrrHM+R4l9xvmPO0wKI=;
        b=NBfnO8ZkIO7Aj1Itk/7t8wa8TmS1ul3vPzV1MY0z1h+jwnwyQ85hPtj0C5QWXEANNZ
         Mzav2gt9bUUpcT/420r0CsIE7yx95Bu+F2UXVacjs3U7MTuhjdId4yVgsTLlvI1B0MPD
         3SRBIlET2M8P0f8adtEvG4aRsQTlCnP9nluWrEmNLTMxd9HiOPOzbBwzO1lciGbuO8uo
         9s/bJSSrxPdhG7+XfHRuCnlQoqJ9lJdDm0rkcpEweAR2TXXL0wFVB9O4WjvLUMCe8q03
         Z1HiG91Lnig8SLTxMoDuDXixlm7FQ/lO9gktHtDZMdbnH15uEVM993UFArv4rx939S5q
         4c5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8ruiXLO7i2Zgr/es66juPmk5DrrHM+R4l9xvmPO0wKI=;
        b=caqPphIF9STViq8khUvxtiqExO0825shzHys7jCQnR4EDNDG6B2HzOuVEG7SDPZxB3
         4p67w11hECL3+W0Kt0O0+Y7W33wr2apfggIvGEgiOTSgiESLkEuFmpkWLIeOO67ljG2Q
         OV8cqLZuZfJY/3p/65MEfphnMba+rbFmG8Zb32XT7gyYiu1Kc9rsBh2ZNWaROs+wX3lM
         x78h4Y9puotBF8qQWHf67reesyJMcAxCF2mB1TEthjyXifHSvXrpeyS5uk021zDu5mGc
         duSei14IunQC6rIHDZw832hmJX96tivshCh5drVMVL9vOL1ISOo33Ch3Zil1ZVjqFCQw
         51/Q==
X-Gm-Message-State: AOAM532R6lR4jP1LCW3BOVQAjVL134hBicW5rN5FaPV4zPVx1qV8HjQc
        oYXT7KOADgR4rwdMLMgLMgSIpw==
X-Google-Smtp-Source: ABdhPJy0V2KQdfAmyWdLWEOI0be3277bOL6PRhs7MlAS6wZasoXD+Aid9V5BiCdcg0T4EDWRxPHFKw==
X-Received: by 2002:a2e:8295:: with SMTP id y21mr15033177ljg.482.1625864856598;
        Fri, 09 Jul 2021 14:07:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n15sm590625lfh.70.2021.07.09.14.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 14:07:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 5/8] arm64: dts: qcom: sm8250: assign DSI clock source parents
Date:   Sat, 10 Jul 2021 00:07:26 +0300
Message-Id: <20210709210729.953114-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
References: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Assign DSI clock source parents to DSI PHY clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 4c0de12aaba6..69bf2e90cbce 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2491,6 +2491,9 @@ dsi0: dsi@ae94000 {
 					      "iface",
 					      "bus";
 
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SM8250_MMCX>;
 
@@ -2558,6 +2561,9 @@ dsi1: dsi@ae96000 {
 					      "iface",
 					      "bus";
 
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SM8250_MMCX>;
 
-- 
2.30.2

