Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE662F771D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 12:03:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbhAOLDM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 06:03:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725880AbhAOLDL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 06:03:11 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C70C0613C1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 03:02:30 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id b26so12537082lff.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 03:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wuEPYvb00THpcWPvzz3ksFPPsz4liNI0RttKCB7EHKY=;
        b=qblGbMJ40vMYbhKpQrbc4FsDah0X5QR1oAKbx2AISj61mog9czmL1Ny29KgmUFtLfg
         oBEquoAPcoA+9YVC6jk8uykwmsKCq+9xUCDMUtl+9QxlffLynKaE5U56kl+oFpm5vh3W
         X98p0hV8PIXK6NhCrKRKvxt++00JaQfMV7HexFMIrrVFZmJUOBI2wBrrfvRETTHKLdvk
         VFnSAHuZ39dUwmvobdQFs31GatK0kwfAbaq1FoqtTduHqDF0LV2hLco6pzmllrDyUF6Z
         AKiOcMMxRa+qBVKa1SW9yb/C8NFKTM05ZnqrUqxumFvVH5EK6k59LaGQ+WOOY1HSpOmo
         fytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wuEPYvb00THpcWPvzz3ksFPPsz4liNI0RttKCB7EHKY=;
        b=hY5uDAnuIpLjnmvjQcyLb0gkED8Q1ZhuwHxSMu+z3bve6cz7cj0QQLMIuqgm3y/6eA
         7B3Srk5l9fhWQus0BtTMPbNRmCpa5oTFcKIJB0cuH8dbT2ehZu5i9kP7GYQ9GNT7/xmz
         miPJFVSlEUVFPBSmVTZtX+wMco62kLhQXmSwufI59sph1q2GiFUsIJs3h+CdUECClw/g
         D6gyVmNOrzeQYmPWmHgWHaLV2kpHRhUiUi1j6pdYsXZMkXBsyIBWo6HA1jZrRqouGN0+
         6jiMhLZaIPvA6ENYUSHisG/bt1G4Hb7DpYeL4wnBCGQn0zXfEaHXLNfGpYOymbuc+wbM
         MkoQ==
X-Gm-Message-State: AOAM532F9QQcm4S8/GCZgVbPq59k93+6OUa70U7HVE5I2Z2h4EJvoepz
        tRzfd6lFyA3bLsA+kik6xMfJnWAKehsu7AbnfLU=
X-Google-Smtp-Source: ABdhPJzfiAqGTsgOfZLr108bLa/ESd5SXHVFC1VycR/CoM4O2zuxVK03H0BRc1A76LoxnOfVBmpB2w==
X-Received: by 2002:a19:4f4b:: with SMTP id a11mr5352739lfk.579.1610708549480;
        Fri, 15 Jan 2021 03:02:29 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.106])
        by smtp.gmail.com with ESMTPSA id s8sm862020lfi.21.2021.01.15.03.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 03:02:28 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Vinod Koul <vkoul@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 0/3] drm/bridge/lontium-lt9611uxc: fix handling of EDID/HPD
Date:   Fri, 15 Jan 2021 14:02:22 +0300
Message-Id: <20210115110225.127075-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These three patches provide fixes for HPD handling and EDID readout for
Lontium lt9611uxc DSI-to-HDMI bridge driver.

Dmitry Baryshkov (3):
      drm/bridge/lontium-lt9611uxc: fix waiting for EDID to become available
      drm/bridge/lontium-lt9611uxc: fix get_edid return code
      drm/bridge/lontium-lt9611uxc: move HPD notification out of IRQ handler

 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 41 +++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 9 deletions(-)

Changes since v1:
 - Split first patch into two smaller patches
 - Add Fixes tags


