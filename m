Return-Path: <linux-arm-msm+bounces-41597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB279EDC0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 00:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8933E1882EDF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 23:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FC41FA8EA;
	Wed, 11 Dec 2024 23:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X37BRatP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9C31FA8DA
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 23:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733960524; cv=none; b=OfrPcc4eyIrlztpgn3JwDnz3I24LnZt7MQSlG1wJjbI4xTnRM8FA6HpaDOup/GukHD2cSOOQ+wC5z4lR6wXBMOES0GC2VmL3aF3S6IqzDALLk0SRWPlP8ywREmFHAvhNSEz79gbIOZ+6GLipTWvaOkESayQ20QH+vFGnvfMa2Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733960524; c=relaxed/simple;
	bh=dyxN4mwTMLFIskYwXXKo80YL4NUA82ROoopgPqf2w2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JQSUgES7j3TAhfTgiT60YdSAa+aXyvJhSvR4OMaV9akPw7HGGM/XZnwsHduN6lw27KAKYCJ5ZU4WtNtWVrATYxc7d0TKdYo5AFlCKuxfjmRXt4UDSuZGCTyGL4paTNn1c9K+M0fxO55x1qQLO/9pwiztiaZfcyaz9YnQ9W6A43Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X37BRatP; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so10207e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 15:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733960521; x=1734565321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpZM1bpdXBqMU2u4yvRKwWP1PlueNed0ysv0mPSPR9k=;
        b=X37BRatP5a2SijKGl0V0kosjXM0huFnrOcErGeKIH1zvBlSwyRwYdKn6/zDoxhCnh2
         0F/lfhVED/qCUEIqmC096XEG1mPA4qLry5hsjcqyHMB52C4hcc/ZB12YhwXrvOaWj4Qg
         8hRmx/yc+2cxd0bI3M7uDDeeSQcnBpJVoEoWf89VrL9Vz6KJrkrHc+j3Y+7QJLqznweg
         9B2z1rc1D52RnBat5qQbjyBYRmO2qzeO81rFqeak6z5fdoGfo+GjdNWnSLc88wqOlyJC
         ylg8FfS8oQFl9a+sZlhJyP3reynb0PVLrKEJx4xDYCGjeWqTiKBchFURvmW/ANdQIANW
         4+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733960521; x=1734565321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hpZM1bpdXBqMU2u4yvRKwWP1PlueNed0ysv0mPSPR9k=;
        b=SOeEwRD9JJRk/H/37LUt0ShT51PHDRwwlaF7Kd8WavHltO9WTLXDGxqEiv3y2OE4sj
         8Cz2mtJWCWxzSZ6LiAagW7CqMAkxhUApb34aoo7MFE3SyZE5qzP1m4kE5zCMaHRxm5QY
         j/LzuTMZrnZ19OCvSTaRnJtpd3Bz1LQLEm6Dt/ar8XE/TVYF5GLb28val5CqCRPqWlYZ
         6Jp2uQdwgRtL3jvjXhqc7dUPWLiFqXi5QGER+v0aJ76+Jc+JriSJ8QSV1ZQlNaU1mkiq
         TANYruSO8YaojhA5UZrJV69XfmhS/AQ/t1Z6bYcPFOR7SD1Rx5z4+2sebZCqheElt+00
         VkSQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3eV/rB5jivNKsAQ0fACrY6U1EgGyw+5EfbqWTFPSqqXUR5Il+KHxsOSlSWsADptM//+hBsYkWih056cTM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Cy0M4M5ZwK/KK4J1raK4OzmVVZGPtrMZRZmTvjqsYR88aD43
	/fGyU9tJiKD1mRDG6jdM0mrddpwcsUuIstKPNZq01b4M7by7E8t54iPsUNL/SGE=
X-Gm-Gg: ASbGncu/cXwuSApomJCPwul/4Ma33rmkyEOlMjBUFHWOINBfKsk4E8nGppQ5LjBVcc1
	cJqqYa69/4xQ1h3ULEOF1LpSbdvCbcesDg2CVyvLFXWlwFlX2o2E6MgSdRGvL4pG6GFO4C6s+/o
	isJ2Tp1vBvI7NNbC4JlrFMixQOu3mnHkHbi34IDCQrlD4/NqHUePVMJcBKp+qy+renrD5yGBORe
	amd2TZ8L5WFRdLEsbxuGX38ATc6x2dGtXuniKZMy68e94ZZl9JkH6f4HFXaog==
X-Google-Smtp-Source: AGHT+IF94KMMYln+//vVqkKbyiyFDtR0AeBqxyI0kKUUa8IlrlXphOtDKDkHTsB4lCtwqMjOCklk5A==
X-Received: by 2002:a05:6512:1188:b0:53f:8c46:42b3 with SMTP id 2adb3069b0e04-5402a5d3f22mr1443912e87.12.1733960520988;
        Wed, 11 Dec 2024 15:42:00 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401cc76909sm1222207e87.58.2024.12.11.15.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 15:41:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 12 Dec 2024 01:41:40 +0200
Subject: [PATCH v3 05/14] drm/msm/dp: move I/O functions to global header
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-fd-dp-audio-fixup-v3-5-0b1c65e7dba3@linaro.org>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
In-Reply-To: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5492;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=dyxN4mwTMLFIskYwXXKo80YL4NUA82ROoopgPqf2w2g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnWiM4XqhhSgGwj/4mB+punsl7XmvkvhFWPFAY3
 SWqrWjIXLqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1ojOAAKCRCLPIo+Aiko
 1a8WB/9i21w/CYcuLRVRqhQofvFcNZ6k/tr1xA6ELKn05E86y7atnkbOd6AuIp8ZoCeoJcYxPEq
 6HPKs8rOKb1oEms5btMt/DOf5HpBptuiAk8XNGvOkUFmDYn4QSsIhFQiRNKeGUlU/l2Q629GE38
 ZRWec4x8iBaBAhzo04ZnVUqBrAUL0lTFeakBVYM9Ehl8i4eMdTLCyw/rxUEySgCZZ1/vFA04PQ+
 RtHo1n6Jm70tJGYhkzC3eYlL8q3AAnn35FD5dMGVBzeYy4Khj2sdipllR+SVUm9yo1fI2yu4Xiw
 vJ7+QcLNV/jbwtsC9/QMVSUacL7mPu2Qq2SxYEU4xfM1IRWM
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Move msm_dp_read()/msm_write_foo() functions to the dp_catalog.h,
allowing other modules to access the data directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 65 -------------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h | 62 +++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index cdb8685924a06e4fc79d70586630ccb9a16a676d..a4ac132d807ea469709de68bc0b65ef41dcdae86 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -82,71 +82,6 @@ void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_d
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
index 13486c9c8703748e69e846be681951368df0a29e..0505b4be61f4e316f03df1d52ea35eb17e66580f 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -63,6 +63,68 @@ struct msm_dp_catalog {
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


