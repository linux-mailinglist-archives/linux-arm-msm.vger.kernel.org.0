Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F24D379E22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 06:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbhEKEUC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 00:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbhEKEUC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 00:20:02 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74406C06175F
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 21:18:55 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id z3so16652472oib.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 21:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2gAze/d2HhwU52kaGGE4CzwuF8hxkdmKXF6fTfpRgJQ=;
        b=xmPruj5Ol/5WVN+yg0dvis7WQJmqsskkOQ0V8qsxI0yXHWqWDa9cBRQyq1omDx7FBf
         9VNiG51IuqfoS7lSSdTuGtqI4EaphhEdBZK1VDMLI6a+kCEt7T6k+ZgONxAlJY1fG11U
         F8O7mDI0BI2AqeQWvCGe0QA1+lJByPrqBz4UN7psNR9gBJ3nFKkjgsTGl+3sC/b7MVrz
         +Odz88CUWt52iLTrv7HmcldOjyrcDMg93pwRGOzDfMDIDjSuX1r75HuKEuLTygxhOm7g
         mGBV9IL1lxk2G05njMZBUEPW6jyipYR0hl22FvNJqDsq5rub9AM+CPMVkbGyXTJ+t9ew
         yZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2gAze/d2HhwU52kaGGE4CzwuF8hxkdmKXF6fTfpRgJQ=;
        b=lgttY/pkRYmVNA7SyOAFa4XyVql3+aPERUWMuzAKo4EMpvAYoL+Z1LIyFS5ynYLn/F
         KQYqp+XPCCIsj3ihi+LVnr/x6RFQFvl459KCZAINKJPxRCesfqWbcxGLcXPjXvZkEMME
         ZhuoWnbWypeehsgAMhA/TuGj9ysCYlztQx+/LBHbpB4rPbeGe3fM6erIggLRsMDcKyJ2
         641Sx/pP3oHWmiXi5SARprVlgnji61QeOxZwFvcZJpxUjrx7VC753nVz/Z+GiVBVVNgw
         25EEViZiI6QNlwp1ibBrqaXPeryTom5G1wGX+GuwUbb5XEry8b8oBP5u/FgtVgSaOlMd
         3+Zg==
X-Gm-Message-State: AOAM530r03qTbxPM1CCtmalmc4pVwHQa63PbQsKBWGcYybt1j/f2qFdg
        PHUaokYCa6vsXE3rmD+ZCd2NIg==
X-Google-Smtp-Source: ABdhPJwZiSJpC1yfaFwq6I5I/qh9ChuguphuwWx64P5vFbYL1sdXIvh2ElBMbSY45mAtxgT6MDw1cA==
X-Received: by 2002:aca:f5c7:: with SMTP id t190mr1954043oih.67.1620706734899;
        Mon, 10 May 2021 21:18:54 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:e623:42c1:10df:adff:fec2:f1d])
        by smtp.gmail.com with ESMTPSA id z15sm558647otp.20.2021.05.10.21.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 21:18:54 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] drm/msm/dpu: Qualcomm SC8180x MDSS/DPU support
Date:   Mon, 10 May 2021 23:18:48 -0500
Message-Id: <20210511041852.592295-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These patches adds MDSS and DPU support for the Qualcomm SC8180x platform.

The platform supports running 2 pixels per pixel clock cycle and the bootloader
enables this, so the first patch adds enough support to the DPU driver to
disable this again.

The second patch shoots down the data path configured in CTL_0, as the DPU
driver picks CTL_2 on the laptops, causing graphical artifacts.

The third patch adds the SC8180x to the hw catalog.

The forth patch is included for "completeness", but needs to be reworked. It
updates the IRQ mapping for INTF_5, which is where we find the eDP controller.

Bjorn Andersson (3):
  drm/msm/dpu: Introduce knowledge of widebus feature
  drm/msm/dpu: Clear boot loader configured data paths
  dpu: hack up the irq table for 8180 intf_5

Rob Clark (1):
  drm/msm/dpu: Add SC8180x to hw catalog

 .../devicetree/bindings/display/msm/dpu.txt   |   4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 121 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   5 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |   4 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  36 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |   8 ++
 drivers/gpu/drm/msm/msm_drv.c                 |   1 +
 10 files changed, 188 insertions(+), 11 deletions(-)

-- 
2.29.2

