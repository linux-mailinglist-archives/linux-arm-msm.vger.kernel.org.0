Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8AD2C3106
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 20:45:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgKXToP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 14:44:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726787AbgKXToM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 14:44:12 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 788F8C061A4D
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 11:44:10 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id a186so88018wme.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 11:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IIqYcckPAUIuPzz9N0d48R4/Xp44qFtxBobvViiQxSs=;
        b=FWwlELgbpuhWp7fuDZ4mpudOUfTNDvRd/0peRh0Nn70tWsFpHlDh2E2OV84IoJSBP6
         2Uj8i2Wx5vDBRH3kcOq9sIa9/dRGNpbeUM1/5DIWaN9OELfj9Z6EHhk1u49iiaRk8zMc
         WIKMdhDyyPblEjIwTRqqrgOryFb/KbjTw1pSd0moXcTdLrrGZmgu1iirv6JX8O3zBwfx
         iXQ6pTAQp0wXas6WdV7EjcFlfxW6gg88FFJ7nCtKvFr4t7UCuKLDQCu3ET2B0KsuK1Cn
         2AoC7KGWm6/LxYdIb3xlJyoNbnhbhZMBIPZDvbZlv3wHE41vq+RuD7OByq5zoB9CRk3D
         +t1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IIqYcckPAUIuPzz9N0d48R4/Xp44qFtxBobvViiQxSs=;
        b=KRakrfWc9ygdZhKr2XhJA0xLbSFPFFTNzcqA4Fw0xu9IbVA2H2j3n76Gg3JM1dWQmL
         O9DO4S1w8/PHUwA1tQij5iF0lhz4ktZYgHCk0bbmIZK1Ir0tSTVxdBEXAveo8ZJp9AIl
         8bsVwf250l3Y4Ly68Leuk/LWqbfu/EvEpPziNPw60bheCmSc17JsXuF8pBaJFC4mu8y7
         FaOxRMjok2tYXCRJZNH/IFNQ4mjCuIk+wj8PnsilBDMnYM4gKAHGcGU5R74s8dh2/Egb
         CV66j5Ow447UPrzOum2Ylro8f9Y7sEoTa54O+hxX7+APImVa0BhKlk0OtGc14ZTaN3lh
         LTEw==
X-Gm-Message-State: AOAM533NcOJSyT2vYDi6h7LFgz5Kjt9dHXi3hJGtVP/NuDkbF0Iw/42L
        Dw6gZ39z1JyQ7+mZ79vV6ZLkUA==
X-Google-Smtp-Source: ABdhPJz/JGn2c1GYmeUUgiyHVk84UlHkbQ+4gnOrvjRURWlsS6NTPycNLSlaRyjCz1N6U6vpoA1Daw==
X-Received: by 2002:a1c:32c6:: with SMTP id y189mr148837wmy.133.1606247049102;
        Tue, 24 Nov 2020 11:44:09 -0800 (PST)
Received: from dell.default ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 11:44:08 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 08/40] drm/msm/dp/dp_ctrl: Move 'tu' from the stack to the heap
Date:   Tue, 24 Nov 2020 19:37:52 +0000
Message-Id: <20201124193824.1118741-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124193824.1118741-1-lee.jones@linaro.org>
References: <20201124193824.1118741-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

'struct tu_algo_data' is huge ~400 Bytes.

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/dp/dp_ctrl.c: In function ‘_dp_ctrl_calc_tu.constprop’:
 drivers/gpu/drm/msm/dp/dp_ctrl.c:938:1: warning: the frame size of 1184 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Chandan Uddaraju <chandanu@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 338 ++++++++++++++++---------------
 1 file changed, 171 insertions(+), 167 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index c569e97c82a6c..e3462f5d96d75 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -614,7 +614,7 @@ static void _tu_valid_boundary_calc(struct tu_algo_data *tu)
 static void _dp_ctrl_calc_tu(struct dp_tu_calc_input *in,
 				   struct dp_vc_tu_mapping_table *tu_table)
 {
-	struct tu_algo_data tu;
+	struct tu_algo_data *tu;
 	int compare_result_1, compare_result_2;
 	u64 temp = 0;
 	s64 temp_fp = 0, temp1_fp = 0, temp2_fp = 0;
@@ -629,298 +629,300 @@ static void _dp_ctrl_calc_tu(struct dp_tu_calc_input *in,
 	uint EXTRA_PIXCLK_CYCLE_DELAY = 4;
 	uint HBLANK_MARGIN = 4;
 
-	memset(&tu, 0, sizeof(tu));
+	tu = kzalloc(sizeof(*tu), GFP_KERNEL);
+	if (!tu)
+		return
 
-	dp_panel_update_tu_timings(in, &tu);
+	dp_panel_update_tu_timings(in, tu);
 
-	tu.err_fp = drm_fixp_from_fraction(1000, 1); /* 1000 */
+	tu->err_fp = drm_fixp_from_fraction(1000, 1); /* 1000 */
 
 	temp1_fp = drm_fixp_from_fraction(4, 1);
-	temp2_fp = drm_fixp_mul(temp1_fp, tu.lclk_fp);
-	temp_fp = drm_fixp_div(temp2_fp, tu.pclk_fp);
-	tu.extra_buffer_margin = drm_fixp2int_ceil(temp_fp);
+	temp2_fp = drm_fixp_mul(temp1_fp, tu->lclk_fp);
+	temp_fp = drm_fixp_div(temp2_fp, tu->pclk_fp);
+	tu->extra_buffer_margin = drm_fixp2int_ceil(temp_fp);
 
-	temp1_fp = drm_fixp_from_fraction(tu.bpp, 8);
-	temp2_fp = drm_fixp_mul(tu.pclk_fp, temp1_fp);
-	temp1_fp = drm_fixp_from_fraction(tu.nlanes, 1);
+	temp1_fp = drm_fixp_from_fraction(tu->bpp, 8);
+	temp2_fp = drm_fixp_mul(tu->pclk_fp, temp1_fp);
+	temp1_fp = drm_fixp_from_fraction(tu->nlanes, 1);
 	temp2_fp = drm_fixp_div(temp2_fp, temp1_fp);
-	tu.ratio_fp = drm_fixp_div(temp2_fp, tu.lclk_fp);
-
-	tu.original_ratio_fp = tu.ratio_fp;
-	tu.boundary_moderation_en = false;
-	tu.upper_boundary_count = 0;
-	tu.lower_boundary_count = 0;
-	tu.i_upper_boundary_count = 0;
-	tu.i_lower_boundary_count = 0;
-	tu.valid_lower_boundary_link = 0;
-	tu.even_distribution_BF = 0;
-	tu.even_distribution_legacy = 0;
-	tu.even_distribution = 0;
-	tu.delay_start_time_fp = 0;
-
-	tu.err_fp = drm_fixp_from_fraction(1000, 1);
-	tu.n_err_fp = 0;
-	tu.n_n_err_fp = 0;
-
-	tu.ratio = drm_fixp2int(tu.ratio_fp);
-	temp1_fp = drm_fixp_from_fraction(tu.nlanes, 1);
-	div64_u64_rem(tu.lwidth_fp, temp1_fp, &temp2_fp);
+	tu->ratio_fp = drm_fixp_div(temp2_fp, tu->lclk_fp);
+
+	tu->original_ratio_fp = tu->ratio_fp;
+	tu->boundary_moderation_en = false;
+	tu->upper_boundary_count = 0;
+	tu->lower_boundary_count = 0;
+	tu->i_upper_boundary_count = 0;
+	tu->i_lower_boundary_count = 0;
+	tu->valid_lower_boundary_link = 0;
+	tu->even_distribution_BF = 0;
+	tu->even_distribution_legacy = 0;
+	tu->even_distribution = 0;
+	tu->delay_start_time_fp = 0;
+
+	tu->err_fp = drm_fixp_from_fraction(1000, 1);
+	tu->n_err_fp = 0;
+	tu->n_n_err_fp = 0;
+
+	tu->ratio = drm_fixp2int(tu->ratio_fp);
+	temp1_fp = drm_fixp_from_fraction(tu->nlanes, 1);
+	div64_u64_rem(tu->lwidth_fp, temp1_fp, &temp2_fp);
 	if (temp2_fp != 0 &&
-			!tu.ratio && tu.dsc_en == 0) {
-		tu.ratio_fp = drm_fixp_mul(tu.ratio_fp, RATIO_SCALE_fp);
-		tu.ratio = drm_fixp2int(tu.ratio_fp);
-		if (tu.ratio)
-			tu.ratio_fp = drm_fixp_from_fraction(1, 1);
+			!tu->ratio && tu->dsc_en == 0) {
+		tu->ratio_fp = drm_fixp_mul(tu->ratio_fp, RATIO_SCALE_fp);
+		tu->ratio = drm_fixp2int(tu->ratio_fp);
+		if (tu->ratio)
+			tu->ratio_fp = drm_fixp_from_fraction(1, 1);
 	}
 
-	if (tu.ratio > 1)
-		tu.ratio = 1;
+	if (tu->ratio > 1)
+		tu->ratio = 1;
 
-	if (tu.ratio == 1)
+	if (tu->ratio == 1)
 		goto tu_size_calc;
 
-	compare_result_1 = _tu_param_compare(tu.ratio_fp, const_p49_fp);
+	compare_result_1 = _tu_param_compare(tu->ratio_fp, const_p49_fp);
 	if (!compare_result_1 || compare_result_1 == 1)
 		compare_result_1 = 1;
 	else
 		compare_result_1 = 0;
 
-	compare_result_2 = _tu_param_compare(tu.ratio_fp, const_p56_fp);
+	compare_result_2 = _tu_param_compare(tu->ratio_fp, const_p56_fp);
 	if (!compare_result_2 || compare_result_2 == 2)
 		compare_result_2 = 1;
 	else
 		compare_result_2 = 0;
 
-	if (tu.dsc_en && compare_result_1 && compare_result_2) {
+	if (tu->dsc_en && compare_result_1 && compare_result_2) {
 		HBLANK_MARGIN += 4;
 		DRM_DEBUG_DP("Info: increase HBLANK_MARGIN to %d\n",
 				HBLANK_MARGIN);
 	}
 
 tu_size_calc:
-	for (tu.tu_size = 32; tu.tu_size <= 64; tu.tu_size++) {
-		temp1_fp = drm_fixp_from_fraction(tu.tu_size, 1);
-		temp2_fp = drm_fixp_mul(tu.ratio_fp, temp1_fp);
+	for (tu->tu_size = 32; tu->tu_size <= 64; tu->tu_size++) {
+		temp1_fp = drm_fixp_from_fraction(tu->tu_size, 1);
+		temp2_fp = drm_fixp_mul(tu->ratio_fp, temp1_fp);
 		temp = drm_fixp2int_ceil(temp2_fp);
 		temp1_fp = drm_fixp_from_fraction(temp, 1);
-		tu.n_err_fp = temp1_fp - temp2_fp;
+		tu->n_err_fp = temp1_fp - temp2_fp;
 
-		if (tu.n_err_fp < tu.err_fp) {
-			tu.err_fp = tu.n_err_fp;
-			tu.tu_size_desired = tu.tu_size;
+		if (tu->n_err_fp < tu->err_fp) {
+			tu->err_fp = tu->n_err_fp;
+			tu->tu_size_desired = tu->tu_size;
 		}
 	}
 
-	tu.tu_size_minus1 = tu.tu_size_desired - 1;
+	tu->tu_size_minus1 = tu->tu_size_desired - 1;
 
-	temp1_fp = drm_fixp_from_fraction(tu.tu_size_desired, 1);
-	temp2_fp = drm_fixp_mul(tu.ratio_fp, temp1_fp);
-	tu.valid_boundary_link = drm_fixp2int_ceil(temp2_fp);
+	temp1_fp = drm_fixp_from_fraction(tu->tu_size_desired, 1);
+	temp2_fp = drm_fixp_mul(tu->ratio_fp, temp1_fp);
+	tu->valid_boundary_link = drm_fixp2int_ceil(temp2_fp);
 
-	temp1_fp = drm_fixp_from_fraction(tu.bpp, 8);
-	temp2_fp = tu.lwidth_fp;
+	temp1_fp = drm_fixp_from_fraction(tu->bpp, 8);
+	temp2_fp = tu->lwidth_fp;
 	temp2_fp = drm_fixp_mul(temp2_fp, temp1_fp);
 
-	temp1_fp = drm_fixp_from_fraction(tu.valid_boundary_link, 1);
+	temp1_fp = drm_fixp_from_fraction(tu->valid_boundary_link, 1);
 	temp2_fp = drm_fixp_div(temp2_fp, temp1_fp);
-	tu.n_tus = drm_fixp2int(temp2_fp);
+	tu->n_tus = drm_fixp2int(temp2_fp);
 	if ((temp2_fp & 0xFFFFFFFF) > 0xFFFFF000)
-		tu.n_tus += 1;
+		tu->n_tus += 1;
 
-	tu.even_distribution_legacy = tu.n_tus % tu.nlanes == 0 ? 1 : 0;
+	tu->even_distribution_legacy = tu->n_tus % tu->nlanes == 0 ? 1 : 0;
 	DRM_DEBUG_DP("Info: n_sym = %d, num_of_tus = %d\n",
-		tu.valid_boundary_link, tu.n_tus);
+		tu->valid_boundary_link, tu->n_tus);
 
-	temp1_fp = drm_fixp_from_fraction(tu.tu_size_desired, 1);
-	temp2_fp = drm_fixp_mul(tu.original_ratio_fp, temp1_fp);
-	temp1_fp = drm_fixp_from_fraction(tu.valid_boundary_link, 1);
+	temp1_fp = drm_fixp_from_fraction(tu->tu_size_desired, 1);
+	temp2_fp = drm_fixp_mul(tu->original_ratio_fp, temp1_fp);
+	temp1_fp = drm_fixp_from_fraction(tu->valid_boundary_link, 1);
 	temp2_fp = temp1_fp - temp2_fp;
-	temp1_fp = drm_fixp_from_fraction(tu.n_tus + 1, 1);
+	temp1_fp = drm_fixp_from_fraction(tu->n_tus + 1, 1);
 	temp2_fp = drm_fixp_mul(temp1_fp, temp2_fp);
 
 	temp = drm_fixp2int(temp2_fp);
 	if (temp && temp2_fp)
-		tu.extra_bytes = drm_fixp2int_ceil(temp2_fp);
+		tu->extra_bytes = drm_fixp2int_ceil(temp2_fp);
 	else
-		tu.extra_bytes = 0;
+		tu->extra_bytes = 0;
 
-	temp1_fp = drm_fixp_from_fraction(tu.extra_bytes, 1);
-	temp2_fp = drm_fixp_from_fraction(8, tu.bpp);
+	temp1_fp = drm_fixp_from_fraction(tu->extra_bytes, 1);
+	temp2_fp = drm_fixp_from_fraction(8, tu->bpp);
 	temp1_fp = drm_fixp_mul(temp1_fp, temp2_fp);
 
 	if (temp && temp1_fp)
-		tu.extra_pclk_cycles = drm_fixp2int_ceil(temp1_fp);
+		tu->extra_pclk_cycles = drm_fixp2int_ceil(temp1_fp);
 	else
-		tu.extra_pclk_cycles = drm_fixp2int(temp1_fp);
+		tu->extra_pclk_cycles = drm_fixp2int(temp1_fp);
 
-	temp1_fp = drm_fixp_div(tu.lclk_fp, tu.pclk_fp);
-	temp2_fp = drm_fixp_from_fraction(tu.extra_pclk_cycles, 1);
+	temp1_fp = drm_fixp_div(tu->lclk_fp, tu->pclk_fp);
+	temp2_fp = drm_fixp_from_fraction(tu->extra_pclk_cycles, 1);
 	temp1_fp = drm_fixp_mul(temp2_fp, temp1_fp);
 
 	if (temp1_fp)
-		tu.extra_pclk_cycles_in_link_clk = drm_fixp2int_ceil(temp1_fp);
+		tu->extra_pclk_cycles_in_link_clk = drm_fixp2int_ceil(temp1_fp);
 	else
-		tu.extra_pclk_cycles_in_link_clk = drm_fixp2int(temp1_fp);
+		tu->extra_pclk_cycles_in_link_clk = drm_fixp2int(temp1_fp);
 
-	tu.filler_size = tu.tu_size_desired - tu.valid_boundary_link;
+	tu->filler_size = tu->tu_size_desired - tu->valid_boundary_link;
 
-	temp1_fp = drm_fixp_from_fraction(tu.tu_size_desired, 1);
-	tu.ratio_by_tu_fp = drm_fixp_mul(tu.ratio_fp, temp1_fp);
+	temp1_fp = drm_fixp_from_fraction(tu->tu_size_desired, 1);
+	tu->ratio_by_tu_fp = drm_fixp_mul(tu->ratio_fp, temp1_fp);
 
-	tu.delay_start_link = tu.extra_pclk_cycles_in_link_clk +
-				tu.filler_size + tu.extra_buffer_margin;
+	tu->delay_start_link = tu->extra_pclk_cycles_in_link_clk +
+				tu->filler_size + tu->extra_buffer_margin;
 
-	tu.resulting_valid_fp =
-			drm_fixp_from_fraction(tu.valid_boundary_link, 1);
+	tu->resulting_valid_fp =
+			drm_fixp_from_fraction(tu->valid_boundary_link, 1);
 
-	temp1_fp = drm_fixp_from_fraction(tu.tu_size_desired, 1);
-	temp2_fp = drm_fixp_div(tu.resulting_valid_fp, temp1_fp);
-	tu.TU_ratio_err_fp = temp2_fp - tu.original_ratio_fp;
+	temp1_fp = drm_fixp_from_fraction(tu->tu_size_desired, 1);
+	temp2_fp = drm_fixp_div(tu->resulting_valid_fp, temp1_fp);
+	tu->TU_ratio_err_fp = temp2_fp - tu->original_ratio_fp;
 
 	temp1_fp = drm_fixp_from_fraction(HBLANK_MARGIN, 1);
-	temp1_fp = tu.hbp_relative_to_pclk_fp - temp1_fp;
-	tu.hbp_time_fp = drm_fixp_div(temp1_fp, tu.pclk_fp);
+	temp1_fp = tu->hbp_relative_to_pclk_fp - temp1_fp;
+	tu->hbp_time_fp = drm_fixp_div(temp1_fp, tu->pclk_fp);
 
-	temp1_fp = drm_fixp_from_fraction(tu.delay_start_link, 1);
-	tu.delay_start_time_fp = drm_fixp_div(temp1_fp, tu.lclk_fp);
+	temp1_fp = drm_fixp_from_fraction(tu->delay_start_link, 1);
+	tu->delay_start_time_fp = drm_fixp_div(temp1_fp, tu->lclk_fp);
 
-	compare_result_1 = _tu_param_compare(tu.hbp_time_fp,
-					tu.delay_start_time_fp);
+	compare_result_1 = _tu_param_compare(tu->hbp_time_fp,
+					tu->delay_start_time_fp);
 	if (compare_result_1 == 2) /* if (hbp_time_fp < delay_start_time_fp) */
-		tu.min_hblank_violated = 1;
+		tu->min_hblank_violated = 1;
 
-	tu.hactive_time_fp = drm_fixp_div(tu.lwidth_fp, tu.pclk_fp);
+	tu->hactive_time_fp = drm_fixp_div(tu->lwidth_fp, tu->pclk_fp);
 
-	compare_result_2 = _tu_param_compare(tu.hactive_time_fp,
-						tu.delay_start_time_fp);
+	compare_result_2 = _tu_param_compare(tu->hactive_time_fp,
+						tu->delay_start_time_fp);
 	if (compare_result_2 == 2)
-		tu.min_hblank_violated = 1;
+		tu->min_hblank_violated = 1;
 
-	tu.delay_start_time_fp = 0;
+	tu->delay_start_time_fp = 0;
 
 	/* brute force */
 
-	tu.delay_start_link_extra_pixclk = EXTRA_PIXCLK_CYCLE_DELAY;
-	tu.diff_abs_fp = tu.resulting_valid_fp - tu.ratio_by_tu_fp;
+	tu->delay_start_link_extra_pixclk = EXTRA_PIXCLK_CYCLE_DELAY;
+	tu->diff_abs_fp = tu->resulting_valid_fp - tu->ratio_by_tu_fp;
 
-	temp = drm_fixp2int(tu.diff_abs_fp);
-	if (!temp && tu.diff_abs_fp <= 0xffff)
-		tu.diff_abs_fp = 0;
+	temp = drm_fixp2int(tu->diff_abs_fp);
+	if (!temp && tu->diff_abs_fp <= 0xffff)
+		tu->diff_abs_fp = 0;
 
 	/* if(diff_abs < 0) diff_abs *= -1 */
-	if (tu.diff_abs_fp < 0)
-		tu.diff_abs_fp = drm_fixp_mul(tu.diff_abs_fp, -1);
+	if (tu->diff_abs_fp < 0)
+		tu->diff_abs_fp = drm_fixp_mul(tu->diff_abs_fp, -1);
 
-	tu.boundary_mod_lower_err = 0;
-	if ((tu.diff_abs_fp != 0 &&
-			((tu.diff_abs_fp > BRUTE_FORCE_THRESHOLD_fp) ||
-			 (tu.even_distribution_legacy == 0) ||
+	tu->boundary_mod_lower_err = 0;
+	if ((tu->diff_abs_fp != 0 &&
+			((tu->diff_abs_fp > BRUTE_FORCE_THRESHOLD_fp) ||
+			 (tu->even_distribution_legacy == 0) ||
 			 (DP_BRUTE_FORCE == 1))) ||
-			(tu.min_hblank_violated == 1)) {
+			(tu->min_hblank_violated == 1)) {
 		do {
-			tu.err_fp = drm_fixp_from_fraction(1000, 1);
+			tu->err_fp = drm_fixp_from_fraction(1000, 1);
 
-			temp1_fp = drm_fixp_div(tu.lclk_fp, tu.pclk_fp);
+			temp1_fp = drm_fixp_div(tu->lclk_fp, tu->pclk_fp);
 			temp2_fp = drm_fixp_from_fraction(
-					tu.delay_start_link_extra_pixclk, 1);
+					tu->delay_start_link_extra_pixclk, 1);
 			temp1_fp = drm_fixp_mul(temp2_fp, temp1_fp);
 
 			if (temp1_fp)
-				tu.extra_buffer_margin =
+				tu->extra_buffer_margin =
 					drm_fixp2int_ceil(temp1_fp);
 			else
-				tu.extra_buffer_margin = 0;
+				tu->extra_buffer_margin = 0;
 
-			temp1_fp = drm_fixp_from_fraction(tu.bpp, 8);
-			temp1_fp = drm_fixp_mul(tu.lwidth_fp, temp1_fp);
+			temp1_fp = drm_fixp_from_fraction(tu->bpp, 8);
+			temp1_fp = drm_fixp_mul(tu->lwidth_fp, temp1_fp);
 
 			if (temp1_fp)
-				tu.n_symbols = drm_fixp2int_ceil(temp1_fp);
+				tu->n_symbols = drm_fixp2int_ceil(temp1_fp);
 			else
-				tu.n_symbols = 0;
-
-			for (tu.tu_size = 32; tu.tu_size <= 64; tu.tu_size++) {
-				for (tu.i_upper_boundary_count = 1;
-					tu.i_upper_boundary_count <= 15;
-					tu.i_upper_boundary_count++) {
-					for (tu.i_lower_boundary_count = 1;
-						tu.i_lower_boundary_count <= 15;
-						tu.i_lower_boundary_count++) {
-						_tu_valid_boundary_calc(&tu);
+				tu->n_symbols = 0;
+
+			for (tu->tu_size = 32; tu->tu_size <= 64; tu->tu_size++) {
+				for (tu->i_upper_boundary_count = 1;
+					tu->i_upper_boundary_count <= 15;
+					tu->i_upper_boundary_count++) {
+					for (tu->i_lower_boundary_count = 1;
+						tu->i_lower_boundary_count <= 15;
+						tu->i_lower_boundary_count++) {
+						_tu_valid_boundary_calc(tu);
 					}
 				}
 			}
-			tu.delay_start_link_extra_pixclk--;
-		} while (tu.boundary_moderation_en != true &&
-			tu.boundary_mod_lower_err == 1 &&
-			tu.delay_start_link_extra_pixclk != 0);
+			tu->delay_start_link_extra_pixclk--;
+		} while (tu->boundary_moderation_en != true &&
+			tu->boundary_mod_lower_err == 1 &&
+			tu->delay_start_link_extra_pixclk != 0);
 
-		if (tu.boundary_moderation_en == true) {
+		if (tu->boundary_moderation_en == true) {
 			temp1_fp = drm_fixp_from_fraction(
-					(tu.upper_boundary_count *
-					tu.valid_boundary_link +
-					tu.lower_boundary_count *
-					(tu.valid_boundary_link - 1)), 1);
+					(tu->upper_boundary_count *
+					tu->valid_boundary_link +
+					tu->lower_boundary_count *
+					(tu->valid_boundary_link - 1)), 1);
 			temp2_fp = drm_fixp_from_fraction(
-					(tu.upper_boundary_count +
-					tu.lower_boundary_count), 1);
-			tu.resulting_valid_fp =
+					(tu->upper_boundary_count +
+					tu->lower_boundary_count), 1);
+			tu->resulting_valid_fp =
 					drm_fixp_div(temp1_fp, temp2_fp);
 
 			temp1_fp = drm_fixp_from_fraction(
-					tu.tu_size_desired, 1);
-			tu.ratio_by_tu_fp =
-				drm_fixp_mul(tu.original_ratio_fp, temp1_fp);
+					tu->tu_size_desired, 1);
+			tu->ratio_by_tu_fp =
+				drm_fixp_mul(tu->original_ratio_fp, temp1_fp);
 
-			tu.valid_lower_boundary_link =
-				tu.valid_boundary_link - 1;
+			tu->valid_lower_boundary_link =
+				tu->valid_boundary_link - 1;
 
-			temp1_fp = drm_fixp_from_fraction(tu.bpp, 8);
-			temp1_fp = drm_fixp_mul(tu.lwidth_fp, temp1_fp);
+			temp1_fp = drm_fixp_from_fraction(tu->bpp, 8);
+			temp1_fp = drm_fixp_mul(tu->lwidth_fp, temp1_fp);
 			temp2_fp = drm_fixp_div(temp1_fp,
-						tu.resulting_valid_fp);
-			tu.n_tus = drm_fixp2int(temp2_fp);
+						tu->resulting_valid_fp);
+			tu->n_tus = drm_fixp2int(temp2_fp);
 
-			tu.tu_size_minus1 = tu.tu_size_desired - 1;
-			tu.even_distribution_BF = 1;
+			tu->tu_size_minus1 = tu->tu_size_desired - 1;
+			tu->even_distribution_BF = 1;
 
 			temp1_fp =
-				drm_fixp_from_fraction(tu.tu_size_desired, 1);
+				drm_fixp_from_fraction(tu->tu_size_desired, 1);
 			temp2_fp =
-				drm_fixp_div(tu.resulting_valid_fp, temp1_fp);
-			tu.TU_ratio_err_fp = temp2_fp - tu.original_ratio_fp;
+				drm_fixp_div(tu->resulting_valid_fp, temp1_fp);
+			tu->TU_ratio_err_fp = temp2_fp - tu->original_ratio_fp;
 		}
 	}
 
-	temp2_fp = drm_fixp_mul(LCLK_FAST_SKEW_fp, tu.lwidth_fp);
+	temp2_fp = drm_fixp_mul(LCLK_FAST_SKEW_fp, tu->lwidth_fp);
 
 	if (temp2_fp)
 		temp = drm_fixp2int_ceil(temp2_fp);
 	else
 		temp = 0;
 
-	temp1_fp = drm_fixp_from_fraction(tu.nlanes, 1);
-	temp2_fp = drm_fixp_mul(tu.original_ratio_fp, temp1_fp);
-	temp1_fp = drm_fixp_from_fraction(tu.bpp, 8);
+	temp1_fp = drm_fixp_from_fraction(tu->nlanes, 1);
+	temp2_fp = drm_fixp_mul(tu->original_ratio_fp, temp1_fp);
+	temp1_fp = drm_fixp_from_fraction(tu->bpp, 8);
 	temp2_fp = drm_fixp_div(temp1_fp, temp2_fp);
 	temp1_fp = drm_fixp_from_fraction(temp, 1);
 	temp2_fp = drm_fixp_mul(temp1_fp, temp2_fp);
 	temp = drm_fixp2int(temp2_fp);
 
-	if (tu.async_en)
-		tu.delay_start_link += (int)temp;
+	if (tu->async_en)
+		tu->delay_start_link += (int)temp;
 
-	temp1_fp = drm_fixp_from_fraction(tu.delay_start_link, 1);
-	tu.delay_start_time_fp = drm_fixp_div(temp1_fp, tu.lclk_fp);
+	temp1_fp = drm_fixp_from_fraction(tu->delay_start_link, 1);
+	tu->delay_start_time_fp = drm_fixp_div(temp1_fp, tu->lclk_fp);
 
 	/* OUTPUTS */
-	tu_table->valid_boundary_link       = tu.valid_boundary_link;
-	tu_table->delay_start_link          = tu.delay_start_link;
-	tu_table->boundary_moderation_en    = tu.boundary_moderation_en;
-	tu_table->valid_lower_boundary_link = tu.valid_lower_boundary_link;
-	tu_table->upper_boundary_count      = tu.upper_boundary_count;
-	tu_table->lower_boundary_count      = tu.lower_boundary_count;
-	tu_table->tu_size_minus1            = tu.tu_size_minus1;
+	tu_table->valid_boundary_link       = tu->valid_boundary_link;
+	tu_table->delay_start_link          = tu->delay_start_link;
+	tu_table->boundary_moderation_en    = tu->boundary_moderation_en;
+	tu_table->valid_lower_boundary_link = tu->valid_lower_boundary_link;
+	tu_table->upper_boundary_count      = tu->upper_boundary_count;
+	tu_table->lower_boundary_count      = tu->lower_boundary_count;
+	tu_table->tu_size_minus1            = tu->tu_size_minus1;
 
 	DRM_DEBUG_DP("TU: valid_boundary_link: %d\n",
 				tu_table->valid_boundary_link);
@@ -935,6 +937,8 @@ static void _dp_ctrl_calc_tu(struct dp_tu_calc_input *in,
 	DRM_DEBUG_DP("TU: lower_boundary_count: %d\n",
 			tu_table->lower_boundary_count);
 	DRM_DEBUG_DP("TU: tu_size_minus1: %d\n", tu_table->tu_size_minus1);
+
+	kfree(tu);
 }
 
 static void dp_ctrl_calc_tu_parameters(struct dp_ctrl_private *ctrl,
-- 
2.25.1

