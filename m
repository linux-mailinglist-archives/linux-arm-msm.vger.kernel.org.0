Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 859AA32A104
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Mar 2021 14:35:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343889AbhCBEsU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 23:48:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238325AbhCAX1o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 18:27:44 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EDD6C061797
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 15:26:15 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id q25so8082845lfc.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 15:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=52VY1qGR0DBCvKNl4BeNryqM5sQ80IZrIVZy2czBVUc=;
        b=Y2R+b6uMaHEA4g/itnFBwvx3iEWxqD3EfbEN+/aG399V017H+AjY7Lzz9QGOuYgYkq
         alrXh7t89aRlrECo/bkRNVxr44HdOb9uZ8pUVYUbcAHMxYEsW2TR4s9gHEqfJdAQczgN
         ARk/xVUfc+MKwlOtm7exa0g6DzO6YrEuECO/m1bWtGfhV+K1orCOlxhlzIbFWO/jEqWE
         2DI6PutXiorRqLPlU6onwQjtAehzGLfNPt7lcKLshxaIOfT6RfFU1lsP/98005XbnooH
         L8sIHtxVFpRyyuzSR85tS6MCRMTiFEE2/9f4dAHvfV1IJdHA4zYbuK4PzqOwTMrqCYzO
         GXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=52VY1qGR0DBCvKNl4BeNryqM5sQ80IZrIVZy2czBVUc=;
        b=VhCAlUoQC0Kj2DdehiNvTAOkMzjm8R/9iMGT71+ZrY5s91u/DS8fr7yoDzLSeYY1TD
         OMR8Vo+liHLxLk9UtFQofLXBX88gizwwk6+3oZ8CTH7er02N8OzUMUerajIWKw9+r9x/
         ZCOhRQOeTPZ1939mmLdvDN7BgLiIiebNZJCyfdxhsQBZXnTvzd+Ho3MLLAOCsPbIU854
         TXXsPtxbpS9tOGTtflTGmGnyxt4cGDoyaisfs2tpuOjL/iqEYweUTxrov3ItXCzNxMUt
         s9IFwomYqzwwUsDaknloDvUCJwdxr74xg4lJSHq+pybDMuZXcrGfk3UVJ7NkJ53SmF9i
         ixWg==
X-Gm-Message-State: AOAM530YknR1wBAueGtCv6zbxqggQ8n3q5bFIPrR1KYO7NLl3tyoLTgI
        9no2rlWYvDgpGjy0bml2hvoEiA==
X-Google-Smtp-Source: ABdhPJwGKatMMje/buXvMiD6ivtxJLAtH6JNnHwJLzXtTXMLU/Ja+E3WQqmv4P4T5lvuTvPGMYsrCQ==
X-Received: by 2002:a19:2d5:: with SMTP id 204mr734618lfc.85.1614641173829;
        Mon, 01 Mar 2021 15:26:13 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b20sm154749lfa.183.2021.03.01.15.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 15:26:13 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC 07/24] arm64: dts: qcom: sm8250: assign DSI clock source parents
Date:   Tue,  2 Mar 2021 02:24:50 +0300
Message-Id: <20210301232506.3057401-8-dmitry.baryshkov@linaro.org>
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
2.30.0

