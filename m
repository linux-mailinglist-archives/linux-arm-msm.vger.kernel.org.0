Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4D51CC15B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2020 14:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbgEIMjM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 May 2020 08:39:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726017AbgEIMjL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 May 2020 08:39:11 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F570C061A0C
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 May 2020 05:39:11 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id u10so1906051pls.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 May 2020 05:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=zz6Bha52VCZ61VoetFX6PmuaWb+O9/LCwGgsnXFAyiY=;
        b=Zhr8xkcT/iFzof+8Lq/M9MZn7g26C7RBMOmnVug1qXGSTBCXQnz/ChHs/kf5zBhZxS
         CUO45SVfyihUDzPPrW3YtxnkKJrULl2FOTQI6VDNEsK41/hpPXFB1COOP7fM24ckQmST
         a9dmXLIC2HllaOujQVp3/Q0s9f9oxatHZ/LjUGqDdNpF8EK1NvnPtwyZQ22B8IsIp9Sl
         HHY91TRuYwk9GHNIeg5zdUtQ6fmeV1PgGFeYiEYQH6uqVf/yLFFeXjUVsEjaX4iCdUOY
         Sd0RATJf9q/HYxWiBXznULNGDlcfwfkgt+XcLZsyp5CwSAeYbkpsFpTIAKZ+Ow+VIHdP
         njWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=zz6Bha52VCZ61VoetFX6PmuaWb+O9/LCwGgsnXFAyiY=;
        b=tFqxLGVXZCeSpyL/oN2lVfLvIIuU7flQYrnkYfT3NERrXvvojsBG0E8vu/jpqH+2Fn
         6Yi0BI4cFMu09WMmVql5FSZitV2hox+hspv4eNx/kZD766opYzCxbxIAyJw53cdK5b8X
         a0YQpZA8Jg0Ft5eKBw1wzxs1BNIS8V5XCCcIpaseCLd2QEq5HVc3nAsfanPetY2fj0wv
         ZKFV4Kpl8qt/7ciOSEquhIc1azBzLI2dzezC86BUiuV4M37iEET+eWQ9mBEfBTGJSy4z
         kNRdYh3qiiPe8e9p7zG6/MHQalEgZFCBF8CCmAieMvhB859p1wxcNJsD6p35OD6nr/u4
         c9Iw==
X-Gm-Message-State: AGi0PuYZ/zeNxQIpZjeZ6AlKBHZtxR1pKNbAhj12kP0AUq8rFQHe29sA
        2K1/wdGqLWqHA7iFFVE/9msm3Q==
X-Google-Smtp-Source: APiQypIDp6M2kg12boFEgMkHohjl3ZCmHkBzrqrA40GcGuCiJCUfA199wQAB34aIsB+rp94t27z9ag==
X-Received: by 2002:a17:90a:a012:: with SMTP id q18mr10307037pjp.220.1589027949364;
        Sat, 09 May 2020 05:39:09 -0700 (PDT)
Received: from localhost.localdomain ([80.251.214.228])
        by smtp.gmail.com with ESMTPSA id o6sm4447828pfp.172.2020.05.09.05.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 05:39:08 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc:     Brian Masney <masneyb@onstation.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 0/2] Add adreno a405 GPU support
Date:   Sat,  9 May 2020 20:38:44 +0800
Message-Id: <20200509123846.27932-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The series adds support for adreno a405 found on MSM8936/MSM8939 and APQ
variants.

Shawn Guo (2):
  drm/msm/a4xx: add adreno a405 support
  drm/msm/a4xx: add a405_registers for a405 device

 drivers/gpu/drm/msm/adreno/a4xx_gpu.c      | 82 ++++++++++++++++++----
 drivers/gpu/drm/msm/adreno/adreno_device.c | 11 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 ++
 4 files changed, 84 insertions(+), 16 deletions(-)

-- 
2.17.1

