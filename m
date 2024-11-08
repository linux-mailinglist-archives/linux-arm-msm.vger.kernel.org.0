Return-Path: <linux-arm-msm+bounces-37309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 121DC9C132D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 01:25:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34C861C20D2E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 00:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C1010A1E;
	Fri,  8 Nov 2024 00:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LEXxfyUg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484391917C2
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Nov 2024 00:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731025339; cv=none; b=CKXuu3pBQsbn2ZD0Q0e6OrbQk7JLzpy7pgKSPQmVj1L0BXsBMFMY7CrXyKR+xLs8/xW5KqSzxQ8QOMF6rNvR9v+kmk3fitP8v6CWjSI48tkLMYE/4RRQfCo6eYSPYGGdRR6rD7mU155tCo2CJbuHUM0MqIrrw0NXSjNkdaxd9tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731025339; c=relaxed/simple;
	bh=8C6rPsQS4FU2y6sH3qMMieCj3tGAmPNo6Yihp1+d1r4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LfiWIk8Gx1GUDzD/OF9uuULH/yefmkf+kEwG+ePOw0zNo58d3Z3iKqfBy8GoPToY8r2ClPvtUNsG3XPdUllWauYz+r5n93jN2mrMgmnDHeq50OehF1MSe7+4bhG2jPf/7yy91l0lVotEtwkjGxkDbzURIjUqF10ZVUNtp1cR9BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LEXxfyUg; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb559b0b00so14028401fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2024 16:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731025335; x=1731630135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUDwK6ibQ9+n49VL4sBKZ5FqDWKxTTiqoVr/EHDQWzA=;
        b=LEXxfyUgGTmAVUeRec3tDlviDPfyOX+BLHKzBgR9aAaevS7ikB9fNlfz7sHXjJEPJ2
         1xDmbvDhE7KCqj4M7HMKShrB+XNpYHx0FMsfiKxG1M5uIi4nHE36t4qEHd14FJCCPVVR
         BGnxoxHfkH3IDetCIXDXyAFC0nzaDbM+W3pr7BYbWNzyOAVh1c9iim0lE/udJxMFEb6E
         1WTlPFzLGk2hkcHA6wunXDPZTL8bFxV2HQuzxZaZoETpvrPabZR4VgPm63ii4LlMiz+N
         sPoC3xju3mT/ABEKcPt9ISDlV9uZ+WwVHp25jqT0RNc4pv3Q7e61bA9B7oxPKoNbPZC9
         ueVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731025335; x=1731630135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AUDwK6ibQ9+n49VL4sBKZ5FqDWKxTTiqoVr/EHDQWzA=;
        b=VVg8MlgL4FNf0/saKbNKLR9/ufvAujTUFIxatHRezd81bxUuxraf4HP99FiLJ25qxf
         luL2M/V+EvAEHCqN0Z7yuv/Bj6JUkA08eaJ4Zm8qzvSAW5bBC624yyz8bPoM4mtAQzZ0
         moQhRKAPU2TPzhN5AMW983+Jm6sDfxQIGGWZnueH6UuqLhceewUugcxDwwSiESrytbuw
         xBD6HsgCxbr4bdxT7BbpBA5EhYHyUvlKWR/qxIF9OKbPwZtVHC5TI3BgExMpQOVWUb24
         4LfauOvYztvGf6JKeBjYOhaEssftvUeenHAsM1Gjxti8sREo6AdY+bHldFIqObWGtWoZ
         qWzg==
X-Forwarded-Encrypted: i=1; AJvYcCVXWTcFyWB3P3lSsGcp5MXtPGOmw2YP41AvNr2kakJ7D9w39xF3BIOxLTGXLHxKPyYsqSC5S1AmtmRtOPk9@vger.kernel.org
X-Gm-Message-State: AOJu0YydHsTGUH8jHWHBTZ2echw5aL+601KO91vg9FF5Q8Rbvy90Gozc
	bg685df8nv1QHpNi9sViWkZir6qZobGSEkRQeZ8MTCbS6rxLE5rPpZ9Yca+Z7nA=
X-Google-Smtp-Source: AGHT+IFRTff6XPH7VhhdmR8qBQnHX2myRRqWRiAXItjjCRJrBSKFg6r3YtqKwBwN2gIUZ9iTcHY9sg==
X-Received: by 2002:a05:651c:160a:b0:2fa:cc12:67de with SMTP id 38308e7fff4ca-2ff2024dc1emr4498851fa.32.1731025335327;
        Thu, 07 Nov 2024 16:22:15 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff17900a63sm4195191fa.47.2024.11.07.16.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 16:22:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 08 Nov 2024 02:21:45 +0200
Subject: [PATCH 14/14] drm/msm/dp: move interrupt handling to dp_ctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-fd-dp-audio-fixup-v1-14-40c8eeb60cf5@linaro.org>
References: <20241108-fd-dp-audio-fixup-v1-0-40c8eeb60cf5@linaro.org>
In-Reply-To: <20241108-fd-dp-audio-fixup-v1-0-40c8eeb60cf5@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=19325;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8C6rPsQS4FU2y6sH3qMMieCj3tGAmPNo6Yihp1+d1r4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnLVmQkYk6c0ZiUnTKgQof3u+G22gNfKqNIXAh4
 q6Ks/lARCOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy1ZkAAKCRCLPIo+Aiko
 1e8pCACnvh45sjNS6SbVO3WM9kU0Gl+R37QKXA6UPVYSvbyiSdJ+zSPn+3GBJtzz0LnpqGR7JeJ
 Tpd2JOM4vxHRZKdNV897wtIEBliZp/PrSLR/PXcqVoao1PcYZG6D/ocW4Q+oDC7JbhMzm7ETC96
 SSzyi9XkSIyL/2ORS/RH7j0XHz9Gt7Y37HcxJdaGThg16qyJ9X/P3o87PxftkS/ZqRvQ2ElJrFo
 53Bss+9DPeHsQ9D55MRHD79nBYuFRXgyckXA6ZolHh6Sl1QppTLzvnPvH6x1t/d9aAZJ+W5swYJ
 ihj6otkCCEfKZF69NLR926UdUtJwZYslIk626neYKgvhVvIR
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

It makes it easier to keep all interrupts-related code in dp_ctrl
submodule. Move all functions to dp_ctrl.c.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c     |   9 +--
 drivers/gpu/drm/msm/dp/dp_aux.h     |   2 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c |  95 ------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  24 ------
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 142 ++++++++++++++++++++++++++++++------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   5 +-
 drivers/gpu/drm/msm/dp/dp_display.c |   9 +--
 drivers/gpu/drm/msm/dp/dp_reg.h     |  17 +++++
 8 files changed, 145 insertions(+), 158 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 7228955019b31f80257b86a470c9ef305b2549a0..1ae0bf9e4f51a98a01bf9eb5c36323e1743b5ab4 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -439,9 +439,8 @@ static ssize_t msm_dp_aux_transfer(struct drm_dp_aux *msm_dp_aux,
 	return ret;
 }
 
-irqreturn_t msm_dp_aux_isr(struct drm_dp_aux *msm_dp_aux)
+irqreturn_t msm_dp_aux_isr(struct drm_dp_aux *msm_dp_aux, u32 isr)
 {
-	u32 isr;
 	struct msm_dp_aux_private *aux;
 
 	if (!msm_dp_aux) {
@@ -451,12 +450,6 @@ irqreturn_t msm_dp_aux_isr(struct drm_dp_aux *msm_dp_aux)
 
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
index 754b30e35039618453df9ce863c0d2561fce2fda..e7c421b50127c6ef3b5ddbb0e3554570d169e544 100644
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
@@ -73,21 +38,6 @@ void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_d
 	msm_disp_snapshot_add_block(disp_state, msm_dp_catalog->p0_len, msm_dp_catalog->p0_base, "dp_p0");
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
 /**
  * msm_dp_catalog_hw_revision() - retrieve DP hw revision
  *
@@ -101,51 +51,6 @@ u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog)
 	return msm_dp_read_ahb(msm_dp_catalog, REG_DP_HW_VERSION);
 }
 
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
index 830d9164188c0f7520809a99fa409b473bbfbfa4..c57792b134357933aa3c1f4d278f1c1a309688cf 100644
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
 
@@ -116,15 +99,8 @@ static inline void msm_dp_write_link(struct msm_dp_catalog *msm_dp_catalog,
 /* Debug module */
 void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_disp_state *disp_state);
 
-/* AUX APIs */
-u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog);
-
 /* DP Controller APIs */
 u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_ctrl_enable_irq(struct msm_dp_catalog *msm_dp_catalog, bool enable);
-int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_ctrl_config_psr_interrupt(struct msm_dp_catalog *msm_dp_catalog);
-u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_catalog);
 
 struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 5f32ee2fa0438cd12726540a59ab4849d47ee8c2..f978b599bf14c8fc418f0f2dfe40ca911f8957fe 100644
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
 
@@ -126,8 +158,10 @@ static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
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
 
@@ -141,6 +175,79 @@ static void msm_dp_ctrl_reset(struct msm_dp_ctrl_private *ctrl)
 	msm_dp_write_ahb(msm_dp_catalog, REG_DP_SW_RESET, sw_reset);
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
@@ -1630,23 +1737,6 @@ static int msm_dp_ctrl_enable_mainlink_clocks(struct msm_dp_ctrl_private *ctrl)
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
@@ -1699,7 +1789,7 @@ void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl)
 	cfg |= PSR1_SUPPORTED;
 	msm_dp_write_link(msm_dp_catalog, REG_PSR_CONFIG, cfg);
 
-	msm_dp_catalog_ctrl_config_psr_interrupt(msm_dp_catalog);
+	msm_dp_ctrl_config_psr_interrupt(ctrl);
 	msm_dp_ctrl_enable_sdp(ctrl);
 
 	cfg = DP_PSR_ENABLE;
@@ -1824,7 +1914,7 @@ static int msm_dp_ctrl_deinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
 
 	msm_dp_ctrl_mainlink_disable(ctrl);
 
-	msm_dp_ctrl_reset(ctrl);
+	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
 
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
@@ -2453,7 +2543,7 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_ctrl_mainlink_disable(ctrl);
 
-	msm_dp_ctrl_reset(ctrl);
+	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
 
 	if (ctrl->stream_clks_on) {
 		clk_disable_unprepare(ctrl->pixel_clk);
@@ -2480,7 +2570,7 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
 	if (ctrl->panel->psr_cap.version) {
-		isr = msm_dp_catalog_ctrl_read_psr_interrupt_status(ctrl->catalog);
+		isr = msm_dp_ctrl_get_psr_interrupt(ctrl);
 
 		if (isr)
 			complete(&ctrl->psr_op_comp);
@@ -2495,8 +2585,7 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
 			drm_dbg_dp(ctrl->drm_dev, "PSR frame capture done\n");
 	}
 
-	isr = msm_dp_catalog_ctrl_get_interrupt(ctrl->catalog);
-
+	isr = msm_dp_ctrl_get_interrupt(ctrl);
 
 	if (isr & DP_CTRL_INTR_READY_FOR_VIDEO) {
 		drm_dbg_dp(ctrl->drm_dev, "dp_video_ready\n");
@@ -2510,6 +2599,11 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
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
index 8f8fa0cb8af67383ecfce026ee8840f70b82e6da..af39dc5e52cbe93c5b4d082dbdcbff5c4890036f 100644
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


