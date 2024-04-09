Return-Path: <linux-arm-msm+bounces-16919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA4489DC44
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 16:29:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89728B27ED4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 14:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195771311B6;
	Tue,  9 Apr 2024 14:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N8+vHTSr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446AB130A61
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 14:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712672901; cv=none; b=WlpliA7BPfYKtxIFLlh2JrH8qTbqhetL+bgt98BQSYAK01gkIHZ9/UyVaKD28Rh27I321CJErBTgkfUiffy/T+LcwTKHD/VDm0B2gva7OOoqfm+0bSqjy2yU0V1lIcPIvfp0FAnmFNurUxjciG5+btfhtA9uZZ6QxOHFJ6aLw3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712672901; c=relaxed/simple;
	bh=Ert28OT3aAf58lII8YJfBxuxx9CsXW8kB9StD1Pp5Qs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q5Jl5+DwWCiFIkc+niDM3ZPG9+RhetpEmbZmqE7UA/0HS6f6V2aDKsfLyqfmGYp1dTq1rY9K5lXB2KDRy5h664geBVKhdy7k+SbeNdzXA/yEWwN2hc5Ek2TEwUIhABPGpnvZB9M8dPfaHQsA7m92vQU5vmAcj5lX0rRXFtie0ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N8+vHTSr; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d87660d5dbso35199321fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 07:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712672897; x=1713277697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XwnaaipznVoDEcKs4Me335T76hxHxjEZxfF+WyLdSeU=;
        b=N8+vHTSr63yDYo+jvBDaX6RVzetgd+Pzdwnwf6vo5GSHUbMBAjcZaxyAYOkKbzUt7k
         g5sc2PpTE65/Wtkx2Vh9VHs81SY3XqAEafteC6C7aRr63IfIyZCWm+s0u2lUjS9mC/ZD
         0p+G4kJ4E5yhSsslwMABB7RsaxxsPyDBIyxWuFRUVyUp+NiGvnZ89hAjbKtxLCnTTMS4
         Uw6tZzFqJlL2JlHNeTSXpj5qmcvplQ45GEHTVAu7kr6WtaF1DC9n60B5ZOdfnTk72Qnm
         6UHbm49HlG26I5cZTrRLSYpgGjFZ7rh3/Nl+mF2b7KtgFfxC6J+8jqU9h/UPsDKvFm6J
         KSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712672897; x=1713277697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XwnaaipznVoDEcKs4Me335T76hxHxjEZxfF+WyLdSeU=;
        b=CnN2D0+3zWMH29RQjqG079g/sMT49K4A+RQbfSotIzWEYciZ/TU4OwGdufEheOyxw5
         kwgx1Bn85Lt30HO47g9vic36pHd6sAHRcd17IE3BEFoyItdWnZ5VsGRSG0rrnGtDUYQx
         /En3iMdYBdij+V/oyrUUSsJfBIvnqdsdr62bBDPAK0vImuRwrgurTtc9B6QwZr90Qjus
         NVYc91uv9cGJuqKbUuD3MjPZLaYy8BGaGQw2g6lMHmJNSZYLseeReI3+cAgY0etRGhin
         vXQQRTY8GgqgGI5mmGjrlbvOgxogc3VrxTy84v3uTKhsKOXrUayHkpM2pDotraQdSV2U
         i90A==
X-Gm-Message-State: AOJu0YxTipo0RR2bssz5AJkBmbLDV4o16WpCZcmZXn44/MINVhxsiCHu
	SywR5j+89IFn8g6aj9FG8lm1ucpmz7GInPPSWyVW+j/r6gWOVTd2/YQcmtNMdtRHC8StvSKNPCa
	B
X-Google-Smtp-Source: AGHT+IGa7M3AfjQb5yabZc3MePcuVx+j8sF0rJqQuNPmrT/zl4jukqtLzKF2SK1xHwgXaDBWO2dHuA==
X-Received: by 2002:a19:750b:0:b0:516:d471:18a0 with SMTP id y11-20020a19750b000000b00516d47118a0mr7132030lfe.67.1712672897123;
        Tue, 09 Apr 2024 07:28:17 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d9-20020ac25ec9000000b00515d2ee5b38sm1556445lfq.48.2024.04.09.07.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 07:28:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 09 Apr 2024 17:28:15 +0300
Subject: [PATCH v2 5/5] arm64: dts: qcom: sc8180x-lenovo-flex-5g: add USB-C
 orientation GPIOs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240409-hdk-orientation-gpios-v2-5-658efd993987@linaro.org>
References: <20240409-hdk-orientation-gpios-v2-0-658efd993987@linaro.org>
In-Reply-To: <20240409-hdk-orientation-gpios-v2-0-658efd993987@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=832;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Ert28OT3aAf58lII8YJfBxuxx9CsXW8kB9StD1Pp5Qs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmFVB8HxL0CEq+ZBrZZ9yNuRSbPD/diMWSYCHdF
 DMI5Bz1LxSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhVQfAAKCRCLPIo+Aiko
 1egBB/9cfBf+sbB5WA1+SEGcnfUuRfGkbcCVokMfMMvS4FgW5yXoqja8JxOgNTn+9xUhTMxD/wj
 8b+YY386hhh0tN8JQRvqbOH2KqcTCiW9QMrZjEeDXsrLJlQ0H6ueitAI+xZe0HziTQBpjS8VxfQ
 kXXJKrg6FEYJS4YiaqDEUAFXKihzYbMAuf3Y2s443l2mM0vXQwA2NnilYLG76Hf88wCLzV7O1UB
 jEK6zJtC/teY53b15cNQcbHRtqiESLEiImKjOtPV5jDEK8zYNQaLiTdoQSVuyPM+jVjru0TZytJ
 ZxAgAWBfHT0M70vfWKJC7FSIbOo6T1Jk0orrd+4qV5W7x3E3
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Define the USB-C orientation GPIOs so that the USB-C ports orientation
is known without having to resort to the altmode notifications.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index 6f2e1c732ed3..6af99116c715 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -51,6 +51,8 @@ pmic-glink {
 
 		#address-cells = <1>;
 		#size-cells = <0>;
+		orientation-gpios = <&tlmm 38 GPIO_ACTIVE_HIGH>,
+				    <&tlmm 58 GPIO_ACTIVE_HIGH>;
 
 		connector@0 {
 			compatible = "usb-c-connector";

-- 
2.39.2


