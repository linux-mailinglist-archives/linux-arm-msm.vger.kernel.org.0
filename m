Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 367BC38BD2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 06:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232931AbhEUESC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 00:18:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231337AbhEUESC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 00:18:02 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA063C061574;
        Thu, 20 May 2021 21:16:39 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id g24so10283498pji.4;
        Thu, 20 May 2021 21:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding:user-agent;
        bh=WRc2dTi2j0cBWfnXOzygB7tUMf1PqONoKF2ltQXZk5A=;
        b=IK/scQupUFUmZjR7WuCGM6VOzTsQumSseCKgqsBz8Xe1hZs8LqKU6eJJK5/JbOi795
         31SOmQ/u1ZzVMIgSLlt48shW/KmfwvZZtpuj/Ak3XRva/PWAiJZNkBA0ytIj3SAus8t3
         r9h/9XecJ0H64ZTpw6hiNM0eHkCt6DiXZf2UeFPp76kYGBR9e82PPMG9FBb3pSXj2QVv
         DUIxBQstCsvASLkpBBFWy1p7/G+SvGn4wwzAYPeP9h2NAly84bTvRVfCE6x7jBI6GLot
         Jcrr2+bnrGsLIfb/48vg1jWMgN3uu04o/8+KgAFmuqszZmuXgwtVPO/yCShsqxjlkZ/U
         gz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding:user-agent;
        bh=WRc2dTi2j0cBWfnXOzygB7tUMf1PqONoKF2ltQXZk5A=;
        b=J6l2M05jKHTu7iFl3DNpr7T9HqhiGejzuTibLHqo5cFrX7tn5oSsPz3K7uMwuHAXoJ
         BY+mY//m9IKNYzJFwMdppAe6fp9KxzNdPYI4rzY8GdLpQ5Kqr9Hv/FkU5N2qs/9R4X6w
         OyFwn8PxqlxQqJnIXct0nvm8BgK4oZkK1aijS7rGkw1UR5I9SSammM7a52J3f6c18wTj
         LJzqRGRx2Q9Hq0ifI7QaABDOQZbhZq7siFIK4t23j18PB5oLVKDCPhib3yjVPzZFnppq
         MIwwUcRmYWSmIe6Gtbsobhp3YchgVVy2xxIZ/1f9yVAi2b3O0yoGGsFF1L9+84qbKzq8
         jxxg==
X-Gm-Message-State: AOAM531q1nOHUQSFuWWOcHOEOyR8zYJgrDbaXzJPHR745QmCHu/aZ+Ly
        Goe5y35pPqz6ZGWZKjOrrjM=
X-Google-Smtp-Source: ABdhPJx3niu1eWdFCijc4XeXW5ERpS0VFjddRYJZU8IqE4xiyvqKJatzCvGlkGOew4J3H+ZvEKGw9A==
X-Received: by 2002:a17:902:da86:b029:ef:70fa:7b39 with SMTP id j6-20020a170902da86b02900ef70fa7b39mr9780905plx.81.1621570599116;
        Thu, 20 May 2021 21:16:39 -0700 (PDT)
Received: from raspberrypi ([125.141.84.155])
        by smtp.gmail.com with ESMTPSA id y64sm3103960pfy.204.2021.05.20.21.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 21:16:38 -0700 (PDT)
Date:   Fri, 21 May 2021 05:16:33 +0100
From:   Austin Kim <austindh.kim@gmail.com>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, angelogioacchino.delregno@somainline.org,
        dmitry.baryshkov@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        autindh.kim@gmail.com, kernel-team@lge.com
Subject: [PATCH] drm/msm/dpu: remove unused variable cmd_enc
Message-ID: <20210521041633.GA1747@raspberrypi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

After the call to to_dpu_encoder_phys_cmd() is made,
'cmd_enc' is not used. Where to_dpu_encoder_phys_cmd() is simply replaced with
container_of(x, struct dpu_encoder_phys_cmd, base) by compiler.

So it had better remove W=1 kernel build warning(s):

  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c: In function
 ‘dpu_encoder_phys_cmd_wait_for_commit_done’:
  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c:688:31: warning:
  variable ‘cmd_enc’ set but not used

Signed-off-by: Austin Kim <austindh.kim@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index b2be39b9144e..088900841bf8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -685,10 +685,6 @@ static int dpu_encoder_phys_cmd_wait_for_tx_complete(
 static int dpu_encoder_phys_cmd_wait_for_commit_done(
 		struct dpu_encoder_phys *phys_enc)
 {
-	struct dpu_encoder_phys_cmd *cmd_enc;
-
-	cmd_enc = to_dpu_encoder_phys_cmd(phys_enc);
-
 	/* only required for master controller */
 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
 		return 0;
-- 
2.20.1

