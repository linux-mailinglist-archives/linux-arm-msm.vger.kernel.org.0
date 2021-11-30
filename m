Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E18FD462931
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Nov 2021 01:38:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234139AbhK3AlY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Nov 2021 19:41:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbhK3AlX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Nov 2021 19:41:23 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1F1CC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Nov 2021 16:38:05 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id z6so13541220plk.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Nov 2021 16:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M6jA8oMIw0WKWHCuk49iV8tiF/OHiCn1/finUYhXsR0=;
        b=KVhdnnVCAHFsnPWTe8VbiVosUJrhlRWbOSYmJClKVCe+VaZ9aA4E3msky0yZkhPOge
         TzupGUhq4ZPtg7ADrwgLDGYCASQFORJMqNvPVcoQs0utulSImhgQObjvRJlGbjlb/Xy9
         oh9o2Hux8wQWaM56+sppx19SGsuIv3LV0xyvEq8ZzZdGO1OpomzqAoBZXjJBryYy4lEJ
         rFrmxptwAQTL1N0GMrjc11yDF0VH5UscoTYWSvRAVdlxaFM9oOMyanCoxCrQnNvnsYxk
         dCRk6JroPiKlcHOB+w1d6HyZ5tXZ5dTQu6kbz78D3XjFPneDl3YC4yx1o3FSWrtx6LR9
         2nsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M6jA8oMIw0WKWHCuk49iV8tiF/OHiCn1/finUYhXsR0=;
        b=QtZlXXfOa26GKx3BkMGQQWzzV18ZIAYvOvf6WLuAwWux42lPzC5u3zSElwB0OoPi1r
         9AYRWjNcUpKFP5KBgE5r4So6DhlXPt0DnQZ+W7nli61M/NZ9MC2z1havAnyRgUtoLYDJ
         Tn16sdJ4DxvVGhg2YL6wKBl1gBHPmNM7iWC2XynNmDouThrIsA8XcojprMF2pMmjKX0d
         W+zcISfwQ8nB6oYuSkKE8vt9Ihr+gi7kfVjqSFDHK5pNE98EVdFVg4r1vK31c7W4w1+u
         dWOcEPyl5w5M+Z6gOsfSPUYsFE+1mOGwq00iCafMIKpZX0oW2AbO3uoww9TAOJDEtoq/
         ixMA==
X-Gm-Message-State: AOAM531neHZrY0mIElHgOBJpA1+dO0v3HKBuCts7Xe69w+rGZm91C9mk
        J9foHQPPH75XAudBv0m1XsR6RpjWnWY=
X-Google-Smtp-Source: ABdhPJxr4vcGGEbi0ZQCjgz2Otn7VtmY0sJgzJyqo2TQplX3iJXsHGDpQ/KAc6UTGYi8vxdBYnqJZA==
X-Received: by 2002:a17:903:22c6:b0:141:fac1:b722 with SMTP id y6-20020a17090322c600b00141fac1b722mr64866311plg.23.1638232685180;
        Mon, 29 Nov 2021 16:38:05 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id c18sm19028535pfl.201.2021.11.29.16.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 16:38:03 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     igt-dev@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH igt 0/2] msm+lib: Add test for buffer mapping permissions
Date:   Mon, 29 Nov 2021 16:43:22 -0800
Message-Id: <20211130004324.337399-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

First patch just splits out a couple of helpers from igt_sysfs so they
can be re-used.  Second patch adds a test which locates the address of
a given buffer, and verifies (depending on expected permissions) that
writes and/or reads trigger an iova fault rather than succeeding.

Rob Clark (2):
  igt: Split out I/O helpers
  msm: Add test for kernel buffer permissions

 lib/igt_io.c        |  96 +++++++++++++++++
 lib/igt_io.h        |  33 ++++++
 lib/igt_msm.h       |   1 +
 lib/igt_sysfs.c     |  45 +-------
 lib/meson.build     |   1 +
 tests/meson.build   |   1 +
 tests/msm_mapping.c | 257 ++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 394 insertions(+), 40 deletions(-)
 create mode 100644 lib/igt_io.c
 create mode 100644 lib/igt_io.h
 create mode 100644 tests/msm_mapping.c

-- 
2.33.1

