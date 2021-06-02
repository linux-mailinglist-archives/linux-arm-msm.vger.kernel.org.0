Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F00BC398D0F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 16:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231784AbhFBOgL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 10:36:11 -0400
Received: from mail-wr1-f54.google.com ([209.85.221.54]:33682 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231695AbhFBOgH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 10:36:07 -0400
Received: by mail-wr1-f54.google.com with SMTP id a20so2597392wrc.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 07:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LMk1TNRyjEkKfMz8CVM0q7dVL5MOXxkVaJNdLWr+qvs=;
        b=ayCwXdOagW91dL4geRSSIvnIoAy86Hw+zvDhq8hVyXqOhpdz6XnC/vzBQeIRDy+wlr
         dG84f/OXE+BKJ1dq68TKWtirOA9ai92ZbczPg2Ymw0FxCLRRfPZ45fDP9yQ5vTweuxvA
         J8/gVUsJy/tJPAiJBDLOSiEndiAZ9+Fv4X5M6kMqT5PVlYWZsnKgMFma7iwMyYQS02qx
         iU24y4Kfsm8O9Qclj31wnRtZ/VeHfg/J6l0iZUJM5RipSOUUuMbSccDzfdotqZYiQSRi
         SN1rDPmp+PimibgpfQtWz8X4pD7tHebO8silLsR1u4KY89QPdSkjYyakOc8D2fGohhxA
         VuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LMk1TNRyjEkKfMz8CVM0q7dVL5MOXxkVaJNdLWr+qvs=;
        b=WF00EGubi7OpVjlGXdwN14iQQUXm40cC76BTvPKPxfUNGALc/7m9dCcw0qpTFKWINi
         IlHO0MuUQuMozc4+qNN4y9wwNSq1Jsph1E65Qb5TVroXe4kSGm7Rpr7pertyrz5WDGii
         p9W2aOORqHX9/Ju/fPYLf+Q11y9yikrn19JHo9pfZTJOQzZZUfMrkrBpypZE5YRuVoQ+
         WkUi2fMBM0Y4cBabBm3lTwjY1oM2A33VmcvazN0zg+TQ6txnKxYVusFtthZ4tUtgqDJ2
         FI1OAUJsSuBcTSZV7h/VV9NCZm70oToS4AiDVw7SUPf/0Bh4bgc1rRF6FUcOihiYeX8q
         1qAA==
X-Gm-Message-State: AOAM533g9byuvI20qMxX7bH9rWphu52J0020VCiZa284azyhjTCfhaRZ
        Ja/Nt4LYVqqlOR0AOr39msD4nw==
X-Google-Smtp-Source: ABdhPJy36YCMrmcz7kEQrnj2vN6WxprS9/r3ZzMpDck/Tqk9lITU0jhcTqTjWCIH0Nh9IhtVqvOUKg==
X-Received: by 2002:adf:9dd1:: with SMTP id q17mr21515165wre.402.1622644404009;
        Wed, 02 Jun 2021 07:33:24 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
        by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 07:33:23 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RESEND 13/26] drm/msm/dp/dp_catalog: Correctly document param 'dp_catalog'
Date:   Wed,  2 Jun 2021 15:32:47 +0100
Message-Id: <20210602143300.2330146-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/dp/dp_catalog.c:206: warning: Function parameter or member 'dp_catalog' not described in 'dp_catalog_aux_reset'
 drivers/gpu/drm/msm/dp/dp_catalog.c:206: warning: Excess function parameter 'aux' description in 'dp_catalog_aux_reset'

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Chandan Uddaraju <chandanu@codeaurora.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index f4f53f23e331e..9ba75b994595d 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -193,7 +193,7 @@ int dp_catalog_aux_clear_hw_interrupts(struct dp_catalog *dp_catalog)
 /**
  * dp_catalog_aux_reset() - reset AUX controller
  *
- * @aux: DP catalog structure
+ * @dp_catalog: DP catalog structure
  *
  * return: void
  *
-- 
2.31.1

