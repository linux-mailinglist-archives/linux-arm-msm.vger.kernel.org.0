Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20AD570651E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 May 2023 12:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbjEQK2U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 06:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230334AbjEQK2R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 06:28:17 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F6440E5
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 03:28:15 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2ad9f2926adso5194881fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 03:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684319294; x=1686911294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XitWxnVJL1EB3BIEYTCS8WE32TB1LL3K21ckZ+g4Hc=;
        b=HuF8fEbtNDtIdl73wbuOk62QBGYuOHrHFtliPCZYWC+7/9sk+J0yxmgFIgy2iumJ0u
         kaoleTp/ih2m48BIUZKiN6DPlp3yoQLu5RKQU1vqXMgrcBx1wo6+s+0nf58Rlvn1hIMp
         9SfeWynug6U03kXdAONr2qIebOjyEMeAvlFdjkz9GIXAYV7VBQ8cxwY0wRlRbr2ao2m5
         JThWPC4Bgtyx7xCqzGSCxoJZ2Ib5Is/a1EdHXx/f1TTEMjoLQS+uS5EYjux3Sfbiye9v
         aNvesps0z6CZ5tlgrs30tSzTmPGMtwSpjKOSHDtHYPFVPcSac1o428jpr4I83DaPd3C1
         MUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684319294; x=1686911294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3XitWxnVJL1EB3BIEYTCS8WE32TB1LL3K21ckZ+g4Hc=;
        b=VO6HCTaMfs2gK3HeoYydN/GbSTZXB/Zpc1a0VxiaA5Y5q6ZhXGxfxjt5tVMAic1wOP
         HnIFzISJnIqMGsC0S7ME80ULEMxY8p4zqsXd5evbiEltKy8ZAuyldxl/s5cQu3UUKlP1
         HF2+3LBvPMrWgbreMITU3Tc1V2GzRWOynVgcoGem1pRiYkyruLfWtmDleqHMygtduG4x
         Kpvhb1IT4Ntwgb4Qyyky9niJCaVrYt01b3UpLzxYtTIoyzW2UgnJ/pSQodXRdKfyvUIR
         frI7jb1XMd3QVlmXTZJg61/XlvxO28+8NC1Hd9Q+u/649uRd5VS7OqOnaKzUJX0GAEyV
         uShQ==
X-Gm-Message-State: AC+VfDxPYtIP8yw5fcOyXc7dB/xvH/zCGSVVahva5uTRcONcDDuKeQwW
        Uj3U7EN/7JjPb/Rt5SNY98VNAA==
X-Google-Smtp-Source: ACHHUZ5tld/gb2zOS4SbPHN2bO40iRLJI+0cvGT/sGDxFzU7GK3s39VAbRp8Db3IkOUn4vA37Es5XA==
X-Received: by 2002:a2e:3205:0:b0:2ad:9c17:a78f with SMTP id y5-20020a2e3205000000b002ad9c17a78fmr9441164ljy.53.1684319293883;
        Wed, 17 May 2023 03:28:13 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id e16-20020a2e8190000000b002ab017899e8sm4495356ljg.39.2023.05.17.03.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 03:28:13 -0700 (PDT)
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
        freedreno@lists.freedesktop.org,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v7 7/8] drm/display/dsc: include the rest of pre-SCR parameters
Date:   Wed, 17 May 2023 13:28:06 +0300
Message-Id: <20230517102807.2181589-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517102807.2181589-1-dmitry.baryshkov@linaro.org>
References: <20230517102807.2181589-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dsc_helper.c | 72 ++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
index f1ba39df5708..f6d8a7be5967 100644
--- a/drivers/gpu/drm/display/drm_dsc_helper.c
+++ b/drivers/gpu/drm/display/drm_dsc_helper.c
@@ -331,6 +331,16 @@ struct rc_parameters_data {
  * Cross-checked against C Model releases: DSC_model_20161212 and 20210623
  */
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
@@ -366,6 +376,37 @@ static const struct rc_parameters_data rc_parameters_pre_scr[] = {
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
@@ -397,6 +438,37 @@ static const struct rc_parameters_data rc_parameters_pre_scr[] = {
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

