Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 359592AA248
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Nov 2020 04:19:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727142AbgKGDTW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Nov 2020 22:19:22 -0500
Received: from m176115.mail.qiye.163.com ([59.111.176.115]:32596 "EHLO
        m176115.mail.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727298AbgKGDTV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Nov 2020 22:19:21 -0500
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.231])
        by m176115.mail.qiye.163.com (Hmail) with ESMTPA id 3BA786661BF;
        Sat,  7 Nov 2020 11:19:16 +0800 (CST)
From:   Wang Qing <wangqing@vivo.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc:     Wang Qing <wangqing@vivo.com>
Subject: [V2] drm: msm: adreno: use IS_ERR() instead of null pointer check
Date:   Sat,  7 Nov 2020 11:19:09 +0800
Message-Id: <1604719151-28491-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZSR8YSx4YSEsZTB4YVkpNS09MSkJKTk1MTExVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MBA6Iyo4Nz8aARwhGg5WD1E#
        NCpPC0NVSlVKTUtPTEpCSk5MSUpIVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
        SU5KVUxPVUlISllXWQgBWUFJT0xONwY+
X-HM-Tid: 0a75a0b71db99373kuws3ba786661bf
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

a6xx_gmu_get_mmio() never return null in case of error, but ERR_PTR(), so 
we should use IS_ERR() instead of null pointer check and IS_ERR_OR_NULL().

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 491fee4..82420f7
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -492,7 +492,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	void __iomem *seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
 	uint32_t pdc_address_offset;
 
-	if (!pdcptr || !seqptr)
+	if (IS_ERR(pdcptr) || IS_ERR(seqptr))
 		goto err;
 
 	if (adreno_is_a618(adreno_gpu) || adreno_is_a640(adreno_gpu))
@@ -580,9 +580,9 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	wmb();
 
 err:
-	if (!IS_ERR_OR_NULL(pdcptr))
+	if (!IS_ERR(pdcptr))
 		iounmap(pdcptr);
-	if (!IS_ERR_OR_NULL(seqptr))
+	if (!IS_ERR(seqptr))
 		iounmap(seqptr);
 }
 
-- 
2.7.4

