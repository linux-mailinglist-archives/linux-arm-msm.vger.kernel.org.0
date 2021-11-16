Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAA0F4528BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 04:50:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235316AbhKPDxg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 22:53:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235248AbhKPDxd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 22:53:33 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C849FC06BAAF
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 16:25:31 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id g28so16004644pgg.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 16:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ovgz+c/G4HmT8RdtVZtP0zl3x+vOpNV/x6Tplf+zGMI=;
        b=jexPYtw+rlIyvblwu9Cd9zDPVKoA+4AUoLuy9gcaxmaUcXuhzuKrYP23OF/jnHs9B6
         Yh29WTXm0JehaeaPlnjxNzqImEZP/E1LxMwEZsw70KAHqHB2/HO6N/ivq46uQGjriwne
         wUXiHhmaIqRRllqLFDyuRgfgflTLqfMzpKwvbjVVn9A1fLG80LPtLZyJociuctNcKsD3
         byvU0d1yLwSu7IZXMFUVCQtKaiwuQNxyixG6U36ZB/sFPWCOUihBdcXTE2i+jNHTsTPg
         wT/wajfbPCnNrtlf1I+vfVPooz2TltuPOV2aq0xkQ/fYdC2tXZFs0DNTspb5XQgFAt8o
         npcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ovgz+c/G4HmT8RdtVZtP0zl3x+vOpNV/x6Tplf+zGMI=;
        b=ZkUfDgqcAKyNpOLZi7rqWP+QvZDcPe7tKterKmIugw5P0jxZQwcX1vaTWR08Cejvvh
         7vWSZl2AZZv354CqizQnSp38iH7BNeD16zp5uTzHZMK+zyM2VaO3isaiigX9YVoOZK2x
         FIQFV9k5K9BfzhxQcYvxz0VGV5oNJO4FTw98rpqPcFRR1/CWTnIV/pdNbnibvhcZhdE6
         08m9RKbJLLprOETttFFQKiIDf1MhdRjvxsPkATccEEKlcLDUm7cOetN6uwtGfefTZaLa
         c/9Rg2vyK+bjAXAwR57mINUU0zqVuSW+6FndeRNFfvf7LnccyIstvqGBnBqVqB68vv8s
         Ea5A==
X-Gm-Message-State: AOAM531kdLZGFYDDK/LLqPjAk9RatD2XQJFtKx+jxRwbKhIu8P0DrAdT
        n/ctlMpBgHFPjfXgO6Vxuyg=
X-Google-Smtp-Source: ABdhPJzqE0JSEFJhEcbnhbY5Sqk2LUEFII9yecnh0tfle2h9jmn0ZO5etbyYJoebmgR3UIZaO8UFHg==
X-Received: by 2002:a63:384:: with SMTP id 126mr2072546pgd.33.1637022331235;
        Mon, 15 Nov 2021 16:25:31 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id e13sm13093792pgb.8.2021.11.15.16.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 16:25:30 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     igt-dev@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Petri Latvala <petri.latvala@intel.com>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH igt v3 0/4] msm: Add tests for gpu fault handling
Date:   Mon, 15 Nov 2021 16:30:38 -0800
Message-Id: <20211116003042.439107-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
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
v3: Add helper to detect debugfs files and updated last patch
    to skip the one sub-test that depends on new debugfs when
    running on older kernels

Rob Clark (4):
  lib/igt_debugfs: Add helper for writing debugfs files
  lib/igt_debugfs: Add helper for detecting debugfs files
  msm: Add helper for cmdstream building and submission
  msm: Add recovery tests

 lib/igt_debugfs.c    |  38 ++++++++++
 lib/igt_debugfs.h    |  14 ++++
 lib/igt_msm.c        | 102 +++++++++++++++++++++++++
 lib/igt_msm.h        |  51 +++++++++++++
 tests/meson.build    |   1 +
 tests/msm_recovery.c | 174 +++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 380 insertions(+)
 create mode 100644 tests/msm_recovery.c

-- 
2.33.1

