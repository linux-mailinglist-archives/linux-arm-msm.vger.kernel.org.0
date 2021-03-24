Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E96C347C49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 16:20:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236576AbhCXPUR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 11:20:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236583AbhCXPTj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 11:19:39 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0F8EC0613DE
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:19:25 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id g8so25421610lfv.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d5gXnaS6/FhBtkbwF8y1QR9zxelWPPlPpq/TCaYVKkQ=;
        b=ahp+fVKPZwAYJOW7LBbtb9n9bOtkcZ8QEH92zF0ab5N9I6JC/bQAFlWBWCXj/7GxMY
         KXs1r/ByTAchuEe9IEHPZU0h+05/u29eJIiggZRbHuSnVAulRDX62LU5xFRFyLkUHNnL
         +oqsGuNEul9eDR/gWiAR/YPHklWTlVq1iwa2CIvvxNokMlgb3nskHwPfabCcQL1Fa1zL
         sd1p1G94PgZkt5kszyIIj2+jyLcg83O039DV/ojycQFbwB5EqIt01IgL78QLQHdVhxSf
         2Lf490CyWN4LD+V8qFbEMm+gB16bQgXbpaWuEWEJF3BPBq/7zpKxrFtkkUuUjrcOOnHD
         4MhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d5gXnaS6/FhBtkbwF8y1QR9zxelWPPlPpq/TCaYVKkQ=;
        b=sbXqBxXb4vWu+9nO+/AcQ2hcn+hruvN6D+fF6pK2I9KvNi71jyhCo+N8NV+3t0JXsp
         2bwGWx/CD38fWVklxQprwgzhkXoDeo/8TGS5KyWjn/pK1totKMd1NnpJesUNFcSen/8W
         j8WEzxCV5wir5S7NoD1f3NtHvTgyTs7GnmAZ7TOC41yiprt2aiM0WlphkVSGFIN/1xfw
         gmpuWNRitvoMO6Ubod9DsV2DhBGvhbkFCAnId4Kck+JqxOFnLNNibHSHapT2kNhvNiqE
         bTygPdlMOcJujt/nO3Kd2kgG3SeJqHEvZUy7UaFTWRsxkYHT8dmuLRLwbHzR5/sb+6aH
         /BFQ==
X-Gm-Message-State: AOAM531NLPYjyyee5wr8MoOsPz0x+JLjNbV1AttZYr9rYlfqd1wDg5gk
        jxOdHGm6/XYMbCuwvCp+FaoyEg/1qOLA4Q==
X-Google-Smtp-Source: ABdhPJx8XJ9coT+NGmhTsbhOuiSRspWWg3awMGtpNTVWXUtP3HYMg5dWhk1AsT5lXPxJa92lUn+ukw==
X-Received: by 2002:ac2:4ac4:: with SMTP id m4mr2215124lfp.404.1616599164364;
        Wed, 24 Mar 2021 08:19:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:19:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 13/28] arm64: dts: qcom: sc7180: assign DSI clock source parents
Date:   Wed, 24 Mar 2021 18:18:31 +0300
Message-Id: <20210324151846.2774204-14-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 22b832fc62e3..c16ddabb3a92 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3076,6 +3076,9 @@ dsi0: dsi@ae94000 {
 					      "iface",
 					      "bus";
 
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi_phy 0>, <&dsi_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SC7180_CX>;
 
-- 
2.30.2

