Return-Path: <linux-arm-msm+bounces-41598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 852869EDC10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 00:43:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A2F5188A31B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 23:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C82E1FCCE3;
	Wed, 11 Dec 2024 23:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QBCxvSIf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D65A1FA8F2
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 23:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733960528; cv=none; b=ltEjaKIiK7xfpCqXU9sol83GCtXVCzj0Nha6LpttKOEAP1O5fO1e6ciPngaLPNXD9OSufEoyZqzhU0BNUKqeqv8MM5RfAoJgA7wbxxuM9Dz6fIGpoe10IVYQsa/nYkiIIM+z7G5DfX4AV3cMCTijWk/cJGFAYHeoycxOUVdLlDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733960528; c=relaxed/simple;
	bh=k4Ag+N+v+qQe+tVkfAyp+TXYjMNTkzLEouAtxeL1xtc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CnwOmJlNdXKiXC94zp43OT0PhDN1ikgRY8PmSWRMWYPO5p0a8nqEI1fI8hfPUqhNw6PDw8teMUT6K7enVaGOGxFcIk8+TEABdCaO8fCGkCqvFz8pNaY1oEvOusb4zH2J1M8WlEvXqjrgRvE4pzGpcgaKoIbTRDUHuZqVN1+4pRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QBCxvSIf; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5401c52000fso1592e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 15:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733960523; x=1734565323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yj4NGfWVGU0wZJ70TOhsr1JPVlUCpABTaMmdrCKaXSc=;
        b=QBCxvSIfg4F7LwQD4LF/e+Rpp2OU/iQsDxDcBi1KtsGmGWoHD+9Nn7NjrNR2ryNgm7
         OehKUd8MRXBkqxVEswjkRvOPm02IoUmV0r0l5c90n2Zwjs13uj0J7NahohrRH8+uSaGI
         rYQDI8PWNypyvzwffDQryxbJf0ODcNZN9uhjAMi3zpEbKdZcjUCRA5jutdy/0uLS1qpE
         E5nCFougUak/JpUSoaJvRqOvZLG9cYRLo2dBKhvbGBmqHWnqVlwGCZUiuQqfRTSX/J7+
         dNLWO+KSMDOV38S/Kxnp6JhhaE3V0BJ0kTf8WEY5oLh2aNwPMbtc8/7txS4qB4O0UunL
         BDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733960523; x=1734565323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yj4NGfWVGU0wZJ70TOhsr1JPVlUCpABTaMmdrCKaXSc=;
        b=B5RL1SmX6zrs7zZgmfO4tHIlQ6kCQLYI0w397MSs/sRRHWh+z01+JJdaAllIm5zP+S
         9Pkz5FXsqZxcNY01SmiCocnU26ywCe4uGYjC6Q6G6/P+lOLOwD8+PhTo9guwv7vzXV8B
         1nz0i9O8KX9N0+ib9wOh+6clAZTjeNWo9rQMR5xHCtUb7Hzi5QJb+igtmZeKe6tpIRxD
         EtO0CUj/ZUZoa9GrYPXh2+PumY4x/cVD4xmNvxa2jVLKRyw5ZI1o7sTN8MFrASwdMfn0
         GE6sQpmxJvvvVouaxU1J1a9bwrc4BgO6Ji0OvuLqEdJbgkQ8uFVnKnvdD/GRTM1gFxP/
         BZ4A==
X-Forwarded-Encrypted: i=1; AJvYcCWjYy0VfK2ZGVKz4E7JitnvK995oRUYTGZw0imDEJ1kk+OpQJz16BV/HI5Fu+0C6bJw3B9zFukqUf4f1UGD@vger.kernel.org
X-Gm-Message-State: AOJu0YzNFbE57Gim0nFwm2c7fBz6v5SLitn5Py18bMQIDG/UN+Wjjz2A
	Zh8NMnPCnbNSKbmf7VrHWIA13dX/4mPZN67C8IahiLaatpykLJ0IPxR0BKlUL9c=
X-Gm-Gg: ASbGnctGWlzTOwMLk+Zw1jMUSy6WIQlBq+BlkyrCYOt5BzoZuIchz2su36/NIUud1k1
	k438spIabplvLDcEP4F0BP01YumLBhfQ2wC0a0bAWWFv9g83qOepUqHgtnEplHvOiQ7KGehgL+a
	t5wNmiyDZ7Pw8TJr3dl5EQkYnU2cCJbW7mW1o7NaMqoe8K6tBMKhsiGKyBKNHKSJrgTI6DO0zr3
	gPeyDSaQQrwiXAQ/Y8+drIAlzGyCvLYQk29UvJjKQownsgKDMITAEtkxna7x2tF
X-Google-Smtp-Source: AGHT+IGx6WDSSu7wpDtz1LViPzw/wC/wODp89HI9FGeEHrB34eoSF30lM5kxKlB1OUoe23lTXle3eg==
X-Received: by 2002:a05:6512:68b:b0:53e:3740:4a92 with SMTP id 2adb3069b0e04-5402a6059e8mr1563642e87.42.1733960523367;
        Wed, 11 Dec 2024 15:42:03 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401cc76909sm1222207e87.58.2024.12.11.15.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 15:42:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 12 Dec 2024 01:41:41 +0200
Subject: [PATCH v3 06/14] drm/msm/dp: move/inline AUX register functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-fd-dp-audio-fixup-v3-6-0b1c65e7dba3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11728;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=k4Ag+N+v+qQe+tVkfAyp+TXYjMNTkzLEouAtxeL1xtc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3qUsoX83PmbtXUYRR3ay1S+HZrG/m2tzJGKmmVcbNdl1
 qSEH5zfyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJuE1m/19+srahqvYnxyf5
 6Ms/TP6GbmQ+7vExMbfyq16s00q+9dWiPYrC/ZcVBYKPP3JOmX3jEXuvvufe7pxTFxpli8SOais
 YZpbmXvxidmqy9GYTkaMiGU0Wxm1dAlMbXubx3co/0WAXWj/nmuc63TJ7p9JrXjXynaLtP5+tnn
 DM2vCdWMvXV8eSDygd+fN/rp04+/vOhfJ5GSbrg7wfFQk7vPicO+37t8dF5U6+T8VkhbP9n/GIn
 D1+dfdvkcWWFmejE4p2lTnP3rqrvPdMRN4zwaKEwvN7TC9MbF4YcH9Go6bKtlPTeabKrj8xd1ek
 aprNlKsvFFXPCYd6JMY3rBHxmDGpO0dsnkSytqJw2u1pAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Move all register-level functions to dp_aux.c, inlining one line
wrappers during this process.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c     | 96 +++++++++++++++++++++++++++++++------
 drivers/gpu/drm/msm/dp/dp_catalog.c | 96 -------------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  9 ----
 3 files changed, 82 insertions(+), 119 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index bc8d46abfc619d669dce339477d58fb0c464a3ea..cdcab948ae7086964d9e913dadadacc333f46231 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/delay.h>
+#include <linux/iopoll.h>
 #include <linux/phy/phy.h>
 #include <drm/drm_print.h>
 
@@ -45,6 +46,71 @@ struct msm_dp_aux_private {
 	struct drm_dp_aux msm_dp_aux;
 };
 
+static void msm_dp_aux_clear_hw_interrupts(struct msm_dp_aux_private *aux)
+{
+	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
+
+	msm_dp_read_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_STATUS);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x1f);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x9f);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0);
+}
+
+/*
+ * NOTE: resetting AUX controller will also clear any pending HPD related interrupts
+ */
+static void msm_dp_aux_reset(struct msm_dp_aux_private *aux)
+{
+	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
+	u32 aux_ctrl;
+
+	aux_ctrl = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_CTRL);
+
+	aux_ctrl |= DP_AUX_CTRL_RESET;
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
+	usleep_range(1000, 1100); /* h/w recommended delay */
+
+	aux_ctrl &= ~DP_AUX_CTRL_RESET;
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
+}
+
+static void msm_dp_aux_enable(struct msm_dp_aux_private *aux)
+{
+	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
+	u32 aux_ctrl;
+
+	aux_ctrl = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_CTRL);
+
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_TIMEOUT_COUNT, 0xffff);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_LIMITS, 0xffff);
+
+	aux_ctrl |= DP_AUX_CTRL_ENABLE;
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
+}
+
+static void msm_dp_aux_disable(struct msm_dp_aux_private *aux)
+{
+	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
+	u32 aux_ctrl;
+
+	aux_ctrl = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_CTRL);
+	aux_ctrl &= ~DP_AUX_CTRL_ENABLE;
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
+}
+
+static int msm_dp_aux_wait_for_hpd_connect_state(struct msm_dp_aux_private *aux,
+					     unsigned long wait_us)
+{
+	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
+	u32 state;
+
+	/* poll for hpd connected status every 2ms and timeout after wait_us */
+	return readl_poll_timeout(msm_dp_catalog->aux_base +
+				  REG_DP_DP_HPD_INT_STATUS,
+				  state, state & DP_DP_HPD_STATE_STATUS_CONNECTED,
+				  min(wait_us, 2000), wait_us);
+}
+
 #define MAX_AUX_RETRIES			5
 
 static ssize_t msm_dp_aux_write(struct msm_dp_aux_private *aux,
@@ -88,11 +154,11 @@ static ssize_t msm_dp_aux_write(struct msm_dp_aux_private *aux,
 		/* index = 0, write */
 		if (i == 0)
 			reg |= DP_AUX_DATA_INDEX_WRITE;
-		msm_dp_catalog_aux_write_data(aux->catalog, reg);
+		msm_dp_write_aux(aux->catalog, REG_DP_AUX_DATA, reg);
 	}
 
-	msm_dp_catalog_aux_clear_trans(aux->catalog, false);
-	msm_dp_catalog_aux_clear_hw_interrupts(aux->catalog);
+	msm_dp_write_aux(aux->catalog, REG_DP_AUX_TRANS_CTRL, 0);
+	msm_dp_aux_clear_hw_interrupts(aux);
 
 	reg = 0; /* Transaction number == 1 */
 	if (!aux->native) { /* i2c */
@@ -106,7 +172,7 @@ static ssize_t msm_dp_aux_write(struct msm_dp_aux_private *aux,
 	}
 
 	reg |= DP_AUX_TRANS_CTRL_GO;
-	msm_dp_catalog_aux_write_trans(aux->catalog, reg);
+	msm_dp_write_aux(aux->catalog, REG_DP_AUX_TRANS_CTRL, reg);
 
 	return len;
 }
@@ -139,20 +205,22 @@ static ssize_t msm_dp_aux_cmd_fifo_rx(struct msm_dp_aux_private *aux,
 	u32 i, actual_i;
 	u32 len = msg->size;
 
-	msm_dp_catalog_aux_clear_trans(aux->catalog, true);
+	data = msm_dp_read_aux(aux->catalog, REG_DP_AUX_TRANS_CTRL);
+	data &= ~DP_AUX_TRANS_CTRL_GO;
+	msm_dp_write_aux(aux->catalog, REG_DP_AUX_TRANS_CTRL, data);
 
 	data = DP_AUX_DATA_INDEX_WRITE; /* INDEX_WRITE */
 	data |= DP_AUX_DATA_READ;  /* read */
 
-	msm_dp_catalog_aux_write_data(aux->catalog, data);
+	msm_dp_write_aux(aux->catalog, REG_DP_AUX_DATA, data);
 
 	dp = msg->buffer;
 
 	/* discard first byte */
-	data = msm_dp_catalog_aux_read_data(aux->catalog);
+	data = msm_dp_read_aux(aux->catalog, REG_DP_AUX_DATA);
 
 	for (i = 0; i < len; i++) {
-		data = msm_dp_catalog_aux_read_data(aux->catalog);
+		data = msm_dp_read_aux(aux->catalog, REG_DP_AUX_DATA);
 		*dp++ = (u8)((data >> DP_AUX_DATA_OFFSET) & 0xff);
 
 		actual_i = (data >> DP_AUX_DATA_INDEX_OFFSET) & 0xFF;
@@ -336,7 +404,7 @@ static ssize_t msm_dp_aux_transfer(struct drm_dp_aux *msm_dp_aux,
 		}
 		/* reset aux if link is in connected state */
 		if (msm_dp_catalog_link_is_connected(aux->catalog))
-			msm_dp_catalog_aux_reset(aux->catalog);
+			msm_dp_aux_reset(aux);
 	} else {
 		aux->retry_cnt = 0;
 		switch (aux->aux_error_num) {
@@ -403,7 +471,7 @@ irqreturn_t msm_dp_aux_isr(struct drm_dp_aux *msm_dp_aux)
 
 	if (isr & DP_INTR_AUX_ERROR) {
 		aux->aux_error_num = DP_AUX_ERR_PHY;
-		msm_dp_catalog_aux_clear_hw_interrupts(aux->catalog);
+		msm_dp_aux_clear_hw_interrupts(aux);
 	} else if (isr & DP_INTR_NACK_DEFER) {
 		aux->aux_error_num = DP_AUX_ERR_NACK_DEFER;
 	} else if (isr & DP_INTR_WRONG_ADDR) {
@@ -444,7 +512,7 @@ void msm_dp_aux_reconfig(struct drm_dp_aux *msm_dp_aux)
 	aux = container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
 
 	phy_calibrate(aux->phy);
-	msm_dp_catalog_aux_reset(aux->catalog);
+	msm_dp_aux_reset(aux);
 }
 
 void msm_dp_aux_init(struct drm_dp_aux *msm_dp_aux)
@@ -460,7 +528,7 @@ void msm_dp_aux_init(struct drm_dp_aux *msm_dp_aux)
 
 	mutex_lock(&aux->mutex);
 
-	msm_dp_catalog_aux_enable(aux->catalog, true);
+	msm_dp_aux_enable(aux);
 	aux->retry_cnt = 0;
 	aux->initted = true;
 
@@ -476,7 +544,7 @@ void msm_dp_aux_deinit(struct drm_dp_aux *msm_dp_aux)
 	mutex_lock(&aux->mutex);
 
 	aux->initted = false;
-	msm_dp_catalog_aux_enable(aux->catalog, false);
+	msm_dp_aux_disable(aux);
 
 	mutex_unlock(&aux->mutex);
 }
@@ -517,7 +585,7 @@ static int msm_dp_wait_hpd_asserted(struct drm_dp_aux *msm_dp_aux,
 	if (ret)
 		return ret;
 
-	ret = msm_dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog, wait_us);
+	ret = msm_dp_aux_wait_for_hpd_connect_state(aux, wait_us);
 	pm_runtime_put_sync(aux->dev);
 
 	return ret;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index a4ac132d807ea469709de68bc0b65ef41dcdae86..d4ceef78d8c8036dd2d9275a1bb60f47d90c02bb 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -82,102 +82,6 @@ void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_d
 				    msm_dp_catalog->p0_len, msm_dp_catalog->p0_base, "dp_p0");
 }
 
-/* aux related catalog functions */
-u32 msm_dp_catalog_aux_read_data(struct msm_dp_catalog *msm_dp_catalog)
-{
-	return msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_DATA);
-}
-
-int msm_dp_catalog_aux_write_data(struct msm_dp_catalog *msm_dp_catalog, u32 data)
-{
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_DATA, data);
-	return 0;
-}
-
-int msm_dp_catalog_aux_write_trans(struct msm_dp_catalog *msm_dp_catalog, u32 data)
-{
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_TRANS_CTRL, data);
-	return 0;
-}
-
-int msm_dp_catalog_aux_clear_trans(struct msm_dp_catalog *msm_dp_catalog, bool read)
-{
-	u32 data;
-
-	if (read) {
-		data = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_TRANS_CTRL);
-		data &= ~DP_AUX_TRANS_CTRL_GO;
-		msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_TRANS_CTRL, data);
-	} else {
-		msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_TRANS_CTRL, 0);
-	}
-	return 0;
-}
-
-int msm_dp_catalog_aux_clear_hw_interrupts(struct msm_dp_catalog *msm_dp_catalog)
-{
-	msm_dp_read_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_STATUS);
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x1f);
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x9f);
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0);
-	return 0;
-}
-
-/**
- * msm_dp_catalog_aux_reset() - reset AUX controller
- *
- * @msm_dp_catalog: DP catalog structure
- *
- * return: void
- *
- * This function reset AUX controller
- *
- * NOTE: reset AUX controller will also clear any pending HPD related interrupts
- * 
- */
-void msm_dp_catalog_aux_reset(struct msm_dp_catalog *msm_dp_catalog)
-{
-	u32 aux_ctrl;
-
-	aux_ctrl = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_CTRL);
-
-	aux_ctrl |= DP_AUX_CTRL_RESET;
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
-	usleep_range(1000, 1100); /* h/w recommended delay */
-
-	aux_ctrl &= ~DP_AUX_CTRL_RESET;
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
-}
-
-void msm_dp_catalog_aux_enable(struct msm_dp_catalog *msm_dp_catalog, bool enable)
-{
-	u32 aux_ctrl;
-
-	aux_ctrl = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_CTRL);
-
-	if (enable) {
-		msm_dp_write_aux(msm_dp_catalog, REG_DP_TIMEOUT_COUNT, 0xffff);
-		msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_LIMITS, 0xffff);
-		aux_ctrl |= DP_AUX_CTRL_ENABLE;
-	} else {
-		aux_ctrl &= ~DP_AUX_CTRL_ENABLE;
-	}
-
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
-}
-
-int msm_dp_catalog_aux_wait_for_hpd_connect_state(struct msm_dp_catalog *msm_dp_catalog,
-					      unsigned long wait_us)
-{
-	u32 state;
-
-	/* poll for hpd connected status every 2ms and timeout after wait_us */
-	return readl_poll_timeout(msm_dp_catalog->aux_base +
-				REG_DP_DP_HPD_INT_STATUS,
-				state, state & DP_DP_HPD_STATE_STATUS_CONNECTED,
-				min(wait_us, 2000), wait_us);
-}
-
 u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog)
 {
 	u32 intr, intr_ack;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 0505b4be61f4e316f03df1d52ea35eb17e66580f..03e545124bd06d927da35801c1463c0082c3a0b6 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -129,15 +129,6 @@ static inline void msm_dp_write_link(struct msm_dp_catalog *msm_dp_catalog,
 void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_disp_state *disp_state);
 
 /* AUX APIs */
-u32 msm_dp_catalog_aux_read_data(struct msm_dp_catalog *msm_dp_catalog);
-int msm_dp_catalog_aux_write_data(struct msm_dp_catalog *msm_dp_catalog, u32 data);
-int msm_dp_catalog_aux_write_trans(struct msm_dp_catalog *msm_dp_catalog, u32 data);
-int msm_dp_catalog_aux_clear_trans(struct msm_dp_catalog *msm_dp_catalog, bool read);
-int msm_dp_catalog_aux_clear_hw_interrupts(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_aux_reset(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_aux_enable(struct msm_dp_catalog *msm_dp_catalog, bool enable);
-int msm_dp_catalog_aux_wait_for_hpd_connect_state(struct msm_dp_catalog *msm_dp_catalog,
-					      unsigned long wait_us);
 u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog);
 
 /* DP Controller APIs */

-- 
2.39.5


