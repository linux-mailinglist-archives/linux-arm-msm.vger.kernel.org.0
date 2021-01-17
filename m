Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00A8D2F8FEF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Jan 2021 01:25:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbhAQAYk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Jan 2021 19:24:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726785AbhAQAYi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Jan 2021 19:24:38 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51AC4C061573
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jan 2021 16:23:58 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id o10so18768927lfl.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jan 2021 16:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Jk4A9FOCp2DyHnXydTrDuuZ1YyYaDOR8NdDMm+cUsI=;
        b=a+DTCqyrhAjbZAurA0t2Ty8uGwXfEgkKNcDoRSisJM2VIOqXwTKIVFp90KmzyvSxad
         S9VzI9pyCyUAxU567qAM0AhOBclY/z2JZopJgrCcJrDkevsNYljg+DQ01IxhxoJi3LQS
         rcySTUdpUT5EJmtj4hn/qZfn0EMMsis7AzlR47kTgxrjORVPiDSGyRqWl7cQropxe+7k
         +e+n3ABl3jIxD1/Mb9rTejnVcY/kHH+SA7NjL9kpFpSrr69zhpUd+ThryEk/kRq3ETAF
         zveBnVxUOu2LO1CoN1dipYmGPunBlBrllmsknQgg8ji4e6Bj1cho/OICVH7iitHhz6zY
         N1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Jk4A9FOCp2DyHnXydTrDuuZ1YyYaDOR8NdDMm+cUsI=;
        b=dcC/cKORD/RCziNBh+NfwRgPEAuM9iVTTRlLgrRFgDtER4XdNNX6Dw2rT3aJTB0kX0
         Utmreb7itDGORWHL/Ag893j9eUWWkCjf/wnz/1iOmcqS3LFWqDY//6M6DKwYZi3Rf0me
         7E1qL2+NU54+hJ1ghQP3vgtIqnxxuvrra3HL8Tq7OO4lBnPlo6W85WiGHw4xdC7WlfEq
         LMRShy/Ui2cuemmgbu5/XBYqCeORHAs8d83K9WLeFao3rE8jowvZRnchlyU8zQHg8r76
         Beef5rj943bKrZ6v8jKDCDLILdTpfpyfrSIX+OlkoFLYoVvro/vZDdvNG3e70Bynq1It
         OX9A==
X-Gm-Message-State: AOAM531IUOp6z4SabNGJWG2at2Qu5k8Anf/VSFXJvlk5J1nppApWvrpb
        UpoGBydwI+3Pf1JyjTW5QXxfE18pcYHetQ//
X-Google-Smtp-Source: ABdhPJztiPlj+sIVQy5p/4XKh8Ofta8tWsk+VZjL7nUft0CBVO9Ga8CALGyI94EiwwLbAf/JD40V+Q==
X-Received: by 2002:a19:3d5:: with SMTP id 204mr7994701lfd.21.1610843036723;
        Sat, 16 Jan 2021 16:23:56 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.101])
        by smtp.gmail.com with ESMTPSA id q1sm962468lfu.48.2021.01.16.16.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jan 2021 16:23:56 -0800 (PST)
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
Subject: [PATCH v3 0/3] drm/bridge/lontium-lt9611uxc: fix handling of EDID/HPD
Date:   Sun, 17 Jan 2021 03:23:52 +0300
Message-Id: <20210117002355.435860-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These three patches provide fixes for HPD handling and EDID readout for
Lontium lt9611uxc DSI-to-HDMI bridge driver.

Changes since v2:
 - Declare lt9611uxc_hpd_work as static

Changes since v1:
 - Split first patch into two smaller patches
 - Add Fixes tags

Dmitry Baryshkov (3):
      drm/bridge/lontium-lt9611uxc: fix waiting for EDID to become available
      drm/bridge/lontium-lt9611uxc: fix get_edid return code
      drm/bridge/lontium-lt9611uxc: move HPD notification out of IRQ handler

 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 41 +++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 9 deletions(-)


