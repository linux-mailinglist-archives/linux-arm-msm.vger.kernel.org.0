Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 709D92F979
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2019 11:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbfE3Jd3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 May 2019 05:33:29 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34540 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbfE3Jd3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 May 2019 05:33:29 -0400
Received: by mail-wr1-f65.google.com with SMTP id f8so3746856wrt.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2019 02:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=6m1gjqr7LLo5czWaTNxbcS9O7G75X5W+OVxVsjgwdOk=;
        b=dmyIRlMRlkjOTvPMU8h28OONRBSGMbu5OSkC56ceQtI82uyy9wZSUWnAAFvv4qeefD
         1uH+WS2sxeXVRW2DNdtQA1dDIEw6uVypGKzciRZoT6bctV3lMYh+jNP1ZR36djmDCLjw
         VKLc53Cg59P21NX3oLbIHnVwGGcPUG1neQP65J7MTFocgNYwh20lwAGvv3Ngi8M2C82+
         0fvLmrK0jdeSOBNSEQdAbiJWsx3fUupQM0n/aD6hJWbVcLzf+l4XVtOED3rcZchEf3ut
         bVwX3gW/aTaj4Dm6vSGvA5Jlw9ng9ZXieYne8XtFL5y7PF4Y3iBDODeM8v5OEF8Ttnc3
         biHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6m1gjqr7LLo5czWaTNxbcS9O7G75X5W+OVxVsjgwdOk=;
        b=AmyhVCPDN+PY5czcP81almOzPvy90hYb1rOwGQj+FIPP8gDDwSKDjEElgAiVSU28hj
         Zr2YAD9XAZs2C76LyZ/c/Jj1420eebU52bCb8M/HRIUUH8U4n4JVDa+QhIshZmNLc46a
         dgWdib/sxv+fsvtVNZko3AdXsLTzZMVCwUqwUxmy/2i6TOfE3KtQy4Oj+iBkmGTY+kyu
         cyUoP0ltHHYHcFqqFtA9bFg0OF+sbF9nwbckntd933NQ1UdXX9V1SsJW3RQcMn16IcWn
         2QcJ1ssz9aCOXM0hKx97MyAAPlrMQgABMJ6vGLuLOATJlhW44/0DOdhvjryTQuZya0BW
         aRaA==
X-Gm-Message-State: APjAAAVhRMrnjYnw/sxHI4xjPxCGNgIKB1/ueoX5pJZop76+xdKac4oT
        kw1yxQwNHFUopbI2GL7QhWHo6g==
X-Google-Smtp-Source: APXvYqxEASlLnIkp5PQbSa4BfrTxFJ6g24r6qZiMp+C9TsnMS8uQxuD/y1DzZGzNDx7DhMVpHGITmg==
X-Received: by 2002:adf:c982:: with SMTP id f2mr1940460wrh.235.1559208808019;
        Thu, 30 May 2019 02:33:28 -0700 (PDT)
Received: from localhost.localdomain ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id a124sm2863900wmh.3.2019.05.30.02.33.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 02:33:26 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3] media/doc: Allow sizeimage to be set by v4l clients
Date:   Thu, 30 May 2019 12:33:12 +0300
Message-Id: <20190530093312.27562-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This changes v4l2_pix_format and v4l2_plane_pix_format sizeimage
field description to allow v4l clients to set bigger image size
in case of variable length compressed data.

Presently s5p-mfc and mtk-vcodec codec drivers use that. Lets
make it obvious in the documentation.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
Changes since v2:
Addressed review comments from Mauro.

 .../media/uapi/v4l/pixfmt-v4l2-mplane.rst         | 15 ++++++++++++++-
 Documentation/media/uapi/v4l/pixfmt-v4l2.rst      | 13 ++++++++++++-
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst b/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst
index 5688c816e334..db43dda5aafb 100644
--- a/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst
+++ b/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst
@@ -31,7 +31,20 @@ describing all planes of that format.
 
     * - __u32
       - ``sizeimage``
-      - Maximum size in bytes required for image data in this plane.
+      - Maximum size in bytes required for image data in this plane,
+	set by the driver. When the image consists of variable length
+	compressed data this is the number of bytes required by the
+	codec to support the worst-case compression scenario.
+
+	The driver will set the value for uncompressed images.
+
+	Clients are allowed to set the sizeimage field for variable length
+	compressed data flagged with ``V4L2_FMT_FLAG_COMPRESSED`` at
+	:ref:`VIDIOC_ENUM_FMT`, but the driver may ignore it and set the
+	value itself, or it may modify the provided value based on
+	alignment requirements or minimum/maximum size requirements.
+	If the client wants to leave this to the driver, then it should
+	set sizeimage to 0.
     * - __u32
       - ``bytesperline``
       - Distance in bytes between the leftmost pixels in two adjacent
diff --git a/Documentation/media/uapi/v4l/pixfmt-v4l2.rst b/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
index 71eebfc6d853..da6da2ef139a 100644
--- a/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
+++ b/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
@@ -89,7 +89,18 @@ Single-planar format structure
       - Size in bytes of the buffer to hold a complete image, set by the
 	driver. Usually this is ``bytesperline`` times ``height``. When
 	the image consists of variable length compressed data this is the
-	maximum number of bytes required to hold an image.
+	number of bytes required by the codec to support the worst-case
+	compression scenario.
+
+	The driver will set the value for uncompressed images.
+
+	Clients are allowed to set the sizeimage field for variable length
+	compressed data flagged with ``V4L2_FMT_FLAG_COMPRESSED`` at
+	:ref:`VIDIOC_ENUM_FMT`, but the driver may ignore it and set the
+	value itself, or it may modify the provided value based on
+	alignment requirements or minimum/maximum size requirements.
+	If the client wants to leave this to the driver, then it should
+	set sizeimage to 0.
     * - __u32
       - ``colorspace``
       - Image colorspace, from enum :c:type:`v4l2_colorspace`.
-- 
2.17.1

