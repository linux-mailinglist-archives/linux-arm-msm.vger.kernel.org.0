Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D87AD13153F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 16:50:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbgAFPuO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 10:50:14 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40943 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727127AbgAFPuN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 10:50:13 -0500
Received: by mail-lj1-f193.google.com with SMTP id u1so51374338ljk.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 07:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8jyLbT5ZrfIAz+8+u887A7NjsCYNMRlyxpPZgdnDr9I=;
        b=J76Ae++/WxURgBvDKLrnufgbFrfqNEw/2JO35drnSu7Igq/d1LO17a5LccG6T0t/jz
         M22b99qTxoHBloxxpLTly1KoHV06T5hsChQWSvPEQkPlzxK4e1YZ1CP31YJqFAzL+mKa
         gGZnnSvbrmfK3v/M0HnfdfKhgpiCuJ0FTR89a3XqRKGqLXRZCUwV7+fUjgT7osyeUZp6
         VdJf9YX5xNcdR4lTLJtO6vrN5JqEGA6ulOh6jsEGltEwZ2HeEdT3/dHbF/abd3SmmnRy
         tZ8jJ40f/Y3KbYi5fwxoyxbrZ72CdRnDWxP1b81M4vNCAFCKM8trPu7Hj0pw17ktf5zm
         eZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8jyLbT5ZrfIAz+8+u887A7NjsCYNMRlyxpPZgdnDr9I=;
        b=EhA2w+u6x6AZ8G3qA5epbgU0S5O6xgVwUJsQhGszZvP+D3TTGNsoaNN/D0CfsBO2T8
         AHfjH5JjWEsXONAREUXansbmcTn1Swqo1ak07AfGxABHft6nlmepC+fOzjQihZ37lUJe
         eyiQaV1NCFYF+WZyPLUw5Z0HhRLEj9xIH/e6rN6+4pruC7Ly7glEC2yqQCHok0twAFWn
         ioz1PILa29jsQjb1BM8aFpg/eVB/SpmOTVQqTDTMpAFwnn68YA5vWvi8s2WytNeCPrVx
         gz0fdAPcDfPyx7BWrqKiwumGd6YP9bxo08X67OOS3jhfoPhdesgeiA05j0lxcFJduevD
         Oe7w==
X-Gm-Message-State: APjAAAWYYnbiMzIklfFUx8RR8Hio1wr/oUineEcbrpBpzqtsUpMcUV/L
        2UK3mnEg3wSCnouaX2I/BdxpQ7i6TR4=
X-Google-Smtp-Source: APXvYqzdeqcPrPfa3OahLNFvB3qH0ZdnioHalWqNe4kQviZwx6hVI/OOIn4s59EvW9ql/N4yd/muJA==
X-Received: by 2002:a2e:8316:: with SMTP id a22mr9810308ljh.141.1578325811164;
        Mon, 06 Jan 2020 07:50:11 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id x84sm29388259lfa.97.2020.01.06.07.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 07:50:10 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v4 04/12] v4l: Add source event change for bit-depth
Date:   Mon,  6 Jan 2020 17:49:21 +0200
Message-Id: <20200106154929.4331-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
References: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This event indicate that the source color bit-depth is changed
during run-time. The client must get the new format and re-allocate
buffers for it. This can usually happens with video decoder (encoders)
when the bit-stream color bit-depth is changed from 8 to 10bits
or vice versa.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 Documentation/media/uapi/v4l/vidioc-dqevent.rst | 8 +++++++-
 Documentation/media/videodev2.h.rst.exceptions  | 1 +
 include/uapi/linux/videodev2.h                  | 1 +
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/media/uapi/v4l/vidioc-dqevent.rst b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
index 42659a3d1705..fad853d440cf 100644
--- a/Documentation/media/uapi/v4l/vidioc-dqevent.rst
+++ b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
@@ -402,7 +402,13 @@ call.
 	that many Video Capture devices are not able to recover from a temporary
 	loss of signal and so restarting streaming I/O is required in order for
 	the hardware to synchronize to the video signal.
-
+    * - ``V4L2_EVENT_SRC_CH_COLOR_DEPTH``
+      - 0x0002
+      - This event gets triggered when color bit-depth change is detected
+	from a video decoder. Applications will have to query the new pixel
+	format and re-negotiate the queue. In most cases the streaming must be
+	stopped and restarted (:ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>`
+	followed by :ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>`).
 
 Return Value
 ============
diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
index cb6ccf91776e..209709114378 100644
--- a/Documentation/media/videodev2.h.rst.exceptions
+++ b/Documentation/media/videodev2.h.rst.exceptions
@@ -490,6 +490,7 @@ replace define V4L2_EVENT_CTRL_CH_FLAGS ctrl-changes-flags
 replace define V4L2_EVENT_CTRL_CH_RANGE ctrl-changes-flags
 
 replace define V4L2_EVENT_SRC_CH_RESOLUTION src-changes-flags
+replace define V4L2_EVENT_SRC_CH_COLOR_DEPTH src-changes-flags
 
 replace define V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ :c:type:`v4l2_event_motion_det`
 
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5f9357dcb060..1d349c9d57a7 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -2332,6 +2332,7 @@ struct v4l2_event_frame_sync {
 };
 
 #define V4L2_EVENT_SRC_CH_RESOLUTION		(1 << 0)
+#define V4L2_EVENT_SRC_CH_COLOR_DEPTH		(1 << 1)
 
 struct v4l2_event_src_change {
 	__u32 changes;
-- 
2.17.1

