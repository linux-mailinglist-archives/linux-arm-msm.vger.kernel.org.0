Return-Path: <linux-arm-msm+bounces-69726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 942A5B2BF36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 12:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A8A7196881D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 10:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB3D3322C93;
	Tue, 19 Aug 2025 10:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JBb5doAE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D257C2165E2
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 10:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755600336; cv=none; b=KnwEwfNCMzbV7GjMDL1hzBVuvP0vxaAUKj2VHYicPEIEfXm4EgO1+xSgoULZoV4xxcxSMrZXdIiwCaU6YzkD6UhbiagNd8DZdF16F7meeVVfe0MmoPxNjQjEi2E4FneQ0rxLIAyM5c2l/1RtuScEnPinHyFMJwTKqe4DjHoIf1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755600336; c=relaxed/simple;
	bh=lBEHY3oqwrkzdEyLXUenBPe+fR0fQKUQuPgdsV+am1M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MK0kL3ODrfdiOBnjnQlddiiujfgj/RU1prYRGXREp9xbT5D0KIBpkP3db20USUULieItaEDWn1nAi3MzccAXtZargWiTK93nbh3TPR/ml2RTKVPYCdyyIZ0rPdfmL/vGwRUni7HR1wxY7/ylnLMmT2qvX7aHNuv19EEnZphj6vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JBb5doAE; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-618b62dba21so4805204a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 03:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755600333; x=1756205133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CzTgDVH+QZ7Kiq60lbhQJSp7V9UuP3VPtTcxTzVGwi8=;
        b=JBb5doAEkc8hHBcww5E3GP60Zt1YvB27wKoqpYS1F8h/78WRqspD3qxbZXftCHdmZc
         NwxAjzuS1eQqCbvuJEXjPfvUZe2WpC5rdvsStpr7N7j29P5faG4LM1A94vyoKP/5MFOP
         svCpiMSw7AnmxiSj3l/5Z2jU+hAcDmdykHQewKvcN1GRr8XJgt7bf/wbfEXYUGA6rGD4
         c4v45E1ftzV6qL1jVVsDFAC6H40ECnEQ4gkt85J0OIXj4qFGxwHT6O6AZx9lCBJ3XgWg
         pOP0HU1+MaRIFHd7+FUOcJnF9bvigrsq4cNZHqJ3UHHPxieHdt1Sp70ANqwk1LUReMld
         nA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755600333; x=1756205133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CzTgDVH+QZ7Kiq60lbhQJSp7V9UuP3VPtTcxTzVGwi8=;
        b=KCgRjtwH4zxL6l8UzkLECHG/YSXklM3AGWE7inMqaKez1TNKApyRTjTzmwafJFLQzJ
         EShv6Gr57zqdiBqHaaP2RXzgkIlyrlaUcqqP6aviG1BkbtMqxPOvkuT+DcrRblriQFXf
         DNVd+mqCch/6PlJir/+tufGVVjNtFpgxH+iTU9VKiBs75kdaSzIIBrkHjq93yTSt6kt4
         YnFky0bQT9lAG1pvnY3tJ+20ZXhoDyNkHYfAAEFjnwnbUtV++dCyYzM+n4trnPQgEJS8
         tGz+96c935GUcoVozVtMfpATFjpZWXZMMtY1WU0XnYIJuTMFMlu5905pjI0jdUfNLdnB
         7Rkw==
X-Forwarded-Encrypted: i=1; AJvYcCV2jqx3//P5Wetj73VREyYJOI3M/hiu0uJSjuUyXJhv5XflaCJyapU7Zc0wShHteDU8KInS6FCHdcAqYm8U@vger.kernel.org
X-Gm-Message-State: AOJu0YzQNuXdwONclaY3DCTzamkxrSc4XEImPt0Zg5t45xueTWUzhh4O
	9OHbuvwkYX/TrhfbT8bt0U3Skq5A348vzOhcvCp5W5j49Yxx71IboNs4L3fV6H6anbg=
X-Gm-Gg: ASbGncv9cRhBOmk+CqTusQJXkQcToCciUisKoMu14EYc1L6T+37eoIuT2HQSiFu05XR
	2kqHDt5vu03DyLw14ri7wHXGSLchLaADyF5PzBjup+mK5l1nEwSlLiIhqYk/a7aSceHqdNj1iIL
	/4ukC5weWJ5WEiEaqlmo145ygV+qkmP3zVtf4x0merzveGtHE3HQ+H92jRcuN8ifI4ZPVyk6pNV
	TORjayM2YoqPbwtVsFDKSpZ8jUqdHWNBqicrLHDA6VmKb92Vq95dheMf4+8R301t5RY/5nj2RBi
	jM5LWb+jiWlZsR/YqnM2GjWVOx/tRQsYxrHyii43QRmKvv+skld/AoNAQRNmtZLfzReXqkc5BkP
	63uu9jAqSQJKYS7PGErtIFk1ztybovaFSlAtBTQ==
X-Google-Smtp-Source: AGHT+IE1IfNii4lYyAmhItgaQj/g69X1RMtfpryZPx9MbrEv2WxcHcjyfwhOTzesYRX/AF41sipqbg==
X-Received: by 2002:a17:907:d7cb:b0:ae0:35fb:5c83 with SMTP id a640c23a62f3a-afddccf2aafmr183951366b.28.1755600333117;
        Tue, 19 Aug 2025 03:45:33 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:db5f:8096:4609:9b24])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a757a48e2sm1469787a12.40.2025.08.19.03.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 03:45:32 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 19 Aug 2025 12:45:20 +0200
Subject: [PATCH 1/4] arm64: dts: qcom: x1e001de-devkit: Fix swapped USB MP
 repeaters
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-x1e80100-fix-usb-mp-repeaters-v1-1-0f8c186458d3@linaro.org>
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

Fixes: d12fbd11c5a3 ("arm64: dts: qcom: x1e001de-devkit: Enable support for both Type-A USB ports")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index 2d9627e6c7983daedba87619ba01074ee22b43c9..a3323d03f644e411c472305f5cf3482ecbdb787c 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -1474,7 +1474,7 @@ &usb_mp_hsphy0 {
 	vdd-supply = <&vreg_l2e_0p8>;
 	vdda12-supply = <&vreg_l3e_1p2>;
 
-	phys = <&eusb6_repeater>;
+	phys = <&eusb3_repeater>;
 
 	status = "okay";
 };
@@ -1483,7 +1483,7 @@ &usb_mp_hsphy1 {
 	vdd-supply = <&vreg_l2e_0p8>;
 	vdda12-supply = <&vreg_l3e_1p2>;
 
-	phys = <&eusb3_repeater>;
+	phys = <&eusb6_repeater>;
 
 	status = "okay";
 };

-- 
2.50.1


