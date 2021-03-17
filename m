Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE1D33F369
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 15:41:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232301AbhCQOlC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 10:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232214AbhCQOkw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 10:40:52 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53A5EC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 07:40:52 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id v9so3361205lfa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 07:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VZ0geH6BqMBlmbQ30iyES93D0PKaLEePFxddTMOy9xQ=;
        b=no1y5QTnePloWF6Kf5NJI+KW4hcc8iSa7md8U/h+236ztkxrCWmLM76BfogRg1Ve16
         ic8UeNY3CQvCIj7LBtJihb+1OVqWASBOHdzCyKDLDy2js/EZ90sO55MK70CNPfwgfQ0a
         L2Ye9KT0n0j0ihVSz+W9IqJqF/4X+TVYMGXigMPr7xBd603Q3UKwoLSy1ZnSjHuDVLX3
         wB6Ft/pYSwnaePxzAXT2IVJjEc4Pd7OaiabwwFxAGW3m7GcKKh/1U4ti1HXk8/Lz0stZ
         FzhGd5BZYHT9Drn7Av/GitUBhlueIZEfh1k7Yi53NqZX4V+p+Ljn4mSKTUE5WiRPZfgn
         zoPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VZ0geH6BqMBlmbQ30iyES93D0PKaLEePFxddTMOy9xQ=;
        b=hquxyikLHY7cLGS/gS+PUkZ2khZFAB14YGitnV8fUYUWH+qj2Tf7rW31juBOHQlfpl
         ViP3W2oxFdq7LclnKllltB7b9/DA9CEw51e6WAk8k69jKQoJNdfdpMLYeKoXxCd5qfDB
         IGp7LRFj4MTs/VfC068HBTze2LhcX6tke0fFIMc/QCQ3mhRaFxKlrbuUkbV23fO0PsKb
         x+uItsGoMKglp+YuyTOOkik/aAa8jcnkM3iu9XPU1SwkWDKNeCF97cLMkHxlAvkNaBDf
         zBDRloAQjfYd0a/1Uw11RN6lFQJ8gNYK2UxO1UnoLYMPmRA+/zMzFsE4lDJgTZ/Cqklb
         8nug==
X-Gm-Message-State: AOAM532Kagz5gQLzS/Qe3K8NDW9p/Gsf7HQFc7SnXXp5Se2t/AY3l705
        +LRkP5Xzr9rPS6soPVHFHsQ1kw==
X-Google-Smtp-Source: ABdhPJw5jus2v3pxW594CEk+SrRrg9htGKBQ1CbmXj1XxLuT4EdAEgnqIByVfE0lXaRf41wydng6qw==
X-Received: by 2002:a19:44:: with SMTP id 65mr2673123lfa.104.1615992050905;
        Wed, 17 Mar 2021 07:40:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:40:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v1 09/26] arm64: dts: qcom: sm8250: assign DSI clock source parents
Date:   Wed, 17 Mar 2021 17:40:22 +0300
Message-Id: <20210317144039.556409-10-dmitry.baryshkov@linaro.org>
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

