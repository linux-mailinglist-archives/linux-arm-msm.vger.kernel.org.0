Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0F2F3F7F22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 01:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234931AbhHYXmT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 19:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234153AbhHYXmM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 19:42:12 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D880C06179A
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 16:41:25 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id h133so1783512oib.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 16:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Qbn6rk6sj87tSTKdnnYPYuRTniKiqOezdw+dFrRZCg=;
        b=Vm4G3uftCW/T6dCqbkA7vokLZMlA9pX5RbXLwF33YGHY9/epjZ2UZRq5k7X3sXH2RQ
         4+j+0+P2XLOlMPSqqzjNNRFMB/sIERKlX72b+Eeou62AjSWYpl4HwXsgkShSu/ocFCP0
         +fTSaHJTwWznLYOaQMKHxMmyAQobljjla/3hbvDh73lP2ApfNpf5ph3Ie/ucWtBwQ2S0
         NbkVeJQAvKsCUMKHe1xLa8liMwqfwWgkzF68oUGavZjOxTIfdwFnnqEC1VggZpcwu56V
         1feLQBw5xIKHNORbnU9/8AMfk3UdSZUHrO+707Wz1k9Vp00gj+Wf+qCj312VNn0EXzzh
         BmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Qbn6rk6sj87tSTKdnnYPYuRTniKiqOezdw+dFrRZCg=;
        b=pP0SMV1ye68z76y7khFEQIpXT/dBA5kQ20q0u5Wk5rUFk1jqWomkFuY7sz8UPkrqdg
         n73O2d4sMgQhPxH9In766D68Weu8dIy1pO4hY0xVIbhwiIDk9II4lvHf+pOCazdI9Iq1
         k6eAQ07M1383CGFewHxSOnYs8Ia5fu+et3w5D3+lwaTS9uQsHkQsOh/8KiveTPS/rVMa
         Nl1+L7IMzwYgDlwenOUUChL0iu8TBRRrbQZViDV+D8VIl6EEDjreBGjksEKW4I6Zm1/u
         qZpAXuGZ0hgLWWll2g2FU10rm979cXWWAkI2E86MBKEuqn69gpv1lZvoAgXuseBxplxx
         3xXw==
X-Gm-Message-State: AOAM530c7hi5MkEB6ho79XJUWz2AjefI/ucXDsgv0FXlHgOElUgFd2vZ
        U64t/S6hQMS2PKaKiPoi5UwT+Q==
X-Google-Smtp-Source: ABdhPJyFkHXrqo/1gbNpklgbgydgMUEHj+c+RHwxsH9rWtBe4qTlWfvRrH5wOgrgwP5OTelW+GQ8rw==
X-Received: by 2002:a05:6808:2ca:: with SMTP id a10mr427499oid.44.1629934884855;
        Wed, 25 Aug 2021 16:41:24 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g10sm267136oof.37.2021.08.25.16.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 16:41:24 -0700 (PDT)
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
Subject: [PATCH v2 4/5] dt-bindings: msm/dp: Add SC8180x compatibles
Date:   Wed, 25 Aug 2021 16:42:32 -0700
Message-Id: <20210825234233.1721068-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
References: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
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

Changes since v1:
- Picked up Stephen's R-b

 .../devicetree/bindings/display/msm/dp-controller.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index f915dc080cbc..b36d74c1da7c 100644
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

