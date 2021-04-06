Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 422E635555D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 15:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237850AbhDFNjt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 09:39:49 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33122 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238827AbhDFNjs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 09:39:48 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lTlvf-0003iY-Hg; Tue, 06 Apr 2021 13:39:39 +0000
From:   Colin King <colin.king@canonical.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/msm: Fix spelling mistake "Purgable" -> "Purgeable"
Date:   Tue,  6 Apr 2021 14:39:39 +0100
Message-Id: <20210406133939.425987-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in debugfs gem stats. Fix it. Also
re-align output to cater for the extra 1 character.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index f146d9c5ba9c..4e2e0a93d17d 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -979,13 +979,13 @@ void msm_gem_describe_objects(struct list_head *list, struct seq_file *m)
 		msm_gem_describe(obj, m, &stats);
 	}
 
-	seq_printf(m, "Total:    %4d objects, %9zu bytes\n",
+	seq_printf(m, "Total:     %4d objects, %9zu bytes\n",
 			stats.all.count, stats.all.size);
-	seq_printf(m, "Active:   %4d objects, %9zu bytes\n",
+	seq_printf(m, "Active:    %4d objects, %9zu bytes\n",
 			stats.active.count, stats.active.size);
-	seq_printf(m, "Purgable: %4d objects, %9zu bytes\n",
+	seq_printf(m, "Purgeable: %4d objects, %9zu bytes\n",
 			stats.purgable.count, stats.purgable.size);
-	seq_printf(m, "Purged:   %4d objects, %9zu bytes\n",
+	seq_printf(m, "Purged:    %4d objects, %9zu bytes\n",
 			stats.purged.count, stats.purged.size);
 }
 #endif
-- 
2.30.2

