Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAF17675B1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 18:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbjATRWr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 12:22:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbjATRWq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 12:22:46 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 813E229437
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 09:22:45 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id mg12so15699718ejc.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 09:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30fedTZc83Sm2sS1XquRpkhmYzf9pEDy2MIMxTC2sH8=;
        b=n9ESsmpquDCARkLAYw8VIHoOPjt5o5luYSoGg3/ZbL6gJVQIHxt8RS4CHZme9E4L/m
         Q5YWyf9dZpop1oJCQZzL6djrLzN+jjbP0wcSheBxibusL6zAGPYuYGCsfrd8ibRdOTpz
         D1DL32AEM20rzlRu8zkrbH6kzCynw6P5E/478OqrrZhFVgaG0cFIoyTCXPoACwtbi7Vc
         UvkT5e7ckDUM6ACl8x219OjrmaXqvg5wM48Uf62m3dX3W1NwgIf2WOcX5ANHxrDKhD7w
         IIXiaDgZDaWTYAuI+9N1FobbysIPMM8cX4sKtvloriJVvnBEicE66AKNOCdnyG0DQOoy
         slOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30fedTZc83Sm2sS1XquRpkhmYzf9pEDy2MIMxTC2sH8=;
        b=r1THYwv6FJAz0Ue504n87XlDRFJ5bsCN/N3RlC+F+NQSpL1uAG6FQis9hImz1wEVek
         WUQiaOahme/xMR6SwMKpHey7+YAfwrU/+l9KEZJ2oiISN3INR34kBPYxUHLWWe9RbE7q
         lNLt1e3DRnBCCmTTt9aa3LocqwuILkz04NW5bPNWjY+vKWSnMDtgecq8Ymy0vdHDk7i5
         5i+iZOT/zpBp1IK4vbNuMWQSdkgvAxa5S/WNRlPCayryAjKrZpHeN6jopWD+z9tDVeR5
         FEZ3zxOgu9jE9OWygJVP4Hnbl0Z7SxZoZnSsZKl1J8Ji+T/jY6whqRlTmDBGajkUru8z
         MMLg==
X-Gm-Message-State: AFqh2kq+sczc6dnUh9iCUsx2Awc1TDs/ZnbqUuyFxaiYbAmmG9pn2O1q
        7hbblJx0K30Trno9q36yaEnhP5QzFLJhw4T7
X-Google-Smtp-Source: AMrXdXtxZiKqmrJNEiSXFu269RBrI85UAuiJlqn4HLOioNg+vq3aXiinKmNRgKPDkuI8uVKOrFWhOQ==
X-Received: by 2002:a17:907:1257:b0:86c:a3fc:597c with SMTP id wc23-20020a170907125700b0086ca3fc597cmr13748446ejb.27.1674235363924;
        Fri, 20 Jan 2023 09:22:43 -0800 (PST)
Received: from localhost.localdomain (abyk37.neoplus.adsl.tpnet.pl. [83.9.30.37])
        by smtp.gmail.com with ESMTPSA id s17-20020a1709060c1100b0084d21db0691sm18313857ejf.179.2023.01.20.09.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 09:22:43 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] drm/msm/a6xx: Add support for A650 speed binning
Date:   Fri, 20 Jan 2023 18:22:30 +0100
Message-Id: <20230120172233.1905761-3-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230120172233.1905761-1-konrad.dybcio@linaro.org>
References: <20230120172233.1905761-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for matching QFPROM fuse values to get the correct speed bin
on A650 (SM8250) GPUs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 0ee8cb3e490c..c5f5d0bb3fdc 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1894,6 +1894,20 @@ static u32 a640_get_speed_bin(u32 fuse)
 	return UINT_MAX;
 }
 
+static u32 a650_get_speed_bin(u32 fuse)
+{
+	if (fuse == 0)
+		return 0;
+	else if (fuse == 1)
+		return 1;
+	else if (fuse == 2)
+		return 2;
+	else if (fuse == 3)
+		return 3;
+
+	return UINT_MAX;
+}
+
 static u32 adreno_7c3_get_speed_bin(u32 fuse)
 {
 	if (fuse == 0)
@@ -1922,6 +1936,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
 		val = a640_get_speed_bin(fuse);
 
+	if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
+		val = a650_get_speed_bin(fuse);
+
 	if (val == UINT_MAX) {
 		DRM_DEV_ERROR(dev,
 			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",
-- 
2.39.1

