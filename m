Return-Path: <linux-arm-msm+bounces-76684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDC3BC98A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 16:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68FBA1892E0E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 14:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5662EA48D;
	Thu,  9 Oct 2025 14:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="VM/FMDKA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614F42EACE9
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 14:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020531; cv=none; b=roSswgVcdhOvyLW+oDNLl+hIkhRxbvA0G1hvo7ffXWumfBFOCWSK1gwTmIfGnzlmYKb9/uJ5ESWAAbf0/n8sgSekGcCCoLoI3O77cE5y8W2H5xgeVSqCz7XCqlsvMbJyjmJnlPGlmluQH8CTWJ5VaTwAetIinnIYJIPpSvQ51/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020531; c=relaxed/simple;
	bh=Jy71v+0d6B2d6GEOh/dwMzbOK+DdGqIZvEENLkmwzE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ge8vjTdtl904OuvqwZ4RbvQOOBqF2v+r1XVyE7kD2fn5oGOE/zNM8L+1dT5EtvNOywo14z4QzK9+UV/aZ9Ns/U56a0paXXBAmZzsc3QzcNg1sJWcWoTOMjXnPPUkyE+he/8MdY689OfxUnIaLEC83MihUGY5wZsTJQjCtC1i5Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=VM/FMDKA; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-62fc89cd68bso2059915a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 07:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760020527; x=1760625327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QB2QRRZuQ5A6a96wgJEcHWWoFDLiNw+AQa4nUZlLV88=;
        b=VM/FMDKAS68ARpBSkZCEyilYKythke2eYmYsQG+HjhdvrmfOz4Iwa85OFBIRq597Zk
         tbnjI25RYzZJuftHjJunBHmttKxgLz1VQXIhMyjjgK0lyxfta0zqHSeHVVz1Npw6GTy/
         aLsNDmiDVocOfxg1d87+II1jyg2lGgm/Jiyh+1ycE/qG4XUCjZf36A5op6pp+uxiV6aT
         QkBsDpxKpDaZyyVzgaHXj+FbuyJ/Ww5x4Ar8j+2lxNhxiML8ywhK3WPMhe5gSsT49KOh
         L+Q7ktgS9lhiELcQPXiZJmFr6PgkFn4vHdiJ0ZOHyVxGx2hMkNY6xjvn4P3kkh5vYzmt
         Amig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760020527; x=1760625327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QB2QRRZuQ5A6a96wgJEcHWWoFDLiNw+AQa4nUZlLV88=;
        b=V+dS7yW6xJs/XaUSzSYkM7+xth3PvViX3/C/VKt1T+e1ksAHTVGiIoXbqxDFV8dYGt
         Lx4kUUhdPwcj/RRC2dU9FgcqxbRLCo8TtVBQxqq02RsTw6q8o9nX+mcTKimEYDtdUhll
         8ZPxKw76iExaubXDaX49U/T8fAKpg+FENGJLh9Ye7DQeWvOJdNwHnRM/jk6kmoNtYQLR
         2rURqj0F/QnjTo/X0raRa6jPrsSxwHcje6d/e8EeyNgsOKWED+IASw7QgskHDPDI0RLP
         buSoyCW/t0VS0voEV+RFAZIFsY8v+5KEVGWe9MujQJJLLuUKWOwjnfxaXCGaQU3InVHb
         7OWw==
X-Forwarded-Encrypted: i=1; AJvYcCXzOfSmLaviFC+SlfWLTE3JWrt40IAMk/zB+IAIBM4gnlYRN2exkXzJBZBPA+8Ptz78x/7zsP3mpwGsah/f@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtqb6Hc5S3Lzkd+El7oyuX98YD13MI0lpO9zZcCDWBZjS5SdcY
	PumcGOqOlZeRZ24HVgAWSX5aCfGIZP4jnDKVHBjdHBJGJ6ABx07kudjJxtijB7cyypk=
X-Gm-Gg: ASbGncv3c6H9u+ULr2+bJf6V62O4uPvL7pkG2/e4ws2BJXUHHS13GEhkEgxvq4zq0uq
	GwuZGy4dl0lTyULbJwa6JJd4AlVLw16B6ggXdGLOHj6ODEU35uTgZx854BfihMez318nlDjFMR3
	ubF+7NsuD3NPWOuffn6/QCbNX5p8wcyAd/affBfOKxf5ne1Udc3IX2mAARTiyi3CWZ5tZd8GxUh
	2hwUsbwBWU5n1geg7wMgXIEAxVckS4EdCzb30uG05FJ+aeAjeX47LMbwfuDQ3ykzrlOLzwVf1ix
	PJNxsBjp5SUM7oyLoohlM83s92BAcJglBos1/dqxoDRaz77ZFT0VkH55LdcPyiHruKilO/ICRBP
	p548qp2lg8mZ+QYvYKPjtFn9V3Mli0EQYdL8c+7+VSCAwhM7H+E+DlEjhhe+k0nTnr+0UEvhHGw
	yuSXfrVznLPq6+qPEVq8j01eQ2dxWQ
X-Google-Smtp-Source: AGHT+IGx5wNpD8caYwaIatPc3xH78PwlqMe1Cfb9o3uO4sNphikE37aFxo8LiJSszoImSUjRwe+rWA==
X-Received: by 2002:a17:907:c02:b0:b2b:5b40:1cb1 with SMTP id a640c23a62f3a-b50a6eae24amr768399566b.0.1760020527267;
        Thu, 09 Oct 2025 07:35:27 -0700 (PDT)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486606dc84sm1885797166b.45.2025.10.09.07.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 07:35:26 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 09 Oct 2025 16:35:10 +0200
Subject: [PATCH v2 4/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Add UW cam
 actuator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-dw9800-driver-v2-4-3c33ccd1d741@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760020524; l=971;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=Jy71v+0d6B2d6GEOh/dwMzbOK+DdGqIZvEENLkmwzE8=;
 b=wDpwODh4KULf0bqeFOvreRjzZlpizQmCgQ8rWWy+MoqVG+AQaJAeJuz8sjgNKDeRBXMfdUBVL
 1go8fz1bjdFAR5eszs8SFlVfEJcUl/rJ8keRqbVEEq7goOo8jyf1dk5
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add a node for the Dongwoon DW9800K actuator, used for focus of the
ultra-wide camera sensor.

Tested-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 2dd2c452592aa6b0ac826f19eb9cb1a8b90cee47..0e86cd5ff527925c7dba15c4e0ee5fc409fe4ce6 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -627,6 +627,15 @@ eeprom@50 {
 };
 
 &cci0_i2c1 {
+	camera_imx858_dw9800k: actuator@e {
+		compatible = "dongwoon,dw9800k";
+		reg = <0x0e>;
+		vdd-supply = <&vreg_afvdd_2p8>;
+
+		dongwoon,sac-mode = <1>;
+		dongwoon,vcm-prescale = <16>;
+	};
+
 	/* IMX858 @ 29 */
 
 	eeprom@54 {

-- 
2.43.0


