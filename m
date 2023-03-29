Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF056CCEE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 02:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbjC2AhV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 20:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbjC2AhU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 20:37:20 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02FD71BFE
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 17:37:18 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id y20so18093759lfj.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 17:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680050237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=En6Mc/WtUVj/NeVz0q33ivE5D8wBC5ClMkHoJkmE8sE=;
        b=QxF1mC58vYfpy7QiqssYPyNZPfds0bMRph5o3kqCpAgfdp12y5SwqYoHIKULtL7Hki
         kFxjqOOfjx7tS8Pgap1bhLNwR5gDgb/yd0Qai5+XwcYmvU5jAhKF7iYB4yBt+YrGWcPN
         OZxGUozJdY3pLmA2x1YugHfI1pSCQEgj7YSQU4hKCCILcTs42xhucbWWuToQdc7QIgZw
         RNfh52nweKTbCJUKeaAK/s7HVIUXLUboH3/EmHJTaEdUvs3g3/EIY3dcP4pbnlmj0doa
         VESosvFhOSRIr2+2YuW/4Xfjak2r+cjse+pHwlTse56RAamgkCMOQY4AZGbvccHiFHZ4
         pGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680050237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=En6Mc/WtUVj/NeVz0q33ivE5D8wBC5ClMkHoJkmE8sE=;
        b=ojGLsF3K6U8I0jUO9MiCOW/vliusV2nCzI5YNsaBNb4UlXs0IF9WMSvs5nNn38m4V/
         1HGZqKb40STUkdJyMoDUcEqUPSTOVGV1Pu+ltgsiXokNHS6pDq+qtV1ihzAV6+BY2sE7
         lwk9C+aGqp1yKyZzcPcSYD7ra5J/pnonMRb81fTtU/CaNgRNLcBjzWbHvp2+YNxji+zH
         ocupdbO8G8f5TjM0Th/+EDojHgAPAMbiz+GJHTQR5sJ9dITs47S52vH2if1wn57J3+T/
         kKGan5eMP4QibubscdnfXNeVQqxylmfmn9Lj6dKPz6oAJ1HidLAoGXUyJXqYhDni7w5o
         MSfg==
X-Gm-Message-State: AAQBX9f+LP7/JRI3GPicNH7+ArVJH7ILOQxBnQsERXxRlH5iXRzPUE0w
        UHnPueNjlOU3KbLlbz1byEtO9g==
X-Google-Smtp-Source: AKy350aB8+YSWQuTl2ERD/6F3hb48RtXd07T6MJfHq2qGR4HBUxrO13N0K3jdOG0Toj5i3lmT/GxSA==
X-Received: by 2002:ac2:48aa:0:b0:4b3:d6e1:26bb with SMTP id u10-20020ac248aa000000b004b3d6e126bbmr4739435lfg.29.1680050237368;
        Tue, 28 Mar 2023 17:37:17 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y3-20020ac24463000000b004db00b4c671sm5254138lfl.7.2023.03.28.17.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 17:37:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Suraj Kandpal <suraj.kandpal@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 07/10] drm/display/dsc: include the rest of pre-SCR parameters
Date:   Wed, 29 Mar 2023 03:37:07 +0300
Message-Id: <20230329003710.1073261-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329003710.1073261-1-dmitry.baryshkov@linaro.org>
References: <20230329003710.1073261-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DSC model contains pre-SCR RC parameters for other bpp/bpc combinations,
include them here for completeness.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dsc_helper.c | 72 ++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
index 35b39f3109c4..aec6f8c201af 100644
--- a/drivers/gpu/drm/display/drm_dsc_helper.c
+++ b/drivers/gpu/drm/display/drm_dsc_helper.c
@@ -325,6 +325,16 @@ struct rc_parameters_data {
 #define DSC_BPP(bpp)	((bpp) << 4)
 
 static const struct rc_parameters_data rc_parameters_pre_scr[] = {
+	{
+		.bpp = DSC_BPP(6), .bpc = 8,
+		{ 683, 15, 6144, 3, 13, 11, 11, {
+			{ 0, 2, 0 }, { 1, 4, -2 }, { 3, 6, -2 }, { 4, 6, -4 },
+			{ 5, 7, -6 }, { 5, 7, -6 }, { 6, 7, -6 }, { 6, 8, -8 },
+			{ 7, 9, -8 }, { 8, 10, -10 }, { 9, 11, -10 }, { 10, 12, -12 },
+			{ 10, 13, -12 }, { 12, 14, -12 }, { 15, 15, -12 }
+			}
+		}
+	},
 	{
 		.bpp = DSC_BPP(8), .bpc = 8,
 		{ 512, 12, 6144, 3, 12, 11, 11, {
@@ -360,6 +370,37 @@ static const struct rc_parameters_data rc_parameters_pre_scr[] = {
 			}
 		}
 	},
+	{
+		.bpp = DSC_BPP(10), .bpc = 8,
+		{ 410, 12, 5632, 3, 12, 11, 11, {
+			{ 0, 3, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 2, 6, -2 },
+			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
+			{ 3, 9, -8 }, { 3, 9, -10 }, { 5, 10, -10 }, { 5, 11, -10 },
+			{ 5, 12, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(10), .bpc = 10,
+		{ 410, 12, 5632, 7, 16, 15, 15, {
+			{ 0, 7, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 6, 10, -2 },
+			{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
+			{ 7, 13, -8 }, { 7, 13, -10 }, { 9, 14, -10 }, { 9, 15, -10 },
+			{ 9, 16, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(10), .bpc = 12,
+		{ 410, 12, 5632, 11, 20, 19, 19, {
+			{ 0, 11, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 10, 14, -2 },
+			{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
+			{ 11, 17, -8 }, { 11, 17, -10 }, { 13, 18, -10 },
+			{ 13, 19, -10 }, { 13, 20, -12 }, { 15, 21, -12 },
+			{ 21, 23, -12 }
+			}
+		}
+	},
 	{
 		.bpp = DSC_BPP(12), .bpc = 8,
 		{ 341, 15, 2048, 3, 12, 11, 11, {
@@ -391,6 +432,37 @@ static const struct rc_parameters_data rc_parameters_pre_scr[] = {
 			}
 		}
 	},
+	{
+		.bpp = DSC_BPP(15), .bpc = 8,
+		{ 273, 15, 2048, 3, 12, 11, 11, {
+			{ 0, 0, 10 }, { 0, 1, 8 }, { 0, 1, 6 }, { 0, 2, 4 },
+			{ 1, 2, 2 }, { 1, 3, 0 }, { 1, 4, -2 }, { 2, 4, -4 },
+			{ 3, 4, -6 }, { 3, 5, -8 }, { 4, 6, -10 }, { 5, 7, -10 },
+			{ 5, 8, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(15), .bpc = 10,
+		{ 273, 15, 2048, 7, 16, 15, 15, {
+			{ 0, 2, 10 }, { 2, 5, 8 }, { 3, 5, 6 }, { 4, 6, 4 },
+			{ 5, 6, 2 }, { 5, 7, 0 }, { 5, 8, -2 }, { 6, 8, -4 },
+			{ 7, 8, -6 }, { 7, 9, -8 }, { 8, 10, -10 }, { 9, 11, -10 },
+			{ 9, 12, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(15), .bpc = 12,
+		{ 273, 15, 2048, 11, 20, 19, 19, {
+			{ 0, 4, 10 }, { 2, 7, 8 }, { 4, 9, 6 }, { 6, 11, 4 },
+			{ 9, 11, 2 }, { 9, 11, 0 }, { 9, 12, -2 }, { 10, 12, -4 },
+			{ 11, 12, -6 }, { 11, 13, -8 }, { 12, 14, -10 },
+			{ 13, 15, -10 }, { 13, 16, -12 }, { 15, 21, -12 },
+			{ 21, 23, -12 }
+			}
+		}
+	},
 	{ /* sentinel */ }
 };
 
-- 
2.39.2

