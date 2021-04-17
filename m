Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3A3363122
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Apr 2021 18:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236588AbhDQQWE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Apr 2021 12:22:04 -0400
Received: from mail-40133.protonmail.ch ([185.70.40.133]:56053 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236537AbhDQQWD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Apr 2021 12:22:03 -0400
Date:   Sat, 17 Apr 2021 16:21:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1618676495;
        bh=V0cwotR5J2nsOzzWyrrQ5p675uu29gm6T0j3r8W0fhc=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=no1Uh9BNk2DJIJGJTZYhSTHZHgdS7KdVumPf/UQLcuvKWLKIV8jHDsI0j9OYTMwnE
         r00I8KhL3ixnVAoaqqjftm25pwI4yVrv/zVWIVpewAWEdpc61weK8bIZcs6HkeVjR8
         GB7t8wzAirvWi5VhcrT84M8Jw/iXfY3hkLelCDZQ=
To:     caleb@connolly.tech, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kalyan Thota <kalyant@codeaurora.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH] drm/msm: always parse interconnects
Message-ID: <20210417161912.62811-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The WARN_ON in dpu_runtime_resume() fires constantly on non-SC7180
platforms. As SDM845 now has interconnects hooked up we should always
try and parse them.

Fixes: 627dc55c273d ("drm/msm/disp/dpu1: icc path needs to be set before dp=
u runtime resume")
Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/=
disp/dpu1/dpu_kms.c
index 85f2c3564c96..fb061e666faa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -933,8 +933,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 =09=09DPU_DEBUG("REG_DMA is not defined");
 =09}
=20
-=09if (of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss"))
-=09=09dpu_kms_parse_data_bus_icc_path(dpu_kms);
+=09dpu_kms_parse_data_bus_icc_path(dpu_kms);
=20
 =09pm_runtime_get_sync(&dpu_kms->pdev->dev);
=20
--=20
2.30.2


