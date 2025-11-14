Return-Path: <linux-arm-msm+bounces-81857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B7462C5D18B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 13:25:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D283F4F0A02
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 12:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 599E031A7F8;
	Fri, 14 Nov 2025 12:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="KK8inn+c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD323164B0
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 12:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763122753; cv=none; b=gv2WjzGtPk6tX28QdR7qUG9HEBgtxwsAAUP7QbuH/eV8v7PyDUeQR2GK2jKrWAVy5thYlunc2gHiICYCKctVW76MJklXlyNo4j4HO3axaec0V7kNm4DiXeYymIaTQ75Nf1qZ0M09WHifBeBTpEPXHurk3iz6Cr9r4nh2KQgqivY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763122753; c=relaxed/simple;
	bh=OHRpJMagiKLaTMEhh9T2V0GoMorBCrqfEatgArmrqLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mlVxoKXiycCI9Lcqsc6QNMVttAgFG9xsQr1qlMDK7KppggylkdyX3ohsbiaz/xRW6G9TKQuPvHN+Wwn4DIKiDQCwKnhtRCqxZxb2QVijxcfGNZnyuol74gZjYqRS6RkJIWlALqIjbzI2Z+T+NC9AjYcnCvZhcfUrg+AWl06CjPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=KK8inn+c; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b713c7096f9so239504966b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 04:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1763122749; x=1763727549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJAU1WR1mzyYUMLxIXnsBVjAE6a2+g/KdU+qx5lmqJ4=;
        b=KK8inn+cBTDXDNbhI8i1xm2ddfsd3u8PJONVg8GnWZ0T4o8PsXxyshIjjpIVlPNpc1
         ajxjtQKNRhRy1+ovOHtvIPeG1uC2vN6lIv0NsYmzdbPgWw+PoWNBTqpMoRK8jaCULbrn
         LvUe2BXNqF72Q9olRqAMbdyV9OHCtVaJSMCUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763122749; x=1763727549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WJAU1WR1mzyYUMLxIXnsBVjAE6a2+g/KdU+qx5lmqJ4=;
        b=ZVdgOofXTipwEUAFjvvQQzJdJkoYWWT4LMU5+KlFMD6Glf9C6V10rvI1dUepRWf1S8
         0On3uHMEIynxH0SeTHqoBMc5SdkO2PgrpY3O77n2i0t99InK5Uicq9dnpAUE66xwRlTR
         dHBw1aK+8+2Zd0+rA+h6KbKJ8bgklp628HwZnmkXhUtRJ3AYxt3u+9SHQRcJW6JlNRWO
         4wdZKDJ0uwOUiyvIoTqGvA8abUIqtl091TZAxOEOJ22zlXcBovOBgeTnlCZhN5gtEYPv
         d7RKsO/xRH8+nwMicNuE96qT36QCxFVBcBd4ihh4571GVwP0gTGzHtJ/1oMJvgRHrZWt
         Tehg==
X-Forwarded-Encrypted: i=1; AJvYcCUSQ44UXQqRa9FlqOWxwKWxc8lX5ElFTndoRwMcRaJPn3K65OrkDq5+/AWTBQpwgqrHbZOy4n9p+Bp65Psu@vger.kernel.org
X-Gm-Message-State: AOJu0YyCKfRZJpBLJGim/DZL5CPUwnCdOUBg0i+dnqdpqTxVZSfxmtXF
	DwctX7XtwAkauJ4ry8Ha1wuCp3aoKih39SFX+Nlj90z5YwKITzL3tqOs9Yo4Rve3eGY=
X-Gm-Gg: ASbGncsLBUsEYIHnCKkfWDUPGoXuVrUFD/er+30c3XiTv25Q+nDZUzf93UkHljSCUvw
	q7kh3oKSnDyPoM2blHCi8T0lP112EhCzDOhJkDaqDl8byx5Xdx91gmjP9DGIbOTqv4Z7MkAQSpe
	Vt2OqOC5Yf9h8z1xHAZ6ludbTc4YbNbm7vdkZ6V04NKaUEdeVbRaq1KfxzqLJR1q/FXwVWhlIFe
	0e3ZpiJgmU6W8maQGhgcH2BAqehmuWblEgm9siyilQKyzeOE4WHev6lc9o7P+29dM257jibdh8x
	Z9pg5OLbZM5XeLeMDK+gNuq2436Yjs4MwM0hRr10LhW/Y9GCc1PpelJ7Fpbaw0stY02hS6hGvRF
	/lpmtZu/ToQZTZbztynEq70a03EkjA4Ov5v8FCEs7gU8+FDbopxI4486/QZ9uDSiINPJ8KfiCCM
	EeZ/vQncecphXOU23sUYh7AS/BMaGoQTQWv/oKReAqMnvuzWgrcShNS11UnXsADy9TELemrA==
X-Google-Smtp-Source: AGHT+IFwJoL1U/KjpDTc6Zxhp8ozUFTmTEzhEqtM8HTL6bjv53lGvy4oC0WSkiZ8azgAxX4XjtE4fA==
X-Received: by 2002:a17:906:fe41:b0:b73:2b08:ac85 with SMTP id a640c23a62f3a-b736780b8d2mr274231766b.19.1763122748989;
        Fri, 14 Nov 2025 04:19:08 -0800 (PST)
Received: from riccardo-work.fritz.box (host-82-52-164-74.retail.telecomitalia.it. [82.52.164.74])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fed6315sm375295666b.64.2025.11.14.04.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 04:19:08 -0800 (PST)
From: Riccardo Mereu <r.mereu.kernel@arduino.cc>
X-Google-Original-From: Riccardo Mereu <r.mereu@arduino.cc>
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
Subject: [PATCH v2 3/6] spi: spidev: add compatible for arduino spi mcu interface
Date: Fri, 14 Nov 2025 13:18:50 +0100
Message-ID: <20251114121853.16472-4-r.mereu@arduino.cc>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114121853.16472-1-r.mereu@arduino.cc>
References: <20251114121853.16472-1-r.mereu@arduino.cc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible entry in spidev describing in Arduino boards one of the
interfaces between microprocessor and  microcontroller.

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
2.51.2


