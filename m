Return-Path: <linux-arm-msm+bounces-82704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE7FC7546B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 17:15:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EC59A4F4D90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 15:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C293436213F;
	Thu, 20 Nov 2025 15:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="cv+8akiH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2163612DA
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 15:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763654316; cv=none; b=QfBcu5ojI40t2jqvv68/sD3/ZwVnTJNLTiEMvr85eNZJY/FJTI16AnzoqNktR1HPXYrY6jIrrxUTSyVIfi+po4iezFf/EvIxnE9k5C+Qfys3jsAxxDOZsDsEPqQ6ate/iL5kbM4TilEVJjimez2crjCxcHDR+kjlZvf0j1TTBQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763654316; c=relaxed/simple;
	bh=R3ezBCRzRQUS4BeE6jmZ5QCQOQTIhylbgBZhJn+fX6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S9uZrUB7Whx3KNOaRVKvbngt1fiNTmPqizqAGzt0GrkNev6lwe5dxabqvzhP/4qHMcjC1LNr7uuqeMa/jyszwefRs+aab+1zofbaO3925TeSLx/SndNaeq6nw/F3oVeHwE/sevxyPf6ZczPLdEBcodja/3B5IrVXTFktltnoL0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=cv+8akiH; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so7826535e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 07:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1763654312; x=1764259112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTd7Idbdk4npKVSgBYGXfk0LzOnUFZoGMc8p2Nu6Ryc=;
        b=cv+8akiHN2hipqoDmENYInpHRlnhjZrraAxZ+tXIP/+7kSA+5Uy25pQe5iJQ9tXrIz
         IuI9hPMO+8fiQ8zMz9dsPYgjM4Oh0uVUPcSoQBuSHZM80FORbpXZDZUw0E8AS0TfTLXv
         YCU0OvpD07C62aXgvl7utCQzi+mhbnD+1cEfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763654312; x=1764259112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DTd7Idbdk4npKVSgBYGXfk0LzOnUFZoGMc8p2Nu6Ryc=;
        b=k7xIFof09Xzk82jlDOTE/2LniETgZAN7uCRuN03ofsD/T+RcW27kE0R8z1WrQ3iBlw
         GEJXqlKL64hCE0XIkhmuEk13WxT7oeEHvKT1sNzOpnGXWrWafXXSIcAoy4XjhUc9E9pu
         nHbtViRkGvNc6H908yWMT87HvY7lakf9Y2xo81Sgsri2nAdxMHWeqDxUrWLgnsr2JapN
         aIvHVZ81XLYatW1P3oVTUeQqHYOMAwf027mavpvEwlP3U/dI66BHvgzlEoxGLVJ9ixIg
         oTuxvBQEXLOpX63nkq3Qu026rQ17UcqNzEUh40rLi09/PHCCSYr0gy5mUbxLneQdDKSb
         mlmA==
X-Forwarded-Encrypted: i=1; AJvYcCUFV4UDw2G1TIQgMYxf4plMIecXP8zeUflqo2dSnIpNhAIaocXbKoIUyxMUs5ECM6eeC8dot9ktqKxLkWcY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4yOETTsdVMi8IZjk9z8gZBgK0aTlSizwpUowLtGtNrdgXvBWT
	U5bwiL4Aftrfu//Tp0qhn27sCcekUd+p6USLml4jJ/5s8F1z5s+qUMNnL+vvtFIUEJU=
X-Gm-Gg: ASbGnctjSJ3LB1/5xIG89auV9NBa8ciatCk+nr0dho6wKIEeA86L8njzOW3FqSqOFhg
	KMTLF49rkoqy4w8xLPtHSePwCKcQiZoS2Yv5JHzTSxfJVlKVQN+2tyUUNadxQNp/f46/xAo/+EK
	fv5bL/GVY1KChgHGiVE4CfJg53fhWZsWxJ5gbaNQ4MgAAAoR6OTwzUW6HgtwgQstJXUFz1njNB1
	YKArU35JWUm6JeB5Z1XSrDVdqtiwdipNaFiZ0HFZ06k9mjORc0VUA9HAAuSeALllMIRmzASBDI7
	IJ8SIrtQIkQ/i4ZnzwrCvnG5t07I7bffCqckZlxZkrAaVUWit96f34/bRrRX8hcom2sAY3hG9dG
	r/+a6n19cE3KiYfCpUwj7YEB1570cFfS9zRTsk0NyXsIHWuWHLwkJukSyJlXsg+4WA1RHny4waq
	/7fOedCz6VelLwtPIVY0dYWohAsZ5pKSJo3wCLwwrcGnD8
X-Google-Smtp-Source: AGHT+IHPeGJrluNu8UvW+XlaNkD/3Sw1ZhsNOOToBDPJJcYk9tK9Ezo29dhaHP880SuH7d4HpuU8dg==
X-Received: by 2002:a05:600c:19d3:b0:477:b0b8:4dd0 with SMTP id 5b1f17b1804b1-477b8a8f296mr40131415e9.17.1763654312313;
        Thu, 20 Nov 2025 07:58:32 -0800 (PST)
Received: from riccardo-work (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b82e8ea6sm55552185e9.8.2025.11.20.07.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 07:58:31 -0800 (PST)
From: Riccardo Mereu <r.mereu.kernel@arduino.cc>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org
Cc: linux@roeck-us.net,
	Jonathan.Cameron@huawei.com,
	wenswang@yeah.net,
	naresh.solanki@9elements.com,
	michal.simek@amd.com,
	nuno.sa@analog.com,
	chou.cosmo@gmail.com,
	grantpeltier93@gmail.com,
	eajames@linux.ibm.com,
	farouk.bouabid@cherry.de,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	m.facchin@arduino.cc,
	Riccardo Mereu <r.mereu@arduino.cc>
Subject: [PATCH v3 3/6] spi: spidev: add compatible for arduino spi mcu interface
Date: Thu, 20 Nov 2025 16:58:22 +0100
Message-ID: <20251120155825.121483-4-r.mereu.kernel@arduino.cc>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251120155825.121483-1-r.mereu.kernel@arduino.cc>
References: <20251120155825.121483-1-r.mereu.kernel@arduino.cc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Riccardo Mereu <r.mereu@arduino.cc>

Add compatible entry in spidev describing in Arduino UnoQ single-board
computer the interface between Qualcomm QRB2210 microprocessor and
STMicroelectronics STM32U585 microcontroller.
It is handled in user space by the arduino-router service.

Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
---
 drivers/spi/spidev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spidev.c b/drivers/spi/spidev.c
index 5300c942a2a4..9a0160f6dc3d 100644
--- a/drivers/spi/spidev.c
+++ b/drivers/spi/spidev.c
@@ -704,6 +704,7 @@ static const struct class spidev_class = {
  */
 static const struct spi_device_id spidev_spi_ids[] = {
 	{ .name = /* abb */ "spi-sensor" },
+	{ .name = /* arduino */ "unoq-mcu" },
 	{ .name = /* cisco */ "spi-petra" },
 	{ .name = /* dh */ "dhcom-board" },
 	{ .name = /* elgin */ "jg10309-01" },
@@ -737,6 +738,7 @@ static int spidev_of_check(struct device *dev)
 
 static const struct of_device_id spidev_dt_ids[] = {
 	{ .compatible = "abb,spi-sensor", .data = &spidev_of_check },
+	{ .compatible = "arduino,unoq-mcu", .data = &spidev_of_check },
 	{ .compatible = "cisco,spi-petra", .data = &spidev_of_check },
 	{ .compatible = "dh,dhcom-board", .data = &spidev_of_check },
 	{ .compatible = "elgin,jg10309-01", .data = &spidev_of_check },
-- 
2.52.0


