Return-Path: <linux-arm-msm+bounces-52618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D32F5A72D4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 11:07:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 501FB7A19D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 10:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D5BA20E039;
	Thu, 27 Mar 2025 10:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hIVhyRMl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3590420DD64
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 10:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743070004; cv=none; b=dfNiNcofv6B00/1o8ZgNxSYy3QDpx2UsdeWEYWJ8s1AVgFywsoG66iaWOlg2fOAjEtbDx8hxk5BIV7qu+Krf7P6nvyEq1XeY0VpKBBZXXNgSEqjcWoBfljsRW8GXVv8OIHieDvRXO+xOwKjMDqpFWjqKJgi707gJ9EHX0b5kT6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743070004; c=relaxed/simple;
	bh=nzVmJfufed+ekMZEjdRDlysNfkHvhI2RIGmGqRITGrI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nent6l8m8GAhvfY7Tp7Zw6Y1/SVwctiJdCfpHwVRx2zV6phm0PE4E3m3RRF5ORh1zxD1kb/DGWZK5SnCJDkr/HIX0iCPYMiB1Bx5sAlscgdAQTfigGm2dY08aQn+65sRBb3mOShLnH5Ayw3lm6UPtAYAonPtj17iexEDFBOfL4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hIVhyRMl; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39149bccb69so647563f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 03:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743070001; x=1743674801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGhDhYESbCVLGZrKJ7EvUOhY/AIfq8zAGCvPtzsm0PA=;
        b=hIVhyRMlKMflEvXMQV5ueApdn2nsXlgpeaCM9JWCGQkxyJulKbXdd45LpKvySlItim
         k65fJ47tK3jbdraszg9XVWmZzLlIt1dyxTxNhiTACiQPr/ulfYCogspa21ZyyzsQHayL
         S5tPVKrTIMI4uF2GR3eHR9BFADKcW9g18hnDMaBejnTc1T3HqTahJXS/meA20lFGWhy/
         igohQcXtGV1cziaT3TWlYj9PlGJZIFNEI2cHDDGxpRk9mDNwe1PdrAs1a1dS+7TnBjY4
         47GjbWeIac9/B4oR9dq0Lsa/Wix39xD2UfoGVfsNkTLSECZ9WQxh1QxtlnpBRMS+5hgM
         a/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743070001; x=1743674801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGhDhYESbCVLGZrKJ7EvUOhY/AIfq8zAGCvPtzsm0PA=;
        b=u+r8HnsJl3jmzC5yCUXC+CrXohC4/EqkQTmsHsO84eK+KIzVPJLTLNjw5B/2kJlZ4O
         P4IPOT+sVoftabyLIB5VVClTLSDFWJPCw3xnflngwr48BQUN5iK+9tRh+4m9mewIghYb
         J2QM1mMcNh2NtgS1H5yMhLvuARHK0UOMnaIEmNMi7N6M7cazS7tvLKapdKHXD4xwfdt2
         i/tERvjdQiUuwlJl94u6xTcScj+KHAXdTN9VftRkBhWmuGcl6uS3vivLGi+PyFrt1tg3
         5P545TKjHNa8OOmO0ehAMzl+FPZUUryOHot40GByzo4z4tnznV9HB5iHOTv/UFy7gSPY
         DsAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc1NYtAcHsnKuSbKUeuJiWZjH0a/9yQj/jpqHP5dBvg/Zlfd+sCr+KwI7RaizSSrBZbH4nNaVYbZaMKATk@vger.kernel.org
X-Gm-Message-State: AOJu0YwePdDi+0EJ9Znmy0F71tautRnJ8x0vpC9w3GeumOl0cGHHXeMk
	WWFEF1zsfivBbMmJGUb1rraMkSjE47o/JqjpZt7BQutQD6JIG/8bym4JEj07ab0=
X-Gm-Gg: ASbGncsVqkOkWuznaqwUYVdvZeF0g87LsUHDO3dly2sjjRitBMCcQeWWlctEFV28f4J
	FobMgXVg4jEGyhSppBH75ShuJRec8nMeDIOvdJ2T1/2b7ibOu/BSM8q7C6plM/wQxCqv0QZx0s3
	fakwpnES+m9WU2WTt03zoTzQS+QAXcsQDgkp0Q9GtomldE2eazZFwgF4t+hzyvayhPArc/xWfbx
	jxx+CPvED5o/qb6kvh6eB/ny63x/Jb5nemtrMPPI0JBgvIyhzbyYsaM+k+8sSZbWfOIkSpi3ait
	1PU5uzN9yd2sJrNX6hOSibTVHkpR5O05BTk9nYWtbzFcQryiEEvtbSk13ekRkRMmLHSy3qMrEFy
	dle0y
X-Google-Smtp-Source: AGHT+IHbYEkEV56STjfU0lTRDtdedS8WvMVSd1pZC2L1XQBbBW4aRCx0Kn4wXUGWvcbo2+wiKfBSJQ==
X-Received: by 2002:a5d:5f42:0:b0:399:6ad6:34 with SMTP id ffacd0b85a97d-39ad1760701mr2932999f8f.35.1743070001456;
        Thu, 27 Mar 2025 03:06:41 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39ac3ce3dd1sm10843204f8f.88.2025.03.27.03.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 03:06:40 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 1/6] dt-bindings: mux: add optional regulator binding to gpio mux
Date: Thu, 27 Mar 2025 10:06:28 +0000
Message-Id: <20250327100633.11530-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On some platforms to minimise pop and click during switching between
CTIA and OMTP headset an additional HiFi Mux Switch is used. Most common
case is that this switch is switched on by default, but on some
platforms this needs a regulator enable. One such platform is Lenovo
T14s.

This patch adds required bindings in gpio-mux to add such optional regulator.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mux/gpio-mux.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mux/gpio-mux.yaml b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
index b597c1f2c577..ef7e33ec85d4 100644
--- a/Documentation/devicetree/bindings/mux/gpio-mux.yaml
+++ b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
@@ -25,6 +25,10 @@ properties:
     description:
       List of gpios used to control the multiplexer, least significant bit first.
 
+  mux-supply:
+    description:
+      Regulator to power on the multiplexer.
+
   '#mux-control-cells':
     enum: [ 0, 1 ]
 
-- 
2.39.5


