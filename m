Return-Path: <linux-arm-msm+bounces-62361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BE2AE7C79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DFB216A2B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45B682E175E;
	Wed, 25 Jun 2025 09:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="y/cSamu/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C092E11A9
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842913; cv=none; b=nL2Zn31LD+B+Pi7UNfo3b/abMMUIC0oFCyUZCwxjAHGm/Vc+oztgTP4ZYpI3ccXEafJMvpMKrDYSizdse5sNir7eO2Psy/TJibXquTSPwSrGhDX7Bkz84qX8WGcxxGgwWCzggPFGiZa1V0NTnyxLw0/9BJJYyUNgFpcMLVrh924=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842913; c=relaxed/simple;
	bh=aHm0Jgy1AJtO2/QKW2dbDq0Za7rk572Z5sUBzOZUKws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kmTd2azzzofG4vsSenL7bChpZiOAyDbGgp0XDwHDjA8KP4aJEu8hrv7Wh7DJnkvepR6f61fr8C58yt7yXFsziKDw5wPUEZ4eP5mfjw3zLjB8T2LzrSeprGg34P3VanSCdOYjGte6EabImsDxLvlIXlau2EqEgCAjpoeJ3ED9N4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=y/cSamu/; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso2614159a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842908; x=1751447708; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BNbmjsRfs+5MKtBz+Hc1str0LQgPAk3FDVI40gqDF30=;
        b=y/cSamu/KYUC/mwBldPIZMs/t7e/8VV7CjxIT56XLZCPuLx4l7ZAR8dPazZU4xKJF+
         85IhiRlT/K35/RPILhkdJw24hOt647U4fHLQz7dIVOGpo8NIHzIOnboyQFhBTANZ2smP
         MwaPb6beqCWKh2ws5S2OtUYOEIBOmzh03q/pZ0XqRhVrbdPdc41DeUzJ4QFbyMQCvlrS
         knxutuKPrGB9ZL61hWRxRuk/Ih6c1nhjvYVuJWIHL8fUsKU/4OZM9E0tVxFLC9QeHY8q
         ra2XiU6n6WXReyxZdK8FUT1fSkr+ZV5V4yEAUDllDjyuq9XJAyUpyBGxkqzW9OLyjzco
         5zWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842908; x=1751447708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNbmjsRfs+5MKtBz+Hc1str0LQgPAk3FDVI40gqDF30=;
        b=pYNcS4uB3jFEevgJbASONAuG/BZ06fpPuEmUq84imMX0bI67HsJfNxLMYaxVks8fAT
         BGj3LRZxPc7GU5PdWCTmucS/cVBU2l+5rPvxVIRUPt3HvAfByVHeD6cXQnHw9z9q9OJH
         hi19oTngSyVBvJk6OC2dX+T6gAhJCNSW89lT8Ndt8lPyf0LvEtSFRzUdOkLAW0juMRv0
         IZcARwDaixergcOvC3+YFBdx9oitWOJgKTgp8d8nRvmkbPBkPKBSe8rIHvZGa6+XWc+C
         YPFXAuW7avaUbomF+eRSK/ZdJpnoH1EnYJmFRW52MAM9V09hhvD2iHyjSBW1HX5U1QW0
         NvWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnajmlcNV0h8/i4iff+lylFqdUqm48dshDTjQvC/mtjnp4P2NQGUcXeLgXP4x+MuwJ9fsW+nbfdjW5mWba@vger.kernel.org
X-Gm-Message-State: AOJu0YzHhqSTL2AjW76bIZYB7XrqDsK+RdbfBiCHXp4H769cuNTdOtmn
	MKfbwu0uqZHkkGTuSMWqIKDaGEGMMY1J8eJL8I+H8+Hctuat4nZAIfMl1i+90dIcVsg=
X-Gm-Gg: ASbGncvLLbEulj9I2W3SGyem7OxJekmI4ZM/gM7msdGPjrPGx/R7RqXMar+/YcTDJ2z
	ohcA1SPPVjSbYGXDTWhUprz1HmwpZAHaXL7EvM1uM595TxOUUluBFZJRBXr0slmOe8rPkd7c2tp
	98SD5RRTEpyRT3KVGGvor88gm2BES0Z80kqIfBDi0p+Aeg06zYaYFM9cZ6csABdDv+GCCciy6NY
	jzbN1OLcFNTYM6EwiJg6wRTo86wWHhrzrSZKTXKGPkroz9Fv3XL1horIMVOyBy7NzHxkTvbQmy5
	T7cRGsM3/L3gq1NHftxHHp3A3sTwdlBwEtOHn6533ikq6EYEJ2I6lqVNiR4Y8N8/EtmKhQFgYS9
	4vGQL8cHLIBTz8Xz5DEPbEAJPzDsYH5+H
X-Google-Smtp-Source: AGHT+IG57CJz1isUSxtWVBBEYQRRLDGKKU4vhjDr8x5m4ljvRrFsAIMJQ9U4pd0h5IliaKEAweVcYw==
X-Received: by 2002:a17:907:9085:b0:adb:41e4:8c73 with SMTP id a640c23a62f3a-ae0bf216613mr160528566b.55.1750842908235;
        Wed, 25 Jun 2025 02:15:08 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ee4c2bsm1008972266b.71.2025.06.25.02.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:15:07 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:14:58 +0200
Subject: [PATCH 3/4] dt-bindings: phy: qcom,snps-eusb2-repeater: Add
 compatible for PMIV0104
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-eusb-repeater-v1-3-19d85541eb4c@fairphone.com>
References: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
In-Reply-To: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842904; l=892;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=aHm0Jgy1AJtO2/QKW2dbDq0Za7rk572Z5sUBzOZUKws=;
 b=VoHPW5DMLvNPMM6DDkiYwX+LlqHDBFUGbIVQ1Nh8rd4tWymfU9M9U6C73Yan+YQLqkLap3kKf
 I7X99swY3UvB8Zq+wjtFZbCPYxBkueCtQoSzMtpo3vM+aIUkFEJTORx
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a dt-bindings compatible string for the Qualcomm's PMIV0104 PMIC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
index 6bfd11657e2992735998063b3ca390e04a03930d..5bf0d6c9c0256300d00f84307b7f6ccf669f17c4 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
@@ -22,6 +22,7 @@ properties:
           - const: qcom,pm8550b-eusb2-repeater
       - enum:
           - qcom,pm8550b-eusb2-repeater
+          - qcom,pmiv0104-eusb2-repeater
           - qcom,smb2360-eusb2-repeater
 
   reg:

-- 
2.50.0


