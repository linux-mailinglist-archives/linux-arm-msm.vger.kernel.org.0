Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3543A451C9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 01:18:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242558AbhKPAVo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 19:21:44 -0500
Received: from relay02.th.seeweb.it ([5.144.164.163]:37499 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351852AbhKOUjI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 15:39:08 -0500
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id C7CE8200D2;
        Mon, 15 Nov 2021 21:35:08 +0100 (CET)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Courtney Cavin <courtney.cavin@sonymobile.com>
Subject: [PATCH v3 4/9] backlight: qcom-wled: Fix off-by-one maximum with default num_strings
Date:   Mon, 15 Nov 2021 21:34:54 +0100
Message-Id: <20211115203459.1634079-5-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211115203459.1634079-1-marijn.suijten@somainline.org>
References: <20211115203459.1634079-1-marijn.suijten@somainline.org>
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

This also enables more stringent checks on the maximum value when
qcom,enabled-strings is provided in the DT, by parsing num-strings after
enabled-strings to allow it to check against (and in a subsequent patch
override) the length of enabled-strings: it is invalid to set
num-strings higher than that.
The DT currently utilizes it to get around an incorrect fixed read of
four elements from that array (has been addressed in a prior patch) by
setting a lower num-strings where desired.

Fixes: 93c64f1ea1e8 ("leds: add Qualcomm PM8941 WLED driver")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/video/backlight/qcom-wled.c | 48 ++++++++++-------------------
 1 file changed, 16 insertions(+), 32 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 9d883e702134..ab10910971e9 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -1255,21 +1255,6 @@ static const struct wled_var_cfg wled5_ovp_cfg = {
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
@@ -1343,11 +1328,6 @@ static int wled_configure(struct wled *wled)
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
@@ -1371,11 +1351,6 @@ static int wled_configure(struct wled *wled)
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
@@ -1399,11 +1374,6 @@ static int wled_configure(struct wled *wled)
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
@@ -1522,8 +1492,6 @@ static int wled_configure(struct wled *wled)
 			*bool_opts[i].val_ptr = true;
 	}
 
-	cfg->num_strings = cfg->num_strings + 1;
-
 	string_len = of_property_count_elems_of_size(dev->of_node,
 						     "qcom,enabled-strings",
 						     sizeof(u32));
@@ -1554,6 +1522,22 @@ static int wled_configure(struct wled *wled)
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
+		if (string_len > 0 && val > string_len) {
+			dev_err(dev, "qcom,num-strings exceeds qcom,enabled-strings\n");
+			return -EINVAL;
+		}
+
+		cfg->num_strings = val;
+	}
+
 	return 0;
 }
 
-- 
2.33.1

