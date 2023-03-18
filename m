Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E88106BFC7E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Mar 2023 20:45:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbjCRTpK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Mar 2023 15:45:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjCRTpJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Mar 2023 15:45:09 -0400
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 468AD23664
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 12:45:08 -0700 (PDT)
Received: (qmail 32315 invoked by uid 990); 18 Mar 2023 19:45:06 -0000
Authentication-Results: devico.uberspace.de;
        auth=pass (login)
MIME-Version: 1.0
Date:   Sat, 18 Mar 2023 19:45:05 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From:   "Leonard Lausen" <leonard@lausen.nl>
Message-ID: <ae78354e98b719c1fc9466d5965aea5a45ac29f6@lausen.nl>
Subject: [PATCH] drm/msm/dpu: Add support for AR30 format
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Rspamd-Bar: ---
X-Rspamd-Report: BAYES_HAM(-2.999999) MIME_GOOD(-0.1)
X-Rspamd-Score: -3.099999
Received: from unknown (HELO unkown) (::1)
        by devico.uberspace.de (Haraka/3.0.1) with ESMTPSA; Sat, 18 Mar 2023 20:45:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=lausen.nl; s=uberspace;
        h=from;
        bh=mMAvDOgPzRoHk+xlo6UuvhlBsy65oeD4+ECW73EB0gA=;
        b=khcb2mcdY+hPWv6mELQTyxizkFo7JHNhniw+Fh+fCRHQeA1DTerPCHUHpqo4pUZk11PHMMj7WN
        nDbcVoVUkuvi1cpaojPwxdLDaBy0mBlbxuBtQz6FG8x1ysU2yXzK/8zfwQ3cVoPHpHvXh/ultU+r
        BJH5mKvHa355BwL4MbGN7MIVxs2h7tFosfYMi6GOdkLXV6n7Ci00Efe9/XH0sUUkJssytmMfNV+u
        XhxvdP8GVI/eXLNSHOM9U1ZQaxBTXA2x/tSwZ2BSGtx1cnGbD5rcvFS76Whx+KjJVXOBIBE0ocsb
        SpQvT0bDCWeKoCgiqqHZd16348o3YOaYluB+k59DI7Q6Z3kbwVoGVSWvqh0txTBBdEimatdKp7MC
        gl6EcGhH5n4HPogz7Cb/ou1dJDM69E4em/mI4WydyqnTauTKMu1uWOrsHpTGVIgcsDw51cHMF66m
        9qUB/RSUv2/GaDuO+HfbhmfTbxsa3bwIgrCuY5rQIIa4quegq6n+r4vcpw3YY2MyCufe0BPkNYAG
        wyqX9bTw05529RT6PILwvXjXFGerLeRXYqUrju3gMwhORE9hi+L8qgVZ92XcFhGZ15mf+vfyG7jn
        4W3ivq3ClLt4hgJvRIwDFmneA08d+Z81+IS1fAo1r4A3UzUaYebJuNkwOxzm8FWNmck2r2XhcYRK
        A=
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
support for the 10-bit XR30 color format but missed AR30 color format.

This can trigger bugs in userspace. KDE KWin compositor for example alway=
s
prefers 10-bit color formats, rendering a 1cm^2 black box around the curs=
or due
to missing per-pixel alpha-blending if only XR30 but not AR30 support is
declared.

Signed-off-by: Leonard Lausen <leonard@lausen.nl>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu=
/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 83f1dd2c22bd..d99ce3919248 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -156,6 +156,7 @@ static const uint32_t plane_formats[] =3D {
 DRM_FORMAT_RGBX8888,
 DRM_FORMAT_BGRX8888,
 DRM_FORMAT_XBGR8888,
+ DRM_FORMAT_ARGB2101010,
 DRM_FORMAT_XRGB2101010,
 DRM_FORMAT_RGB888,
 DRM_FORMAT_BGR888,
@@ -185,6 +186,7 @@ static const uint32_t plane_formats_yuv[] =3D {
 DRM_FORMAT_RGBA8888,
 DRM_FORMAT_BGRX8888,
 DRM_FORMAT_BGRA8888,
+ DRM_FORMAT_ARGB2101010,
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
+ DRM_FORMAT_ARGB2101010,
 DRM_FORMAT_XRGB2101010,
 DRM_FORMAT_BGR565,
=20
--=20
2.30.2
