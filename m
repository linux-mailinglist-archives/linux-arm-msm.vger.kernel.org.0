Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8E55412B94
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 04:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239876AbhIUCUV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 22:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236892AbhIUBvj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 21:51:39 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B33B9C0363CC;
        Mon, 20 Sep 2021 15:53:26 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id n13-20020a17090a4e0d00b0017946980d8dso552965pjh.5;
        Mon, 20 Sep 2021 15:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SVS+ocUKu9OsVC90CLv74eixl2aJmx8d2sPxrzZwEjQ=;
        b=NPywaaPdEPnB5ULpVEMSkN7lBLfW6U/xsPr4Punnrmt4p15v3pDblNFSWYCl+L2B0C
         TmqLUxUpmswDb2kSEKUxd+0YMRzI14+l6Kihcy1kwng4LYG5cvKTR09y4B5aLCIC6Eqm
         HeVvU/ODqHMae+XapUoypIVGkdSGXtgc5By+xTzub9/mV9D7yGlZS8i+5nzJP6PfrIaD
         D1lzL8eeFda9N+GG7A9lQruYkJTynIs1dLy0iC/IxGa0GNeUIjY85u4diQ1cH3na+2cM
         9jDhXg0W62iaY8lOhEZeuERbwW7/VYmUfYBFzXzaSJwO3emF4Nd2naN4OVQPN7Nw0Wkx
         bIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SVS+ocUKu9OsVC90CLv74eixl2aJmx8d2sPxrzZwEjQ=;
        b=G2k3YenVabsvO1vbonjPJwTR9Sq7gLKe1bqiFd+9/6cFIlddkPF4n0CFq8RrP0v0wB
         cqhjoA5GR74pGvVmjbdOYkGM1TMzeIyP0JMk6LwKQpa8JUNAuXiIX6uYlwP7bz6vErJn
         MGMz8mHTGYmH/7VKbpXeE4/SE8cOPgZMx8Dg2TGagwFeKioYsB1AWf2AV/gPA20juf8t
         nNpIUGFspRqph9aXaeyKp8vnWBWCNfGISn05jwvcMkCArvn465BK1PJEZfYCCTbeq7O/
         5Pq+8SXYrzn44YV2ltq1JCwFXZ3ODZD8zCRWLd6zWVZx31l32bnozUMqSLnILtPy72KL
         9ggQ==
X-Gm-Message-State: AOAM531grm1MkiRiHEZ0QzgoZYmUCbgHJccSTq/4ZI9vekyg0D0bCyB3
        peRbH69w+xX5l5YCJi66vtU=
X-Google-Smtp-Source: ABdhPJyMUNo7bWL0o9QPli2Tnmp31Rrp8tpUQiK3z6pqgigCKp+UtgjZf0Qqn7KKfYsacV9F1ws2fA==
X-Received: by 2002:a17:90a:4d4e:: with SMTP id l14mr1582077pjh.4.1632178406178;
        Mon, 20 Sep 2021 15:53:26 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id w22sm11535607pgc.56.2021.09.20.15.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 15:53:25 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 0/3] drm: msm+ti-sn65dsi86 support for NO_CONNECTOR
Date:   Mon, 20 Sep 2021 15:57:57 -0700
Message-Id: <20210920225801.227211-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Respin of https://www.spinics.net/lists/linux-arm-msm/msg92182.html with
the remaining 3 patches that are not yet merged.

At the end of this series, but drm/msm and ti-sn65dsi86 work in both
combinations, so the two bridge patches can be merged indepdendently of
the msm/dsi patch.

The last patch has some conficts with https://www.spinics.net/lists/linux-arm-msm/msg93731.html
but I already have a rebased variant of it depending on which order
patches land.

Rob Clark (3):
  drm/msm/dsi: Support NO_CONNECTOR bridges
  drm/bridge: ti-sn65dsi86: Implement bridge->mode_valid()
  drm/bridge: ti-sn65dsi86: Add NO_CONNECTOR support

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 64 ++++++++++++++++++---------
 drivers/gpu/drm/msm/Kconfig           |  2 +
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 50 +++++++++++++++------
 3 files changed, 81 insertions(+), 35 deletions(-)

-- 
2.31.1

