Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3212A6F6EFA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 17:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbjEDPfW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 11:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231177AbjEDPfV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 11:35:21 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC1DC4686
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 08:35:14 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4eff4ea8e39so763165e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 May 2023 08:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683214513; x=1685806513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBAkVdbh6cPTMjC6o2ySkEa6jNcEcZVNqgzdILUk71Q=;
        b=kuGjp8WJqb156vWq9KYozdF2ICKDv59WBzHoA1Yhd7B/McpBPIiyihBmIRYGjHWi9C
         /ZL0/gnN925t5cNEmP6MX0dfmMwxR+WXOFSmJTVh/31Ff5D4WpZxRIj1p4Y6aQTi8Arq
         XOSKIRsBMf4X1Udqo+gS/QOhGodkJnvNzmyQMpY1XzW0X44pV5Xxn7G8krv1jJBywSOO
         sjn/sTz2KD4dUXNRXlPOV9RnqIX57miZhWFHV0CWi/MtF4CgYWOuu095r7agRb03pOVh
         vrIoGg3Tjh2jyJ73/v9ERlUU9wqLkh3tfX6qiyTjpsg08waNXPC22SUhDtasukBv5C9g
         dugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683214513; x=1685806513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBAkVdbh6cPTMjC6o2ySkEa6jNcEcZVNqgzdILUk71Q=;
        b=EEw9nXs9btQZXOlbJhG2ZrX6uK6mIqvjb4BwTOS1uMKfnt9xwLERViVeP4/V3hCeb3
         d4XzBvZ1jNg+2kDhH5WrBVXeMF8FhkXqETP7/Z+2r3lBeCN+cUWOWTBlIOjjpxsocLzJ
         yrIR6O62iJ4Y7+WTfRqxpD2KS0SzjS0pHKiA2aZq101tiVNYZF9QPIYNYuGdfBgtbecA
         tR66544428x9tWOIsOtoD+fGXpCZUERgl95yof0fami0J6rxHTOtolqAPWSXQAzkmoXH
         kpj3rgsTi7fLFKKN4iea+hXdqEV2r1Dk5RqQSZR1WljorMml+iy4s2vIZ1r7IqTvwus2
         ohKw==
X-Gm-Message-State: AC+VfDzFDW/bwefCkOTbJ1+QH5mCNap4AJ7ifMOdgpBbtdpFJEzcc5dr
        mLbCkxA8qxBq3Y6HyrSlYtodfQ==
X-Google-Smtp-Source: ACHHUZ7pbgVpeItgsgTWrr7j4GHpJ26O3Im17Eentb07XCPlPGNXVMYcTsMCkutx+R140DReJHKV0Q==
X-Received: by 2002:a05:6512:38b1:b0:4ec:a9c5:f3ae with SMTP id o17-20020a05651238b100b004eca9c5f3aemr1803768lft.11.1683214512950;
        Thu, 04 May 2023 08:35:12 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id n15-20020a056512388f00b004e96afb1e9asm6608753lft.253.2023.05.04.08.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 08:35:12 -0700 (PDT)
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
        Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v5 1/8] drm/i915/dsc: change DSC param tables to follow the DSC model
Date:   Thu,  4 May 2023 18:35:04 +0300
Message-Id: <20230504153511.4007320-2-dmitry.baryshkov@linaro.org>
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

After cross-checking DSC models (20150914, 20161212, 20210623) change
values in rc_parameters tables to follow config files present inside
the DSC model. Handle two places, where i915 tables diverged from the
model, by patching the rc values in the code.

Note: I left one case uncorrected, 8bpp/10bpc/range_max_qp[0], because
the table in the VESA DSC 1.1 sets it to 4.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/i915/display/intel_vdsc.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 8e787c13d26d..7003ae9f683a 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -87,7 +87,7 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 		}
 	},
 	/* 6BPP/14BPC */
-	{ 768, 15, 6144, 15, 25, 23, 27, {
+	{ 768, 15, 6144, 15, 25, 23, 23, {
 		{ 0, 16, 0 }, { 7, 18, -2 }, { 15, 20, -2 }, { 16, 20, -4 },
 		{ 17, 21, -6 }, { 17, 21, -6 }, { 18, 21, -6 }, { 18, 22, -8 },
 		{ 19, 23, -8 }, { 20, 24, -10 }, { 21, 24, -10 },
@@ -116,6 +116,10 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 	},
 	/* 8BPP/10BPC */
 	{ 512, 12, 6144, 7, 16, 15, 15, {
+		/*
+		 * DSC model/pre-SCR-cfg has 8 for range_max_qp[0], however
+		 * VESA DSC 1.1 Table E-5 sets it to 4.
+		 */
 		{ 0, 4, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
 		{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
 		{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
@@ -133,7 +137,7 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
 	},
 	/* 8BPP/14BPC */
 	{ 512, 12, 6144, 15, 24, 23, 23, {
-		{ 0, 12, 0 }, { 5, 13, 0 }, { 11, 15, 0 }, { 12, 17, -2 },
+		{ 0, 12, 2 }, { 5, 13, 0 }, { 11, 15, 0 }, { 12, 17, -2 },
 		{ 15, 19, -4 }, { 15, 19, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
 		{ 15, 21, -8 }, { 15, 22, -10 }, { 17, 22, -10 },
 		{ 17, 23, -12 }, { 17, 23, -12 }, { 21, 24, -12 },
@@ -598,6 +602,20 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 			DSC_RANGE_BPG_OFFSET_MASK;
 	}
 
+	if (DISPLAY_VER(dev_priv) < 13) {
+		/*
+		 * FIXME: verify that the hardware actually needs these
+		 * modifications rather than them being simple typos.
+		 */
+		if (compressed_bpp == 6 &&
+		    vdsc_cfg->bits_per_component == 8)
+			vdsc_cfg->rc_quant_incr_limit1 = 23;
+
+		if (compressed_bpp == 8 &&
+		    vdsc_cfg->bits_per_component == 14)
+			vdsc_cfg->rc_range_params[0].range_bpg_offset = 0;
+	}
+
 	/*
 	 * BitsPerComponent value determines mux_word_size:
 	 * When BitsPerComponent is less than or 10bpc, muxWordSize will be equal to
-- 
2.39.2

