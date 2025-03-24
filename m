Return-Path: <linux-arm-msm+bounces-52340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2823BA6DAA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 14:01:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE5E53ABD78
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 13:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36FDF25E466;
	Mon, 24 Mar 2025 13:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gkdr4tIY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6373825F79D
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 13:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742821271; cv=none; b=c/+6a1D4H5l/Qv0HtHoBxfb5HqGN6mM49m6qYJV64zQ+76ogrLaGJwo1yYfdJWYSRVGy6lsDOIzgr/N0QwBVpFa1OljfCoO2JQcnmw9IN0njxFPQSq6yrWCR2CgLVf1EPLbjLigY9zmF7eu+N79iGL3dDn9Jc2nBJcfBTky/EAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742821271; c=relaxed/simple;
	bh=5X1aPO2z0jUPOmAmxxbRnG88+AZ4I5yT718/OM1HQtE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qy+VqvH9D75SZacE+dFFcTzkHEtj8soroy10uKNWUoXArCYqHZ7JG/FDsFPU95p03EjuyifuNVngGLMqGUjIu7Dbyalw6RQjVaKQXSu3ZwcThs0dovZxyj1W4dqZbO9b5d0OLMpsnYjA3JZgzOaxP2qnW8tCOl7ripklvt3xob0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gkdr4tIY; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3913d45a148so3525292f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 06:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742821267; x=1743426067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPfdok1uXbCV3fbB68Oh0kuMKD9EmCqvBmSN9d5b64A=;
        b=gkdr4tIYNaYtGLfueYwe+BXm0YZMNQPuN9fulFxz+wES0nRz6YXp1ywzIspR5yEMsa
         Iord4zxa/YEocp0if5+ep5KiH9WTqTt4RGn1mYS7A9QThN47VuKnFHwXf1vLvOA/1ud8
         YP6LX3JOqqvj2zdSgLcIRD45bcHCMDllKoYeZVP723ai+YcSCHeCIZTkVKPYjUt7EL70
         aiF7HAm9aUSBgyJu1Fa0A5BuzV6hb+veZApFFMkH0MTve6UQjAY2MDYN7/0eDHxdFxI2
         /ErSK/LdRc9eIXtRtaRflLdVhqbv6iSQgSqNAXmVD4VYwwC2RmkeYym6rfHij9flVeuv
         S+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742821267; x=1743426067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QPfdok1uXbCV3fbB68Oh0kuMKD9EmCqvBmSN9d5b64A=;
        b=pxYEige1BiRDAMlNi+0S/u4fl9p312GSUol68oJBaa78WS6eyKWnlkknGzkX11ePSq
         RAfzMfM0W8suUwbuOGah58QnP1ebnzmcl2hDccI+MGhBNqcYYS/wsqJJPEXkLOpllHiD
         i/h+9LIgyPrMfKfPs/kTLCsozdMCSlt80LlTsOcT9pLBhE5sZd9CT/UGiC8qyzGav8LS
         r+/xXRgefnK47ysqDcqTmRzNWvsWk5TV+6jdpq5TPHCf8obzIEHBCdQ53QXNCAmUiXKc
         2qA4Y++pyL+pOTd1rdt2EcGBaE+pNzMHJ4Qvocmg32njg6t3LmEbv8Rc3zGRe4dYlFq0
         /F3w==
X-Forwarded-Encrypted: i=1; AJvYcCXBIilq6puRJ6Q7hwESQokxzq59bIA3AwTATILzDIYAwhAXJIt/xKTUlLzxjddjp9TCfL9Z1hPlLNCzzfdn@vger.kernel.org
X-Gm-Message-State: AOJu0YznucMsnfJ2GITwAMZAzXwBy/or1huF60AbobNRvSSbDyNLdcb6
	wk2DoqH6PmxE3t+7TIaakd1bzERInJ+p2Im3ZUjJiFIJ0bOXhpwNXjOP2aiHp20=
X-Gm-Gg: ASbGncuabkHSkXdlUVd7usZbNvVQd1HWhry3uYTmxIJDwIX6GaBOqplB8bmcBlY34fl
	UKM2V2nJYlzNWGXTzyM0GsOZIIoIGcplABVjsTC7hbIEboCpXzp6ElRGCnimCOPElfLyyx+e5iG
	DUe+k44x2ElvV3tmr/KKrana39fr/dpVmVIsM7aSls1jbVLh39s72nE/N8N2Lq6qcoDGqdbccdT
	mt7urhhyFvTrHk4uJQkAllKNW2c4JRPdqI+0W+4kTZl5OqcicMQQdOp51lOkMR1+XZ39uZtD9lT
	zhJvU676FDKyuHgYrEc9k5Esy3+kGY7zJOW0rpErW2GSv90VIFLWCxZg24kKCkIDoxa0sT0/NRG
	sDtRS
X-Google-Smtp-Source: AGHT+IH/LCQKWak9xUpo8rkhPabLxUJyhK8s6nWMq3T7RoU4G1wdnEPytthIr96D0+PMYfRTxPKOwQ==
X-Received: by 2002:a05:6000:178c:b0:391:47f2:8d90 with SMTP id ffacd0b85a97d-3997f9017e3mr10499945f8f.20.1742821264799;
        Mon, 24 Mar 2025 06:01:04 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdbd1c7sm122275975e9.40.2025.03.24.06.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 06:01:04 -0700 (PDT)
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
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Christopher Obbard <christopher.obbard@linaro.org>
Subject: [PATCH v4 2/6] mux: gpio: add optional regulator support
Date: Mon, 24 Mar 2025 13:00:53 +0000
Message-Id: <20250324130057.4855-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250324130057.4855-1-srinivas.kandagatla@linaro.org>
References: <20250324130057.4855-1-srinivas.kandagatla@linaro.org>
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
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 drivers/mux/gpio.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mux/gpio.c b/drivers/mux/gpio.c
index cc5f2c1861d4..d1607f287755 100644
--- a/drivers/mux/gpio.c
+++ b/drivers/mux/gpio.c
@@ -15,6 +15,7 @@
 #include <linux/mux/driver.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/regulator/consumer.h>
 
 struct mux_gpio {
 	struct gpio_descs *gpios;
@@ -82,6 +83,10 @@ static int mux_gpio_probe(struct platform_device *pdev)
 		mux_chip->mux->idle_state = idle_state;
 	}
 
+	ret = devm_regulator_get_enable_optional(dev, "mux");
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "Couldn't retrieve/enable gpio mux supply\n");
+
 	ret = devm_mux_chip_register(dev, mux_chip);
 	if (ret < 0)
 		return ret;
-- 
2.39.5


