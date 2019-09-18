Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0280B6D11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2019 21:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730983AbfIRT5b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Sep 2019 15:57:31 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:48215 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732189AbfIRT5b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Sep 2019 15:57:31 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MsJXG-1huedC0a0w-00toR3; Wed, 18 Sep 2019 21:57:24 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Sean Paul <seanpaul@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm: include linux/sched/task.h
Date:   Wed, 18 Sep 2019 21:57:07 +0200
Message-Id: <20190918195722.2149227-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Ej872YyO7HXEU8CNXRPtHdXeVnbz9zTySP1CA1k40z1LeTXe3mj
 agyhpv74Sl7wE8DAVanhlat0KMZliMe8R8ywGa67hfQhJYGlR+KRVMvUxU/wHEUWlUxmbnd
 9LiD638HHbaqYm7Qb6ls3EkcaK//pUD4Q7Dq8hcNQ+MCYIoyM8I2gxs7mCOKKzlOfD8Omq3
 TMgBP/SonrzP8n2XsRq7Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:e7/P3QW3qJ0=:4PgFN+vYMMVxcGiM7azlrg
 HmWI/oIY0J7/xNdK8ONeJ9EYEXiDVKb2hl/JoBQZe5rboU26hT9Xp/ALIBW3W/I3YY63G3Ze8
 ZCYiGaV27/3R1WZHzprA0w1/WwxED4IcNZbnyxibmi2n8wk6/6P3lSeZk1T/owvKUePSUGy3T
 87rvpUy1PQIM+Zft6TpQHdUHU5doc7UXOTEXr4vokcYRskxEJOTJR60kq57eFlLOWw2hIH1ej
 Zw3mOjS0S7fjufGM4aF8CwVzxwQj03NMN6SQBCjcFIc9Mo4JU73flTCp36cqoTRg5MZWnEwyA
 4i6kQ3jWReHHvvxa7jsX4M7NToo+gTpRxGO5uYohsS+L5JUmFdyji2MMxiQIiLfTpYl83nmcE
 fqJTvYuYD2coj1h+iZY6iSYejtHX52aihBUZqCzkr8fX+ZWTIz4mGbH3zPixdCr2daAf6hKcj
 iN/t9Sco/HQ5T7IDAYaADkrMKogyCZ/6xGsW8J8jdNJcjC9pOXPOBMII/p/BPA6wihlomN9Ak
 SItRQ7pmDGv3+SHitfUK+cU1Vcc9ORtLmt0VWwI+orvw8oqSIcJs+etB63o9eiqhz/FPC19vP
 Z1klxsnRTmUto/4Z+BF0keJpPtSjUO6V86kc1xEtiBnH+vMWZZv4AWg9Ady+H6Ejy8XeDqI6L
 A5RA8zGdM16qBmkKsWGZGcsP1awNHBWBcw4UlqnNomzpgbI2c4DlTu2wFRFoGDGa18n9MccTg
 N37Sc6kShmA+Zjl3PhKVikXFDQ2amduC6eE+iXrLx0O7UY/LXNghESDaCmj9M35oxqnHlDCHW
 GVWTI4F0StjbEcK5dA+clzgvhoVyLq+Pvgm8MORS7FkwtJBD//rnC/bbTHvrNcE0MFPXkAgAo
 XV1BYLMMM0tkY7n4UWkQ==
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Without this header file, compile-testing may run into a missing
declaration:

drivers/gpu/drm/msm/msm_gpu.c:444:4: error: implicit declaration of function 'put_task_struct' [-Werror,-Wimplicit-function-declaration]

Fixes: 482f96324a4e ("drm/msm: Fix task dump in gpu recovery")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/msm/msm_gpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index a052364a5d74..edd45f434ccd 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -16,6 +16,7 @@
 #include <linux/pm_opp.h>
 #include <linux/devfreq.h>
 #include <linux/devcoredump.h>
+#include <linux/sched/task.h>
 
 /*
  * Power Management:
-- 
2.20.0

