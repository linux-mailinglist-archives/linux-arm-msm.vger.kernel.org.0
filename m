Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 311983153D2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 17:28:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232877AbhBIQ0p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 11:26:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232856AbhBIQ0V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 11:26:21 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B3FC0617A9
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 08:24:52 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id h12so6414315wrw.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 08:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gm63VE0Ms6j+TktlY/wms9x6BlhYOZP/RTvoJB/vhKw=;
        b=FofgPF7ZSTIvSiVaryp/NeVpmTAZO3agRjo/IJX4qA5hp0KcuMcnzJ2rGYZQ93sHZq
         0RZVY/UZBd/bgfZS8HMzz/xNt8JvGsIFdnG8t4k/RFJkEKme1OUc3xUU19OemUHt9s91
         5+nqc8YZW8tr6EiULtf3jKwmO+WCSiIZ4ttArZ0bqSSVDxYuTnsW1w0tj9TX6SC3plfP
         7+LJ1TeFXrb+YdraquGE1jUScUTxblfsKrZIxfw9pinABzn4LdCqP2TIQboW22GQ57nZ
         NoP24Sl7LKAJs6xUNWHlQMVFL14IUtL8+1zAPfOagOpXMIdX+hQPjoSWD9aQywbTIo8X
         3HSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gm63VE0Ms6j+TktlY/wms9x6BlhYOZP/RTvoJB/vhKw=;
        b=F3FLW58kZ1NLTvMrKVvhYY/5uRpM/R4MZVNjPZ26S1xviy/Zx09WQn7/yVbHJ1dDY7
         R7H5Ohra4dH8nTlnAowVtBywrOFVexNVT1W3jtFKZrDeL5UFnf6wfbjUd3cJ3dHsQv8P
         c9F1OzAD+kiL+CuE+3Vql4RhLiKdTyumcCeEwPEKvtVLGNFG6B85afC8sjJGdNz2AAQi
         TTfwBOlkduZaTfVwDX8Rt0RpbY8oAVXwxgmIo7jVMbZvUe+a406HQdQOsf1CbfvZkyYE
         Ky1uGYiTaZVS+J7ad0QDe4YtukFQTu4gow6YCc+fGkG7aVh0ZllLL4LNfxBfIBeeUZOb
         XQFw==
X-Gm-Message-State: AOAM533S7/e0coQOKQ6EuzqrkZSm8q15JBFjwLu92V3bkkvrau3DaE99
        fDVFnUUcxU4Wnx5MHtSoVthhOw==
X-Google-Smtp-Source: ABdhPJyfgwBPR2lK/hhS+OgDCPZAuDWd6EmAft/ttOEa3iEg4NbZ6GgcLVJAvaBDlqJ1L++m8Iwo+w==
X-Received: by 2002:a5d:4a0b:: with SMTP id m11mr9481678wrq.51.1612887891609;
        Tue, 09 Feb 2021 08:24:51 -0800 (PST)
Received: from localhost.localdomain (hst-221-125.medicom.bg. [84.238.221.125])
        by smtp.gmail.com with ESMTPSA id w8sm45210wrm.21.2021.02.09.08.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 08:24:51 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v5 4/5] docs: Document CLL and Mastering display colorimetry controls
Date:   Tue,  9 Feb 2021 18:24:24 +0200
Message-Id: <20210209162425.3970393-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210209162425.3970393-1-stanimir.varbanov@linaro.org>
References: <20210209162425.3970393-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document Content Light Level and Mastering Display v4l2 colorimetry
controls.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../media/v4l/ext-ctrls-colorimetry.rst       | 71 +++++++++++++++++++
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  8 +++
 .../media/videodev2.h.rst.exceptions          |  2 +
 3 files changed, 81 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
index 862f78b41b32..a9f206a46175 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
@@ -20,3 +20,74 @@ Colorimetry Control IDs
     The Colorimetry class descriptor. Calling
     :ref:`VIDIOC_QUERYCTRL` for this control will
     return a description of this control class.
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
+      - The upper bound for the maximum light level among all individual
+        samples for the pictures of a coded video sequence, cd/m\ :sup:`2`.
+        When equal to 0 no such upper bound is present.
+    * - __u16
+      - ``max_pic_average_light_level``
+      - The upper bound for the maximum average light level among the
+        samples for any individual picture of a coded video sequence,
+        cd/m\ :sup:`2`. When equal to 0 no such upper bound is present.
+
+``V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY (struct)``
+    The mastering display defines the color volume (the color primaries,
+    white point and luminance range) of a display considered to be the
+    mastering display for the current video content.
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
+      - Specifies the normalized x chromaticity coordinate of the color
+        primary component c of the mastering display in increments of 0.00002.
+        For describing the mastering display that uses Red, Green and Blue
+        color primaries, index value c equal to 0 corresponds to the Green
+        primary, c equal to 1 corresponds to Blue primary and c equal to 2
+        corresponds to the Red color primary.
+    * - __u16
+      - ``display_primaries_y[3]``
+      - Specifies the normalized y chromaticity coordinate of the color
+        primary component c of the mastering display in increments of 0.00002.
+        For describing the mastering display that uses Red, Green and Blue
+        color primaries, index value c equal to 0 corresponds to the Green
+        primary, c equal to 1 corresponds to Blue primary and c equal to 2
+        corresponds to Red color primary.
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
+        display in units of 0.0001 cd/m\ :sup:`2`.
+    * - __u32
+      - ``min_luminance``
+      - specifies the nominal minimum display luminance of the mastering
+        display in units of 0.0001 cd/m\ :sup:`2`.
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index 8a95ebdd499a..2f6d0539fb93 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -212,6 +212,14 @@ still cause this situation.
       - ``p_fwht_params``
       - A pointer to a struct :c:type:`v4l2_ctrl_fwht_params`. Valid if this control is
         of type ``V4L2_CTRL_TYPE_FWHT_PARAMS``.
+    * - struct :c:type:`v4l2_ctrl_hdr10_cll_info` *
+      - ``p_hdr10_cll``
+      - A pointer to a struct :c:type:`v4l2_ctrl_hdr10_cll_info`. Valid if this control is
+        of type ``V4L2_CTRL_TYPE_HDR10_CLL_INFO``.
+    * - struct :c:type:`v4l2_ctrl_hdr10_mastering_display` *
+      - ``p_hdr10_mastering``
+      - A pointer to a struct :c:type:`v4l2_ctrl_hdr10_mastering_display`. Valid if this control is
+        of type ``V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY``.
     * - void *
       - ``ptr``
       - A pointer to a compound type which can be an N-dimensional array
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 0ed170c6e720..38b31a9b9580 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -147,6 +147,8 @@ replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HDR10_CLL_INFO :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY :c:type:`v4l2_ctrl_type`
 
 # V4L2 capability defines
 replace define V4L2_CAP_VIDEO_CAPTURE device-capabilities
-- 
2.25.1

