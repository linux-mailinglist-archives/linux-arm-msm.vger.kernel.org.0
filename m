Return-Path: <linux-arm-msm+bounces-64146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A08AFE3EA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA32F189A086
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 09:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78FC12857D2;
	Wed,  9 Jul 2025 09:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1itLLiXC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF96A284B4F
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 09:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752052726; cv=none; b=s4Hwb9hR7WHjpnHQwzWfjy9Fu81hRPB7FXLuG8knXY2xHo46XFXSAFTvZNX/v+lopTuQ3MvUw+1D/zBAhldwQA2e6p/m+ag7m5jo32THrqX9KL+rYL0dO5QdUWeLvnLXGVeLvr1snljV3tWJAKgDk5V47RDgmsIo0Uk8fNpSmcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752052726; c=relaxed/simple;
	bh=MV3Dv7givJVTh/7aMdoHauUQLRrYUXGf0nE/cB3bHng=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XAUSxXJ2WDOmzSqA2EE89RLqnPAQmfO0sOdXmqPXQn064Z8LrdIjR41C91wZytSZsdhfzRhI4zF/9zGS6buF6HUGDP54pBrl1HRYoCGwnj0fa9XrYDapGN81/1PCT378G1T0ZT3DOA4lgJw7+wuvAKhJTuA8y/lnPSzwlG58XX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1itLLiXC; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae3b37207easo985814866b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 02:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752052721; x=1752657521; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ddjMZCutufz18eoluPVKeaKDVNqg//G7ZHMUNzfUaUQ=;
        b=1itLLiXC+HST0QL0upnH7R2RScphF6d1nbOoj5AoYrc1bW5LpUqRAwS4krDfotJh+U
         f10aVpUO7wiMyt9y4qEOnlAPHr8ydS9QzOzl3uZoQfTHYj4KGmkoeIPrioXqDU7YNXyl
         gdW83KiW0aYABmDTQGurH/vXvDdfScW6qjK6pqb0hNz7ieU1iCjq2rWBOFoJZcWng5zN
         WkO/pVo7xtOeXAo/0uurHU58nLbsY7xe+HxD5jAqAuXibKqNu+Pz+v55ebF6OC5qvSR4
         1fGUVqVU1j89hwYcfRsZ0WcA3AvHW7Z+QOSBH5pDvXKO2ROvCst3oxk55NQfjskeFClv
         GdPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752052721; x=1752657521;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ddjMZCutufz18eoluPVKeaKDVNqg//G7ZHMUNzfUaUQ=;
        b=PL/ltfNz9wMaTFX2zbvKt+EZGLMz8mEPTRtxa1W6aio5nTUycne+eeixulfW1lhLxO
         rKvA7UAMvV1vRjHqDK4tpzYA3IVwyO64iYaZ093+NJkxzyJt0jL8B2gbB33ARETXOB+g
         4HT2Nym8MCfFz+I/tM0RCchDGXxkhNhg3tbVmlwUsv/0e6V20+wDacqPpAZbR9Ua/u74
         fH5HCD25wzktAGNShxa+vCKv2slC4xQZUs3+R7WLhHAtWO/KKH2a0JmkIOaNvam/7K42
         3cTyTytK4L3rcabMnJ3nRh4LMXfhdy23KLmL+9seg9zDQEUAHlNV6Ic0LJGG55U5jN64
         3JDw==
X-Forwarded-Encrypted: i=1; AJvYcCX4u3ouAXYIQxAYZDaMZR1CfUfW/Ozdt7mc0+9CewlA/6sBmVNzTxlNlsdN3dIYiAi9ztew/89FuCo7+duY@vger.kernel.org
X-Gm-Message-State: AOJu0YziFyq2JifW24WxPuoep5qb7czdevxDgJpt4MU4i+YU+VoksHAE
	zcRD1qM1dqFPxvUgIMg4YcbHhqT4r1AU9bzQpJndtosHZtbbmdcc21dyNlU8FyMpNkw=
X-Gm-Gg: ASbGnctEjC7AoKACPKF0anrhdXex8Hgw6JfST0/1iGArG72nX0YnYgBQR02iIqN7VTN
	tPZSP4C2Y3cDOz6nG+clGARARbDMDMcF22ICL2kAk8oaqzQbqjl7BQBf2ATDMI/e57D72SoEzlP
	7jQcSwnli/McrASq32Xhgbjafh9ltLNWCdhmgIlotrAunWuXaX6wEv5negx9KJm6Aw+ZuSZY91r
	NaqiI+QvDkSfBitX6vmx5Q7D0xZ9FV5GCcu0ntiJSiSxJHt3HWnNOJz3M5kvK6CLZSBZmXkjLpm
	aAE0kp/UeHrJqGD7GIS7DaUFn4fF3w1pxUw5OGk1PXRfuwwamzF3XdKCC+nO9E+1/8XCr3SHPyq
	a0Kgc6LhkxrlcXUVsdB4JGmpgBLhr139L
X-Google-Smtp-Source: AGHT+IGK3bAftfEkjpmdqalxkrTWESjz3MCvrr9nzk+X9vGMEXTSCOonJxgJBiArXN52o0c+vXAJuw==
X-Received: by 2002:a17:907:7288:b0:ade:867f:1e9b with SMTP id a640c23a62f3a-ae6cf545dc8mr168060166b.9.1752052721104;
        Wed, 09 Jul 2025 02:18:41 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b5e737sm1060116866b.142.2025.07.09.02.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 02:18:40 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/4] Changes for the eUSB2 PHY on Milos
Date: Wed, 09 Jul 2025 11:18:14 +0200
Message-Id: <20250709-sm7635-eusb-phy-v2-0-4790eeee7ae0@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANYzbmgC/2WNQQ6CMBBFr0Jm7Zi2QFFW3sOwgHaws4A2rRIJ4
 e5WElcu30v++xskikwJ2mKDSAsn9nMGdSrAuH5+ELLNDEqoWmglME2NLmukVxowuBVtOfSDri7
 GjhLyKkQa+X0U711mx+np43ocLPJrf636r7VIFHitbKNJaN0YeRt7jsH5mc7GT9Dt+/4BitOXv
 bIAAAA=
X-Change-ID: 20250620-sm7635-eusb-phy-d3bab648cdf1
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752052719; l=1202;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=MV3Dv7givJVTh/7aMdoHauUQLRrYUXGf0nE/cB3bHng=;
 b=TC3jsdtAaGPDvRxWi6boglngHAlDnksgBGQq8S9tpXg1SjQUdqq4+co+KVLo05+XfgmXWX1Oz
 gTuLU8NPuGJCMRJ3mNYWVqGXOXOuOEAav4nFKT4PSVvhJtoRakiZPKE
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the eUSB2 PHY on Milos and add some driver changes for it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Rebrand SM7635 to Milos as requested: https://lore.kernel.org/linux-arm-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
- Clarify commit message for "Add missing write from init sequence"
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com

---
Luca Weiss (4):
      dt-bindings: usb: qcom,snps-dwc3: Add Milos compatible
      dt-bindings: phy: qcom,snps-eusb2: document the Milos Synopsys eUSB2 PHY
      phy: qcom: phy-qcom-snps-eusb2: Add missing write from init sequence
      phy: qcom: phy-qcom-snps-eusb2: Add extra register write for Milos

 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml      | 3 +++
 drivers/phy/phy-snps-eusb2.c                                   | 9 +++++++++
 3 files changed, 13 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-eusb-phy-d3bab648cdf1

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


