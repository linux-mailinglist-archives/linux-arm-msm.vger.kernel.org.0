Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85EC43F6BD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 00:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbhHXWp6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Aug 2021 18:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230488AbhHXWp6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Aug 2021 18:45:58 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A7DAC061757
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Aug 2021 15:45:13 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id m26so19644038pff.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Aug 2021 15:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=okg0hFDj8TjYsXX+EaNAzrjXTufRcIdi+BwPbEnVuq0=;
        b=VHaRffUTC9ofm4EXosGi3bHfkruxwkVWm26ty1xsnWvYcFJPfe1fLEitC93p+aiK3x
         YFFM5IFakgksv1QfC2j1IN+nkSurAaTOSBqJoJSsO/Uft+8AlsTvnqOjqeQt935rpnci
         Ff8JYfnedSzbnQpQVq6w01C4fVfKvAeDsAZZ4pgPiaaYbsOxwQYyS+32oQZKG/mFr9Zu
         y4+IcFs2JCNYKP2SbOqKaejUuwzlGqNxWwjLK35HCntbwz0Tk9RmuCSEJbcHz4uCODDf
         OZL1hqJQK2nHMbNOmxZpUgLpHPrTRx+H6rh6gQFS49r5Vogk1r7A9y/QGv8cmSrFZEYj
         4/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=okg0hFDj8TjYsXX+EaNAzrjXTufRcIdi+BwPbEnVuq0=;
        b=tkI6n1a0L4FAVx9weO98t1pPFQxndcXY8Nt8NPM0PpzVugrg/6iJZLvAb7EoL+RQ4U
         qEHU3oa+TF0DPi461HsthG+67h5FPVpJ5ru+Dna27HcnlytDd1CWYzIEo1/afzoMxfzc
         Ap1NCX7kU+2tlHj7HLCmwS4kNCRcogyszzUSezxNXIRVC/9p9HVFljPxqbZ4N9Su0vy8
         xecXlBduMNIyEBFBx8647/UOQDtCdo3sQfwPSfh1aBPFjRX38wl08X70xeAD4bVXwnEh
         Ezecr9jLeFxV9jG4G0hPvmiXbLK4XjQj7azWdXE2T5kZXua/cH/065h+JCw7YuyY/db7
         SpEg==
X-Gm-Message-State: AOAM5334Zs6QaiKuWY3we8iB1q+vyf3fRFlGUmgbh5GwqI3qq/sTo/Er
        B19APzB7jSlxoErc3B3GRgo=
X-Google-Smtp-Source: ABdhPJyNwORw3GjlxMlyqjjW45WdD9XoCR3CwPyqBM0IRHK44V/DJSqosVpbgtToT7RXE3eBYAus9A==
X-Received: by 2002:aa7:87d1:0:b029:3e0:e44b:6429 with SMTP id i17-20020aa787d10000b02903e0e44b6429mr41886882pfo.81.1629845112856;
        Tue, 24 Aug 2021 15:45:12 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id h5sm19330376pfv.131.2021.08.24.15.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 15:45:11 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     igt-dev@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH igt 0/3] Initial igt tests for drm/msm ioctls
Date:   Tue, 24 Aug 2021 15:49:29 -0700
Message-Id: <20210824224932.564352-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Add an initial set of tests for the gpu SUBMIT ioctl.  There is
plenty more we can add, but need to start somewhere.

Rob Clark (3):
  drmtest: Add DRIVER_MSM support
  msm: Add helper library
  msm: Add submit ioctl tests

 lib/drmtest.c      |   3 +
 lib/drmtest.h      |   1 +
 lib/igt_msm.c      | 163 +++++++++++++++++++++++++++++++++++++++
 lib/igt_msm.h      | 128 ++++++++++++++++++++++++++++++
 lib/meson.build    |   1 +
 tests/meson.build  |   1 +
 tests/msm_submit.c | 188 +++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 485 insertions(+)
 create mode 100644 lib/igt_msm.c
 create mode 100644 lib/igt_msm.h
 create mode 100644 tests/msm_submit.c

-- 
2.31.1

