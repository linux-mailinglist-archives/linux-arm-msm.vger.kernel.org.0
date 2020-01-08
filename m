Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 467A313388F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 02:39:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgAHBjI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 20:39:08 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41707 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbgAHBjH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 20:39:07 -0500
Received: by mail-pg1-f196.google.com with SMTP id x8so731649pgk.8;
        Tue, 07 Jan 2020 17:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qmrdZKjfoj5CPPpFPntvvUb8XA6zxvuRpATASktYgx8=;
        b=RLBhSXVpuH7bSToM7ryiPRACsQBWcixdah7WbPGr3+ch0C2MAzFehC4pepjTsc+vVP
         xNiK5Fxxzl+cV/ntZjvoCz0VY5LDpmrib9uDBk2fC2O54Q0Tl0VjA/FCgFmsKwho/oyd
         gWoZWPrXx3rZ8CzgKHIT4KiSU4PcMGDE7zXv9xmhm5sQkK4NAVJVFnIvYp3FY+qijYrl
         R1KdCkSnjAd3P7yIvGRsNaoTqM/X/Eb+maIZ+/4Jb96uudk78emR41mqefCTDhU80mPt
         yBx1K6qaFffaVuTz0d/Wdw5p3QfpTFrozHnxxBW10HED3MND5AJnBPuHsHKp6ce6ym5u
         m0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qmrdZKjfoj5CPPpFPntvvUb8XA6zxvuRpATASktYgx8=;
        b=lKWekUWTfQY7OB+grRhMJnqRgsqKazQ7YkIRkhXzes8NJlFl0IQtR9DarvkkaDgXWn
         ucQsRafFEeRktrMkFA0kqLr0oekFjoSAmqVdqwqTMuYjTTUg9CVAppGfIpNZHWuU7Ybp
         JtJrDXRPLxvFhly9CJxvSZRxuC99FsLNjuWv/Qp7rlWsgmym8ev7mHfmAZpCwd67wRGd
         SuEIwtvCO4yLH/1tZaKZJW55uO8VMnKpuAGcFR31aOtKwFXvMnsSwvfbpeVzSz9lCfb4
         DxaNEE5mVMKSAKx/r02/sQIju3odJm8PdeOmTVc7NvMSUxz8jn+BCUR+xyulpiwCCLXu
         Bd8Q==
X-Gm-Message-State: APjAAAXNUDJfpIdQiTJgJ37P2wUxH9YbF09gKBf+uFZw4eLMr9ogIlaT
        Yko5KYkTEwSt0EWkLx+kMwg=
X-Google-Smtp-Source: APXvYqw3ceWxjw28vQ+TgLakMSeqysklWmwq8fwM3OqFKNf2PYqo7dzAgVYBAG4GXWDjHotd4QIKBA==
X-Received: by 2002:aa7:82d5:: with SMTP id f21mr2448554pfn.245.1578447546754;
        Tue, 07 Jan 2020 17:39:06 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id j2sm867160pfi.22.2020.01.07.17.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 17:39:06 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        Brian Masney <masneyb@onstation.org>,
        Fabio Estevam <festevam@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] drm/msm: support firmware-name for zap fw
Date:   Tue,  7 Jan 2020 17:38:42 -0800
Message-Id: <20200108013847.899170-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108013847.899170-1-robdclark@gmail.com>
References: <20200108013847.899170-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Since zap firmware can be device specific, allow for a firmware-name
property in the zap node to specify which firmware to load, similarly to
the scheme used for dsp/wifi/etc.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 32 ++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 112e8b8a261e..aa8737bd58db 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -26,6 +26,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 {
 	struct device *dev = &gpu->pdev->dev;
 	const struct firmware *fw;
+	const char *signed_fwname = NULL;
 	struct device_node *np, *mem_np;
 	struct resource r;
 	phys_addr_t mem_phys;
@@ -58,8 +59,33 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 
 	mem_phys = r.start;
 
-	/* Request the MDT file for the firmware */
-	fw = adreno_request_fw(to_adreno_gpu(gpu), fwname);
+	/*
+	 * Check for a firmware-name property.  This is the new scheme
+	 * to handle firmware that may be signed with device specific
+	 * keys, allowing us to have a different zap fw path for different
+	 * devices.
+	 *
+	 * If the firmware-name property is found, we bypass the
+	 * adreno_request_fw() mechanism, because we don't need to handle
+	 * the /lib/firmware/qcom/* vs /lib/firmware/* case.
+	 *
+	 * If the firmware-name property is not found, for backwards
+	 * compatibility we fall back to the fwname from the gpulist
+	 * table.
+	 */
+	of_property_read_string_index(np, "firmware-name", 0, &signed_fwname);
+	if (signed_fwname) {
+		fwname = signed_fwname;
+		ret = request_firmware_direct(&fw, signed_fwname, gpu->dev->dev);
+		if (ret) {
+			DRM_DEV_ERROR(dev, "could not load signed zap firmware: %d\n", ret);
+			fw = ERR_PTR(ret);
+		}
+	} else {
+		/* Request the MDT file for the firmware */
+		fw = adreno_request_fw(to_adreno_gpu(gpu), fwname);
+	}
+
 	if (IS_ERR(fw)) {
 		DRM_DEV_ERROR(dev, "Unable to load %s\n", fwname);
 		return PTR_ERR(fw);
@@ -95,7 +121,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 	 * not.  But since we've already gotten through adreno_request_fw()
 	 * we know which of the two cases it is:
 	 */
-	if (to_adreno_gpu(gpu)->fwloc == FW_LOCATION_LEGACY) {
+	if (signed_fwname || (to_adreno_gpu(gpu)->fwloc == FW_LOCATION_LEGACY)) {
 		ret = qcom_mdt_load(dev, fw, fwname, pasid,
 				mem_region, mem_phys, mem_size, NULL);
 	} else {
-- 
2.24.1

