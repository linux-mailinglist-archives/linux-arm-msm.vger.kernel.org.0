Return-Path: <linux-arm-msm+bounces-43089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3599FA819
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 21:17:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA5761886860
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 20:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2E01ACDF0;
	Sun, 22 Dec 2024 20:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OUyG0oKz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E601ABEB1
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Dec 2024 20:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734898477; cv=none; b=JtUetm+PkMloibvPc8Cq36fYDA7TAX7CyjiboiDqYk+7t3v3Ly9uSmpzrdrMxvPfLvF7MPgHwQMOa2V8vUKI5xXHpoKqltw2KIgVwroMgGivWes69RdeRkBEiVq69NEKK6aMTZKlCSPxdQch82AyNelAv+9beBXkRHvgQTd154k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734898477; c=relaxed/simple;
	bh=UD2B//JdD3ZkuDtuJd/nZIsqaOdBGlCdKqzJJTdWrD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PNMNybvDUJd6VhihJOxa99Awj60sF5sEVHb9U28P+2I63cH3kBOsyE3L3F6G1eGn4lDv+U+NOCelNB20Nm9y2h6beg89YIFDK+lhoqUXvzsczu1gdVSdAbOFq+JPN+6zpZ7cEFO6PdFr423kAZptCUKG8iyYRCTZh0EASlahiSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OUyG0oKz; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54021daa6cbso3750468e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Dec 2024 12:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734898473; x=1735503273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/hsRFW2+CzpT+xh1Sm0OrH4emW8gDyKyUuJZccsEVG8=;
        b=OUyG0oKzjAhVje3DVUbj2wpnBUZ7JuDxeVDia7nujO/zmrYpoD3pw9hoG3RCMeaA7z
         8mEJ6fsu/veCS2NRr3W/dGNc+f5Qwo9NwKiHBPJDS2TEmTJiVajK2iM/0CXNhRSYErMU
         RPrXBf/h3oHjhiGEW8PMt20Q8O7a941Ye4I/+hCHuxSIbhI6ZgLdTUsgkhTiAlKCXalV
         Ov58kGpKDMZrLh4sW7FPaHOfslm93AitFdEKXrWp7gfwLH2XdIkYo27sWXVdoZnBBdqd
         p7SskuT0HKVz3d/4zz2+tQwR0ctj+6D1vQWEByptqy5OQv0N/P+zNeac0dSMUBvKR2K/
         3Pog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734898473; x=1735503273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hsRFW2+CzpT+xh1Sm0OrH4emW8gDyKyUuJZccsEVG8=;
        b=t/TfdYSYXGm4JSiKptjtn7qG9EiMrELtSzdVqHyQA+Vz3g+6ptvRthoLkhQfKLArWL
         ebZhHdN+7KA28dLigQSEpaPz3KI/3I8PSK44jRn48WozfqSacF43yqypqdFvJMhB/LTz
         g/lO+WxkLlqsXd2GPGs7fOUbxtsNgT5Ckj4Lo8Pqv7PvuytaHWjH0meN/tKxG4nlyGr+
         DUBaSjnnewOeo8Yftf+9f9lWSSk3AOqEV70aO/QmIGJ3HPLNKnVjoWPMawW4wVIojkRL
         +gujWHd+1tm2x0723x4zSsokXY4yMHHHp91Qo7xdjCMK51CBknJwpx0Tn5Ae+si5wv/J
         jtwg==
X-Forwarded-Encrypted: i=1; AJvYcCW6Wnu7xd6ONVo8FN4HNHfuVDBTGFKHyy32Pq3rL8+s+OfwOehjpzeW46IPO4dIf6rPYfSemKstfAIEzmzq@vger.kernel.org
X-Gm-Message-State: AOJu0YzP9ZmMoAaHTNV9tx+u0vaZsM5oXxL/DdI8HUR5e+2513HtDPxM
	6zIiOeBjnSFjCwm+6bEnZ9oPqOWac2B7tOop9MMOohXhBzieQLJiOJO3weYk7IGhgR+/4joTh1I
	X
X-Gm-Gg: ASbGncsclL3ZCF3hP3/8UelpvadEPGklzdkFbcZ864b08ydu3wZ1rLuxBDMv8LDXUnA
	e+/ET2QuZGl2d6JdEn2LXcddGVmJUaSFHhTwtJtSnSXvUe23m9A6FJp8KsulEVc6bc0pZ6yCE0g
	QWxI7HgI+84OcNsqV3GL/jUriYq4bfaD+p9+Jmv3OogsxoKAilDdW5zD6vnjV9u8RQjmFNgmljo
	Vc1Z+puq2xw/b4WkCjE6hKasLxweAgrr1Nxt0+B/v56CsOpqDW/7FF1/8UfGpVj
X-Google-Smtp-Source: AGHT+IF522LP2530swXHWKq5eTHVTPqzzdUyPPhcEwgr3h9FsL4AqfS4I2WIJNk9AfE/PkGbQcDFUQ==
X-Received: by 2002:a05:6512:4014:b0:540:1c18:4e23 with SMTP id 2adb3069b0e04-5422956bf7dmr3334714e87.47.1734898472919;
        Sun, 22 Dec 2024 12:14:32 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f7765sm1034331e87.13.2024.12.22.12.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 12:14:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Dec 2024 22:14:13 +0200
Subject: [PATCH v5 10/11] drm/msm/dp: move interrupt handling to dp_ctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-fd-dp-audio-fixup-v5-10-370f09492cf6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=19061;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=UD2B//JdD3ZkuDtuJd/nZIsqaOdBGlCdKqzJJTdWrD4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaHMP8z/sGqduAigtyGYPcOgxZoeXKwtSF19+q
 W973Ll581WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2hzDwAKCRCLPIo+Aiko
 1WZ8B/4su1nmoom/lW05gASWnTkCkPbmKeXCYFw9PxsPjFPJ6yoQtIxZW21dJlt4RSfBHKrXjHl
 gu/iMsHeilvEUjGWBn4Yt5KBi0i9/Jd2o/af+VnCWbyteS6EcOXsyaceT0raXcR/ICmxrLSzOQ3
 QHNwqWA40hT0eQYtO5kWYMTDc/70oDkJVpaZkKNSqOmjFg+oqVV44dKgXEE10s89dqp9Fi769K5
 GC7EN7Nj+rTcNnLoDlG8tcvgbh1/ECmVE+Vvjl15HjVRV1GE9dF2wTjzAViEDKFQMKsnKz59Pdm
 fNbKWg2zZtjFp5v7SOlLtJp/fVVayZKSP6/t0nAZFabTB/ej
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

It makes it easier to keep all interrupts-related code in dp_ctrl
submodule. Move all functions to dp_ctrl.c.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c     |   9 +--
 drivers/gpu/drm/msm/dp/dp_aux.h     |   2 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c |  95 ------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  26 -------
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 142 ++++++++++++++++++++++++++++++------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   5 +-
 drivers/gpu/drm/msm/dp/dp_display.c |   9 +--
 drivers/gpu/drm/msm/dp/dp_reg.h     |  17 +++++
 8 files changed, 145 insertions(+), 160 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index f8ea1754665afa37ff9dbaf3f883d94c48bf07b8..d7a38fa5d64d618af463416edf13bef79d6b53ba 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -437,9 +437,8 @@ static ssize_t msm_dp_aux_transfer(struct drm_dp_aux *msm_dp_aux,
 	return ret;
 }
 
-irqreturn_t msm_dp_aux_isr(struct drm_dp_aux *msm_dp_aux)
+irqreturn_t msm_dp_aux_isr(struct drm_dp_aux *msm_dp_aux, u32 isr)
 {
-	u32 isr;
 	struct msm_dp_aux_private *aux;
 
 	if (!msm_dp_aux) {
@@ -449,12 +448,6 @@ irqreturn_t msm_dp_aux_isr(struct drm_dp_aux *msm_dp_aux)
 
 	aux = container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
 
-	isr = msm_dp_catalog_aux_get_irq(aux->catalog);
-
-	/* no interrupts pending, return immediately */
-	if (!isr)
-		return IRQ_NONE;
-
 	if (!aux->cmd_busy) {
 		DRM_ERROR("Unexpected DP AUX IRQ %#010x when not busy\n", isr);
 		return IRQ_NONE;
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
index 624395a41ed0a75ead4826e78d05ca21e8fb8967..83908c93b6a1baa6c4eb83a346b4498704008ca5 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.h
+++ b/drivers/gpu/drm/msm/dp/dp_aux.h
@@ -11,7 +11,7 @@
 
 int msm_dp_aux_register(struct drm_dp_aux *msm_dp_aux);
 void msm_dp_aux_unregister(struct drm_dp_aux *msm_dp_aux);
-irqreturn_t msm_dp_aux_isr(struct drm_dp_aux *msm_dp_aux);
+irqreturn_t msm_dp_aux_isr(struct drm_dp_aux *msm_dp_aux, u32 isr);
 void msm_dp_aux_enable_xfers(struct drm_dp_aux *msm_dp_aux, bool enabled);
 void msm_dp_aux_init(struct drm_dp_aux *msm_dp_aux);
 void msm_dp_aux_deinit(struct drm_dp_aux *msm_dp_aux);
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 9d6d59264a592cc3ae312b35e51d48c11bd141e6..84adf3a38e4cf0619b15850c31416f1e67049a42 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -15,41 +15,6 @@
 #include "dp_catalog.h"
 #include "dp_reg.h"
 
-#define POLLING_SLEEP_US			1000
-#define POLLING_TIMEOUT_US			10000
-
-#define DP_INTERRUPT_STATUS_ACK_SHIFT	1
-#define DP_INTERRUPT_STATUS_MASK_SHIFT	2
-
-#define DP_INTERRUPT_STATUS1 \
-	(DP_INTR_AUX_XFER_DONE| \
-	DP_INTR_WRONG_ADDR | DP_INTR_TIMEOUT | \
-	DP_INTR_NACK_DEFER | DP_INTR_WRONG_DATA_CNT | \
-	DP_INTR_I2C_NACK | DP_INTR_I2C_DEFER | \
-	DP_INTR_PLL_UNLOCKED | DP_INTR_AUX_ERROR)
-
-#define DP_INTERRUPT_STATUS1_ACK \
-	(DP_INTERRUPT_STATUS1 << DP_INTERRUPT_STATUS_ACK_SHIFT)
-#define DP_INTERRUPT_STATUS1_MASK \
-	(DP_INTERRUPT_STATUS1 << DP_INTERRUPT_STATUS_MASK_SHIFT)
-
-#define DP_INTERRUPT_STATUS2 \
-	(DP_INTR_READY_FOR_VIDEO | DP_INTR_IDLE_PATTERN_SENT | \
-	DP_INTR_FRAME_END | DP_INTR_CRC_UPDATED)
-
-#define DP_INTERRUPT_STATUS2_ACK \
-	(DP_INTERRUPT_STATUS2 << DP_INTERRUPT_STATUS_ACK_SHIFT)
-#define DP_INTERRUPT_STATUS2_MASK \
-	(DP_INTERRUPT_STATUS2 << DP_INTERRUPT_STATUS_MASK_SHIFT)
-
-#define DP_INTERRUPT_STATUS4 \
-	(PSR_UPDATE_INT | PSR_CAPTURE_INT | PSR_EXIT_INT | \
-	PSR_UPDATE_ERROR_INT | PSR_WAKE_ERROR_INT)
-
-#define DP_INTERRUPT_MASK4 \
-	(PSR_UPDATE_MASK | PSR_CAPTURE_MASK | PSR_EXIT_MASK | \
-	PSR_UPDATE_ERROR_MASK | PSR_WAKE_ERROR_MASK)
-
 #define DP_DEFAULT_AHB_OFFSET	0x0000
 #define DP_DEFAULT_AHB_SIZE	0x0200
 #define DP_DEFAULT_AUX_OFFSET	0x0200
@@ -77,66 +42,6 @@ void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_d
 				    msm_dp_catalog->p0_len, msm_dp_catalog->p0_base, "dp_p0");
 }
 
-u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog)
-{
-	u32 intr, intr_ack;
-
-	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS);
-	intr &= ~DP_INTERRUPT_STATUS1_MASK;
-	intr_ack = (intr & DP_INTERRUPT_STATUS1)
-			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS,
-		     intr_ack | DP_INTERRUPT_STATUS1_MASK);
-
-	return intr;
-
-}
-
-void msm_dp_catalog_ctrl_enable_irq(struct msm_dp_catalog *msm_dp_catalog,
-						bool enable)
-{
-	if (enable) {
-		msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS,
-				DP_INTERRUPT_STATUS1_MASK);
-		msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2,
-				DP_INTERRUPT_STATUS2_MASK);
-	} else {
-		msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS, 0x00);
-		msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2, 0x00);
-	}
-}
-
-u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_catalog)
-{
-	u32 intr, intr_ack;
-
-	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS4);
-	intr_ack = (intr & DP_INTERRUPT_STATUS4)
-			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS4, intr_ack);
-
-	return intr;
-}
-
-void msm_dp_catalog_ctrl_config_psr_interrupt(struct msm_dp_catalog *msm_dp_catalog)
-{
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
-}
-
-int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog)
-{
-	u32 intr, intr_ack;
-
-	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2);
-	intr &= ~DP_INTERRUPT_STATUS2_MASK;
-	intr_ack = (intr & DP_INTERRUPT_STATUS2)
-			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2,
-			intr_ack | DP_INTERRUPT_STATUS2_MASK);
-
-	return intr;
-}
-
 static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
 {
 	struct resource *res;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 5196188059f3ade2b6cc260ee65a7efb38844664..ddbae0fcf5fc428b2d37cd1eab1d5860a2f11a50 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -11,23 +11,6 @@
 #include "dp_utils.h"
 #include "disp/msm_disp_snapshot.h"
 
-/* interrupts */
-#define DP_INTR_HPD		BIT(0)
-#define DP_INTR_AUX_XFER_DONE	BIT(3)
-#define DP_INTR_WRONG_ADDR	BIT(6)
-#define DP_INTR_TIMEOUT		BIT(9)
-#define DP_INTR_NACK_DEFER	BIT(12)
-#define DP_INTR_WRONG_DATA_CNT	BIT(15)
-#define DP_INTR_I2C_NACK	BIT(18)
-#define DP_INTR_I2C_DEFER	BIT(21)
-#define DP_INTR_PLL_UNLOCKED	BIT(24)
-#define DP_INTR_AUX_ERROR	BIT(27)
-
-#define DP_INTR_READY_FOR_VIDEO		BIT(0)
-#define DP_INTR_IDLE_PATTERN_SENT	BIT(3)
-#define DP_INTR_FRAME_END		BIT(6)
-#define DP_INTR_CRC_UPDATED		BIT(9)
-
 #define DP_HW_VERSION_1_0	0x10000000
 #define DP_HW_VERSION_1_2	0x10020000
 
@@ -112,15 +95,6 @@ static inline void msm_dp_write_link(struct msm_dp_catalog *msm_dp_catalog,
 /* Debug module */
 void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_disp_state *disp_state);
 
-/* AUX APIs */
-u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog);
-
-/* DP Controller APIs */
-void msm_dp_catalog_ctrl_enable_irq(struct msm_dp_catalog *msm_dp_catalog, bool enable);
-int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_ctrl_config_psr_interrupt(struct msm_dp_catalog *msm_dp_catalog);
-u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_catalog);
-
 struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
 
 #endif /* _DP_CATALOG_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index a96d8e46d00740be6027f4551b93627889f782cc..60dbf7eab3fd184bc12035d267abb3758cce9f89 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -30,6 +30,38 @@
 #define PSR_OPERATION_COMPLETION_TIMEOUT_JIFFIES       (300 * HZ / 1000) /* 300 ms */
 #define WAIT_FOR_VIDEO_READY_TIMEOUT_JIFFIES (HZ / 2)
 
+#define DP_INTERRUPT_STATUS_ACK_SHIFT	1
+#define DP_INTERRUPT_STATUS_MASK_SHIFT	2
+
+#define DP_INTERRUPT_STATUS1 \
+	(DP_INTR_AUX_XFER_DONE| \
+	DP_INTR_WRONG_ADDR | DP_INTR_TIMEOUT | \
+	DP_INTR_NACK_DEFER | DP_INTR_WRONG_DATA_CNT | \
+	DP_INTR_I2C_NACK | DP_INTR_I2C_DEFER | \
+	DP_INTR_PLL_UNLOCKED | DP_INTR_AUX_ERROR)
+
+#define DP_INTERRUPT_STATUS1_ACK \
+	(DP_INTERRUPT_STATUS1 << DP_INTERRUPT_STATUS_ACK_SHIFT)
+#define DP_INTERRUPT_STATUS1_MASK \
+	(DP_INTERRUPT_STATUS1 << DP_INTERRUPT_STATUS_MASK_SHIFT)
+
+#define DP_INTERRUPT_STATUS2 \
+	(DP_INTR_READY_FOR_VIDEO | DP_INTR_IDLE_PATTERN_SENT | \
+	DP_INTR_FRAME_END | DP_INTR_CRC_UPDATED)
+
+#define DP_INTERRUPT_STATUS2_ACK \
+	(DP_INTERRUPT_STATUS2 << DP_INTERRUPT_STATUS_ACK_SHIFT)
+#define DP_INTERRUPT_STATUS2_MASK \
+	(DP_INTERRUPT_STATUS2 << DP_INTERRUPT_STATUS_MASK_SHIFT)
+
+#define DP_INTERRUPT_STATUS4 \
+	(PSR_UPDATE_INT | PSR_CAPTURE_INT | PSR_EXIT_INT | \
+	PSR_UPDATE_ERROR_INT | PSR_WAKE_ERROR_INT)
+
+#define DP_INTERRUPT_MASK4 \
+	(PSR_UPDATE_MASK | PSR_CAPTURE_MASK | PSR_EXIT_MASK | \
+	PSR_UPDATE_ERROR_MASK | PSR_WAKE_ERROR_MASK)
+
 #define DP_CTRL_INTR_READY_FOR_VIDEO     BIT(0)
 #define DP_CTRL_INTR_IDLE_PATTERN_SENT  BIT(3)
 
@@ -128,8 +160,10 @@ static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
-static void msm_dp_ctrl_reset(struct msm_dp_ctrl_private *ctrl)
+void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl)
 {
+	struct msm_dp_ctrl_private *ctrl =
+		container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 sw_reset;
 
@@ -148,6 +182,79 @@ static void msm_dp_ctrl_reset(struct msm_dp_ctrl_private *ctrl)
 	}
 }
 
+static u32 msm_dp_ctrl_get_aux_interrupt(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 intr, intr_ack;
+
+	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS);
+	intr &= ~DP_INTERRUPT_STATUS1_MASK;
+	intr_ack = (intr & DP_INTERRUPT_STATUS1)
+			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS,
+		     intr_ack | DP_INTERRUPT_STATUS1_MASK);
+
+	return intr;
+
+}
+
+static u32 msm_dp_ctrl_get_interrupt(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 intr, intr_ack;
+
+	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2);
+	intr &= ~DP_INTERRUPT_STATUS2_MASK;
+	intr_ack = (intr & DP_INTERRUPT_STATUS2)
+			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2,
+		     intr_ack | DP_INTERRUPT_STATUS2_MASK);
+
+	return intr;
+}
+
+void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	struct msm_dp_ctrl_private *ctrl =
+		container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS,
+			DP_INTERRUPT_STATUS1_MASK);
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2,
+			DP_INTERRUPT_STATUS2_MASK);
+}
+
+void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	struct msm_dp_ctrl_private *ctrl =
+		container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS, 0x00);
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2, 0x00);
+}
+
+static u32 msm_dp_ctrl_get_psr_interrupt(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 intr, intr_ack;
+
+	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS4);
+	intr_ack = (intr & DP_INTERRUPT_STATUS4)
+			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS4, intr_ack);
+
+	return intr;
+}
+
+static void msm_dp_ctrl_config_psr_interrupt(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
+}
+
 static void msm_dp_ctrl_psr_mainlink_enable(struct msm_dp_ctrl_private *ctrl)
 {
 	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
@@ -1635,23 +1742,6 @@ static int msm_dp_ctrl_enable_mainlink_clocks(struct msm_dp_ctrl_private *ctrl)
 	return ret;
 }
 
-void msm_dp_ctrl_reset_irq_ctrl(struct msm_dp_ctrl *msm_dp_ctrl, bool enable)
-{
-	struct msm_dp_ctrl_private *ctrl;
-
-	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
-
-	msm_dp_ctrl_reset(ctrl);
-
-	/*
-	 * all dp controller programmable registers will not
-	 * be reset to default value after DP_SW_RESET
-	 * therefore interrupt mask bits have to be updated
-	 * to enable/disable interrupts
-	 */
-	msm_dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
-}
-
 static void msm_dp_ctrl_enable_sdp(struct msm_dp_ctrl_private *ctrl)
 {
 	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
@@ -1704,7 +1794,7 @@ void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl)
 	cfg |= PSR1_SUPPORTED;
 	msm_dp_write_link(msm_dp_catalog, REG_PSR_CONFIG, cfg);
 
-	msm_dp_catalog_ctrl_config_psr_interrupt(msm_dp_catalog);
+	msm_dp_ctrl_config_psr_interrupt(ctrl);
 	msm_dp_ctrl_enable_sdp(ctrl);
 
 	cfg = DP_PSR_ENABLE;
@@ -1829,7 +1919,7 @@ static int msm_dp_ctrl_deinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
 
 	msm_dp_ctrl_mainlink_disable(ctrl);
 
-	msm_dp_ctrl_reset(ctrl);
+	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
 
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
@@ -2460,7 +2550,7 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_ctrl_mainlink_disable(ctrl);
 
-	msm_dp_ctrl_reset(ctrl);
+	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
 
 	if (ctrl->stream_clks_on) {
 		clk_disable_unprepare(ctrl->pixel_clk);
@@ -2487,7 +2577,7 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
 	if (ctrl->panel->psr_cap.version) {
-		isr = msm_dp_catalog_ctrl_read_psr_interrupt_status(ctrl->catalog);
+		isr = msm_dp_ctrl_get_psr_interrupt(ctrl);
 
 		if (isr)
 			complete(&ctrl->psr_op_comp);
@@ -2502,8 +2592,7 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
 			drm_dbg_dp(ctrl->drm_dev, "PSR frame capture done\n");
 	}
 
-	isr = msm_dp_catalog_ctrl_get_interrupt(ctrl->catalog);
-
+	isr = msm_dp_ctrl_get_interrupt(ctrl);
 
 	if (isr & DP_CTRL_INTR_READY_FOR_VIDEO) {
 		drm_dbg_dp(ctrl->drm_dev, "dp_video_ready\n");
@@ -2517,6 +2606,11 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
 		ret = IRQ_HANDLED;
 	}
 
+	/* DP aux isr */
+	isr = msm_dp_ctrl_get_aux_interrupt(ctrl);
+	if (isr)
+		ret |= msm_dp_aux_isr(ctrl->aux, isr);
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index b7abfedbf5749c25877a0b8ba3af3d8ed4b23d67..10a4b7cf0335a584b4db67baca882620d7bab74c 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -30,7 +30,7 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 			struct msm_dp_catalog *catalog,
 			struct phy *phy);
 
-void msm_dp_ctrl_reset_irq_ctrl(struct msm_dp_ctrl *msm_dp_ctrl, bool enable);
+void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_phy_init(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_phy_exit(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_irq_phy_exit(struct msm_dp_ctrl *msm_dp_ctrl);
@@ -41,4 +41,7 @@ void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl);
 
+void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
+
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 7266e459fc905da55a743afc16c0ebeea8755dc5..f0d357e69a6d2814a45e1cafad54673ba2f247a1 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -440,7 +440,8 @@ static void msm_dp_display_host_init(struct msm_dp_display_private *dp)
 		dp->phy_initialized);
 
 	msm_dp_ctrl_core_clk_enable(dp->ctrl);
-	msm_dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
+	msm_dp_ctrl_reset(dp->ctrl);
+	msm_dp_ctrl_enable_irq(dp->ctrl);
 	msm_dp_aux_init(dp->aux);
 	dp->core_initialized = true;
 }
@@ -451,7 +452,8 @@ static void msm_dp_display_host_deinit(struct msm_dp_display_private *dp)
 		dp->msm_dp_display.connector_type, dp->core_initialized,
 		dp->phy_initialized);
 
-	msm_dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
+	msm_dp_ctrl_reset(dp->ctrl);
+	msm_dp_ctrl_disable_irq(dp->ctrl);
 	msm_dp_aux_deinit(dp->aux);
 	msm_dp_ctrl_core_clk_disable(dp->ctrl);
 	dp->core_initialized = false;
@@ -1165,9 +1167,6 @@ static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 	/* DP controller isr */
 	ret |= msm_dp_ctrl_isr(dp->ctrl);
 
-	/* DP aux isr */
-	ret |= msm_dp_aux_isr(dp->aux);
-
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 3835c7f5cb984406f8fc52ea765ef2315e0d175b..d17e077ded73251624b5fb1bfbd8f213b4a86d65 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -21,8 +21,25 @@
 
 #define REG_DP_CLK_CTRL				(0x00000018)
 #define REG_DP_CLK_ACTIVE			(0x0000001C)
+
 #define REG_DP_INTR_STATUS			(0x00000020)
+#define DP_INTR_HPD		BIT(0)
+#define DP_INTR_AUX_XFER_DONE	BIT(3)
+#define DP_INTR_WRONG_ADDR	BIT(6)
+#define DP_INTR_TIMEOUT		BIT(9)
+#define DP_INTR_NACK_DEFER	BIT(12)
+#define DP_INTR_WRONG_DATA_CNT	BIT(15)
+#define DP_INTR_I2C_NACK	BIT(18)
+#define DP_INTR_I2C_DEFER	BIT(21)
+#define DP_INTR_PLL_UNLOCKED	BIT(24)
+#define DP_INTR_AUX_ERROR	BIT(27)
+
 #define REG_DP_INTR_STATUS2			(0x00000024)
+#define DP_INTR_READY_FOR_VIDEO		BIT(0)
+#define DP_INTR_IDLE_PATTERN_SENT	BIT(3)
+#define DP_INTR_FRAME_END		BIT(6)
+#define DP_INTR_CRC_UPDATED		BIT(9)
+
 #define REG_DP_INTR_STATUS3			(0x00000028)
 
 #define REG_DP_INTR_STATUS4			(0x0000002C)

-- 
2.39.5


