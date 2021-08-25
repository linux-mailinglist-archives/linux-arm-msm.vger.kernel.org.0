Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9A5C3F7EFD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 01:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232727AbhHYX2B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 19:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231535AbhHYX2B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 19:28:01 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DE2EC061757
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 16:27:14 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id a5so538527plh.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 16:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=irm63N1v7jiSbm/lFOnEb45IxGHQFi8vlCoxcbEKkXg=;
        b=jZzmi0k9GW2sHueWQEojILsnn44e2ag1mgng+YXDTj8ls5E2MvUj2AwSZP+eYhF+gR
         Y44IHF05tVmjHitUaYQTl2LIS2olDqH1WKViKZ4p0OxaQhS/HPwn69ghDNJ/ShJC3Cft
         qXwcozGOyE0Zc5xCghDZqzoc2MHEAooHlR2tZNmkXdzQfDiqx35JHWbqwxKhrdK1pXJx
         kOTBLDkf4hSXi1mir3CO1oQlt4G3mFmCcNzS5+KGCivD53LrdPRVoSbAbKu18hf6idwc
         eXaLE60A5KMqunRtOhwxWPGH/QQrI3V2LTbMyktGwMRR6ZH1TJINkS7uEz/CfGaeCsBe
         3dfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=irm63N1v7jiSbm/lFOnEb45IxGHQFi8vlCoxcbEKkXg=;
        b=WaJBUOf+q2n7BlrwcNtL412dAUeA/Xg2uFhS9CJtDi9vb8lrcnd8tQ74tv2QP/9VIf
         pJZwyMMrgQXFVNnxzJyajEDqIQl5csB+IBiZvdUpmsZHKKzQ/9jzqUAB73afmaoARRNr
         slLMbv/uGK+o12OMBBXww6jqDjFDvY3AW5o9064f0ab74gSqUj9YSwM36DsgbilBqdX1
         mb6Mg28KFvBt+VmGceecI2hpYg+UH4EYUBkR6Pis3rW+f95Magkq/E7qXYKj9iBBvmvH
         Y1631p996pu9evcDdRrDlY+yN96neqyOMJB86XmTm9Wd1Yi9/S4qLM5lFvxASLej4bHi
         nzvA==
X-Gm-Message-State: AOAM532Rm89vQrefS03Ir7tqzDZAKNjafxMzeYzKb0X7Zs1U83lxgnaF
        Lv7V8ODmcaKGimGJX6+maJ0=
X-Google-Smtp-Source: ABdhPJzSzAEdIfTHhKI9WjMVsnrG+asJfiDgMOMvO0BxkqoZr+sMnhB6e78os75ClZ86cNwICcGgBQ==
X-Received: by 2002:a17:90b:4b49:: with SMTP id mi9mr799346pjb.87.1629934033994;
        Wed, 25 Aug 2021 16:27:13 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id o75sm701970pfd.211.2021.08.25.16.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 16:27:12 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     igt-dev@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Petri Latvala <petri.latvala@intel.com>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH igt v2 0/3] Initial igt tests for drm/msm ioctls
Date:   Wed, 25 Aug 2021 16:31:36 -0700
Message-Id: <20210825233139.1066504-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Add an initial set of tests for the gpu SUBMIT ioctl.  There is
plenty more we can add, but need to start somewhere.

v2: add msm_device::gen and drop igt_msm_pipe_gen().. any test
    that needs to build even trivial cmdstream will need this
    so make it part of the util helper code

Rob Clark (3):
  drmtest: Add DRIVER_MSM support
  msm: Add helper library
  msm: Add submit ioctl tests

 lib/drmtest.c      |   3 +
 lib/drmtest.h      |   1 +
 lib/igt_msm.c      | 171 +++++++++++++++++++++++++++++++++++++++++
 lib/igt_msm.h      | 119 +++++++++++++++++++++++++++++
 lib/meson.build    |   1 +
 tests/meson.build  |   1 +
 tests/msm_submit.c | 186 +++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 482 insertions(+)
 create mode 100644 lib/igt_msm.c
 create mode 100644 lib/igt_msm.h
 create mode 100644 tests/msm_submit.c

-- 
2.31.1

