Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21BCA6F6F03
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 17:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbjEDPfa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 11:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231329AbjEDPf3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 11:35:29 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E8414695
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 08:35:19 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f122ff663eso752027e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 May 2023 08:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683214518; x=1685806518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qp5nFH6J3ujxLQu/P/nKx3UnaFMZrf5nAmk2UdQa8AE=;
        b=TNy1D1jfClIBI8h4+tZedNWrwVJc6hLsxZuA1VF2K1N5w1IdHWbGadfhtKrlMBlQRt
         C8SXjzO4ixDQHMKRNPiKF5weGyiZHN0NuD+w9hHrcU2eXyLHJNeOK2r1Y06jo2bKPCkf
         jwAPdQI8DQzwNWXThyucPjdyqumfvoZcWfbLd1BoZyDI8REFmgMtJhpP/ZKc+hXlac1n
         DdizhQHczJNmuXxcPCeQabNoNkXjvDrsHUC9rdAW+rKcOm1p59jfKpi94UWXCA+qV/ju
         dBt5ogngm/m0uVvtt/zWbtiqorSG1izZR/8WVH3TikFEC8lvIj0GLVDoc2RoGGixXPwb
         F2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683214518; x=1685806518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qp5nFH6J3ujxLQu/P/nKx3UnaFMZrf5nAmk2UdQa8AE=;
        b=jxy8/HgVIIQ8GHFZyJIkfV8eefU7KKNebNgGZrTaeN/QXqv/EcFnry1hUVmXCfM99w
         9dtLJ2xdy1njfq5H4SlW3mcrxKXnXu0WON1xYVeZXpd0SVwVcXlHHU/I2LO0IVZAUcfN
         mrSPchZi87hOpNnpjXP8biRWre2zM1nU+ksoHujuqnnWB6fDzEhfxVFfQzI3bBJIpjuA
         e5iidGYNl21WwKOwXJydRJRW0NC6i9i4G6narosxB89kWDfSQFm03+wMxyJkJaTmjRD5
         9gzHTbP6nIR87u+mrL+R93hKG1WDhy+FsnNCGP/LDZgrgvpC17Zd3ccHNWtKIDhdarKd
         N5/g==
X-Gm-Message-State: AC+VfDwMG2nN7tZn032KdUMn68AUz+6hZ6WVLEd7ZyHhaKY3b4tyMuHM
        MKyiyUtnn+YEq7eJe0kHJBFgwg==
X-Google-Smtp-Source: ACHHUZ6rhVqjEml0uVFZtrM7FOx5jSeC/IDtt8lVoAC/dWgoKOkzetDuCe+roeZ46Q/HbdFpmZo4Dg==
X-Received: by 2002:ac2:5223:0:b0:4f1:3d25:70a with SMTP id i3-20020ac25223000000b004f13d25070amr1340455lfl.19.1683214517931;
        Thu, 04 May 2023 08:35:17 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id n15-20020a056512388f00b004e96afb1e9asm6608753lft.253.2023.05.04.08.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 08:35:17 -0700 (PDT)
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
Subject: [PATCH v5 7/8] drm/display/dsc: include the rest of pre-SCR parameters
Date:   Thu,  4 May 2023 18:35:10 +0300
Message-Id: <20230504153511.4007320-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504153511.4007320-1-dmitry.baryshkov@linaro.org>
References: <20230504153511.4007320-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DSC model contains pre-SCR RC parameters for other bpp/bpc combinations,
include them here for completeness. The values were generated from the
'pre_scr_cfg_files_for_reference' files found in DSC models 20210623.
The same fileset is a part of DSC model 20161212.

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

