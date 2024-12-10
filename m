Return-Path: <linux-arm-msm+bounces-41244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7249EAB67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 10:09:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F22F166C45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 09:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECACD234982;
	Tue, 10 Dec 2024 09:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ii97IZoP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E8B233D74
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 09:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733821683; cv=none; b=nFUQMCwbjTBhGMzb2UTzHquJW7DrOCZRziVMP8bfTqu+uutQT2zV6mF2TErSHxue2PvbXuRPlQpyJDigE6nVGdmGJQ9S68Qz/I1VWlXvnbLfiQaT4osz+YHuD1lZKtl4AHGMKb9BYKsg2EGs1RhkdxcFCUun9pgMqhjh5B6dMLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733821683; c=relaxed/simple;
	bh=Y9KmvFMm7h6zSTbcHvu1B0oLRXy2REX9xO4r6cEPGwA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kdomDgEyoGkN35sxLqSb2k0vkEN5UDRgNNJtEfF6Y/YXKSpy/JoOudNmeH4z4+axmwcWDrAWsZLcKo6k0HXNcyjwQtLUkAkT3JwP7WSowMjEtBYCoEX51Op2CqTsdt4pIO5Ne2XlnKmbgfki6Lfpod3MKjviwFWXlldhU1wQKrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ii97IZoP; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa67ac42819so364275366b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 01:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733821680; x=1734426480; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MyoiXBcS8+VcZjhs+lgQyARf3lEB8gqLS8pkcTFL7DA=;
        b=Ii97IZoP5/cV/ZCt48g1gLavNGFDFIYZV7ANdrSHA0XJ/I3s6Y6PmI49vz/uKQZeuR
         iSuPJY8nCWD0AP77H/tpkreruEZiwA01Rrf+BbYzbsAzUIgJAk2chdbHNb6aNa8FoeiO
         OfG9Bq8p+KRgPEpPpYjPasEVXCgmC2Mmfo1HppzaQdFDpOMJBjirQvY4INwpJ5CocBMy
         v7gc8XqpIB+Q7/UpLQ/bwrUbUMyNU8yCPdgcjrxNxTq9ZYHdgnWeNZUsHIf/iEUfZPv6
         WvlkCJ0rtxdb2w9KIEdlH06ctjU1+9BRwKiEbDaBtpZ1X2tYBn38KVe4rVN4vPXEapi3
         t/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733821680; x=1734426480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MyoiXBcS8+VcZjhs+lgQyARf3lEB8gqLS8pkcTFL7DA=;
        b=NaPt7gIFGk+ZZt2QfYxRHRNhfyv42893atd0Zh16cpeW8UzM42lDJKvtTU0vKELzZb
         ATzPg1RmeDBsgmPZyidKn2a0TZQCEaCy/YU9lD8uhisUOJP9ub6v1c+U63QXdd+xj5gn
         pR/Dfwxat5j5iOPvdslAQQvUWHFB3sPQt+0lI/9yHKsXFLdEI2CyFXSOJ1r2HrDndthx
         F+KtxoAErUuhCKS7K6h8myGVWRwGdeDo3kSKtjU1hXkaTh0H5M3oFea7nTyWygd4iqg+
         zMcAIciKDeHS4fM88MTbWHUYvVXuBE3o73TLPU5An5bhKF+wVtSNVdOScd4nXOmMfglj
         5M8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZJgoDQMTsXmRuA3Mb0Jy1UZbOP7K4uZW7H+kxOARus+GM0H3Y3zQ40L4eOdm10ZsV2b88SmUkdSsJDU+H@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf9f+zl0o5+WeS47oh579OJQCG/+6pZ/yyETylTaZ83oOpqd2g
	Ja+LT4Xq14a6LlUABYFjd0AE0s8aM+Bcm5AhI/gHEEHgVqA7YMCt8EXOBlDohU8=
X-Gm-Gg: ASbGncvqIS1PN/vox3Qe1W4nZe2ptEkuRhONjPPyo+xSHWYbC8WM0W2AewJMabrdBos
	EWqvPBqFp8qX8DBwSOVROrcCXBBnT/IGZ6xvZpmo7zeLXnZTDd6HQS5Mv73r0A+WYeGwp4RKhh+
	tj+8qRNl1J3XkeXP9nWDY7OAFseNfL5uLCkQjrx1RYvQ27i2c+rtNNpueu6RYHkatls1ZTT7qLD
	gnLQ6fVWtD2zHv0gVW/Yb61gLOsV+xIxN7WMyhDa1ZHBuutcUcIi7npVSvevIDsC5k=
X-Google-Smtp-Source: AGHT+IFKiZiKGcguA1beC6kG/G4fthaKg0JukOyOHOCusTFLNCQzdv/4+xi1m9j4qSeok0fIBDLwRw==
X-Received: by 2002:a17:906:30cf:b0:aa6:800a:128b with SMTP id a640c23a62f3a-aa6800a1bb7mr647510166b.9.1733821680422;
        Tue, 10 Dec 2024 01:08:00 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef40:6709:8d26:5167:3c1d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa699618041sm173148066b.81.2024.12.10.01.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:08:00 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 10 Dec 2024 10:07:38 +0100
Subject: [PATCH 7/8] arm64: dts: qcom: x1e80100-microsoft-romulus: Fix USB
 QMP PHY supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-x1e80100-usb-qmp-supply-fix-v1-7-0adda5d30bbd@linaro.org>
References: <20241210-x1e80100-usb-qmp-supply-fix-v1-0-0adda5d30bbd@linaro.org>
In-Reply-To: <20241210-x1e80100-usb-qmp-supply-fix-v1-0-0adda5d30bbd@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Marc Zyngier <maz@kernel.org>, Xilin Wu <wuxilin123@gmail.com>, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2

On the X1E80100 CRD, &vreg_l3e_1p2 only powers &usb_mp_qmpphy0/1
(i.e. USBSS_3 and USBSS_4). The QMP PHYs for USB_0, USB_1 and USB_2
are actually powered by &vreg_l2j_1p2.

Since x1e80100-microsoft-romulus mostly just mirrors the power supplies
from the x1e80100-crd device tree, assume that the fix also applies here.

Cc: stable@vger.kernel.org
Fixes: 09d77be56093 ("arm64: dts: qcom: Add support for X1-based Surface Laptop 7 devices")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 2236095023a135d8fb1baaede111a34be54d160c..618d73fe3fa94d935f4bfeeb71973b4a2e7ce0cd 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -1322,7 +1322,7 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy {
-	vdda-phy-supply = <&vreg_l3e>;
+	vdda-phy-supply = <&vreg_l2j>;
 	vdda-pll-supply = <&vreg_l1j>;
 
 	status = "okay";
@@ -1354,7 +1354,7 @@ &usb_1_ss1_hsphy {
 };
 
 &usb_1_ss1_qmpphy {
-	vdda-phy-supply = <&vreg_l3e>;
+	vdda-phy-supply = <&vreg_l2j>;
 	vdda-pll-supply = <&vreg_l2d>;
 
 	status = "okay";

-- 
2.47.0


