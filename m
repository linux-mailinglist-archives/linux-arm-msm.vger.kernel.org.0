Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B41CC44B241
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 19:04:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241306AbhKISGw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 13:06:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241149AbhKISGv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 13:06:51 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81838C061764
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Nov 2021 10:04:05 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id m26so88515pff.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Nov 2021 10:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5hZIPrBq+zl7CIYaIh9T3HI7tQDhLiof+jHo3mVyyRQ=;
        b=GLgQMw9TaqPKomDdx+OYzx0Xl3qywVMf73hCzSoZ16GF35CAaRovYCmpj29R/60qRF
         0dX3T4CagvN7tCCBc/W7HlNC2C8g5+aXb6VLVeQsLJoxeL1mkRC/mvuTs2/nuop5m99B
         SX8MqSvdL/spZgEpB6m0CLRi/Jcz08igAKg1jMy0yLWIwsgZFEFAZvHCctU6XiZMT5O7
         lgiZzZSFsJlOqtg8TJQRSauh7fyVu1TFFZ6/vMJ5dQbN6B183hkdtPK5DVrBG0nnuL9j
         S6DIxyh6QWgyt2EDyRYLlLZNxkbxR8rBrdPuHY943286i573uled3r+n/75P6hX9wWq3
         kc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5hZIPrBq+zl7CIYaIh9T3HI7tQDhLiof+jHo3mVyyRQ=;
        b=qXNkv2CWB9LS8V3re5bTrKsANxIhmwR2eJAhaL4hbhxO+KKCdDbOHkw10l1xlXhGLL
         ABzHEuZt8M4n0/pWBBNJKABsKCIDH8YnWvhq2iKj4rRETgzb1a+J2R1h1+GH/svSJlSv
         KD+Phzra7v68194nKR60ZNNmaSUnZb6GRa+fQhMr4GmB8/58zdu0YCyQwdDPv9dMJirS
         BxN3ig2ct7xosp9LE3KqLJmLoqyPYuMqHgOQ06+corVxFzQLhcYTFwPrOnNNTjlr4N1e
         HTAviX0+wra2NxpVZVoWr71wY67dtNEb2R//KRBiK7YMFlvk+IexGMG3nx1qXHqdmiQZ
         9R5Q==
X-Gm-Message-State: AOAM530AidxDeobC4ka2VqL7uIWDdfk7P5+fQnqevNazK9eCgUvkL2T4
        qy7G4n0msscjEePvMysKoUs=
X-Google-Smtp-Source: ABdhPJwPo1wYioUsjuKeUMWrLB9ZxJQm/+gE139zuHXR2cxOJEsLkjG2ZHAyCAHAAWQPOJpTWHimKA==
X-Received: by 2002:a62:b606:0:b0:47b:e32f:9ca with SMTP id j6-20020a62b606000000b0047be32f09camr9721807pff.57.1636481044819;
        Tue, 09 Nov 2021 10:04:04 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id t13sm15507771pgn.94.2021.11.09.10.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 10:04:02 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     igt-dev@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH igt 0/3] msm: Add tests for gpu fault handling
Date:   Tue,  9 Nov 2021 10:09:02 -0800
Message-Id: <20211109180905.590773-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

The first patch adds a easy way to write debugfs files (needed to
disable hw fault detection, so we can test the sw timeout fallback).
The second adds some helpers for cmdstream building.  And the third
adds the new tests.

Rob Clark (3):
  lib/igt_debugfs: Add helper for writing debugfs files
  msm: Add helper for cmdstream building and submission
  msm: Add recovery tests

 lib/igt_debugfs.c    |  16 ++++
 lib/igt_debugfs.h    |  12 +++
 lib/igt_msm.c        | 102 +++++++++++++++++++++++++
 lib/igt_msm.h        |  51 +++++++++++++
 tests/meson.build    |   1 +
 tests/msm_recovery.c | 172 +++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 354 insertions(+)
 create mode 100644 tests/msm_recovery.c

-- 
2.31.1

