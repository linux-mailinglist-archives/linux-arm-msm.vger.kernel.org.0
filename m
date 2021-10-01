Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57DAC41F427
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 19:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355651AbhJASBC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 14:01:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355638AbhJASBA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 14:01:00 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28A17C061775
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 10:59:16 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id s24so12398031oij.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 10:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nF6LW47fQKO3rk11qFL799VxY9yECSKjA1fHehWHHiY=;
        b=LfElaVRac/rd1pa8a5fX1rNze9VGWsDJnTwe0/38y7mY4Ift6Rv2p0/0MJRGrWKadO
         RI16GHNleNanYFQYIHBEVPz73wL0xknC6WgdjoR4Pmg8/yz9k5qNLI29iRn1mYCLqizx
         zmMzb4CpQ4D2Wcw4Yiraci0rPMYVNKkHVvF3RjUBElh9eCZcYZWa7uP9v31fcHe/6OwN
         0jeNLY4UahYzbGIeIJG22QvYF53997PNq8/+Ci/autUvIIHlJvDcnMy2Dz1yf1t/0Y4V
         9hrvQgfBCYp8j8YqkD5lUOS88Me/dIra4WhaQN0cIpGtpyTBCNnh6L5JGZRNRYahdRgF
         zMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nF6LW47fQKO3rk11qFL799VxY9yECSKjA1fHehWHHiY=;
        b=qQ0hZvlgjjpuxjyTiv5Gph+2xNffoFQ0M1lkgSg4afuJQvYvC+B2BOoG/vGcdSRsZG
         Zmb25s5U2MEvjAj4Eli2AfGk5XcwDh9FLZvyXbnNu5XpqxKuxDkNR7Jf+azI1tGcoYnH
         XYOaUrBPvWvHRdzrf2fR5rXWYRhL/YXejIBbUzbYJjjlHnqNVOhIjIWvotXDsYa1XPYG
         sUUCpUDK26XrCCNsJYZlPE5jA5pgGc+QNTRUo63FT//mTgFZ9fy8scZyYN5kv+kL6BP2
         5JX4w/H5x/IULvj82tTNBfWaPURr1HV72UIj+W4uC/e4x0B4MALGLomJmG3qDs/o5Bmp
         Yjxw==
X-Gm-Message-State: AOAM533pbAHKXPKj+Gg/Wwy/qTSlqTxqcTdWw2aG0V1HxurPIgdGD885
        v5kUD9p0tpM93BlgfCCiA8zs+/VogZrFmw==
X-Google-Smtp-Source: ABdhPJyRflu6emTf1eQ8g5XBdIrtHKb6KHaDYwhSuzKDBHwh9NHvtDaXTcXoG03WprD/HYPocjp2nw==
X-Received: by 2002:a05:6808:b25:: with SMTP id t5mr4965587oij.58.1633111155560;
        Fri, 01 Oct 2021 10:59:15 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id w2sm1284798oof.23.2021.10.01.10.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 10:59:15 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] dt-bindings: msm/dp: Add SC8180x compatibles
Date:   Fri,  1 Oct 2021 11:00:57 -0700
Message-Id: <20211001180058.1021913-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211001180058.1021913-1-bjorn.andersson@linaro.org>
References: <20211001180058.1021913-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm SC8180x has 2 DP controllers and 1 eDP controller, add
compatibles for these to the msm/dp binding.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- None

 .../devicetree/bindings/display/msm/dp-controller.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 6bb424c21340..63e585f48789 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -17,6 +17,8 @@ properties:
   compatible:
     enum:
       - qcom,sc7180-dp
+      - qcom,sc8180x-dp
+      - qcom,sc8180x-edp
 
   reg:
     items:
-- 
2.29.2

