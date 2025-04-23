Return-Path: <linux-arm-msm+bounces-55079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DF1A9810A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 09:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 612C93B1359
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 07:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689E6274649;
	Wed, 23 Apr 2025 07:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x0z52FoP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE65726B2DC
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 07:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745393442; cv=none; b=Phbm4RReFMA7cFimEogTDuaI0gmbMf5sH9VSnli8FyuhbVkdfWVRc/P9LwWKlsREQbZtuqhaOapjwVCfqzmMTNDs8LPVbTG/ID4HgKxSv0bPwZqySoFBKiNJCYyetLVNz8xmefZsc+7uSMP9P68JmNLcPtJkRhimRZUFJqJ0t04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745393442; c=relaxed/simple;
	bh=RnLVNTomoaoA0GKAFcSpwz9U3Q5q3LRauTcFWCoJCig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E/aknQTBH5xTUotX24y1XYN5ZS8nbO/2HQEsCd32F/s1Dj4hPjcAIg77HOEjhwTchqu2eRqiD2IBBWqE/VE0dRYlTojwAtBAncb2pEqkT9iWyqS/5Tq5Sj5ly7Kmz5zxO4piKF1hpxh7/ThBZkSGHBaLF2hX/LamvxBcnAbok4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x0z52FoP; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so3792474f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 00:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745393438; x=1745998238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aw90kBhonzt0etQPaYxZ0xyZQADb6qJo1Aqd5nSon8w=;
        b=x0z52FoPxET3ef8Rsdm8vGx6dJT4hZIsPWC4taDnfzIZeGGxmRIWMwbbx1tydtEfOz
         WjVfbJA07GqDjKdOKct4k8gqXelGLlo1LpyLcCgADwNrVMyTEDMh5tVXip+9gStRrusb
         fXOZZb78Sz69xoLRi6kK545VvH3xKacTv3f4dnZ824UODWbzXHaqTNWweUe+/KuAg79w
         wk5KkiuCKLZp1YSO+0e4WoH7MMyZstGDx7vTrU527EG5d1Ue564iKMwsrRT/IMFuAB+M
         00EwLVHxMdWGW4LKKHhT3SJRP/BjGyySkvMeOV9Vn0lZNNEUwFYjhsYMQ9v/V/eEajpX
         5A/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745393438; x=1745998238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aw90kBhonzt0etQPaYxZ0xyZQADb6qJo1Aqd5nSon8w=;
        b=ty0BAK2vdJcYxySg85bYENlRFtPTj3EFyF3YPxML9OvDhg61EoGkr/e2og/36Dtirh
         8UuFEeuDc+sb4v2+VkA5U4jWAm9615IDhwQ6y9bxw4UuhwRGUsQguWW9wE2kRVre737+
         VubUXVC2/QScLAd0f1lyVDg5p8WfB71VlZwYazVOIWWEyXMTYMOZWfJOTBUlRrlBSxWk
         dUxUMadaFFP53Cz1Yxsf9PthINT0HjkzV/2p9quVlt1A2FmfN/hlVTTThb03ajvbOQDk
         5X4TJx6wcvJRz6eUkm8LzcJFMvExSFY8u2Au/1BsYlsFM2g8Ouzav5nKkkfMmMcw610O
         /CaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwq8FD4YwnDJwCfG+xh6XhiKzhvTibheinHISsuv+0tOHSdaFt9xIc873jhIpY6i3OL5HFzIrSNdAnDtOL@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Vdf+pQzi/dO/OCuPiZ3V0ADNmPhEPp0Vlzw+t3e8HJNP+TpM
	I2N8GRarB9gVuyKzNoKLm3s5q+AGASoqYqzbiDYt89ASu67MOWADoggDmTTPnyw=
X-Gm-Gg: ASbGnctEB8JRzYyFhAuBVXsl5PtAx1g5i6+qCoFh6QkRdX7kUkOyg9xv/iJuR1cCFlw
	slRtNL4vbENuZzqCWgk1T0R81dPOWtJtbQtjQW6to3NTRkNWUqA6F8KSQMUYNAIBY9/xetrk65Q
	pUQXu266PA9i1mO0qJ33Skuzw6XhxdxJlvd/eOlWOkB7xVtd96RmbhsI8853koJ2KlYHTiCqqCP
	PXxtmxk6S2t1i+sforq9OjE4gagWL7vd+1Eh64Q/EFE0uvBmEshNc8bhJJJP/9xia1NSoNaRFxQ
	B2AD9rtX1lBSaIcCBIN3ycPHu36/z709N9fsNlZphW6ojj1Hr6bhCLo=
X-Google-Smtp-Source: AGHT+IFcdiZukzdWt+N7jGpyVttEY2AZ2bkU0KD8aSTOXRWRwbpjuOWS+5eqy6YaGVuCLbhK04RUNA==
X-Received: by 2002:a5d:59ab:0:b0:38d:d701:419c with SMTP id ffacd0b85a97d-39efbace33fmr13697317f8f.41.1745393438070;
        Wed, 23 Apr 2025 00:30:38 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:67a8:3ed8:e19f:5eaa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493115sm17761699f8f.78.2025.04.23.00.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:30:37 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 23 Apr 2025 09:30:08 +0200
Subject: [PATCH 2/6] arm64: dts: qcom: x1e001de-devkit: Fix vreg_l2j_1p2
 voltage
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-x1e-vreg-l2j-voltage-v1-2-24b6a2043025@linaro.org>
References: <20250423-x1e-vreg-l2j-voltage-v1-0-24b6a2043025@linaro.org>
In-Reply-To: <20250423-x1e-vreg-l2j-voltage-v1-0-24b6a2043025@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Marc Zyngier <maz@kernel.org>, 
 Xilin Wu <wuxilin123@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2

In the ACPI DSDT table, PPP_RESOURCE_ID_LDO2_J is configured with 1256000
uV instead of the 1200000 uV we have currently in the device tree. Use the
same for consistency and correctness.

Cc: stable@vger.kernel.org
Fixes: 7b8a31e82b87 ("arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for Windows")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index 74911861a3bf2606add8cf4aaa3816542e837513..4693e4c9986a6f7d14282fabd584cc16f43f0f80 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -747,8 +747,8 @@ vreg_l1j_0p8: ldo1 {
 
 		vreg_l2j_1p2: ldo2 {
 			regulator-name = "vreg_l2j_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
+			regulator-min-microvolt = <1256000>;
+			regulator-max-microvolt = <1256000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 

-- 
2.47.2


