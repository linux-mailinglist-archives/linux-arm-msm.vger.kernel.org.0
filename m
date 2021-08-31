Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9E1E3FCB43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Aug 2021 18:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239789AbhHaQNr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Aug 2021 12:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239795AbhHaQNq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Aug 2021 12:13:46 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4103C061575
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Aug 2021 09:12:50 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id j1so12167606pjv.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Aug 2021 09:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IzUUD53TRCina4FvQp5wgcW+VoUOyAwWBEy3HV4by8c=;
        b=OOjQD7PcaDHf9UqHMUXZOqvvQUGIPQRaLs3BA8ro+eCzT5qcQF4w+fnt9LRl8ccedp
         4Dx6UUTBdQaTzpoZpcNCXp6v+1Gfo1Ao5EGEHNuIO4xqiFzSgWuteSmJIH1ZAu3Iwzy9
         LV3pf93r2TtAQdJyRNzsLefPU43hIGGoffl4ejQsjQR7Li8I0Nq+PX8NbDsMH2HbY4Vw
         Bg22w2rum1KXFoojqSWHhEW1XrIuMtUDgMAjuN0HWQkd7qzyW6IX+hOSWQb5R/gQ6n5i
         lT+OQ30Er1Cr1KewCuA08VWXh/1Jk/KlOFVrZPjvFB/hFWx9ztUjOfP0f7nIlYEI5qxL
         k3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IzUUD53TRCina4FvQp5wgcW+VoUOyAwWBEy3HV4by8c=;
        b=Yt2EXE4/eHju+weT5693wwIzYK9BKvia8RpUJ7fGgtGdPFBk4djVT5whsTG1Vv0iHN
         6T13TIE0u2IXhnexjoBIr8otkhW49Fduh/5JkoB3nHvVv2JW0ejwc/e0nIWHPAGYXh6h
         yw4uDJwexPCDwmCp2IFjZUkJFi9dQ8Y7JLk7tgF8RjphxYFyLYn8nh4Q4lhBr2jzW+qZ
         Cj5IQSPMqHlsnqy8MqId1t8B4ZcTCmQS6BtEfupu7eqNJv6LWFl7YxuRbftMJtDBoxrE
         Gw7qFcE+4iBXuagC1NIyTI6npouo2besWO0AsTO5W2UauKDcfE2OpVZXRDzqQLSzLuod
         AnRQ==
X-Gm-Message-State: AOAM530HjztK1YHPy8Zr+5becyfVOEDZL3yUy2UwlgSWAp6uvT4PocU6
        JYdRJMcBCIVgbBwhqP+v2Ls/XxG9+74=
X-Google-Smtp-Source: ABdhPJzagBDIHTv/jV31+XINjnPPk9hLtJ8OsAkBF08ftXKkvaqBJhCvGvI5pV20pDU+sfVjwGN8Iw==
X-Received: by 2002:a17:90a:8801:: with SMTP id s1mr6291123pjn.166.1630426370486;
        Tue, 31 Aug 2021 09:12:50 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id a21sm3515990pjo.14.2021.08.31.09.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 09:12:49 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     igt-dev@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Petri Latvala <petri.latvala@intel.com>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH igt v4 1/3] drmtest: Add DRIVER_MSM support
Date:   Tue, 31 Aug 2021 09:17:14 -0700
Message-Id: <20210831161716.1400057-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210831161716.1400057-1-robdclark@gmail.com>
References: <20210831161716.1400057-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
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

