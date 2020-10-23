Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA14829754A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 18:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752361AbgJWQwH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 12:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752262AbgJWQud (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 12:50:33 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAC30C0613CE;
        Fri, 23 Oct 2020 09:50:33 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id 1so1221391ple.2;
        Fri, 23 Oct 2020 09:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rnfI6CR6MNrByW/oTFh3EaIyTTFNdfmHTDNbySXUNoA=;
        b=Muohvj7O0oK09MXn0QM6Uj4fGLynOfHZ9rnLrkOxQzUIA3YYK9s7E7k1pTfBfHXuKO
         Yz/5/9jNTYahvExGjQWsUYuvgS6AeviiDwKnZWOwDEzyoGJUN2sIgOLpttHk5Q6WIsY2
         dpyeScX7H8jUAyYRaf6ng8TCF68laaV599dzjm3akNwtBrZKB2VzvQll3zb5rNth6das
         mezxpuYX5O+xo116WaqkTeQsRZQImTTPnvYoER3YQt2f0j+RvWqcubYe/FETfvPx4yqY
         IW/FW1rNAi87ixq1VzFAxNeFFdK0GsIyjiY49rVLyFojDe0buZhkeBxJS3M4iZ3x2WUg
         AImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rnfI6CR6MNrByW/oTFh3EaIyTTFNdfmHTDNbySXUNoA=;
        b=k0tdJJSU4HXWGXF29IejaEiMDxKDRXEqFe0Y9ATwW10VcPrVV47tFYRplU9MOfTLfH
         hZ/1EjZA5+ksUxC8ffSwWxbLphvvXlDrVE99742oCVKcYnsMYBU6mjG6dXE0zzVuhm6n
         bMs+QTYIl/tdWPd2BcjkOcCTIEZ7iYQtRUvlq/2RJf3rwZyCT8a2wgrXzjvLjygfYUSi
         nCPmcYLN2WwPfAxIpgOena4IuaWs4k/W9Q/BLFgPzSiNKnB+WwBdTGvW1KzZTU6b4bzS
         yeXC8n+Pxcqmw9EtXqM2+IO6IkMzvb5h1EU7ZF4KPP2QeLZM2CsgmoPmuwcLpYrAuvSB
         RTWA==
X-Gm-Message-State: AOAM532k+EPGzggs8AQOBU9CxwtjqYFo24M5yD3Ln6mJ4WJIZ7Xcw5hR
        KXRn2Un9joSYDmfHRpQQs5U=
X-Google-Smtp-Source: ABdhPJyS77JBbY9pncch+9LvadZzVAZxGMDfX//aH2HbO3UEx0cugM4bjeMvIN+39aVdiYUVxVHhzw==
X-Received: by 2002:a17:902:b785:b029:d3:d779:7806 with SMTP id e5-20020a170902b785b02900d3d7797806mr3210644pls.70.1603471833259;
        Fri, 23 Oct 2020 09:50:33 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id z18sm2622020pfn.158.2020.10.23.09.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 09:50:32 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 10/23] drm/msm: Use correct drm_gem_object_put() in fail case
Date:   Fri, 23 Oct 2020 09:51:11 -0700
Message-Id: <20201023165136.561680-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023165136.561680-1-robdclark@gmail.com>
References: <20201023165136.561680-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

We only want to use the _unlocked() variant in the unlocked case.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 17afa627ea3d..992cda7e4995 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1140,7 +1140,11 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
 	return obj;
 
 fail:
-	drm_gem_object_put(obj);
+	if (struct_mutex_locked) {
+		drm_gem_object_put_locked(obj);
+	} else {
+		drm_gem_object_put(obj);
+	}
 	return ERR_PTR(ret);
 }
 
-- 
2.26.2

