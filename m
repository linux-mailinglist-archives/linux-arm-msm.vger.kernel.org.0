Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC471E19E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2020 05:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388714AbgEZDXF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 23:23:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388614AbgEZDXD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 23:23:03 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECD83C05BD43
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 20:23:02 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id r16so46568qvm.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 20:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AWAnzxFlBG6fffzFUdxDOCWUGLZUTqYmdG/nfLxRIYw=;
        b=GTWzOqvEA7APlKZrtWytxI3UiIPa9Y6MaUsjnygPQbcUyaVx4c8XiCqiNr7Cff/a9G
         KgjjDLdUPGOfF7m9HbgzYwegRZ28LwBDg8+/wHxjDDe2zYW/RU5qqo50EXMqB5rfxOB7
         Fhmi6xUUmFAA6ClbRVu/6DWDq/MJWeN/LcpMRH89Vt1qVWcMNTtNRo+rYJE80hL6au+5
         BvNQuPooPe8liULVPK/iZkNHC++tBaF4M0at4yOAAPYbVW86K4Dqh+ITCYl+ipj7ufOF
         Q/ayVJCWCKD9JqufTNPlTcwRadXX/x/k4NoHaJPkyPyCto0vOwXgTGv+1Eqd1ACMJZsx
         idtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AWAnzxFlBG6fffzFUdxDOCWUGLZUTqYmdG/nfLxRIYw=;
        b=ADUMwJ3F/IET0z0B0k3YspQsLbZgm/n3rqaDimw1uTHUvVkx1PkiycoF/S8717IY5V
         meV/SSlFbMavmpPS3kFTXDM88ilLO5kjOQLF/WGvjYVUcgi1Y6KqU+BSo0+67rrelAZ6
         w1ktwjEkxak2mcyXiCb+nTgNGho7NP8DbeaV2SEfXa5OXaAJ8JwM/HHlVHC1L5TsFmAk
         MEQmzjzHjfbJh3YbIu3MCFqcVX2L2vMxkxsSqd1gFtgrYR+mALH9L8hsMYFDLo2XdINR
         vI9vJAEZq8/XY9Vq9D3PBf9lwBHziTPztBncvsQcgUXyNXZJxJBbpTyS+7aWdTDzhlOi
         45eA==
X-Gm-Message-State: AOAM531E1j9t1cJjGLYC92FY2gAg97kQ1euI74KmAgr4RMoh/Tl7/bkE
        yBpF1GOliiqxfoxoTfaS7R3TTQ==
X-Google-Smtp-Source: ABdhPJwQ99YZM55+rNFn66oLsnyuqhfzXbeGT/sUdIanmJgqga8K7kurbsvipAlWTxcAKJBZ3WarOA==
X-Received: by 2002:ad4:5684:: with SMTP id bc4mr18783129qvb.85.1590463382263;
        Mon, 25 May 2020 20:23:02 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id k20sm2530796qtu.16.2020.05.25.20.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 20:23:01 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Allison Randal <allison@lohutok.net>,
        Stephen Boyd <swboyd@chromium.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5/8] drm/msm/dpu: set missing flush bits for INTF_2 and INTF_3
Date:   Mon, 25 May 2020 23:22:12 -0400
Message-Id: <20200526032235.21930-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200526032235.21930-1-jonathan@marek.ca>
References: <20200526032235.21930-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This fixes flushing of INTF_2 and INTF_3 on SM8150 and SM8250 hardware.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 831e5f7a9b7f..996666afdd66 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -245,30 +245,14 @@ static int dpu_hw_ctl_get_bitmask_intf(struct dpu_hw_ctl *ctx,
 static int dpu_hw_ctl_get_bitmask_intf_v1(struct dpu_hw_ctl *ctx,
 		u32 *flushbits, enum dpu_intf intf)
 {
-	switch (intf) {
-	case INTF_0:
-	case INTF_1:
-		*flushbits |= BIT(31);
-		break;
-	default:
-		return 0;
-	}
+	*flushbits |= BIT(31);
 	return 0;
 }
 
 static int dpu_hw_ctl_active_get_bitmask_intf(struct dpu_hw_ctl *ctx,
 		u32 *flushbits, enum dpu_intf intf)
 {
-	switch (intf) {
-	case INTF_0:
-		*flushbits |= BIT(0);
-		break;
-	case INTF_1:
-		*flushbits |= BIT(1);
-		break;
-	default:
-		return 0;
-	}
+	*flushbits |= BIT(intf - INTF_0);
 	return 0;
 }
 
-- 
2.26.1

