Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B45779F9CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Sep 2023 07:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234558AbjINFHW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Sep 2023 01:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234627AbjINFHV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Sep 2023 01:07:21 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02DAB193
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 22:07:17 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2bcbfb3705dso7887801fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 22:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694668035; x=1695272835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vs/sONTuFxT7d70u1Gf/NsyWFVFvMq5cvgFjVG2LwcQ=;
        b=hboIPPvbNmCMzhj9ZubTNDJhADXYsyKZ2BzEkRWpcuT3SWq7AYcKH2ibSwiRukzfR5
         Et8CN0F52QEiD13JQknNa5ZBUb262lep+vmJV7s997GgNNhBGRlPmhj17wabU340mqiz
         kvAG8W1yMUslDZzCjKzoEQ8qMhy62fsQavWneX5J2NPPh3+LGWTgwhPuOu672tu6Mfft
         BoSZvgnq5mrIjeW2CuMo7ay8H47Ti/hK7aNSjMxuMerl9bwmiX8q9P6RuI4iD5Jyn9RF
         N67tk8WVxvV6ujTNponhUyXcY555toH3Khyx/a8qdYF7zzNsoa8CosakJfGqQypHmC0H
         jaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694668035; x=1695272835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vs/sONTuFxT7d70u1Gf/NsyWFVFvMq5cvgFjVG2LwcQ=;
        b=b15GORpUoGhLK2df0yXr+b135UYLuAjfVLVuPIg9yIb7mBEDXN9KRmEXrmIr7cHpr5
         UDNdflPj0xhDDy2RVbE9c2QKe4dWFGjooIX+WdsH692+k23sx6wIJzjOy5MB1Py6hdRY
         KoAe7tqvr2g/pFoOdDh/QNX6HyVu/0AYzm9K4KCjvCbqL93FQ2Ldx8IFK6D/32tvT3p6
         k7VsLE/iJBblfPZu2295kvY2NM2dHuIo8qv3EirVxtOPf5KnGSaU2gwffK0ghvjX5Rcy
         hjHHbisC38q3TQ/lJuyEM9rR1Kw/IrXI/TA19gqID0HRdlnKZK7y7gG3y7Rsb6xmPWaF
         bmsQ==
X-Gm-Message-State: AOJu0YzB1M5jCVWohir82DwrAaVXGe52ANEF/Fu16PNt3pD9KTlV67KL
        x3KbiTo6o9wWRWFjJdIVa6HkkA==
X-Google-Smtp-Source: AGHT+IH6O2piTZHZwFIo2Fwlnt1svDph1VIWIMOW7X+81g9pVSFKKiUOqkbXGM1zyqhxiI+oTigCGQ==
X-Received: by 2002:a2e:3602:0:b0:2b6:e283:32cb with SMTP id d2-20020a2e3602000000b002b6e28332cbmr3871107lja.23.1694668035351;
        Wed, 13 Sep 2023 22:07:15 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y15-20020a2e978f000000b002bce38190a3sm124777lji.34.2023.09.13.22.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 22:07:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 10/12] drm/msm/dpu: create additional virtual planes
Date:   Thu, 14 Sep 2023 08:07:04 +0300
Message-Id: <20230914050706.1058620-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
References: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since we have enabled sharing of SSPP blocks between two planes, it is
now possible to use twice as much planes as there are hardware SSPP
blocks. Create additional overlay planes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 5106abe366a3..a6cd1346b298 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -792,6 +792,18 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 			primary_planes[primary_planes_idx++] = plane;
 	}
 
+	if (dpu_use_virtual_planes) {
+		for (i = 0; i < catalog->sspp_count; i++) {
+			plane = dpu_plane_init_virtual(dev, DRM_PLANE_TYPE_OVERLAY,
+						       (1UL << max_crtc_count) - 1);
+			if (IS_ERR(plane)) {
+				DPU_ERROR("dpu_plane_init failed\n");
+				ret = PTR_ERR(plane);
+				return ret;
+			}
+		}
+	}
+
 	max_crtc_count = min(max_crtc_count, primary_planes_idx);
 
 	/* Create one CRTC per encoder */
-- 
2.39.2

