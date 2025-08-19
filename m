Return-Path: <linux-arm-msm+bounces-69729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F9DB2BF3D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 12:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF6F87A6ED3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 10:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB7F322DC7;
	Tue, 19 Aug 2025 10:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l6VjhCHd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD605322C9E
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 10:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755600338; cv=none; b=PLB3O3vj6uCCpHMu4urJkdmPU/N7lem7b26kFrCapDW/Xa9IoAsqs7QIcqRXTnfiMGU1G7Fy3Ce5YRtjGfFrA/wEkMbl/deFAhsc+jMq4vAVcutOSusZQGJ37EjfCwKKl/BRYSVLjEw8dr5ohc0GYsZ8es13hR0F/nw2rN6ZGE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755600338; c=relaxed/simple;
	bh=1sd/ouPhwY994V2JgIdwhDUDC7tKLXQbXK+ZAjrzaC4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oLXfc+rj0IlaKPxNbpWcYTG0INiFvQY6tgAmGBYKhmrjpv+oBMBWrDAdE8wn/ieklClc2B0cU3n/6IjfwXQxRQWQ9On15KmbsBDt45I9ANsLCANWZ3oHHuwnmUR+ajkwD4mv7eSlFI8Vxqz/G6PopZKtikQ126z0loSqEMEMqwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l6VjhCHd; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6188b7532f3so9251333a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 03:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755600335; x=1756205135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0xeIRINnU2V4r2y5NX1BVLBAPpQQEZ1x9/pnnUXPbAU=;
        b=l6VjhCHdZC9bksGfTkdQ/6iUxsMhe8I72v4TDB5orJgVUSwsUSIwEf96uQ7PLlphiI
         Qp0aJ8FwRXN+B7IQnq4qwB5B4/CRQuyW4FRf0YMGcyq8osw8xuQqnLD4Fz+12bprZ7Yv
         1f3CoWnglMojyQ1cpeCBBi+l7x14Cl9cnCJl5SVO6vPzC+mNSaZCx+dEbAwQI+AUOh8x
         4m7UAcBddrkAb/VmqtF9ZTsKhUwOMxmEwYWE1eb4VuUCejX+rU2XusiR0UKPrCBBBiar
         Vu96SVJhqPmuaywwkOsTXsdEWNY6w1kx3TJ2nQEz9QqyzuMPr6lyHe4IERv3FLYktZ6j
         UQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755600335; x=1756205135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xeIRINnU2V4r2y5NX1BVLBAPpQQEZ1x9/pnnUXPbAU=;
        b=C5xGjUvnbyin+vROFlRbc2dFwtwaZ8I3Z+f9JC3ZmMHYOWlTtK++vAZLSczbibg6uj
         yLz43Nel7fuwr9BqhmGrrj7rbdg8YMCKSwxwqqlWYRKWfofA7YvJF6sGVjWeT6SDotXn
         nKa/FwkPhAsRUYDeiK4s0SPF5I7ZTY9avCAn6/cpFugs8FmuTgr9PZ4RNgJYAE1tHlt2
         Hmp7IDTZMh2A8Dlqm0IAUREWcFOGFc06SIX/hPLJJKC2AenD50LhkteI3K4lJDa8L6E0
         +y8jFslvrEPInoDX3dDH3yLV+/12ZckFgX66H+QLp7Lv44sbHvxL1ygJIx6+8xgJNrA5
         kURA==
X-Forwarded-Encrypted: i=1; AJvYcCWpvCpgA+mgm0Ur5SkxIvvfI//WXmCHPMtN6I7dgRKJ/Sy0Y3zvfmeG5rWJcPAMddh5Yth9G/vPBay4IkfN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1E++c+8C1KfD7TxUpwuKaOEZuJloR26Nkjh33uVbhDFoAUNX3
	M/3JT0hDAcm0Mk6Uw4ZfnCQj65mlLU/t6Qklj3NFO0KyT3Pg6B4K0m+JtqqAyUhRFZ0=
X-Gm-Gg: ASbGncvtmXGqgNAwmd7963Lt1/JCVzpuc7HG62N+lL3ZqicmWr80wnPlP3R2MbpWoXy
	b1hZjA41Yk/WOLoef9mlAk58Ir0uexlSNMhbcS91Jxgb4v4nFeFWhLKgoQzIpa2BXAd67H/WR36
	pGGSvoXfO87nIs+QK4waq9qfMusOGmIwxgvmoaH36RQb5Qr9N+BV6OgVIWO6O2vhd3OQ+kQZJb5
	8N2jw3peA0FcZvJJ4fjF+3c++gmC3VZtIZKszYMVj0aGGpkJOckFvVL9Ff+KR/x1azIXZ0AqUmP
	6iPrhOwQWLMbIqhe89kJ5/RXYNxBRGuJPhVKCbFlPeQdK9dOZIjMVIZApcbT1sNoKxS2yoZCufT
	k9Bk4BkXVJKwMjCsyqKLZ067E/8vktw0kzvUflg==
X-Google-Smtp-Source: AGHT+IFnMjA2JxcB/d7vwACjWOfZsT/t2ar6gA3xAHBBf9g9sMPI2AdWAWOkEAfZFqMDZRqYYdtNaA==
X-Received: by 2002:a05:6402:2683:b0:61a:89aa:8d16 with SMTP id 4fb4d7f45d1cf-61a89aa9104mr499308a12.23.1755600335215;
        Tue, 19 Aug 2025 03:45:35 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:db5f:8096:4609:9b24])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a757a48e2sm1469787a12.40.2025.08.19.03.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 03:45:34 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 19 Aug 2025 12:45:22 +0200
Subject: [PATCH 3/4] arm64: dts: qcom: x1e80100-asus-vivobook-s15: Fix
 swapped USB MP repeaters
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-x1e80100-fix-usb-mp-repeaters-v1-3-0f8c186458d3@linaro.org>
References: <20250819-x1e80100-fix-usb-mp-repeaters-v1-0-0f8c186458d3@linaro.org>
In-Reply-To: <20250819-x1e80100-fix-usb-mp-repeaters-v1-0-0f8c186458d3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Maud Spierings <maud_spierings@hotmail.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2

The &eusb3_repeater belongs to the first port of the USB MP controller and
the &eusb6_repeater belongs to the second. This is obvious if one looks at
e.g. the CRD or the Dell XPS where only the second port of the USB MP is
used: They only have the &eusb6_repeater and already specify it for the
&usb_mp_hsphy1.

Swap them to set the correct repeater for each of the USB ports.

Fixes: c0c46eea2444 ("arm64: dts: qcom: x1e80100-vivobook-s15: Enable USB-A ports")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index 62eba17cdc87c088ca471b4cbf5b44af06400fe4..b571e8349d3b378ad2436b86044652db3f16993f 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -971,7 +971,7 @@ &usb_mp_hsphy0 {
 	vdd-supply = <&vreg_l2e_0p8>;
 	vdda12-supply = <&vreg_l3e_1p2>;
 
-	phys = <&eusb6_repeater>;
+	phys = <&eusb3_repeater>;
 
 	status = "okay";
 };
@@ -980,7 +980,7 @@ &usb_mp_hsphy1 {
 	vdd-supply = <&vreg_l2e_0p8>;
 	vdda12-supply = <&vreg_l3e_1p2>;
 
-	phys = <&eusb3_repeater>;
+	phys = <&eusb6_repeater>;
 
 	status = "okay";
 };

-- 
2.50.1


