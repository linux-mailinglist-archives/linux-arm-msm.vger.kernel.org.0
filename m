Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED000CED96
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2019 22:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728212AbfJGUfj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Oct 2019 16:35:39 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45957 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728187AbfJGUfi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Oct 2019 16:35:38 -0400
Received: by mail-pf1-f196.google.com with SMTP id y72so9349638pfb.12;
        Mon, 07 Oct 2019 13:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CqfvJ5pvQPXk0BHnC/qiO7SxY725BiWlCHyn+q4BOxc=;
        b=ToO/RKWqkLaXMfa+snaXo9WKFKvpYC1NfRgs4c/h85/8LQmRMMP7WIwrafm0v2mEXK
         pv6Qb21fzchRVOgFzQWuwXbldwIZE37+0mbjGol0bwP+Wb8wdWeyXV4B/GFCX4jH+GMA
         P9MY0XNkRzbAzkgZuE0LWDERaLivykyGf+D8y+f28XzdibEKlDT2V6gJkJMtw+JCKSCR
         nzhUFw4nmOEx2eA6FUw6kwpABWh6mP01CuhPBkQ7rcpozRZSG4FvxYqOYDkl8PMK7Lr9
         2PM/Ngfkzmw2nqzTIS0uyJhb+Bc2C/8XB9wnu3CRu/Wtc9xdsfI6aVSgwVdVWQn8/F/i
         UDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CqfvJ5pvQPXk0BHnC/qiO7SxY725BiWlCHyn+q4BOxc=;
        b=dOwlSrZ7+o7CxsxvWH26rsM3eiwa7TTg/q6Q1GWdHYROs+qIzf1+pi770ukyMOKQPl
         SLDgtgpHA+zMGoZaITUZYvQkqBvTbtftopIlx5qR53GYgUCg7OY9jyYkC6VTclUZzxtO
         W4GKhjElSrncJbtq+pkeYgO0DzukpahHWAJ1sZplbGMKzEc3qEXy2BIU2qXA1ku1kgOy
         L5WbGm5Y464mcnbZVYZgf7aJzYOU64Z1MSJJWwL+f0mABNunrV4tZ4sEqnzQo5OLIlvh
         7V8An8dzj5maD5x0Dy48wfk1UjMmfnkzf50KznWzzcyJu+9WJXwd643XYzhlEJ8s2x9W
         qT2g==
X-Gm-Message-State: APjAAAUNd6W5G2BHONt7d5nsWCxVaLmn/1NLuMrDsJKXd8JJaA3BoCOD
        DxOTbz0CFRD3IgmGQ/OxNSc=
X-Google-Smtp-Source: APXvYqwdvdnGsnyePeqeHBTBNU74U6yfa020DAsY08IaRi36nJv8u4329HayFHYz+95BFWYxqkzUwA==
X-Received: by 2002:a63:f957:: with SMTP id q23mr170715pgk.81.1570480538059;
        Mon, 07 Oct 2019 13:35:38 -0700 (PDT)
Received: from localhost ([100.118.89.196])
        by smtp.gmail.com with ESMTPSA id q20sm20502851pfl.79.2019.10.07.13.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 13:35:37 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm: always dump buffer base/size
Date:   Mon,  7 Oct 2019 13:31:08 -0700
Message-Id: <20191007203108.18667-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191007203108.18667-1-robdclark@gmail.com>
References: <20191007203108.18667-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Even if we are not dumping the buffer's contents, it is useful to log
their base address and size.  This makes it easier to see when different
gpu pointers point to a single buffer, for example higher mipmap levels
of a single texture.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_rd.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index f8f654301def..0896419ed95d 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -295,7 +295,7 @@ void msm_rd_debugfs_cleanup(struct msm_drm_private *priv)
 
 static void snapshot_buf(struct msm_rd_state *rd,
 		struct msm_gem_submit *submit, int idx,
-		uint64_t iova, uint32_t size)
+		uint64_t iova, uint32_t size, bool full)
 {
 	struct msm_gem_object *obj = submit->bos[idx].obj;
 	unsigned offset = 0;
@@ -315,6 +315,9 @@ static void snapshot_buf(struct msm_rd_state *rd,
 	rd_write_section(rd, RD_GPUADDR,
 			(uint32_t[3]){ iova, size, iova >> 32 }, 12);
 
+	if (!full)
+		return;
+
 	/* But only dump the contents of buffers marked READ */
 	if (!(submit->bos[idx].flags & MSM_SUBMIT_BO_READ))
 		return;
@@ -378,8 +381,7 @@ void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 	rd_write_section(rd, RD_CMD, msg, ALIGN(n, 4));
 
 	for (i = 0; i < submit->nr_bos; i++)
-		if (should_dump(submit, i))
-			snapshot_buf(rd, submit, i, 0, 0);
+		snapshot_buf(rd, submit, i, 0, 0, should_dump(submit, i));
 
 	for (i = 0; i < submit->nr_cmds; i++) {
 		uint32_t szd  = submit->cmd[i].size; /* in dwords */
@@ -387,7 +389,7 @@ void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 		/* snapshot cmdstream bo's (if we haven't already): */
 		if (!should_dump(submit, i)) {
 			snapshot_buf(rd, submit, submit->cmd[i].idx,
-					submit->cmd[i].iova, szd * 4);
+					submit->cmd[i].iova, szd * 4, true);
 		}
 	}
 
-- 
2.21.0

