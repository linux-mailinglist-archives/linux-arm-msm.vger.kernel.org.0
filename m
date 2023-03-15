Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68D3C6BB61F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 15:34:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbjCOOeP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 10:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231154AbjCOOeO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 10:34:14 -0400
X-Greylist: delayed 402 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 15 Mar 2023 07:34:10 PDT
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 898F14347C
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 07:34:09 -0700 (PDT)
Received: (qmail 18003 invoked by uid 990); 15 Mar 2023 14:27:26 -0000
Authentication-Results: devico.uberspace.de;
        auth=pass (plain)
From:   Leonard Lausen <leonard@lausen.nl>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: Add support for AR30 format
Date:   Wed, 15 Mar 2023 14:27:06 +0000
Message-ID: <864jqmw0n9.fsf@lausen.nl>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Bar: ---
X-Rspamd-Report: BAYES_HAM(-2.999999) MIME_GOOD(-0.1)
X-Rspamd-Score: -3.099999
Received: from unknown (HELO unkown) (::1)
        by devico.uberspace.de (Haraka/3.0.1) with ESMTPSA; Wed, 15 Mar 2023 15:27:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=lausen.nl; s=uberspace;
        h=from;
        bh=j7/a5HItpL7CPAILjLI30SM3Uf3gqQslqNLmr5RYGs8=;
        b=xBpwCaferJ1Bnx++RPTfcwqkw8FF5QkQpLwpiMaPqe+86OqFJRCEdEjyshHlz6PeyAdycih7hR
        /iJGhIkpN2gFl+ATdHrL7B3mrc7AgGMDnPjbJKDZamFyw+ouyLQw4HdzMSSsY5ajjjD6zC7m3Qc1
        p4TMRY4fVEiaWCu1rIzyCbEDxm3tBj+ZVOHftPy9ECHsvy+W7/D6/Bv5lRlq4Jx97qRd4/fXYFDb
        ByIdkScjYkL4XzLsudcNLmW06PFK9/sCoC1EuX91JmbVZbFvkxIcscwUc6XzXI9+l21eajfyfkBE
        3i6DjHjLyGej+NSBhHQrkJbiVJf4+PzmMNnvsdtTVz7iGPTzRqVm0wy0kL5nU6ZILBP5Om4mV+hc
        dgPBJgKI6pdGtwdSZnLwpuQtNeqU1+3jcTixAjz/u6OJgCzQ9OHBCfKK4turlaG3SuV5rx+6iEYO
        1t67GabxMKmbwVAZxnyVzVgKjjfFBh4fBF8dfQ+y9Z6JT4V/YlFsodKkPJcuzKanDeMuKrgbPw5R
        I3V3k/6r0aj/vf177cWII9LU1rQzpIMKAPvJw0q1V1ptjdQla0+UAKJqYbusvaQOJe5pdUamn8G1
        9CxBtSssKB+WwYFJPBwODgEjWC6BZ9uMVw043549xX8jX+kLykMYRbG7EKCrKYI24pbv4dy/6OA8
        Q=
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,MSGID_FROM_MTA_HEADER,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Commit da7716a249b699978fb5 ("drm/msm/dpu: Add support for XR30 format") enabled
support for the 10-bit XR30 color format but missed enabling support for the
corresponding per-pixel alpha-blending AR30 color format.

Declaring only XR30 but not AR30 color format support can trigger bugs in
userspace. KDE KWin compositor for example always prefers 10-bit color formats,
rendering a 1cm^2 black box around the cursor if only XR30 but AR30
support is declared.

Signed-off-by: Leonard Lausen <leonard@lausen.nl>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 83f1dd2c22bd..d99ce3919248 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -156,6 +156,7 @@ static const uint32_t plane_formats[] = {
        DRM_FORMAT_RGBX8888,
        DRM_FORMAT_BGRX8888,
        DRM_FORMAT_XBGR8888,
+       DRM_FORMAT_ARGB2101010,
        DRM_FORMAT_XRGB2101010,
        DRM_FORMAT_RGB888,
        DRM_FORMAT_BGR888,
@@ -185,6 +186,7 @@ static const uint32_t plane_formats_yuv[] = {
        DRM_FORMAT_RGBA8888,
        DRM_FORMAT_BGRX8888,
        DRM_FORMAT_BGRA8888,
+       DRM_FORMAT_ARGB2101010,
        DRM_FORMAT_XRGB2101010,
        DRM_FORMAT_XRGB8888,
        DRM_FORMAT_XBGR8888,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index bfd5be89e8b8..0ed6a1a114c7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -69,6 +69,7 @@ static const uint32_t qcom_compressed_supported_formats[] = {
        DRM_FORMAT_ARGB8888,
        DRM_FORMAT_XBGR8888,
        DRM_FORMAT_XRGB8888,
+       DRM_FORMAT_ARGB2101010,
        DRM_FORMAT_XRGB2101010,
        DRM_FORMAT_BGR565,
 
-- 
2.30.2
