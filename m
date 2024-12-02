Return-Path: <linux-arm-msm+bounces-39831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 631EA9DFE5A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 11:10:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C8EDB2415D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 10:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2BE202F8F;
	Mon,  2 Dec 2024 10:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dNbeieHi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FADE201264
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 10:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733134034; cv=none; b=L3+4fZHsaqZTK7ZbearDwinmh9T7CysKSuqw5H6Aa95mS6NQWm7/45mI9P/JDRtbX6gmNqfrBJZUOspxXCV8fcX4ARWjl60FmBqOb7+ZWHTFEewuMA8jzqhrvegtd7B63knVwHOPy+IRdSP8kxlBQjbWDSWZ7aNZyUqvaSGG7Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733134034; c=relaxed/simple;
	bh=8C6rPsQS4FU2y6sH3qMMieCj3tGAmPNo6Yihp1+d1r4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vu9blG31WCqaTJQ6E6r6tX+VcMl2aBtqHnPs13Y6JzWAPRh3bDeETFSNaLU13kKW/ItDVQNHwkyCoVHNAmeYyrbVGbziWxFrR9xRvXim1980puxKQfERdiY78Mosxhe/d/4kRO5oiUz3Qx+k6pOB4UBZS09edZWoOKWONbSWFno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dNbeieHi; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53dd9e853ccso3922783e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 02:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733134029; x=1733738829; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUDwK6ibQ9+n49VL4sBKZ5FqDWKxTTiqoVr/EHDQWzA=;
        b=dNbeieHiglSfWP62KDAVEj8z/36Dp5Vj7KjlSGLuLtJcLXDaJOCceHsQ5mxKRajT8D
         m7TqDo0TnM2gtZaNKbYckmNSFLp+oh+oMlcoC/zjwYZyoB8nLpBGyl1mny7OPAmR4AZX
         Rd3R9ij41eymHOF64fNdJmOWB/SbD+uaEFSickgi+0afeY7DvxccwQTSC4ACco/pEW0y
         kara+1BYVQu5KzAfGSJ7CFwWLI2CviHPmwT3Ccz4bTJs9pUynq5YIKSk86GU9ZiJOsmL
         N9jDNk+Cs9VAkxdS8Ag15CKVM3t9W1u0IzNb/0tH5hmLQjF2gEwq+VIJnqgUTrLdnqtA
         xtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733134029; x=1733738829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AUDwK6ibQ9+n49VL4sBKZ5FqDWKxTTiqoVr/EHDQWzA=;
        b=rIV4Yye5NOzXJ7tvpeDZDeSI9W9hz6L9uqFZt26wCM18VG9rLaF5kgM3e5Qee42tbB
         KQafV9HL7KTGJ2AnV20nNTEZO7sBctD+MD4h9/tclLqid96jvVmOJhBbrG1UEV7Ll/oc
         UQY0oC3Ba1IlRurbnEgsNyUDl9AXEiDriC3TGfMh0jjcmdyneIkiXhpmnRWB6VNYwdHz
         BZIUz7lc3MErdgxgRqVVLKhswkGqPCzcT6PAyrii6aVMKGh0e+nRKhlU3olTGzVIL+XE
         Ai5535OSzh6gkdOXZ8HGi7x8aJ1y+NiP2xJSvQwT6OhVnfLjzn3BM3Sqxik7d0c+z9ta
         1WJw==
X-Forwarded-Encrypted: i=1; AJvYcCVwKpUZBxeYKhYEQXGLTUaZUUD03Aukgpe7CPQzMh8f+fwly+77vjRyvo0sK7i6tu7FCYuft1e5SQEvL97o@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ1wS6y/5zaWA0TYcQ6QyxJEPRFffLa3JSi11L1OFo4ZOj7Hxy
	gso/M52hAuQBK16WXZhssIMsz/yHSq53H/cuZ7mClsC2x7x7ozbmWOEnAiZCP6I=
X-Gm-Gg: ASbGnctKBQB7KTmy9OltODX+2L6JOkU2q+fi3YGmE+5UiPEuBkJHDLo8BFwqrXzM5SS
	/ss7/8I1FxgQSWzDaTXXvoF3F/ghkDNqQU8WiP0c8QorOWQJn7dM97/QOork7eG9CAjjAcUM22/
	Vtf1dwb+dwF2uE6BFDenVokkAFJHByVF92n5NRstj9IEOH7B1AnSUZn9QftH2y0bekrRZ2FKlx3
	Q9p274x3dyH+Eoe55gwwRk6G46lJbjdaUQKKjx/GVDDaHXpJKJcZ82ZFQ==
X-Google-Smtp-Source: AGHT+IEWfTLeU2++Km9krI7o6JmgvYik6Meu8GOITeGf9R0CXRHpHXiGnIlCAkQMl7S7JTwrW4qPgQ==
X-Received: by 2002:a05:6512:b9c:b0:53d:ed62:e653 with SMTP id 2adb3069b0e04-53df00d102bmr11011656e87.15.1733134029276;
        Mon, 02 Dec 2024 02:07:09 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646f191sm1418314e87.136.2024.12.02.02.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 02:07:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 02 Dec 2024 12:06:44 +0200
Subject: [PATCH v2 14/14] drm/msm/dp: move interrupt handling to dp_ctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-fd-dp-audio-fixup-v2-14-d9187ea96dad@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=19325;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8C6rPsQS4FU2y6sH3qMMieCj3tGAmPNo6Yihp1+d1r4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnTYaufXeEzbytTF7FP9HWrccUsYJ3h+ygh6x4e
 JWrqWU6fQWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ02GrgAKCRCLPIo+Aiko
 1VoBB/4mC5+Rfd+Rx3G3k+JouZYC9BK3tVvG08RqRtRbMnuHjWB0GC85M7l1IP9kqWFlcZvRQUh
 1gd90f1iyZ0qmTrd8IPzQUcRHZNP22CsQbgfWbK0sjUWfSC7bkFPiTiTDAnP36asiR5dwJabVPF
 P3QYDM7SvKlGLhANYKEy7YTsbrrNJIoJcuT8UOQkGmBuP8zRy1K6kCCV7ph9N9/c5FVN9JHKwo+
 xwCt1HeGaEVQSqlpcVRZthKI7MUIdRsMU6hlXSktdRZdp6FjYwr8ZKRBg4zAJx2PzCZefg4Tbmm
 LvxlOEc2znpGoadjxOIOxQlyMrjhqeGkDnp573lp/qr1A/t7
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


