Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 942C9BF06C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2019 12:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbfIZKxX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Sep 2019 06:53:23 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40890 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726817AbfIZKxX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Sep 2019 06:53:23 -0400
Received: by mail-wm1-f67.google.com with SMTP id b24so2063836wmj.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Sep 2019 03:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=edVq6toJYtTG1F9wGfOEc0Dk1VMZscjnLagdzkANlQ4=;
        b=PIu6pqs6DvVRWOC7lo0X0ctSHAZ30u/lCM4IA4tEeiLfx6xBsO7ZyZjDEYuzb1tsrO
         arkdPbRVfrBozBRs2QGpPLvxgHYUR1CegZeE2fqc2I5a1kZbNQy92VurQGKbS2GmlwGt
         /ixqttbBlYEb++l+mWbMeCa7JJCGKqW9R6CzSRjKrr1bRj4Syn5SPb8f7dra2FWkOl/f
         ci6HBoJ9NG8u5xq7hh+KNFty5x/TZ+V9H3+zHBCTma1KO5JYj73ukl5Y/L343zL1+uWo
         e5iBSxP7jKD/ugK3V/gYB0VtASWSU7pMBOLDdj7YHq6UqyC+Xc8ER/9rTA+78o+YDrz/
         DX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=edVq6toJYtTG1F9wGfOEc0Dk1VMZscjnLagdzkANlQ4=;
        b=OIrKfyv/Ml2/yjX5HgoUhJjes3OEgeQxo+Hp9MjBTRDIdvmgiXUVcbdBtAMv5hOj5C
         RsXTYEwaSwqkT4bM4MhXrhc0dxnTG7jqxdOEEWGkvJMsvjqv2R0FrYpZe8JOMrK192n4
         +ElXYBxFSqrx309j1y/U7DClSfn29M4V9p3mTpjOwdp/HdvBW5m25ioc54ZAkdJ0MFy7
         DYZUsyhP+1HJT4IijI1YKbmhtVmjgXoidYURVneocXg9+i4IxMR/gFENVD9+DKKU5cjT
         h74yXyiGPoWDBfyjXJfFIQebEXND6a4UtTXOpQPckzdJCMBoS4RotaCn6bpA9BWgUJ7k
         Pcfw==
X-Gm-Message-State: APjAAAW+nqhhN2FGr1P9sFmfBFTxjU7twlhbCp+oFMdmO5C+Qb7SRygM
        p6Vd9m+Z74AkzJ+ezLEjKp/shq3RMCA=
X-Google-Smtp-Source: APXvYqyUXjsRAd5bewdDGkceJIo2vtV19a4VCmE8yGuxHY0WGu2WNg/FtXqclOKryn8aOmIqfO48Ww==
X-Received: by 2002:a1c:3281:: with SMTP id y123mr2382966wmy.118.1569495200278;
        Thu, 26 Sep 2019 03:53:20 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id d9sm3468412wrc.44.2019.09.26.03.53.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 03:53:19 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
        jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/5] DRM/MSM: Add support for MSM8956 and Adreno 510
Date:   Thu, 26 Sep 2019 12:52:51 +0200
Message-Id: <20190926105256.61412-1-kholk11@gmail.com>
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

Angelo G. Del Regno (5):
  drm/msm/mdp5: Add optional TBU and TBU_RT clocks
  drm/msm/mdp5: Add configuration for msm8x56
  drm/msm/dsi: Add configuration for 28nm PLL on family B
  drm/msm/dsi: Add configuration for 8x56
  drm/msm/adreno: Add support for Adreno 510 GPU

 .../devicetree/bindings/display/msm/dsi.txt   |  1 +
 .../devicetree/bindings/display/msm/mdp5.txt  |  2 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         | 73 +++++++++++---
 drivers/gpu/drm/msm/adreno/a5xx_power.c       |  7 ++
 drivers/gpu/drm/msm/adreno/adreno_device.c    | 15 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |  5 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c      | 99 +++++++++++++++++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      | 10 ++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h      |  2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             | 22 +++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |  2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 18 ++++
 14 files changed, 244 insertions(+), 14 deletions(-)

-- 
2.21.0

