Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD607B68E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2019 19:19:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732114AbfIRRT0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Sep 2019 13:19:26 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36195 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732110AbfIRRTY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Sep 2019 13:19:24 -0400
Received: by mail-pf1-f194.google.com with SMTP id y22so426265pfr.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Sep 2019 10:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VwSAewYHioEBjS31iqIfRjVrZyDonRdWcj1Y+TfsqH4=;
        b=rO9i/cqLekYgyKdKCnFYjAL4R/QkPCECSyUyb7g2A+JKQKpKGHGHs2JQa91AMbG/2w
         1lED6OUbgkoFnKNsS8sAuVKoGcJ/HX7iMbXflFVJP+G0Eoh2jir2EAjBir/87kMiVIbH
         TGN86ho4VviITmkJju5fHnGtLVyX20eLopp2OR9zx/XrG+lbFUgF9ho8nWFvUVmMOosg
         ztCiiJk0oz5dDSW0jP1/X7SxOt1poyhGRX1OYbu824rVveyFMp8Afqmdm2rA7sVRW6qe
         yIIF8ArmWEbZl7z3D7gYV6yBb+uq9Yj6DuuVk/BKO+JoxTbwTZEfgolB3XIWu87dAOFJ
         5AUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VwSAewYHioEBjS31iqIfRjVrZyDonRdWcj1Y+TfsqH4=;
        b=IWoQAkG8gdw3faBNO0v4uVMb9rY5Q9Z1G3QKs+id3C/EJDLnHJakdGSv0y4bVYWT73
         /DinCKacinTtp1rWpr8DArY6Wskz2wJkD8khP+nf3XYe/QIHkUMegQV1fc+vwlKO57n7
         7ewImVMFhwM+/EslzjzUO+nr2+iyaGMSe26OgfvXw+MMYuYpI48Oz2dIa2QYIvLCp2Q5
         lOd6jdVXwyId+ypGS/1+KrjPmlyyv6yfIjyIljlPmiYs5hl0RUFYxLl67l4UPOSQrf32
         KmNFMI4cqD3iya5R+G11a2yPNErxJY70xiwSakvMwrX2Q1L5HBWUURR9axn8apnS46rX
         CiQg==
X-Gm-Message-State: APjAAAWKGnCBH5BhvuEuXa5jO57+7nxySp8ThOJJIs2BVfZCac/sUe1v
        j0vMlzLp0Rs8x170BVUIL6Laog==
X-Google-Smtp-Source: APXvYqz6KBiLBnvTbiv1tlhJ561p18GEHMN8vVjD8bUsFTROEBscCpnd0MazHXczVzILrhpz3xg50g==
X-Received: by 2002:a65:6557:: with SMTP id a23mr4976164pgw.439.1568827163712;
        Wed, 18 Sep 2019 10:19:23 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y4sm2614981pjn.19.2019.09.18.10.19.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Sep 2019 10:19:23 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH 3/6] rpmsg: glink: Put an extra reference during cleanup
Date:   Wed, 18 Sep 2019 10:19:13 -0700
Message-Id: <20190918171916.4039-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190918171916.4039-1-bjorn.andersson@linaro.org>
References: <20190918171916.4039-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Chris Lew <clew@codeaurora.org>

In a remote processor crash scenario, there is no guarantee the remote
processor sent close requests before it went into a bad state. Remove
the reference that is normally handled by the close command in the
so channel resources can be released.

Fixes: b4f8e52b89f6 ("rpmsg: Introduce Qualcomm RPM glink driver")
Cc: stable@vger.kernel.org
Signed-off-by: Chris Lew <clew@codeaurora.org>
Reported-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/rpmsg/qcom_glink_native.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 72ed671f5dcd..21fd2ae5f7f1 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1641,6 +1641,10 @@ void qcom_glink_native_remove(struct qcom_glink *glink)
 	idr_for_each_entry(&glink->lcids, channel, cid)
 		kref_put(&channel->refcount, qcom_glink_channel_release);
 
+	/* Release any defunct local channels, waiting for close-req */
+	idr_for_each_entry(&glink->rcids, channel, cid)
+		kref_put(&channel->refcount, qcom_glink_channel_release);
+
 	idr_destroy(&glink->lcids);
 	idr_destroy(&glink->rcids);
 	spin_unlock_irqrestore(&glink->idr_lock, flags);
-- 
2.18.0

