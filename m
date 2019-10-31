Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 528ABEADB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 11:44:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727252AbfJaKoL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 06:44:11 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34116 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbfJaKoL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 06:44:11 -0400
Received: by mail-wr1-f66.google.com with SMTP id e6so3828463wrw.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2019 03:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7kyw+VrjIluOVETkrbPtQFePhVuk9mRrThavtM8H778=;
        b=c33HVydS3Hcq55X2NoEsiAtLP/MX+UF9BMh+RN46W8VCD73GzwJEklwd6CDGUxrIjc
         YKsT15/KIF/1LDiLLgRcrqKgErJuSazEGl01kWFM2/EdwFACjZU+sz5kOksindeSueFZ
         mjwdJDWG2hY8CTaNln7BWrSIUJcfQf0S27YXCQ91wm61etFdOqga6BILwv62K44rTBlE
         TciH1M6gtC/NndMakkNr9uOH702/LDxCjmAVFc8LAikwz2S9MmOPL33pP0oJnus2pqmj
         kYhoZ+JqmujN2YpktmS8xVI9pX2fGFW1TG5s2dUkFtWtPveGVlph/uYlMrsAaXV1LY1V
         RDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7kyw+VrjIluOVETkrbPtQFePhVuk9mRrThavtM8H778=;
        b=kJHnAt/GohUvwda+ikf+Ym3jndz6gnjDa5QwV0TBlI2I6P0iLIC0QARV3nzzEbC93P
         NAqvCil+cyF1BDk8eLvPz2lFHerx10rBs3DrhzPXLDzTnIe954KJ2H0FdqZONOPmfxFe
         c3GwrPbeQBEd8Cl6a06nzHmrCU4vpypoGpsdhtkuXrAOD6DZzLN8cRqg6nGtY7dnmjBG
         kI7uJbMJRjV1hPA7iKcY8FfptGTx6tIeek7ezAaXVbG1laRk2/DrUPhzZUyP3Kbujb3M
         +23Iy9ht+evsqB+4iDrKz9f4xZDDvhsgxD/eV7mRY2WJyrYsDQC+XV3YoIiRFgzju2RD
         L6OA==
X-Gm-Message-State: APjAAAUmLktdZoiVUMK3U0Q8sZlfuUifUKafdA86eJ7opbiJhtokFd7Y
        Ng9S4+fgePcgDRZpXrbJMBH5qs+r958=
X-Google-Smtp-Source: APXvYqxbYaS5sRyVAhsl7geY/EZw3oqStF/nVVJakRko/T4e9ztkZGbbDjq1w9/MAC6c8i/F1CydPg==
X-Received: by 2002:adf:e903:: with SMTP id f3mr5124031wrm.121.1572518648641;
        Thu, 31 Oct 2019 03:44:08 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id q25sm4141389wra.3.2019.10.31.03.44.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 03:44:08 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
        jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v4 0/7] DRM/MSM: Add support for MSM8956 and Adreno 510
Date:   Thu, 31 Oct 2019 11:43:55 +0100
Message-Id: <20191031104402.31813-1-kholk11@gmail.com>
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

Changes in v4:
- Fixed io_start for the secondary dsi phy on family-b

AngeloGioacchino Del Regno (7):
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

