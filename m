Return-Path: <linux-arm-msm+bounces-43083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDDE9FA809
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 21:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE3EF165B53
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 20:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73DE0196D8F;
	Sun, 22 Dec 2024 20:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g4kc5Mtj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9FF199FBA
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Dec 2024 20:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734898462; cv=none; b=jVrLD8zPDok2aHeSHXJDwRllLztvHJc+XFEa7uCHGvyNSQNKuJqIDXaGSBRH84wC8hJr6hhJj6p+n+MTzeD5CCV9DShfvsxfo9IY3oVkp0s29RlvtwJkbHmn7zKd1z49r+ZVDaEbGs7YBe68W1QnZ8XtudEx5BCKC0HLjGW80q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734898462; c=relaxed/simple;
	bh=7PLWki9dLUTSYTbO8lnYK4VQogj3alhO9C5gmUos+0o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d2Z9H9VDVVxdxOqvk8ZZMbwhnn41O3SP3hPt+WtXlgbuacUtj6dTbjQLLd/zI39R90ehO1rFqSRiPbFmcXdlLXqFPKDUkGofLr3lnt+CFRraV95Wsf2T3C36FrXlThb7GnVpxwA9yHHFha27HEK5LiRhC0O3/Cfdjkhy1MqgMPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g4kc5Mtj; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3003c0c43c0so40852371fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Dec 2024 12:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734898459; x=1735503259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1CAACp4GjO3ym2QwQfPSi4sTCeC1v2d+xt2KcB0Ux7M=;
        b=g4kc5MtjBsATZjZ0LyiO7NaOQiDYTtv6Ec1HiabAOSsp29puMvb5bX/eTPONPRXLBD
         piKSYZYdMvYSZKM7F+2W3mgU8AZbqOJe+9sl8ffIWsoWDsRW3N6aDu5PQ1gjAbT9cS7M
         0BhbcQyvwKwuGIKKA/Slv00VYjxsOKM7eh98pa1EbryS7oJttIc9PDOuQQ0i15MSalr7
         lm+A9UfHYt+6/EXure58XaV6xxInU2TyqOwSFyQzmPMa1oGH/reeJN8jSQQ+sawy4GGV
         XyEMFoqSGBTS9cmVIWiC8rmQnU1XrOozoeq+JSm0OwPjhZo/UiaCMRUqL2RbmIUQJDdk
         bqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734898459; x=1735503259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1CAACp4GjO3ym2QwQfPSi4sTCeC1v2d+xt2KcB0Ux7M=;
        b=CXwS/ELWVz9FF2vVU0PLBGOTgLghPxjL86M/7dxvE/UqdPcZaASoj4RAvhSNqnDHB3
         JSsWcxCxNv1nIEo7L+9BPhBg01lorEMN63eHYVAvmmz8/AoNs4M46xMWlfNzDfN+YJuZ
         hOaF+JGx51NGde8lytSTJuE/PRMRc9KPreDRdZag7oCJT/zW32sFTTf7SCCdX4V2kLYb
         uPUTFy/6A9MvBpFKFwdd+KIY5pdvO2pQib+rErndCibwO7xppN70l/bz66WfRTBM4eiM
         GEiENZ7t9yuhicQxCiOtplRgChSiGIbZNx0Pyso+IH5rdXt0+9LXHtSd7QlzhCo6bm/A
         iwWg==
X-Forwarded-Encrypted: i=1; AJvYcCWEHzrGeFgdB/e0nHhz1q5lMFZHV+Bzl0fnq8BsiBhX06qPwdlULxZGcuvh9DU1YHnURzSP9Nmho0Bk4X7Q@vger.kernel.org
X-Gm-Message-State: AOJu0YxRYBT9n35FWme9+q3F49WY7dmUUtEQQFCtpxmix3m6LGUBAM/h
	WdbbLvj50vGbA3gCUgSxkBXDxL/QyQ8PNcFyz5tnWgslm5zfWZixLnMNXhqZj1A=
X-Gm-Gg: ASbGncsOEZmruf5u0mvwEUWfKRz3VLB7Zc1n+1wwZz13PLzlzJ1V/f8vexST2/SFDHA
	D9rUB79VJgLuFTGmS1qZLYBVJKiTcH9tW/VVZ9R4SQO6I9VXRVOC0kyw3uDwS4IQ674qGE/XJxc
	5Vw0I7C992XKZj0G6L3hKXI96I1URWgSYjBQqMzajOb9p23fHG1PeX/u4r9d6iocV5D7Bdcr5Gu
	vgCxIzBEfXqGNmmbHTDsh8vKb1ixeqGjKFXDbzUaX2wXF86YgtZNa/+kPW8/PtV
X-Google-Smtp-Source: AGHT+IH1NiMr5WnGF10+SPwgET/+bAdT9I+Y2w4pjPlA3DK9BEOnlkm9QFpkXP9RAFfV8fRrY9HPZQ==
X-Received: by 2002:a05:6512:4014:b0:53e:2bb0:4942 with SMTP id 2adb3069b0e04-5422956beb5mr3409806e87.57.1734898458568;
        Sun, 22 Dec 2024 12:14:18 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f7765sm1034331e87.13.2024.12.22.12.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 12:14:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Dec 2024 22:14:07 +0200
Subject: [PATCH v5 04/11] drm/msm/dp: move I/O functions to global header
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-fd-dp-audio-fixup-v5-4-370f09492cf6@linaro.org>
References: <20241222-fd-dp-audio-fixup-v5-0-370f09492cf6@linaro.org>
In-Reply-To: <20241222-fd-dp-audio-fixup-v5-0-370f09492cf6@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5605;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7PLWki9dLUTSYTbO8lnYK4VQogj3alhO9C5gmUos+0o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaHMOCSdLN9XuEmQuLPNm10wdFSwCaNzlzvw7H
 QPSJCvEqTCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2hzDgAKCRCLPIo+Aiko
 1R4iCACJa8b6gQ4MmQEEmaszTg2wOBCQqt5e8DGfl8fpXI4qmw+7QA8X3Mtd4rL++WF4hVnhlT9
 hH9y8uxmBXd/3YOrmCNdfGkPW+d2VoRWW2fbwTjQ6k6HfRxtG+Eq+9d47ZCTyo7XscJRaJ1jyoo
 q0zkmAnJ4Ncmj1oEUYD7fP5xXxVIWkiMulrZxJVV8CJs82ohXNCUNDKAAHWd2U3W4VgqgALTQxB
 nlrK0sNQxM1//YuiDRjw6jMedsDFHDNm1b2ixgyq5CKrxfSOUncAJJquFjLJYu+LVaGqYB1SUlg
 UsxdI+YFDPX4zmA4Jz9Jj0qIWmpDmWywkUGvFmmXiDc8XyfX
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Move msm_dp_read()/msm_write_foo() functions to the dp_catalog.h,
allowing other modules to access the data directly.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 65 -------------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h | 62 +++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 74ab86035f3b98b498756673229218558b6713c3..a22efb1e83d04cc5c9bc768a275df9cfb4752a2f 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -81,71 +81,6 @@ void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_d
 				    msm_dp_catalog->p0_len, msm_dp_catalog->p0_base, "dp_p0");
 }
 
-static inline u32 msm_dp_read_aux(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
-{
-	return readl_relaxed(msm_dp_catalog->aux_base + offset);
-}
-
-static inline void msm_dp_write_aux(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure aux reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->aux_base + offset);
-}
-
-static inline u32 msm_dp_read_ahb(const struct msm_dp_catalog *msm_dp_catalog, u32 offset)
-{
-	return readl_relaxed(msm_dp_catalog->ahb_base + offset);
-}
-
-static inline void msm_dp_write_ahb(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure phy reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->ahb_base + offset);
-}
-
-static inline void msm_dp_write_p0(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure interface reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->p0_base + offset);
-}
-
-static inline u32 msm_dp_read_p0(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset)
-{
-	/*
-	 * To make sure interface reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	return readl_relaxed(msm_dp_catalog->p0_base + offset);
-}
-
-static inline u32 msm_dp_read_link(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
-{
-	return readl_relaxed(msm_dp_catalog->link_base + offset);
-}
-
-static inline void msm_dp_write_link(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure link reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->link_base + offset);
-}
-
 /* aux related catalog functions */
 u32 msm_dp_catalog_aux_read_data(struct msm_dp_catalog *msm_dp_catalog)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 5a757671d7310b43e7ca0155ffdc276c83d1e8bc..10fd0086132092be88bb698e53124f87a906de70 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -48,6 +48,68 @@ struct msm_dp_catalog {
 	size_t p0_len;
 };
 
+/* IO */
+static inline u32 msm_dp_read_aux(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
+{
+	return readl_relaxed(msm_dp_catalog->aux_base + offset);
+}
+
+static inline void msm_dp_write_aux(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure aux reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, msm_dp_catalog->aux_base + offset);
+}
+
+static inline u32 msm_dp_read_ahb(const struct msm_dp_catalog *msm_dp_catalog, u32 offset)
+{
+	return readl_relaxed(msm_dp_catalog->ahb_base + offset);
+}
+
+static inline void msm_dp_write_ahb(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure phy reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, msm_dp_catalog->ahb_base + offset);
+}
+
+static inline void msm_dp_write_p0(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure interface reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, msm_dp_catalog->p0_base + offset);
+}
+
+static inline u32 msm_dp_read_p0(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset)
+{
+	return readl_relaxed(msm_dp_catalog->p0_base + offset);
+}
+
+static inline u32 msm_dp_read_link(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
+{
+	return readl_relaxed(msm_dp_catalog->link_base + offset);
+}
+
+static inline void msm_dp_write_link(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure link reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, msm_dp_catalog->link_base + offset);
+}
+
 /* Debug module */
 void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_disp_state *disp_state);
 

-- 
2.39.5


