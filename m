Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D62841F276
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 18:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231311AbhJAQwC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 12:52:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354531AbhJAQwB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 12:52:01 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFB7BC061775
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 09:50:16 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id x27so40712563lfa.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 09:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OcDaHRV/tjWeyeiN9VlvL1Q2iTbW4zlPJr4vNhrwq8o=;
        b=FVF0sfSKYeZBR/hXFab/Kh6eEXZIYprLtC2+EqzHRgiYAkv/DZJJPFgXFtQgwdC8yc
         J0sY6n295P7Eckysy7o2iyUw/5MnFw4G114YXHGCoz3vBSAV+HXyreupsG3Y5m8L9Xlt
         xM+/n913FMmbY8+2LhyeG5YypVYqmv1w/nNh7k+nuqnpEwgPdz6MncJD9MGRoENJ6yor
         hh9nMV5WCu+ZeOvlYN6xozmMCkGKhq6Y6RpQG9G6jTgDTqjtHZ72m7JVWHgBAMTYadDU
         Cf48FqDjCyLhVbTByAXlfCluXqN2gM8Y4pQrr6AzgcCrNV9d715KAdLRgSMxyWefcMH8
         rn5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OcDaHRV/tjWeyeiN9VlvL1Q2iTbW4zlPJr4vNhrwq8o=;
        b=ytXWnx1IQ3T6e5VplrtLuhwKrA8wIl+0aldP9qxK95slsZl7DCAfJgBXh6oAa8v4wG
         dMhDr4zkYrhiqfEXEbiWJhXPHUqrojRPtKQv1taEQ2iMwEGs02YKYgSOPq5yMcc9sYGm
         bC7xPzpekMNfoMXUpq8hY7Nsr36BX1die6t++ASm6brPpv6PX0QnVMRvnb0TqzXnKC0V
         D1CQBZpqEbUQPYNtTcKQ+kXfDuJg7LwCu9VbpWvQG2ZqsEnYj4Uzr7Q5UuiaSgRuL7Kk
         Cm9i+nWKGeo1gNvHuyfxcEYgMV6I4+aCHQfMPBlpeWUKmfScXIsJcMWm/+H6K9tbVN03
         5fYA==
X-Gm-Message-State: AOAM533e1CaM6zClsvFIfzEJHSC7Pi46+mkX/3wzwcr5wFVvXwh6f903
        P+0bS7anxbyr6/JHw/tvHrWzGg==
X-Google-Smtp-Source: ABdhPJxoAiaTqyz2HiFJjIUaNIq+pbkkOYn+C0oxcnZQqalqK4MyOk6/7UkYb6cYNSF9FCUy4wBj4g==
X-Received: by 2002:a05:6512:3d05:: with SMTP id d5mr6467979lfv.78.1633107015147;
        Fri, 01 Oct 2021 09:50:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n24sm787052lfq.294.2021.10.01.09.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 09:50:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 1/3] drm/msm/mdp5: drop eDP support
Date:   Fri,  1 Oct 2021 19:50:09 +0300
Message-Id: <20211001165011.441945-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211001165011.441945-1-dmitry.baryshkov@linaro.org>
References: <20211001165011.441945-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Prepare for removing old eDP support present in 8x74/8x84 SoC families.
No devices present in mainline support eDP ports.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index b3b42672b2d4..21707fcd883d 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -376,22 +376,7 @@ static int modeset_init_intf(struct mdp5_kms *mdp5_kms,
 
 	switch (intf->type) {
 	case INTF_eDP:
-		if (!priv->edp)
-			break;
-
-		ctl = mdp5_ctlm_request(ctlm, intf->num);
-		if (!ctl) {
-			ret = -EINVAL;
-			break;
-		}
-
-		encoder = construct_encoder(mdp5_kms, intf, ctl);
-		if (IS_ERR(encoder)) {
-			ret = PTR_ERR(encoder);
-			break;
-		}
-
-		ret = msm_edp_modeset_init(priv->edp, dev, encoder);
+		DRM_DEV_INFO(dev->dev, "Skipping eDP interface %d\n", intf->num);
 		break;
 	case INTF_HDMI:
 		if (!priv->hdmi)
-- 
2.33.0

