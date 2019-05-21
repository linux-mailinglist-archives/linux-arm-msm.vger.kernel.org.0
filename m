Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2A2525339
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 17:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbfEUPAh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 11:00:37 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35816 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727969AbfEUPAh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 11:00:37 -0400
Received: by mail-pl1-f195.google.com with SMTP id p1so3198475plo.2;
        Tue, 21 May 2019 08:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=B164xY76PAaJHCklCGNK3/SigqrJDxrGxeTBSbiHos0=;
        b=uP7vqaIw/npd7e9gEqOrinrFsec9BTKODKGoZw61tOTGtHv4J/zw6OoVoXR0SviAZV
         +LZcJE/hbKYJEDNrozCL4FmpeB3jfQy4sMvHqtD/VBY0isLxcZutvrJciXzHq2B7NtSX
         3CL7Q7mhAvwk60CRUIyminErcMpt3cLicPyVhcmNvL8VwXbfVloRGGGDrO5Dp9dKPtqC
         WcPVWVpQssCutPdW/q0Niz+F30qJ37fCwwG8Mh078qzf5RsqBm/HMzytuxuO51eqim1l
         2BbOXujOAUngh7QWZ7znHGq5ubIJQMYn4qE+B8Ar3YCHAM1GlFQvl6lemCCUr3gdabKH
         e1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=B164xY76PAaJHCklCGNK3/SigqrJDxrGxeTBSbiHos0=;
        b=jlHqNkMGrC+wQK7nskgtHlOvGbU24Re4/kqS61he3AB/wKlrWHgYHZaa9BAGU0DYd3
         7A51MAHl9VincCOily8CBB9I6xdphXL3gcXFFBn/Q44z6uWR6kj6452SAXETHPSkXVRA
         gQfN/cVd4rOtFHVE8m9HlbSTJTJLOEGaH0qe6FYAPSuy2NNJZyLBkGiTSNxjmxEt+4PW
         /G1SHt28QwCDbALOs5REvEdJZhjySM6MTY8CLosQ6ThOfv52lxUr0HOc5aNlKcmcRPUR
         MaczXmP8cL8iYAdoacxSbop0QQUlsO/a+efNFqObLOAUhyPnArjp4Dl5sq8KF90YFbkp
         4cqA==
X-Gm-Message-State: APjAAAUR3caEVKMcHlPe8iq3NTYXWrFIPjzT8sXII9mVo6Uh542blIAp
        MN85qfDotZheOHcF7YfHyb3PP7yU
X-Google-Smtp-Source: APXvYqzZAZ+CyXG++ETYiVutSDrWxMIRF6XbmMWbrbKrMC0t8jGXSbHoO7Vuuee7o49qROXqWKttfw==
X-Received: by 2002:a17:902:294a:: with SMTP id g68mr58170042plb.169.1558450836681;
        Tue, 21 May 2019 08:00:36 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id v2sm19953381pgr.2.2019.05.21.08.00.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 08:00:36 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH RESEND] drm/msm/mdp5: Fix mdp5_cfg_init error return
Date:   Tue, 21 May 2019 08:00:30 -0700
Message-Id: <20190521150030.13609-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If mdp5_cfg_init fails because of an unknown major version, a null pointer
dereference occurs.  This is because the caller of init expects error
pointers, but init returns NULL on error.  Fix this by returning the
expected values on error.

Fixes: 2e362e1772b8 (drm/msm/mdp5: introduce mdp5_cfg module)
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index ea8f7d7daf7f..52e23780fce1 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -721,7 +721,7 @@ struct mdp5_cfg_handler *mdp5_cfg_init(struct mdp5_kms *mdp5_kms,
 	if (cfg_handler)
 		mdp5_cfg_destroy(cfg_handler);
 
-	return NULL;
+	return ERR_PTR(ret);
 }
 
 static struct mdp5_cfg_platform *mdp5_get_config(struct platform_device *dev)
-- 
2.17.1

