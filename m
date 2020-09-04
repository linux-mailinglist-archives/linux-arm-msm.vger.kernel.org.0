Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CAFC25E0D5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 19:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbgIDRaI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 13:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726938AbgIDRaF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 13:30:05 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 052EBC061246
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2020 10:30:04 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id 60so5190122qtc.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2020 10:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DsXwsK4zCY7HkfSZjqg83ys549zTUY/sWT0C9/KbzMc=;
        b=wn2eFHmE1kWbL2a8K8Yh+La67pFCOUsumdtML9qwrvWmq+yGf8nat6Qh+6sMJkEA8e
         sq+oefUn+dYVfq0NzuFeab96xkK+5E4EfjJHloESInKi/fg91TCu4/F6vbtGlLWLD4eR
         77i8FbuucNnLVjYwQ6yy8uHQhC7Swb2QqhPH4IZiwNfTpTIc9PFtuYl9li7QEneBtCF0
         YX4kLuhatJjgHf1OdeaKm+I8b4oPmHDaPmRhkz9KvRtIVRYSvaE5F1QcYTNeytaibc+U
         MfLIA9JMlDAE3fIOGTmyu4Td3L+ctfG1jsBj1+xrTSspKo4ZJd/UB+gG4TtpAu8pydVj
         bQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DsXwsK4zCY7HkfSZjqg83ys549zTUY/sWT0C9/KbzMc=;
        b=JPRvKuj5JIdjXq0pOkAuChytqeMQM7x2pdoFPe2enLy24esKZkq4ASZfIzGoP/loZS
         stafqhUcBU8JLhqHXiFqrN9BWxdmYtpZwmyfodKS25CBkgLfKYHTKFvPMwd3mZnj0wB1
         cNCdqpnc53i4NpH21AWqaCxFQljvWtzkNZZ4YxxmuzNWebXnVqOjeqLlpqk2Icu5QYI/
         4vn5HPCP3um+WDw93wcZjGNRQtzlivCWSM8RKdG4C+bwa/Xxj9uMcbJdLljjNW89QBsa
         CAlhjaLT8Qhntp9iDbAPl93jMyf5wpurgA/8Rqu1YRxJkVASvpNwh9VrNbiwKHPxtVWj
         JdMw==
X-Gm-Message-State: AOAM533LxBccVnGmproedAUOInAN1lFZFVNRslzYBAJAXynlEo0c+i8Y
        HWE+VRsq2La8YZcv2000H9eKFA==
X-Google-Smtp-Source: ABdhPJwqgJ2k4b0aRGXeq53bb2KuhyjL7osl5nkksXjBIvFgVuAWNuDStYVzQTlFUxGZYemuzcTynQ==
X-Received: by 2002:ac8:b46:: with SMTP id m6mr9497558qti.72.1599240603664;
        Fri, 04 Sep 2020 10:30:03 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id i66sm5103330qkc.63.2020.09.04.10.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 10:30:03 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), Harigovindan P <harigovi@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Krzysztof Wilczynski <kw@linux.com>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list),
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
        zhengbin <zhengbin13@huawei.com>
Subject: [PATCH 0/3] drm/msm/dsi: support SM8150 and SM8250
Date:   Fri,  4 Sep 2020 13:28:35 -0400
Message-Id: <20200904172859.25633-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for SM8150 and SM8250 DSI.

Note I haven't tested SM8150 recently, but DSI is almost identical to SM8250.

Jonathan Marek (3):
  drm/msm/dsi: remove unused clk_pre/clk_post in msm_dsi_dphy_timing
  drm/msm/dsi: add DSI config for sm8150 and sm8250
  drm/msm/dsi: add support for 7nm DSI PHY/PLL

 .../devicetree/bindings/display/msm/dsi.txt   |   6 +-
 drivers/gpu/drm/msm/Kconfig                   |   7 +
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
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c     | 902 ++++++++++++++++++
 13 files changed, 1721 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
 create mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c

-- 
2.26.1

