Return-Path: <linux-arm-msm+bounces-47277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51077A2DB09
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 06:07:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E15C9165DC2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 05:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA34D149E17;
	Sun,  9 Feb 2025 05:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gELAjhaZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AEE146A60
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 05:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739077617; cv=none; b=PCagsNqaO2GTx0/+knASVMdMh+fyVHcvPZoO29zzsc3JE/CgZDoSzyvHIW/PM10uTLemLLfsblNROWaGfgiORbrFjYnuo2wm4xVxY+V7CWAqPAfGLo16wB3xyZYxM5I/ICxNBloifErM6qsg6M8g72i81fX4virXq8Q/AFB0/Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739077617; c=relaxed/simple;
	bh=V2+u0bC4oPjC0u3tfxjS0BIJRTLcQO+x+kAXxGzeCl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DGVa8kah9TSNcmWHercjqUNN7rFLSngvCm/pjRi7z5veoxGTAiaCMTz2SxgLlawsE8UL6aU5KQwPyty+tt9lo3FeyOR8A4ZPImyJfAUBRzWexQ172c7GDPZW4zzQ4X8A3vYdYSVrG3oTpIBXURrm3JO2tiT2KeUH/2DRX6ulLio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gELAjhaZ; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-545064389d3so812020e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Feb 2025 21:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739077613; x=1739682413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1i3ljPbx6n5V5EZfIVWiBHAB9nww5tkVOh9CuEMj1M=;
        b=gELAjhaZ2YiKFSkDHFiEjeLvW9eXDJ1KGvZbbbEc/X7osJxkhKtAXTKYKwnzIE39y7
         VA5wiKSGuhch+CFYn0hFVAsv75zGYoPo/vkadj6eW6JvenizcGMTNeOeo/tomFiFrhea
         5NLAKbL11tYoZ8aAg7omNKgAO2TSafSaMcnFOEuXjPcMj0FM7J40qhbZhL2nY2Ug31og
         CCXVNA0QbkVLDMcRsQBTQqUMP+KcNdLtSCgx7QFKVGdPXtwMDNg0iLCjPml/+rIG7535
         RZKr6/DFeIdM0RGbQgfxR6D5yyhRKhZ2DGS5iwASsKvW2zsY2UaFrQ9lwhj/K0nJdVAm
         BE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739077613; x=1739682413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1i3ljPbx6n5V5EZfIVWiBHAB9nww5tkVOh9CuEMj1M=;
        b=s6jceLIgT+qnVrrjlQ0oiOgoTy0qlfd323xW5DlL1/26W4y63YTb5BJkYM6AhkSKvq
         zUkTg9be1UKaSQM8IoQuCk5Jrk0M97QF6JfY0/gOkQYgvh2ySVU7xCNFmjfj/l8/UynT
         ND/08Y8kPA/LTaoPUWvkt3Tpsio7gkBthRcnsdKfgLiaKTYXtRTSpJ2JOZiw9FtphPdA
         O+GML1SH4NX09PYiwmSkOzXwVTc6BZeY0VzGlz71H+YarB/QHeo1uYSJ0HgSAm5ds0d3
         7TvUB0/XeAxboMj42mqsVDOXsLQZ9tZaUagSzekefNn8jI6YJ7/xQLI1TD7SIH3OJkm9
         ikRA==
X-Gm-Message-State: AOJu0YyQaOL8CWPjn+Jd78OSyaCmTLWhlTn+04IVDYbbbapYdPMWYz0t
	0OI5kLh5qNk9/Baqg6C9EdsLshkQCMQKyR3XCLugbmfUj7FEfUPifnNo2tLmhCW1vcfHjdGraXD
	3pLA=
X-Gm-Gg: ASbGncsM37yPQKDxnvle77t8tUFCMSglWJyuleNnpDj87/AGMbCgH/GWtGfJ2EVqZZl
	GU8veApAmRhMY7anCI5/jzp88rE6Jh/sC/im7T4Z3YyFITIHmDcJ2QbBvhktVkvWu2i23bo99UH
	0NwZE03/5w1PU+h9vYxS0baqIwkJTuAwucS1Q55x9U06WwgsvtQuFOqn0DNz90RdvsbDhhC0hQV
	uAl4g2Eul2rs3nwyxFeqaTMWMeUM2yvloevp0WzPwlxVruMcRD2B24adpb1ESdr1lganlojMiq8
	5Xmtj5MZFMDg4S/fUq3rvDE=
X-Google-Smtp-Source: AGHT+IHhrPXiDJCWG6hpdLlaVYwDxoqtPiYGeBTQzAk5uMXShtQkmyqWTzBa2iy7/Jghy3XHQJdKLg==
X-Received: by 2002:a05:6512:6c6:b0:545:a2a:589 with SMTP id 2adb3069b0e04-5450a2a07f5mr166047e87.52.1739077612585;
        Sat, 08 Feb 2025 21:06:52 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 21:06:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 07:04:47 +0200
Subject: [PATCH v4 03/16] drm/msm/hdmi: convert clock and regulator arrays
 to const arrays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-fd-hdmi-hpd-v4-3-6224568ed87f@linaro.org>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
In-Reply-To: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2818;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=V2+u0bC4oPjC0u3tfxjS0BIJRTLcQO+x+kAXxGzeCl4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqDfh2U+hzoadQ+a4byMFO75tIEaeUu43yMPSa
 iC0d4FmLmCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6g34QAKCRCLPIo+Aiko
 1T1FB/9pRpx/pOBOFh/T4LCyxNxh51SDyyHMf7w5RwtVQUYYvUl6RPPtKbYZX6F7YFIczn7O7M3
 1gfOvnRH65inkTaEF2DZBWuCJipdG1GEYIWjC88ltJxAm99olN1LBL7YLMiJzWzhDG8j4cNGDS/
 127blgDqZ452VTRN+ZtNGgTaRGermUVSGfSpF2solm3/zCP8DsgEIGbke6BpZQAE2Gm2VWOYPlS
 /atMVixdLSgxMBdaayyA9p1ngVbm2hYara+DNebVlfi5L+RDAoBsRKWgydKADOnz/hmZDtW52EC
 WDo18zCKmEjFb8BKbS/IpcYJMxaCpqA9nUlKPpj4e7vV3SCP
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

As a preparation to the next patches convert 'static const char *'
arrays to 'static const char * const', as required by the checkpatch.pl

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 10 +++++-----
 drivers/gpu/drm/msm/hdmi/hdmi.h |  8 ++++----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 248541ff449204c72cd444458dadb9ae4a0a53d1..9e9900882687fa2ae4a734d5cf10b5bae5af2f87 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -224,17 +224,17 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	.item ## _names = item ##_names_ ## entry, \
 	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
 
-static const char *hpd_reg_names_8960[] = {"core-vdda"};
-static const char *hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
+static const char * const hpd_reg_names_8960[] = {"core-vdda"};
+static const char * const hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8960_config = {
 		HDMI_CFG(hpd_reg, 8960),
 		HDMI_CFG(hpd_clk, 8960),
 };
 
-static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char *pwr_clk_names_8x74[] = {"extp", "alt_iface"};
-static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
+static const char * const pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
+static const char * const pwr_clk_names_8x74[] = {"extp", "alt_iface"};
+static const char * const hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
 static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index a5f481c39277631b7a19d294b086d6208be26511..381f957b34305494cb4da0b7dccb73b6ac3a1377 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -84,20 +84,20 @@ struct hdmi {
 /* platform config data (ie. from DT, or pdata) */
 struct hdmi_platform_config {
 	/* regulators that need to be on for hpd: */
-	const char **hpd_reg_names;
+	const char * const *hpd_reg_names;
 	int hpd_reg_cnt;
 
 	/* regulators that need to be on for screen pwr: */
-	const char **pwr_reg_names;
+	const char * const *pwr_reg_names;
 	int pwr_reg_cnt;
 
 	/* clks that need to be on for hpd: */
-	const char **hpd_clk_names;
+	const char * const *hpd_clk_names;
 	const long unsigned *hpd_freq;
 	int hpd_clk_cnt;
 
 	/* clks that need to be on for screen pwr (ie pixel clk): */
-	const char **pwr_clk_names;
+	const char * const *pwr_clk_names;
 	int pwr_clk_cnt;
 };
 

-- 
2.39.5


