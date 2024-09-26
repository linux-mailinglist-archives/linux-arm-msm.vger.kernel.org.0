Return-Path: <linux-arm-msm+bounces-32585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DED84987565
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 16:22:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 120A91C23303
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 14:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2C2414A615;
	Thu, 26 Sep 2024 14:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5G2bG7v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170761384BF;
	Thu, 26 Sep 2024 14:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360542; cv=none; b=drP+MV1gig8pbSSjtJKaE21xZjs9UWzY7xfJCTy8+tazWiofAvgxXWazwUZ+8RAxuMTxwqKbve4f3BeArDUENpkiC2lKDaMwZQIau+jf8NOZKEi9iLkV75QW3ildVXxfLZfFce0c2/j9YV1HoyGVv6sKs3MLwlizria0qU1dgr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360542; c=relaxed/simple;
	bh=Eph7e0S45r0MTRyCXF3ejlfGwAhuMntaPM1lDGhJahM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZQ2JkowN0v3CSFc/UxX/W43Oh4CP9IxM+r5yNJLa/2/Mgg92t5XFMbIJqrHI/uJub8il7bHL7RlOV7cc5jUUbN6uA/L61b/IhEV9AYbN667x0DcWOIL1mdYiknq50Em5usJXYOcb30sI1VC9fxI9mcfJ4awAtXlXul/1huYT1s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q5G2bG7v; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5365c512b00so1341560e87.3;
        Thu, 26 Sep 2024 07:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727360539; x=1727965339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+MogS/GsWGussElbxSTITWgB14U3ovrKNCk5uQtTkgQ=;
        b=Q5G2bG7va3EBH2E1p/xmtJTPMxMaAYn0sWdZmzyX+Q6S1mxfsTU4OIJHlJJlApn0RI
         HTE/TfljzqaK8WjxCnet0wsZ7RaCANcbLAAh1/+hMY/QiC5VM3e12JscWSdHxG1DMnR8
         Br9xhxgc06L4qE7zqBMnbhigfiLPDTVbwV8t3xSR0Y/J9cG1AS9+4ZoJlYL0/ZRi+XmS
         KcVz9HH9OdbjWZI2U7qHjp/LzZDedvxC3e2fz+Rc0CCTglaRtIjQmhCTItV0cfF4q/mE
         rdXAHscf4Pw8RKoVuv9pURZ6ChFF9qNZrjOtordkqqV+2q/XfqwUMKcYXamyJ0RDGhiz
         d5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727360539; x=1727965339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+MogS/GsWGussElbxSTITWgB14U3ovrKNCk5uQtTkgQ=;
        b=A/M3stVhbWIJW4s2rzo5m6fn0iR8opvJXVs+O6SplDlah18+0erp2KWnHa5+vjNeND
         04F2K0D4bQjcEuaJLrSWq6SHydTc72ixiBCst7lwHiMwdIXIRZwQwV/m4BkyWCXrUUwd
         gpYPJky9fSzqSu7eNWlWYCLbn/dOik3G/TNmzqxK/2P+wioynetz2JRRFTLKsVZzOVmr
         96hWVPIM9hT2mGQ/De3cxOtH6qA8w8UnXfG+wnSp6AjfS0IAuAT1Vq/wCir6epS0gV4J
         8SgRHYZozfGnACqEdzhzwwbFmHKZHq1Mgnr3lBk0cllHeVlU4hQsel0pWow9CEdDplzl
         s7Tw==
X-Forwarded-Encrypted: i=1; AJvYcCUjABasNxLrjywP7lJtBKAhzdbqh2+wuUfrGg3gImdKxrZ/r8qp6Wo9mKeoWLJPrUq+BKJi6KfwZ0zX@vger.kernel.org, AJvYcCXHjMZXKwB0oWHAJStH5KXxqV0M0Kmis476hlux291EM71tmm5f1cxGBGZ/E+bjzwFBzMRi7rxvPbJOAeLU@vger.kernel.org
X-Gm-Message-State: AOJu0YyVAGnriBDcAuyC9ytpjVGe+cr0Z+uJiAWxhdURL0oslUP0nQbx
	+2OmESDkeC9Em3dOEhN3hjNpn/c9YPf6wimO5iUOD+45fm3bmf7SYLvcDQ==
X-Google-Smtp-Source: AGHT+IElh+ojn9FjecdDs6pGcAGUkEUN9uoxCDM4SFE8F9339UwpBtTIqwqYk7OOstoGQY81Q+k9qQ==
X-Received: by 2002:a05:6512:3e08:b0:535:6400:1da2 with SMTP id 2adb3069b0e04-53877538007mr4364616e87.18.1727360539093;
        Thu, 26 Sep 2024 07:22:19 -0700 (PDT)
Received: from [127.0.1.1] (mm-20-1-84-93.mgts.dynamic.pppoe.byfly.by. [93.84.1.20])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-537a864db1bsm815803e87.267.2024.09.26.07.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 07:22:18 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 26 Sep 2024 17:22:02 +0300
Subject: [PATCH v5 02/12] arm64: dts: qcom: starqltechn: remove wifi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-starqltechn_integration_upstream-v5-2-d2084672ff2f@gmail.com>
References: <20240926-starqltechn_integration_upstream-v5-0-d2084672ff2f@gmail.com>
In-Reply-To: <20240926-starqltechn_integration_upstream-v5-0-d2084672ff2f@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727360533; l=1053;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=Eph7e0S45r0MTRyCXF3ejlfGwAhuMntaPM1lDGhJahM=;
 b=7frEZSbrKk5v12/5ybFYaDB/HI8rMe+o9vbifNDSsNKPVezLtpB3GmP6yKGOtMmZ/GnhLEuwW
 7+plMaKXF+XAPs9at8426uVSADAUE9TRiqOYu6Gk3CF4hMjUKeeWwMI
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Starqltechn has broadcom chip for wifi, so sdm845 wifi part
can be disabled.

Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index d37a433130b9..6fc30fd1262b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -418,14 +418,6 @@ &usb_1_qmpphy {
 	status = "okay";
 };
 
-&wifi {
-	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
-	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
-	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
-	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
-	status = "okay";
-};
-
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <27 4>, <81 4>, <85 4>;
 

-- 
2.39.2


