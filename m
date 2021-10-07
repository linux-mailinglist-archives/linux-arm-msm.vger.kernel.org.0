Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34344425F08
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 23:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241698AbhJGVgE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 17:36:04 -0400
Received: from m-r2.th.seeweb.it ([5.144.164.171]:42291 "EHLO
        m-r2.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241550AbhJGVgC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 17:36:02 -0400
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B6AA83E908;
        Thu,  7 Oct 2021 23:34:05 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Courtney Cavin <courtney.cavin@sonymobile.com>,
        Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/13] backlight: qcom-wled: Fix off-by-one maximum with default num_strings
Date:   Thu,  7 Oct 2021 23:33:51 +0200
Message-Id: <20211007213400.258371-5-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007213400.258371-1-marijn.suijten@somainline.org>
References: <20211007213400.258371-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When not specifying num-strings in the DT the default is used, but +1 is
added to it which turns WLED3 into 4 and WLED4/5 into 5 strings instead
of 3 and 4 respectively, causing out-of-bounds reads and register
read/writes.  This +1 exists for a deficiency in the DT parsing code,
and is simply omitted entirely - solving this oob issue - by parsing the
property separately much like qcom,enabled-strings.

This also allows more stringent checks on the maximum value when
qcom,enabled-strings is provided in the DT.  Note that num-strings is
parsed after enabled-strings to give it final sign-off over the length,
which DT currently utilizes to get around an incorrect fixed read of
four elements from that array (has been addressed in a prior patch).

Fixes: 93c64f1ea1e8 ("leds: add Qualcomm PM8941 WLED driver")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/video/backlight/qcom-wled.c | 51 +++++++++++------------------
 1 file changed, 19 insertions(+), 32 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 977cd75827d7..c5232478a343 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -1253,21 +1253,6 @@ static const struct wled_var_cfg wled5_ovp_cfg = {
 	.size = 16,
 };
 
-static u32 wled3_num_strings_values_fn(u32 idx)
-{
-	return idx + 1;
-}
-
-static const struct wled_var_cfg wled3_num_strings_cfg = {
-	.fn = wled3_num_strings_values_fn,
-	.size = 3,
-};
-
-static const struct wled_var_cfg wled4_num_strings_cfg = {
-	.fn = wled3_num_strings_values_fn,
-	.size = 4,
-};
-
 static u32 wled3_switch_freq_values_fn(u32 idx)
 {
 	return 19200 / (2 * (1 + idx));
@@ -1341,11 +1326,6 @@ static int wled_configure(struct wled *wled)
 			.val_ptr = &cfg->switch_freq,
 			.cfg = &wled3_switch_freq_cfg,
 		},
-		{
-			.name = "qcom,num-strings",
-			.val_ptr = &cfg->num_strings,
-			.cfg = &wled3_num_strings_cfg,
-		},
 	};
 
 	const struct wled_u32_opts wled4_opts[] = {
@@ -1369,11 +1349,6 @@ static int wled_configure(struct wled *wled)
 			.val_ptr = &cfg->switch_freq,
 			.cfg = &wled3_switch_freq_cfg,
 		},
-		{
-			.name = "qcom,num-strings",
-			.val_ptr = &cfg->num_strings,
-			.cfg = &wled4_num_strings_cfg,
-		},
 	};
 
 	const struct wled_u32_opts wled5_opts[] = {
@@ -1397,11 +1372,6 @@ static int wled_configure(struct wled *wled)
 			.val_ptr = &cfg->switch_freq,
 			.cfg = &wled3_switch_freq_cfg,
 		},
-		{
-			.name = "qcom,num-strings",
-			.val_ptr = &cfg->num_strings,
-			.cfg = &wled4_num_strings_cfg,
-		},
 		{
 			.name = "qcom,modulator-sel",
 			.val_ptr = &cfg->mod_sel,
@@ -1520,8 +1490,6 @@ static int wled_configure(struct wled *wled)
 			*bool_opts[i].val_ptr = true;
 	}
 
-	cfg->num_strings = cfg->num_strings + 1;
-
 	string_len = of_property_count_elems_of_size(dev->of_node,
 						     "qcom,enabled-strings",
 						     sizeof(u32));
@@ -1552,6 +1520,25 @@ static int wled_configure(struct wled *wled)
 		}
 	}
 
+	rc = of_property_read_u32(dev->of_node, "qcom,num-strings", &val);
+	if (!rc) {
+		if (val < 1 || val > wled->max_string_count) {
+			dev_err(dev, "qcom,num-strings must be between 1 and %d\n",
+				wled->max_string_count);
+			return -EINVAL;
+		}
+
+		if (string_len > 0) {
+			dev_warn(dev, "qcom,num-strings and qcom,enabled-strings are ambiguous\n");
+			if (val > string_len) {
+				dev_err(dev, "qcom,num-strings exceeds qcom,enabled-strings\n");
+				return -EINVAL;
+			}
+		}
+
+		cfg->num_strings = val;
+	}
+
 	return 0;
 }
 
-- 
2.33.0

