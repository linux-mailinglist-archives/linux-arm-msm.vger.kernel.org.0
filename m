Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E49243818F3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 May 2021 15:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbhEONNj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 May 2021 09:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbhEONNg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 May 2021 09:13:36 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB66CC061756
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 06:12:22 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id u20so1740438ljo.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 06:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UAQa/+HPZGb9w4gbaD2aOLSU7WxeXPAw6Cdwe97w/Q4=;
        b=LK6g4A0NilcaAHff+ttJNs/qFPnktIfTdiF89lyBfOvLftuDjoisE5gve2JJsITkfY
         VfSgKwVjizr4B1B0tgcrePgBnO5tQh2wEfG6HiFN2fvBHLHovX4T11MvrEVO1SoQWoLK
         0k/V81rmXl5cbFVQqyyvseuMY4oZ4Xr4SZ71WSX7xZLcUy0bZUfJ6iZ4rXPcZ9JgHZRK
         hE59Rs1JeIwKD07+ec4z1Luf7UFyVqcEkFC3LCk+QcICWsDzQsxmYPO4HXrxcbQ8VxrA
         CeOqh09FUaImoFFxugcxXS0WLaCCJ8XAvr6Qj+fOtEqE5/CQGnkfnepvKMkOlzhRps1/
         0ilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UAQa/+HPZGb9w4gbaD2aOLSU7WxeXPAw6Cdwe97w/Q4=;
        b=kM6SNVgcs3etoHvSIdApU9J8a8U7PP+E7D1nbYFb7ZNF8W3em2dNowbZgpPHqxHP/K
         91SxCEpnQVkHWit7x8NWaMTJLWhDUET9UIjXLC7p1R1PpbV1mpDUZsdOMJh1wDWSKAKZ
         fz6w6r9o6mXm5WsPgG13tmjdejsnBjWcdTlflKnxXbnBZ2zpxbEOzZZQ+eTCayi2H5X0
         CTZv1/7Uld2Az48ImMk7yrd2gJQzcHwyrOEmd00WKTJFoafpLnVI6YG1LsJjIgI2QNCF
         LJdt919PscU8FIYd6Yj1hckpvoKef5BjPM3noSkzYncrfw0k/vux/Ft/8UYcyIFFZfkt
         VpKg==
X-Gm-Message-State: AOAM5333Bi/yzK2iM8q88hcFbtgSRi1olDMTNrfzdBnrR6lh/jcEEGBR
        wDjdik3opy654cdQfkvEAowqsw==
X-Google-Smtp-Source: ABdhPJxaxa+zajdzVBlvdxIo/Ac8CmlGKHUUOZbnQCs3Jm96rjmWcTjgHXEGCnSdJmVrfaRAdukI6g==
X-Received: by 2002:a2e:a607:: with SMTP id v7mr41423565ljp.81.1621084341426;
        Sat, 15 May 2021 06:12:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m4sm2061865ljp.9.2021.05.15.06.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 06:12:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 2/8] arm64: dts: qcom: sdm845: assign DSI clock source parents
Date:   Sat, 15 May 2021 16:12:11 +0300
Message-Id: <20210515131217.1540412-3-dmitry.baryshkov@linaro.org>
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

