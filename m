Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2260D3F7F02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 01:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232789AbhHYX2D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 19:28:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231535AbhHYX2C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 19:28:02 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B311DC061757
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 16:27:16 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id v123so990448pfb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 16:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZO3zKGF+0NhPfL8Qd0KyZNcW2ZWya+gJqC9s4ZSXqFs=;
        b=n5XyjCzweV2ACwjq4EtbPx015mZCNAy8xfe1YXs2ga4Wt3K0FnHiYTwOdsdXvSF7jw
         LnhNWfjBZftiFTrOv8YI8efhiWKEMakKts8jK6RVR86lq+xqcSHfXfrsKUvxeZPMgW7E
         5TupfinS/XDiJXkyxtGb10Cd1EEdbzz9bZF9ITmA90ToYK8h55C72wk8V//sgzAfWXBk
         CqStnhXxSGnq5c//fHULpwnZ9vrb3kkfKcqqVAre+605sDqwAsEeZVRit5EQZtLBI0RA
         N5tx0amo6xVHaJKrbnLD5lMQVaKmy3zn7+qtqiDjt8PJB+otSPybJgBSQ8FLKPHFydly
         QFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZO3zKGF+0NhPfL8Qd0KyZNcW2ZWya+gJqC9s4ZSXqFs=;
        b=J+BGUCR9VTAVV9Ns5a/vr1CqC4AlzYG2xqDQFed7qd7tarJ/ZCr8/OLLIlxRc2DlcG
         UCJx5LDSqH7soge9jQ1f/whuakHwuENrLONyyKBo30jgYpNn2WavbvXAV3kj+hyBk2gb
         7hfNu8Mxer8fEA5GTPFKvlkkLdxGDQmH7LnCIKj1sy1QeJWM/ky4Qvt4tOpsvcS/bFcU
         Ez2oKIkBKk5mzaKtLGlU/cOEIf6MD+cFBqY+njFn1kArlqbaADb8HA9qmwPutr853aHu
         GYDEQqgAJeXDdlzKG5Qp7WS+CP26JpGqpBy0y5Wt+8MGFKNpKpuhXvUU/pbp0ZZG4xAu
         6a+Q==
X-Gm-Message-State: AOAM531jPDOEkQSP7A4LD0Xg4FZ6b9/twx+EY4T2IVYw5/tfQwRc8tzc
        OwXvfauZALPkl1kVuw21VUg=
X-Google-Smtp-Source: ABdhPJzmn+NtvDuwd97wCe7RQGzCC1iXMT6d/KGy4QzNZfoRvB30cOxpfiSSPU+oZ/1amWPQSxrJMQ==
X-Received: by 2002:a05:6a00:1311:b029:3b2:87fe:a598 with SMTP id j17-20020a056a001311b02903b287fea598mr655696pfu.74.1629934036299;
        Wed, 25 Aug 2021 16:27:16 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id j16sm705152pfc.70.2021.08.25.16.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 16:27:15 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     igt-dev@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Petri Latvala <petri.latvala@intel.com>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH igt v2 1/3] drmtest: Add DRIVER_MSM support
Date:   Wed, 25 Aug 2021 16:31:37 -0700
Message-Id: <20210825233139.1066504-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825233139.1066504-1-robdclark@gmail.com>
References: <20210825233139.1066504-1-robdclark@gmail.com>
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

