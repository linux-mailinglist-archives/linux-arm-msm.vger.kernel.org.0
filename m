Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05A842AC27F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 18:36:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732170AbgKIRgR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 12:36:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732041AbgKIRgI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 12:36:08 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ABE2C0613D6
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2020 09:36:08 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id dk16so13416874ejb.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2020 09:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=L9F3HkMW13rcGTb3bzExEGKic5ytenCIez631dN7HLE=;
        b=PitAaj9RXayVuhqFAVZImb2FJzaptvJrhnw4hRd7qLhtpHZt3/13gByfP2V52MOaUX
         aH5Y7+o8Wug0hJs2gyg/kpATu+uz4xGJqpaA+qMwMJNMx93z7o1RSZbdhe60teDElpma
         MZWjsED9bHeNSqbizQ32mr7FDj01m120ZIF+PLqQ2hWlxXqmbfq7/C7qIMbzCia4vpk0
         wNo+WpH7HTWxUI88xYoFekEvbl+0OmG3mqHshaIormsO/9qngltHSg3J2kMiMZiybVvo
         rnnAax8INabenQwe0yl5nNUwZISmh+wVD3Xw0HE3/3I67qQhxFnAtuHbilgLmxjQDOnA
         wLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=L9F3HkMW13rcGTb3bzExEGKic5ytenCIez631dN7HLE=;
        b=QaHCYPGqJRtINyWykJDY8viRuZNJHuqPiLeoOz3E25+jRbNR9M+n5ilb7LuQ3C1mch
         phQcjccWzGL2taq5ONSV17waG+e4zzLqyFtrnc1WMq6xtyFBYoAaWmSFGrFWW5lBqwdE
         qeYFDxtpL/yNXtD3sK3IiDzbFxipZx2hGRHOyYNwHJJYIL+X9P5z3GDM+U2i0Nq0sLDU
         S7uGfrLHNFWfvi62mUnHFE7nQyA2HYUmCuWyFIteG+Gi9IxXYy7t9lTRl9r8Jyhd9JYX
         NbZYu8Xu490cWCsHHXg6HIEyi2hMTt7mCRPZz0757vK64Yh9/bD3nkJ5Q1wFf0ZlI725
         1UQw==
X-Gm-Message-State: AOAM5327bW8Q3QSa88rRIYdP7fJhE0GJAR3oYT/amkk/e5jym3B1U7YZ
        boUyjNyB8EntIVmM1/lVw9O9JA==
X-Google-Smtp-Source: ABdhPJyPOQ+Ryay5dRFIcvl4AnOiW4HTmIeH+B3sow5u7A2Zn8mHc5EEGOQcqZwKV+qqfynNNsUwQQ==
X-Received: by 2002:a17:906:1381:: with SMTP id f1mr15609974ejc.87.1604943367038;
        Mon, 09 Nov 2020 09:36:07 -0800 (PST)
Received: from localhost.localdomain (hst-221-89.medicom.bg. [84.238.221.89])
        by smtp.gmail.com with ESMTPSA id jw7sm9123981ejb.54.2020.11.09.09.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 09:36:06 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 4/4] docs: Deprecate mfc display delay controls
Date:   Mon,  9 Nov 2020 19:35:41 +0200
Message-Id: <20201109173541.10016-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201109173541.10016-1-stanimir.varbanov@linaro.org>
References: <20201109173541.10016-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Deprecate mfc private display delay and display enable controls for
new clients and use the standard controls instead.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst        | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 82c9cda40270..b8f69c52b2a2 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -2771,6 +2771,11 @@ MFC 5.1 Control IDs
     feature can be used for example for generating thumbnails of videos.
     Applicable to the H264 decoder.
 
+    .. note::
+
+       This control is deprecated. Use the standard
+       ``V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY_ENABLE`` control instead.
+
 ``V4L2_CID_MPEG_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY (integer)``
     Display delay value for H264 decoder. The decoder is forced to
     return a decoded frame after the set 'display delay' number of
@@ -2778,6 +2783,11 @@ MFC 5.1 Control IDs
     of display order, in addition the hardware may still be using the
     returned buffer as a reference picture for subsequent frames.
 
+    .. note::
+
+       This control is deprecated. Use the standard
+       ``V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY`` control instead.
+
 ``V4L2_CID_MPEG_MFC51_VIDEO_H264_NUM_REF_PIC_FOR_P (integer)``
     The number of reference pictures used for encoding a P picture.
     Applicable to the H264 encoder.
-- 
2.17.1

