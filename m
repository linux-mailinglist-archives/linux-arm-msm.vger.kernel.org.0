Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF852D2DC2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Dec 2020 16:03:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729657AbgLHPB3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Dec 2020 10:01:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729379AbgLHPB2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Dec 2020 10:01:28 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5083CC0617B0
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Dec 2020 07:00:06 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id n26so24988315eju.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Dec 2020 07:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7HFxBojNQoqoo0yNgEgAcHxbiciKdGO1hKU1kqE+B2w=;
        b=pqk8czetThRSoershteSnEiS66FA3iyQRjlsfhktU9/99V4/gMEka3cZ6iZAhkDL9R
         xMo0qev7dV9r46ltGcMPUGdnFNjkiaeteZd8l/RwYQPb6MPZDeituddxiMrs3qX0Be45
         O5IJtW4O0Fc6chj4dv2QwW/wICWzlKffE9pCGYfMCKpBwfFsduPykB3GWv+ByRTIGHMy
         FOOlWfCRFoQjM9S/ciFGtXo9NiRzi4zdLNsRhC6y8eG1RChjg2cL8jRz3NvW62j4V6YI
         QTdCWwFrkvvPV/OKSY2SZV5V1UVGYCutAhWJM7SYKr1ZWS693xRfY+E8RdTFJi8nl2W0
         RKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7HFxBojNQoqoo0yNgEgAcHxbiciKdGO1hKU1kqE+B2w=;
        b=asbFMlhQJvX+QBbjV4nzv836FHTZlxf1XToCvfVLFgb23lwcJo4t+ZpSFZmr5iCcNt
         fvC7FN7uVKP5lkXsADW0CJnBG+XYHyrNMx9PFlveFksik3fUgMuq1OXIk1gqeIWNZtR9
         qkZfA8gRKeujq3XeyWzDXai+RjxGySl3x/CTYv+VTsFa+XaprHDHziX1R/nC9oyWCNFy
         zIg18lVvN8gEjJZToT9/smmA9QbECCwRfietihDHksL2XWzAFkVfs1yHzsNLwd7WgJLh
         Fzs2sthZvBnQcUTZBQfzgvQO8pg8R2Woy0VZcen0JhTj2v9Sl1pDCkfzFwgZUgXG7r6r
         hABQ==
X-Gm-Message-State: AOAM5302UUL325WbUS2VhTq4cDfzmtnYo6MLlfx1edZc3dn2KKJsxnwv
        vl6aucO9UabN6G6ef1NxiJEBbkKzlh2yaLzB
X-Google-Smtp-Source: ABdhPJwSaoLUO53YN/+JE/qQ6J8qCKBmxY397K70gnj0QV34SSFakPeuCasm0U9rBNMaTiSSB5zqbQ==
X-Received: by 2002:a17:906:7f0b:: with SMTP id d11mr23980915ejr.7.1607439604976;
        Tue, 08 Dec 2020 07:00:04 -0800 (PST)
Received: from localhost.localdomain (hst-221-90.medicom.bg. [84.238.221.90])
        by smtp.gmail.com with ESMTPSA id qn4sm4968292ejb.50.2020.12.08.07.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 07:00:04 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 2/3] docs: media: Document CLL and Mastering display
Date:   Tue,  8 Dec 2020 16:59:30 +0200
Message-Id: <20201208145931.6187-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201208145931.6187-1-stanimir.varbanov@linaro.org>
References: <20201208145931.6187-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document Content light level and Mastering display colour volume.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../userspace-api/media/v4l/common.rst        |  1 +
 .../media/v4l/ext-ctrls-colorimetry.rst       | 88 +++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst

diff --git a/Documentation/userspace-api/media/v4l/common.rst b/Documentation/userspace-api/media/v4l/common.rst
index 8c263c5a85d8..ea0435182e44 100644
--- a/Documentation/userspace-api/media/v4l/common.rst
+++ b/Documentation/userspace-api/media/v4l/common.rst
@@ -51,6 +51,7 @@ applicable to all devices.
     ext-ctrls-fm-tx
     ext-ctrls-fm-rx
     ext-ctrls-detect
+    ext-ctrls-colorimetry
     fourcc
     format
     planar-apis
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
new file mode 100644
index 000000000000..16d9ddadbab6
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
@@ -0,0 +1,88 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _colorimetry-controls:
+
+*****************************
+Colorimetry Control Reference
+*****************************
+
+Below are controls within the Colorimetry control class.
+
+Colorimetry Control IDs
+-----------------------
+
+.. _colorimetry-control-id:
+
+``V4L2_CID_COLORIMETRY_CLASS (class)``
+    The Colorimetry class descriptor.
+
+``V4L2_CID_COLORIMETRY_HDR10_CLL_INFO (struct)``
+    The Content Light Level defines upper bounds for the nominal target
+    brightness light level of the pictures.
+
+.. c:type:: v4l2_ctrl_hdr10_cll_info
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_ctrl_hdr10_cll_info
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u16
+      - ``max_content_light_level``
+      - An upper bound on the maximum light level among all individual
+        samples for the pictures of coded video sequence, cd/m2. When
+        equal to 0 no such uppper bound is present.
+    * - __u16
+      - ``max_pic_average_light_level``
+      - An upper bound on the maximum average light level among the
+        samples for any individual picture of coded video sequence, cd/m2.
+        When equal to 0 no such uppper bound is present.
+
+``V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY (struct)``
+    The mastering display defines the colour volume (the colour primaries,
+    white point and luminance range) of a display considered to be the
+    mastering display for current video content.
+
+.. c:type:: v4l2_ctrl_hdr10_mastering_display
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_ctrl_hdr10_mastering_display
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u16
+      - ``display_primaries_x[3]``
+      - Specifies the normalized x chromaticity coordinate of the colour
+        primary component c of the mastering display in increments of 0.00002.
+        For describing mastering display that use Red, Green and  Blue colour
+        primaries, index value c equal to 0 correspond to Green primary, c
+        equal to 1 correspond to Blue primary and c equal to 2 correspond to
+        Red colour primary.
+    * - __u16
+      - ``display_primaries_y[3]``
+      - Specifies the normalized y chromaticity coordinate of the colour
+        primary component c of the mastering display in increments of 0.00002.
+        For describing mastering display that use Red, Green and  Blue colour
+        primaries, index value c equal to 0 correspond to Green primary, c
+        equal to 1 correspond to Blue primary and c equal to 2 correspond to
+        Red colour primary.
+    * - __u16
+      - ``white_point_x``
+      - Specifies the normalized x chromaticity coordinate of the white
+        point of the mastering display in increments of 0.00002.
+    * - __u16
+      - ``white_point_y``
+      - Specifies the normalized y chromaticity coordinate of the white
+        point of the mastering display in increments of 0.00002.
+    * - __u32
+      - ``max_luminance``
+      - Specifies the nominal maximum display luminance of the mastering
+        display in units of 0.0001 cd/m2.
+    * - __u32
+      - ``min_luminance``
+      - specifies the nominal minimum display luminance of the mastering
+        display in units of 0.0001 cd/m2.
-- 
2.17.1

