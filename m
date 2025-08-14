Return-Path: <linux-arm-msm+bounces-69173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE06B260B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 11:23:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 688CC16D391
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67C82ECE86;
	Thu, 14 Aug 2025 09:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BrovZKSQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F722E9EDC
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755163104; cv=none; b=tSZ8KeVBXjurDaxe5auIDylQhF2/c54ew+O0UZz+vhGjStyOvWCaHgKkRkx6/vzqm3qkA4IPFg6umz0bMn/7e7fU6suVdjBicx8b7vlxjqoaU2e0g8KbahYMSY+S1RFfXzxNwBZxZ7HAsuP6n/NhuzbYXSCs720UmLnXmSNE2F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755163104; c=relaxed/simple;
	bh=rHzxROU5ryoJgm5jbG0atVnTjdbnBgsujevNDGx2vtg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O35Z/gooDxzCMb5ZwHPBoVe8lVvdymNBmmJ6RVEbJ05D9tag3+iNM/Y9xhZCoEsVXW3hdzEopV1BRMmtGXWxJ/RdEk0MtHwnnnU/0S2S2poH53De5dJiRy3Tjmr+mwEMrlyB+RdaqeUD5OQVNTbvRGyZZ9ZtQ4BYle0HkudEsg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BrovZKSQ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45a1abf5466so4527065e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 02:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755163101; x=1755767901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZAaDT/OUbXmcuIyI0UD5MRIk/4NCc8MDaMt6MhGlz8c=;
        b=BrovZKSQoQhBOJNpdeZ0C5NhoBHohUeTTbrnFA9zqb0OFCClTKi3UPzTjVa85cSJ1L
         SC1lQQN9wxBth5OQil2bfHMuiLC/0e7XrAu8o44xP8cf8T7YGPu1UO90TZawhpUQi8r8
         G4qoy8vzvC3RoYaAOcBqYFLocB8qhGnMfpMptoU5oVRjQcuLYfyL3EN1vujEvG9cXcOx
         oHwWIsRR0dFkKDa4P5BTzBSCJSAq1V+qyxPnoPaANQf17UkSpL8nJBM5FGHxLIknLytP
         VMnufRvAVLWkPJPHQh0FAH0NCtU8RwJl/S1pyxi9NpwY1icowcPHhJGc5n3oOHOGsxHO
         JilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163101; x=1755767901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZAaDT/OUbXmcuIyI0UD5MRIk/4NCc8MDaMt6MhGlz8c=;
        b=LNbdLzzSZFvYK/+bpXs/DYB44LRbfIj/+6oD1n5Cpz1MbPhxjl+PMtHhJWReV4wKBw
         WaHq4T0fBthS/Kvwssn3OHivb3+hCpvQzuVBfgPM2jVHPXnWlodxTk99WanaZPzPryt2
         zLBJGR+WtMpu3TZSiBspt8twzCsGvGk3dcMXk7KzoooGOyvSipmgAy90uYJqRmnhOpU7
         QHApGpWddGKYZBfj0nz11qdbyXRdv5Rq89ycTzuOtHTn8FgYXc4vkH0bpMPszfzu/yzQ
         IJ03V2GMJht2eQI2GFWfIcJcF0FNF/suWKxHYJS9pejuAs2GzODu/8Su22x3t7Z5P3u7
         OENQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqDsiG0O7LXUpDgwvOp6T6ja9fZPSwwuaJapliqwCpaUFXtDKmGIOL/YJaIJPNGgP2J1qmfZX0FlVT2Sw/@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt33DvWNKnB0GX1XqwNIo5fE2BZRSJ4UDWBnrjV5mVLl8hs4os
	8Q8QAr9qV1VjWFcf2LaPnni5X53+H4A8eMmJYaV598W+agY5J00K4S1oRjqsOeT71lw=
X-Gm-Gg: ASbGnct7hVm4BLPcHM6APZ2+Xum0gCL05wTZRB2IERxNFTSra84T+/LJ6dNMv84xlzM
	VtiTDU6dFgwDy+3d0Xs/lT8dC3jZ4Ear4KxMZfZxPRWPI9KJQ1SBOI9/ZAHMz9NbWsSku4HZ5gJ
	cHtC8z1gruhUyYrdjSFp+yHhf8gCBZANyTKLdYXZ2YfVrwzYYJfD2MNxIOv8ThdY24wUjNT5Cy4
	JvSizdSFXecPoYMPj2b4myH3/3AlKgsn6jb4RgZkuD0VGtdXmEDCemBZKsQaLm2eZ6DA6IMMKl8
	pn5NMm4WTLRK4Cq6aM0OGhsX6ezFX+1RwlZDV55uzo2dRgXbDSOTfIHkhodVkIdBpXINQ25OVLQ
	XjXjgqWQNKaH+Ce+Ya3FXzp51/M12w9X+ByNq
X-Google-Smtp-Source: AGHT+IEja8CLfTSNlKR5f4WfpXSN4rOwyS5Xo1KeZ5Yr/TOyUiNzdSQo50qDF7mxVImYpzfwRhB+ZA==
X-Received: by 2002:a05:600c:3503:b0:456:ed3:a488 with SMTP id 5b1f17b1804b1-45a1b78645emr16883635e9.1.1755163098783;
        Thu, 14 Aug 2025 02:18:18 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:ea13:2485:4711:708])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c74876csm13861925e9.14.2025.08.14.02.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 02:18:18 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Thu, 14 Aug 2025 11:18:06 +0200
Subject: [PATCH 1/2] driver core: platform: Add option to skip/delay
 applying clock defaults
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-platform-delay-clk-defaults-v1-1-4aae5b33512f@linaro.org>
References: <20250814-platform-delay-clk-defaults-v1-0-4aae5b33512f@linaro.org>
In-Reply-To: <20250814-platform-delay-clk-defaults-v1-0-4aae5b33512f@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Michael Walle <mwalle@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

Currently, the platform driver core always calls of_clk_set_defaults()
before calling the driver probe() function. This will apply any
"assigned-clock-parents" and "assigned-clock-rates" specified in the device
tree. However, in some situations, these defaults cannot be safely applied
before the driver has performed some early initialization. Otherwise, the
clock operations might fail or the device could malfunction.

Add a "driver_managed_clk_defaults" option to the platform_driver struct,
similar to the existing "driver_managed_dma" option. If this option is set,
applying the clock defaults is skipped in the platform driver core and the
driver must do this itself when ready.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/base/platform.c         | 8 +++++---
 include/linux/platform_device.h | 6 ++++++
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 09450349cf32364bcb3c8dd94023406442ec204d..c7278ace71d3f6d473fdea35bf79bcf80a56ee21 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -1392,9 +1392,11 @@ static int platform_probe(struct device *_dev)
 	if (unlikely(drv->probe == platform_probe_fail))
 		return -ENXIO;
 
-	ret = of_clk_set_defaults(_dev->of_node, false);
-	if (ret < 0)
-		return ret;
+	if (!drv->driver_managed_clk_defaults) {
+		ret = of_clk_set_defaults(_dev->of_node, false);
+		if (ret < 0)
+			return ret;
+	}
 
 	ret = dev_pm_domain_attach(_dev, PD_FLAG_ATTACH_POWER_ON |
 					 PD_FLAG_DETACH_POWER_OFF);
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 074754c23d330c9a099e20eecfeb6cbd5025e04f..fa561dae2f106b61d868a870e10d9656542b1c7e 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -250,6 +250,12 @@ struct platform_driver {
 	 * to setup and manage their own I/O address space.
 	 */
 	bool driver_managed_dma;
+	/*
+	 * Skip calling of_clk_set_defaults() before calling the probe function.
+	 * Use this if the driver needs to perform some initialization before
+	 * clock defaults (parent, rates) are applied.
+	 */
+	bool driver_managed_clk_defaults;
 };
 
 #define to_platform_driver(drv)	(container_of((drv), struct platform_driver, \

-- 
2.50.1


