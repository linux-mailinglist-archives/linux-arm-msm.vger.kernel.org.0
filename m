Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E50651BFE5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2019 01:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbfEMXlU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 May 2019 19:41:20 -0400
Received: from onstation.org ([52.200.56.107]:41264 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726621AbfEMXlU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 May 2019 19:41:20 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id CB82E45029;
        Mon, 13 May 2019 23:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1557790880;
        bh=AgbXz/pOeFm7SB3WM30G8MU/5/skIhEBOhYSZdjZNCs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bXb+LlLhIA1NFT3uLoziGtEwWeRt0BRj3A+aZb9cRHInlFyoGZNvSOLw+TzdTOXIE
         FKgAvAeC1BS6j9LWu5jYZ/TYFA7Vnlwa7rIZXPY4WslOGA9zwDzUor+SJbpTUK1ToS
         rqM8Fc5XQa13Q2o9hXLA06WvOlvh6Ce9kGLquWZo=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run
Cc:     bjorn.andersson@linaro.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        airlied@linux.ie, daniel@ffwll.ch, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, jonathan@marek.ca, robh@kernel.org
Subject: [PATCH 2/2] drm/msm: correct attempted NULL pointer dereference in debugfs
Date:   Mon, 13 May 2019 19:41:05 -0400
Message-Id: <20190513234105.7531-2-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190513234105.7531-1-masneyb@onstation.org>
References: <20190513234105.7531-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

msm_gem_describe() would attempt to dereference a NULL pointer via the
address space pointer when no IOMMU is present. Correct this by adding
the appropriate check.

Signed-off-by: Brian Masney <masneyb@onstation.org>
Fixes: 575f0485508b ("drm/msm: Clean up and enhance the output of the 'gem' debugfs node")
---
 drivers/gpu/drm/msm/msm_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 31d5a744d84f..35f55dd25994 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -803,7 +803,8 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 		seq_puts(m, "      vmas:");
 
 		list_for_each_entry(vma, &msm_obj->vmas, list)
-			seq_printf(m, " [%s: %08llx,%s,inuse=%d]", vma->aspace->name,
+			seq_printf(m, " [%s: %08llx,%s,inuse=%d]",
+				vma->aspace != NULL ? vma->aspace->name : NULL,
 				vma->iova, vma->mapped ? "mapped" : "unmapped",
 				vma->inuse);
 
-- 
2.20.1

