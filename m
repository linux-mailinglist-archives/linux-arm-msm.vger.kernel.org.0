Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7209B26647D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 18:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbgIKQk0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 12:40:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbgIKPLc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 11:11:32 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E729C0617AB
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 08:11:22 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id w16so10175646qkj.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 08:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=euZWKDvSLszOg3hns89zvMgi1tbxQv2avHZee3eJ2yI=;
        b=qBfjVizj8aDJByTIWD3AlHF0vazq0JRzEVHnlyJo5/NIS5vzxEDvesvDkS72qQWYZn
         NcHjjsrCA9ZrOnv4cdzT1ApxtC9g+Wa0KpngbWvHSEWfCNfWKbE2HwmmNsGCn11In6Dk
         WFzaFFM0REfbH2QJmlGpa5PHlR93uvWgHAZOV7zqPKT5y0RI5twXPrkHBTGKhxLMp+BN
         0tn6myKDKpvS+YDQVHVxIoB8JzgE3bACjYysEB+rfFCdsGbBVjc5L+HVhvYjLFN5RQUt
         hgGyx5kOHUpNaKrCUigwruBDOHKNfvPXy4H8FMUXjNrUmHht2a2Hak+TZCmavDVaS8WR
         DoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=euZWKDvSLszOg3hns89zvMgi1tbxQv2avHZee3eJ2yI=;
        b=o0dbHVILtjRK3vW81nFykIA0FyELlJg5SxA4SNW77L53Ho2Z+6+Bo5Dh2BU5iMXgz2
         UBVRR0L2nK1l9avGpLGb9sDbuMC5o+FN6JsKj6Ptc4ZE57jMZFOimCiSSaXTYaGwUTtR
         9Raujf0Q77SthTOnRQ0qXNr/HFqqxkTaU/8M0nsFm2eT+5X3fB7APcloSrIVrdyUWR8j
         /LqY+Ja4H9SGgY9VCcmWsp3bFLrlgVPaeM+5xdd31p7yqBCZX8k93x6FfoTT/LYMlbLT
         hNKmlkldm3ysp5G/KbtvA5F1DWBmOK5QxqtUPy4V5TJK12KBUVzpv+OMq8f051BAQkud
         feng==
X-Gm-Message-State: AOAM532+iA89DpVWl+EHTtNW2FiMejud2wUmmvQJeR0UDIe1gn21JiFE
        8PebNj+hlQ5wbZ+kkN5Kl1+y7JuUaTCwOdqAYU8=
X-Google-Smtp-Source: ABdhPJxfmWCOR7Q2dKc0X3lEWR4RYf+Baz8OuO11f6wPmq3V0V15Oe2aKlOQbU9BaEuSm32pNlc/VQ==
X-Received: by 2002:a37:bf43:: with SMTP id p64mr1862870qkf.24.1599837081212;
        Fri, 11 Sep 2020 08:11:21 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id 201sm3216429qkf.103.2020.09.11.08.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 08:11:20 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), Harigovindan P <harigovi@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Krzysztof Wilczynski <kw@linux.com>,
        linux-kernel@vger.kernel.org (open list),
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
        zhengbin <zhengbin13@huawei.com>
Subject: [PATCH v2 0/3] Add support for SM8150 and SM8250 DSI.
Date:   Fri, 11 Sep 2020 11:09:36 -0400
Message-Id: <20200911151001.13156-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Note I haven't tested SM8150 recently, but DSI is almost identical to SM8250.

v2:
 - added workaround for 5GHz max_rate overflowing in 32-bit builds
   (based on robclark's suggestion)
 - Updated Kconfig option to mention SM8250 and not just SM8150

Jonathan Marek (3):
  drm/msm/dsi: remove unused clk_pre/clk_post in msm_dsi_dphy_timing
  drm/msm/dsi: add DSI config for sm8150 and sm8250
  drm/msm/dsi: add support for 7nm DSI PHY/PLL

 .../devicetree/bindings/display/msm/dsi.txt   |   6 +-
 drivers/gpu/drm/msm/Kconfig                   |   8 +
 drivers/gpu/drm/msm/Makefile                  |   2 +
 drivers/gpu/drm/msm/dsi/dsi.h                 |   2 +
 drivers/gpu/drm/msm/dsi/dsi.xml.h             | 423 ++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |   5 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         | 102 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   6 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 255 +++++
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.c         |   4 +
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.h         |  10 +
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c     | 904 ++++++++++++++++++
 13 files changed, 1724 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
 create mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c

-- 
2.26.1

