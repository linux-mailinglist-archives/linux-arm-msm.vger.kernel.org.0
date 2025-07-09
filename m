Return-Path: <linux-arm-msm+bounces-64211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D4FAFE79B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 13:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE32F485973
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F082D4B6F;
	Wed,  9 Jul 2025 11:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="04dw6U7E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818A323C4FC
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 11:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752060162; cv=none; b=ZSXDs1ibuUnqB2LY9G2X0vHm0hclO8grL5DOQMrlpbZQm51vxbNDRsM8s6gksV6GtW+LDszaVd3bT38mCwjWLGLIMNvhNV8VfW0NR6+egQsV48pqEcsTFhDQYc5QkJPRM9n9cB/u1puqkKhW4nnvJTc2Sl8wK4OpSzINqw3zhgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752060162; c=relaxed/simple;
	bh=v8W3GINcz/JRFuzQFTXnjEqR4QhQwIRLE6x327OiNU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cEvof7bS0/ds871JzRmzfhSA4046bCzQDBro+k2zWY2R5Da46bTd1UjcQO0vRUoAS5lSnhCAB8BzPJC2Wl/5TDxRbkNasDA6Fz85IN6BPJpojnT/woFccfJF0Rdrfi9+IOD3i29a+jDl9htGTu0A7DMvDm8XlMBrM3GfeqtlzAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=04dw6U7E; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae0de0c03e9so932815466b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 04:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752060158; x=1752664958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4dOumLNf2zlAbgSAyMPBNKWH+vCfQ2X+/X62wCBIXk=;
        b=04dw6U7Ek5LafvOGTqY0m78dHoV9wA1VGICE/nKznHED4BeJFMVmQLtrFoWgCleQgf
         7/VWIGFQsDy6+fVmn4nxdXklMjHnon6xqNc1A5nah/broM73B957q0XCooLAmkQ6bE28
         2DzHmqba0pGXDRNFRhUotZ8SvB0EK8QUfHyMfEAqkyMevdr+FaJJUXzp1fEDKLrie0ch
         QxK4WJj+lBVpS1MAoWSIHF4mwX5MlgcZRKKCn9GDacyzHg4b8b9TvG17aNTSl5t7kngZ
         5O2xf9Em9fBDcHyNuhu/3bseXRrnvxlvSMSMpAKchsECGyi5LY0wIRgXvMz8Xmv2S5hg
         xcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752060158; x=1752664958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4dOumLNf2zlAbgSAyMPBNKWH+vCfQ2X+/X62wCBIXk=;
        b=A2LmMBAm8eQTfIWVoDYwZ+ZnfPfcbwJBVwlmHn6tROy/z9jqj8YyyORZ7kabJO+SJw
         9poZTjYtZx6QkPGZYppcF0H25doMOdLVjEyg9QGEG6W5y/mIcXR8PRxmLXFDJZyFync5
         8Nayu6SVP5VJYGMQgiUuOe9tYsjV9n8mLo/b/VtS6aSHs6/dz8khZ+wel/kYLfZvldCt
         9pX4CXJipOzQoxFNpFMZyKTkRAxvbiZruelV8mtMA2dZB/i/RB0X4dYrN9HrgrDv4Xsm
         ETyoAVYBem5uoQ8/Og/ec78LGsREtc3FBwDaFcip8WiCNuhtxW4FchjH2sPfc2Dheq2J
         bPdw==
X-Forwarded-Encrypted: i=1; AJvYcCUQeO5hFNiVMP17PpKi73c2rvbWEdie4LmIsVlhCVaV8JiWdqvpexqqz0wH1RZPdAMFQ+hWpaGtp30b6I/F@vger.kernel.org
X-Gm-Message-State: AOJu0YzVGhvIiQOfHZO7bIJ9cPi5dEaT+cgJHYI292+deGvtRcni63Al
	kNIGuQL/VMa1Mml55Bvu3WaMac7jCgI8NBhw+/aM0Dwf9r10wpT/8KrS6kJ3VHbhFnY=
X-Gm-Gg: ASbGncu5hwPUpqvgvv47tTCnh6zkhOD0+fDhhkKbnNAFJMgovvetmGbzZBCWeaCyZmp
	Ip1xjeSyhOPjBKSHWjQtaXyE9/ZZaPhxBFcYnIx5kLxfOb9ROW7fdrmMuYBwaGR4codJYOB+r2M
	ZhipupmDPKWU2WazraM+aEagAWtncJTNw4VR26u8AZ/W9Ki6plaF41DYkCvvResy5yDGtARdayU
	kW58rTcCCl49EX+ZNddYEImaENlHaf/ArGobWPdFYWXZ7s1qq1Lb6Ts5nCEYjlIlDVP7jxcNIDi
	bgB0MZxgDAasF+RYU5b+6G3cnF4pzWQUVzZ4PbGhXV5hLkGt3Iegtl4kWUHC9r7ZtzMlo2nFsOy
	hL43Y6/+BGPiYU43iii9C0Yt7a4OV2Ku7
X-Google-Smtp-Source: AGHT+IH9vnwKDQS5PWwwot23KnBBMguALefUJ1bpdte4R5ZQwSrr0oNdJ1eGm7MuBqcVRYX5nvBBlQ==
X-Received: by 2002:a17:907:7e89:b0:ae6:abe9:8cbc with SMTP id a640c23a62f3a-ae6cf58d2b7mr206062666b.12.1752060157745;
        Wed, 09 Jul 2025 04:22:37 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d93basm1079861066b.4.2025.07.09.04.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 04:22:37 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 13:22:26 +0200
Subject: [PATCH v2 1/4] dt-bindings: mfd: qcom,spmi-pmic: Document PMIV0104
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-pmiv0104-v2-1-ebf18895edd6@fairphone.com>
References: <20250709-sm7635-pmiv0104-v2-0-ebf18895edd6@fairphone.com>
In-Reply-To: <20250709-sm7635-pmiv0104-v2-0-ebf18895edd6@fairphone.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752060155; l=892;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=v8W3GINcz/JRFuzQFTXnjEqR4QhQwIRLE6x327OiNU4=;
 b=Otrw6GqfkCGtNrkH58EJ4GUrammLwH2oknPOBewjtua7t9KC5rGMlkhlpPhzPUwHFelgxeMT3
 +qMFSSdu4mSD2v5n3Q0vKlNgtFDFVb2k3tYJ5KIh+u+xDXf114lit1D
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the PMIV0104 PMIC which is found on e.g. boards with Milos SoCs.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 078a6886f8b1e9ceb2187e988ce7c9514ff6dc2c..c416f25c90d6d9f8404947d1fadef91cf664e666 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -84,6 +84,7 @@ properties:
           - qcom,pmi8994
           - qcom,pmi8998
           - qcom,pmih0108
+          - qcom,pmiv0104
           - qcom,pmk8002
           - qcom,pmk8350
           - qcom,pmk8550

-- 
2.50.0


