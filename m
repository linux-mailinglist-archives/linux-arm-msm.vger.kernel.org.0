Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 079DE430542
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Oct 2021 00:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244747AbhJPWTR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 18:19:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244738AbhJPWTJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 18:19:09 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A548C061767
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Oct 2021 15:17:01 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id i1-20020a4ab241000000b002b7069d0e88so27408ooo.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Oct 2021 15:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YCldvVc/GAW/slmnXCOBbon0kUi8IujN99j0wGc0Qok=;
        b=IczW/rI+KCJMj4UJ0xuZXt8fK4/dUd6jCLECu9YvS8izjoIBu2E54TmymUBMFMW3vi
         WcAoFcM/ewacm0E9evClgmk52nGAOX/t8HljhwY4Yuucfp6tXg9KFWeFbWWddo/y4F8K
         nd5uKet4+hVNTszkYWEfis2J1c24NdiI3TzK5kC+p+JMgJdGxrLALklYowjCFj1rrQmi
         VEm3J1/eEUbiaanf5OCaNRrMidNBBgYh6L+8rszeegK1B3ebutu9+F/vFFJun2A+ODoz
         zZF8UMA/jMHSTpnwHgR9Ys6t600eHl2jutiziHBDHwhz5gl+6HDGMJZqPRyIXSjsruN4
         Z35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YCldvVc/GAW/slmnXCOBbon0kUi8IujN99j0wGc0Qok=;
        b=yJ2fxUFSz2sI+nR3NFosw88RRPqPSgmoLrCPlx+n+SAbFFmFzjbwfPeRg9n9lA878u
         oqWR6k/N1sYLCQXfwcWQIeFo1ZzDAMD98G1mssNU3J+SUaVUBzMWxDxOfaI4flaOjN7H
         76QTLra1K1yFxc43j9gXVjgYufK1ZXOSPVWPqmRT+s27Msibk1O0AkM3z4Fnf4P7+6DT
         hYLw9NjqEXSf9PU94fhHuKdr18NKMY/SIwNrsXz19kJJRZyXgvvzsRp/oFsY6HCCsBwf
         gh4p3S9XuY9nM0hEvVyud2UL603eTEYb1ko7WHVLrNaRaX9Ku3/preeNN6ilUk+RE7tq
         oCOw==
X-Gm-Message-State: AOAM531YtTp6S/sSH9AUeLtnhwF58txBU4z0SXoOdi+ZOwUPpJPf4ar7
        yb1j7Q8oc2zNYTPq1VqzAXXNFg==
X-Google-Smtp-Source: ABdhPJw9eAziXbPqcUM3c4j08KGbMhhUyk8hEsiILchOvxT7cjtqsS0/2BYQFMDISFiJeGTW/t7Vgg==
X-Received: by 2002:a4a:a847:: with SMTP id p7mr11089393oom.78.1634422620720;
        Sat, 16 Oct 2021 15:17:00 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id d15sm1747058oic.32.2021.10.16.15.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 15:17:00 -0700 (PDT)
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
Subject: [PATCH v5 6/7] dt-bindings: msm/dp: Add SC8180x compatibles
Date:   Sat, 16 Oct 2021 15:18:42 -0700
Message-Id: <20211016221843.2167329-7-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211016221843.2167329-1-bjorn.andersson@linaro.org>
References: <20211016221843.2167329-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm SC8180x has 2 DP controllers and 1 eDP controller, add
compatibles for these to the msm/dp binding.

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v4:
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

