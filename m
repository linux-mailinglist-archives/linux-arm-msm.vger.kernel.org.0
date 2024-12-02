Return-Path: <linux-arm-msm+bounces-39821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 393619DFE47
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 11:08:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95BF0163939
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 10:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97321FBEA1;
	Mon,  2 Dec 2024 10:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V5iTf5I4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2F91FDE23
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 10:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733134015; cv=none; b=hr3bT14vQ97Ot5mr0PEbhRqW4nv1Puabi2d4FoArsRdvCjJYG5bzsxOmeBF/DE3GbLFvu6gTCuBiOxlMNTTp7H0XGSVVECRGWu6ly1VScfj8+GZ629urSSohJ9mNPIIzVMMMLFAaKf1hbxR06nmpYVXY2v9lzTvcjyu8HZ3Ocq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733134015; c=relaxed/simple;
	bh=jPXlw8YV0VEC5En14+easdsboIgSnfKmGJBAZU9wjoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jXRYhAzr2C3yqudk/Sfjvcjst95VAjPrTqdzuNCMu0JPTKAZmZBHs5IA2/wOVA2dvU2WO/8poCBukPWP7+oDtVJtLb27OxyCHcmdyV+DDCmamKH5Ng3d0SE33NeJs3UvJgA+DzwBOB6S7YOQ+V/gQZavDo/TtHfjTE3HCym/ytk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V5iTf5I4; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53df80eeeedso4008742e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 02:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733134010; x=1733738810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uS5aKTLZjdDWibyOITgRdr1cFotMcq3/tAhs2peORdw=;
        b=V5iTf5I4JI/4lqwD/kh82h5Lg5d7/GzBI4IZ123i0CDVymFkewsfQ/ftoSTJS8rVE5
         S19C3RaryDJUKC6i94JdrJ/sWCa9+CdVJF8/Yu3K0S/giJ6JyFqoMHt/BfU/r9qxBO6x
         Sj7vVl5+cddK/rmhd7/HeO4+9LJivOgd42ymMmp+ZKFAPyNSmM0Xo7cmlCkaYVKHgq0g
         eZc1rNfF+v3Bsqimji+DCd4MsEwnCdbTlhHecsg+h5yCixKRfIwm/IYENTff8lAQGYtw
         +4Amu/VMZeOxizUuCVjQ2gZM6Qk03q3jHBV8FqiM9eylWhaVvNNcQPSJ9McjT4bclp9b
         dv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733134010; x=1733738810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uS5aKTLZjdDWibyOITgRdr1cFotMcq3/tAhs2peORdw=;
        b=S1//Ce62pctInzmfY4a6tKcT2eDc5W6ul/qULLSTDfkvTOnZB4JmD2hMtT5zJOIxIT
         FDulv5tl5kadYV3hGq2uIepfu1gcrQyoCCsUiP6SUu/Oxsy/7Jbc1J1QIawmqzY+tCfk
         hLG2KsNuV9Bysho0YhakaAfNMBNu77G+eYzefuVdcAtJ4fJ8j/kFueqtFLQZwWjUhcSs
         PqqfiAAquTVUjpzllIyDr8SWHEvxwoFRtHds0jGK32PbGt0FpKKK7VTqXcxK8KbAKcWn
         MfTkLsRDBfb+dAUlcncG+nrFlH7Pr1qjXz0c6M9NYuK469vx2286S+r29LoOhd/2rtdf
         9dFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXWvOlKyut0pw11vgFxhHx7Q7PyZfBijGWHIRNjToRlAQ4gs7hMTs+wMto0pb4UxuYwl1T611KN+kjthbU@vger.kernel.org
X-Gm-Message-State: AOJu0YxRFNXU9Fmsjr2e2pBlFdRMOAshnaIY2Ssq+VsqbGU2KGJ0MTDP
	+NVDX3UTxZR7AagChSn7+lBF+btPLqD3jjQGwWwghBdfppP21rdJumc3X83WE8Q=
X-Gm-Gg: ASbGncv5ohSv5PDexsKGYIh+adXTvKZUOwFUv+lxW28g45wbdj4NyL9Obqwo8Vkec5R
	k6rqzCfSngaEKpmaq9KZTu3AjGQ/9mk8fJ2tq5OqOUjYrmBc3zLg5Sq62ryxAa2OO11zQFyrOjO
	ac//PqnmbnBmBLdy33ToleQ52/zryh21Rff5o6ObYpq1vZT3ooqfE0c6XUGeRFNrK+S1cogyzQi
	TWxfrFbWJMB5AUwtexX5RZWUayhH+P2fzcHWEJndLFmcRxq/Rgl+X/gwA==
X-Google-Smtp-Source: AGHT+IGZFI2kPR7VdI88VCaccbMSCZz+Bt8U4y2Qg+U0HKF6zlL+v+0x2KNtz4fBEekha9SIs/Q+vQ==
X-Received: by 2002:a05:6512:a90:b0:53d:ef49:5b5a with SMTP id 2adb3069b0e04-53df00c6057mr11033673e87.1.1733134010081;
        Mon, 02 Dec 2024 02:06:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646f191sm1418314e87.136.2024.12.02.02.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 02:06:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 02 Dec 2024 12:06:34 +0200
Subject: [PATCH v2 04/14] drm/msm/dp: pull I/O data out of
 msm_dp_catalog_private()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-fd-dp-audio-fixup-v2-4-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=46702;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jPXlw8YV0VEC5En14+easdsboIgSnfKmGJBAZU9wjoQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnTYas+aBGR6ABlvRODMqeapgcadh5BdoN2e0we
 y3CwAiR/puJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ02GrAAKCRCLPIo+Aiko
 1cNXCAChtkbrvFTUa5hMuTZiwrnV7K2ts1XoJdbb82FQ3UleL4xaAR8KI+40jYPNCcxKHvpWn0n
 QHG/OmRyRE5FPWSP45vScidBZi8ULln/tVbjEU+bVgRrHYWhAkLvg6s+DjIwuKw4ToIk1wd7ZWp
 iDOWopP5jFC5faPmvhqhm/XB+xOnTdD9NiWLbWqDR5rwMJ2s1GjAjrYI1EeSsUskKKL9Ksd5Mc5
 OMUNuJZtzmnHYoHlTdmZqxFzRlDozmF6rxQMYuFai//wTuFSC8Mt/983XQdBUpQrMMIWgtXsBOA
 kZ77CMZz2DI0Du7//Zr0mPDvsSUsBnlowOJJsTCwHXG9Z+5q
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Having I/O regions inside a msm_dp_catalog_private() results in extra
layers of one-line wrappers for accessing the data. Move I/O region base
and size to the globally visible struct msm_dp_catalog.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 453 ++++++++++++++----------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  12 +
 2 files changed, 193 insertions(+), 272 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 0357dec1acd5773f25707e7ebdfca4b1d2b1bb4e..f02427dc08eb00e1b6a1b2e026a6bf5015c4b46e 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -63,155 +63,124 @@
 #define DP_DEFAULT_P0_OFFSET	0x1000
 #define DP_DEFAULT_P0_SIZE	0x0400
 
-struct dss_io_region {
-	size_t len;
-	void __iomem *base;
-};
-
-struct dss_io_data {
-	struct dss_io_region ahb;
-	struct dss_io_region aux;
-	struct dss_io_region link;
-	struct dss_io_region p0;
-};
-
 struct msm_dp_catalog_private {
 	struct device *dev;
 	struct drm_device *drm_dev;
-	struct dss_io_data io;
 	u32 (*audio_map)[DP_AUDIO_SDP_HEADER_MAX];
 	struct msm_dp_catalog msm_dp_catalog;
 };
 
 void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_disp_state *disp_state)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-			struct msm_dp_catalog_private, msm_dp_catalog);
-	struct dss_io_data *dss = &catalog->io;
-
-	msm_disp_snapshot_add_block(disp_state, dss->ahb.len, dss->ahb.base, "dp_ahb");
-	msm_disp_snapshot_add_block(disp_state, dss->aux.len, dss->aux.base, "dp_aux");
-	msm_disp_snapshot_add_block(disp_state, dss->link.len, dss->link.base, "dp_link");
-	msm_disp_snapshot_add_block(disp_state, dss->p0.len, dss->p0.base, "dp_p0");
+	msm_disp_snapshot_add_block(disp_state, msm_dp_catalog->ahb_len, msm_dp_catalog->ahb_base, "dp_ahb");
+	msm_disp_snapshot_add_block(disp_state, msm_dp_catalog->aux_len, msm_dp_catalog->aux_base, "dp_aux");
+	msm_disp_snapshot_add_block(disp_state, msm_dp_catalog->link_len, msm_dp_catalog->link_base, "dp_link");
+	msm_disp_snapshot_add_block(disp_state, msm_dp_catalog->p0_len, msm_dp_catalog->p0_base, "dp_p0");
 }
 
-static inline u32 msm_dp_read_aux(struct msm_dp_catalog_private *catalog, u32 offset)
+static inline u32 msm_dp_read_aux(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
 {
-	return readl_relaxed(catalog->io.aux.base + offset);
+	return readl_relaxed(msm_dp_catalog->aux_base + offset);
 }
 
-static inline void msm_dp_write_aux(struct msm_dp_catalog_private *catalog,
+static inline void msm_dp_write_aux(struct msm_dp_catalog *msm_dp_catalog,
 			       u32 offset, u32 data)
 {
 	/*
 	 * To make sure aux reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	writel(data, catalog->io.aux.base + offset);
+	writel(data, msm_dp_catalog->aux_base + offset);
 }
 
-static inline u32 msm_dp_read_ahb(const struct msm_dp_catalog_private *catalog, u32 offset)
+static inline u32 msm_dp_read_ahb(const struct msm_dp_catalog *msm_dp_catalog, u32 offset)
 {
-	return readl_relaxed(catalog->io.ahb.base + offset);
+	return readl_relaxed(msm_dp_catalog->ahb_base + offset);
 }
 
-static inline void msm_dp_write_ahb(struct msm_dp_catalog_private *catalog,
+static inline void msm_dp_write_ahb(struct msm_dp_catalog *msm_dp_catalog,
 			       u32 offset, u32 data)
 {
 	/*
 	 * To make sure phy reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	writel(data, catalog->io.ahb.base + offset);
+	writel(data, msm_dp_catalog->ahb_base + offset);
 }
 
-static inline void msm_dp_write_p0(struct msm_dp_catalog_private *catalog,
+static inline void msm_dp_write_p0(struct msm_dp_catalog *msm_dp_catalog,
 			       u32 offset, u32 data)
 {
 	/*
 	 * To make sure interface reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	writel(data, catalog->io.p0.base + offset);
+	writel(data, msm_dp_catalog->p0_base + offset);
 }
 
-static inline u32 msm_dp_read_p0(struct msm_dp_catalog_private *catalog,
+static inline u32 msm_dp_read_p0(struct msm_dp_catalog *msm_dp_catalog,
 			       u32 offset)
 {
 	/*
 	 * To make sure interface reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	return readl_relaxed(catalog->io.p0.base + offset);
+	return readl_relaxed(msm_dp_catalog->p0_base + offset);
 }
 
-static inline u32 msm_dp_read_link(struct msm_dp_catalog_private *catalog, u32 offset)
+static inline u32 msm_dp_read_link(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
 {
-	return readl_relaxed(catalog->io.link.base + offset);
+	return readl_relaxed(msm_dp_catalog->link_base + offset);
 }
 
-static inline void msm_dp_write_link(struct msm_dp_catalog_private *catalog,
+static inline void msm_dp_write_link(struct msm_dp_catalog *msm_dp_catalog,
 			       u32 offset, u32 data)
 {
 	/*
 	 * To make sure link reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	writel(data, catalog->io.link.base + offset);
+	writel(data, msm_dp_catalog->link_base + offset);
 }
 
 /* aux related catalog functions */
 u32 msm_dp_catalog_aux_read_data(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	return msm_dp_read_aux(catalog, REG_DP_AUX_DATA);
+	return msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_DATA);
 }
 
 int msm_dp_catalog_aux_write_data(struct msm_dp_catalog *msm_dp_catalog, u32 data)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	msm_dp_write_aux(catalog, REG_DP_AUX_DATA, data);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_DATA, data);
 	return 0;
 }
 
 int msm_dp_catalog_aux_write_trans(struct msm_dp_catalog *msm_dp_catalog, u32 data)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	msm_dp_write_aux(catalog, REG_DP_AUX_TRANS_CTRL, data);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_TRANS_CTRL, data);
 	return 0;
 }
 
 int msm_dp_catalog_aux_clear_trans(struct msm_dp_catalog *msm_dp_catalog, bool read)
 {
 	u32 data;
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 
 	if (read) {
-		data = msm_dp_read_aux(catalog, REG_DP_AUX_TRANS_CTRL);
+		data = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_TRANS_CTRL);
 		data &= ~DP_AUX_TRANS_CTRL_GO;
-		msm_dp_write_aux(catalog, REG_DP_AUX_TRANS_CTRL, data);
+		msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_TRANS_CTRL, data);
 	} else {
-		msm_dp_write_aux(catalog, REG_DP_AUX_TRANS_CTRL, 0);
+		msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_TRANS_CTRL, 0);
 	}
 	return 0;
 }
 
 int msm_dp_catalog_aux_clear_hw_interrupts(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	msm_dp_read_aux(catalog, REG_DP_PHY_AUX_INTERRUPT_STATUS);
-	msm_dp_write_aux(catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x1f);
-	msm_dp_write_aux(catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x9f);
-	msm_dp_write_aux(catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0);
+	msm_dp_read_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_STATUS);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x1f);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x9f);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0);
 	return 0;
 }
 
@@ -230,47 +199,41 @@ int msm_dp_catalog_aux_clear_hw_interrupts(struct msm_dp_catalog *msm_dp_catalog
 void msm_dp_catalog_aux_reset(struct msm_dp_catalog *msm_dp_catalog)
 {
 	u32 aux_ctrl;
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	aux_ctrl = msm_dp_read_aux(catalog, REG_DP_AUX_CTRL);
+	aux_ctrl = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_CTRL);
 
 	aux_ctrl |= DP_AUX_CTRL_RESET;
-	msm_dp_write_aux(catalog, REG_DP_AUX_CTRL, aux_ctrl);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
 	usleep_range(1000, 1100); /* h/w recommended delay */
 
 	aux_ctrl &= ~DP_AUX_CTRL_RESET;
-	msm_dp_write_aux(catalog, REG_DP_AUX_CTRL, aux_ctrl);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
 }
 
 void msm_dp_catalog_aux_enable(struct msm_dp_catalog *msm_dp_catalog, bool enable)
 {
 	u32 aux_ctrl;
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	aux_ctrl = msm_dp_read_aux(catalog, REG_DP_AUX_CTRL);
+	aux_ctrl = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_CTRL);
 
 	if (enable) {
-		msm_dp_write_aux(catalog, REG_DP_TIMEOUT_COUNT, 0xffff);
-		msm_dp_write_aux(catalog, REG_DP_AUX_LIMITS, 0xffff);
+		msm_dp_write_aux(msm_dp_catalog, REG_DP_TIMEOUT_COUNT, 0xffff);
+		msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_LIMITS, 0xffff);
 		aux_ctrl |= DP_AUX_CTRL_ENABLE;
 	} else {
 		aux_ctrl &= ~DP_AUX_CTRL_ENABLE;
 	}
 
-	msm_dp_write_aux(catalog, REG_DP_AUX_CTRL, aux_ctrl);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
 }
 
 int msm_dp_catalog_aux_wait_for_hpd_connect_state(struct msm_dp_catalog *msm_dp_catalog,
 					      unsigned long wait_us)
 {
 	u32 state;
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 
 	/* poll for hpd connected status every 2ms and timeout after wait_us */
-	return readl_poll_timeout(catalog->io.aux.base +
+	return readl_poll_timeout(msm_dp_catalog->aux_base +
 				REG_DP_DP_HPD_INT_STATUS,
 				state, state & DP_DP_HPD_STATE_STATUS_CONNECTED,
 				min(wait_us, 2000), wait_us);
@@ -278,15 +241,13 @@ int msm_dp_catalog_aux_wait_for_hpd_connect_state(struct msm_dp_catalog *msm_dp_
 
 u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 intr, intr_ack;
 
-	intr = msm_dp_read_ahb(catalog, REG_DP_INTR_STATUS);
+	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS);
 	intr &= ~DP_INTERRUPT_STATUS1_MASK;
 	intr_ack = (intr & DP_INTERRUPT_STATUS1)
 			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
-	msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS, intr_ack |
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS, intr_ack |
 			DP_INTERRUPT_STATUS1_MASK);
 
 	return intr;
@@ -298,20 +259,14 @@ void msm_dp_catalog_ctrl_update_transfer_unit(struct msm_dp_catalog *msm_dp_cata
 				u32 msm_dp_tu, u32 valid_boundary,
 				u32 valid_boundary2)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	msm_dp_write_link(catalog, REG_DP_VALID_BOUNDARY, valid_boundary);
-	msm_dp_write_link(catalog, REG_DP_TU, msm_dp_tu);
-	msm_dp_write_link(catalog, REG_DP_VALID_BOUNDARY_2, valid_boundary2);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_VALID_BOUNDARY, valid_boundary);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_TU, msm_dp_tu);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_VALID_BOUNDARY_2, valid_boundary2);
 }
 
 void msm_dp_catalog_ctrl_state_ctrl(struct msm_dp_catalog *msm_dp_catalog, u32 state)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	msm_dp_write_link(catalog, REG_DP_STATE_CTRL, state);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL, state);
 }
 
 void msm_dp_catalog_ctrl_config_ctrl(struct msm_dp_catalog *msm_dp_catalog, u32 cfg)
@@ -321,13 +276,11 @@ void msm_dp_catalog_ctrl_config_ctrl(struct msm_dp_catalog *msm_dp_catalog, u32
 
 	drm_dbg_dp(catalog->drm_dev, "DP_CONFIGURATION_CTRL=0x%x\n", cfg);
 
-	msm_dp_write_link(catalog, REG_DP_CONFIGURATION_CTRL, cfg);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_CONFIGURATION_CTRL, cfg);
 }
 
 void msm_dp_catalog_ctrl_lane_mapping(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 ln_0 = 0, ln_1 = 1, ln_2 = 2, ln_3 = 3; /* One-to-One mapping */
 	u32 ln_mapping;
 
@@ -336,7 +289,7 @@ void msm_dp_catalog_ctrl_lane_mapping(struct msm_dp_catalog *msm_dp_catalog)
 	ln_mapping |= ln_2 << LANE2_MAPPING_SHIFT;
 	ln_mapping |= ln_3 << LANE3_MAPPING_SHIFT;
 
-	msm_dp_write_link(catalog, REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING,
+	msm_dp_write_link(msm_dp_catalog, REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING,
 			ln_mapping);
 }
 
@@ -344,17 +297,15 @@ void msm_dp_catalog_ctrl_psr_mainlink_enable(struct msm_dp_catalog *msm_dp_catal
 						bool enable)
 {
 	u32 val;
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	val = msm_dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
+	val = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
 
 	if (enable)
 		val |= DP_MAINLINK_CTRL_ENABLE;
 	else
 		val &= ~DP_MAINLINK_CTRL_ENABLE;
 
-	msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, val);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, val);
 }
 
 void msm_dp_catalog_ctrl_mainlink_ctrl(struct msm_dp_catalog *msm_dp_catalog,
@@ -370,25 +321,25 @@ void msm_dp_catalog_ctrl_mainlink_ctrl(struct msm_dp_catalog *msm_dp_catalog,
 		 * To make sure link reg writes happens before other operation,
 		 * msm_dp_write_link() function uses writel()
 		 */
-		mainlink_ctrl = msm_dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
+		mainlink_ctrl = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
 
 		mainlink_ctrl &= ~(DP_MAINLINK_CTRL_RESET |
 						DP_MAINLINK_CTRL_ENABLE);
-		msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 
 		mainlink_ctrl |= DP_MAINLINK_CTRL_RESET;
-		msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 
 		mainlink_ctrl &= ~DP_MAINLINK_CTRL_RESET;
-		msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 
 		mainlink_ctrl |= (DP_MAINLINK_CTRL_ENABLE |
 					DP_MAINLINK_FB_BOUNDARY_SEL);
-		msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 	} else {
-		mainlink_ctrl = msm_dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
+		mainlink_ctrl = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
 		mainlink_ctrl &= ~DP_MAINLINK_CTRL_ENABLE;
-		msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 	}
 }
 
@@ -400,7 +351,7 @@ void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog,
 	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
 				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	misc_val = msm_dp_read_link(catalog, REG_DP_MISC1_MISC0);
+	misc_val = msm_dp_read_link(msm_dp_catalog, REG_DP_MISC1_MISC0);
 
 	/* clear bpp bits */
 	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
@@ -410,16 +361,14 @@ void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog,
 	misc_val |= DP_MISC0_SYNCHRONOUS_CLK;
 
 	drm_dbg_dp(catalog->drm_dev, "misc settings = 0x%x\n", misc_val);
-	msm_dp_write_link(catalog, REG_DP_MISC1_MISC0, misc_val);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MISC1_MISC0, misc_val);
 }
 
 void msm_dp_catalog_setup_peripheral_flush(struct msm_dp_catalog *msm_dp_catalog)
 {
 	u32 mainlink_ctrl, hw_revision;
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	mainlink_ctrl = msm_dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
+	mainlink_ctrl = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
 
 	hw_revision = msm_dp_catalog_hw_revision(msm_dp_catalog);
 	if (hw_revision >= DP_HW_VERSION_1_2)
@@ -427,7 +376,7 @@ void msm_dp_catalog_setup_peripheral_flush(struct msm_dp_catalog *msm_dp_catalog
 	else
 		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_UPDATE_SDP;
 
-	msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 }
 
 void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
@@ -485,9 +434,9 @@ void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
 		nvid *= 3;
 
 	drm_dbg_dp(catalog->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
-	msm_dp_write_link(catalog, REG_DP_SOFTWARE_MVID, mvid);
-	msm_dp_write_link(catalog, REG_DP_SOFTWARE_NVID, nvid);
-	msm_dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_SOFTWARE_MVID, mvid);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_SOFTWARE_NVID, nvid);
+	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_DSC_DTO, 0x0);
 }
 
 int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_catalog,
@@ -505,7 +454,7 @@ int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_cata
 	bit = BIT(state_bit - 1) << DP_MAINLINK_READY_LINK_TRAINING_SHIFT;
 
 	/* Poll for mainlink ready status */
-	ret = readx_poll_timeout(readl, catalog->io.link.base +
+	ret = readx_poll_timeout(readl, msm_dp_catalog->link_base +
 					REG_DP_MAINLINK_READY,
 					data, data & bit,
 					POLLING_SLEEP_US, POLLING_TIMEOUT_US);
@@ -526,10 +475,7 @@ int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_cata
  */
 u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog)
 {
-	const struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	return msm_dp_read_ahb(catalog, REG_DP_HW_VERSION);
+	return msm_dp_read_ahb(msm_dp_catalog, REG_DP_HW_VERSION);
 }
 
 /**
@@ -547,28 +493,24 @@ u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog)
 void msm_dp_catalog_ctrl_reset(struct msm_dp_catalog *msm_dp_catalog)
 {
 	u32 sw_reset;
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	sw_reset = msm_dp_read_ahb(catalog, REG_DP_SW_RESET);
+	sw_reset = msm_dp_read_ahb(msm_dp_catalog, REG_DP_SW_RESET);
 
 	sw_reset |= DP_SW_RESET;
-	msm_dp_write_ahb(catalog, REG_DP_SW_RESET, sw_reset);
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_SW_RESET, sw_reset);
 	usleep_range(1000, 1100); /* h/w recommended delay */
 
 	sw_reset &= ~DP_SW_RESET;
-	msm_dp_write_ahb(catalog, REG_DP_SW_RESET, sw_reset);
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_SW_RESET, sw_reset);
 }
 
 bool msm_dp_catalog_ctrl_mainlink_ready(struct msm_dp_catalog *msm_dp_catalog)
 {
 	u32 data;
 	int ret;
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 
 	/* Poll for mainlink ready status */
-	ret = readl_poll_timeout(catalog->io.link.base +
+	ret = readl_poll_timeout(msm_dp_catalog->link_base +
 				REG_DP_MAINLINK_READY,
 				data, data & DP_MAINLINK_READY_FOR_VIDEO,
 				POLLING_SLEEP_US, POLLING_TIMEOUT_US);
@@ -583,17 +525,14 @@ bool msm_dp_catalog_ctrl_mainlink_ready(struct msm_dp_catalog *msm_dp_catalog)
 void msm_dp_catalog_ctrl_enable_irq(struct msm_dp_catalog *msm_dp_catalog,
 						bool enable)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
 	if (enable) {
-		msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS,
+		msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS,
 				DP_INTERRUPT_STATUS1_MASK);
-		msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS2,
+		msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2,
 				DP_INTERRUPT_STATUS2_MASK);
 	} else {
-		msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS, 0x00);
-		msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS2, 0x00);
+		msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS, 0x00);
+		msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2, 0x00);
 	}
 }
 
@@ -603,73 +542,63 @@ void msm_dp_catalog_hpd_config_intr(struct msm_dp_catalog *msm_dp_catalog,
 	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
 				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	u32 config = msm_dp_read_aux(catalog, REG_DP_DP_HPD_INT_MASK);
+	u32 config = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK);
 
 	config = (en ? config | intr_mask : config & ~intr_mask);
 
 	drm_dbg_dp(catalog->drm_dev, "intr_mask=%#x config=%#x\n",
 					intr_mask, config);
-	msm_dp_write_aux(catalog, REG_DP_DP_HPD_INT_MASK,
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK,
 				config & DP_DP_HPD_INT_MASK);
 }
 
 void msm_dp_catalog_ctrl_hpd_enable(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	u32 reftimer = msm_dp_read_aux(catalog, REG_DP_DP_HPD_REFTIMER);
+	u32 reftimer = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER);
 
 	/* Configure REFTIMER and enable it */
 	reftimer |= DP_DP_HPD_REFTIMER_ENABLE;
-	msm_dp_write_aux(catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
 
 	/* Enable HPD */
-	msm_dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
 }
 
 void msm_dp_catalog_ctrl_hpd_disable(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	u32 reftimer = msm_dp_read_aux(catalog, REG_DP_DP_HPD_REFTIMER);
+	u32 reftimer = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER);
 
 	reftimer &= ~DP_DP_HPD_REFTIMER_ENABLE;
-	msm_dp_write_aux(catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
 
-	msm_dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, 0);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_CTRL, 0);
 }
 
-static void msm_dp_catalog_enable_sdp(struct msm_dp_catalog_private *catalog)
+static void msm_dp_catalog_enable_sdp(struct msm_dp_catalog *msm_dp_catalog)
 {
 	/* trigger sdp */
-	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, UPDATE_SDP);
-	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x0);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG3, UPDATE_SDP);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG3, 0x0);
 }
 
 void msm_dp_catalog_ctrl_config_psr(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 config;
 
 	/* enable PSR1 function */
-	config = msm_dp_read_link(catalog, REG_PSR_CONFIG);
+	config = msm_dp_read_link(msm_dp_catalog, REG_PSR_CONFIG);
 	config |= PSR1_SUPPORTED;
-	msm_dp_write_link(catalog, REG_PSR_CONFIG, config);
+	msm_dp_write_link(msm_dp_catalog, REG_PSR_CONFIG, config);
 
-	msm_dp_write_ahb(catalog, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
-	msm_dp_catalog_enable_sdp(catalog);
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
+	msm_dp_catalog_enable_sdp(msm_dp_catalog);
 }
 
 void msm_dp_catalog_ctrl_set_psr(struct msm_dp_catalog *msm_dp_catalog, bool enter)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-			struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 cmd;
 
-	cmd = msm_dp_read_link(catalog, REG_PSR_CMD);
+	cmd = msm_dp_read_link(msm_dp_catalog, REG_PSR_CMD);
 
 	cmd &= ~(PSR_ENTER | PSR_EXIT);
 
@@ -678,8 +607,8 @@ void msm_dp_catalog_ctrl_set_psr(struct msm_dp_catalog *msm_dp_catalog, bool ent
 	else
 		cmd |= PSR_EXIT;
 
-	msm_dp_catalog_enable_sdp(catalog);
-	msm_dp_write_link(catalog, REG_PSR_CMD, cmd);
+	msm_dp_catalog_enable_sdp(msm_dp_catalog);
+	msm_dp_write_link(msm_dp_catalog, REG_PSR_CMD, cmd);
 }
 
 u32 msm_dp_catalog_link_is_connected(struct msm_dp_catalog *msm_dp_catalog)
@@ -688,7 +617,7 @@ u32 msm_dp_catalog_link_is_connected(struct msm_dp_catalog *msm_dp_catalog)
 				struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 status;
 
-	status = msm_dp_read_aux(catalog, REG_DP_DP_HPD_INT_STATUS);
+	status = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_STATUS);
 	drm_dbg_dp(catalog->drm_dev, "aux status: %#x\n", status);
 	status >>= DP_DP_HPD_STATE_STATUS_BITS_SHIFT;
 	status &= DP_DP_HPD_STATE_STATUS_BITS_MASK;
@@ -698,14 +627,12 @@ u32 msm_dp_catalog_link_is_connected(struct msm_dp_catalog *msm_dp_catalog)
 
 u32 msm_dp_catalog_hpd_get_intr_status(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 	int isr, mask;
 
-	isr = msm_dp_read_aux(catalog, REG_DP_DP_HPD_INT_STATUS);
-	msm_dp_write_aux(catalog, REG_DP_DP_HPD_INT_ACK,
+	isr = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_STATUS);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_ACK,
 				 (isr & DP_DP_HPD_INT_MASK));
-	mask = msm_dp_read_aux(catalog, REG_DP_DP_HPD_INT_MASK);
+	mask = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK);
 
 	/*
 	 * We only want to return interrupts that are unmasked to the caller.
@@ -719,29 +646,25 @@ u32 msm_dp_catalog_hpd_get_intr_status(struct msm_dp_catalog *msm_dp_catalog)
 
 u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 intr, intr_ack;
 
-	intr = msm_dp_read_ahb(catalog, REG_DP_INTR_STATUS4);
+	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS4);
 	intr_ack = (intr & DP_INTERRUPT_STATUS4)
 			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
-	msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS4, intr_ack);
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS4, intr_ack);
 
 	return intr;
 }
 
 int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 intr, intr_ack;
 
-	intr = msm_dp_read_ahb(catalog, REG_DP_INTR_STATUS2);
+	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2);
 	intr &= ~DP_INTERRUPT_STATUS2_MASK;
 	intr_ack = (intr & DP_INTERRUPT_STATUS2)
 			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
-	msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS2,
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2,
 			intr_ack | DP_INTERRUPT_STATUS2_MASK);
 
 	return intr;
@@ -749,13 +672,10 @@ int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog)
 
 void msm_dp_catalog_ctrl_phy_reset(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	msm_dp_write_ahb(catalog, REG_DP_PHY_CTRL,
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_PHY_CTRL,
 			DP_PHY_CTRL_SW_RESET | DP_PHY_CTRL_SW_RESET_PLL);
 	usleep_range(1000, 1100); /* h/w recommended delay */
-	msm_dp_write_ahb(catalog, REG_DP_PHY_CTRL, 0x0);
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_PHY_CTRL, 0x0);
 }
 
 void msm_dp_catalog_ctrl_send_phy_pattern(struct msm_dp_catalog *msm_dp_catalog,
@@ -766,66 +686,66 @@ void msm_dp_catalog_ctrl_send_phy_pattern(struct msm_dp_catalog *msm_dp_catalog,
 	u32 value = 0x0;
 
 	/* Make sure to clear the current pattern before starting a new one */
-	msm_dp_write_link(catalog, REG_DP_STATE_CTRL, 0x0);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL, 0x0);
 
 	drm_dbg_dp(catalog->drm_dev, "pattern: %#x\n", pattern);
 	switch (pattern) {
 	case DP_PHY_TEST_PATTERN_D10_2:
-		msm_dp_write_link(catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
 				DP_STATE_CTRL_LINK_TRAINING_PATTERN1);
 		break;
 	case DP_PHY_TEST_PATTERN_ERROR_COUNT:
 		value &= ~(1 << 16);
-		msm_dp_write_link(catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
 					value);
 		value |= SCRAMBLER_RESET_COUNT_VALUE;
-		msm_dp_write_link(catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
 					value);
-		msm_dp_write_link(catalog, REG_DP_MAINLINK_LEVELS,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_LEVELS,
 					DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2);
-		msm_dp_write_link(catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
 					DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
 		break;
 	case DP_PHY_TEST_PATTERN_PRBS7:
-		msm_dp_write_link(catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
 				DP_STATE_CTRL_LINK_PRBS7);
 		break;
 	case DP_PHY_TEST_PATTERN_80BIT_CUSTOM:
-		msm_dp_write_link(catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
 				DP_STATE_CTRL_LINK_TEST_CUSTOM_PATTERN);
 		/* 00111110000011111000001111100000 */
-		msm_dp_write_link(catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG0,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG0,
 				0x3E0F83E0);
 		/* 00001111100000111110000011111000 */
-		msm_dp_write_link(catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG1,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG1,
 				0x0F83E0F8);
 		/* 1111100000111110 */
-		msm_dp_write_link(catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG2,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG2,
 				0x0000F83E);
 		break;
 	case DP_PHY_TEST_PATTERN_CP2520:
-		value = msm_dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
+		value = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
 		value &= ~DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER;
-		msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, value);
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, value);
 
 		value = DP_HBR2_ERM_PATTERN;
-		msm_dp_write_link(catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
 				value);
 		value |= SCRAMBLER_RESET_COUNT_VALUE;
-		msm_dp_write_link(catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
 					value);
-		msm_dp_write_link(catalog, REG_DP_MAINLINK_LEVELS,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_LEVELS,
 					DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2);
-		msm_dp_write_link(catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
 					DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
-		value = msm_dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
+		value = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
 		value |= DP_MAINLINK_CTRL_ENABLE;
-		msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, value);
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, value);
 		break;
 	case DP_PHY_TEST_PATTERN_SEL_MASK:
-		msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL,
 				DP_MAINLINK_CTRL_ENABLE);
-		msm_dp_write_link(catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
 				DP_STATE_CTRL_LINK_TRAINING_PATTERN4);
 		break;
 	default:
@@ -837,26 +757,21 @@ void msm_dp_catalog_ctrl_send_phy_pattern(struct msm_dp_catalog *msm_dp_catalog,
 
 u32 msm_dp_catalog_ctrl_read_phy_pattern(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	return msm_dp_read_link(catalog, REG_DP_MAINLINK_READY);
+	return msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_READY);
 }
 
 /* panel related catalog functions */
 int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog, u32 total,
 				u32 sync_start, u32 width_blanking, u32 msm_dp_active)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 reg;
 
-	msm_dp_write_link(catalog, REG_DP_TOTAL_HOR_VER, total);
-	msm_dp_write_link(catalog, REG_DP_START_HOR_VER_FROM_SYNC, sync_start);
-	msm_dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
-	msm_dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER, msm_dp_active);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_TOTAL_HOR_VER, total);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_START_HOR_VER_FROM_SYNC, sync_start);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_ACTIVE_HOR_VER, msm_dp_active);
 
-	reg = msm_dp_read_p0(catalog, MMSS_DP_INTF_CONFIG);
+	reg = msm_dp_read_p0(msm_dp_catalog, MMSS_DP_INTF_CONFIG);
 
 	if (msm_dp_catalog->wide_bus_en)
 		reg |= DP_INTF_CONFIG_DATABUS_WIDEN;
@@ -866,42 +781,36 @@ int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog, u32 t
 
 	DRM_DEBUG_DP("wide_bus_en=%d reg=%#x\n", msm_dp_catalog->wide_bus_en, reg);
 
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, reg);
+	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_CONFIG, reg);
 	return 0;
 }
 
 static void msm_dp_catalog_panel_send_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog, struct dp_sdp *vsc_sdp)
 {
-	struct msm_dp_catalog_private *catalog;
 	u32 header[2];
 	u32 val;
 	int i;
 
-	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
-
 	msm_dp_utils_pack_sdp_header(&vsc_sdp->sdp_header, header);
 
-	msm_dp_write_link(catalog, MMSS_DP_GENERIC0_0, header[0]);
-	msm_dp_write_link(catalog, MMSS_DP_GENERIC0_1, header[1]);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_GENERIC0_0, header[0]);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_GENERIC0_1, header[1]);
 
 	for (i = 0; i < sizeof(vsc_sdp->db); i += 4) {
 		val = ((vsc_sdp->db[i]) | (vsc_sdp->db[i + 1] << 8) | (vsc_sdp->db[i + 2] << 16) |
 		       (vsc_sdp->db[i + 3] << 24));
-		msm_dp_write_link(catalog, MMSS_DP_GENERIC0_2 + i, val);
+		msm_dp_write_link(msm_dp_catalog, MMSS_DP_GENERIC0_2 + i, val);
 	}
 }
 
 static void msm_dp_catalog_panel_update_sdp(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct msm_dp_catalog_private *catalog;
 	u32 hw_revision;
 
-	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
-
 	hw_revision = msm_dp_catalog_hw_revision(msm_dp_catalog);
 	if (hw_revision < DP_HW_VERSION_1_2 && hw_revision >= DP_HW_VERSION_1_0) {
-		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x01);
-		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x00);
+		msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG3, 0x01);
+		msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG3, 0x00);
 	}
 }
 
@@ -912,15 +821,15 @@ void msm_dp_catalog_panel_enable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog,
 
 	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
 
-	cfg = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG);
-	cfg2 = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG2);
-	misc = msm_dp_read_link(catalog, REG_DP_MISC1_MISC0);
+	cfg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG);
+	cfg2 = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG2);
+	misc = msm_dp_read_link(msm_dp_catalog, REG_DP_MISC1_MISC0);
 
 	cfg |= GEN0_SDP_EN;
-	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG, cfg);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG, cfg);
 
 	cfg2 |= GENERIC0_SDPSIZE_VALID;
-	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG2, cfg2);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, cfg2);
 
 	msm_dp_catalog_panel_send_vsc_sdp(msm_dp_catalog, vsc_sdp);
 
@@ -930,7 +839,7 @@ void msm_dp_catalog_panel_enable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog,
 	drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=1\n");
 
 	pr_debug("misc settings = 0x%x\n", misc);
-	msm_dp_write_link(catalog, REG_DP_MISC1_MISC0, misc);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MISC1_MISC0, misc);
 
 	msm_dp_catalog_panel_update_sdp(msm_dp_catalog);
 }
@@ -942,15 +851,15 @@ void msm_dp_catalog_panel_disable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog)
 
 	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
 
-	cfg = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG);
-	cfg2 = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG2);
-	misc = msm_dp_read_link(catalog, REG_DP_MISC1_MISC0);
+	cfg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG);
+	cfg2 = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG2);
+	misc = msm_dp_read_link(msm_dp_catalog, REG_DP_MISC1_MISC0);
 
 	cfg &= ~GEN0_SDP_EN;
-	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG, cfg);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG, cfg);
 
 	cfg2 &= ~GENERIC0_SDPSIZE_VALID;
-	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG2, cfg2);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, cfg2);
 
 	/* switch back to MSA */
 	misc &= ~DP_MISC1_VSC_SDP;
@@ -958,7 +867,7 @@ void msm_dp_catalog_panel_disable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog)
 	drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=0\n");
 
 	pr_debug("misc settings = 0x%x\n", misc);
-	msm_dp_write_link(catalog, REG_DP_MISC1_MISC0, misc);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MISC1_MISC0, misc);
 
 	msm_dp_catalog_panel_update_sdp(msm_dp_catalog);
 }
@@ -1055,15 +964,15 @@ static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_
 
 static int msm_dp_catalog_get_io(struct msm_dp_catalog_private *catalog)
 {
+	struct msm_dp_catalog *msm_dp_catalog = &catalog->msm_dp_catalog;
 	struct platform_device *pdev = to_platform_device(catalog->dev);
-	struct dss_io_data *dss = &catalog->io;
 
-	dss->ahb.base = msm_dp_ioremap(pdev, 0, &dss->ahb.len);
-	if (IS_ERR(dss->ahb.base))
-		return PTR_ERR(dss->ahb.base);
+	msm_dp_catalog->ahb_base = msm_dp_ioremap(pdev, 0, &msm_dp_catalog->ahb_len);
+	if (IS_ERR(msm_dp_catalog->ahb_base))
+		return PTR_ERR(msm_dp_catalog->ahb_base);
 
-	dss->aux.base = msm_dp_ioremap(pdev, 1, &dss->aux.len);
-	if (IS_ERR(dss->aux.base)) {
+	msm_dp_catalog->aux_base = msm_dp_ioremap(pdev, 1, &msm_dp_catalog->aux_len);
+	if (IS_ERR(msm_dp_catalog->aux_base)) {
 		/*
 		 * The initial binding had a single reg, but in order to
 		 * support variation in the sub-region sizes this was split.
@@ -1071,34 +980,34 @@ static int msm_dp_catalog_get_io(struct msm_dp_catalog_private *catalog)
 		 * reg is specified, so fill in the sub-region offsets and
 		 * lengths based on this single region.
 		 */
-		if (PTR_ERR(dss->aux.base) == -EINVAL) {
-			if (dss->ahb.len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
+		if (PTR_ERR(msm_dp_catalog->aux_base) == -EINVAL) {
+			if (msm_dp_catalog->ahb_len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
 				DRM_ERROR("legacy memory region not large enough\n");
 				return -EINVAL;
 			}
 
-			dss->ahb.len = DP_DEFAULT_AHB_SIZE;
-			dss->aux.base = dss->ahb.base + DP_DEFAULT_AUX_OFFSET;
-			dss->aux.len = DP_DEFAULT_AUX_SIZE;
-			dss->link.base = dss->ahb.base + DP_DEFAULT_LINK_OFFSET;
-			dss->link.len = DP_DEFAULT_LINK_SIZE;
-			dss->p0.base = dss->ahb.base + DP_DEFAULT_P0_OFFSET;
-			dss->p0.len = DP_DEFAULT_P0_SIZE;
+			msm_dp_catalog->ahb_len = DP_DEFAULT_AHB_SIZE;
+			msm_dp_catalog->aux_base = msm_dp_catalog->ahb_base + DP_DEFAULT_AUX_OFFSET;
+			msm_dp_catalog->aux_len = DP_DEFAULT_AUX_SIZE;
+			msm_dp_catalog->link_base = msm_dp_catalog->ahb_base + DP_DEFAULT_LINK_OFFSET;
+			msm_dp_catalog->link_len = DP_DEFAULT_LINK_SIZE;
+			msm_dp_catalog->p0_base = msm_dp_catalog->ahb_base + DP_DEFAULT_P0_OFFSET;
+			msm_dp_catalog->p0_len = DP_DEFAULT_P0_SIZE;
 		} else {
-			DRM_ERROR("unable to remap aux region: %pe\n", dss->aux.base);
-			return PTR_ERR(dss->aux.base);
+			DRM_ERROR("unable to remap aux region: %pe\n", msm_dp_catalog->aux_base);
+			return PTR_ERR(msm_dp_catalog->aux_base);
 		}
 	} else {
-		dss->link.base = msm_dp_ioremap(pdev, 2, &dss->link.len);
-		if (IS_ERR(dss->link.base)) {
-			DRM_ERROR("unable to remap link region: %pe\n", dss->link.base);
-			return PTR_ERR(dss->link.base);
+		msm_dp_catalog->link_base = msm_dp_ioremap(pdev, 2, &msm_dp_catalog->link_len);
+		if (IS_ERR(msm_dp_catalog->link_base)) {
+			DRM_ERROR("unable to remap link region: %pe\n", msm_dp_catalog->link_base);
+			return PTR_ERR(msm_dp_catalog->link_base);
 		}
 
-		dss->p0.base = msm_dp_ioremap(pdev, 3, &dss->p0.len);
-		if (IS_ERR(dss->p0.base)) {
-			DRM_ERROR("unable to remap p0 region: %pe\n", dss->p0.base);
-			return PTR_ERR(dss->p0.base);
+		msm_dp_catalog->p0_base = msm_dp_ioremap(pdev, 3, &msm_dp_catalog->p0_len);
+		if (IS_ERR(msm_dp_catalog->p0_base)) {
+			DRM_ERROR("unable to remap p0 region: %pe\n", msm_dp_catalog->p0_base);
+			return PTR_ERR(msm_dp_catalog->p0_base);
 		}
 	}
 
@@ -1135,7 +1044,7 @@ u32 msm_dp_catalog_audio_get_header(struct msm_dp_catalog *msm_dp_catalog,
 
 	sdp_map = catalog->audio_map;
 
-	return msm_dp_read_link(catalog, sdp_map[sdp][header]);
+	return msm_dp_read_link(msm_dp_catalog, sdp_map[sdp][header]);
 }
 
 void msm_dp_catalog_audio_set_header(struct msm_dp_catalog *msm_dp_catalog,
@@ -1154,7 +1063,7 @@ void msm_dp_catalog_audio_set_header(struct msm_dp_catalog *msm_dp_catalog,
 
 	sdp_map = catalog->audio_map;
 
-	msm_dp_write_link(catalog, sdp_map[sdp][header], data);
+	msm_dp_write_link(msm_dp_catalog, sdp_map[sdp][header], data);
 }
 
 void msm_dp_catalog_audio_config_acr(struct msm_dp_catalog *msm_dp_catalog, u32 select)
@@ -1173,7 +1082,7 @@ void msm_dp_catalog_audio_config_acr(struct msm_dp_catalog *msm_dp_catalog, u32
 	drm_dbg_dp(catalog->drm_dev, "select: %#x, acr_ctrl: %#x\n",
 					select, acr_ctrl);
 
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_ACR_CTRL, acr_ctrl);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_ACR_CTRL, acr_ctrl);
 }
 
 void msm_dp_catalog_audio_enable(struct msm_dp_catalog *msm_dp_catalog, bool enable)
@@ -1187,7 +1096,7 @@ void msm_dp_catalog_audio_enable(struct msm_dp_catalog *msm_dp_catalog, bool ena
 	catalog = container_of(msm_dp_catalog,
 		struct msm_dp_catalog_private, msm_dp_catalog);
 
-	audio_ctrl = msm_dp_read_link(catalog, MMSS_DP_AUDIO_CFG);
+	audio_ctrl = msm_dp_read_link(msm_dp_catalog, MMSS_DP_AUDIO_CFG);
 
 	if (enable)
 		audio_ctrl |= BIT(0);
@@ -1196,7 +1105,7 @@ void msm_dp_catalog_audio_enable(struct msm_dp_catalog *msm_dp_catalog, bool ena
 
 	drm_dbg_dp(catalog->drm_dev, "dp_audio_cfg = 0x%x\n", audio_ctrl);
 
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_CFG, audio_ctrl);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_CFG, audio_ctrl);
 	/* make sure audio engine is disabled */
 	wmb();
 }
@@ -1213,7 +1122,7 @@ void msm_dp_catalog_audio_config_sdp(struct msm_dp_catalog *msm_dp_catalog)
 	catalog = container_of(msm_dp_catalog,
 		struct msm_dp_catalog_private, msm_dp_catalog);
 
-	sdp_cfg = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG);
+	sdp_cfg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG);
 	/* AUDIO_TIMESTAMP_SDP_EN */
 	sdp_cfg |= BIT(1);
 	/* AUDIO_STREAM_SDP_EN */
@@ -1227,9 +1136,9 @@ void msm_dp_catalog_audio_config_sdp(struct msm_dp_catalog *msm_dp_catalog)
 
 	drm_dbg_dp(catalog->drm_dev, "sdp_cfg = 0x%x\n", sdp_cfg);
 
-	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG, sdp_cfg);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG, sdp_cfg);
 
-	sdp_cfg2 = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG2);
+	sdp_cfg2 = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG2);
 	/* IFRM_REGSRC -> Do not use reg values */
 	sdp_cfg2 &= ~BIT(0);
 	/* AUDIO_STREAM_HB3_REGSRC-> Do not use reg values */
@@ -1237,7 +1146,7 @@ void msm_dp_catalog_audio_config_sdp(struct msm_dp_catalog *msm_dp_catalog)
 
 	drm_dbg_dp(catalog->drm_dev, "sdp_cfg2 = 0x%x\n", sdp_cfg2);
 
-	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG2, sdp_cfg2);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, sdp_cfg2);
 }
 
 void msm_dp_catalog_audio_init(struct msm_dp_catalog *msm_dp_catalog)
@@ -1292,7 +1201,7 @@ void msm_dp_catalog_audio_sfe_level(struct msm_dp_catalog *msm_dp_catalog, u32 s
 	catalog = container_of(msm_dp_catalog,
 		struct msm_dp_catalog_private, msm_dp_catalog);
 
-	mainlink_levels = msm_dp_read_link(catalog, REG_DP_MAINLINK_LEVELS);
+	mainlink_levels = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_LEVELS);
 	mainlink_levels &= 0xFE0;
 	mainlink_levels |= safe_to_exit_level;
 
@@ -1300,5 +1209,5 @@ void msm_dp_catalog_audio_sfe_level(struct msm_dp_catalog *msm_dp_catalog, u32 s
 			"mainlink_level = 0x%x, safe_to_exit_level = 0x%x\n",
 			 mainlink_levels, safe_to_exit_level);
 
-	msm_dp_write_link(catalog, REG_DP_MAINLINK_LEVELS, mainlink_levels);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_LEVELS, mainlink_levels);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 62a401d8f75a6af06445a42af657d65e3fe542c5..13486c9c8703748e69e846be681951368df0a29e 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -49,6 +49,18 @@ enum msm_dp_catalog_audio_header_type {
 
 struct msm_dp_catalog {
 	bool wide_bus_en;
+
+	void __iomem *ahb_base;
+	size_t ahb_len;
+
+	void __iomem *aux_base;
+	size_t aux_len;
+
+	void __iomem *link_base;
+	size_t link_len;
+
+	void __iomem *p0_base;
+	size_t p0_len;
 };
 
 /* Debug module */

-- 
2.39.5


