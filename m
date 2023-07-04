Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6140A7476D1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 18:36:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjGDQgu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 12:36:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbjGDQgt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 12:36:49 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51013C9
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 09:36:48 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-55ba895d457so1097635a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 09:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688488608; x=1691080608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LFRDc3E8OmLDCka2bpsiEu+dF663MCo3+8JyB3tlqiA=;
        b=b8lDTLFAR2docihZsVjV18uNg9C8vC/+5Q0wSbALcHKwcbEq5Ff+VF+6DTFrHT1U6d
         ct4yryNfOCCR0UftSWdth2TX5yqzp8eGg/bJ9farhTywo+5aWW6iqxdhslhTDHwsGND0
         rkNhb232i9REaZeEgcoN48m237QjGAW9P8cmYpQ3xjRjOhIXyOxqWc0WXIW4KfCKDipC
         JoRQwvdyXvFWDAGN3D/o+tyrXe8SE7rfbLYyg+YffM4PFnCmNX/5QzTIQhXPQ4yNqHZR
         DpXo0rINg6gg/hn/acFSGOQM21bImVdG1ZJ4Uto6TT5BeyXc+bg7nAY8Pb0VEUveC+8H
         qUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688488608; x=1691080608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LFRDc3E8OmLDCka2bpsiEu+dF663MCo3+8JyB3tlqiA=;
        b=PMtYzM1pdNGM6Ob8cCv0+VAIiC8fPmXTmmIcUhgbMN0T2vycXGBu6aVmgY5VyHLmG+
         WHKXtdixEhHSoghAq07MjsxU55Qzmx8EbJISzF0SV1qmnbTNDVPzQcYWeSMDFTXhxZSk
         oOKlFsFxs9I3v7jvfYtQjMKMrCUcxtmomiHIwEOhFMsnA+lv7lm3hMCopMTlXNoDt3AL
         bpIq4kxVzacZDwaOaDsehmWoKuGrOwYG053D+td6Ig/aPJZ7h73JNDx1OERkxgsD3q/r
         XFPHyk08JnassiO26tHguWVxqeWAGzPj2JpI1G6rPcw2hBHX71o5NzLsiK5H7nb3EE3w
         IcEA==
X-Gm-Message-State: ABy/qLZIcmYBSmToPbYqIgpg1dc9iZ9ABfCCGejFZuhOFhGLLwuOjluW
        z+JZSDk380DArzpU5AL5PRU=
X-Google-Smtp-Source: APBJJlEbj7WnCbDxIv9ZoCO8MVBlhz3BBSYckJj3OB/5xPq/MNXLATSeykAMPdtKJgs3TAubTtnI9g==
X-Received: by 2002:a05:6a20:a11a:b0:12f:7a6b:63d2 with SMTP id q26-20020a056a20a11a00b0012f7a6b63d2mr620338pzk.6.1688488607612;
        Tue, 04 Jul 2023 09:36:47 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:ae1c:de46:682a:206])
        by smtp.gmail.com with ESMTPSA id m12-20020aa78a0c000000b00679d3fb2f92sm13044627pfa.154.2023.07.04.09.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 09:36:47 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 1/2] drm/msm/adreno: Fix warn splat for devices without revn
Date:   Tue,  4 Jul 2023 09:36:39 -0700
Message-ID: <20230704163640.6162-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Recently, a WARN_ON() was introduced to ensure that revn is filled before
adreno_is_aXYZ is called. This however doesn't work very well when revn is
0 by design (such as for A635).

Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Fixes: cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified before being set")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 65379e4824d9..ef1bcb6b624e 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -149,7 +149,8 @@ bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2);
 
 static inline bool adreno_is_revn(const struct adreno_gpu *gpu, uint32_t revn)
 {
-	WARN_ON_ONCE(!gpu->revn);
+	/* revn can be zero, but if not is set at same time as info */
+	WARN_ON_ONCE(!gpu->info);
 
 	return gpu->revn == revn;
 }
@@ -161,14 +162,16 @@ static inline bool adreno_has_gmu_wrapper(const struct adreno_gpu *gpu)
 
 static inline bool adreno_is_a2xx(const struct adreno_gpu *gpu)
 {
-	WARN_ON_ONCE(!gpu->revn);
+	/* revn can be zero, but if not is set at same time as info */
+	WARN_ON_ONCE(!gpu->info);
 
 	return (gpu->revn < 300);
 }
 
 static inline bool adreno_is_a20x(const struct adreno_gpu *gpu)
 {
-	WARN_ON_ONCE(!gpu->revn);
+	/* revn can be zero, but if not is set at same time as info */
+	WARN_ON_ONCE(!gpu->info);
 
 	return (gpu->revn < 210);
 }
-- 
2.41.0

