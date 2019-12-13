Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C19E511EC3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2019 21:55:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbfLMUzR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Dec 2019 15:55:17 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:42775 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfLMUzQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Dec 2019 15:55:16 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MGQWr-1iVdkq2Ao9-00GmsB; Fri, 13 Dec 2019 21:54:57 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     y2038@lists.linaro.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Sam Ravnborg <sam@ravnborg.org>, Joe Perches <joe@perches.com>,
        "Kristian H. Kristensen" <hoegsberg@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 12/24] drm/msm: avoid using 'timespec'
Date:   Fri, 13 Dec 2019 21:53:40 +0100
Message-Id: <20191213205417.3871055-3-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191213204936.3643476-1-arnd@arndb.de>
References: <20191213204936.3643476-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:SMQNgPIVRwQmcTY5DRfiQVqW9b6fdavzYJig6CP6LZtweyjRbiD
 6mCGxP1rZR5pga+x9KqlX9c6PXDBBgTUGKDJ0BZKNHZin6AxQJIq0jYcnvNfnUsFc79qM/e
 q8qmecpfokP3hq7bAPt5LDfnxYTuvoKmrPS0nS2HU9pnuvh+0wbVT234k8D5E087sBGJcmP
 i4yEHD4KCli0umxh9A3ww==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DbQaztQtI+A=:gxrodGEeRggtiphssUm9Us
 Jq/wlDutot4qEvgTcu7kfZQQQ3iQeN6l/jwOUlHw1Ybnq3VPgMPcTl9strNMqMIzw9JBvSljD
 C2jPPtCwvmIl6PByLxcmzD+QyHErVxvkZOmoIegYpuQhUqJIzfhj3Kg6RZVgHW4bz1CqibKR6
 Ft+KVdpngmtt8UlvfyoTGNfYmprA9eW5mMVLEvqNmCPx0H24nj3frUkSFibwdnsTjWZZz63di
 tZABpibKZpy0u8d75dZczso0jUzTi7eQxK68axCwzreJDWLNLzMYomhhBrRb0z+C4Bh7wMREh
 IqmDvEY1RvYXwj0XALqnYz7FFUInslWTRCWa2S3qkZcg0DSj7/GN6q0MEx3pG4szda+yfMRmK
 J+8eQam1TInOwvydZdgspJK76t8NiIyLnWBR73tNZXBFkwWoljvI7oQwLHLMzuf7IjJQfvbod
 6/+GSDtKOqO9r1irukoe/vUnyVZuxagYtaHgrd/VK2u1ToWu05PY1fGxC+WOCC9dmpwvf4Smo
 Vje6psV+nHPjQ2LbyeSJYMu8+Vyrfb59oJPpTsfY/ssvaM4JnnlPfgIUn4jSfRDwYrToDgzQJ
 eNDAO7A/aC8WX3IrDLKrEb4NpEi6wEZO59Ax1mICG/9qQMRhieTT0sii3o27R8skBPFa0BThe
 S3nKTK699n9ObLvefDUa/onIL6mlTOLQ4MG/dwG5bPq1dlUl/NohuJ6Snj3AKNhp0g10qPDEV
 RQLRhD98PZpi9F6xvPJMoiLcmvHmOz8gK8ZSNJ7ApEvDJzQ6poZfwqLwx8qK+dGt8k0lrFdqS
 HZ9OGCvIK91CYt69M0Soyrm7cJpKtZhVe4DJdxYaOiRvfLeff/cHHaLOcnwvnj2Q9MNLlsCJS
 hyaeD68zOSQ+8Ex8yWDw==
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The timespec structure and associated interfaces are deprecated and will
be removed in the future because of the y2038 overflow.

The use of ktime_to_timespec() in timeout_to_jiffies() does not
suffer from that overflow, but is easy to avoid by just converting
the ktime_t into jiffies directly.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/msm/msm_drv.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 71547e756e29..740bf7c70d8f 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -454,8 +454,7 @@ static inline unsigned long timeout_to_jiffies(const ktime_t *timeout)
 		remaining_jiffies = 0;
 	} else {
 		ktime_t rem = ktime_sub(*timeout, now);
-		struct timespec ts = ktime_to_timespec(rem);
-		remaining_jiffies = timespec_to_jiffies(&ts);
+		remaining_jiffies = ktime_divns(rem, NSEC_PER_SEC / HZ);
 	}
 
 	return remaining_jiffies;
-- 
2.20.0

