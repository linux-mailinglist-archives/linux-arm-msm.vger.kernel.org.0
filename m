Return-Path: <linux-arm-msm+bounces-80628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7D3C3C0E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 16:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 47D914E1169
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 15:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DDC229BDA2;
	Thu,  6 Nov 2025 15:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="AWRega6l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CC82877D2
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 15:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762443089; cv=none; b=rx77BRsBhcKOTESTu7RIgw37bBvQMaGi23tTrgofbdvQBrQNClk9wpbqqfb9lmwP+eP21RaUigwU19xghIsrHQD9IdUOymLryRR20gA154J/w5h6FLp11n/Js2CqXCwQmj52FtC19w7ciO7YH5PYftG6gNFymlpLeMVtvLDmQLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762443089; c=relaxed/simple;
	bh=wPKoUnMK8vZ+AgOMszH5Qwlbo+GoY0Sp3z672Mc1Pis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XE1iu1DKN+bx8NFWzPfQv3m1+M0O3GJXGpvKy1dq3WtOnONDQq+rRV/MzJf38n6aV4rXaIfnTdX8PBAzmhVIB6QTST1uQ/XXYPEh3SwBkcpqFYrmAJx2RInJIXUH3wu5TyLcZnG/LpXRlNflEZOSh451YNmeQ0IOt187VTs+I2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=AWRega6l; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso1278808f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 07:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1762443085; x=1763047885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFCi2W3xPGMmw81b14h6jvOzJY80ZgmyWnBp4oBmytw=;
        b=AWRega6lZua7EDE8eQUaM+1KLjNszUt3GTyepfMoEzhKfeeKpe7XYDC5k3hJyrR4cX
         U6g5IAS6Uyb+UKp5R371PQGpknuClKf3Z8PczD+nbdT+XUhjdPmh4wbDGrD5f+9H2Wi8
         1UW1HuNqgVGAvTsu6GW0KIzQ0OTwCycr6sBgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762443085; x=1763047885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zFCi2W3xPGMmw81b14h6jvOzJY80ZgmyWnBp4oBmytw=;
        b=sPI/GwqUD+m3zgrfj8ZpB9PWM0l2m44QD4vK9SF/S1Pj7RMOHW1b3/Ce6gnra1ttkx
         AeU3ixFgYGw3JNdqGI8rHpmLa1PXUIF8NVeHo9VrrqIFCGAII65jkrUE6fXiGZNiHfRz
         WqPZIjzVGi4U22t1GmcuCsfOr6cUvlYmNWa88XH+9dW1ZksWQ3U8v4XFMQ1ccTZY209E
         Mnf8+OouK70Nm0/LUmPbRKMXjwN55i2CEuxICxs/SHsWluoUV99YLjymGChrIAdrBMeQ
         nsHJJRpRRazaoSXbcJG8bs4qTmJK8bSMnWNGdsQCAX6GmFTUWG9RAigMVGAXeAf2+oEJ
         XArg==
X-Forwarded-Encrypted: i=1; AJvYcCXsdpZ4LuKi2eFcyYXcFSBwlk1sIvL9vMQwl8RD1XdrafR8fe4e8tSDtwitlM9bmV1EBAKWMGaPAX1KMfSM@vger.kernel.org
X-Gm-Message-State: AOJu0YxBm3bjA99T86ERw18hsKiRvnMa1rq9gLPuO8PPJpxRsGdG9KtC
	dTevVjvF7dDmasieaYW0Vqp9ZstFDGEv8WKnB6ECau9VEZQsVZQ85M5n2UJx2fpGpck=
X-Gm-Gg: ASbGncsn8hCxb+3JvxTkv1f0KqiLcZt2IhEDcXZvmQXB27+GZCCB7tnyJzwUkeDjsLQ
	NS5Oy7nzW7A/GURu3I/EATyaoLf/Uk/qiXjYiyqFkb1h7MMnahtC9hwdnjdjM6N+OVdkTIiM21I
	lGiAmHXqnDEU0udnakNfE40JJGasdXNxyaqQ10TcBTo5lFmIrf5M4LkXCrVGJRjr5tcjhk6KaRw
	U+5utafxvIGgr2zKZSWl6BTFz+LIr8STCJC2s/izyz8PSc37n+Zayb2FOoEHzrPp9N8duBGnI62
	ZsDYVpy8mRGQSnNV5s6NVUJ71M8U40AF1DJUa/MzHoaUUJ09WaGOEFywsQKjMGzD6az00s0bPmg
	4YCqsQyOnxzxOUMaXKLGraNc2aizV8So6D8AxchSxoU9/f1/ovqFp3+pAe9pvZZmrSVNj1EnAms
	EosZS1xo9qNipdo8reYon6smaodwjqCteZCIk=
X-Google-Smtp-Source: AGHT+IGo0bYCWcjyrO5rRfbbqk+9J1qWefLXEhHHSmFWJVEVTxenM6rlhrrYWhuAbzg+tmOJeinyWg==
X-Received: by 2002:a05:6000:2002:b0:429:bfbb:5dae with SMTP id ffacd0b85a97d-429eb19d9f3mr3818004f8f.17.1762443085192;
        Thu, 06 Nov 2025 07:31:25 -0800 (PST)
Received: from riccardo-work (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb49a079sm5966719f8f.32.2025.11.06.07.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 07:31:24 -0800 (PST)
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
	mm.facchin@arduino.cc,
	Riccardo Mereu <r.mereu@arduino.cc>
Subject: [PATCH 2/5] drivers: spi: spidev: add compatible for arduino spi mcu interface
Date: Thu,  6 Nov 2025 16:31:16 +0100
Message-ID: <20251106153119.266840-3-r.mereu@arduino.cc>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251106153119.266840-1-r.mereu@arduino.cc>
References: <20251106153119.266840-1-r.mereu@arduino.cc>
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
index 5300c942a2a4..f0dd516c2083 100644
--- a/drivers/spi/spidev.c
+++ b/drivers/spi/spidev.c
@@ -704,6 +704,7 @@ static const struct class spidev_class = {
  */
 static const struct spi_device_id spidev_spi_ids[] = {
 	{ .name = /* abb */ "spi-sensor" },
+	{ .name = /* arduino */ "mcu" },
 	{ .name = /* cisco */ "spi-petra" },
 	{ .name = /* dh */ "dhcom-board" },
 	{ .name = /* elgin */ "jg10309-01" },
@@ -737,6 +738,7 @@ static int spidev_of_check(struct device *dev)
 
 static const struct of_device_id spidev_dt_ids[] = {
 	{ .compatible = "abb,spi-sensor", .data = &spidev_of_check },
+	{ .compatible = "arduino,mcu", .data = &spidev_of_check },
 	{ .compatible = "cisco,spi-petra", .data = &spidev_of_check },
 	{ .compatible = "dh,dhcom-board", .data = &spidev_of_check },
 	{ .compatible = "elgin,jg10309-01", .data = &spidev_of_check },
-- 
2.51.2


