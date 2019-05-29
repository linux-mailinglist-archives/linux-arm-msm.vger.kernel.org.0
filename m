Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B42BD2E0E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 17:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbfE2PU1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 May 2019 11:20:27 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36606 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbfE2PU0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 May 2019 11:20:26 -0400
Received: by mail-pf1-f196.google.com with SMTP id u22so1853936pfm.3;
        Wed, 29 May 2019 08:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=5iqwr/7+M82RVAcvJU/35r6kJQYabEd1hdFwDzBIfsI=;
        b=fsBv+734WhTc/44VN1m5ZCh1naG2R/7mQ+Hj0zYsjd3OQVJwmv2f0sjuneVEbJzXJ3
         FugudjrH2ld/EftiuKn6pgVHNgidVCRYa8/yeQ0UpUF58clxxoWwpYTqVnHO9HC08NEn
         SuR1w3GNWdMdOZp9t+9QA8q48+zFSxUM4mcqClQzfCACHvIZ3cq8PPdX2bhtlNqbB8IK
         p5K+Qd8vVIZbq83L53Rp45Y/nX9SIgSvqguXJdpMdSLsttJGTr0OgJ9bU5qEBZmhsUsh
         9x3F6/ur3yAk2otK90wftqpH7gpKqLEe0wOyPcvquzjyIHohsS9nztMPalc94xdF36KV
         rwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=5iqwr/7+M82RVAcvJU/35r6kJQYabEd1hdFwDzBIfsI=;
        b=srpZ/MToXn2v9UxiyrwW8PRAeTco0bdPIBOwGbqJy0HRe3+SRVRG7UEGfiHT96J2BC
         UhvSBFPzls4GiO5wL2zwnyMVZF0SGp14wV+00nJ4R8w+ASSB4tjwBPgwY75BodDFQt4Y
         fEq+NODuoSvu0AoTTDleRagxyqAAcSw3dC91LNg8Insi+WEEOFRkzU/GwV0kyL3po0C8
         aNRGyzxxgE58D+XLHjcb0aBhj+Up/k05ZazQfYQ9kkkXaqBMgv59MZAxe7mBSPPyPHY3
         mb4wKczCeE7feDb8wWwukJ43aSxZ4vFlFoBv0sQ1+emDER/TR54dxhyIfUkyB5g2udnx
         EV7A==
X-Gm-Message-State: APjAAAVcA6kjGtjsRzD3ab2x4kUHu1PpyczQpO+6VNK7pvbzZ5kXZVzi
        DZxQpUEat2+/9atLqQg8Pmo=
X-Google-Smtp-Source: APXvYqyOuPe0zGzQzJN6XRqrZI+J8Li1vF424ttFYbkWS0vC3iafV8NwogFreW6kAYpb/2JMsJpH6g==
X-Received: by 2002:a62:b517:: with SMTP id y23mr67062939pfe.182.1559143226275;
        Wed, 29 May 2019 08:20:26 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id r7sm6198321pjb.8.2019.05.29.08.20.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 08:20:25 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, jcrouse@codeaurora.org
Cc:     marc.w.gonzalez@free.fr, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v2 0/2] Adreno A540 support
Date:   Wed, 29 May 2019 08:20:20 -0700
Message-Id: <20190529152022.42799-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adreno driver support for the A540 found in the MSM8998 SoC

v2:
-Removed extra RBBM write
-Corrected added RBBM writes to allow for hwcg disable
-Patch to add REG_A5XX_HLSQ_DBG_ECO_CNTL to envytools
-Regenerated a5xx header file with updated envytools
-Used REG_A5XX_HLSQ_DBG_ECO_CNTL in code
-Stripped extranious magic number comment

Jeffrey Hugo (1):
  drm/msm/adreno: Add A540 support

 drivers/gpu/drm/msm/adreno/a5xx.xml.h      | 28 ++++----
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 21 ++++++
 drivers/gpu/drm/msm/adreno/a5xx_power.c    | 76 +++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_device.c | 18 +++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  6 ++
 5 files changed, 133 insertions(+), 16 deletions(-)

-- 
2.17.1

