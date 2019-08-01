Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4913C7E3BD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2019 22:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388766AbfHAUEn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Aug 2019 16:04:43 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:40479 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388633AbfHAUEm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Aug 2019 16:04:42 -0400
Received: by mail-yw1-f65.google.com with SMTP id b143so26526776ywb.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Aug 2019 13:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=HgG8M2gXF9KLcX7K8q5a5DHQVUwoAlp7Ry7QAboue7Q=;
        b=S27nJBcYP8KZdyj7v5tt00+H9moxOk4PwrokLphC6p0mUx4N+ajVfGl/cveao7Y77s
         clOVRGP8ZSf+vV71CFiKV8qfjlYuBQbtSpYCzIc23T7+rEDPDzoR1HbymMSXWAqOi2kg
         Byov6WCN2SfK16a0MAumYY4TTDkmy+JkclvBNf+PvvOGKdfu+E3faBCQlUPNd5lj8VZ+
         HCAQ4Fc35UprZrWOaE5z+ycouL+1QlQo82/kkUqcapTt/+x09yVyMWCMuYX9x6rngthm
         DtZ5q1rotS092Xy8Sm7mmrCAZfQrT4ugDOYboJGEz92JJ/6CbdRboAfQxjUJFHot3Kp2
         Ejow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=HgG8M2gXF9KLcX7K8q5a5DHQVUwoAlp7Ry7QAboue7Q=;
        b=TpugD0+7pivJ5sgA4sJt+wxH6PIo4PKNTATL3IZLBnURBTenikk7YbJgfLBlMd73D1
         S9RtCjv21v0Es3XY02AQXIGzgBDARlSbSeeGeZ0RtumpQ72m36vUmN7dJb+LHPnYL/U6
         yJyWUY5Dbss0ToBttkagr9bWHZZ/rOLNr7nXqRdk6Fzq5u8QPbdrquJrypE//g8xr2DK
         dYjbFRpPlhDaV3y+XtwBk84bOiMxwo10DbEru6yA4jmm7W2ERp2t//wIH+fzc0IgDyeW
         tfCVKgM34ZgCtWdb3mgW6BA65pfQQzNZOvaZ12VAHrNok40NQ6I+7IauTUuHMOoyooSy
         9B7w==
X-Gm-Message-State: APjAAAVu9+n2XhfGBUK1BRYAMbPs9mHAwOzSA1TFT6XMdf/yIL2tBPgI
        3QcQ7WKlItOQB9EiYpZj3HH+Ig==
X-Google-Smtp-Source: APXvYqzh4KoHtTTGLwXgFp8IT2ooBjJjbH0lH6V2g+/Ez01h3SNyAfgXpwGQUNrvrIydxe/jWM9zZw==
X-Received: by 2002:a81:6056:: with SMTP id u83mr75542899ywb.331.1564689881522;
        Thu, 01 Aug 2019 13:04:41 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id d69sm16353842ywa.29.2019.08.01.13.04.40
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 01 Aug 2019 13:04:40 -0700 (PDT)
Date:   Thu, 1 Aug 2019 16:04:39 -0400
From:   Sean Paul <sean@poorly.run>
To:     Dave Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [RESEND PULL] msm-fixes
Message-ID: <20190801200439.GV104440@art_vandelay>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Team,
Sorry I pulled the trigger a bit early on the last email. This one is the same
tag, but cc's the appropriate lists/people.

Since I handed drm-misc back to Maarten this week, I'll send msm fixes from the
msm tree. Not too heavy, but fixes some important regressions in 5.3.

Thanks,

Sean

The following changes since commit 4d5308e7852741318e4d40fb8d43d9311b3984ae:

  Merge tag 'drm-fixes-5.3-2019-07-24' of git://people.freedesktop.org/~agd5f/linux into drm-fixes (2019-07-26 14:10:26 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/msm-fixes-2019_08_01

for you to fetch changes up to 9ca7ad6c7706edeae331c1632d0c63897418ebad:

  drm: msm: Fix add_gpu_components (2019-08-01 12:52:21 -0400)

----------------------------------------------------------------
- Fix the dma_sync calls applied last week (Rob)
- Fix mdp5 dsi command mode (Brian)
- Squash fall through warnings (Jordan)
- Don't add disabled gpu nodes to the of device list (Jeffrey)

Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: Jordan Crouse <jcrouse@codeaurora.org>
Cc: Brian Masney <masneyb@onstation.org>
Cc: Rob Clark <robdclark@chromium.org>

----------------------------------------------------------------
Brian Masney (1):
      drm/msm: add support for per-CRTC max_vblank_count on mdp5

Jeffrey Hugo (1):
      drm: msm: Fix add_gpu_components

Jordan Crouse (1):
      drm/msm: Annotate intentional switch statement fall throughs

Rob Clark (1):
      drm/msm: Use the correct dma_sync calls in msm_gem

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c   |  1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 16 ++++++++++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  |  2 +-
 drivers/gpu/drm/msm/msm_drv.c             |  3 +-
 drivers/gpu/drm/msm/msm_gem.c             | 47 +++++++++++++++++++++++++++----
 7 files changed, 64 insertions(+), 8 deletions(-)
-- 
Sean Paul, Software Engineer, Google / Chromium OS
