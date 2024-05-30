Return-Path: <linux-arm-msm+bounces-21171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4CF8D5616
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 01:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46E4F288172
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 23:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40151186286;
	Thu, 30 May 2024 23:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xRdvSvFs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E95186283
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 23:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717110782; cv=none; b=KFFPRbQPI8mI+bKzWfdDatlNSCbr+siPMRUctOML8XpUCg6MNWELAstl4uvDyK6RHhONTh1D+w34fuOG4L8EtOGuj++zqCAFkfgFST9G9sdy9aL7r3acynwUsq9eZ8CYPr4nQLJl2hcd/akWZRu/C19Ley8N+0GrcJvWzMSIhOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717110782; c=relaxed/simple;
	bh=4lQZmh/WvHEEtNKJULb6yxMuO5RvAavVpXvzoItg+EA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bAVFK0KjQIEAjH5DDPcXgxHUdeqfIM8AQEXxgj/u1uGz7Oj/+YCCRHLi5ep0MWNB4Iec6i66VK+pzim+4EwVdH8ZQMLBuaSi1Q7KUtzccmXJZ9oiLjrGCCksk+Zxjjg4XXYEMR75NXgurSpCuPtoWyOVPGM42Mwz1enEK/LtWKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xRdvSvFs; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52b894021cbso62441e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 16:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717110778; x=1717715578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9MDjCsFEZ1HcOeGBvBo6CqtfbFIZh3loCrt4ShZMr9A=;
        b=xRdvSvFsr1nIilt6sb9Fb18P65j3+6NdU5xcfguGZ1AmKxggaDaSGB35d/urMJLbM4
         VNN15I1YclFKU/5ov2NrppvaFMvQZxouyWdVdmGfUnsdGFnBw6FyjVpUZjE0g4rzXNID
         Q9VWRZ6l+UJMsEdfuNqdqOWtm3c3UcpCXQtGYvrv3/6X1+NdfOr7qmMUbL0wEV9XyUVW
         MVgyO/CTxpA3quxwMn3gA4Xa48cuBKVG+vL1YB2hEV8D63jVSUdLldQtFmJ4PZXOho0O
         hNBV/+R6f/17/zF21Nw9pqw/gCnKKpmBw80TqwIvEEdwDWmggI3Dg6u5HEoIRvaBI2eG
         jwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717110778; x=1717715578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9MDjCsFEZ1HcOeGBvBo6CqtfbFIZh3loCrt4ShZMr9A=;
        b=uKBg9JRF8UTXdpxmXgoWOCnnXXsdcijcy39Qf2g756WLYT1Sa13frePXStZXMOak3z
         aRXS6O4SNZiV/oMpSibaRPp+r9ZL+Q2f7K4yUyRXxju9cdUt65elQXDqMa5vDkkCjbAr
         4LVKLKSMc5VRD9gSIBE7GwcSru4YrmrzhzZqh2mNlzGsurHU13F2oLwbu1mI0EQjt3Lr
         E6JGOVktR84kLkk3VrEYEeWfuv8w5iJN2ItEZMBWlC9eZ+MSgxXVPriqsmd8bzkeOiuv
         Jq5yPXwwwHYRz7BVWXTlh2tTwt6nAlB0VW4z/pGfcjw0eP1/Z2jZ3fEjqBrCWGnPm+TW
         thFg==
X-Forwarded-Encrypted: i=1; AJvYcCXpqvLdPJGMba3SoqHtwhcvuxDmZH1iFDwAY7PAV/cRy1C98giuY+XhPdgZLJMskkmJdzHuSHutr5r+xQr02Dum6MVuiBywGyjbhGMHBw==
X-Gm-Message-State: AOJu0YxCEp+qfs/7e1D8yAHhtDyCWjwPqR4Qivs4gzXmlNV9Wv57ddip
	UWBHICMSveOHYGNJmeIctXGjRtHucPAbK/j8XSiyAR4iJiAxqhbRKA3iPm2Dcv4=
X-Google-Smtp-Source: AGHT+IHCDHK4srNC/bDT9MhZqbsXJoODdHwGipAby7uMsyyVOOryiOsA8heWPcUKRMYQXg7XBalJbg==
X-Received: by 2002:a05:6512:39c5:b0:516:cc2d:f6a1 with SMTP id 2adb3069b0e04-52b896dc4f6mr55540e87.51.1717110777989;
        Thu, 30 May 2024 16:12:57 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d75d96sm119005e87.120.2024.05.30.16.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 16:12:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 May 2024 02:12:55 +0300
Subject: [PATCH v3 1/3] drm/panel-edp: add fat warning against adding new
 panel compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-edp-panel-drop-v3-1-4c98b2b95e3a@linaro.org>
References: <20240531-edp-panel-drop-v3-0-4c98b2b95e3a@linaro.org>
In-Reply-To: <20240531-edp-panel-drop-v3-0-4c98b2b95e3a@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=4lQZmh/WvHEEtNKJULb6yxMuO5RvAavVpXvzoItg+EA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmWQf4M0YInguykUXTyMqVJtog/s/TjQywd/DDP
 akfvNNiTlSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlkH+AAKCRCLPIo+Aiko
 1XozCACoI/M4YGZsyLd+SYKu+kRIbTJFiN7yHHoXU5cPCqg2X/+3kZgtkcWXK818KF48F17uK7/
 Z60m/kj7JmLjRJQz4g38OKf6BBSasiPJLvQ89Fywc5eN0eXlnvkMsMJWOHSZvmzRZb9iJS/wM44
 Os2BWDA88429zTZaZTNroO7icIk7Mt60YK6cg5vuiQaw0IJdRiAy7h7RT5wL3jbm7mSqHmhtXB1
 G/el0ZqZ4DJmLPH9+5uNXUi0vMSYIopCpwu3VXievEE1ynyAh9agsecAjuzgFwQTtKwT5dDqzBN
 qB84Xt/VVYqp9cQ6NLyDUwMH6bUW8bsnRv9DeNKy4V6qExLx
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add a fat warning against adding new panel compatibles to the panel-edp
driver. All new users of the eDP panels are supposed to use the generic
"edp-panel" compatible device on the AUX bus. The remaining compatibles
are either used by the existing DT or were used previously and are
retained for backwards compatibility.

Suggested-by: Doug Anderson <dianders@chromium.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 6db277efcbb7..ce2ea204a41e 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1776,7 +1776,24 @@ static const struct of_device_id platform_of_match[] = {
 	{
 		/* Must be first */
 		.compatible = "edp-panel",
-	}, {
+	},
+	/*
+	 * Do not add panels to the list below unless they cannot be handled by
+	 * the generic edp-panel compatible.
+	 *
+	 * The only two valid reasons are:
+	 * - Because of the panel issues (e.g. broken EDID or broken
+	 *   identification).
+	 * - Because the eDP drivers didn't wire up the AUX bus properly.
+	 *   NOTE that, though this is a marginally valid reason,
+	 *   some justification needs to be made for why the platform can't
+	 *   wire up the AUX bus properly.
+	 *
+	 * In all other cases the platform should use the aux-bus and declare
+	 * the panel using the 'edp-panel' compatible as a device on the AUX
+	 * bus.
+	 */
+	{
 		.compatible = "auo,b101ean01",
 		.data = &auo_b101ean01,
 	}, {

-- 
2.39.2


