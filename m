Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 141C73818F6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 May 2021 15:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbhEONNm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 May 2021 09:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbhEONNi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 May 2021 09:13:38 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67672C061760
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 06:12:24 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id c15so1719824ljr.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 06:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VZ0geH6BqMBlmbQ30iyES93D0PKaLEePFxddTMOy9xQ=;
        b=Uv6MazY9XNEXNTEONgwnHe0oOXRGuDo0b633L9TmxeAMKHNMdElnpQxc2m11x78BYE
         XsSy6yfX2SvK/BgTmrn1J+s2NUMEJKYmoAxYLf0D7JeJl92OGakS/oSEAvVKZL3QByMH
         gGy/uqAHHAoHnQ9vV8Jt2YXxwltQIDRHJpHVVmtHtoYp5lq04Wo12RpE5dRWHsxR7g9G
         l+gsLXbS7ua17YOR02tNw+LaE0KKvchfT5UG7lQoFraNajjYCWV4bPbLhP83+qzT0Gzs
         WyJWGBHoB+CfG9QtkL4n+ROCRcCEn7iR3E33bnvly3COciRyXZSSOiHN+9Wz5ibSU96O
         QoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VZ0geH6BqMBlmbQ30iyES93D0PKaLEePFxddTMOy9xQ=;
        b=eZU8w809PQ4BJDjxGwmaYbVswdM34yRnoYakYSqzcfV1xCQf4ipVYVcKEREAzV+5UL
         /AmalVPKQJQ3dOSab+S4H0s/e0BfdHBUmR46VS3Nyh+/PbbRHyVJdXo5p0xRA6aHcPl+
         IgM6E6JrzSCeefUzZFYXggIJ/NpQeos2RI7Z1nQU7gtVxuOTMLB+OWiECObKQELr0arV
         K/yPIshv5O1OAM4gNViHJku01Lcr66ZennjnuHHjRzHRAFzuiVlwac3R3pBAlKB9krCs
         z+HHjQFBW08q3dg8R7398LUeZfJ+cJF6k7t6fzXqxaEHm1KK6wvW+QwKnWJ9fXpy2wbe
         JBQA==
X-Gm-Message-State: AOAM5337cfmGKIEqrVnKVoB2+zt9AgYVZzIwotJy4JMc9TLua8PHBoIE
        v1qASINtrZtEQ2u/+bsDiDs2jg==
X-Google-Smtp-Source: ABdhPJx4JwjGkjf2+ERd282AHyLy6MuHHJwWFDuM056vtz6NXfDNDM1FmZ5MZCoMRJln3Seq4wYFqw==
X-Received: by 2002:a2e:7a0f:: with SMTP id v15mr41795283ljc.242.1621084342980;
        Sat, 15 May 2021 06:12:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m4sm2061865ljp.9.2021.05.15.06.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 06:12:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 4/8] arm64: dts: qcom: sm8250: assign DSI clock source parents
Date:   Sat, 15 May 2021 16:12:13 +0300
Message-Id: <20210515131217.1540412-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
References: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Assign DSI clock source parents to DSI PHY clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 947e1accae3a..b6ed94497e8a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2445,6 +2445,9 @@ dsi0: dsi@ae94000 {
 					      "iface",
 					      "bus";
 
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SM8250_MMCX>;
 
@@ -2512,6 +2515,9 @@ dsi1: dsi@ae96000 {
 					      "iface",
 					      "bus";
 
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SM8250_MMCX>;
 
-- 
2.30.2

