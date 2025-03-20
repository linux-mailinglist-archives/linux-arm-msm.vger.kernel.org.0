Return-Path: <linux-arm-msm+bounces-52082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0886A6A59B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 12:59:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6D2016E44E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 11:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33355221DAC;
	Thu, 20 Mar 2025 11:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Eb+dSReu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAA92206A2
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 11:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742471808; cv=none; b=qtFbWNfxiFWbYqHy5u6pL+sjFQp7IE0P62c1e8CBZSVRWAi662vp29F3lR0gEPPi6Q3E18dviXS0+i/9AmL08THBwKu1X5ZT8NTLOUDIktNDcyksXxOeJHxQ/TN4IIGsfsJWT2Txozyv2PrDKNinG8Kv7PeVBchLFJI50SeNVbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742471808; c=relaxed/simple;
	bh=T2PbRRhtQTGvQFtJCRLISmS81biLegmtD1AJKN9+90s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jj7o+q6PbHflYpWGGVTzptMpBXxQwz4BA+DPntyxeX5qL2twsFb1DyS48YrQ7eFrRv59hkD+bjMlk1J5jl4CLdZuE5EpM8+D1yOKzlRRB4Ds9FSBRasazqhdj7b2zCY/oL+IsUus4HqZFjvSiAqQR/WZPLpmqZ5GY0qWCp7W6xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Eb+dSReu; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so4433605e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 04:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742471803; x=1743076603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1gFShGL18VkNSl91DJ8JTM4WvU0/x0n8rRRT7Ut7zA=;
        b=Eb+dSReumpURahzlftk61pXmRcqqigcVMFIXqURuGaAMljy13eWSVgJd34XpPUAbXq
         /WVE3M3NhGKKG6NTfU8IIaIXGQrvhbMMF6ZNfJ9tiRW8XKNJ5DFZfXY2Y+zUn3VH9vH1
         k1TldGFpU+6MFOYaCSGrhlxuflL+fDqd/n+//tuEleUcbezdmbXSQE34BdbI6s2GvwYQ
         kU/P3CzJgO9k24vxRbfQ2wwQkfyBLAJI8ZAJFpp5wtCo0Hmt43e6fOeXUfIkJDiaqGKa
         WglRhe1+da1jAlCqdp28elRa6/negAcCS+g1dm7Q7ZW13oZZ+YZJvsA0TlKnwVCwnDN0
         ZMGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742471803; x=1743076603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1gFShGL18VkNSl91DJ8JTM4WvU0/x0n8rRRT7Ut7zA=;
        b=j93RYnei1RNmKgjD84KD6MhY88I7UP+cgBhRV7lLi+8A7rv7le4uvC1rdunve1zY+2
         vzeXqjE0Wod8e3EnDz9bQ6lfBtzZLSKaN88CV5EXhjlCiDGQMkiHwFw/8YGBX0hiak+/
         Q4i5qN4D2oDTBxrNnZacCz4/qRPhqIXWfcD0TGf5yCLo7adfdom0EwXXEP+s46zeufEq
         LjK3J8q/kxrBPJQFuOtqH7KjViU4sVG9Q6SkXA0PaSiz6j5apIY74Nvf6mAUHCTlX0ZT
         HIxPEn356STzcAKFI4qRKxuIywyGsTa9QcGD/C2f/clx6Sy6zOxzCtzv5nePsTz1pK9l
         lFgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgRxOxHpj6cyRrjwiPGyxHN68JS2EIyVkXZBarVlQmft9q6qJPwQMXm0weDj6aN7kbSDuJR1QjOdjldt9P@vger.kernel.org
X-Gm-Message-State: AOJu0YxkYAnw3gIqe3anQ9cipDVi6YbDp4adTDjkowSWax9LAVcHUrrv
	ovJxQyLrl/YvWy0QKj5TV+QpUxFJKJ5tVrLuSinoJBwp7kQ6xGEZ43/4sHA4TEg=
X-Gm-Gg: ASbGncv8QCj1229Npd3gCIADCembs9WBy084kXRrCiij0P4yjug+F/Fp2LaC7HzOPTZ
	OST+I6ZkPw6kkwZAHcCiQFedXNEmQsJntmB9uO4xApHFut5cRq7N8GZ3fXL8FP4z1LwgdGo1ibJ
	MbgZeG857CI7RW9kzeja6MUb5UrZ8mtszOyV1h80uWt0PkyOy/4gADHfefgIFr84AnBcQ6OOqtH
	Pko721LvVekZHuITeisE8tuyHlamwCxuiukto4MLJIF5mD/WepWmySmOEPin9m5ormB7AD8Ty3a
	6aIC3xIf58FR66LYT+UauN2gIlFEiiyR/YYZr56cr00lc4XXzM2GKFvhA13g9+cECF6eDA==
X-Google-Smtp-Source: AGHT+IHDaRKUgc9HfZ/3hd0DCQIlmWkm3pZZLNqhOMPZvKa4KfAsekDz2fiYCxQmIc+NA2HX8qs4VQ==
X-Received: by 2002:a05:600c:468f:b0:43c:e7ae:4bcf with SMTP id 5b1f17b1804b1-43d436c753fmr63116995e9.0.1742471803125;
        Thu, 20 Mar 2025 04:56:43 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c888117csm23257857f8f.44.2025.03.20.04.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 04:56:42 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: peda@axentia.se,
	broonie@kernel.org,
	andersson@kernel.org,
	krzk+dt@kernel.org
Cc: ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com,
	zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com,
	lgirdwood@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 2/5] mux: gpio: add optional regulator support
Date: Thu, 20 Mar 2025 11:56:30 +0000
Message-Id: <20250320115633.4248-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
References: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Some of the external muxes needs powering up using a regulator.
This is the case with Lenovo T14s laptop which has a external audio mux
to handle US/EURO headsets.

Add support to the driver to handle this optional regulator.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/mux/gpio.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mux/gpio.c b/drivers/mux/gpio.c
index cc5f2c1861d4..12cd9b5c32fb 100644
--- a/drivers/mux/gpio.c
+++ b/drivers/mux/gpio.c
@@ -15,6 +15,7 @@
 #include <linux/mux/driver.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/regulator/consumer.h>
 
 struct mux_gpio {
 	struct gpio_descs *gpios;
@@ -82,6 +83,13 @@ static int mux_gpio_probe(struct platform_device *pdev)
 		mux_chip->mux->idle_state = idle_state;
 	}
 
+	ret = devm_regulator_get_enable_optional(dev, "mux");
+	if (ret && ret != -ENODEV) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Couldn't retrieve/enable gpio mux supply\n");
+		return ret;
+	}
+
 	ret = devm_mux_chip_register(dev, mux_chip);
 	if (ret < 0)
 		return ret;
-- 
2.39.5


