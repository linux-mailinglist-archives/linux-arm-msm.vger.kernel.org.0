Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08C2B21C143
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 02:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbgGKAuV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 20:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbgGKAuV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 20:50:21 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEE03C08C5DD
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 17:50:20 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id e11so7110153qkm.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 17:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SH81ocgF+oAHcpIFHcVCEtbEA/eMMo0Rk5aeuJez85E=;
        b=dk7x85B9jBSqI7kMWwQmPep7Pkq3sdXPexpRQmUWMhTwZ52iwjKKuxKtcbipHk7IYI
         8YG31wZnH0cwTX1hmClJ1RDV9ymQi2jZ9H5gb0U16msjGovfyDw9K/xkgi32Nvez02PC
         PDPvBFV8pR7VIk9walAh8IXIDpl7OxYqPUAuCW/ZQW/r4n7TWtgmRnfZxNBAoHrqFPwS
         GT/bgOtQo2ipBNLbsmXkQPf2QdUui4c3EX1H61CGOrmoOy51bNfysCVYlTTBhuKRfaF5
         soiQv8PL9EZRvHsUgqNFnlTrNEG755A52YMwu9R8M5K5ME5KlAhbLvIblN1Sk7yxN0dT
         Y38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SH81ocgF+oAHcpIFHcVCEtbEA/eMMo0Rk5aeuJez85E=;
        b=kGc0HYujyjMTh8BxtPlFgYgW4vQ8d6aVYofgDuZGt75biVtlHfu/jFh6vPmJFd6hHw
         2b25j0NQOQjeY6oTO9HPrGZJ6/ICzWdbIOc8lLFPAo3ViCbTAd/dIuaDUkzXov8HNC98
         FHg0mCRfpDIjzlydx2xkTACpdPKQFDLwOni7LjC2rE9vQ/MMOlWDAkweXZU/ZuZAUrWC
         biAIyTotej+xOBKnNBiM7MnRnLDZ6hmPyu3XimPUxg5gXiLwCbIuNXwmkrkI36N0cV1t
         L648Fm/4JmJkBTtzf42EM96km792LJDbggHyHWf3rXDWGlaugmwvYD22FwhJ6tQOIRqo
         /rFg==
X-Gm-Message-State: AOAM533rmeiycrQXzYHxdK71pyIlh4NFA2ZMP1lY58CnZy+in9PJ6Cl2
        66usthjhvtg1YwZ1z+TFPIAzlA==
X-Google-Smtp-Source: ABdhPJwKzjLiuX94fBfKmcTzf4I0K3ACIWPkWPoQt+kid5Kr+J3Euh9ydp8oQ5K7CTfbe49c39DuXQ==
X-Received: by 2002:a37:6758:: with SMTP id b85mr59916869qkc.238.1594428620058;
        Fri, 10 Jul 2020 17:50:20 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id g20sm10427510qtc.46.2020.07.10.17.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 17:50:19 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Shubhashree Dhar <dhar@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 5/8] drm/msm/dpu: set missing flush bits for INTF_2 and INTF_3
Date:   Fri, 10 Jul 2020 20:47:28 -0400
Message-Id: <20200711004752.30760-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200711004752.30760-1-jonathan@marek.ca>
References: <20200711004752.30760-1-jonathan@marek.ca>
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
index 613ae8f0cfcd..758c355b4fd8 100644
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

