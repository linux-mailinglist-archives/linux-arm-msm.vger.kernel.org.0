Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B60845A0D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2019 18:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbfF1Q2n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jun 2019 12:28:43 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33768 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbfF1Q2n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jun 2019 12:28:43 -0400
Received: by mail-pf1-f196.google.com with SMTP id x15so3249999pfq.0;
        Fri, 28 Jun 2019 09:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=f4FlYc0tSnypgxsXvd2ujjNQ+KDCveBa8PK0MgXP0hA=;
        b=H+xRChrJemigNIk4GdKOAlcpb/8FWPAxL9stcUcChcmvMaWjtoyU51GdN+YJ3KviB2
         MqqC3NWJCoPqstrRo+bB+UVHkfD/t1Vy5X7UejLPsPePzXVN8MKLlTaHVEXimybNeBk1
         X6dkyUNW9v1H3gzKPEsQ0/gM8V4ehjc+XKtUhsB0W5ysUFBu8yp/oboBaTS9sajNltOB
         yLWFO0HVJLkkvq4b0clhS4lj3BeqP1pijHV5/N84NM9x9pt7nnNhUEijPKvczEhLyOlD
         UZdE+fUa/M8SR9w7LXV12GFlerEhqHqCNS8uRpM5hoY9qZAOHR1BXpDZZGW+qgrgocOI
         jAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=f4FlYc0tSnypgxsXvd2ujjNQ+KDCveBa8PK0MgXP0hA=;
        b=t9XAT1P9VPX3iUmvfKXAd4PaFMRNQGR6VKO8lVdHJQznPM1JX/r1PTkGfd236Vt2Tj
         Hv1CAk0z3vR5qs95EWbQ/pGW5f1aMma/IgIBKTNEkgCmfCYy7buJ+FGySTK8ICKx9tn2
         lWdKOTyPCYktUGVlkvgdsC70xPndOLm0K7dLxImkvMGCC0zaqSKo0D4uvk0k+Ri4PVZD
         8FQRSox9jY5iD2XFGsbYuP4yr+c2u7zOB/xhjAdGzvY76QHVYbVP9dsjPTFdtp2DOhe2
         Qr5dbnfpDOyGhN2zU8RQOoqwSWTcwoMOo962T9ZfkvnACXRj952mPuQ/ULYprlMrtLcO
         r7ug==
X-Gm-Message-State: APjAAAWwShyta6Fo2qgtieeCy8RHgPSg+znBCnMIjWnXHUWELcH9/QRS
        /xMuvS58AeHXioDOkQO5SUA=
X-Google-Smtp-Source: APXvYqw3Bw+hLp2MAVECsGm8rf8acNLXkxx83ZHcJivruGjgLxWwHArI17NwKh3uIAOcVzMz1gE9yA==
X-Received: by 2002:a65:664d:: with SMTP id z13mr9071896pgv.99.1561739322946;
        Fri, 28 Jun 2019 09:28:42 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id x14sm3525257pfq.158.2019.06.28.09.28.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2019 09:28:42 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] drm/msm: Transition console to msm framebuffer
Date:   Fri, 28 Jun 2019 09:28:31 -0700
Message-Id: <20190628162831.20645-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If booting a device using EFI, efifb will likely come up and claim the
console.  When the msm display stack finally comes up, we want the
console to move over to the msm fb, so add support to kick out any
firmware based framebuffers to accomplish the console transition.

Suggested-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/gpu/drm/msm/msm_fbdev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index 2429d5e6ce9f..e3836c7725a6 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -169,6 +169,9 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 	if (ret)
 		goto fini;
 
+	/* the fw fb could be anywhere in memory */
+	drm_fb_helper_remove_conflicting_framebuffers(NULL, "msm", false);
+
 	ret = drm_fb_helper_initial_config(helper, 32);
 	if (ret)
 		goto fini;
-- 
2.17.1

