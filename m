Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D18EEB76
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2019 22:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729299AbfD2UP4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Apr 2019 16:15:56 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42154 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729252AbfD2UP4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Apr 2019 16:15:56 -0400
Received: by mail-wr1-f67.google.com with SMTP id l2so2221507wrb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2019 13:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vCxinVg6A2SbZ9ILJWHL9gGNmahRdcgdd1xrKNk0P5I=;
        b=l1Fo0n6uuK81vsv4KUn6MAwronVLRTlTPD56VCaSdgU8NGFkVEOa609qnKppM/uCO2
         HRgtrD83lc/5DFL2xOjq3oahOEW1qqD3ehf1gcdxcWCNoazbEXEAR2cf5vf3SeNvIXu8
         xGW9OWHJbo1YhQVyG7oYR8xqAkT/BUsxIeWqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vCxinVg6A2SbZ9ILJWHL9gGNmahRdcgdd1xrKNk0P5I=;
        b=OtJAd2U/O+2gSoUxi16upwdD/Sz4NIkedEc4UeBiWDYCRNJO/367wVgKLpz1URNRKi
         E7kzyO8zBhVwTiArHByKKC4QyxhqSiZ9Va5ImCc10lf0qzdEy+J0MeZkoWUwjFFag+8d
         j9PB4+BVsCoSlzgeM17rq60ZGaeZP0Q1RYfvTPJ33n7r3l0aZ5iudpI8c8omKie15zRN
         fSdd21NVPltmS6+u98hRWUYy0MlBqkoDQ6wiplLwdivAxW8A/l5/k0moDV7w1tA0uS4D
         KyifmezZ8cCni+p6mzoaWJyW9rc5uSatgizA5IpgJER0F9BJvIU9h3nO+/lp3uPGauP/
         neNA==
X-Gm-Message-State: APjAAAVQ40AGE0SNmHpk80GD/nJHjxdXQp0g16qRGM1qWsCQSe1LmSIW
        7oXKuOGKTJaAe6UL/D7qDXmhr2tesVs=
X-Google-Smtp-Source: APXvYqw63jnClhdJcOMmVCX4Q14I5kSfu+qjnhDfPAb2p9j2fIrWdfwp6P5Jp2R5xGLI7EjMZ+WPsA==
X-Received: by 2002:a05:6000:12cb:: with SMTP id l11mr703764wrx.89.1556568954590;
        Mon, 29 Apr 2019 13:15:54 -0700 (PDT)
Received: from localhost.localdomain (ip-93-97.sn2.clouditalia.com. [83.211.93.97])
        by smtp.gmail.com with ESMTPSA id k6sm22864019wrd.20.2019.04.29.13.15.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 29 Apr 2019 13:15:53 -0700 (PDT)
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Andrea Parri <andrea.parri@amarulasolutions.com>,
        stable@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 1/5] drm/msm: Fix improper uses of smp_mb__{before,after}_atomic()
Date:   Mon, 29 Apr 2019 22:14:57 +0200
Message-Id: <1556568902-12464-2-git-send-email-andrea.parri@amarulasolutions.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556568902-12464-1-git-send-email-andrea.parri@amarulasolutions.com>
References: <1556568902-12464-1-git-send-email-andrea.parri@amarulasolutions.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These barriers only apply to the read-modify-write operations; in
particular, they do not apply to the atomic_set() primitive.

Replace the barriers with smp_mb()s.

Fixes: b1fc2839d2f92 ("drm/msm: Implement preemption for A5XX targets")
Cc: stable@vger.kernel.org
Reported-by: "Paul E. McKenney" <paulmck@linux.ibm.com>
Reported-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Andrea Parri <andrea.parri@amarulasolutions.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Jordan Crouse <jcrouse@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
index 3d62310a535fb..ee0820ee0c664 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
@@ -39,10 +39,10 @@ static inline void set_preempt_state(struct a5xx_gpu *gpu,
 	 * preemption or in the interrupt handler so barriers are needed
 	 * before...
 	 */
-	smp_mb__before_atomic();
+	smp_mb();
 	atomic_set(&gpu->preempt_state, new);
 	/* ... and after*/
-	smp_mb__after_atomic();
+	smp_mb();
 }
 
 /* Write the most recent wptr for the given ring into the hardware */
-- 
2.7.4

