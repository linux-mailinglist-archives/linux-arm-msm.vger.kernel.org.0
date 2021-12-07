Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D40F546C772
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Dec 2021 23:29:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236631AbhLGWcp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Dec 2021 17:32:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233241AbhLGWcp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Dec 2021 17:32:45 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC400C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Dec 2021 14:29:13 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id n12so1703654lfe.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Dec 2021 14:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tMJvV86m/ZeXgXgTnYzA2Z7tIMKoHvAbqCoassUZvfg=;
        b=SaZyruxCjfmMTKQ3ALXyShb0kwDg0MKN7K54apM4VaZqUmVv7HYqTTlSpoYa0QGmTk
         qr5PPp/k4j5M4LlSIGGah1zRV5Goixoukf4zK7o8xinPE9XDOCFxz8hb5oxZ4WRlDFHM
         +3mNA38J1lcLoqqwlaWw++tLn3kPiVCtzCAPGFx/PIUFitZcuGnYgbmPlR1a+e5cHDXp
         uVi/254IT0Aw2g3uxaaMTlecTVKMTpLX9HT2wQ7aZiKLaotoawSQ/7WUu+G2PLRAX2xa
         jk1aQLvrIYwV/NVR1FOzIgZRzrsetKEm0FS13WXMcY12dFl90H72FuOHTj3+OWiCjIE2
         j7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tMJvV86m/ZeXgXgTnYzA2Z7tIMKoHvAbqCoassUZvfg=;
        b=Ikke5jVAWr0IFmvYCB+D00nm9AdipKf18KSNPmzSNSRZ63PEUGQvwX9v0Yz0TtZySH
         9tLVbpqFFS7jwXP8hgrBMuEUy3+qcOHQexmXNDbHkqUyiSSKZ2UTDeHITbpLpjfdrF/B
         LvKT2nVPat4h4mCjjmg2p6HzCl9Amd4KvEpnYNEtaBzq3Zlo2mdnVO7IeV0V4gy2g57l
         d2yqvnQIDpGYSgEwWiUClBNtqn6YQ9oM6TkQQ1L1XamQ/JKnv30C4cf6UKuR1P1PtnOX
         p1y1twv+Kk0rIiUTLUE+9czjmpnpCenqHUAjzPBkT0celP088kOd/UyLpEakBqcBKkfb
         yY7w==
X-Gm-Message-State: AOAM533q5HSv+lfTO/U0bdKOQLUBY3k6Z+fG7zyu1y76IoAsQhwOx0gh
        /U8/Ikol3PStrUPdna8/9bKQFA==
X-Google-Smtp-Source: ABdhPJzfMVwZI18ytPow1qWZAobewkqQ9vJbmPpnSk9E2qaQQev90HlvV7+Tk+PsMoHFI+CXk2/K9A==
X-Received: by 2002:a05:6512:16a4:: with SMTP id bu36mr44052612lfb.255.1638916152061;
        Tue, 07 Dec 2021 14:29:12 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p22sm79423lfe.257.2021.12.07.14.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 14:29:11 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 0/2] drm/msm/dsi: switch msm/dsi to DRM_PANEL_BRIDGE
Date:   Wed,  8 Dec 2021 01:28:59 +0300
Message-Id: <20211207222901.988484-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently the DSI driver has two separate paths: one if the next device
in a chain is a bridge and another one if the panel is connected
directly to the DSI host.

The later functionality is already suppurted by the panel-bridge driver,
which wraps drm panel into the drm bridge instance. Using it will remove
the need for special handling of drm_panel and drm_connector inside the
DSI driver. With these patches in all cases the DSI driver will see the
chain bridges which either support bridge-connector or allocate the
connector on their own.

----------------------------------------------------------------
Dmitry Baryshkov (2):
      drm/msm/dsi: move DSI host powerup to modeset time
      drm/msm/dsi: switch to DRM_PANEL_BRIDGE

 drivers/gpu/drm/msm/dsi/dsi.c         |  32 +---
 drivers/gpu/drm/msm/dsi/dsi.h         |  10 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c    |  20 +--
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 296 ++++++----------------------------
 4 files changed, 61 insertions(+), 297 deletions(-)



