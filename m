Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDA0F2FCE90
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jan 2021 12:01:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731325AbhATKby (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 05:31:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731290AbhATJ1P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 04:27:15 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B26FBC061793
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 01:26:33 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id d22so13889295edy.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 01:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cNEG6Wf0FIfViBspVuOimQ9Ufn7OM3gR5b0lBFKYH9s=;
        b=w3DM53GoY3/BqPTYQ9HHe9jPcIQOY2KZRFnfsde2B3+gHng6/IM0kq0P8g0UzqN8cF
         AZu6liGhdskAPOJgSe6zuqHppseXAIpB9Klj35tQ41kMActjknJkWK+ITLF0jd3vDxoE
         UjtjFZW6qw3FwFPa/dSK42r2tqZ/WLZbVy6pvSmpEts2XpAPL28dR88/NwtVQHVglIrW
         wkgRSjJKcCmtXEpItONAplJNSwWzU2zIcafuN5lg4ko7fFkV0uhKrkKK4S+A8uH6CaWn
         YFndia741VRzTF6tJreMEy0Ctpi4JjW6I6IU5dPhXqtTFxyYfds/+Ps8USSRzaOOXPz/
         XJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cNEG6Wf0FIfViBspVuOimQ9Ufn7OM3gR5b0lBFKYH9s=;
        b=DoXnoEIUeHgzhUrny2QESK6pZ6IXwx1ujZW+TIJkTsO2vd/w9FDZO+8eNmWIzLqGju
         Vo4ssFKnZe9M2jlzZ5xM1D8PEkxLsfXByxVFmxwEYOi2i6C/zb4hZXaXpmfpHb00JlGn
         cZ0AY8F+WiF6p4YxsMMtdnGiazu2NYic0ye1MPD9/OCbdp33BIMKDPL6rQ/rWMWkrOJO
         93h6GZdMccK2BliAQRehE0OZQWy3AQaVvHi6ic5wHdlZhzZVPgJBeUmh7fOXsFdvox1q
         I5fAhphJTrWNozKX2k6z80CdV8g+FzO6OmTKihuQHGoNOvw3GFN9+ouKNkkcg4Y/qcRq
         /bkw==
X-Gm-Message-State: AOAM530AQ6hBDyKLntiKUjTRnOhVcOXkSCTRunooAu/watM25ItasBmL
        YsQW7jF/p5XgMx7sbK8+wEIIyg==
X-Google-Smtp-Source: ABdhPJyMFxPjSTe5/tLrPdZGq7xwIVcnOlU+Efz0xBj30QCTOuprpWQzAyY0hgsAA+dr6x/u+Gmpjw==
X-Received: by 2002:aa7:cd4c:: with SMTP id v12mr6641709edw.17.1611134792447;
        Wed, 20 Jan 2021 01:26:32 -0800 (PST)
Received: from localhost.localdomain (hst-221-66.medicom.bg. [84.238.221.66])
        by smtp.gmail.com with ESMTPSA id k16sm619392ejd.78.2021.01.20.01.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 01:26:32 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v4 2/5] docs: Document colorimetry class
Date:   Wed, 20 Jan 2021 11:26:03 +0200
Message-Id: <20210120092606.3987207-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120092606.3987207-1-stanimir.varbanov@linaro.org>
References: <20210120092606.3987207-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a document for ext control colorimetry class.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../userspace-api/media/v4l/common.rst        |  1 +
 .../media/v4l/ext-ctrls-colorimetry.rst       | 19 +++++++++++++++++++
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  4 ++++
 3 files changed, 24 insertions(+)
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
index 000000000000..6b0cd2054e84
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
@@ -0,0 +1,19 @@
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

