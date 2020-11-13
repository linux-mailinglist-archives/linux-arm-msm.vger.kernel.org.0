Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4A02B1C7B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 14:52:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbgKMNvE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 08:51:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbgKMNup (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 08:50:45 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4E85C061A4A
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2020 05:50:26 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id j7so10002634wrp.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2020 05:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B874/wtDOWYUimH8rXUdl9sC7ZHgpAhfTu7itpIsNws=;
        b=FYPms3ZCfPub5iaespY6VDZIg/UmY32Kvxev64zmWZOrrM4041a5OdDqUOv0kfH8AR
         3C7hNCP7cHZ0v/h4e+8cnFjaoPM8bPL36QaZW1kHFqKjLzsUm9UKnD/r5GWAm4pm2JPF
         m5GQZ7E6qKCbUWYUxZW5hhW5RsOh+iJOedQtBtLS26vz4XNap9+BnUufDta+Z+wuno/e
         cezrhZqtIg08ewYF3AS7M96FkeJ4tPgEl4A+tx5pyJ207sxO1w/43KMcuKFKdyaKLigI
         6i9UleZKkZeYOU5nKl8O3JdsOZp+ZshJ7jnDF06QFnQyRtCjg1Swf0tfrvn0v6E8IYaH
         nyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B874/wtDOWYUimH8rXUdl9sC7ZHgpAhfTu7itpIsNws=;
        b=A6BG/+CWTuqmlEdQeB0uDM1bXG8nZ3wGuOnjIhiGsxn1c9Xtj7KgAMJ5x9tqSYyxNd
         u5TQ5MSMfG0VUmwjoveDTxbHHaKQsQxHIylKJfyOooySddjPcQ/UP0pyCe4UaiSVtGWr
         SnMyqmSbJElY08LQLwwuks71Br4cDDchcyCo5OSjCFF/qZi3N7R3CT8FKdtBl8Qhilnf
         YKeikpcXKIQisExTUf9y5m+PLEnm3hlDfMTzE4N+30dG6Dn2gq3wtkx8Tijn4/y/90bQ
         fRIXpXkLJrLb1lw7t+qR8P0QnHp7vsrPE/Cap3sGT2QXyjAoA4nfRsecv8iEk+mC7X56
         phmg==
X-Gm-Message-State: AOAM530VGds1AUHvR6TyZYvGkZsIFi/o/+07L/R0GTKGBw3Vug7E4IBX
        3StWupkYgexJpY3q3/D5Xx2wog==
X-Google-Smtp-Source: ABdhPJzW0/tqfdT3UV2hYFMEgBNeQqVvBSA0yd4n3Fg74iGLfPp9MOAfA0L9PQmK+LV0ocjfEq32/A==
X-Received: by 2002:adf:fb0f:: with SMTP id c15mr3487064wrr.86.1605275425504;
        Fri, 13 Nov 2020 05:50:25 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 05:50:24 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 35/40] drm/msm/disp/mdp5/mdp5_kms: Make local functions 'mdp5_{en,dis}able()' static
Date:   Fri, 13 Nov 2020 13:49:33 +0000
Message-Id: <20201113134938.4004947-36-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:299:5: warning: no previous prototype for ‘mdp5_disable’ [-Wmissing-prototypes]
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:319:5: warning: no previous prototype for ‘mdp5_enable’ [-Wmissing-prototypes]

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index b3eecf8694771..15aed45022bc8 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -296,7 +296,7 @@ static const struct mdp_kms_funcs kms_funcs = {
 	.set_irqmask         = mdp5_set_irqmask,
 };
 
-int mdp5_disable(struct mdp5_kms *mdp5_kms)
+static int mdp5_disable(struct mdp5_kms *mdp5_kms)
 {
 	DBG("");
 
@@ -316,7 +316,7 @@ int mdp5_disable(struct mdp5_kms *mdp5_kms)
 	return 0;
 }
 
-int mdp5_enable(struct mdp5_kms *mdp5_kms)
+static int mdp5_enable(struct mdp5_kms *mdp5_kms)
 {
 	DBG("");
 
-- 
2.25.1

