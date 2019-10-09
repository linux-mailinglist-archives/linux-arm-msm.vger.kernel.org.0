Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96F22D1AFE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 23:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730675AbfJIVfA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Oct 2019 17:35:00 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:32939 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728804AbfJIVfA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Oct 2019 17:35:00 -0400
Received: by mail-pg1-f196.google.com with SMTP id i76so2272045pgc.0;
        Wed, 09 Oct 2019 14:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=93XeND10daxMH10mUwFpx+iBqyMkuxVptnzWDGZ5rAE=;
        b=t9EwRTa0xVN+CnzMK1VtNToY63kjkFdBHNGmDJKvSh5OpWOkXi73cg74gjLP3/zpE9
         8hDObmZpCkDo7ajMaDTaC0YqBqm/gLqP/YWhIZtuNWsiIUm4xXYrryOSGFhNh+4sEfcJ
         YrzNkCeLcHwbWrDTGSE02GDGEfL6uYCHwZYH0Bnx7cedasuYNHoYp8tEsYkW8LOrUeR8
         qs0gVgJeN1yLXWsHHBJgI6UBnJAZOTMAwEjaNQoClUyj5wg4SX9ZXiJoQ2HcsgDqG/mK
         VyQ+caX2EITecNehpw8oXyriS+EHejuw9GUEOLGzfH7reWdxnj16hHMXmhKKJSep448w
         QJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=93XeND10daxMH10mUwFpx+iBqyMkuxVptnzWDGZ5rAE=;
        b=hGcS3eWkJpIe5s1RparBe4PqHTzzGP0h/2DUeq+DJpdzh5DPZ4Sxmw2GB1yGmoVdl9
         LK96TGxfS/xitgYCeF4zPCGdOXQpElBSCll/JK9OGoMtk2Kv2ZaabnpAk9wiH28ddMLx
         +H3cz62dVpL7G36gXpBW3BAsF1YIw6mwFH6fJQHnI74FkM+0wu1Ke+rXF6m23TmF9Mf+
         r71gpbB1H7TRW3cAEZeYX3fkDBManV6+Oeuamho81qIdfaojLNMkyVL72tBD9P7u4fJ5
         z80DCyjZDaK4elHNnroQ9WCNoI3IPJ9L7ssVZpEyvrcJpWacDrUiS3s8Wi3ShPe7+EBB
         AtAw==
X-Gm-Message-State: APjAAAWULsNbXn7HfyGKFx1/vhaxXMFhsmn01Bn0OtsbQ9fSxSOzp2C+
        oWL4loIpvBpTkiDIoGwnzBrfInfH
X-Google-Smtp-Source: APXvYqwrTT1N5CbtoW7bGcow975hWrDFM7VA+ZKxMMKBQH74XTjBbjGPFN7q5ngTfy00REM0jSRMPA==
X-Received: by 2002:a63:734a:: with SMTP id d10mr4055370pgn.334.1570656898956;
        Wed, 09 Oct 2019 14:34:58 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id h4sm3336017pfg.159.2019.10.09.14.34.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 14:34:58 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] drm/msm/dsi: Implement reset correctly
Date:   Wed,  9 Oct 2019 14:34:54 -0700
Message-Id: <20191009213454.32891-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On msm8998, vblank timeouts are observed because the DSI controller is not
reset properly, which ends up stalling the MDP.  This is because the reset
logic is not correct per the hardware documentation.

The documentation states that after asserting reset, software should wait
some time (no indication of how long), or poll the status register until it
returns 0 before deasserting reset.

wmb() is insufficient for this purpose since it just ensures ordering, not
timing between writes.  Since asserting and deasserting reset occurs on the
same register, ordering is already guaranteed by the architecture, making
the wmb extraneous.

Since we would define a timeout for polling the status register to avoid a
possible infinite loop, lets just use a static delay of 20 ms, since 16.666
ms is the time available to process one frame at 60 fps.

Fixes: a689554ba6ed (drm/msm: Initial add DSI connector support)
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---

Rob et al, is it possible for this to go into a 5.4-rc?

 drivers/gpu/drm/msm/dsi/dsi_host.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 663ff9f4fac9..68ded9b4735d 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -986,7 +986,7 @@ static void dsi_sw_reset(struct msm_dsi_host *msm_host)
 	wmb(); /* clocks need to be enabled before reset */
 
 	dsi_write(msm_host, REG_DSI_RESET, 1);
-	wmb(); /* make sure reset happen */
+	msleep(20); /* make sure reset happen */
 	dsi_write(msm_host, REG_DSI_RESET, 0);
 }
 
@@ -1396,7 +1396,7 @@ static void dsi_sw_reset_restore(struct msm_dsi_host *msm_host)
 
 	/* dsi controller can only be reset while clocks are running */
 	dsi_write(msm_host, REG_DSI_RESET, 1);
-	wmb();	/* make sure reset happen */
+	msleep(20);	/* make sure reset happen */
 	dsi_write(msm_host, REG_DSI_RESET, 0);
 	wmb();	/* controller out of reset */
 	dsi_write(msm_host, REG_DSI_CTRL, data0);
-- 
2.17.1

