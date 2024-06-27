Return-Path: <linux-arm-msm+bounces-24488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A8F91A9A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 16:47:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0685B2815E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 14:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660AB1993BE;
	Thu, 27 Jun 2024 14:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ls5TmfsP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4475019922A
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 14:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719499496; cv=none; b=Wf3tBlPpyjM3XQORiB465cgxoPky1xn8poCvVzBsks+YD5W9d6tfjWXWJavP7TjOnMayzb9OJygsf5jslZbfqeitusokC5dox96ynzf9Kybw2+TgPb3XTXKRpAdLA6vncCer9OIMl9fqtZIlvPXY8LpzKbspqezq+cs5Os9xM/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719499496; c=relaxed/simple;
	bh=xSZ7lFidtpEnEkJOArL4sKDzMjVi/htowUNCiLjTGvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZluyDfn+WaaCpCYGEivQd9wze6FYbywyfTudbH4hlFdv1FTjMk1aAnqEpbPi3bRtLafiMTMS3j6p7TcMPbUOyKTK7HQDOIY1wa4KJlTnjWwWs1hmliW38aH5lu4kbVTgqbt08It3Sneq7M10P1f6Y93XPizCZbN3FJ6861wNct0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ls5TmfsP; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52ce6c8db7bso6441456e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 07:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719499492; x=1720104292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2lmwD/upm2r8UYkXfaI7EIZwspGva2/PGMOFQo3oapE=;
        b=Ls5TmfsPJRY5xNIOkHkfvQZsXJzcJfp+qC6rB84hNFuQ85h8Ir43Ppl/H7uINC0fj7
         DVEIs640knLiTmo7VVeP+XRlXXjpdOn7GNEEbz8HPKOus0tn4fm/kvOyTFU+DFYZjyjE
         r+vInX5WkDry87KGHGvLI3yIsY0t2LNq+2ARDB+XIKElrN9R+fA0UYQglVXpreBsp3Z6
         vQEcitAxlykz/DKPWGrpWOyboGs2dMIW+a9LS2650VeZaKaDFnk/B1RyUzwH0l+YGB1r
         yLOrT7Wki7a57sykv2H5ShQV+eELQxVaGlWBfHRVOapWqU1n4oigGTHiAA5FTRRv7Z5B
         piKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719499492; x=1720104292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2lmwD/upm2r8UYkXfaI7EIZwspGva2/PGMOFQo3oapE=;
        b=Jn3SagluIrGUU1WDswkBiY1ztD2GmilfER3bDGntHkD6NL7hWHQfKSGXYfHffYRz16
         kGi0A1ZHcf/AHprbfvvWQdaZsBNqeCY1LARhCL6zq/LEZzDO2qa9g6Tk6+nQrBY9RjEO
         GF2hC4IwvCrJ9ma1LDNZkW9b/nm7eLsE93zpYpoBRNKxOtQi849UE1lQr2NqrVIVKbaL
         eRFVNQayEHYO0tb5Pqn/rYc3U1Ugh9TBOD0ZVL+jFimsl1SaY9Yqi/B3qQAWwIjeyZrr
         poUKTKi6SS4vUzddn9MKsB63D7npphsr5MK5TGxjn2oKFX3PItoUw4EAZmmVy/ZFss5/
         Cprg==
X-Gm-Message-State: AOJu0YwsgLhnb5EYBoyPCnm1MDf0FEJxMm08fvcsw9RJPdlLvGJjJ198
	MQ2CDAaC6QwFESlmjKeABG3CY0wx0FrKBdJPWBQTl+K4dwUSTF3ody3ytRbVv7Y=
X-Google-Smtp-Source: AGHT+IE6naV6JhZphLSxPOXdcBcUuAWCQ1idquccX4cpiEQXBoGOw1GpAPPIUWryj7x2zG7vu9DRiw==
X-Received: by 2002:a05:6512:3ba9:b0:52c:df4d:bb9e with SMTP id 2adb3069b0e04-52ce183b7e5mr12706369e87.41.1719499492561;
        Thu, 27 Jun 2024 07:44:52 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42564b7b7c1sm31254075e9.23.2024.06.27.07.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 07:44:51 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Thu, 27 Jun 2024 15:44:41 +0100
Subject: [PATCH v2 4/6] ASoC: codecs: wsa884x: parse port-mapping
 information
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-port-map-v2-4-6cc1c5608cdd@linaro.org>
References: <20240626-port-map-v2-0-6cc1c5608cdd@linaro.org>
In-Reply-To: <20240626-port-map-v2-0-6cc1c5608cdd@linaro.org>
To: Banajit Goswami <bgoswami@quicinc.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1391;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=xSZ7lFidtpEnEkJOArL4sKDzMjVi/htowUNCiLjTGvc=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmfXrYhmGIg6QeWI+KXemXDcPu97nis0ADSq17q
 gysZltLdZCJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZn162AAKCRB6of1ZxzRV
 Nw0nB/9EadJpWoeSOEoNlop26yu4AbCGYuefsbPNTzrR8Bg0XkE5Yrz+eY0orZU63u7a1ZZLnA3
 lS5AoL9uQgGyWrQod2WkC6jBhf/VB+6RTwV/b+6m23PwGEbbgfJ7VAiRJpRrDYnZUMXaDWZ5dqW
 Yd7Q6/ZvvuWW7PNi39ohLsKqaBA2gtlvA3TbYWA/RSjFjVBJ2frq0x6p0GKWMaMIJgpOEB9zAH6
 NMkw7fwgXgOZIVD1ggAeUzih3eOdxHq73dAPb9geEaOwLB9X/xSnMFNrrMo88GSHL6KPWVGWbmy
 BjP0zOb9sJvAz5MQT1iGr40ENCCIMPOxoHooQNrFfKRc2j1P
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

Add support to parse static master port map information from device tree.
This is required for correct port mapping between soundwire device and
master ports.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wsa884x.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index a9767ef0e39d..a6034547b4f3 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -1887,6 +1887,14 @@ static int wsa884x_probe(struct sdw_slave *pdev,
 	wsa884x->sconfig.direction = SDW_DATA_DIR_RX;
 	wsa884x->sconfig.type = SDW_STREAM_PDM;
 
+	/**
+	 * Port map index starts with 0, however the data port for this codec
+	 * are from index 1
+	 */
+	if (of_property_read_u32_array(dev->of_node, "qcom,port-mapping", &pdev->m_port_map[1],
+					WSA884X_MAX_SWR_PORTS))
+		dev_dbg(dev, "Static Port mapping not specified\n");
+
 	pdev->prop.sink_ports = GENMASK(WSA884X_MAX_SWR_PORTS, 0);
 	pdev->prop.simple_clk_stop_capable = true;
 	pdev->prop.sink_dpn_prop = wsa884x_sink_dpn_prop;

-- 
2.25.1


