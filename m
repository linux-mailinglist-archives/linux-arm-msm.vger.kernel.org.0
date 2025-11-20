Return-Path: <linux-arm-msm+bounces-82703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 693C1C7532A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 17:01:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 0578E317DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 15:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFCD361DAF;
	Thu, 20 Nov 2025 15:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="MUIf6U33"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E953612D1
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 15:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763654314; cv=none; b=fp8K15HDj8pABUXdH6ziffhviXMIaiczZfwACr/pQfq3HaSItuFrkwd0GqpvwVo592mDQoEX9VEIrneY0sdwrsPVpAVwEVlBDnNlGkPiAxGRrNhn3vvJK8E0KEFxULXTx1sFIf9uouacGGO32tRFHbUvAcz7jKomC4sJ18B0J1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763654314; c=relaxed/simple;
	bh=PT5mTKBLA9e0Z2q319Y76uD/NL+8BwXBKeIVE+px26E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TTSXkbR3nUN2dw9zGMqz/wXaZ0lwKyXx4GpPXEUYnaST/vw6SNwkNN5qqIKUQa6V5vD/jx26kmIDHr1wj97IfxJ1USTAjf7ErMo5yh5eSN4PMWXnfyM09zLKGZFhD3kw8JLO3S07peSLJkjWuCMwbNXiUEUtKZ9m/ukqVHedBw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=MUIf6U33; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-594285c6509so1009717e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 07:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1763654311; x=1764259111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2d7a/n2EOxZhZYAbK+k3OqlplnpCNPGPMa8QVEXFKLU=;
        b=MUIf6U33m9s77TqC7D555O/G2qIb4wM976f//iV9WgJaPirofKJwMsahi2UNo8x5/i
         FIfCZ4lspq3ejlPD1lFjsSrDApDTTQR+xkl+v3JWxTTHK8MqBQU/bz5QxuMJWSiTAVJS
         9KONBrCXmBe7O+dSWKlUn2PCtHGB5YSGS9X2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763654311; x=1764259111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2d7a/n2EOxZhZYAbK+k3OqlplnpCNPGPMa8QVEXFKLU=;
        b=uv0bZwxlefi5gqUVc+Z7JVYQ7MydbxRdqIeROkjypKN2ZmmlwhCwvYeKU33+vWdFf/
         WNr9ECdV4fsz946X70AukkmKQH19mO4cW1eSxOhm3LSZ254FmyVFIvlWweFrzjkCDjQY
         q6V+VffN8Tga9qrhI5QkJ3RpBJ15neuphK/h4LKw8rRJzj6EAWJryfZEqVMkDkes9Kus
         1EFJv4qgmjoTvO/dkrrYfLC7O0QWxFbagLntFK/O1gdjc8SyCvcVVXYTlK49Pscqt9HN
         R3MRZEpXrLh127BnZ0p3bEStQiXBYFqxMWDjxrfLXRZPagNPzW5y0o/8VWaXpnPXOCRl
         AX6g==
X-Forwarded-Encrypted: i=1; AJvYcCWKQt9ZW3c9RBm00zweVEW3SaQf+wR4qzs5gX6vhVzSA3paH1WqMrausv4hfPBMkbM9+iAoRKiL8Qx1p7j2@vger.kernel.org
X-Gm-Message-State: AOJu0YwbF6vqwsgeXdwPy4aaUKiqayeXi67355dQUCkdcI2cZHFJoT17
	kbpVNetRpF+AzlVPuTv6F1xgh/GWrOO1YjO3FaHZMUdZCvZ9UxMAZnUebKLz+OK5Amg=
X-Gm-Gg: ASbGncsWUhfi9iAGhzgkcr64jZxLI76nLRMGKvBYFT/9CHo1EO5rzdeb2VcgTOgMo8N
	QsnsQqJUn94+5Doo8+v3nUGA3SOZRwcakN6BhqobpvxlolwllEDyUtQH9ALBuznj85ORAT1KUBn
	DLXhUvSCNoU0QPyg2VSzhwnq44V4oh28JiERpjJdSui1WU73EWRBVxdUt4KXAjmILDW5/UUmoQQ
	CAi23uf/fxstcQNavedA8ApjxjLMP4hjdHXZWo4JQS2PevOj4arHO/jBh7IEBRNWPLDUeHAAiV9
	fA9gnh9esldHxpx71HsQmYHIlfEdlNRW0YORvKb7vE/Jg/Yy7Ya/nDcHvNlJoHyJaJNsJ6Cv/t/
	0isqUMidVOq9z21qKFioBslYjFQQzN4RvZF/1rXR59Mb0gVZ+rOcim/vcIAk/32VCxL5tgQErGe
	kOJuSCyW/mI9bxmbVCKWjpFBjrFRjwFZ5z3q4tyTKdrmxQO98/kHxd6hQ=
X-Google-Smtp-Source: AGHT+IErnHJTmLH+8vYzzAWGbwl27N+clFFjZtIgt90CqUtH2A/7y5qcoUtFsllx7NfXgOa31L88Ng==
X-Received: by 2002:a05:6512:12c9:b0:595:7e9c:ce00 with SMTP id 2adb3069b0e04-5969e304afdmr1308494e87.25.1763654311003;
        Thu, 20 Nov 2025 07:58:31 -0800 (PST)
Received: from riccardo-work (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b82e8ea6sm55552185e9.8.2025.11.20.07.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 07:58:30 -0800 (PST)
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
Subject: [PATCH v3 2/6] dt-bindings: trivial-devices: add arduino spi mcu interface
Date: Thu, 20 Nov 2025 16:58:21 +0100
Message-ID: <20251120155825.121483-3-r.mereu.kernel@arduino.cc>
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

Add unoq mcu interface. It describes an iterface between Qualcomm
QRB2210 microprocessor and STMicroelectronics STM32U585 microcontroller
on Arduino UnoQ single-board computer.
This is a trivial device since it's usage is handled in user space
by the arduino-router service.

Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2eff6f274302..d0f7dbf15d6f 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -59,6 +59,8 @@ properties:
           - adi,lt7182s
             # AMS iAQ-Core VOC Sensor
           - ams,iaq-core
+            # Arduino microcontroller interface over SPI on UnoQ board
+          - arduino,unoq-mcu
             # Temperature monitoring of Astera Labs PT5161L PCIe retimer
           - asteralabs,pt5161l
             # i2c h/w elliptic curve crypto module
-- 
2.52.0


