Return-Path: <linux-arm-msm+bounces-45385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 973EAA14BA1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 09:57:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CC7B164158
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 08:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57FE91FA830;
	Fri, 17 Jan 2025 08:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c8BdKlBi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDB01FA164
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737104216; cv=none; b=mmrjrwB4+Ln46mgBEZCP6epnWRx2FT8kvtsfKwFt8myjZzqv6KZtwZnOyCqnXfIDPMYe3KlQ96+5Umbm2iSlzx38gfCW8yVBsPUzprDbNzw86GIAo4H1fVvxpujl1RjfYCbwJbdlSkSI2GQYmnFxW58Mfgcr7Ql5yeQkZE+OhnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737104216; c=relaxed/simple;
	bh=yUgbFQQuZ/dYQd+NfAYr+IxvStiBlneQ0vTNgNQQAgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oOhLtGpmEfA4tLv4F+g8EnagQwh0zFXN00M5RbB+h2/JMm8u3OsAvWRpNseInhTVBZWj+HjRyURC/gM/HLnd2tWpW5AscVd7tajOrD39nTWnpnx4m1aWvZfszB37JbXxqaG+9E5UNaX6F8QYe6symzWCNh1oI7ECFcb4wrldyew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c8BdKlBi; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-303548a933aso16173341fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 00:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737104212; x=1737709012; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mk713zIqkuFnPb2k9vDHwIlJVqet2dF9Nf6XeVAyFFw=;
        b=c8BdKlBibjbei0EQhzQsXu2RpEYpuJUk26cjYqfQb/6YomqgdlVYB/FZ7cR7/P4+fB
         LAmU4TIPi4Vx4WEdwls0z4oSxuwjZfJQ+4eiPi4k3EgRV/tiruLmAyHRMkR1f3y8gkHa
         JsBHdRozhBV7rbZIs8IuweG5aDfZRtvWfFC2yS/13NHS1swqEq6qx6BFWoO6VDLHRIVi
         dOrtUAgHgrkxSec500RGxP3kBoz2+9XItZAl+n/zHE2sr3xpsh8XuhAqwn2BRja2NoPi
         Tot9GJhGtl3Jeqj1Lv/dj1fvmz8qqBwitxnpi9qXzAaidtQb23Qb8IypmWeghvyxU7bB
         HcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737104212; x=1737709012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mk713zIqkuFnPb2k9vDHwIlJVqet2dF9Nf6XeVAyFFw=;
        b=LSg1H+6qbJPe62746lW5niFn/An8banV2YblQAaR8amOMUAmZIDRV08yhb7HPR7mTW
         g8n0yd8UvAulD/Omu64YrkCpu8sWApgsL6ufCqdrzVmEUBlvk9Q614AyeAdgTevPXUZh
         pHycq+w1GrnJIOZqvmyA+VAlapn0XcmJC5HTWPQK4/6D3l5OMkjlhzICuhcZhUHDctO9
         VzsYKjFi3UM7FM5bw+F/4esUbWfCIoyreu7jKeN1+ypFZQNNM7HmTa7F85kHVnp5JivL
         Qm0yDmgw0+GuEnTRrm8La607qd+m+5v2fJHSza9ocUqFGPygSx/dpCppvXPueXBpWpPd
         M+Pg==
X-Forwarded-Encrypted: i=1; AJvYcCV/YAWyDddLHz5UfJpHuMjD9+sUA1auK0+WtsCzZlRJfwlfVvBgPA8xqiwHi6a9fvLOvqPyBzQq7fJoWJ7P@vger.kernel.org
X-Gm-Message-State: AOJu0YyqWUgjqo1r0c32CjwzNQ5aU69tRyXqplgQJFlc8WDk3INxfuTE
	ISJtQK29iwwsTrveiG5Z55rabomvHjWre/QpN2z2PXsTlVg0VB3JRp+YyZlJCXo=
X-Gm-Gg: ASbGncub+oGDsLygYw3SQA7r/u6ewNtg6oxtig3t/M5cpOOj4Ps2I9NnPLq26g4RyN/
	iBIpxikhFcJpi3wMeFZG1RaD9pwwi043OOrza7Q7t/mwx/AbgvJSGz+Yaog5SKfkVrJsSHmr2iK
	zZrrQmeMsHhjOl2SyT7fwu8ou8/J2lHO5886QQ0ijVJS4TJbCH2M1w9EC7dn2+fqUIZw18zl9EN
	TvH6Gak0pXkgJBG6O7EpQtOkz4reJsf42o4/uJWe9YjGrTdKtadGOlTK+7Xi6/E
X-Google-Smtp-Source: AGHT+IFw6b5DGgJ5C+ZHUaVQALsPcG8Up1fk0OgnuUDBhelIJKkatG+E4Tbc8ihkec4t12QXNikf+Q==
X-Received: by 2002:a2e:bc83:0:b0:304:9de0:7d9 with SMTP id 38308e7fff4ca-3072ca97e9bmr7789761fa.21.1737104212517;
        Fri, 17 Jan 2025 00:56:52 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a330764sm3402101fa.3.2025.01.17.00.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 00:56:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 17 Jan 2025 10:56:40 +0200
Subject: [PATCH RFC 5/7] drm/display: dp-cec: use new DCPD access helpers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-drm-rework-dpcd-access-v1-5-7fc020e04dbc@linaro.org>
References: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
In-Reply-To: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4995;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=yUgbFQQuZ/dYQd+NfAYr+IxvStiBlneQ0vTNgNQQAgE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnihtFhYjFkcZsgDXpnBmRDvRuEdMohtYHIi7RD
 A/OG5uaM+mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4obRQAKCRCLPIo+Aiko
 1SR7CACjrfksIHObG/st907FfUITqHNgfgPCITVGWryWXPcCQbtgUiOKySFRWEnlM72r0aDg/nD
 FXnZfoyTfQI9hXwnVa4uhva7QGKVCdgHRLhv8H94lHVq42uKGATAJ+zvHELkQ0qg4ljYUmV898X
 aGcuqAZNxgWt6Si/ZrL+E1XC+gzoh5RA1e9JDtnk8O37M/PJ3OrMoJ6Z5nZALOv6NfLbP0CdUNm
 MjTyrw8EFVfcxGrMpegm9mAUYrCK2arYhdHkbqVtDTfg0J7+bRNDYFAxO8Kv6xv8lDrZdhUNABc
 LPk1v6sh6U5eR5e7g481WY4KSsY1qCD4H5PFMBd2xUKfTzkV
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Switch drm_dp_cec.c to use new set of DPCD read / write helpers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_cec.c | 37 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_cec.c b/drivers/gpu/drm/display/drm_dp_cec.c
index 007ceb281d00da65f5b4957cb8be66c2ea25d4e4..237f9a6a8077c62ff562d8f2d04cab3f079ed367 100644
--- a/drivers/gpu/drm/display/drm_dp_cec.c
+++ b/drivers/gpu/drm/display/drm_dp_cec.c
@@ -96,7 +96,7 @@ static int drm_dp_cec_adap_enable(struct cec_adapter *adap, bool enable)
 	u32 val = enable ? DP_CEC_TUNNELING_ENABLE : 0;
 	ssize_t err = 0;
 
-	err = drm_dp_dpcd_writeb(aux, DP_CEC_TUNNELING_CONTROL, val);
+	err = drm_dp_dpcd_write_byte(aux, DP_CEC_TUNNELING_CONTROL, val);
 	return (enable && err < 0) ? err : 0;
 }
 
@@ -112,7 +112,7 @@ static int drm_dp_cec_adap_log_addr(struct cec_adapter *adap, u8 addr)
 		la_mask |= adap->log_addrs.log_addr_mask | (1 << addr);
 	mask[0] = la_mask & 0xff;
 	mask[1] = la_mask >> 8;
-	err = drm_dp_dpcd_write(aux, DP_CEC_LOGICAL_ADDRESS_MASK, mask, 2);
+	err = drm_dp_dpcd_write_data(aux, DP_CEC_LOGICAL_ADDRESS_MASK, mask, 2);
 	return (addr != CEC_LOG_ADDR_INVALID && err < 0) ? err : 0;
 }
 
@@ -123,15 +123,14 @@ static int drm_dp_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 	unsigned int retries = min(5, attempts - 1);
 	ssize_t err;
 
-	err = drm_dp_dpcd_write(aux, DP_CEC_TX_MESSAGE_BUFFER,
-				msg->msg, msg->len);
+	err = drm_dp_dpcd_write_data(aux, DP_CEC_TX_MESSAGE_BUFFER,
+				     msg->msg, msg->len);
 	if (err < 0)
 		return err;
 
-	err = drm_dp_dpcd_writeb(aux, DP_CEC_TX_MESSAGE_INFO,
-				 (msg->len - 1) | (retries << 4) |
-				 DP_CEC_TX_MESSAGE_SEND);
-	return err < 0 ? err : 0;
+	return drm_dp_dpcd_write_byte(aux, DP_CEC_TX_MESSAGE_INFO,
+				      (msg->len - 1) | (retries << 4) |
+				      DP_CEC_TX_MESSAGE_SEND);
 }
 
 static int drm_dp_cec_adap_monitor_all_enable(struct cec_adapter *adap,
@@ -144,13 +143,13 @@ static int drm_dp_cec_adap_monitor_all_enable(struct cec_adapter *adap,
 	if (!(adap->capabilities & CEC_CAP_MONITOR_ALL))
 		return 0;
 
-	err = drm_dp_dpcd_readb(aux, DP_CEC_TUNNELING_CONTROL, &val);
-	if (err >= 0) {
+	err = drm_dp_dpcd_read_byte(aux, DP_CEC_TUNNELING_CONTROL, &val);
+	if (!err) {
 		if (enable)
 			val |= DP_CEC_SNOOPING_ENABLE;
 		else
 			val &= ~DP_CEC_SNOOPING_ENABLE;
-		err = drm_dp_dpcd_writeb(aux, DP_CEC_TUNNELING_CONTROL, val);
+		err = drm_dp_dpcd_write_byte(aux, DP_CEC_TUNNELING_CONTROL, val);
 	}
 	return (enable && err < 0) ? err : 0;
 }
@@ -194,7 +193,7 @@ static int drm_dp_cec_received(struct drm_dp_aux *aux)
 	u8 rx_msg_info;
 	ssize_t err;
 
-	err = drm_dp_dpcd_readb(aux, DP_CEC_RX_MESSAGE_INFO, &rx_msg_info);
+	err = drm_dp_dpcd_read_byte(aux, DP_CEC_RX_MESSAGE_INFO, &rx_msg_info);
 	if (err < 0)
 		return err;
 
@@ -202,7 +201,7 @@ static int drm_dp_cec_received(struct drm_dp_aux *aux)
 		return 0;
 
 	msg.len = (rx_msg_info & DP_CEC_RX_MESSAGE_LEN_MASK) + 1;
-	err = drm_dp_dpcd_read(aux, DP_CEC_RX_MESSAGE_BUFFER, msg.msg, msg.len);
+	err = drm_dp_dpcd_read_data(aux, DP_CEC_RX_MESSAGE_BUFFER, msg.msg, msg.len);
 	if (err < 0)
 		return err;
 
@@ -215,7 +214,7 @@ static void drm_dp_cec_handle_irq(struct drm_dp_aux *aux)
 	struct cec_adapter *adap = aux->cec.adap;
 	u8 flags;
 
-	if (drm_dp_dpcd_readb(aux, DP_CEC_TUNNELING_IRQ_FLAGS, &flags) < 0)
+	if (drm_dp_dpcd_read_byte(aux, DP_CEC_TUNNELING_IRQ_FLAGS, &flags) < 0)
 		return;
 
 	if (flags & DP_CEC_RX_MESSAGE_INFO_VALID)
@@ -230,7 +229,7 @@ static void drm_dp_cec_handle_irq(struct drm_dp_aux *aux)
 		 (DP_CEC_TX_ADDRESS_NACK_ERROR | DP_CEC_TX_DATA_NACK_ERROR))
 		cec_transmit_attempt_done(adap, CEC_TX_STATUS_NACK |
 						CEC_TX_STATUS_MAX_RETRIES);
-	drm_dp_dpcd_writeb(aux, DP_CEC_TUNNELING_IRQ_FLAGS, flags);
+	drm_dp_dpcd_write_byte(aux, DP_CEC_TUNNELING_IRQ_FLAGS, flags);
 }
 
 /**
@@ -253,13 +252,13 @@ void drm_dp_cec_irq(struct drm_dp_aux *aux)
 	if (!aux->cec.adap)
 		goto unlock;
 
-	ret = drm_dp_dpcd_readb(aux, DP_DEVICE_SERVICE_IRQ_VECTOR_ESI1,
-				&cec_irq);
+	ret = drm_dp_dpcd_read_byte(aux, DP_DEVICE_SERVICE_IRQ_VECTOR_ESI1,
+				    &cec_irq);
 	if (ret < 0 || !(cec_irq & DP_CEC_IRQ))
 		goto unlock;
 
 	drm_dp_cec_handle_irq(aux);
-	drm_dp_dpcd_writeb(aux, DP_DEVICE_SERVICE_IRQ_VECTOR_ESI1, DP_CEC_IRQ);
+	drm_dp_dpcd_write_byte(aux, DP_DEVICE_SERVICE_IRQ_VECTOR_ESI1, DP_CEC_IRQ);
 unlock:
 	mutex_unlock(&aux->cec.lock);
 }
@@ -269,7 +268,7 @@ static bool drm_dp_cec_cap(struct drm_dp_aux *aux, u8 *cec_cap)
 {
 	u8 cap = 0;
 
-	if (drm_dp_dpcd_readb(aux, DP_CEC_TUNNELING_CAPABILITY, &cap) != 1 ||
+	if (drm_dp_dpcd_read_byte(aux, DP_CEC_TUNNELING_CAPABILITY, &cap) < 0 ||
 	    !(cap & DP_CEC_TUNNELING_CAPABLE))
 		return false;
 	if (cec_cap)

-- 
2.39.5


