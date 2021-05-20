Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 640F7389A70
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 02:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbhETA0n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 20:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbhETA0m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 20:26:42 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8756FC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 17:25:21 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id ne24-20020a17090b3758b029015f2dafecb0so3149582pjb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 17:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HnUlRSyazCKo9xmvcnsazZcLuVKlbVM14ntknUcnp7c=;
        b=lppee0aykW6DYsEq7WnlEJbxTzvXzKJZXA4Qci82EhIxzNrqkndVPltAPRRrIfjq4z
         Jgc1SlTGuIp/GPyI+PPl8PhKEreGx4dRNFDMme/gHvgkY9T4MFHnMK5bg6FWiXoVn/M2
         /uaDGv8cnGuege3fZ3SZLURqHSRmzAZBFQ0e4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HnUlRSyazCKo9xmvcnsazZcLuVKlbVM14ntknUcnp7c=;
        b=OWTIMlF7XpHanGcvVSeketTMNYpr3Cb927vvwz3O1bpVCGCLWUwVs+iPFfxVKcKcCQ
         RXRvu2vAWkYrNqERQHRg4DKAys7bABId9KLUnpKD2UkvrqudyaJRDoougEL/hZHD5rcl
         Go19LbAPof1SthYOGKtnuLnupUIuw0CFCHQaTSJqYFvisOj/B5CDckTbTi7jXyzAWhnq
         lEJf/YqXrYduz4dfP56tQqTRZ/nSUq+na6XL/8+mgBLE6tgL2HNtn432Qvq4yoj5McLU
         58ISNL2unlS1k+aFCiMJHdFXiHmVk1UUMssChWDV1JfUuALsKVBHI8bKZA0ISVekwLZI
         WTfg==
X-Gm-Message-State: AOAM5339RD7/M+PFtAllXlNfLZzQ87+cBpAsvkltaAJBa0+gINZoZ2CY
        4t+J3NsRQDxj9T7s1Xo/A2PIzA==
X-Google-Smtp-Source: ABdhPJwC3IwDI2gFp43UHpOegES+CCjEkSMmtGwVPcBzLAlKbgcBury8x7ZAosf/PakNL9RQbOsijQ==
X-Received: by 2002:a17:902:d4c3:b029:ee:ae62:9fb7 with SMTP id o3-20020a170902d4c3b02900eeae629fb7mr2675752plg.8.1621470321058;
        Wed, 19 May 2021 17:25:21 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:200b:db75:4e6c:8b96])
        by smtp.gmail.com with ESMTPSA id i14sm398904pfk.130.2021.05.19.17.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 17:25:20 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH 0/7] component: Make into an aggregate bus
Date:   Wed, 19 May 2021 17:25:12 -0700
Message-Id: <20210520002519.3538432-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series is from discussion we had on reordering the device lists for
drm shutdown paths[1]. I've introduced an 'aggregate' bus that we put
the aggregate device onto and then we probe the device once all the
components are probed and call component_add(). The probe/remove hooks
are where the bind/unbind calls go, and then a shutdown hook is added
that can be used to shutdown the drm display pipeline at the right time.

This works for me on my sc7180 board, but I'm currently struggling with
the last patch where we migrate the msm driver. It runs into a runtime
PM problem where the parent device isn't runtime PM enabled yet. I'm
still trying to figure out a clean solution there. Moving runtime PM
around breaks boot and I think that's because the power domain is off.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>

[1] https://lore.kernel.org/r/20210508074118.1621729-1-swboyd@chromium.org

Stephen Boyd (7):
  component: Drop 'dev' argument to component_match_realloc()
  component: Rename 'dev' to 'parent'
  component: Introduce struct aggregate_device
  component: Introduce the aggregate bus_type
  component: Use dev.parent instead of adev->parent
  component: Move struct aggregate_device out to header file
  drm/msm: Migrate to aggregate driver

 drivers/base/component.c      | 614 ++++++++++++++++++++++------------
 drivers/gpu/drm/msm/msm_drv.c |  47 +--
 include/linux/component.h     |  73 +++-
 3 files changed, 487 insertions(+), 247 deletions(-)


base-commit: 6efb943b8616ec53a5e444193dccf1af9ad627b5
-- 
https://chromeos.dev

