Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB8D6354626
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Apr 2021 19:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238916AbhDERmK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 13:42:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234136AbhDERmK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 13:42:10 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C191BC061756;
        Mon,  5 Apr 2021 10:42:03 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id y32so5382229pga.11;
        Mon, 05 Apr 2021 10:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XHO0wyjY+FEn213Oc9Rxdq+fE2tksXvgBm7Zhcmxqbc=;
        b=cHsdt3+3qTwnn66SUZ4zRx2PP97lFo9OEygRMaGT/sQhOjxfKSgBK+2B0VMAF1K1gM
         CrjdyzcL+ZUu8sZf9npZmVmrhodCJCvf46eBhg6S6FJ4QEMgzr0o51IrApqdkaZwMdMl
         5rcwyszN5+TyTDxRHDRRxVpzS5HjtlZYaxalyIQvIDk+JT2Rz7igDO60Furec1gQ6dzU
         be0G2yu+6xrnn94cZ0KsPyL2DV4DfILcKIeb+B/W0YM2qlCX1N99yS4kdaKZf0vck0+h
         8SQB1kK+KGoOnsY4w8VPZ04cOAKfQi/XZOONUjoLMNizau7QfcoSY76E5r1RGcrSNHSo
         hiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XHO0wyjY+FEn213Oc9Rxdq+fE2tksXvgBm7Zhcmxqbc=;
        b=s2fcak9JejQv5rI7yHcTqXaYuzhcdqXXXuVFdUQ3pVRJzsdnwljPzzwpSF+gtM/PUX
         BxPPD19bBsyfxVXXKazKdTvvbdIEi3BYIsBYY8Bedc+zpjtAF3w3GOIiXUgTEM0qkUXx
         llOSrJxz8DT479JYqLZFnIN3TpgEXBwAuE6SH1S+sL4P6Ny13asEQYscs6RZP+H3bTsT
         mKnqAmGUCJF4wVFR+SrqDV1ePbTYRXPJREBnfWSeffIFoL7BQTcGHrwj5FrpMU8VTFut
         Vsq+ukyDQHtv7Bfd2lMQ4hNi4hHg9OnGQFDEAdNYIldr++I+gwQCAdmUhQl1ki6J3lIm
         ElEA==
X-Gm-Message-State: AOAM532GUt4blRysh5bbg8PQvNiDaSW82V8GFUWcCBvktAdsGuTAFzLo
        tJ1ggsIU78V4bg/t0WsQEgg=
X-Google-Smtp-Source: ABdhPJx1gyT8RHAnDJ9nm8PplSyEEAsnMs61ssxEYWIO86VFsIQv4AJ//yvpO2XaqD6VidV/Qvr+lQ==
X-Received: by 2002:a63:1316:: with SMTP id i22mr23372774pgl.419.1617644523140;
        Mon, 05 Apr 2021 10:42:03 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id h68sm16859533pfe.111.2021.04.05.10.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 10:42:01 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@chromium.org>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU),
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list),
        Rob Clark <robdclark@gmail.com>
Subject: [PATCH 0/8] drm/msm: Swappable GEM objects
Date:   Mon,  5 Apr 2021 10:45:23 -0700
Message-Id: <20210405174532.1441497-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

One would normally hope not to be under enough memory pressure to need
to swap GEM objects to disk backed swap.  But memory backed zram swap
(as enabled on chromebooks, for example) can actually be quite fast
and useful on devices with less RAM.  On a 4GB device, opening up ~4
memory intensive web pages (in separate windows rather than tabs, to try
and prevent tab discard), I see ~500MB worth of GEM objects, of which
maybe only 10% are active at any time, and with unpin/evict enabled,
only about half resident (which is a number that gets much lower if you
simulate extreme memory pressure).  Assuming a 2:1 compression ratio (I
see a bit higher in practice, but cannot isolate swapped out GEM pages
vs other), that is like having an extra 100+MB of RAM, or more under
higher memory pressure.

Rob Clark (8):
  drm/msm: ratelimit GEM related WARN_ON()s
  drm/msm: Reorganize msm_gem_shrinker_scan()
  drm/msm: Clear msm_obj->sgt in put_pages()
  drm/msm: Split iova purge and close
  drm/msm: Add $debugfs/gem stats on resident objects
  drm/msm: Track potentially evictable objects
  drm/msm: Small msm_gem_purge() fix
  drm/msm: Support evicting GEM objects to swap

 drivers/gpu/drm/msm/msm_drv.c          |   2 +-
 drivers/gpu/drm/msm/msm_drv.h          |  13 ++-
 drivers/gpu/drm/msm/msm_gem.c          | 155 +++++++++++++++++--------
 drivers/gpu/drm/msm/msm_gem.h          |  68 +++++++++--
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 129 ++++++++++++--------
 drivers/gpu/drm/msm/msm_gpu_trace.h    |  13 +++
 6 files changed, 272 insertions(+), 108 deletions(-)

-- 
2.30.2

