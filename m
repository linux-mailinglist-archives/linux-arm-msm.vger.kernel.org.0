Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFE6F40B905
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 22:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233976AbhINUXq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 16:23:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234025AbhINUXn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 16:23:43 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C396C0613CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 13:22:24 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id o8so183091pll.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 13:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s2t3OBEBZv8gCynOpYw1ybZLTn4iofsMa7t+E6nlIw8=;
        b=kUWepDm3u3ET/VIch1RSsDhE5Hsd/ozwc9i2VCBWLQnb1V53VRLCj9NvuAM48YR4g5
         NRjwJLsxwqXzt+RVqr6rUzPDr7oeNeTOYiON5by8i9SNRmCcrEMo58RK4uDBzmcKk+0S
         tMd/M2ySOlmCOT07PIIUlEBE5Y3ZYSemEviBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s2t3OBEBZv8gCynOpYw1ybZLTn4iofsMa7t+E6nlIw8=;
        b=RptDuQG8VPCNlfbb1M7tG07EnhALlnph9IlkNFMrnQ19PQ4q1GRszcBtjLMI/zTpru
         PJJ3IXIPs7CosUIwRgpuacOjKlqFqSIbEZuKIqKZwPDdtr8OGh7BOgrA2w4dugA1e/1f
         UeA/vOTy+nUIo5Fqt2m8ePZ5VZhn9KmqnzVQN7iYygMWdIZY3D3+trb56vV3l9JGIZ7N
         WeXGAqwYlRpV7sZ9/ovHEnXSVGF0JHgSG5npUFq2ZYYFnJkaan1Bm+OjhzBZdvcSnlUx
         iUQlX1sDevqFMIF07othweW0Jqs8F3+IWvDHnzMLZRGrTailTPTbJbdHRnyuxq2ad8/q
         z37A==
X-Gm-Message-State: AOAM532xjgZ6m5HQmfCvfOt2XeoMO3m2ul4Z9M+320yLJrUj2AfX3CP6
        keTxGTa1bXCCDTmfQ8aMg2hkCg==
X-Google-Smtp-Source: ABdhPJz2sGn0Bqs0YP0tTx74GX1KX/TPZopgJxiZzR966FdQG3FtaTIpolYxJJbANoOa31KRVVpeEA==
X-Received: by 2002:a17:90a:12:: with SMTP id 18mr4161394pja.104.1631650943914;
        Tue, 14 Sep 2021 13:22:23 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:f38f:9d0f:3eba:f8c4])
        by smtp.gmail.com with ESMTPSA id 141sm12185393pgg.16.2021.09.14.13.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 13:22:23 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Linus W <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Jani Nikula <jani.nikula@intel.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 04/15] drm/edid: Use new encoded panel id style for quirks matching
Date:   Tue, 14 Sep 2021 13:21:51 -0700
Message-Id: <20210914132020.v5.4.I6103ce2b16e5e5a842b14c7022a034712b434609@changeid>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
In-Reply-To: <20210914202202.1702601-1-dianders@chromium.org>
References: <20210914202202.1702601-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the patch ("drm/edid: Allow the querying/working with the panel ID
from the EDID") we introduced a different way of working with the
panel ID stored in the EDID. Let's use this new way for the quirks
code.

Advantages of the new style:
* Smaller data structure size. Saves 4 bytes per panel.
* Iterate through quirks structure with just "==" instead of strncmp()
* In-kernel storage is more similar to what's stored in the EDID
  itself making it easier to grok that they are referring to the same
  value.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---
This commit is only compile-tested. I don't have any DP panels that
exercise this code. Transition from the old table to the new one was
done with a regexp.

Changes in v5:
- Prettier encode panel ID function (thanks Andrzej!)

Changes in v4:
- ("Use new encoded panel id style for quirks matching") new for v4.

 drivers/gpu/drm/drm_edid.c | 156 +++++++++++++++++--------------------
 1 file changed, 70 insertions(+), 86 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index f84e0dd264f4..53b342c058be 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -100,122 +100,127 @@ struct detailed_mode_closure {
 #define LEVEL_GTF2	2
 #define LEVEL_CVT	3
 
+#define EDID_QUIRK(vend, product_id, _quirks) \
+{ \
+	.panel_id = drm_edid_encode_panel_id(vend, product_id), \
+	.quirks = _quirks \
+}
+
 static const struct edid_quirk {
-	char vendor[4];
-	int product_id;
+	u32 panel_id;
 	u32 quirks;
 } edid_quirk_list[] = {
 	/* Acer AL1706 */
-	{ "ACR", 44358, EDID_QUIRK_PREFER_LARGE_60 },
+	EDID_QUIRK("ACR", 44358, EDID_QUIRK_PREFER_LARGE_60),
 	/* Acer F51 */
-	{ "API", 0x7602, EDID_QUIRK_PREFER_LARGE_60 },
+	EDID_QUIRK("API", 0x7602, EDID_QUIRK_PREFER_LARGE_60),
 
 	/* AEO model 0 reports 8 bpc, but is a 6 bpc panel */
-	{ "AEO", 0, EDID_QUIRK_FORCE_6BPC },
+	EDID_QUIRK("AEO", 0, EDID_QUIRK_FORCE_6BPC),
 
 	/* BOE model on HP Pavilion 15-n233sl reports 8 bpc, but is a 6 bpc panel */
-	{ "BOE", 0x78b, EDID_QUIRK_FORCE_6BPC },
+	EDID_QUIRK("BOE", 0x78b, EDID_QUIRK_FORCE_6BPC),
 
 	/* CPT panel of Asus UX303LA reports 8 bpc, but is a 6 bpc panel */
-	{ "CPT", 0x17df, EDID_QUIRK_FORCE_6BPC },
+	EDID_QUIRK("CPT", 0x17df, EDID_QUIRK_FORCE_6BPC),
 
 	/* SDC panel of Lenovo B50-80 reports 8 bpc, but is a 6 bpc panel */
-	{ "SDC", 0x3652, EDID_QUIRK_FORCE_6BPC },
+	EDID_QUIRK("SDC", 0x3652, EDID_QUIRK_FORCE_6BPC),
 
 	/* BOE model 0x0771 reports 8 bpc, but is a 6 bpc panel */
-	{ "BOE", 0x0771, EDID_QUIRK_FORCE_6BPC },
+	EDID_QUIRK("BOE", 0x0771, EDID_QUIRK_FORCE_6BPC),
 
 	/* Belinea 10 15 55 */
-	{ "MAX", 1516, EDID_QUIRK_PREFER_LARGE_60 },
-	{ "MAX", 0x77e, EDID_QUIRK_PREFER_LARGE_60 },
+	EDID_QUIRK("MAX", 1516, EDID_QUIRK_PREFER_LARGE_60),
+	EDID_QUIRK("MAX", 0x77e, EDID_QUIRK_PREFER_LARGE_60),
 
 	/* Envision Peripherals, Inc. EN-7100e */
-	{ "EPI", 59264, EDID_QUIRK_135_CLOCK_TOO_HIGH },
+	EDID_QUIRK("EPI", 59264, EDID_QUIRK_135_CLOCK_TOO_HIGH),
 	/* Envision EN2028 */
-	{ "EPI", 8232, EDID_QUIRK_PREFER_LARGE_60 },
+	EDID_QUIRK("EPI", 8232, EDID_QUIRK_PREFER_LARGE_60),
 
 	/* Funai Electronics PM36B */
-	{ "FCM", 13600, EDID_QUIRK_PREFER_LARGE_75 |
-	  EDID_QUIRK_DETAILED_IN_CM },
+	EDID_QUIRK("FCM", 13600, EDID_QUIRK_PREFER_LARGE_75 |
+				       EDID_QUIRK_DETAILED_IN_CM),
 
 	/* LGD panel of HP zBook 17 G2, eDP 10 bpc, but reports unknown bpc */
-	{ "LGD", 764, EDID_QUIRK_FORCE_10BPC },
+	EDID_QUIRK("LGD", 764, EDID_QUIRK_FORCE_10BPC),
 
 	/* LG Philips LCD LP154W01-A5 */
-	{ "LPL", 0, EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE },
-	{ "LPL", 0x2a00, EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE },
+	EDID_QUIRK("LPL", 0, EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE),
+	EDID_QUIRK("LPL", 0x2a00, EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE),
 
 	/* Samsung SyncMaster 205BW.  Note: irony */
-	{ "SAM", 541, EDID_QUIRK_DETAILED_SYNC_PP },
+	EDID_QUIRK("SAM", 541, EDID_QUIRK_DETAILED_SYNC_PP),
 	/* Samsung SyncMaster 22[5-6]BW */
-	{ "SAM", 596, EDID_QUIRK_PREFER_LARGE_60 },
-	{ "SAM", 638, EDID_QUIRK_PREFER_LARGE_60 },
+	EDID_QUIRK("SAM", 596, EDID_QUIRK_PREFER_LARGE_60),
+	EDID_QUIRK("SAM", 638, EDID_QUIRK_PREFER_LARGE_60),
 
 	/* Sony PVM-2541A does up to 12 bpc, but only reports max 8 bpc */
-	{ "SNY", 0x2541, EDID_QUIRK_FORCE_12BPC },
+	EDID_QUIRK("SNY", 0x2541, EDID_QUIRK_FORCE_12BPC),
 
 	/* ViewSonic VA2026w */
-	{ "VSC", 5020, EDID_QUIRK_FORCE_REDUCED_BLANKING },
+	EDID_QUIRK("VSC", 5020, EDID_QUIRK_FORCE_REDUCED_BLANKING),
 
 	/* Medion MD 30217 PG */
-	{ "MED", 0x7b8, EDID_QUIRK_PREFER_LARGE_75 },
+	EDID_QUIRK("MED", 0x7b8, EDID_QUIRK_PREFER_LARGE_75),
 
 	/* Lenovo G50 */
-	{ "SDC", 18514, EDID_QUIRK_FORCE_6BPC },
+	EDID_QUIRK("SDC", 18514, EDID_QUIRK_FORCE_6BPC),
 
 	/* Panel in Samsung NP700G7A-S01PL notebook reports 6bpc */
-	{ "SEC", 0xd033, EDID_QUIRK_FORCE_8BPC },
+	EDID_QUIRK("SEC", 0xd033, EDID_QUIRK_FORCE_8BPC),
 
 	/* Rotel RSX-1058 forwards sink's EDID but only does HDMI 1.1*/
-	{ "ETR", 13896, EDID_QUIRK_FORCE_8BPC },
+	EDID_QUIRK("ETR", 13896, EDID_QUIRK_FORCE_8BPC),
 
 	/* Valve Index Headset */
-	{ "VLV", 0x91a8, EDID_QUIRK_NON_DESKTOP },
-	{ "VLV", 0x91b0, EDID_QUIRK_NON_DESKTOP },
-	{ "VLV", 0x91b1, EDID_QUIRK_NON_DESKTOP },
-	{ "VLV", 0x91b2, EDID_QUIRK_NON_DESKTOP },
-	{ "VLV", 0x91b3, EDID_QUIRK_NON_DESKTOP },
-	{ "VLV", 0x91b4, EDID_QUIRK_NON_DESKTOP },
-	{ "VLV", 0x91b5, EDID_QUIRK_NON_DESKTOP },
-	{ "VLV", 0x91b6, EDID_QUIRK_NON_DESKTOP },
-	{ "VLV", 0x91b7, EDID_QUIRK_NON_DESKTOP },
-	{ "VLV", 0x91b8, EDID_QUIRK_NON_DESKTOP },
-	{ "VLV", 0x91b9, EDID_QUIRK_NON_DESKTOP },
-	{ "VLV", 0x91ba, EDID_QUIRK_NON_DESKTOP },
-	{ "VLV", 0x91bb, EDID_QUIRK_NON_DESKTOP },
-	{ "VLV", 0x91bc, EDID_QUIRK_NON_DESKTOP },
-	{ "VLV", 0x91bd, EDID_QUIRK_NON_DESKTOP },
-	{ "VLV", 0x91be, EDID_QUIRK_NON_DESKTOP },
-	{ "VLV", 0x91bf, EDID_QUIRK_NON_DESKTOP },
+	EDID_QUIRK("VLV", 0x91a8, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK("VLV", 0x91b0, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK("VLV", 0x91b1, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK("VLV", 0x91b2, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK("VLV", 0x91b3, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK("VLV", 0x91b4, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK("VLV", 0x91b5, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK("VLV", 0x91b6, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK("VLV", 0x91b7, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK("VLV", 0x91b8, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK("VLV", 0x91b9, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK("VLV", 0x91ba, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK("VLV", 0x91bb, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK("VLV", 0x91bc, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK("VLV", 0x91bd, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK("VLV", 0x91be, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK("VLV", 0x91bf, EDID_QUIRK_NON_DESKTOP),
 
 	/* HTC Vive and Vive Pro VR Headsets */
-	{ "HVR", 0xaa01, EDID_QUIRK_NON_DESKTOP },
-	{ "HVR", 0xaa02, EDID_QUIRK_NON_DESKTOP },
+	EDID_QUIRK("HVR", 0xaa01, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK("HVR", 0xaa02, EDID_QUIRK_NON_DESKTOP),
 
 	/* Oculus Rift DK1, DK2, CV1 and Rift S VR Headsets */
-	{ "OVR", 0x0001, EDID_QUIRK_NON_DESKTOP },
-	{ "OVR", 0x0003, EDID_QUIRK_NON_DESKTOP },
-	{ "OVR", 0x0004, EDID_QUIRK_NON_DESKTOP },
-	{ "OVR", 0x0012, EDID_QUIRK_NON_DESKTOP },
+	EDID_QUIRK("OVR", 0x0001, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK("OVR", 0x0003, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK("OVR", 0x0004, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK("OVR", 0x0012, EDID_QUIRK_NON_DESKTOP),
 
 	/* Windows Mixed Reality Headsets */
-	{ "ACR", 0x7fce, EDID_QUIRK_NON_DESKTOP },
-	{ "HPN", 0x3515, EDID_QUIRK_NON_DESKTOP },
-	{ "LEN", 0x0408, EDID_QUIRK_NON_DESKTOP },
-	{ "LEN", 0xb800, EDID_QUIRK_NON_DESKTOP },
-	{ "FUJ", 0x1970, EDID_QUIRK_NON_DESKTOP },
-	{ "DEL", 0x7fce, EDID_QUIRK_NON_DESKTOP },
-	{ "SEC", 0x144a, EDID_QUIRK_NON_DESKTOP },
-	{ "AUS", 0xc102, EDID_QUIRK_NON_DESKTOP },
+	EDID_QUIRK("ACR", 0x7fce, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK("HPN", 0x3515, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK("LEN", 0x0408, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK("LEN", 0xb800, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK("FUJ", 0x1970, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK("DEL", 0x7fce, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK("SEC", 0x144a, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK("AUS", 0xc102, EDID_QUIRK_NON_DESKTOP),
 
 	/* Sony PlayStation VR Headset */
-	{ "SNY", 0x0704, EDID_QUIRK_NON_DESKTOP },
+	EDID_QUIRK("SNY", 0x0704, EDID_QUIRK_NON_DESKTOP),
 
 	/* Sensics VR Headsets */
-	{ "SEN", 0x1019, EDID_QUIRK_NON_DESKTOP },
+	EDID_QUIRK("SEN", 0x1019, EDID_QUIRK_NON_DESKTOP),
 
 	/* OSVR HDK and HDK2 VR Headsets */
-	{ "SVR", 0x1019, EDID_QUIRK_NON_DESKTOP },
+	EDID_QUIRK("SVR", 0x1019, EDID_QUIRK_NON_DESKTOP),
 };
 
 /*
@@ -2090,9 +2095,8 @@ EXPORT_SYMBOL(drm_get_edid);
 static u32 edid_extract_panel_id(const struct edid *edid)
 {
 	/*
-	 * In theory we could try to de-obfuscate this like edid_get_quirks()
-	 * does, but it's easier to just deal with a 32-bit number since then
-	 * it can be compared with "==".
+	 * We represent the ID as a 32-bit number so it can easily be compared
+	 * with "==".
 	 *
 	 * NOTE that we deal with endianness differently for the top half
 	 * of this ID than for the bottom half. The bottom half (the product
@@ -2197,25 +2201,6 @@ EXPORT_SYMBOL(drm_edid_duplicate);
 
 /*** EDID parsing ***/
 
-/**
- * edid_vendor - match a string against EDID's obfuscated vendor field
- * @edid: EDID to match
- * @vendor: vendor string
- *
- * Returns true if @vendor is in @edid, false otherwise
- */
-static bool edid_vendor(const struct edid *edid, const char *vendor)
-{
-	char edid_vendor[3];
-
-	edid_vendor[0] = ((edid->mfg_id[0] & 0x7c) >> 2) + '@';
-	edid_vendor[1] = (((edid->mfg_id[0] & 0x3) << 3) |
-			  ((edid->mfg_id[1] & 0xe0) >> 5)) + '@';
-	edid_vendor[2] = (edid->mfg_id[1] & 0x1f) + '@';
-
-	return !strncmp(edid_vendor, vendor, 3);
-}
-
 /**
  * edid_get_quirks - return quirk flags for a given EDID
  * @edid: EDID to process
@@ -2224,14 +2209,13 @@ static bool edid_vendor(const struct edid *edid, const char *vendor)
  */
 static u32 edid_get_quirks(const struct edid *edid)
 {
+	u32 panel_id = edid_extract_panel_id(edid);
 	const struct edid_quirk *quirk;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(edid_quirk_list); i++) {
 		quirk = &edid_quirk_list[i];
-
-		if (edid_vendor(edid, quirk->vendor) &&
-		    (EDID_PRODUCT_ID(edid) == quirk->product_id))
+		if (quirk->panel_id == panel_id)
 			return quirk->quirks;
 	}
 
-- 
2.33.0.309.g3052b89438-goog

