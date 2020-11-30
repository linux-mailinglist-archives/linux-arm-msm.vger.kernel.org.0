Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 577ED2C809D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 10:11:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727621AbgK3JKP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 04:10:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbgK3JKP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 04:10:15 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13D4CC0617A6
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 01:09:29 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id qw4so10172389ejb.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 01:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bYlnpDHyjfod0Sy7GFzmidvMbQ6rkW4h8xNRqXS+z7s=;
        b=Jai7AcgLvGIuOSsYBlHZWPPc8hxUOvZoHJPKEhvTAmc/3ci+m1aJEi1Ym93l0aqFWC
         DM+eGuk7OzgH7BJYCNBR1Ref1o8pNPQu04JfYS/v8tutJ3EZG2jwH4ZwEt80K3Xf9y+J
         XG1nMT3P/M4m845aPTF04SRSC9j45jPXOfW5sIfGSy2sgiC8IlboqU3phoKSjW54i1Ge
         0btTVca53r/L4w8CM2I9rUmFHewc79yVwUS4q1ZA07U9ebDxHNjC1CTC9dmH/p/+7qDC
         w6oiQ3Dx7oErIlr/9pLH+u+K3m58EA5Ifr/RS4QDNksdLvbWaKqep69DSiY4ixDfXEcZ
         SVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bYlnpDHyjfod0Sy7GFzmidvMbQ6rkW4h8xNRqXS+z7s=;
        b=aG95XYUTDrBQdAju/tFXSuHLvG/JcRn13K3h6IIUkWPXbTsckO+lz2tDqFg7+8v6fZ
         wYSeKs2jnzbD0en1vRZvsGSA0q/nsCsQaCaMGhvm9wygBC1Up++I8OwvyyLz8PW7wSxY
         GW4DiKUaRI7PfTQh1ZnWUc6B/n6gPq5/UrKK2RN78MQAkaK/aFnaJcOkfzkKRWwLdt8Q
         FlVTTsB3SBzMIX1NWKGuQW4vUn/OBveHuYKpbzLajHyPdTkRjR41uuGv3FEg4L/3N0P0
         g08PaFUc5FCY9IpkA+tSy3fL2IyrzqSPrIcMHwIsdCQ29ffY3dBm78c5zJO6zP0i5nSK
         T+4A==
X-Gm-Message-State: AOAM532gWUtKEiCi1h78C8A6h6U8x1jKo1y5jzr2AGwzu5nre6cVrKEO
        iB2Td88LPFNR3xgygwb2Z0A8Dw==
X-Google-Smtp-Source: ABdhPJz2+Z+Vol7rk4wNv3WI4q4xJIb8wql7mv/dFMB2zV6+V9kY0JQuhVwl5+vTlMOS33S6M9ecDw==
X-Received: by 2002:a17:906:e15:: with SMTP id l21mr19709397eji.509.1606727367777;
        Mon, 30 Nov 2020 01:09:27 -0800 (PST)
Received: from localhost.localdomain (hst-221-92.medicom.bg. [84.238.221.92])
        by smtp.gmail.com with ESMTPSA id t19sm8239101eje.86.2020.11.30.01.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 01:09:27 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 1/4] media: v4l2-ctrls: Add random intra-refresh control
Date:   Mon, 30 Nov 2020 11:08:56 +0200
Message-Id: <20201130090859.25272-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201130090859.25272-1-stanimir.varbanov@linaro.org>
References: <20201130090859.25272-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a control to configure number of macroblocks for random
intra-refresh mode.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 6 ++++++
 drivers/media/v4l2-core/v4l2-ctrls.c                      | 1 +
 include/uapi/linux/v4l2-controls.h                        | 1 +
 3 files changed, 8 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index ce728c757eaf..59c5d3da4d95 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1104,6 +1104,12 @@ enum v4l2_mpeg_video_h264_entropy_mode -
     macroblocks is refreshed until the cycle completes and starts from
     the top of the frame. Applicable to H264, H263 and MPEG4 encoder.
 
+``V4L2_CID_MPEG_VIDEO_RANDOM_INTRA_REFRESH_MB (integer)``
+    Random intra macroblock refresh. This is the number of random
+    macroblocks refreshed on every frame. Here the positions of
+    macroblocks to be refreshed on every frame is random. Applicable
+    to H264 and HEVC encoder.
+
 ``V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE (boolean)``
     Frame level rate control enable. If this control is disabled then
     the quantization parameter for each frame type is constant and set
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index ad47d00e28d6..5354547ed777 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -869,6 +869,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:	return "Decoder Slice Interface";
 	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:	return "MPEG4 Loop Filter Enable";
 	case V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB:	return "Number of Intra Refresh MBs";
+	case V4L2_CID_MPEG_VIDEO_RANDOM_INTRA_REFRESH_MB:	return "Number of Random IR MBs";
 	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:		return "Frame Level Rate Control Enable";
 	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:			return "H264 MB Level Rate Control";
 	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:			return "Sequence Header Mode";
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 7035f4fb182c..cc7676ffff67 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -421,6 +421,7 @@ enum v4l2_mpeg_video_multi_slice_mode {
 #define V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE		(V4L2_CID_MPEG_BASE+227)
 #define V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE		(V4L2_CID_MPEG_BASE+228)
 #define V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_MPEG_BASE+229)
+#define V4L2_CID_MPEG_VIDEO_RANDOM_INTRA_REFRESH_MB	(V4L2_CID_MPEG_BASE+230)
 
 /* CIDs for the MPEG-2 Part 2 (H.262) codec */
 #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_MPEG_BASE+270)
-- 
2.17.1

