Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC4A2F755A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 10:28:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728173AbhAOJ2P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 04:28:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730375AbhAOJ1s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 04:27:48 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB71C06179F
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 01:26:29 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id b2so8777155edm.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 01:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NPpTp6a6u7fOZ3GfoVMqP0h5qwWkDaaqGx3MQZmmFIU=;
        b=uMAA8EshSzFzDykdzTxOtz+DOjd9oB+lBVytXRmkeZbkPOvJcWqiycin0jTas0XdPR
         Abx7o0jv/ZFIpGgUyOdpdwufLQpzCbgh7khYlSroxcprt0ZC//THezzvYBxX15pVrEB0
         oC8YMc7jYOYu/9FwnfbCmkgKNocSg3QNnWYKeJBOm1gzE3nYTxNh5snzdRiAgtqFqpZ/
         6NSEnUyZfGsg6A3YXrCXYTcfAFNoGFyCFv4j8EdpzBDAGYkTt6QyNt5RLBS3F2/PtKN8
         GTqDetFFpRmSBx2LI3hHvRC4CiBSOnSeRf0L5mu9mJWs94RFTHiAWQ0rVKfea4WUcTdD
         Y35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NPpTp6a6u7fOZ3GfoVMqP0h5qwWkDaaqGx3MQZmmFIU=;
        b=Es+Jv91tDIMajaxHTGsEEjSQAaFAf+w5VRGIOceyb/WwrIIaYDRT6XLUSYEO8hIxxe
         d0CpLhMTGOggglAHJZJ6z2emfXQPQ5I9a5AusisF5fTfY22cP0Q6AwvDLd+t6tZuWXg3
         MaS1uwS2bjLfokp74UHjBHAEaZpBQ/T3gxQTTRSIAA5WVPFU/j2bGMk3Pz4wHF7tll3/
         krVJ9gk9ifo8vZVSg5fqTy7YiVV5CE/7fA5LUqXhcqBCLcQuE447lO7Wm/PfgVWtvcqg
         hXsts0zw0sKRNVobiYH7i3NnX7xfRaCDrJSs9J96KVIVYptOtcHr2Fmpefl86Ufc1Ezu
         BlEA==
X-Gm-Message-State: AOAM531x2XDtJkSKgD4x6DDPwPFqxzhN/Ea/wPYrnMn08dK2rHWA3sQ6
        BNdZ1RAlwFOxHVgmg2XqqYzuDg==
X-Google-Smtp-Source: ABdhPJw84zuV4cS7/a+LJQv0YdUKaq2TAeJk8mtppmG+PidICGNdaA6qBwFXKRGGNfr0Lj30tSEqiA==
X-Received: by 2002:a05:6402:5206:: with SMTP id s6mr7291383edd.92.1610702788407;
        Fri, 15 Jan 2021 01:26:28 -0800 (PST)
Received: from localhost.localdomain (hst-221-63.medicom.bg. [84.238.221.63])
        by smtp.gmail.com with ESMTPSA id u24sm3004140eje.71.2021.01.15.01.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 01:26:27 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 4/4] docs: Deprecate mfc display delay controls
Date:   Fri, 15 Jan 2021 11:26:07 +0200
Message-Id: <20210115092607.29849-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210115092607.29849-1-stanimir.varbanov@linaro.org>
References: <20210115092607.29849-1-stanimir.varbanov@linaro.org>
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
index 5d7c47837035..815c6eb4a0d0 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -2111,6 +2111,11 @@ MFC 5.1 Control IDs
     feature can be used for example for generating thumbnails of videos.
     Applicable to the H264 decoder.
 
+    .. note::
+
+       This control is deprecated. Use the standard
+       ``V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE`` control instead.
+
 ``V4L2_CID_MPEG_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY (integer)``
     Display delay value for H264 decoder. The decoder is forced to
     return a decoded frame after the set 'display delay' number of
@@ -2118,6 +2123,11 @@ MFC 5.1 Control IDs
     of display order, in addition the hardware may still be using the
     returned buffer as a reference picture for subsequent frames.
 
+    .. note::
+
+       This control is deprecated. Use the standard
+       ``V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY`` control instead.
+
 ``V4L2_CID_MPEG_MFC51_VIDEO_H264_NUM_REF_PIC_FOR_P (integer)``
     The number of reference pictures used for encoding a P picture.
     Applicable to the H264 encoder.
-- 
2.17.1

