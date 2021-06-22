Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02D193B02F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 13:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbhFVLml (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 07:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbhFVLmg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 07:42:36 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E992C061766
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jun 2021 04:40:20 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id b3so12996482wrm.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jun 2021 04:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z2HTM35L0n2QNGjiT0gcaTMB6G7YTSJkkeNRbPOxIcI=;
        b=ZNtyPaTtxaBTjXekoqNr7PIx/wIb+UYD0idlwBVEMNNx00ZmoU1rEvPcMHOmLfNTJr
         KzfqO5UTXQcTPpqqL9LsU1CSIwhcArMbcm7AA4dAukoBCqwjEPv6SNvo+bqTk4bExavU
         FRjPW+ETND3PBrvaKF/sXd108ByduGtsSxNdRziQTj1cMgFUr1PF1U4X+s3IvbmkOike
         dN3KK+jwqEFkL0hgDGWoHHQitLb4huxpzh0IJNd/oYGfC+/hF/79VoE4jpVtMGPP8edm
         16B8E1LAYu0ACSWeXPvhCnSMRKenuOJyyvBeyhBNOum1N8169igtzeqBbYZVBK8eN8eU
         4ncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z2HTM35L0n2QNGjiT0gcaTMB6G7YTSJkkeNRbPOxIcI=;
        b=KIuXQqVUF1hZWnw4DBX8IJPJe4tEr3ERtm2g0rwPtOHhbzrP8jsJA32IzTQMWeYCfg
         gnzQkQiCBhv+rfGRmKwXsQshLZSon3yreUaDo7cK4WlvNkk90bjR6kfn4iRkiCFWbYUv
         gzkUaXpiRgAeLChr2JFCa2genYdm/NQ74kTHttfYx+BDsDouHFNNe4ctoPEZk7VdZgPt
         O0qYMiv1JoS/lfzCBEyFYIj4J4XerNpm08pE5ZmjMcJAix/aHJTAeYji4jF+LMcz9yPL
         W2wm3Xl6KY9XfMjfCwh8irw8CeBExmHzD69bWXBhAesMSHpwegCiC6/168IVoJdtmOZG
         q+RA==
X-Gm-Message-State: AOAM530j0/aCK/4oL85eA93Pl5qZ5AvAL0IZNy/2aPq4rKo+LYuASCyF
        KeZ5KHgrltfGq6vCHv2x8UPXcA==
X-Google-Smtp-Source: ABdhPJxzVU1LdBEJYpPQpfeEZR+OCOBU2OcxMeuQSXjUvF79si0QRwEm6vbhi7nAM/Usy8Wwtzzouw==
X-Received: by 2002:adf:b64b:: with SMTP id i11mr4167388wre.393.1624362019123;
        Tue, 22 Jun 2021 04:40:19 -0700 (PDT)
Received: from localhost.localdomain (hst-221-32.medicom.bg. [84.238.221.32])
        by smtp.gmail.com with ESMTPSA id k2sm20690929wrw.93.2021.06.22.04.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 04:40:18 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        nicolas.dufresne@collabora.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v5 1/3] docs: ext-ctrls-codec: Document cyclic intra-refresh zero control value
Date:   Tue, 22 Jun 2021 14:39:56 +0300
Message-Id: <20210622113958.809173-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210622113958.809173-1-stanimir.varbanov@linaro.org>
References: <20210622113958.809173-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In all drivers _CYCLIC_INTRA_REFRESH_MB default control value is zero
which means that the macroblocks will not be intra-refreshed. Document
this _CYCLIC_INTRA_REFRESH_MB control behaviour in control description.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 8c6e2a11ed95..addf44b99dfa 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1174,7 +1174,9 @@ enum v4l2_mpeg_video_h264_entropy_mode -
     Cyclic intra macroblock refresh. This is the number of continuous
     macroblocks refreshed every frame. Each frame a successive set of
     macroblocks is refreshed until the cycle completes and starts from
-    the top of the frame. Applicable to H264, H263 and MPEG4 encoder.
+    the top of the frame. Setting this control to zero means that
+    macroblocks will not be refreshed.
+    Applicable to H264, H263 and MPEG4 encoder.
 
 ``V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE (boolean)``
     Frame level rate control enable. If this control is disabled then
-- 
2.25.1

