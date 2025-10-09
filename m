Return-Path: <linux-arm-msm+bounces-76682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF6BBC987B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 16:35:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33F8B1A60748
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 14:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1019C2EB5A4;
	Thu,  9 Oct 2025 14:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="gF7oubbO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CFB2D1F4E
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 14:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020529; cv=none; b=ukAptMyEz+hpyowM8rTB4bfr+Id0zX/rxKLj30Fy4gKcsDsdq/tbPkva4Tuejw2ThJ2LMrGnRQIsZ0GUMgVS773UDnIMoHo3Z9eEVXoSjPqc3/2otk4tNKnRXcWXWTsZl8SZrkiVdmfyJ7vdL+mL1q4JyHOFB4f9yEaKDkDYv+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020529; c=relaxed/simple;
	bh=zFAV7C6HOiSLgAt+J5kOIL2+5hrR7jxRpEnz3gcGgEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Echy6pYyyIjbfvxpiEfy84OiUxtvqvyZaL3W3sdRa/o9Uh2GqMvz5lSXCGGmlYwnbhK9gGTmvphJEPJ076b4CyIvPurRNrXcbaxcAbVQiRuH7MU7K4qyPQoP/mJaurQZTLHx/8LLyszm16qfa68G/NUvJ6am1TfSNoO0XcG6Poc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=gF7oubbO; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b4c89df6145so149091366b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 07:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760020526; x=1760625326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1L6kSB6WPa1m/EDbSGocETHDW+ojiTh43qomBSeQcXY=;
        b=gF7oubbOBPnX+JGKuJ1WhV8xY6vaWtoa/Qv1Du5dueCCWPZiOpH8k4yWKmhCo7kxRN
         EdpDfHzwh/bJ1XXxZ/YhlLXtPKweAfhc2vZ3aC0VXBbwZN7V63O3NfpwewjN8nuHWJFG
         QRZF1MgxiU/Yhhg1ZqPi+eUX+rBMhRlKCOE8+TAr+E6R/lAOpppKqiYS4BDcpDHo9iCO
         pzSFKLwCnzaerFL6al7M/LQ52Ljk6ER0MnFDe81950KUOManAueomzJHxzQPHj4Wui5Y
         dymQx/4nL75ZJNSq6TV2mM4cT2HxwRb5KuGoi9rqM9CYThnkkER5SqKku6rx3kYbzxY4
         TLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760020526; x=1760625326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1L6kSB6WPa1m/EDbSGocETHDW+ojiTh43qomBSeQcXY=;
        b=qYqMRh+OYL9yn8L9pvdMkb6A87kp/Esia6y9YW/l3DO6rlu5+a+8PRHmZJF3pF2uIo
         EHxRLSP3EQiirb2OjAZczqkbx8JBvPhUcgiIC87NUgRafN40iOLIc564nOrMS3JYPhoN
         OWXppg0j75zfk0uZT0oFuPZfyLO7cDF2OPKrrZoj4MdW7SxdmzXAQTH6gu/hCHBH7s5j
         tAhq1CrABkegXBoyYbEW0nMYW+ygArJmID2TPmuLUpN4vZrMokPzO7KePxPvcl4cbGo0
         TleOfYo10lwg68JYP3V5NbqH1Ee1p0D5jllbeNiNVE2LUhztVeQAhxBvIzuc8A2z44l4
         jnFA==
X-Forwarded-Encrypted: i=1; AJvYcCVscEMjkWdooocu2CZ1qXLmcVE+qlgr2ZfLKeCB1YQjqG4bDKjZHQqHtfsvlRH1aerYQIyHW9UYW8zg8GaY@vger.kernel.org
X-Gm-Message-State: AOJu0YxGOA4peDBMwA1/JxMAC2ULOGMs/IvsiQnYSTrmUftkZ3xnCuOX
	hXGLYiSA8OhaSXnIeueiHoqRAYALaxtZGv5iM8pasaROtP+Y72HYcH7Uk2JPe7u6z/c=
X-Gm-Gg: ASbGncuB7RliHJpE9KQtmrBo51u6MxNVILerdM/FR6bV5j6RoeV/zrvylAhaDiG259w
	bFztjTNZrQBFEWxGqZSG8vp6exELllXIqAbEcCBzTAfcFN/wmomNeFSVYlm5TyMXUN4M+2AqVVx
	xtbB3ibdqCvqc0yX4ek8X1IQKMe5bK2XToth8tvQl+5Q21/LnErMppOytna6qE2S/dCRvcKINUR
	p9eIam7HD/UiCKnWfq7oc8mG2vaHB+F1F8X4YXtKyxdAmjk4UE22UPCDgNh+3Mw9H8XeazIKBlr
	xfEdbcUIUUHfBu7ndDZtyvOvNX25kz0PRNSKdiBOZ5raVm5fG622WQdwPmiQstqGdDIsWReAQyA
	XOIAlNj7VTCy47S22gipKl38l7xvdPUJZf/V+1tUY0UjHQD2DdJHDEeU3AknJM9ZSlJB68+Cz9d
	7I4c8YFCmHtC550dpoKbTqejlbLBMiU4JXDAbD8QM=
X-Google-Smtp-Source: AGHT+IHyxb27ncBLKPFMzYBytYf8JdFFzBjcq0eQ234clNgQbqS+rM5m2Q/04U20l7Jzr5p1a/bdHw==
X-Received: by 2002:a17:907:c27:b0:b3e:256:8332 with SMTP id a640c23a62f3a-b50ac6d378amr918608366b.54.1760020525656;
        Thu, 09 Oct 2025 07:35:25 -0700 (PDT)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486606dc84sm1885797166b.45.2025.10.09.07.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 07:35:25 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 09 Oct 2025 16:35:08 +0200
Subject: [PATCH v2 2/4] media: i2c: dw9719: Add DW9800K support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-dw9800-driver-v2-2-3c33ccd1d741@fairphone.com>
References: <20251009-dw9800-driver-v2-0-3c33ccd1d741@fairphone.com>
In-Reply-To: <20251009-dw9800-driver-v2-0-3c33ccd1d741@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Daniel Scally <djrscally@gmail.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760020524; l=2755;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=zFAV7C6HOiSLgAt+J5kOIL2+5hrR7jxRpEnz3gcGgEk=;
 b=++B3Hg6F2Jx1mjZN7drCLj6rjYz3YZYQxAKK5x//96hcAgUDnhNv/m+Bkp8NpoJZ1aTZ6pknB
 aeYBdkBaBEeDjSu0k2CA5tQ+yUbRQLyd8w0DcZ13jxv3o3F0mo02kph
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

The DW9800K is a similar part to the DW9719. The method for operation is
the same as the DW9719, but the register set is different. Add support
for this part to the existing dw9719 driver.

Tested on the Fairphone 5 smartphone.

Tested-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 drivers/media/i2c/dw9719.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 3627e78b8b6668933c4ecd92231465ce4105ff0c..fad716ece5ddcdc450669851b4b2685691b681bb 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -68,6 +68,9 @@
 #define DW9761_VCM_PRELOAD		CCI_REG8(8)
 #define DW9761_DEFAULT_VCM_PRELOAD	0x73
 
+#define DW9800K_DEFAULT_SAC		1
+#define DW9800K_MODE_SAC_SHIFT		6
+#define DW9800K_DEFAULT_VCM_FREQ		0x10
 
 #define to_dw9719_device(x) container_of(x, struct dw9719_device, sd)
 
@@ -75,6 +78,7 @@ enum dw9719_model {
 	DW9718S,
 	DW9719,
 	DW9761,
+	DW9800K,
 };
 
 struct dw9719_device {
@@ -130,11 +134,16 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 	cci_write(dw9719->regmap, reg_pwr, DW9719_STANDBY, &ret);
 
 	if (detect) {
-		/* This model does not have an INFO register */
-		if (dw9719->model == DW9718S) {
+		/* These models do not have an INFO register */
+		switch (dw9719->model) {
+		case DW9718S:
 			dw9719->sac_mode = DW9718S_DEFAULT_SAC;
 			dw9719->vcm_freq = DW9718S_DEFAULT_VCM_FREQ;
 			goto props;
+		case DW9800K:
+			dw9719->sac_mode = DW9800K_DEFAULT_SAC;
+			dw9719->vcm_freq = DW9800K_DEFAULT_VCM_FREQ;
+			goto props;
 		}
 
 		ret = cci_read(dw9719->regmap, DW9719_INFO, &val, NULL);
@@ -177,6 +186,12 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 	}
 
 	switch (dw9719->model) {
+	case DW9800K:
+		cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_ENABLE_RINGING, &ret);
+		cci_write(dw9719->regmap, DW9719_MODE,
+			  dw9719->sac_mode << DW9800K_MODE_SAC_SHIFT, &ret);
+		cci_write(dw9719->regmap, DW9719_VCM_FREQ, dw9719->vcm_freq, &ret);
+		break;
 	case DW9718S:
 		/* Datasheet says [OCP/UVLO] should be disabled below 2.5V */
 		dw9719->sac_mode &= DW9718S_CONTROL_SAC_MASK;
@@ -426,6 +441,7 @@ static const struct of_device_id dw9719_of_table[] = {
 	{ .compatible = "dongwoon,dw9718s", .data = (const void *)DW9718S },
 	{ .compatible = "dongwoon,dw9719", .data = (const void *)DW9719 },
 	{ .compatible = "dongwoon,dw9761", .data = (const void *)DW9761 },
+	{ .compatible = "dongwoon,dw9800k", .data = (const void *)DW9800K },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, dw9719_of_table);

-- 
2.43.0


