Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5537C3153CE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 17:28:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232868AbhBIQ02 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 11:26:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232846AbhBIQ0L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 11:26:11 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C502BC06178C
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 08:24:50 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id a16so2037129wmm.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 08:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EI1EcA+D88VC2CjRtNWFjgy2Ge54caq8DUdTYfEpBQs=;
        b=jHpgpy17JbMvJLjyX/xNOcYywv0BRkfKBFJWNCtbWcr0Iedj5o8Eq/hb0tnaxvfa0b
         4sOwopQ8iTAlAtSmC5ciNAip9dPKL8/LueZLmRmhlVA2Qx0STeVeDjcW1QFtzIRfTALz
         5VHXF7g8FzrAA5b1WMRQda49bZNEWpBA6EL4ZBPEr8MWGNz505/wVi1+2IZY429fIcrs
         p47E4XSx6i8pkTQLRzgp+Ipm8iMy3P8vzM6zqB0LPR+Q0EdM8dlvofN89V4iCLchso7G
         +bluxF/nKN61Vg8Xuhs/cTii1cWFtW3e2NZXHydsYZXbIxh9+Fr/QUg9s0Lt65ZceBfZ
         8ahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EI1EcA+D88VC2CjRtNWFjgy2Ge54caq8DUdTYfEpBQs=;
        b=SaX/MaK0hxtolfkN33zCoS13Kjvv9+Tld754Q/PqEAG0Az/Tuzzob/Qr8GLCpfBrD4
         F4+FDqZjWUg7bNvvpvsOdbQXcTfMJ9hz5hFSnytmjr8hdnB+IkiwO/+uL/ggkAgSqLx2
         zMZS7V4pk09otF2sVtvhHQN6RzrI8FIu94ZbVSl6t0EPOfUm3ZY/DLyKGpfatxhco8sO
         UPWuHpKvP1Ll9SZSb1sMnhPHsCi1dvzU80YNVV7hQ7jU5c8W+rKxHjsfrxpAJWvfVTde
         8cdwGrJXC0aAT0gjWjHT4Xxkb1U66n/z+R3DzyoU2Tb/cQlbPh0UfRIP5QtgKD8xUDhw
         T2ew==
X-Gm-Message-State: AOAM5326G/Y1aASRJ/nuS1V38xTYtsthesGggqBBkwGQR3hZaaYpubI2
        xN9YjE3H74mKfzyM16ElDSzYFA==
X-Google-Smtp-Source: ABdhPJxHTxkwAbyM2aE0RtSnmKmwOPIJ4+gCzmIhiClcKZ2d1/l3cS46DdncjtShMrFqtFVar55SnA==
X-Received: by 2002:a1c:e90d:: with SMTP id q13mr4192172wmc.136.1612887889436;
        Tue, 09 Feb 2021 08:24:49 -0800 (PST)
Received: from localhost.localdomain (hst-221-125.medicom.bg. [84.238.221.125])
        by smtp.gmail.com with ESMTPSA id w8sm45210wrm.21.2021.02.09.08.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 08:24:49 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v5 2/5] docs: Document colorimetry class
Date:   Tue,  9 Feb 2021 18:24:22 +0200
Message-Id: <20210209162425.3970393-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210209162425.3970393-1-stanimir.varbanov@linaro.org>
References: <20210209162425.3970393-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a document for ext control colorimetry class.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../userspace-api/media/v4l/common.rst        |  1 +
 .../media/v4l/ext-ctrls-colorimetry.rst       | 22 +++++++++++++++++++
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  4 ++++
 3 files changed, 27 insertions(+)
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
index 000000000000..862f78b41b32
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
@@ -0,0 +1,22 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _colorimetry-controls:
+
+*****************************
+Colorimetry Control Reference
+*****************************
+
+The Colorimetry class includes controls for High Dynamic Range
+imaging for representing colors in digital images and video. The
+controls should be used for video and image encoding and decoding
+as well as in HDMI receivers and transmitters.
+
+Colorimetry Control IDs
+-----------------------
+
+.. _colorimetry-control-id:
+
+``V4L2_CID_COLORIMETRY_CLASS (class)``
+    The Colorimetry class descriptor. Calling
+    :ref:`VIDIOC_QUERYCTRL` for this control will
+    return a description of this control class.
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index b9c62affbb5a..8a95ebdd499a 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -394,6 +394,10 @@ still cause this situation.
       - 0xa40000
       - The class containing stateless codec controls. These controls are
 	described in :ref:`codec-stateless-controls`.
+    * - ``V4L2_CTRL_CLASS_COLORIMETRY``
+      - 0xa50000
+      - The class containing colorimetry controls. These controls are
+	described in :ref:`colorimetry-controls`.
 
 Return Value
 ============
-- 
2.25.1

