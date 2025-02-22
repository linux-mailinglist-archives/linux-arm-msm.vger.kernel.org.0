Return-Path: <linux-arm-msm+bounces-49006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8115DA40455
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 01:43:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9932819C0E93
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 00:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED66378F24;
	Sat, 22 Feb 2025 00:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uZz+wENo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A7656446
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Feb 2025 00:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740184995; cv=none; b=C506HREOJa4R9HWF3IwiiH8TP8xToWvlFri+PvV9KhN4/vuIzJKPMoLzNzVpXGpXk9s/ANDODTPG5KRI/oBZMNHuC1SpNrC198nu+NyylP48ZWxDI8dbgtHtdpc6wVyBGqQMH77ojTFucY+uwA8Wqp+j79qMrNhRnbgdqt4wJhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740184995; c=relaxed/simple;
	bh=RPWOCmL23bGGwiUHvdooGKW20ZSBhHUbBWVdVubFaOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xw7tDSXA/uzKsFqV9RC0RykV+0bFMKVJ+MnjHk+3ohhqt9Cb652kHUrtsc8hfYtMwzuKNTudGSHRFstKmgK/l/jyp0hbe66OujZg8r3zAuzKJD6DiVn+dutjcwOJn4bKONoojU+wqdxHt0HONrEKTfHCi9ojAnlu+OGkNwEZHK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uZz+wENo; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54605bfcc72so4271879e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 16:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740184992; x=1740789792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DnejlGa6g9a4DQfGIg7S1SaLgJ/zYRveKCuAvDE4/uE=;
        b=uZz+wENovzegzCKi023DOOKNWXdDujEpEJ3i5uU8JF4gVXb7SUrRWwApayIVayDUcx
         pVMNJq+odxHjxbdPwLOL03j5KRl8kF5QOZcAW7bEocFjB4w4Dnfzhssx2De7/iR0E0vQ
         dpID2L0X/AzuPBOgC55mJrP7upMG48Qmi6Gp/5t9aiEGTrUADc/SBA9WzsnWWSSEkyHd
         cm2keNdNf6cdV1BhppnLorDq1UveK5/uOnYWZtKEkYypeSSRuV9my0PdMosD+BxxVsMD
         +8gGA9hdtsf/UB64WMW+JYTjqam9fu0sekyOo2b5t/waPpS2xRBjzvllRHojtzSCPIlh
         JF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740184992; x=1740789792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DnejlGa6g9a4DQfGIg7S1SaLgJ/zYRveKCuAvDE4/uE=;
        b=FWhDCh0RoCCaXWTd0hCCV5gjREr8gEd5hLf4aTX7AQAo15IOEzfw9KavDgnglJZa+1
         ukx1qpKDjUrq7MMUH+64RZKLW/OhU35Bye+opv5PlqR2rBk82GfNLcX+li0bL0MmjObj
         QdVyS6rbmyTesnOrA3Mttc+Qelhl6TdoUdL2BMJCwtzzfPo6T38QgfTfdYn3PoV9lywM
         m10Eoy8I/7Pam46a6TPJk6O9IwaufZppgkjVYnCBvWXDYalu2k5PQV23LNx0SHfJ36ch
         PfTA514CeCI6sgKHK7DiSqHn49PG9nfssKdzS1h9+oSVvRhxccHPM0ELt4e6+kIB+oNS
         xjnw==
X-Gm-Message-State: AOJu0YyIgc00fDPLO5OHlr02uXwzoua5bUolH/0ZbYTiOEuMo9YgBeUI
	wc0D2zpdc0zO4xRdFXeh03v15d5gORqc1H7abqCkVY1L8TNy7oPRXynczvvfdxBsmR3EU7M+AFh
	t
X-Gm-Gg: ASbGncsgC1Ulj7Q0OPiFGOYXWYuUxQ9kDbuHg0ItgLqLMvbBKp177aTCU9G5YQJRg5h
	5eHMtoMH/7Y7ZTAr6Y2RkyVjKk4KJDndhVTLxBTyiwuZIpY9BEQGx8r23EaWgPHHbF/8F0QZIgf
	dWvE2VyXvok4ofBDcQILQhA/P7k3MC5Tef9QN0245veUwoUaNupX7aLv7nmg9zson9qdfPyJ1WF
	qu86MLJCgVfPzeOhP6PQ5gdI9dRiAD28dyAvaCn+i6V2o/wSd7fhxVnAVBYDd2uGsbPUUg5fr+q
	qhWVYhuObhdLg4vYkjJZ7yEyl1aMKDwKWg==
X-Google-Smtp-Source: AGHT+IFTbKAI02b+n1LYT7wgygeZ4EBpiAgpy3UaJWVjaKzRgtai4q2fSYnC8SZ6lyL+pS18GbNcvw==
X-Received: by 2002:a05:6512:1324:b0:545:2b69:41a2 with SMTP id 2adb3069b0e04-54838c56e8cmr2186175e87.4.1740184992194;
        Fri, 21 Feb 2025 16:43:12 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452c301175sm2412090e87.139.2025.02.21.16.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 16:43:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 22 Feb 2025 02:43:04 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: sdm845-db845c: enable sensors DSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250222-rb3-rb5-slpi-v1-1-6739be1684b6@linaro.org>
References: <20250222-rb3-rb5-slpi-v1-0-6739be1684b6@linaro.org>
In-Reply-To: <20250222-rb3-rb5-slpi-v1-0-6739be1684b6@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=905;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=RPWOCmL23bGGwiUHvdooGKW20ZSBhHUbBWVdVubFaOI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnuR2a3DJav02uZQua5Scrp076y1z+T5zQKbX5g
 yFD2EPfG5uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7kdmgAKCRCLPIo+Aiko
 1eDRB/sFyoMDGgIGkiQD3rStRcpGNEDaw4ReXCxQfM/vXqAv5preXM0yoH9nkyHxFDjfvo1gaZh
 XwFJ4pNFSa3N32H2j0uEua6ZbCrN4VbwO88Xw/QoeUxal9ihAIIjMEA1iDtT2P2Ej7l2l7ZnMiX
 0oCrtXUfCPpJu79iFUvZsr5cbE7DacNv3LYOAh/CkSs8ZnSHY+zCwNFvvVqgKxLmqkViVJMXhDT
 5uDrcvKQYCUOUswKxFKS9IcnnpMH8mI/udetOBraRkXuy0UyJLbOnS4ZArvjDF0QO33Lwxoh/Bc
 wmCzzGSu/B8gLSbAMNGjwC8K0VoElYHlTfSbhJxmSjx0kqCR
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Enable SLPI, sensors DSP, on the Qualcomm Robotics RB3 platform. The
firmware for the DSP is a part of linux-firmware repository.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 1cc0f571e1f7f3023efa08adf2791ffce5f2fecf..cd6af2fbc5ef424d57c36a3ed66a6455d09bc30f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -756,6 +756,12 @@ &sdhc_2 {
 	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
 };
 
+&slpi_pas {
+	firmware-name = "qcom/sdm845/Thundercomm/db845c/slpi.mbn";
+
+	status = "okay";
+};
+
 &sound {
 	compatible = "qcom,db845c-sndcard", "qcom,sdm845-sndcard";
 	pinctrl-0 = <&quat_mi2s_active

-- 
2.39.5


