Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84E7B3FBA00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Aug 2021 18:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237620AbhH3QTB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Aug 2021 12:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbhH3QTB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Aug 2021 12:19:01 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69204C061575
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 09:18:07 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id n12so8808971plk.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 09:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nJ/vHQ8m8iLAMD8+ZyhKRlQPyo+UcB05ujjGTF6TT/E=;
        b=Nw1jF6bKyxGf/sNll9xkljP7pmBCqi6jKbC/TW6GlQ+NG8Q6FeBAX6t5bx7b8l4kLB
         ica+QyXL1bbvygEe4YbwFdfk/nNw/yanXRuSxymVwK2dVM92y8aN1PyxcyUf25G6rpy7
         Jgy2Mye4eCnB6rbbDgTEluVmj0bv6ulxf5OpfCoz3Nf2Q42n5YHm+8B/mwKMDhU2ZuMo
         0/brg5Cyxr1Ym/hty6Le+qbfz+oBltwfo/KJc/Ohtr1JqqcK+O78qDWsrIfxdXmvKdxV
         dVvbXa0dJnR23Z9emcggHAzssSXXBrY8eyJiA/uf5RWln15455pTKaLftAFvWLBHuJWp
         WjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nJ/vHQ8m8iLAMD8+ZyhKRlQPyo+UcB05ujjGTF6TT/E=;
        b=Ri5MmqamrEXdwCQ24cVhzctG46lsHl8aSDCcY+PWhvkMrOjY8kn2gbWDHT7g0J1cic
         oe52sCfAA3XC4bp8IQDsWhY6Y8eaIchcWiXPrEOq0QK5Ooo926t+8Ba+kpzILSHUB7KZ
         7Z8zblZX4u6tEExQ1VXG5tCJ7meugxgdhYwvDfGbV286bTb5GgZa2nKPNroZaBv8gOXZ
         RisurPdG8ptCDZYXgrggKtc/j9q0w8CnHvXvxwqWwQL2gJE6hzgb+L6Mecll6PBChWyc
         nKEbfJWdk8E6rr+97mrsPrMKqd8KiKuP2Jo8DzD0J5WXwkJ5zsCm7QnMzEis0/wRxR+w
         rtxQ==
X-Gm-Message-State: AOAM531/jymrnrmhphpH6imhtZZYEWv6vD4yoUCl/tSnLzG+eRFmrd6e
        9chjxSgR+9wqhJlcY2zGwsA=
X-Google-Smtp-Source: ABdhPJx+yu6yMj8qxSjwRpeLSgzzPPwBao5uugNAbpmeQ5HlJjIG/0cZTjdEfzPBdNf5LZOYeTLIdw==
X-Received: by 2002:a17:90a:ae12:: with SMTP id t18mr15907293pjq.211.1630340286911;
        Mon, 30 Aug 2021 09:18:06 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id j6sm16932844pgh.17.2021.08.30.09.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 09:18:04 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     igt-dev@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Petri Latvala <petri.latvala@intel.com>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH igt v3 0/3] Initial igt tests for drm/msm ioctls
Date:   Mon, 30 Aug 2021 09:22:29 -0700
Message-Id: <20210830162232.1328594-1-robdclark@gmail.com>
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

 .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
 lib/drmtest.c                                 |   3 +
 lib/drmtest.h                                 |   1 +
 lib/igt_msm.c                                 | 211 ++++++++++++++++++
 lib/igt_msm.h                                 | 142 ++++++++++++
 lib/meson.build                               |   1 +
 tests/meson.build                             |   1 +
 tests/msm_submit.c                            | 194 ++++++++++++++++
 8 files changed, 554 insertions(+)
 create mode 100644 lib/igt_msm.c
 create mode 100644 lib/igt_msm.h
 create mode 100644 tests/msm_submit.c

-- 
2.31.1

