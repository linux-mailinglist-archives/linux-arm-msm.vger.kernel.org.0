Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9F05D344
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2019 17:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726993AbfGBPoo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jul 2019 11:44:44 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:37352 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbfGBPol (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jul 2019 11:44:41 -0400
Received: by mail-qt1-f196.google.com with SMTP id y57so18967319qtk.4;
        Tue, 02 Jul 2019 08:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JEGJ7Jmmm4upED98C8kMEX5v02Mgo/GN/6JJfLKfS2Y=;
        b=beufamAHtcBoZt+Gwf86QpSPtt4WbjVUwHCf2J3m0/Ebb+ttFl5pzogaS/c+qjPv3v
         pBxg445g7S25YCjqZCD21hiVGf4r3GV2DfoZV0HCPb5Y0k+nsn/vP2ZX7RPUCroJ7E/2
         MP8z4inC06IWSaP1Yg9tkV6xe1nbciIh33iZrAJxgE1dzhZ1I+GMa0tjOZm2q6vx8GRB
         G3ipziXB7UDxBtjdYrV/w600Ndcm3OkRopY+Gn5fcrC3IXJjLvLKDbxSHzNtMyj9ZLa4
         qgscQ1owPKfAyORLW/xqf+nuvPkkEOjPpQfWTnjWaXbmR85AFbLr2JAn5uzAT7wpcOED
         kRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JEGJ7Jmmm4upED98C8kMEX5v02Mgo/GN/6JJfLKfS2Y=;
        b=PnZ3GtGqPG/oKf156RR2dpduNMw64svEbWaiXfVfz9jQJKDSb1F3wsT4k1viDovP0E
         VIcsCZDaGTwXOXeGbWj34lrXeunO9uIlDvLImyZyMZWvI2JW+nyduZ79Ad94bYHlcftR
         y786yVfzBZM9YZ5lnBzYPWWfj0VWPawaRm05prmjotm+HUn6pOCuq2jUkEqu3SRXn6ZQ
         JyOPftxw+58Ov6qO0NXxgNshdNLX+y9t3KS7vVP7hqob2rEQVrQ4vClMVnJY8r941/kd
         B5d/nMkKvajcUWXRyNuCP8qbrFUE1Qflb06ETqO/MNbs3bqrIyLFi5R7jP5UP6IFFzbw
         8+wg==
X-Gm-Message-State: APjAAAVkwRNS1wsIhKCh9JaTETHROgnEA1Vt43AL/sz768fZukl2OETa
        eTH/efXYI5qC1CbRn2rhCRs=
X-Google-Smtp-Source: APXvYqwrwmnTDvlh5LTDRzlineemj5kLLsGRS9iB6zoJcKryU4/iFBumhY4Vv/4jDgkmSlqD0v5qsw==
X-Received: by 2002:ac8:368a:: with SMTP id a10mr26019845qtc.143.1562082279992;
        Tue, 02 Jul 2019 08:44:39 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
        by smtp.gmail.com with ESMTPSA id d123sm6828508qkb.94.2019.07.02.08.44.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 02 Jul 2019 08:44:39 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/bridge: ti-sn65dsi86: correct dsi mode_flags
Date:   Tue,  2 Jul 2019 08:44:18 -0700
Message-Id: <20190702154419.20812-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702154419.20812-1-robdclark@gmail.com>
References: <20190702154419.20812-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Noticed while comparing register dump of how bootloader configures DSI
vs how kernel configures.  It seems the bridge still works either way,
but fixing this clears the 'CHA_DATATYPE_ERR' error status bit.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index a6f27648c015..c8fb45e7b06d 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -342,8 +342,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge)
 	/* TODO: setting to 4 lanes always for now */
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
-			  MIPI_DSI_MODE_EOT_PACKET | MIPI_DSI_MODE_VIDEO_HSE;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
 
 	/* check if continuous dsi clock is required or not */
 	pm_runtime_get_sync(pdata->dev);
-- 
2.20.1

