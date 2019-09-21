Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA11B9D42
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2019 12:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407316AbfIUKEr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Sep 2019 06:04:47 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39706 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405581AbfIUKEr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Sep 2019 06:04:47 -0400
Received: by mail-wm1-f67.google.com with SMTP id v17so4471257wml.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2019 03:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cl1hamWbYxOuqKv9OBA2dHu0ppphIuXvwxXH4x2FRcU=;
        b=pu2nEBk4lTAuoP0k3DciFPKz5zwXCqh6cZaKU3EBkFrW/o+ubfIJ/1lOfBopDd0m0j
         wImF0D/5tZeJu7vXp6Zz0Lmv2My3978tkgstO2/0TE+PnGkdSUuQEUcCR1SjxJjEjBu1
         2wes3YmAT1VRdxsUrO5oHCwGXTRY/hMBOUJBwfucDz3Bc/4V/tQ5ajgHqe2XDx3kOgbN
         h21X8zuRf5y89KKaIgmqc8IIzeUkC9N7LRoiYCyEjPIHErLmGnf9CKPbhSQmMGgoURRo
         NRxJaD+Tv917Qa7FHkIoAh6xv//huXOheGoPFwnnGs486/r0gU24A1rFnzKMOn0TQRiv
         sITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cl1hamWbYxOuqKv9OBA2dHu0ppphIuXvwxXH4x2FRcU=;
        b=S7WUuT180/S3BCxonbN8LiJ5AUJvYYY1bND/aYXPqIBSCrpKUunRD+87oIsiyW77O8
         fRYLwMvcfB4GTrgFAFuqgWpQgxEaAZKkRZKw9nTmKgaEbBN8PwUCEsYKL0CnAGi1xLLF
         5Jq/EQ6vcAf0dvFJHs0exib6mZ6boVIMpLx+L9z/6s2JrwOdChUJp6TwAH5v8U2rCnal
         r+n48cPae0EP6xMUVxLtUezYZMPlgqdYad33n4nG7IuGx8xikd1+DUV1oWq4isnv99pz
         qR+QDmCic0vgdmi/EpeQTXiz5nXgQXsYSICVSL2NBVIFVjZm66EZMXxCEmKwtlcj/wID
         407g==
X-Gm-Message-State: APjAAAXSiKWg4dQYd/wHx9VLeua/5fDTUWYLfMa2ZendoQGw0kg1b2KK
        udBxKf2NQlip50l5j9MiSxLAwj2dtB4=
X-Google-Smtp-Source: APXvYqyMhT9AaSzDWVV2IXTpsqJJlTW9olrdehI9WtSsgTzKyDofKdram2crCjy/HFZujgXSK/M/4Q==
X-Received: by 2002:a1c:98c8:: with SMTP id a191mr6466479wme.17.1569060283313;
        Sat, 21 Sep 2019 03:04:43 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id g1sm3963575wrv.68.2019.09.21.03.04.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Sep 2019 03:04:42 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
        jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 0/5] DRM/MSM: Add support for MSM8956 and Adreno 510
Date:   Sat, 21 Sep 2019 12:04:34 +0200
Message-Id: <20190921100439.64402-1-kholk11@gmail.com>
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

Angelo G. Del Regno (5):
  drm/msm/mdp5: Add optional TBU and TBU_RT clocks
  drm/msm/mdp5: Add configuration for msm8x56
  drm/msm/dsi: Add configuration for 28nm PLL on family B
  drm/msm/dsi: Add configuration for 8x56
  drm/msm/adreno: Add support for Adreno 510 GPU

 .../devicetree/bindings/display/msm/dsi.txt   |  1 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         | 87 +++++++++++++---
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
 13 files changed, 258 insertions(+), 12 deletions(-)

-- 
2.21.0

