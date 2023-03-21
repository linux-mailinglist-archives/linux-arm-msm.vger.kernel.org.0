Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1FE6C2861
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 03:58:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbjCUC6N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 22:58:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjCUC6M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 22:58:12 -0400
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCB8840EC
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 19:58:08 -0700 (PDT)
Received: (qmail 25382 invoked by uid 990); 21 Mar 2023 02:58:04 -0000
Authentication-Results: devico.uberspace.de;
        auth=pass (plain)
MIME-Version: 1.0
Date:   Tue, 21 Mar 2023 02:58:04 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From:   "Leonard Lausen" <leonard@lausen.nl>
Message-ID: <6f33219dc848ccd7122bce6933338033aa18c33c@lausen.nl>
TLS-Required: No
Subject: [PATCH v2] drm/msm/dpu: Add support for AR30 format
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Rspamd-Bar: ---
X-Rspamd-Report: BAYES_HAM(-2.999999) MIME_GOOD(-0.1)
X-Rspamd-Score: -3.099999
Received: from unknown (HELO unkown) (::1)
        by devico.uberspace.de (Haraka/3.0.1) with ESMTPSA; Tue, 21 Mar 2023 03:58:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=lausen.nl; s=uberspace;
        h=from;
        bh=rYbDhks1ZE3HAb7y2rSMfUjbBwhYGu9ZnE2vd1eSzvM=;
        b=MDTpbnXG29DKkpF8ZfL2uLn/Q3jPopFzVlffIANlVfzjDtZShZ4aOLTLA/bQZ80HQCHiEOMnaO
        9JRgBh2b0xsrZeSweogA+k2YyT9oFHZLLU60S52hfVQ9gqyVrLWgz3/pXLAb9URTZAaKJLDMDwcF
        QY/Tf5cM0QQjOUpiIY9kqQBEzR/v/QWtbTNNKyZsu4XkDi4uxYqMTIcMPfGbX8Om6bu9Ge4R+wg5
        jWdCZ2yie56kDHioAISflmYrVRJHa120b7byyd+X3u/Q06jKHRbuyxPOkCbHFqkcTvHujdXJoLcp
        BcdfPFMs0RiUBA43QVo1b9HoxSWpm8FRBgov6fz7BuEEQpDc4ObqLJATtGVD8fKFJBkrTdZttXog
        DLJLJliHWlc7SjL/vCtoY41BPhHV3LI3ZlJ1ebzKurWY2AEord89twkKJfFg9UHF34fi7fzesuYu
        tYOWF3RCqZu/j6k7nm9foC53SQDg6jtmFT8GH2cOt0w1G+PopCSF4+MeBRqgFgTFLCUmkOxj2TBP
        VlEtXtdQ614185sY4Hh97A3sE4B59kzutEGglxlt8yd7AwDSf1n2/s2UdP4OgUmpUkR/804fNP7k
        kixRrhajOBthYsl1eqJFHUUN2OmNIf3/BJyIGaO+IDgExd/2idkQszfU9erXMJVL3LpHTf6bgIPn
        8=
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,MSGID_FROM_MTA_HEADER,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Commit da7716a249b699978fb5 ("drm/msm/dpu: Add support for XR30 format") =
enabled
support for the 10-bit XR30 color format but missed enabling support for =
the
corresponding per-pixel alpha-blending AR30 color format.

Declaring only XR30 but not AR30 color format support can trigger bugs in
userspace. KDE KWin compositor versions prior to 5.27.3 for example prefe=
r
10-bit color formats, rendering a 1cm^2 black box around the cursor due t=
o
missing per-pixel alpha-blending.

Signed-off-by: Leonard Lausen <leonard@lausen.nl>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    | 11 +++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      |  1 +
 3 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_formats.c
index d95540309d4d..2b1ef186b909 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -536,6 +536,16 @@ static const struct dpu_format dpu_format_map_ubwc[]=
 =3D {
                true, 4, DPU_FORMAT_FLAG_DX | DPU_FORMAT_FLAG_COMPRESSED,
                DPU_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
=20
+=20      /* XRGB2101010 and ARGB2101010 purposely have the same color
+        * ordering.  The hardware only supports ARGB2101010 UBWC
+        * natively.
+        */
+       INTERLEAVED_RGB_FMT_TILED(ARGB2101010,
+               COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+               C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
+               true, 4, DPU_FORMAT_FLAG_DX | DPU_FORMAT_FLAG_COMPRESSED,
+               DPU_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
+
        PSEUDO_YUV_FMT_TILED(NV12,
                0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
                C1_B_Cb, C2_R_Cr,
@@ -591,6 +601,7 @@ static int _dpu_format_get_media_color_ubwc(const str=
uct dpu_format *fmt)
                {DRM_FORMAT_XBGR8888, COLOR_FMT_RGBA8888_UBWC},
                {DRM_FORMAT_XRGB8888, COLOR_FMT_RGBA8888_UBWC},
                {DRM_FORMAT_ABGR2101010, COLOR_FMT_RGBA1010102_UBWC},
+               {DRM_FORMAT_ARGB2101010, COLOR_FMT_RGBA1010102_UBWC},
                {DRM_FORMAT_XRGB2101010, COLOR_FMT_RGBA1010102_UBWC},
                {DRM_FORMAT_XBGR2101010, COLOR_FMT_RGBA1010102_UBWC},
                {DRM_FORMAT_BGR565, COLOR_FMT_RGB565_UBWC},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu=
/drm/msm/disp/dpu1/dpu_hw_catalog.c
index e8a217d242ca..6ae9c5358c5c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -157,6 +157,7 @@ static const uint32_t plane_formats[] =3D {
        DRM_FORMAT_RGBX8888,
        DRM_FORMAT_BGRX8888,
        DRM_FORMAT_XBGR8888,
+       DRM_FORMAT_ARGB2101010,
        DRM_FORMAT_XRGB2101010,
        DRM_FORMAT_RGB888,
        DRM_FORMAT_BGR888,
@@ -186,6 +187,7 @@ static const uint32_t plane_formats_yuv[] =3D {
        DRM_FORMAT_RGBA8888,
        DRM_FORMAT_BGRX8888,
        DRM_FORMAT_BGRA8888,
+       DRM_FORMAT_ARGB2101010,
        DRM_FORMAT_XRGB2101010,
        DRM_FORMAT_XRGB8888,
        DRM_FORMAT_XBGR8888,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/=
msm/disp/dpu1/dpu_plane.c
index bfd5be89e8b8..0ed6a1a114c7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -69,6 +69,7 @@ static const uint32_t qcom_compressed_supported_formats=
[] =3D {
        DRM_FORMAT_ARGB8888,
        DRM_FORMAT_XBGR8888,
        DRM_FORMAT_XRGB8888,
+       DRM_FORMAT_ARGB2101010,
        DRM_FORMAT_XRGB2101010,
        DRM_FORMAT_BGR565,
=20
--=20
2.30.2
