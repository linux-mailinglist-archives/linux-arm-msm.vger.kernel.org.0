Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C31993D30CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 02:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232909AbhGVXls (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 19:41:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232888AbhGVXlr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 19:41:47 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11528C061799
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 17:22:13 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id a14so1307152plh.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 17:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e6nEAvIRn/urcm3pvVd4wXRrs7UeZjoNBr7Z3U5uzPE=;
        b=QkE3qOB0DG35zfn8RWDVjbIQuO1M8jF30KXnMq1uNv9ztFXOQOeN+qpORoCd9Nhp1P
         m0R7aql+e8M3+8QjX6y3b9nQYVF2MDm7Vr145lyT0LjQ3ma4Fs52zJbE3L1+HNTavhGY
         kxJfWQ5ZUW4fkoHBuxrhDlCtL3osuCYAQv5pQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e6nEAvIRn/urcm3pvVd4wXRrs7UeZjoNBr7Z3U5uzPE=;
        b=osgfkuC8Llb3tZUpOf8k+4OQ3S4xisdxKp8yXx/w51h5g586bjN5xnVe4GYP21JI0p
         1k+2MlcHPjoNVWTezMTp1I0uOEg4Chb328OjG6NMRFQ+5oLaD77gJF16KhqMLr88JmNY
         cC904Oxbt9zx3+EtaxDCXNUjF+6M8FGOTMsjFhoWl7GWQaJmHh8wRb36hd0EQseXzAFv
         trcuy2UjUGvJKH9AAHRWEnI0umCQY49BZ8SagSI1m8Qi5RPw8qlcNGyDHSURlfUtGeT6
         Npf5oNxzNDhCahMdgM3kJNHWBif4eGfXc4H3f2tmRynrd6ysnwSMH1tlzgwYC3I5TTOD
         Tayw==
X-Gm-Message-State: AOAM530XDsd0hNCmSPmEOt/m0jCS9c4h36iuZZL/FtPpTARigh3BbKDZ
        UzpYXEXy8rBqBr9UoQA+/ERNLw==
X-Google-Smtp-Source: ABdhPJxdfw4g65PJ0rau3kcYmb3DxGpgOJKaLgwEh66pbW1hMFfFzmgsWnrRmNaQRGY9PeQDkgJMug==
X-Received: by 2002:aa7:93a2:0:b029:333:64d3:e1f7 with SMTP id x2-20020aa793a20000b029033364d3e1f7mr1991681pff.25.1626999732584;
        Thu, 22 Jul 2021 17:22:12 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:5e70:6a49:67b5:2b7e])
        by smtp.gmail.com with ESMTPSA id iy13sm4072377pjb.28.2021.07.22.17.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 17:22:12 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Steev Klimaszewski <steev@kali.org>,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-arm-msm@vger.kernel.org, Linus W <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/8] drm/edid: Allow the querying/working with the panel ID from the EDID
Date:   Thu, 22 Jul 2021 17:21:41 -0700
Message-Id: <20210722172104.RFC.3.I4a672175ba1894294d91d3dbd51da11a8239cf4a@changeid>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
In-Reply-To: <20210723002146.1962910-1-dianders@chromium.org>
References: <20210723002146.1962910-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

EDIDs have 32-bits worth of data which is intended to be used to
uniquely identify the make/model of a panel. This has historically
been used only internally in the EDID processing code to identify
quirks with panels.

We'd like to use this panel ID in panel-simple to identify which panel
is hooked up and from that information figure out power sequence
timings. Let's expose this information from the EDID code and also
allow it to be accessed early, before a connector has been created.

To make matching in the panel-simple code easier, we'll return the
panel ID as a 32-bit value. We'll provide some functions for
converting this value back and forth to something more human readable.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/drm_edid.c | 51 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_edid.h     | 47 +++++++++++++++++++++++++++++++++++
 2 files changed, 98 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index a623a80f7edb..43633e083ecd 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2086,6 +2086,57 @@ struct edid *drm_get_edid(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_get_edid);
 
+/**
+ * drm_get_panel_id - Get a panel's ID through DDC
+ * @adapter: I2C adapter to use for DDC
+ *
+ * This function reads the first block of the EDID of a panel and (assuming
+ * that the EDID is valid) extracts the ID out of it. The ID is a 32-bit value
+ * (16 bits of manufacturer ID and 16 bits of per-manufacturer ID) that's
+ * supposed to be different for each different modem of panel.
+ *
+ * This function is intended to be used during early probing on devices where
+ * more than one panel might be present. Because of its intended use it must
+ * assume that the EDID of the panel is correct, at least as far as the ID
+ * is concerned (in other words, we don't process any overrides here).
+ *
+ * NOTE: it's expected that this function and drm_do_get_edid() will both
+ * be read the EDID, but there is no caching between them. Since we're only
+ * reading the first block, hopefully this extra overhead won't be too big.
+ *
+ * Return: A 32-bit ID that should be different for each make/model of panel.
+ *         See the functions encode_edid_id() and decode_edid_id() for some
+ *         details on the structure of this ID.
+ */
+u32 drm_get_panel_id(struct i2c_adapter *adapter)
+{
+	struct edid *edid;
+	u32 val;
+
+	edid = drm_do_get_edid_blk0(drm_do_probe_ddc_edid, adapter, NULL, NULL);
+
+	/*
+	 * There are no manufacturer IDs of 0, so if there is a problem reading
+	 * the EDID then we'll just return 0.
+	 */
+	if (IS_ERR_OR_NULL(edid))
+		return 0;
+
+	/*
+	 * In theory we could try to de-obfuscate this like edid_get_quirks()
+	 * does, but it's easier to just deal with a 32-bit number.
+	 */
+	val = (u32)edid->mfg_id[0] << 24   |
+	      (u32)edid->mfg_id[1] << 16   |
+	      (u32)edid->prod_code[0] << 8 |
+	      (u32)edid->prod_code[1] << 0;
+
+	kfree(edid);
+
+	return val;
+}
+EXPORT_SYMBOL(drm_get_panel_id);
+
 /**
  * drm_get_edid_switcheroo - get EDID data for a vga_switcheroo output
  * @connector: connector we're probing
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 759328a5eeb2..75a23caa7709 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -508,6 +508,52 @@ static inline u8 drm_eld_get_conn_type(const uint8_t *eld)
 	return eld[DRM_ELD_SAD_COUNT_CONN_TYPE] & DRM_ELD_CONN_TYPE_MASK;
 }
 
+/**
+ * encode_edid_id - Encode an ID for matching against drm_get_panel_id()
+ * @vend_chr_0: First character of the vendor string.
+ * @vend_chr_2: Second character of the vendor string.
+ * @vend_chr_3: Third character of the vendor string.
+ * @product_id: The 16-bit product ID.
+ *
+ * This is a macro so that it can be calculated at compile time and used
+ * as an initializer.
+ *
+ * For instance:
+ *   encode_edid_id('B', 'O', 'E', 0x2d08) => 0x09e52d08
+ *
+ * Return: a 32-bit ID per panel.
+ */
+#define encode_edid_id(vend_chr_0, vend_chr_1, vend_chr_2, product_id) \
+	((((u32)(vend_chr_0) - '@') & 0x1f) << 26 | \
+	 (((u32)(vend_chr_1) - '@') & 0x1f) << 21 | \
+	 (((u32)(vend_chr_2) - '@') & 0x1f) << 16 | \
+	 ((product_id) & 0xffff))
+
+/**
+ * decode_edid_id - Decode a panel ID from encode_edid_id()
+ * @panel_id: The panel ID to decode.
+ * @vend: A 4-byte buffer to store the 3-letter vendor string plus a '\0'
+ *	  termination
+ * @product_id: The product ID will be returned here.
+ *
+ * For instance, after:
+ *   decode_edid_id(0x09e52d08, vend, &product_id)
+ * These will be true:
+ *   vend[0] = 'B'
+ *   vend[1] = 'O'
+ *   vend[2] = 'E'
+ *   vend[3] = '\0'
+ *   product_id = 0x2d08
+ */
+static inline void decode_edid_id(u32 panel_id, char vend[4], u16 *product_id)
+{
+	*product_id = (u16)(panel_id & 0xffff);
+	vend[0] = '@' + ((panel_id >> 26) & 0x1f);
+	vend[1] = '@' + ((panel_id >> 21) & 0x1f);
+	vend[2] = '@' + ((panel_id >> 16) & 0x1f);
+	vend[3] = '\0';
+}
+
 bool drm_probe_ddc(struct i2c_adapter *adapter);
 struct edid *drm_do_get_edid(struct drm_connector *connector,
 	int (*get_edid_block)(void *data, u8 *buf, unsigned int block,
@@ -515,6 +561,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	void *data);
 struct edid *drm_get_edid(struct drm_connector *connector,
 			  struct i2c_adapter *adapter);
+u32 drm_get_panel_id(struct i2c_adapter *adapter);
 struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
 				     struct i2c_adapter *adapter);
 struct edid *drm_edid_duplicate(const struct edid *edid);
-- 
2.32.0.432.gabb21c7263-goog

