Return-Path: <linux-arm-msm+bounces-70317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE19B31370
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56BBB626A48
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347482F999A;
	Fri, 22 Aug 2025 09:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gj5Xxeqa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FE52F747C
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854957; cv=none; b=YteGw6W+nnuyiVC0D/2PHPluX640TbVT5oB3ARTzAYWQ0y1+OBHBXl2xwFb/xKSMn4fswvjIe5nBi3m6AGB05Apgo7AhUxgrZHPYoJl3U5huC6JbvSALCy/xYjAcjZYMYmFLPIekuVf4YVW6k1xtk7mnfoCBpe7yaBKogtU5zm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854957; c=relaxed/simple;
	bh=3aZpoa43CgwAyEuU5OezFHxEJBjjcpDe6c7LT71bAIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mMHKpsIi1mXle0YPGXaCtd5fgdd3OA1qTuVC/9dY+WgEmpa7TwDdVyfbPDcW6njYSoU6d7zEOJWkUHNVBvMbVu9VyZ+nbKS30bwOTb0c1dER/E+EYi3SZvVyK6pqcsHVOxkSmCNDLxDb4lRGELI3zAkwNCDUbd0QlRUKvoyYAlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gj5Xxeqa; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45b4a25ccceso10823415e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 02:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755854951; x=1756459751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhd7a0fXzsnPhV3Ln71dyr+J+aAF8M86zfN68JsypU0=;
        b=Gj5XxeqaS/yAB3CIjb28vGjLamNKofGa09UN4AqGx7ftpfTnVfawnZKxyagHhAn1iF
         0IOPIkugi/TEC0dgF8CIoJXbAtXhE9fVUbpPVpQqaozJ/lWr60m2U2fsxoLBRR7KOQ2X
         VheIoTF1NF64URKU/dXvMG46kuTxnfCQEO3Ks/XUsFKpOznF/1iK2fbb10cM1DFz4CJ0
         9z46SFTQhwESDINnLEi2h/JYPEPvzJrWIJlJiPFEO1793r172KP9NIy5/kKyx2QG4Aim
         TlMpQvD4GLtARsrAo7jGcIwQ2eIW4nW0ADWflKCojVqkvQS7DwwBQObXkopvIJ6o3fT5
         r5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755854951; x=1756459751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhd7a0fXzsnPhV3Ln71dyr+J+aAF8M86zfN68JsypU0=;
        b=ui3Ij6HydRCHlDW/D11y1/LcfMicCUMbRG2FM/bEdEIp2sFnhZ4p9hAzPITRMOzhN3
         lscc6PZrr5LSN12/6KXuXr+mqRrL34nBj9KHrfGdXdG6FrQ2nMkPM0PkBASG6ScPLOWY
         UfD7JfJ6Iim9hDrWiqAt46Wl3kzIe1aEtBMW2AW1G48miLuHVktSy6MA2CSbVzu03GoU
         LDcZIK6szCWn6Xz5Q8SQeI0u9oG/FHGumWNyJwBxLlqhpTKmSr6wngxbbHvBj4kiccyc
         Dqc/xs//ULAixBUZzIaq5E1S8laoBDOjJ3LPaBNerM1bpvoTF72xXIDa5wE7nHf5UENT
         SyPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzgyyA4h9HSgNaj0t2+KCXYc6j6dzFdPftn+hhuBHm46f8DLU/vp3huip9ojUxQXKbQ3ceEwdv3920TmAD@vger.kernel.org
X-Gm-Message-State: AOJu0YxIbwPwj//R9BURS6r5RcsF5G7Bd1T92pjMIFjRqSNivBEdVMLL
	A3Gq138+srWSyHgAslMYWHoIYsBAU+p3QPU7OOnEQ2AMyA3eRE5gD0OXWN9hfJTpHIU=
X-Gm-Gg: ASbGncv53XOCVMRkyo3TpCcpDD0dQiEBBqbJtuhQEbyGc1dL8TBRlYn5jjPbW4UGhha
	QDzR6XKwLVJZTuVtiorhKkorjxwQlN1qNOghfrzEGkE/SktYGGlT/m6f3yEE4yqrjSnw89wsWXJ
	Rxsprz0acmKpbfL1l2+aqDDCmJPdcjpV2g+b0hpJK0NnbigsS7HI1474tSyLXAnbdElwDXnOfmU
	Ql66yw4j75V9CnRJpqZ3yKRQmpMltB7ckotFBrQ1BBM+SgChFdKn9eoUaOhh3O3uMV4hXmjcThk
	y4WTwiTufIHl+pQBexJ+Zj3G95L8CwicAj7wD7wRwukxOe6220kWS0m4mv4C8+c+XHWPekvDafF
	Sx2gn7Y+Fe0bqNJTe6oc86MZRv9O6u5mqB2DtlQ==
X-Google-Smtp-Source: AGHT+IEvPYZI+pR2Cv6FlEIH+bERstV9JI33u+O904XKUZhQ8U/QXgWZilLuGm90hKiEn2AyyHCmWw==
X-Received: by 2002:a05:600c:4586:b0:45b:47e1:ef6b with SMTP id 5b1f17b1804b1-45b517e0104mr16344205e9.34.1755854951094;
        Fri, 22 Aug 2025 02:29:11 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:c671:531c:f2ff:2a7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4e269d20sm33831805e9.2.2025.08.22.02.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 02:29:10 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Fri, 22 Aug 2025 11:28:58 +0200
Subject: [PATCH v2 07/10] arm64: dts: qcom: x1e80100-hp-omnibook-x14: Add
 missing pinctrl for eDP HPD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-x1e80100-add-edp-hpd-v2-7-6310176239a6@linaro.org>
References: <20250822-x1e80100-add-edp-hpd-v2-0-6310176239a6@linaro.org>
In-Reply-To: <20250822-x1e80100-add-edp-hpd-v2-0-6310176239a6@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 Abel Vesa <abel.vesa@linaro.org>, Xilin Wu <wuxilin123@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2

At the moment, we indirectly rely on the boot firmware to set up the
pinctrl for the eDP HPD line coming from the internal display. If the boot
firmware does not configure the display (e.g. because a different display
is selected for output in the UEFI settings), then the display fails to
come up and there are several errors in the kernel log:

 [drm:dpu_encoder_phys_vid_wait_for_commit_done:544] [dpu error]vblank timeout: 80020041
 [drm:dpu_kms_wait_for_commit_done:524] [dpu error]wait for commit done returned -110
 [drm:dpu_encoder_frame_done_timeout:2715] [dpu error]enc40 frame done timeout
 ...

Fix this by adding the missing pinctrl for gpio119 (func1/edp0_hot and
bias-disable according to the ACPI DSDT), which is defined as
&edp0_hpd_default template in x1e80100.dtsi.

Fixes: 6f18b8d4142c ("arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook X Laptop 14")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
index f9ce2a63767c151192b0618ee2154e8d97316c1b..8b28b6f47c9a09fd49f2ebeb139291f710eb6e1d 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
@@ -1044,6 +1044,9 @@ &mdss_dp1_out {
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
+	pinctrl-0 = <&edp0_hpd_default>;
+	pinctrl-names = "default";
+
 	status = "okay";
 
 	aux-bus {

-- 
2.50.1


