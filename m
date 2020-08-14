Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6557B244F57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Aug 2020 22:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbgHNUyt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Aug 2020 16:54:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727093AbgHNUyt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Aug 2020 16:54:49 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CC3EC061386
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2020 13:54:49 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id h8so5479553lfp.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2020 13:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Vus0dqruI6TinEH786jbm9CqjsZKhoW6S8aHJE0MAZI=;
        b=oSGqWf2l5TA8ZA0SPD8bY2gh1y82+4aeVyw0p7ICfdR3GbuWbL33M9ZfRZjI3ENw29
         LFDIFcZ0jV4xo+wkraBPfGcEUMj8OHXHWGZwZpKl18Vfg2Rngl4QhGE42XOwSPDUJLEE
         GcP/BPWO7InTFOPcXJ3zYEx7h4sUQWhFDB6SR++T45mfGqFxrMV/djpAMmytazphEboX
         CeTKtvCnTCrAbMmsPpbvGskv6l0lW9zkSNqe+i4omobTrySF7aYjykinPZ1kCvWSnd0+
         X5J1zuFoGp8OmZf/cbINotUUvtmZrx2UB9FvkMWDkQqk6CH5xnzOD9kaiJbTXfES0zMe
         UaGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Vus0dqruI6TinEH786jbm9CqjsZKhoW6S8aHJE0MAZI=;
        b=i68MamhMed3NPn1RA4DNsqfLy7+Lb4FGLv1XqQfaX86GfitVQmrCsh4eafcAVadMNe
         uOKV9hPX6z2dxo3HMobPlQAavrl7aN1FomIOVjaGJ5tBGszRFLIa88nueggOxxGyhZkh
         S3az49gEPSfh/olsXlEC9fiD6owDsVdd9fD18DZUK8HpUWRvjEM0mhd+o7vrwcYO/HVu
         safgoLuYQCa6YNw7TQL0zTZ/ql89PhdVM0izs23wN3w+GO5teoE4oefIqjUBIKd/hV4B
         5ijsZQjtqPYOcVK0oa9RTl186HnHbuQcg4emcr/iofFuzYM18JwVCBB/+HDLzWIjkM8G
         HU7Q==
X-Gm-Message-State: AOAM531K74r2dXy7MbN8Ng20ArepEphaDPMoxcW4rEDOGoMzw8AmOb1L
        ThcNBnq6TBByaQTRoiU2OvCkCA==
X-Google-Smtp-Source: ABdhPJwvQrLcRLSkM8k2mJwUx1SYP+yCZWhilsJrWl7+wqlC1QSyA7B8FE3J4HX+gD4yoBOOFUVz5Q==
X-Received: by 2002:a19:8705:: with SMTP id j5mr2012582lfd.122.1597438487681;
        Fri, 14 Aug 2020 13:54:47 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id j26sm1963601lja.111.2020.08.14.13.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 13:54:47 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, robert.foss@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH 3/3] media: camss: __video_try_fmt(): don't use hardcoded constants
Date:   Fri, 14 Aug 2020 23:54:03 +0300
Message-Id: <20200814205403.27639-4-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200814205403.27639-1-andrey.konovalov@linaro.org>
References: <20200814205403.27639-1-andrey.konovalov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the definitions introduced by commit "media: camss: add support
for vidioc_enum_framesizes ioctl" instead of the hardcoded values.

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-video.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index e6255f0e6174..546393ab0a52 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -670,7 +670,7 @@ static int __video_try_fmt(struct camss_video *video, struct v4l2_format *f)
 						  1, 65528);
 			sizeimage[i] = clamp_t(u32, p->sizeimage,
 					       bytesperline[i],
-					       bytesperline[i] * 4096);
+					       bytesperline[i] * CAMSS_FRAME_MAX_HEIGHT_PIX);
 		}
 
 	for (j = 0; j < video->nformats; j++)
@@ -687,8 +687,8 @@ static int __video_try_fmt(struct camss_video *video, struct v4l2_format *f)
 	memset(pix_mp, 0, sizeof(*pix_mp));
 
 	pix_mp->pixelformat = fi->pixelformat;
-	pix_mp->width = clamp_t(u32, width, 1, 8191);
-	pix_mp->height = clamp_t(u32, height, 1, 8191);
+	pix_mp->width = clamp_t(u32, width, 1, CAMSS_FRAME_MAX_WIDTH);
+	pix_mp->height = clamp_t(u32, height, 1, CAMSS_FRAME_MAX_HEIGHT_RDI);
 	pix_mp->num_planes = fi->planes;
 	for (i = 0; i < pix_mp->num_planes; i++) {
 		bpl = pix_mp->width / fi->hsub[i].numerator *
@@ -714,7 +714,7 @@ static int __video_try_fmt(struct camss_video *video, struct v4l2_format *f)
 						  1, 65528);
 			p->sizeimage = clamp_t(u32, p->sizeimage,
 					       p->bytesperline,
-					       p->bytesperline * 4096);
+					       p->bytesperline * CAMSS_FRAME_MAX_HEIGHT_PIX);
 			lines = p->sizeimage / p->bytesperline;
 
 			if (p->bytesperline < bytesperline[i])
-- 
2.17.1

