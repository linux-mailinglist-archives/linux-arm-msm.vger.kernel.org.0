Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3173F6BD8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 00:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231135AbhHXWqB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Aug 2021 18:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230488AbhHXWqB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Aug 2021 18:46:01 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3D1DC061757
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Aug 2021 15:45:16 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id q21so4168239plq.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Aug 2021 15:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZO3zKGF+0NhPfL8Qd0KyZNcW2ZWya+gJqC9s4ZSXqFs=;
        b=BzNv75Zr8IZ+hw0SmOgWUVI+t/muib2et+OpiUcjIxoO5Ui0Tc1XPwUoO9SIFikroZ
         fd59sugOcPUw8VIIgJyvAVQhFkffYNODQgB60w3tfkLHazc3oZYYhm3PwebDSkDbayJ+
         uld53ZOkTMKbarFjKmjyaByW96qMyEbEsn+FQPocfOzRiQenL6lB1MlNoufsFQtD0b01
         CVCUErC06YYs8T2BH8rxV2+iHjkuZQwwHjg2GXuNPJmHD6bkYhe/zAboVediAZjMCCDW
         eojcfAjng9zBpP+/+Su1xdYN0ExyMRbi3NApLWM239FQZQxgJxU+vHHA+AMUBWSGLaCj
         hixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZO3zKGF+0NhPfL8Qd0KyZNcW2ZWya+gJqC9s4ZSXqFs=;
        b=BWiWeNEXSJH2HbdVbX7PctstB5ZKM99iVqUd0cw3ei8Mm6UXPjiriLsE0MMMpf4272
         PyKcVz36aGRd+wgakto8SdQIgjzrvI7sWd79yRPJjVDhcipmYLy9eazWMznsp9cIv1pj
         Xe5i07kry76sSFQ8/P9j9zBOfDB2KrG4G5co2aE5gDt+XiPQGe1XXHnmHm/DEbiTAHGB
         driC+FOQ0sucDLjOhh4PsdE+DcZ+NtLCo+rMitRnL4fpdsZKtT0X5Gdu3QpUlSkQ2j/Q
         SE6ZOo7jTSMYUMm/RORIq957A8XmZSlDjqKDogmBvi3POvfwrkrTvlSEUpnp1L4ktW2g
         F+9g==
X-Gm-Message-State: AOAM532PnzsuBK+rar1CAmM3LlbDNwIjlxqHKE9tCChttZjf0YJjBpIX
        ImPrE0jM0FgDY7mKOIxAFV8U0cyAfMQ=
X-Google-Smtp-Source: ABdhPJzGNTvS5lR8yl9Ds5jQal5mlDin3DlRgDDSCvzupDXRXDIjxs8xLKVsoNBcmmfmCULDA/u2nw==
X-Received: by 2002:a17:902:b20e:b029:12b:fd6f:44c3 with SMTP id t14-20020a170902b20eb029012bfd6f44c3mr35011809plr.36.1629845116478;
        Tue, 24 Aug 2021 15:45:16 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id o11sm20716569pfd.124.2021.08.24.15.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 15:45:15 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     igt-dev@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH igt 1/3] drmtest: Add DRIVER_MSM support
Date:   Tue, 24 Aug 2021 15:49:30 -0700
Message-Id: <20210824224932.564352-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824224932.564352-1-robdclark@gmail.com>
References: <20210824224932.564352-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 lib/drmtest.c | 3 +++
 lib/drmtest.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index e1f9b115..29cb3f4c 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -179,6 +179,7 @@ static const struct module {
 } modules[] = {
 	{ DRIVER_AMDGPU, "amdgpu" },
 	{ DRIVER_INTEL, "i915", modprobe_i915 },
+	{ DRIVER_MSM, "msm" },
 	{ DRIVER_PANFROST, "panfrost" },
 	{ DRIVER_V3D, "v3d" },
 	{ DRIVER_VC4, "vc4" },
@@ -539,6 +540,8 @@ static const char *chipset_to_str(int chipset)
 		return "amdgpu";
 	case DRIVER_PANFROST:
 		return "panfrost";
+	case DRIVER_MSM:
+		return "msm";
 	case DRIVER_ANY:
 		return "any";
 	default:
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 7d17a0f9..a6eb60c3 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -50,6 +50,7 @@
 #define DRIVER_AMDGPU	(1 << 3)
 #define DRIVER_V3D	(1 << 4)
 #define DRIVER_PANFROST	(1 << 5)
+#define DRIVER_MSM	(1 << 6)
 
 /*
  * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system
-- 
2.31.1

