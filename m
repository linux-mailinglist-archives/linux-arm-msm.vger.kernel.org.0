Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C13542AADE4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Nov 2020 23:37:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728905AbgKHWhp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Nov 2020 17:37:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727570AbgKHWhp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Nov 2020 17:37:45 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09C37C0613CF;
        Sun,  8 Nov 2020 14:37:45 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id a25so859623lfb.2;
        Sun, 08 Nov 2020 14:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kCfJ2Jg/FRbU0HYZuU5nyJHXfw9uLTxJyOfF7KFa57E=;
        b=MvhNV0Y5I33YbxT2Ln2NrfmREwh8lPFZ+3xU2EFtr2CAsZKR+wM35afUYsQBmrKDQk
         LYt8VUWG/y9jOYIUakzX7JTDIaX0ID95B4xc+8Ye9cJHF/5lJPlPg8B9LCCYP/OCfpw4
         OXeIBOX8so5xs5BNF5WC1D6ZOdQcB/uhGrxHX3YXOXQMd0q4POzkdj6MeckEc2C8s9Lt
         ABnP2NIYf/9rKSSc9j/z8TcKsy0VtvKkG7w11jm0L5QYWQH/Y1VmRsNGpHGPbs+jQkoG
         SyioOkj3E9EykvgsnwUDawY0P7JWEqRneiWIVhpVMAFYyJjq3FsGWSMCt664MsVeFgMV
         b7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kCfJ2Jg/FRbU0HYZuU5nyJHXfw9uLTxJyOfF7KFa57E=;
        b=PrrS2cnzW0xJik9bPhlICBMCqi5CczutBYzfwgmVqUgeKKMt+Wrie1OuzazKj2a6PV
         KXqaCqe2v9vAMbJzGUTLcXrdGaoQo/K9eLgeWIrwpiWOz4tkkhhh3nsS8Y8JBLH9wkys
         lBre02kdpUJiSGr3LyzbDu1n8jLDK4yVOvszQ0uzkgpgnFE2Wy27w91vPvFnhrr7kbiS
         vmClK7JogaWWhdBigCcVxxF+BqmRk9d2nQrs/HsH13wKJOQ2ZZYHZ61tOJUZzXyOGCPI
         5tfBDVlDZk2Q3h37e+mjRBfVP2CZQoX+N5+st2gOqAD0eKe7P03Wsu9niWYa4G9G43gy
         w2/A==
X-Gm-Message-State: AOAM532r4ihCiug2cx0TNGEJTx97VnHLK1oY5uaTqh5qtf0n80a0BQhB
        ITCvR/uunjNy10sSTe/UWUkcDCk3X0P3Iw==
X-Google-Smtp-Source: ABdhPJzuO6s0AWBQsGZ7IxbiJF3RrVQVDq0L03EJ0cQaiYYgIRSJQ5uljgZfXN2ou61c+TYUsgGFmQ==
X-Received: by 2002:a19:4050:: with SMTP id n77mr4313723lfa.460.1604875063419;
        Sun, 08 Nov 2020 14:37:43 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-112.NA.cust.bahnhof.se. [155.4.221.112])
        by smtp.gmail.com with ESMTPSA id b25sm1559932lff.48.2020.11.08.14.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 14:37:42 -0800 (PST)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] drm/msm: dsi: Constify dsi_host_ops
Date:   Sun,  8 Nov 2020 23:37:38 +0100
Message-Id: <20201108223738.16535-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The only usage of dsi_host_ops is to assign its address to the ops field
in the mipi_dsi_host struct, which is a const pointer. Make it const to
allow the compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 198db8d4cf3d..ab281cba0f08 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1657,7 +1657,7 @@ static ssize_t dsi_host_transfer(struct mipi_dsi_host *host,
 	return ret;
 }
 
-static struct mipi_dsi_host_ops dsi_host_ops = {
+static const struct mipi_dsi_host_ops dsi_host_ops = {
 	.attach = dsi_host_attach,
 	.detach = dsi_host_detach,
 	.transfer = dsi_host_transfer,
-- 
2.29.2

