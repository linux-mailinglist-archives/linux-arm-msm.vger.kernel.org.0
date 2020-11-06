Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 054BE2A8D0F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 03:37:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbgKFChK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Nov 2020 21:37:10 -0500
Received: from m176115.mail.qiye.163.com ([59.111.176.115]:53284 "EHLO
        m176115.mail.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbgKFChK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Nov 2020 21:37:10 -0500
X-Greylist: delayed 339 seconds by postgrey-1.27 at vger.kernel.org; Thu, 05 Nov 2020 21:37:09 EST
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.231])
        by m176115.mail.qiye.163.com (Hmail) with ESMTPA id 2AC8D666B20;
        Fri,  6 Nov 2020 10:31:27 +0800 (CST)
From:   Wang Qing <wangqing@vivo.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc:     Wang Qing <wangqing@vivo.com>
Subject: [PATCH] drm: Use IS_ERR() instead of null pointer check
Date:   Fri,  6 Nov 2020 10:31:19 +0800
Message-Id: <1604629881-557-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZGk9CHkNOH01NTExPVkpNS09NSUJDQ0xCQkxVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MTY6FRw6KT8qQh0BSyweAxgT
        FkkaCiFVSlVKTUtPTUlCQ0NDT0pMVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
        SU5KVUxPVUlISllXWQgBWUFJSk1MNwY+
X-HM-Tid: 0a759b64fb769373kuws2ac8d666b20
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

a6xx_gmu_get_mmio() never return null in case of error, but ERR_PTR(),
so we should use IS_ERR() instead of null pointer check

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 491fee4..8c81a89
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -492,7 +492,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	void __iomem *seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
 	uint32_t pdc_address_offset;
 
-	if (!pdcptr || !seqptr)
+	if (IS_ERR(pdcptr) || IS_ERR(seqptr))
 		goto err;
 
 	if (adreno_is_a618(adreno_gpu) || adreno_is_a640(adreno_gpu))
-- 
2.7.4

