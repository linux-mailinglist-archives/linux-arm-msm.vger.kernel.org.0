Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1642349105
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 22:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbfFQUNX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 16:13:23 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:32776 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfFQUNX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 16:13:23 -0400
Received: by mail-qt1-f196.google.com with SMTP id x2so12444456qtr.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2019 13:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=04YV4222yTbQVoaNkjtoFrmBfJ73jHzJG/awNg4EaWI=;
        b=DXsH9rEQvO/T3DNNhX4I4Wrag8DtZOeR9pSCQJAE8tKznywa6tSYOjTPPh/4eOvwXh
         eDG92ifV/tMg6EKFPvyb5fVYFzhjrhsqpprXjmjnHKA0D7qkqRhYt/R978yc8XXe31n3
         kBxzTa4a9Q8O6XXRxKEw0HA3GIRL7nbGI5Pqh843Z/003qKq04ga+n6a8AARLQd6vtar
         nnU0or1+YVP6FgVocha9d6BYSYwJaA1sqbTp33KEhNezefxaG5zhIQAvmquL/df7/XPJ
         TNRos8HV7GhFCL1sI6WZMaWGmRo+q5ODdQSk2rkVZpd58wIol5qmkf8V6vQ+Euquf7Ib
         J28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=04YV4222yTbQVoaNkjtoFrmBfJ73jHzJG/awNg4EaWI=;
        b=ZK8Oo2Zf8IoWPIVxuAGuvnbxnWbigf5rVAVN8WnnUo9SLk4RBN2v6rEyAlevL1G/ze
         nb+kndxJCQX5/A5P71kzCg1CNUCrS36fThdvlUeR6L3mQ5A6rDu5oloeRrOx0J7DDnWN
         g+M5qm9ACEpWJSWI+68P5XSRR07POS4pVn61FyrDZbswmMF8WK8mKVTJfP7mCy3bi5T/
         Sum/5Cu2BJNCgKHBH385ttGj3QL+ztb0K22P8yv9SJxABxzikYxhVj8sXjPh5F+lzNs/
         Ebg1qAEwanB+KuOGRGGdq/EnsInGbHOy92J+dV/X9kIyicQW99e0K3GvKMjbWy/Jlc48
         +uOg==
X-Gm-Message-State: APjAAAW4cm/iNX9Npv3YCQdrBkkv5mKRH7Yjv73GcwO/hT8uZRHRj+Yt
        F2rqyzD9Ug9aurRg6t8/8lCRvQ==
X-Google-Smtp-Source: APXvYqzjE27Gg02/YlB9NekL0Cxe6H7ZZEq8eqq8VORWjDi9njYAJ+CGvuJso74VxB3+WTAYE1fXVQ==
X-Received: by 2002:aed:3ed5:: with SMTP id o21mr94179519qtf.369.1560802402527;
        Mon, 17 Jun 2019 13:13:22 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([100.100.175.19])
        by smtp.gmail.com with ESMTPSA id r36sm7071563qte.71.2019.06.17.13.13.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 13:13:22 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH 05/13] drm/msm/dsi_pll_10nm: Remove impossible check
Date:   Mon, 17 Jun 2019 16:12:50 -0400
Message-Id: <20190617201301.133275-2-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190617201301.133275-1-sean@poorly.run>
References: <20190617200405.131843-1-sean@poorly.run>
 <20190617201301.133275-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

While I'm in here, cut this out, pdev can't be NULL

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
index 618b49838293..8f6100db90ed 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
@@ -818,9 +818,6 @@ struct msm_dsi_pll *msm_dsi_pll_10nm_init(struct platform_device *pdev, int id)
 	struct msm_dsi_pll *pll;
 	int ret;
 
-	if (!pdev)
-		return ERR_PTR(-ENODEV);
-
 	pll_10nm = devm_kzalloc(&pdev->dev, sizeof(*pll_10nm), GFP_KERNEL);
 	if (!pll_10nm)
 		return ERR_PTR(-ENOMEM);
-- 
Sean Paul, Software Engineer, Google / Chromium OS

