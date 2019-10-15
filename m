Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C43CCD72D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2019 12:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730051AbfJOKLD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Oct 2019 06:11:03 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40848 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727625AbfJOKLD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Oct 2019 06:11:03 -0400
Received: by mail-wr1-f68.google.com with SMTP id o28so476074wro.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2019 03:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5U0JO1qP/ANKXzSYDdvZ5hB/uH8vrGg9s4VuaxGlI8k=;
        b=px0zE08txAWOoOV+ackPKOW7lap1BgS+1XdkMGExn/FcoVQ9YJFDL2jBorPsud5b7l
         eQCwx5RB887uPk1kYtZbOohaqxB1yDnW9VQZeFGXkJmoSTKr1PkTOIJ5leJnT7XyOTkr
         tWm0L1lXCxIR9fLGZD1SW/IAs0F5/XraPW8cE2ODrvgAoINj/yk1lGYPKPuxzcLCwDeu
         WNJY7ENM+4k/+m8IIahEkqEdvt07hDRMGCuYUSGXOoQbPU6/QNqM3d4q9Cgt9lxUipB5
         m0qN/USJUnKOzbHmaZk4Zj+JG71sxLTWBUoAAEsIbQt1S1nZkhHuiqzyUBfJ0+tHvZex
         5wGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5U0JO1qP/ANKXzSYDdvZ5hB/uH8vrGg9s4VuaxGlI8k=;
        b=tEPjubOIcYPMaLO2F5vIW6bxkhnnFv8eG6XAiupz2Iwvobo6CQoduRge3g0xFnu//O
         L48BTi0uDgQyuqUcSmwhuhFte550M7HI3qNWB+NvhMGPU9IWzv6Axs06S0MRu6F+ZG3K
         diS50ddWrkn9EBxHwb1r+kyHG29z+wwYQ73tHpgciKlLCV5Bg2mpy0aijnrXURuA8EJ9
         ivJdJL5jXRfAgOALMDLKazUoM+EaZh34OI3/8iZyV2mBUl3X45BYXVzel32tIldbAH95
         fXwF8V9bXNgvhmqX/4VuvOLrIeGjR7lzuWpIn92FulMenzflJ4tq43D4nZYNTNbaJiaq
         J01w==
X-Gm-Message-State: APjAAAWsyYukRcYAKlP58ld6scuhXUhKPryLsToHi+Jg1+nhlj6OW5zj
        93NuRtC5Bk3357Utqi25Rfj9IwsOWAne0g==
X-Google-Smtp-Source: APXvYqwoU/NjIKAsBl9oD8Z2eI4Ypcw6Xl16JsD8B8p/Akav2sj23LCnVElzs5mwgCmM6+B5IercTQ==
X-Received: by 2002:adf:92a5:: with SMTP id 34mr28303440wrn.337.1571134261006;
        Tue, 15 Oct 2019 03:11:01 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id y186sm42778837wmd.26.2019.10.15.03.10.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 03:11:00 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
        jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 0/7] DRM/MSM: Add support for MSM8956 and Adreno 510
Date:   Tue, 15 Oct 2019 12:10:51 +0200
Message-Id: <20191015101058.37157-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

This patch series enables support for MSM8956/76 and its Adreno 510
GPU on the current DRM driver.

The personal aim is to upstream MSM8956 as much as possible.

This code has been tested on two Sony phones featuring the Qualcomm
MSM8956 SoC.

Changes in v2:
- MDP5: Documented tbu and tbu_rt clocks (Jeffrey)
- Adreno510:
  - Lower case hex where required (Jordan)
  - Direct register writes (Jordan)
  - Used gpu_rmw() where required (Jordan)
  - No mentioning of unsupported A5xx (Jordan)
  - ZAP firmware exclusions not per-model (Rob)

Changes in v3:
- Rebased onto linux-next 20191015
- Renamed MSM8x56 references to MSM8x76 (the reason is that I am
  using the 8976/8x76 name for all the other drivers. Also, the
  8976 and 8956 chips are equal and the only changing part is
  the CPU big cores count)
- Splitted dt-bindings modifications as per request (Sean)

AngeloGioacchino Del Regno (4):
  drm/msm/mdp5: Add optional TBU and TBU_RT clocks
  dt-bindings: msm/mdp5: Document optional TBU and TBU_RT clocks
  drm/msm/mdp5: Add configuration for msm8x76
  drm/msm/dsi: Add configuration for 28nm PLL on family B
  dt-bindings: msm/dsi: Add 28nm PLL for family B compatible
  drm/msm/dsi: Add configuration for 8x76
  drm/msm/adreno: Add support for Adreno 510 GPU

 .../devicetree/bindings/display/msm/dsi.txt   |  1 +
 .../devicetree/bindings/display/msm/mdp5.txt  |  2 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         | 73 +++++++++++---
 drivers/gpu/drm/msm/adreno/a5xx_power.c       |  7 ++
 drivers/gpu/drm/msm/adreno/adreno_device.c    | 15 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |  5 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c      | 98 +++++++++++++++++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      | 10 ++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h      |  2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             | 22 +++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |  2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 18 ++++
 14 files changed, 243 insertions(+), 14 deletions(-)

-- 
2.21.0

