Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEDCA3BFA29
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 14:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231593AbhGHMbf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 08:31:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231449AbhGHMbf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 08:31:35 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE374C061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 05:28:52 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id v14so15007348lfb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 05:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7I80h9aVhqiz7KKnY4LfQ8riY+ihQMK3yCgtkJKzH/0=;
        b=dZAt1g6wH7fjpFQDlowAYZN8LtG7zjesMmpA6jmrhqhJAE1HfXHW7YzFzwRvWx1byI
         Dt012MPl6hYgduqdcjBogdsG+Fvg/tvP5s3Hj1WX86YPrM2GkPc7RjLF3Iii8SroKNkM
         3ug7axUM0HJ8atvA5l08Qn/Zsf62TUILw9Thg7Ti0tAefyhiVF0TZfl8RgaJ8n8Yym14
         gYCdCim+evV7ZlnE+Ia1nU/qUgExdopbWe4jkbAtNM2XJOhoCnZjbyPRvQuBOaOBYUsD
         ZcmYp7kCvy5GjvBBAhN/qElPHe0llzlsIdCEbNDzsRK8FMo98+xUtB+q1HCz2q7LRfpt
         O58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7I80h9aVhqiz7KKnY4LfQ8riY+ihQMK3yCgtkJKzH/0=;
        b=WmkdNGg22P2FEx39bX6EM4L+S0u1uyMI87NAmDeVkoyVKxBOg7lKu7QO9ZxUU7YcWI
         NGqGqGw+pyaalj/bZlnmHeyEBuNMFcEnppY5VlIUwhMVe96ckTsBYY17KHbOv05U6lF1
         lFjkVWee9mhn9MXU9pxp20Y0tdjk3o7XOdF1Y+dNNnI5DwS+QYwv0vyN5RNu+Xp8TEq+
         gcATqrJ27mFtsgKtFo+BdS9g12pab/1vlbcYYMub4OWeYyL+CpWrJ1f1UgYL7cXVDQcP
         lH4cyo7uMKPt5l80zeNmR8eIWxIfVSyXWxswTgj+S1FyWPXlCvzyFodEcr/PM5dlcHRo
         LhRQ==
X-Gm-Message-State: AOAM533BDXYuexVeactHgzdlzm/zeOWbtkHl+r3FtGbAr1I8x5c49jRI
        3lecRYrdcokvswqB4MlwAI78eg==
X-Google-Smtp-Source: ABdhPJxcesU2QBAkJa39kbKnQyTZPVM6HeuqpeKl/QOq4QlQUQTGSkaTJaHkvInbFM8r2vb4I0+J8w==
X-Received: by 2002:a05:6512:1385:: with SMTP id p5mr24551389lfa.447.1625747330880;
        Thu, 08 Jul 2021 05:28:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f1sm184368lfs.211.2021.07.08.05.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 05:28:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v1 7/7] drm/msm/kms: drop set_encoder_mode callback
Date:   Thu,  8 Jul 2021 15:28:33 +0300
Message-Id: <20210708122833.363451-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
References: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

set_encoder_mode callback is completely unused now. Drop it from
msm_kms_func().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_kms.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 086a2d59b8c8..9484e8b62630 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -117,9 +117,6 @@ struct msm_kms_funcs {
 			struct drm_encoder *encoder,
 			struct drm_encoder *slave_encoder,
 			bool is_cmd_mode);
-	void (*set_encoder_mode)(struct msm_kms *kms,
-				 struct drm_encoder *encoder,
-				 bool cmd_mode);
 	/* cleanup: */
 	void (*destroy)(struct msm_kms *kms);
 
-- 
2.30.2

