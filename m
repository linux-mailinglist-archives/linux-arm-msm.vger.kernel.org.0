Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2C032A11E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Mar 2021 14:44:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376879AbhCBEtV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 23:49:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241293AbhCAXa0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 18:30:26 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2F4BC0611C2
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 15:26:27 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id b1so17534910lfb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 15:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F/g683yfKMbSwanrv0GKDcyKMtduWqmgNMeU84dPM/I=;
        b=u0I4XS9EQX/RrTgjEwRh1DB7T0t3yiqaL5emtUIOeGbIpVH0/EREIEzn4RvRWESsqA
         xEUUdpsONp6kPF32tGzTBE94mowKWllT6WY9CYChA2dnE2ynT7pGeDc4SdLMxrrpCSLI
         CAvN2wuXn92uG5cAgZc9hE7yokZMAPHejx4aSopWGqI7WoPMHLgt9ccVApik+q22aMz1
         pMcowInq9xmemsW1rvs7yc7doJMWX1hyMzuFKn/uncOPRs8WtaN0J7ReuR1Ln0zk0wZb
         DySM1kicgk7quh/UMfNsYudSI50LG/bjVJ/OXRF2l+jBcx0Ge67SmxeEJEY9PBguo1jX
         nnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F/g683yfKMbSwanrv0GKDcyKMtduWqmgNMeU84dPM/I=;
        b=Rm9yqc66AkKgOaR0aTEZyo9NXUS3xR59iF4s84Zj/7iwPu6LEKot1MLMlw+P7MJnvy
         J4IRN0ldhthD+4YYcVttcP7ZZPE53A9N1BJi+k9/yvdOYLNxTLYr4gvFK0Ln9OiQoqoD
         xyDchlmA19ZQtx54G5LdW5XcbRSHc3sl3Ev1BNQmz8Ea3FMeWj7STSq+/o+mo3NcFYBh
         mgla5qatGwGDD1310/a3t96dhz7Twpuw8npbp64iujMtXrlaRud8f6V16U746GFvl18E
         ghkUeTlgX0yyEFghOlK6hyG4dd/cQlPOCERBt3nF/vbOAtlZCVLy9Nn5P8kWfwZJTQs4
         7XyA==
X-Gm-Message-State: AOAM532wu/VBtldW2ik7zKPYM4IzHvAjGAnJsn8pu2bKnHawCjnqiin6
        tye9JtCypIbDCdDo4hU+RTMndQ==
X-Google-Smtp-Source: ABdhPJwPTWy+s1unheR5Ge4u57rIEixPwt6TRaRd9RWzxhBf4Acq36RsiXpxUxAqkYPLHx06kQ+yWg==
X-Received: by 2002:a19:9109:: with SMTP id t9mr10475451lfd.49.1614641186429;
        Mon, 01 Mar 2021 15:26:26 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b20sm154749lfa.183.2021.03.01.15.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 15:26:25 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC 24/24] arm64: dts: qcom: sdm845: assign DSI clock source parents
Date:   Tue,  2 Mar 2021 02:25:07 +0300
Message-Id: <20210301232506.3057401-25-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
References: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
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
index 454f794af547..2166549382c1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4113,6 +4113,9 @@ dsi0: dsi@ae94000 {
 					      "core",
 					      "iface",
 					      "bus";
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SDM845_CX>;
 
@@ -4179,6 +4182,9 @@ dsi1: dsi@ae96000 {
 					      "core",
 					      "iface",
 					      "bus";
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SDM845_CX>;
 
-- 
2.30.0

