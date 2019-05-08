Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B7F7179EB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2019 15:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbfEHNHa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 May 2019 09:07:30 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:35291 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfEHNHa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 May 2019 09:07:30 -0400
Received: by mail-qk1-f193.google.com with SMTP id c15so3131834qkl.2;
        Wed, 08 May 2019 06:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PB0UQqZL2l81e8KBphbHsFIt1aSxB71MYNy4uU0+TBs=;
        b=cFSVhlXBBuje5m5yG1SvlpxPFYTkUqhuABFFnM8Vap7s0cUik1oEGWP9QprZQO/4N5
         3hIN3RGR1yVlwPky/QSUD9Q7ZHA7b8BPqbuwQvTvsuw+p7GFIWmRIGuTrLFcyGjlvCOg
         cbWGC5thnbw+vzjdfs7WW6Sj1cjDOdFDkunmt2TPMNxOLKDTVHUxJ/iRJYv0nW/aaLjF
         AYVX1MhiuDZ6p133n04G6zR0Afc9LSBf7Nef7XBmhWgSQRpg2F9EHnDIBa6k1YMz0tn/
         1HQZ/EKTF2NKd3MPu/SxDC20Ay19kLnrmtwSsiYQ0G43B4kFJIwdmASlfCUHw1X3ESYy
         KG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PB0UQqZL2l81e8KBphbHsFIt1aSxB71MYNy4uU0+TBs=;
        b=kDE0rjM25bGvdPNAvEnOXlLVDQhGuvnQwdyAnGShq8bPxvG6g4bLiC+8mJ8NS18twU
         AisTC/TUDx6b2O+fJ5V+mqKbqE9u3O3ZV4q9zrcWNnPoGu/tFPHPcR4QQ5bKvm3TQUvE
         VQJiRIrUS5SgjfDSL/koeNK4vuglM7EmkCZIqs+rDqIZW9iQwmuPhGg8nXh2/n9HiB31
         ok4/5hNVHTpvNSYD4uHRw21BbweoRXtvJZ54hIGye4GgHRBFtfpkDdvaGqUldRu/g96H
         oWQmqdvnE0hU8fIAn/elmyX7QG3qm2XPLGb9YJDKAg3r1Vlbmwt3v89uc0j3+Igpbvbf
         qpyQ==
X-Gm-Message-State: APjAAAWRfmogzgZFUOOA2E1RuYo4pVJBiM4lSDJIGB4JAOB9pFAmvG4t
        tgo/oi7h/0I8Q56CBobU00k=
X-Google-Smtp-Source: APXvYqwdNnENVaxCQS/UfbH5uDsAC1Cpc98U/DY8M3zrGBK2M8tRp+nc6/EGVHJZB5x+wEqALkCAtg==
X-Received: by 2002:a37:40d2:: with SMTP id n201mr29155323qka.83.1557320849170;
        Wed, 08 May 2019 06:07:29 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:6268:7a0b:50be:cebc])
        by smtp.gmail.com with ESMTPSA id g206sm9021192qkb.75.2019.05.08.06.07.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2019 06:07:28 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/a6xx: No zap shader is not an error
Date:   Wed,  8 May 2019 06:06:52 -0700
Message-Id: <20190508130726.27557-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Depending on platform firmware, a zap shader may not be required to take
the GPU out of secure mode on boot, in which case we can just write
RBBM_SECVID_TRUST_CNTL directly.  Which we *mostly* handled, but missed
clearing 'ret' resulting that hw_init() returned an error on these
devices.

Fixes: abccb9fe3267 drm/msm/a6xx: Add zap shader load
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ec24508b9d68..e74dce474250 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -527,6 +527,7 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 		dev_warn_once(gpu->dev->dev,
 			"Zap shader not enabled - using SECVID_TRUST_CNTL instead\n");
 		gpu_write(gpu, REG_A6XX_RBBM_SECVID_TRUST_CNTL, 0x0);
+		ret = 0;
 	}
 
 out:
-- 
2.20.1

