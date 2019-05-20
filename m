Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D16DE23E6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2019 19:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390374AbfETRYh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 May 2019 13:24:37 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39531 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390545AbfETRYh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 May 2019 13:24:37 -0400
Received: by mail-wm1-f65.google.com with SMTP id n25so149375wmk.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2019 10:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=37CxHYKlFVVAIEnj21tdjvUOrJCuiyhrkjA75AgmUDE=;
        b=QXPL+94F09z4z+ao64JQeUt9XFjjtv8g/N09kNE3fTGLUbp/qYLl1g57/r3St9bLbM
         8ytkzOh0Wuy8BN9SlXxU9XZyfWLOan/bGagJczwA0VwsDnRdfZC+BvBUhMUoa7OVVnGu
         Xm4cRqIxYjsIiLDMFpj6u8/02xysp+dxL6e8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=37CxHYKlFVVAIEnj21tdjvUOrJCuiyhrkjA75AgmUDE=;
        b=RA5KOTadfvuOOn3NGYIkYdmL+U8c2AzSwwzzS7J7q/fAyMh8zsOQ+1cGeAxbvMLpEB
         5aJ48SyDM4FfeH2DMVMsiAhlWcA9W5BajdLh9wrDOX+8ycxOtKfdpzYLj59azTLfgeol
         TMpvCd1UmPS3f1s4LVaw8jZZhTAAdT6xRyh8OpINuqQeNPFUOutnucnjWcDsYny3xHSI
         tDH9nCNDsF1Qm6fcxM9vrsQr9+JyrwY3OwyLVIwPKOd9ylOTMbbQu52rKoYo0JgoZiAo
         /MjwkYxTwBQyhALummVkGadciSaqj2ENHZ1bL2AhZ75yYNhwyAD0jVP1jXTfJqzkgaHZ
         bpFA==
X-Gm-Message-State: APjAAAWQHS8OVUvEMGRiVzYR7BYBUf/yhh2rsS2Rg9o0KEvZdDqk84aO
        DqMPy9zEk/XWGU8A7yRzbjpI0g==
X-Google-Smtp-Source: APXvYqxV/0ooJTzXznpbzssyf0Zwt44GQp/pzzVYbD8W+Rh1jTkMM3EzUOJLQxOAZDv/ikTEgktB8w==
X-Received: by 2002:a1c:9dc7:: with SMTP id g190mr146017wme.121.1558373075294;
        Mon, 20 May 2019 10:24:35 -0700 (PDT)
Received: from localhost.localdomain ([91.253.179.221])
        by smtp.gmail.com with ESMTPSA id b12sm180021wmg.27.2019.05.20.10.24.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 20 May 2019 10:24:34 -0700 (PDT)
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Andrea Parri <andrea.parri@amarulasolutions.com>,
        stable@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 1/4] drm/msm: Fix improper uses of smp_mb__{before,after}_atomic()
Date:   Mon, 20 May 2019 19:23:55 +0200
Message-Id: <1558373038-5611-2-git-send-email-andrea.parri@amarulasolutions.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558373038-5611-1-git-send-email-andrea.parri@amarulasolutions.com>
References: <1558373038-5611-1-git-send-email-andrea.parri@amarulasolutions.com>
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
Cc: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: Peter Zijlstra <peterz@infradead.org>
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

