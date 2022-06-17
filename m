Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B3905500D3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jun 2022 01:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230296AbiFQXdi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 19:33:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237732AbiFQXde (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 19:33:34 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69E0B663C0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 16:33:33 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id g12so128619ljk.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 16:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9plUk4yuJHI9KQEwjKvSKAhzBHEdS1qic5Z60CrCjLI=;
        b=vwYNKA3mFqnN6V3Y0psPcXFYgGmC7OjV0mQTP0R/36Wp4nsaDK0xw8EA/8M93r/d72
         UBeXvvd617oBpcfeECb8QB1p1QKQOLExELPmWCT8rinXftWy5z0cjH/zW+r8nQdMjogv
         1rHrUfH54XhDdG9jYD2ZA5cxHobggE95E992uC+wHqrh90xC06zbbcT3JK1UCcdxE2Ve
         fo9iI38UmP76cqTifI0SBUwJBIOUig8xU8EViQ0ErNfOIbr7IQoqLOXcjr3tbLtUUu/B
         EmpXderT7ZBZ+jCCX1cC0Xz22iZatkiSsR4U+47Vrm3sqe6F0FlE15nRUvLnUZXTmVo+
         Nyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9plUk4yuJHI9KQEwjKvSKAhzBHEdS1qic5Z60CrCjLI=;
        b=X6utZWvfBlUSlf3epNgelw5cv+Lc6yc4pVaejkrSK0ZUWVsQoXbqBngPyyrFWdqlB1
         B75Sig2+gXAeT0JcpOYb1m9PiRLKDhB7kR/mqlMAsGDgD/77PAjxvLV3MQ19jnODZOp3
         EMmh5xpjUyZWiRlVLZruJ5E/MAClKlOw6qVlHnhW18Eh8pYrW5sSV12MFbQlvHKxp/tC
         7snrkwzN94G7H+BLsGyfB2n3VBByOMgDNxIA9/tve9JKkiwRvVHOQyR9T1ifnFI67xnY
         FcLUUBSEJKb5iZ2FCK8Kc+js7R/8sFF8IJjqNcgCcoDS6qdkb7FbOLt9myWHoYg9lPKp
         CR+A==
X-Gm-Message-State: AJIora9ESWBRf0QMHF4h4Vh0vyNqnAR3w1b4Nf5B0qUuIQfcdJUBr+gv
        IzX48/ybcRgAjYzy6gfDSkxESw==
X-Google-Smtp-Source: AGRyM1ucXsrdIM7nzBNXjCAc2D9qJZH6jHx/c1+TagewrvF+KfQOEgkB+zuAhD9m+o2RYJMWtS0+FQ==
X-Received: by 2002:a2e:9958:0:b0:25a:541a:1273 with SMTP id r24-20020a2e9958000000b0025a541a1273mr2287584ljj.516.1655508811728;
        Fri, 17 Jun 2022 16:33:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b2-20020a056512060200b004787d3cbc67sm800138lfe.219.2022.06.17.16.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 16:33:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v6 1/4] drm/msm: clean event_thread->worker in case of an error
Date:   Sat, 18 Jun 2022 02:33:25 +0300
Message-Id: <20220617233328.1143665-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
References: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If worker creation fails, nullify the event_thread->worker, so that
msm_drm_uninit() doesn't try accessing invalid memory location. While we
are at it, remove duplicate assignment to the ret variable.

Fixes: 1041dee2178f ("drm/msm: use kthread_create_worker instead of kthread_run")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 44485363f37a..1aab6bf86278 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -436,7 +436,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 		if (IS_ERR(priv->event_thread[i].worker)) {
 			ret = PTR_ERR(priv->event_thread[i].worker);
 			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
-			ret = PTR_ERR(priv->event_thread[i].worker);
+			priv->event_thread[i].worker = NULL;
 			goto err_msm_uninit;
 		}
 
-- 
2.35.1

