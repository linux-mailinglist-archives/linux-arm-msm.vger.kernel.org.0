Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4104C5183D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2019 18:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729188AbfFXQUQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jun 2019 12:20:16 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:39387 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726622AbfFXQUQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jun 2019 12:20:16 -0400
Received: by mail-qk1-f196.google.com with SMTP id i125so10184697qkd.6;
        Mon, 24 Jun 2019 09:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F8G1ZU8aLmBB851d3XszgyNFlWq4phgeEtPxU6njY4Y=;
        b=gbt8OgtQzgv/jH0rf8KkXB0a5vX2itANSwBh6Ctlu/q6iJtAWGPd1Pqc5JYPCcbdPG
         ZHzNUK0dYLCS4na219eqKiIUa1NtAx0MqvC1FmBIFIZDQBdl5RPBfHB5VGA8s8GjUqPh
         +XB5Pgy4j2SMBcWiNQ011RuaJxwMYNcUWejXiqD+i/gsw+p4Mirz0Hgc8sK0ejLbqimb
         RF1OrUvx4RsQM85tLI0O+OrEu2M9PAxttIfI8PZPYDY/U9AhL+xRC7a9QN8Cxldl7aPO
         qNpWMHf/D8nHFrsYnSis6JMhcdg7o8yjaRTdJrkVl+YAn5af9MyBTv5OJt0x//Gd1/Z8
         hRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F8G1ZU8aLmBB851d3XszgyNFlWq4phgeEtPxU6njY4Y=;
        b=DHumLIZ0ZxRYJHcyn6tzlhDSiJ5IdP2IYCpi9uAm4UFsoJdMSgHG8HF/VXEw6Autwy
         8lRuAo0nf+WNFaSPa/jIu+CuuP5W7bI4+IwUNU89Jo76pcA1H4U3RoCmEOONxv46spTy
         A9MUI6AsEanl2SB/sz9AiZJ/UhQwitwyEzoibtTY1TyO2v/F1RMTL1QaA1B42ZBd+obC
         YofbI4b4TNYGrE7Z96pabajF32muGREFtGcbAgF0kf9CyANkhWrPbHx2Un438tn2x9aX
         MypBqnXsP+c56bn/7rhWjxMMzosQtKJh3ts2DIlfgLpBTbJWs9pYDqJSJllSwU92ns2p
         sVaA==
X-Gm-Message-State: APjAAAWRKwSj/4CmGmyy+y2BaifYXpX/GM5b+oJ+oLLrRMm7LJATcFQv
        ijtWofYWxrDTTIuW67+GIRQ=
X-Google-Smtp-Source: APXvYqzE2RTS/1lKwqd40dzMd8XsVBX00jpPN0aKk3Yc2XPJlwzdJ9osP0igg2X2h1+Wlvfr5M+wAg==
X-Received: by 2002:a37:7cf:: with SMTP id 198mr18037508qkh.450.1561393215159;
        Mon, 24 Jun 2019 09:20:15 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
        by smtp.gmail.com with ESMTPSA id r17sm5950946qtf.26.2019.06.24.09.20.14
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 24 Jun 2019 09:20:14 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/a3xx: remove TPL1 regs from snapshot
Date:   Mon, 24 Jun 2019 09:19:54 -0700
Message-Id: <20190624162008.21744-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

These regs are write-only, and the hw throws a hissy-fit (ie. reboots)
when we try to read them for GPU state snapshot, in response to a GPU
hang.  It is rather impolite when GPU recovery triggers an insta-
reboot, so lets remove the TPL1 registers from the snapshot.

Fixes: 7198e6b03155 drm/msm: add a3xx gpu support
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index c3b4bc6e4155..13078c4975ff 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -395,19 +395,17 @@ static const unsigned int a3xx_registers[] = {
 	0x2200, 0x2212, 0x2214, 0x2217, 0x221a, 0x221a, 0x2240, 0x227e,
 	0x2280, 0x228b, 0x22c0, 0x22c0, 0x22c4, 0x22ce, 0x22d0, 0x22d8,
 	0x22df, 0x22e6, 0x22e8, 0x22e9, 0x22ec, 0x22ec, 0x22f0, 0x22f7,
-	0x22ff, 0x22ff, 0x2340, 0x2343, 0x2348, 0x2349, 0x2350, 0x2356,
-	0x2360, 0x2360, 0x2440, 0x2440, 0x2444, 0x2444, 0x2448, 0x244d,
-	0x2468, 0x2469, 0x246c, 0x246d, 0x2470, 0x2470, 0x2472, 0x2472,
-	0x2474, 0x2475, 0x2479, 0x247a, 0x24c0, 0x24d3, 0x24e4, 0x24ef,
-	0x2500, 0x2509, 0x250c, 0x250c, 0x250e, 0x250e, 0x2510, 0x2511,
-	0x2514, 0x2515, 0x25e4, 0x25e4, 0x25ea, 0x25ea, 0x25ec, 0x25ed,
-	0x25f0, 0x25f0, 0x2600, 0x2612, 0x2614, 0x2617, 0x261a, 0x261a,
-	0x2640, 0x267e, 0x2680, 0x268b, 0x26c0, 0x26c0, 0x26c4, 0x26ce,
-	0x26d0, 0x26d8, 0x26df, 0x26e6, 0x26e8, 0x26e9, 0x26ec, 0x26ec,
-	0x26f0, 0x26f7, 0x26ff, 0x26ff, 0x2740, 0x2743, 0x2748, 0x2749,
-	0x2750, 0x2756, 0x2760, 0x2760, 0x300c, 0x300e, 0x301c, 0x301d,
-	0x302a, 0x302a, 0x302c, 0x302d, 0x3030, 0x3031, 0x3034, 0x3036,
-	0x303c, 0x303c, 0x305e, 0x305f,
+	0x22ff, 0x22ff, 0x2340, 0x2343, 0x2440, 0x2440, 0x2444, 0x2444,
+	0x2448, 0x244d, 0x2468, 0x2469, 0x246c, 0x246d, 0x2470, 0x2470,
+	0x2472, 0x2472, 0x2474, 0x2475, 0x2479, 0x247a, 0x24c0, 0x24d3,
+	0x24e4, 0x24ef, 0x2500, 0x2509, 0x250c, 0x250c, 0x250e, 0x250e,
+	0x2510, 0x2511, 0x2514, 0x2515, 0x25e4, 0x25e4, 0x25ea, 0x25ea,
+	0x25ec, 0x25ed, 0x25f0, 0x25f0, 0x2600, 0x2612, 0x2614, 0x2617,
+	0x261a, 0x261a, 0x2640, 0x267e, 0x2680, 0x268b, 0x26c0, 0x26c0,
+	0x26c4, 0x26ce, 0x26d0, 0x26d8, 0x26df, 0x26e6, 0x26e8, 0x26e9,
+	0x26ec, 0x26ec, 0x26f0, 0x26f7, 0x26ff, 0x26ff, 0x2740, 0x2743,
+	0x300c, 0x300e, 0x301c, 0x301d, 0x302a, 0x302a, 0x302c, 0x302d,
+	0x3030, 0x3031, 0x3034, 0x3036, 0x303c, 0x303c, 0x305e, 0x305f,
 	~0   /* sentinel */
 };
 
-- 
2.20.1

