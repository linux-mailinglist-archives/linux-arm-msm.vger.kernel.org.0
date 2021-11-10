Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4AE944C6CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 19:37:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230400AbhKJSj6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 13:39:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbhKJSj5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 13:39:57 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D51C061764
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 10:37:09 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id np3so2282400pjb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 10:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fTqyXg15VQ6Usewdg3YZaLywhlttYK7TtczoWmiTCj4=;
        b=G1nZAjLdj5VAs6N6FkuhGu52Xu+4W96O2qk/fBNZO0D4l85Zr24Ir8RfkezRNW2j3U
         q4hwtLgB5bUvnKi96cMPDHzo3Cw8UboD1mPecViRFpvxXP69lQxBcoVi759sa0r5TTNX
         5zAiLz2Ne+LgeDBnTb4eJc+lip4t5X6zN3mE9QMzcXYJkwPbbzRlUtlSLtMyPybyKA2s
         ay1DGI73wg7/kFrcUF91vVRwmMI4WiBaxdc5x7ybZeeBvt0nPhnC0CwjtyIDNAyyDjTM
         1jLEg0wzaPZfu1LwTvFPlaPsjqbf7dt6g2EI1ShYAehv05/z0iHkSBjk4x1+ks4y9CI0
         T7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fTqyXg15VQ6Usewdg3YZaLywhlttYK7TtczoWmiTCj4=;
        b=HVArSBPTUAiNuigf+4WKNXP6A5jFOWl83O4OWtGACy6FSo5OjmA7Xg7ve5fnTr63rp
         zb85t6Sa0+nR5SFOTZ0RZciWw7hlarIxtulBj0wIVipkwrcHnPAJXSyCzcNXCXYMq9O+
         x1kHLA2wJoTcXM7Xl77x7l+MU/4YVEEpRcN+Cm0LWMFsxTluAIOHVX3pA67/KSijtDRp
         eUudTxhjIOGi11PEFayFWtDU5wv/Euq++H0XJp9+lftP+wQ3ViUKVT7KTZHAOtYoSIZo
         Le4eJSTWanz41bFmIJQXzgAgyHYrD7Dl2TYRml948FALfe/FdrgnuDJhrYURhL1F/C5u
         wKGA==
X-Gm-Message-State: AOAM530oda1cnV0ZVrdL8Eb8ucVMXumL3cHV6kIHbIYOCnsRAGKyFvY9
        PoucxMcSXjXm8Ki1qcj4Gn8=
X-Google-Smtp-Source: ABdhPJy7ooc2BPjtBlaQOp8ySkSMhDHZ8t0r3JquEM+e95v2iYBmMLIveyhm3NKIEFAglm0BzwX3ZQ==
X-Received: by 2002:a17:90b:4f86:: with SMTP id qe6mr1139272pjb.198.1636569429333;
        Wed, 10 Nov 2021 10:37:09 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id s2sm260067pgd.13.2021.11.10.10.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 10:37:07 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     igt-dev@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Petri Latvala <petri.latvala@intel.com>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH igt v2 0/3] msm: Add tests for gpu fault handling
Date:   Wed, 10 Nov 2021 10:42:10 -0800
Message-Id: <20211110184213.649787-1-robdclark@gmail.com>
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

v2: Fix headerdoc comments in first patch

Rob Clark (3):
  lib/igt_debugfs: Add helper for writing debugfs files
  msm: Add helper for cmdstream building and submission
  msm: Add recovery tests

 lib/igt_debugfs.c    |  17 +++++
 lib/igt_debugfs.h    |  13 ++++
 lib/igt_msm.c        | 102 +++++++++++++++++++++++++
 lib/igt_msm.h        |  51 +++++++++++++
 tests/meson.build    |   1 +
 tests/msm_recovery.c | 172 +++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 356 insertions(+)
 create mode 100644 tests/msm_recovery.c

-- 
2.31.1

