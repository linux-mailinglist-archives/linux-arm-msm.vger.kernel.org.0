Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEFD05C222
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2019 19:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728300AbfGARlZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jul 2019 13:41:25 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46441 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727130AbfGARlY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jul 2019 13:41:24 -0400
Received: by mail-pl1-f195.google.com with SMTP id e5so7681574pls.13;
        Mon, 01 Jul 2019 10:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=qfHKa8BqHMDnuFbtDUNFkRDEdtrHApiPbbm6bpwlG/o=;
        b=RSKsvOp5BZsE7wrDhSLHlO1ODKoS6O6Lzkil/k/T3EZ/DWonCVjfd1ALSgqEOk4kYV
         K4rl5RR2zsO0GC95uXYX4vXzZ7w2+Dl9MIcPP4BOXTpWXoZY0gcxsoG9zjlriucRe7Wf
         /BnPIarTgdRQLcnaJ7RakOLhBcV36Q/6INxvmvUUIKVNsuKWfE1fCjGsEOwf+jpcNJET
         rxNUaMShvRv2XJyyd/ibb6N9U+sLPI9oAg9TZClEvnqi/NyPbE08JgSEN8HoJh6OtEvW
         ajeZ+5Tyk6AQrmw7YcFqprNbCGBwzUNW/lUtvwaOpqK/7BGjZjz2tlMHgry9qMWVtAwW
         bU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=qfHKa8BqHMDnuFbtDUNFkRDEdtrHApiPbbm6bpwlG/o=;
        b=TJEZ/WZrj3VNQhHh5uzJh9trrJX/xr7FmhbEA71LrIxGJ6euALE4MhAWn3vKuhX03x
         Hb8/k/UjWwR5a19gBJKWph7anpH+ks1CXAqGhmMMKOQLXgqkSMpBjrIPvv08cISrbzdk
         CamlegasqFarrKLPNdKIwBTu6eNVdLdj6jpUlUDdvzvw2FMzvL1KsLA8KrV9JAvlB+rg
         B9Hs0cQ9bU49laeOrl55T3q+j9g/WdRh/ZcGW2RaBYNDBs9NeEYxvyfPaI//h9Ak/0gJ
         vlNsrgoMq7UjKlD3TCGh+5H+TSNgeAvArNb45sdZhmsipP0q7SUuLsYiRrW1ce78/f+J
         q1aw==
X-Gm-Message-State: APjAAAUvDFyG+eD6JeVPCYXhCxOei4Hb35P1SHbC5l3z8ryoyAbneVQg
        HzEz815P6Sb+/RMUiMDJlXI=
X-Google-Smtp-Source: APXvYqz8f+1e+Yn1edBsyRWCJm32Uaij3RqX4JbIUWQYMT+4dYhjokw9dsiuZuKXqpw2baJNUbv65A==
X-Received: by 2002:a17:902:6ac6:: with SMTP id i6mr30312230plt.233.1562002884230;
        Mon, 01 Jul 2019 10:41:24 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id s17sm166650pjp.7.2019.07.01.10.41.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 10:41:23 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] drm/msm/mdp5: Use eariler mixers when possible
Date:   Mon,  1 Jul 2019 10:41:20 -0700
Message-Id: <20190701174120.15551-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When assigning a mixer, we will iterate through the entire list looking for
a suitable match.  This results in selecting the last match.  We should
stop at the first match, since lower numbered mixers will typically have
more capabilities, and are likely to be what the bootloader used, if we
are looking to reuse the bootloader config in future.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c
index 954db683ae44..1638042ad974 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c
@@ -96,6 +96,17 @@ int mdp5_mixer_assign(struct drm_atomic_state *s, struct drm_crtc *crtc,
 		 */
 		if (!(*mixer) || cur->caps & MDP_LM_CAP_PAIR)
 			*mixer = cur;
+
+		/*
+		 * We have everything we could want, exit early.
+		 * We have a valid mixer, that mixer pairs with another if we
+		 * need that ability in future, and we have a right mixer if
+		 * needed.
+		 * Later LMs could be less optimal
+		 */
+		if (*mixer && (*mixer)->caps & MDP_LM_CAP_PAIR &&
+		    ((r_mixer && *r_mixer) || !r_mixer))
+			break;
 	}
 
 	if (!(*mixer))
-- 
2.17.1

