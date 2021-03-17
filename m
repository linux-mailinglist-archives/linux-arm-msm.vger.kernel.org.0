Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F1F233F367
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 15:41:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232214AbhCQOlD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 10:41:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232220AbhCQOky (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 10:40:54 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B50A3C06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 07:40:53 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id n16so3345148lfb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 07:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UAQa/+HPZGb9w4gbaD2aOLSU7WxeXPAw6Cdwe97w/Q4=;
        b=eXP/TledxAPTdTLVmvjWNrnuZ/q0OFDG8H8Gqxj0LKAqVsIpvu5tTqTIgswDK3CeS0
         JWDh9i/7xcJi3WcsKO/Tlly97uR125Ij5vcDkA3bTqdgv2HHcVGvyDYlKZLOC4thwk7Q
         UpKymK7LwNVk9U2XQM4tBKconFpeO8znWGb7iTxgc/lPPDH7U8LYareV88zndg+UAwnv
         UYCxmNTVmvb5F9KfQ7LCvpGlyFyQJLBSwVuI39YvhjVqPqnth0tmnMlKFhiDMqllriGY
         j1cbGp/4XM/2T1BmXPbL5nDwPsyjsvEIgqjoTkZ0f3KIDIW+nQShkGozV3lXxoT6Fr4W
         3Q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UAQa/+HPZGb9w4gbaD2aOLSU7WxeXPAw6Cdwe97w/Q4=;
        b=ZI84pCRov17w+ERQldHU4tQCD0rLEmuPXHrwhi8XVOwLYQEfjn+uawxlMeDJhl6QFF
         A9HA/X+pspydaQt9ouakQ1CpekBie09LwHHrrCiZ4OU9JiOvijx/MyaqXQZiP3r9vhC5
         S68gnkrCpbx8aw9e5AbCNCA0lQBks075ljg6OPHIM6oYL73jlk42HAUy8v7kvydFGrcp
         2Bs+gnnIx3hhiiUtAxbCB2Q/uEiY3g7Q1R8nKlhCKJglD9T8ahcTyoZizy9ew3R/pNc7
         U8N2lcIFF1ObJQMNKnWjXvksySC6d6JkWG/oE+C5RI2JSo4lkI8aUi+6Q6VVHqMMGR/q
         1enw==
X-Gm-Message-State: AOAM532kB9rJpU1WPw6O1OhsCGmdt8HI7hhYJMzEHvdBB0jMhhf9+1KW
        RLFUiv1JkIsDy9U7O4/omOEOjQ==
X-Google-Smtp-Source: ABdhPJw4euHwBGmi07h52o4jzm1u82sY8Mak58T89zORmZtairSuAVrS4Ctn8CvJZPTrJNViVGwA8A==
X-Received: by 2002:ac2:5e6a:: with SMTP id a10mr2559303lfr.181.1615992052285;
        Wed, 17 Mar 2021 07:40:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:40:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v1 10/26] arm64: dts: qcom: sdm845: assign DSI clock source parents
Date:   Wed, 17 Mar 2021 17:40:23 +0300
Message-Id: <20210317144039.556409-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
References: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
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
2.30.2

