Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 608E33C3712
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jul 2021 00:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbhGJWXC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Jul 2021 18:23:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbhGJWXC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Jul 2021 18:23:02 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91E19C0613DD
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jul 2021 15:20:15 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id a18so32114088lfs.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jul 2021 15:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XvCGkdShjzVXwoehYqCYEiIRtFRTu+7v5aX+Z4YnzDM=;
        b=AbSrNyT1Qv0iE0yHJGNbuwMtMN/4W5A+21UiqaoqYP5C3+GsyF5EXW+CZ4Ejww4uyD
         HHzCw7F6vSgxHI2rrZQcRckEyn3zuL3E8wE7nKimNYUVLWzZ0hJPHT8QN7QULxzDaX6e
         WoFvRkVturRh5b8L9ia1Hx+6Ach9VFWXKwHUG6N5+8IyXBLpow8tFJDEWeDjG6+ySp7/
         m6VKPS2YmQDqkNT7EgQobRalVkhqrd9VXrE9EfUQ17EfYKVais0y2kTkLs0v2OSzf/BU
         uhlhb5M/Ow6AouhManNW1e2ZoMMARYaBa9W0JGAHZ5Cu6s7l6x8kdMFjmHtsI/sR0VEW
         7y0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XvCGkdShjzVXwoehYqCYEiIRtFRTu+7v5aX+Z4YnzDM=;
        b=TSxX/fU213CilNKMFiQ2YrauTrnfJizeHRnC7sNVQHDab+q+WEFd5T4zBx4oBOJUC7
         fIl+BrDxQ5kWL3e2danJ4EUMgiNZy7bOOj402apMCMfAx2h/rXYwJy9QY9bmBLW0Y65q
         71gPHZSzeB92Fi+mAy5dpXrRSQoT64w1z11MtGSzYqOCq5J0F4EIozvd9VSQeIwoeV+A
         Q8uJC4EJZReag4kzvUuh7vfyHnhma/HwAVEmT05XvBPZJPUsIau5AxeLvRMKYF9InuQo
         4RLQqZVXkbWJh1cI+Uyh5d7Y/09pGSDJiBn+lLOkgcOIdfAqS5Sm3qbtgN88A0tGwLYh
         lsIg==
X-Gm-Message-State: AOAM5328m2ipWlkAV6kzO5CfOg5zpK4tUXD+SiG27IlPwC6GdKlRhhag
        l6Kj4e+CEZAzABQLlQxqUhBb+g==
X-Google-Smtp-Source: ABdhPJx9go2nTN1VQ1gr4+FIrJMDpmM78pdvL1SfG/6V/+r9kCoyk91v6KNTUw4rFqlWGlYmTF/XIQ==
X-Received: by 2002:a19:910f:: with SMTP id t15mr17444636lfd.287.1625955613994;
        Sat, 10 Jul 2021 15:20:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s15sm795466lfp.216.2021.07.10.15.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jul 2021 15:20:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 7/7] drm/msm/kms: drop set_encoder_mode callback
Date:   Sun, 11 Jul 2021 01:20:05 +0300
Message-Id: <20210710222005.1334734-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710222005.1334734-1-dmitry.baryshkov@linaro.org>
References: <20210710222005.1334734-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

set_encoder_mode callback is completely unused now. Drop it from
msm_kms_func().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
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

