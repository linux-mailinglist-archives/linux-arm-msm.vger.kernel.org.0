Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0DC43FBA01
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Aug 2021 18:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237741AbhH3QTD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Aug 2021 12:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbhH3QTD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Aug 2021 12:19:03 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 664BDC061575
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 09:18:09 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so7250413pjc.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 09:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IzUUD53TRCina4FvQp5wgcW+VoUOyAwWBEy3HV4by8c=;
        b=MTpoUR2UzOgE1ufJQlJin/dJTVj/Mh5JuHlYs6fY85kV9qpTnCxrGLjI3Big/N6k79
         VjN3CR6HychhR+Pkc7NKMY/O1hoL2jJe6x9PeKzZqIdN/jcr9mDyGY+VR4gB7sTrdGBW
         nyZD3Xo63c0FAODS38BRvv5koF7ZOiQ9pe4ZFr97I0LFDR/SEIgaZL8pH5X4H380J6mN
         CGZYdD4JBmcBAIGNUE5SUK/64RTLwMLZXbExvU1L3P9KbMxYhWj+65vZ3ytAClYxyp3u
         ks+SdNpv0tEzZlXKjsTBa7v/AqtfDcRelAhEYJ8/6at0/vQ4WMo9O87oc74YntNgZo1p
         XE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IzUUD53TRCina4FvQp5wgcW+VoUOyAwWBEy3HV4by8c=;
        b=NhFEaXovFzKwZICQdnkU/3ctJoKvIYQuYzTpShc7TA4GQIvVq+AoczkMnpapw5UWfQ
         atlOT1NQwf7iUa8QPqtsOu5RhFnTN4X+70N7oSCt/P44Yipc0UX5Wyn4AwjShbAiIftz
         +LNYnhcHAk4gOAvCdfqExaA6AQebNK7R6U5Xo96SiodQ9lRNSDmj7qmxPKl32/7o+L/6
         cv2VndApgb4yQjUGQ4ZLT5ckp1LIa2U5+NypDSV7fn+hXWasgRuHk5/gPtKWA0H5N//G
         K9vWgLgkyl3IcrS4pHl1+y0nW1DhVpEB0oH3oFPcHCNr/oH/jCsA9l3XnSOG/J4BSawn
         AHGQ==
X-Gm-Message-State: AOAM5328O9j2yXlfEE6y0VxiCdcaQ8/2UhmrnC6A2WH7YyDFzF0DhSPc
        bq+aqOmg/L9CfV2ftNCvKoDMTff/QOY=
X-Google-Smtp-Source: ABdhPJzN0V8nsuGnodaxmxJDjnSXCAsi7TAHI6LzeETI3H4E/lZ/Ovp6hI0Talsa/XJlAQstxF++Pg==
X-Received: by 2002:a17:90a:64c1:: with SMTP id i1mr39754377pjm.111.1630340288903;
        Mon, 30 Aug 2021 09:18:08 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id y67sm15251565pfg.218.2021.08.30.09.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 09:18:08 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     igt-dev@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Petri Latvala <petri.latvala@intel.com>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH igt v3 1/3] drmtest: Add DRIVER_MSM support
Date:   Mon, 30 Aug 2021 09:22:30 -0700
Message-Id: <20210830162232.1328594-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210830162232.1328594-1-robdclark@gmail.com>
References: <20210830162232.1328594-1-robdclark@gmail.com>
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

