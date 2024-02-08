Return-Path: <linux-arm-msm+bounces-10201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A39484E3FD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 16:23:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00B3428C936
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 15:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64FE47B3C8;
	Thu,  8 Feb 2024 15:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HSNAIu/o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F41E79DDA
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Feb 2024 15:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707405794; cv=none; b=Rf1K1uv7GGlFsfhenK+6RpiC1/2wUOItJP2o3TVv6wQJSmq3c6h/g9xU3HVF9fcHeBz78WPbvJKrSQLucriW3peezTg8IV4LQg5WEdru1N0slpoxSphgfWbpcNHISi0k1DbgdpvBtuYfB9udg4MVTsHJSBl1ew+niSK/GImmpQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707405794; c=relaxed/simple;
	bh=lSoN4c4dQ5GWOLY+G32I+ql9QdfGB1rpvCvoA8U1v4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZDQJpR08TbAypkztOFVckwyKewMbQ8XwdP0gaB0r6BmUK2Lei+A6tuV18qSzHAXYxoHMufdpaCa0wrg6d4mCoMK379MeVvyY1eTGoMoTY6E9ySeXkqq2e4vTRyH2kUkklKIBFW+Cyms/x5QffKpbIlkYnP8PMtK6teXsMngLecw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HSNAIu/o; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5116063585aso2484679e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Feb 2024 07:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707405789; x=1708010589; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4npPI+xkEoBmWEsuW9AtPIqMiVTTM7opc5TOPILRMZw=;
        b=HSNAIu/oDWz9LcLuFXmE91DfPq5Xs++aQQ5m2N/ANW18I3cuyqoa/v7x9pXkZy+Eko
         D8qMXkDlNyrDzrgGVc3Zq1xu0+VuPTjPwXtktpCjvFyWp5RxLV5+v8XEw3gkqlQBhlij
         HFc2frJBdpRgGbsSQlOjRfebYSbHaxIj6Of38EwHl7rHjQ0oD480+w+v/5cNuSSDTNRD
         y4RuzPdFy1iG0l3AVsL2wGSpXU8m1HYa0fSttx6xCiWzzegaJwpv7EELWtQJlM9jRkUv
         pbLzIGpKIbbNo3o/oP4AVuwqRQQ9NIq9QmrZVVTZflUE1nP2Xd1H2+fFPrfdESLiE1k9
         TwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707405789; x=1708010589;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4npPI+xkEoBmWEsuW9AtPIqMiVTTM7opc5TOPILRMZw=;
        b=ElCzKtcUUYmq+WvFQKe22LRE/oXufECLORAWPTXejwAAGwR+TKE5aYMc9yse08yh3Z
         EOzNZpwrimfQwmj7ZJaM4BGxnQeyk/ah+Uq4dlQRjFua4yF3pMV+GL5R1/Svi+tFrs+4
         vrAZMhBHYGU74+mQawJ1TpGJLUUAkeAeqTtIjuN7RpguQnvxCcnZ3xqYq4b6CS4rrArI
         x0drAs+AFKuxvqPze74TI0zvq/EsPX3HyaZ62ZWlcfikzV9i14hOzGzaFwJLJIS25or3
         fJVfbeBxbMKR9Sy7qX/7l6KeLRow+jo3TzDdV4GA9on+lIMMgEn9mp0Tu17BOKX3shvg
         MF8w==
X-Gm-Message-State: AOJu0YxUwTpvwDhmOUykpYMLy8dR8Q2dUh0CGfOR668NXDvgR8/fCqUt
	7s2GD1y0QcoYNFE8iJnJ5E1iKhZkB21np5qBXAsB96RPfWu1VM8tAYmPi29YxGA=
X-Google-Smtp-Source: AGHT+IEClYFAU9BGzt/VQLfJNohrnzM+p2jhFYYCp6CYfEyHfx7AsYuQKJxti7pLx/68DH5jyct8Iw==
X-Received: by 2002:a05:6512:34ca:b0:511:729b:4a7b with SMTP id w10-20020a05651234ca00b00511729b4a7bmr553613lfr.23.1707405789329;
        Thu, 08 Feb 2024 07:23:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV7YNfQNUlgav+Sj7V7E/rWNOqacgBwg/58IvZWg25XLvdPZHvXXXghAukrZn1e+HH+sE5FTN7pSCkLviRJt5vf/2woaw+c3TB3i0KFnLocXUUX+vZlfacw/OYcPCOP8ha4IOyiMqE9mXrn4Ogk0j0MIs3hgnzv+IJmf+1l04aTsbawSF8m0p1VWnD0WIVJcGqeMuKBJpW2667DGwZt40/jnzrs0KO6YfPTIYaSlqYcjEbw7xYB22yEeKvhYtlQ6dkiS8y3o607O62u3shXsfzdpGYpcDKdzmwE1FytZlh+
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id ep8-20020a056512484800b00511549b15acsm25635lfb.123.2024.02.08.07.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 07:23:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 08 Feb 2024 17:23:08 +0200
Subject: [PATCH v4] drm/msm/dsi: Document DSC related pclk_rate and
 hdisplay calculations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240208-fd_document_dsc_pclk_rate-v4-1-56fe59d0a2e0@linaro.org>
X-B4-Tracking: v=1; b=H4sIANvxxGUC/zXM0QqDIBiG4VsJj2eUmdmOdh9jiNO/kpbGr4tFd
 O+TwU4+eA6+9yAR0EEk1+IgCJuLLvgMfimImbQfgTqbTVjFeMUqSQerbDDvBXxSNhq1mtesUCe
 gVgstWF/3shMk/1eEwX1+7fsje8Cw0DQh6H+xqfOwpu15V9ZM8lZIWlO7uIR7+dS4x2kO2+3lv
 MZQBhzJeX4BktRJi7IAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3118;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=lSoN4c4dQ5GWOLY+G32I+ql9QdfGB1rpvCvoA8U1v4o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlxPHcwgWs9T+m+hVHbJbJbSQqaMUUJYv/XNPP5
 Vvegdcs1EKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZcTx3AAKCRCLPIo+Aiko
 1XjrCACaCpbHCUdpJzaJfUSD4AVFocoo2MoARD/x8SnfIywSoJQTjmA723MqBvgvjsqI8bHRS2b
 xjuK3u2Rr+Ym6kkI0d/HRKd8WRzjMkxdjXac+VHKq4kZROH1kAlbFt9VK6ftpt4kGOYuOOMLQcp
 nw5P3uRNIOOtLMECGh/9GxIe26UiaC1EOvHYYg86VLVjZNseWSOxB2O69IijJ/7XCe7dgiTwspO
 agBk4zXFVH6v9bMGrttdkwpOCdcAdC7U+XuQ82CUcyvXhADwOqBbYSZ2JqVypAW7rm9KrFl05Dx
 LIx1JSAK21d85Ixj8TJbvjL3sWVlxZ7S9lZKNbkFJSiL4/F6
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Provide actual documentation for the pclk and hdisplay calculations in
the case of DSC compression being used.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes since v3:
- refresh rate -> transfer time (Abhinav)

Changes since v2:
- Followed suggestion by Abhinav and Marijn to improve documentatry
  comments.

Changes since v1:
- Converted dsi_adjust_pclk_for_compression() into kerneldoc (Marijn)
- Added a pointer from dsi_timing_setup() docs to
  dsi_adjust_pclk_for_compression() (Marijn)
- Fixed two typo (Marijn)
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index deeecdfd6c4e..6a6f1a21705e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -529,6 +529,25 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
 	clk_disable_unprepare(msm_host->byte_clk);
 }
 
+/**
+ * dsi_adjust_pclk_for_compression() - Adjust the pclk rate for compression case
+ * @mode: The selected mode for the DSI output
+ * @dsc: DRM DSC configuration for this DSI output
+ *
+ * Adjust the pclk rate by calculating a new hdisplay proportional to
+ * the compression ratio such that:
+ *     new_hdisplay = old_hdisplay * compressed_bpp / uncompressed_bpp
+ *
+ * Porches do not need to be adjusted:
+ * - For VIDEO mode they are not compressed by DSC and are passed as is.
+ * - For CMD mode there are no actual porches. Instead these fields
+ *   currently represent the overhead to the image data transfer. As such, they
+ *   are calculated for the final mode parameters (after the compression) and
+ *   are not to be adjusted too.
+ *
+ *  FIXME: Reconsider this if/when CMD mode handling is rewritten to use
+ *  transfer time and data overhead as a starting point of the calculations.
+ */
 static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mode *mode,
 		const struct drm_dsc_config *dsc)
 {
@@ -951,8 +970,18 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		if (ret)
 			return;
 
-		/* Divide the display by 3 but keep back/font porch and
-		 * pulse width same
+		/*
+		 * DPU sends 3 bytes per pclk cycle to DSI. If widebus is
+		 * enabled, bus width is extended to 6 bytes.
+		 *
+		 * Calculate the number of pclks needed to transmit one line of
+		 * the compressed data.
+
+		 * The back/font porch and pulse width are kept intact. For
+		 * VIDEO mode they represent timing parameters rather than
+		 * actual data transfer, see the documentation for
+		 * dsi_adjust_pclk_for_compression(). For CMD mode they are
+		 * unused anyway.
 		 */
 		h_total -= hdisplay;
 		if (wide_bus_enabled && !(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO))

---
base-commit: b1d3a0e70c3881d2f8cf6692ccf7c2a4fb2d030d
change-id: 20240208-fd_document_dsc_pclk_rate-da6a62919876

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


