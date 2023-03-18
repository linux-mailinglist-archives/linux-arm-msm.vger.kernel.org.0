Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01FFA6BFC65
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Mar 2023 20:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbjCRT1N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Mar 2023 15:27:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjCRT1M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Mar 2023 15:27:12 -0400
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8C0B1630C
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 12:27:08 -0700 (PDT)
Received: (qmail 14307 invoked by uid 990); 18 Mar 2023 19:27:06 -0000
Authentication-Results: devico.uberspace.de;
        auth=pass (login)
MIME-Version: 1.0
Date:   Sat, 18 Mar 2023 19:27:06 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From:   "Leonard Lausen" <leonard@lausen.nl>
Message-ID: <ce9e552fe93d90a834d52d7b10d54267ed820405@lausen.nl>
Subject: [PATCH] drm/msm/dpu: Add support for AR30 format
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, linux-arm-msm@vger.kernel.org
X-Rspamd-Bar: ---
X-Rspamd-Report: BAYES_HAM(-2.999999) MIME_GOOD(-0.1)
X-Rspamd-Score: -3.099999
Received: from unknown (HELO unkown) (::1)
        by devico.uberspace.de (Haraka/3.0.1) with ESMTPSA; Sat, 18 Mar 2023 20:27:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=lausen.nl; s=uberspace;
        h=from;
        bh=nz8jUM1tCsgjW9CQceQGmnDkwMYqg24ScGejMccXFKo=;
        b=wyZZ3Ow25JBjLiFn/GPKq9FKSk1v2a7pV1cQtCGaZ0TtveRAJNRBgVLwj1QPkZb2TShd7ft3J0
        XhjO8U5P/y0YVORIr6yFIH0A2EynQ7ckFriE0qt2w51wuGJNE3XNyZleSXyhyxtpmxvEtiXX10lm
        5v4hPhKR1PKlxmdM3eJ0EpQDfKyF1x/m1wwcGgzPcait9T06aI+zI19kbqLR2OUz9qBqbAovz2xa
        trwSxDsHopoJ4ClpI9CcNdDe8rZRRlSPWulhYc6Q2KdxiX1PjVKTrkQGssKvMJxO6S3ed8ZqI5qk
        5WoUPpbJmUT+IeT+rcYe97sRkcsq8JYvVhkbwDDz+r+RJ7UlhON9+Qqht9Eqbc5653l6YdQJ7Rio
        ebsmd8v9nTh8nIo2nvXs5Rc0qkI4WFmkyCPMgDmDUUBNjbtLHdAsMiZWnNOjj4rk2jv07+ATBOAv
        RdPS8JAmFqtuDqUcwI0TxScnhPVPusmTFnRydFq4Z2BBrgAqNeYs0a24FKU9zFwwNRXwpGu5RJiI
        tMQGMkDnjCGNskukZvvrUH7KiDa6XZQStZDaBbpnfzZo2A7e6NcVGt/r93vra64V9OqDNoFTkxm5
        KZqT/Q2d1FzM88ZPwms6v+T3jbypEtC1W6AE2p7ufSXWs9AI21h+P/hOc8k/Xo7ANAKJYXwYUK6e
        4=
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 1 +
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
+       DRM_FORMAT_ARGB2101010,
        DRM_FORMAT_XRGB2101010,
        DRM_FORMAT_RGB888,
        DRM_FORMAT_BGR888,
@@ -185,6 +186,7 @@ static const uint32_t plane_formats_yuv[] =3D {
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
