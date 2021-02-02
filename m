Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 186A130BE0D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Feb 2021 13:19:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbhBBMSc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Feb 2021 07:18:32 -0500
Received: from mail-m17640.qiye.163.com ([59.111.176.40]:40834 "EHLO
        mail-m17640.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbhBBMR5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Feb 2021 07:17:57 -0500
X-Greylist: delayed 665 seconds by postgrey-1.27 at vger.kernel.org; Tue, 02 Feb 2021 07:17:56 EST
Received: from ubuntu.localdomain (unknown [157.0.31.124])
        by mail-m17640.qiye.163.com (Hmail) with ESMTPA id 921F1540084;
        Tue,  2 Feb 2021 20:05:58 +0800 (CST)
From:   Bernard Zhao <bernard@vivo.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Bernard Zhao <bernard@vivo.com>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc:     opensource.kernel@vivo.com
Subject: [PATCH] gpu/drm/msm: remove redundant when devm_kzalloc failed
Date:   Tue,  2 Feb 2021 04:05:49 -0800
Message-Id: <20210202120552.14744-1-bernard@vivo.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZT04YSUxLGU1CSU5CVkpNSklJTUxOTkNCS0xVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hNSlVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ORg6LQw5IT8VOTYKFDoYEjER
        QhAKCRhVSlVKTUpJSU1MTk5CSUJMVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
        S1VISlVKSU9ZV1kIAVlBSUhDQjcG
X-HM-Tid: 0a7762a297bfd995kuws921f1540084
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Line 1826 pr_err is redundant because memory alloc already
prints an error when failed.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index ab281cba0f08..246d3f06f3ef 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1826,8 +1826,6 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 
 	msm_host = devm_kzalloc(&pdev->dev, sizeof(*msm_host), GFP_KERNEL);
 	if (!msm_host) {
-		pr_err("%s: FAILED: cannot alloc dsi host\n",
-		       __func__);
 		ret = -ENOMEM;
 		goto fail;
 	}
-- 
2.29.0

