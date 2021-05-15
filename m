Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF0BE3818F5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 May 2021 15:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbhEONNl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 May 2021 09:13:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbhEONNg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 May 2021 09:13:36 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24447C06174A
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 06:12:22 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id s25so1700861ljo.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 06:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A+eo1IuREtAfwJtXMuCkTNE64eCLQjhkQV6wBXbLi/8=;
        b=F9zQbhL6o6UNZTfh/8Y6OhIAjBxFrUTDRaR3caCzlEXoQjFGMP8vK3SZOmK72ONIDi
         N0B5fNZ5xft0xpsmJl9azKI+xki9rU4sO1koujkWPnKcQsna8HRrk5mqzDFjsbGtfvcG
         pYTjASIhwWSOOTngKjVHTV8KGrOvHasj+G463XNSPcrDoxlQ8kTo1W2snOaEqTf9v6cH
         0xghqLZLdFeDRwFbnmj/A/wtpGPCe9H+CIVD4E1g5ZaV3lrmtZ5aYVjwedFks1Y3DdVf
         bvJkXQrpU//UdUotbqClhT+ftW7CkXSGlIrBw5mAn8li8C+h+dQphdD8CCI+ztJGrNEa
         OBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A+eo1IuREtAfwJtXMuCkTNE64eCLQjhkQV6wBXbLi/8=;
        b=R73fLy/Cx/Qmr7zfVQv+nqyjj1jCVYpJLs6TEQnGfaL7hQzPSTEugmqUUWn20/lCGn
         sOwDI9KLaU8Kt0lSNgV5xieLpVpMHSKR9GTpurRV7yVuYiEM4r98P/MsKoktBY93+jNt
         sswD2+CiJtwVktxh1JAbgnN9gQw3JpFSTXjicfXj5gsVsXFA4jAl0lR9kQD47Xxnrtiu
         upg+4nshwFtVgblbnI2DfbWIchCUgRf/qpYPeCAH8Y29ho6rpRERVbSV8TWt000//NT4
         ZGPHuS3n/vojNTG+lBBBdwStOgC21qRbquDUamtCeoVKg6Ot3kfbVOnpQLtmFXajHKvG
         BuTA==
X-Gm-Message-State: AOAM5339tyxCBdIirbfJtbU1cf/11bMhOQGPLPtLnbt68LDOtVu0GEl9
        5bxDxzH1CHGPEuNonyxz3zZ96A==
X-Google-Smtp-Source: ABdhPJxTxPDWIM8XWIQpBdMA1KGw4O2/agYmUrbuKwulIa5QOEj6TMgAwhaBfg0cH69mIVl3pmvQtw==
X-Received: by 2002:a2e:8086:: with SMTP id i6mr32384059ljg.135.1621084340563;
        Sat, 15 May 2021 06:12:20 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m4sm2061865ljp.9.2021.05.15.06.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 06:12:19 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 1/8] arm64: dts: qcom: sc7180: assign DSI clock source parents
Date:   Sat, 15 May 2021 16:12:10 +0300
Message-Id: <20210515131217.1540412-2-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 1ea3344ab62c..4e8708cce1cc 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3090,6 +3090,9 @@ dsi0: dsi@ae94000 {
 					      "iface",
 					      "bus";
 
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi_phy 0>, <&dsi_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SC7180_CX>;
 
-- 
2.30.2

