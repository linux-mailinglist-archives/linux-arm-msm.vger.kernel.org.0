Return-Path: <linux-arm-msm+bounces-62354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E35FFAE7C5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:21:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20EC84A4935
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C2E29DB99;
	Wed, 25 Jun 2025 09:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1GjBIvz3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA41529E106
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842885; cv=none; b=EvfYEuuSVzazuA0iz4fEjVRtpN3DXCbK3hDppekQCZmHXcUnPRhbc1sCgi9pKOe0UuaYqJu1FcedqnZ6lef8F5MLHaETrXAWOvNcNvw2JBqjbvHA3w4cBGqXDjQyGBv5CgOLi0PybZpjgEemr43eNh+GFtSe2d6VSeJZq04wWf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842885; c=relaxed/simple;
	bh=HKY7AzgHHOMUKSqDSyXSmqFr6rS8cg0ALPFDJvvYf80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Miu3tIBuwPkW6lRoM5GbQJA3/nljpzX4msxf5JlvvNofZC21hcK032P+FoVrj3Z/seiEwDobAk0DjVGYWHbYkkLOICCV5K03leT/NPdlKjQR8I4BuiWza82MomVo9iVSbzZKVII9QJghwtFLL5mg95xOOgnRrIMtXCk2ryVZrVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1GjBIvz3; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae0c571f137so75171266b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842881; x=1751447681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eaodSZscksOv8tm14xnsYu3NQ9jnag2C5XRSXbuw1WQ=;
        b=1GjBIvz36b1r+IthEhw8y67JdzzAB9NTRvfVnbimVWoJelvUV7/9GcBb1tIGAbsxvB
         TnqrQYRZOfNGqpwmiSRSOnJefcmVH/YPy1Nk748GZY8s1U8Q5ESdFR5VT1Gyt7MenqjO
         knhfiP1W/PogDdJG9MQn+Uo1kK/MtkXX+oaXbFu0HoEab+PSQqDN4JpruzTEMfBPHgDK
         CJ7+ZFOKl1gc5m4RNFUfEHG7LEaK9CRq46Ew666CpwPakB+fQ6s1tVP1bjXnDwBPA86/
         2rtmVAt3dLpskSGFrAFi7BlLBpPmVzldClCsYiIwDvk1eLSx2qCGQy3BwSLYOgcBBJsd
         CzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842881; x=1751447681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eaodSZscksOv8tm14xnsYu3NQ9jnag2C5XRSXbuw1WQ=;
        b=VKDBOgHSI5E/kHuEzF+hBG3jq6kIVtd2Wa3lggf54a8rZ9sR49h0twJR6sY6kSH9/7
         339ZcP4GDQFSy3hyUOaB11P9eQZ5+Hga4+oO2/zSjEucRLaQHnbAwin6VG4AzEhjd2QH
         6sHwwBRFrNw5gB8I3eGEYZB6rS8Jl+UG9YWI/4LgVsZB7DiqcUU7UrBUfprsWOUX85VA
         vze6iGtUFCkVX1LkrzU1I3xOebfZn8RcUQH/tflmyF5u/Ov92gniyXcTp13DUZeTv1jB
         5F+D8fBeKOnaducFahf66kmT3f4WFg0bX/Ed1i7KvP3EmVYdqHngY7F0xBpAp1ABcuLK
         zk8w==
X-Forwarded-Encrypted: i=1; AJvYcCX+uhuJ84y6b5nRF8UkuwBYJC4I6r9Gi6BCLCaIsgBDRgMLMmS2ydlYRUJnlCnC4DCQhIZpPQgNdoGDRAGe@vger.kernel.org
X-Gm-Message-State: AOJu0YwDfpON3CoHjsP8JVZl+kzLHvmIkfQY2Dysl/RMj/NoH4lDGDg/
	E1cXGfeIXtQjtbRF0mA4NpYdDJyDlpYNGdObXGcj0fCY7zvnUdE5YlfD/SPqShta+HU=
X-Gm-Gg: ASbGncsm9FLy7Y+XGflBLXx/TBcCO7uYak9zrRhjgvk4ClqI1aC6pDVzWox7vduYqWi
	qsfU0pLQF6kbBhenggBsT0hS0w3VBNQ0UkuZ8PevTFMIOGkE/GeBpJSGJecHHAvrrtChRGKHd0S
	/yyNpVp35rvzrWavQLslUq2aMc9sI0U8mrd1+5qLietfe2aje0CPxx9pK2OwI60dwp5tjT44v96
	ed6v0JWcUNFcs7aniWzxfrEYshrd+c4kbNpB48zZ/67BYOjid6fiZZmXkFhBZeS/x8qH5o73eZu
	29Isdx63AeJZcEm7yYDBh7zIqX9OYFiYs6g3NKoFHd9hB+k4XD5gEexTGiYmBOvCXD72BLg9/41
	iwuUgHSl9dOofdYxYIIYo/puaS4xSdf1B
X-Google-Smtp-Source: AGHT+IFunGF+TjIwhPwj7Rlya0zRP0lHBHlNUL1mjavzGDv/ErrwypExO8gGDjyrAhjbat4NdQqScg==
X-Received: by 2002:a17:907:94cf:b0:ad8:9257:5735 with SMTP id a640c23a62f3a-ae0befdd107mr232454866b.3.1750842880971;
        Wed, 25 Jun 2025 02:14:40 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054083c95sm1021480166b.91.2025.06.25.02.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:14:40 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:14:30 +0200
Subject: [PATCH 2/4] dt-bindings: phy: qcom,snps-eusb2: document the SM7635
 Synopsys eUSB2 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-eusb-phy-v1-2-94d76e0667c1@fairphone.com>
References: <20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com>
In-Reply-To: <20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842877; l=978;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=HKY7AzgHHOMUKSqDSyXSmqFr6rS8cg0ALPFDJvvYf80=;
 b=pP28XPa6bi+AGmir1JGO84WkB42ZjM3elJtM0fuLH4V4x+sBvSLyjs+iDvGCt1Ejj0fMGiu/F
 6MUAWaZpQkqAycz3ZyI0H9Xi+Fgd3En7swav7XUkjWFIENM9Kb6pWsQ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Synopsys eUSB2 PHY on the SM7635 Platform by using the
SM8550 as fallback.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index 142b3c8839d62d91377061ade3a7c400eb970609..478d6e315a4f19d624af28710eed676bbaa144e7 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - qcom,sar2130p-snps-eusb2-phy
               - qcom,sdx75-snps-eusb2-phy
+              - qcom,sm7635-snps-eusb2-phy
               - qcom,sm8650-snps-eusb2-phy
               - qcom,x1e80100-snps-eusb2-phy
           - const: qcom,sm8550-snps-eusb2-phy

-- 
2.50.0


