Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1962F2B4E67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 18:49:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387453AbgKPRrA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 12:47:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733124AbgKPRq7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 12:46:59 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4546C0613CF;
        Mon, 16 Nov 2020 09:46:59 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id 131so4309698pfb.9;
        Mon, 16 Nov 2020 09:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AFQ+O37FNhcW/Av1cdzRedXy1kVAe5xo2SMJ3+HW4OM=;
        b=vWXDOTfl59qP9fxCS19SyQrfmBfDGuSxJsaVaz5eSMb86AZtFklN7A6Zn5DpU2O62M
         z/o81vZvXnRjoqLaklfBDjXWvMIsqijdjhliiP2DH/mnlR1dIhxQBNMgQFl307oQroa7
         qrlWZqgHXNh56cfEOdscvePSzck8kpS4ztlZ/YQ3D9p08q5dIKSqy9Zw4SkM5jZtk2NX
         gfJHMH1DSX/xkJgW0u64M+jdPEvSTEbt6+9VfLD3iOjhFPI7qilId9+q03ZqIQxuVnD7
         lphI90AKiQvVDsX+mRf+DTegxdafRYX6l6nHIQ2p7rxYfLyiMa8bP+5CXzbkxidlTk+g
         k7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AFQ+O37FNhcW/Av1cdzRedXy1kVAe5xo2SMJ3+HW4OM=;
        b=SOfK2c1C1WzBRXJDqw79y90VnIgn1eoXOBONzVrtAgjXWXpf6qRm2FumdQ7sm21s9h
         MXskBOKBjz+RJEBkLbtru/BmeNe1+RxoWtu5CgqZDfar0ZSt+zBUBmidiRQxKnuDtACF
         m2jR4dbegACrsEgWEmzhcWyRFSkg/4sJ1l/rBy7R0plp1jTVuamESGTfFITQoe1/XHNh
         v7DNk1SNdZGp6M4qg7lSMxdPxdqQYiTUbi7TsggiwJqVKOgcaL3U/t37Hny0eiGVJoWJ
         TmJo0Fs7rFDWrJD5qkiTDjytfBut/oKzasMRAJX2K6ushy9vFXN6RDOdzsZhlIWqttHU
         Cg/w==
X-Gm-Message-State: AOAM532cpu7UQ4j4T2Tasn5E7rVKktddW30xYcgT9aMGtFRjZCsJnON7
        RVfIn4L7geMu+xkbBnpITwg=
X-Google-Smtp-Source: ABdhPJyeKY5m4SY+1T9gII+E3Bldj7+ODf6BYWuyVbLF75IPQWTx0NuLpLWGPvG4nF8DXKpCoWoR0A==
X-Received: by 2002:a63:5421:: with SMTP id i33mr317880pgb.316.1605548819123;
        Mon, 16 Nov 2020 09:46:59 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id q16sm18422605pff.114.2020.11.16.09.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:46:57 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), Jordan Crouse <jcrouse@codeaurora.org>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 0/3] drm/msm: Shrinker fixes and opts
Date:   Mon, 16 Nov 2020 09:48:48 -0800
Message-Id: <20201116174851.878426-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

The last patch is the main thing, motivated by some cases where we would
spend a lot of time in msm_gem_shrinker_count().  First two are fixes I
noticed along the way.

Rob Clark (3):
  drm/msm: Protect obj->active_count under obj lock
  drm/msm/shrinker: We can vmap shrink active_list too
  drm/msm/shrinker: Only iterate dontneed objs

 drivers/gpu/drm/msm/msm_debugfs.c      |  3 +-
 drivers/gpu/drm/msm/msm_drv.c          |  3 +-
 drivers/gpu/drm/msm/msm_drv.h          |  8 ++--
 drivers/gpu/drm/msm/msm_gem.c          | 45 ++++++++++++++++------
 drivers/gpu/drm/msm/msm_gem.h          |  5 ++-
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 52 +++++++++++++++++++-------
 drivers/gpu/drm/msm/msm_gpu.c          | 10 +++--
 7 files changed, 89 insertions(+), 37 deletions(-)

-- 
2.28.0

