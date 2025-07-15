Return-Path: <linux-arm-msm+bounces-64948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06591B05339
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 09:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E152B17EB8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 07:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1281F274B3D;
	Tue, 15 Jul 2025 07:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="E6ZPNxYU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AC6274670
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 07:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752564590; cv=none; b=O5oaAA0gxNoPwBlcgSylZfzr6q2gJ9eIIT2f1FBXWV9iSQAJIxV7TkSlOjhaCMbt890qIpPqOsrt9kkMefd2wMrB49nYkoWf65311dqRIHqWuLP2sfUPz2rDoXv2KWtaktso7raa/aNpsMFZD0Gp5SrwKeVG4X+H9m83ZG48o60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752564590; c=relaxed/simple;
	bh=fbYN3aPb3XXCiKQcnuxlj3EeuZKZPuonSYvZ100x1TE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OCu8SKGlsFQwNGFBP0AdAqGbKU1VX+CKzfpBjs0k1vgPKRYnv9XDbwDUb3zecnfIdkF8E1OiGb2znKRfBjtNKefIJLmsRGIZQgRJstxyMQWDVt4HNkw4L/LDC26KujXsT7Eo+dSR06Gba3qnM2EQVHT1FTOWNT8gdFkCGyDcoxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=E6ZPNxYU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451d3f72391so50347795e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 00:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752564587; x=1753169387; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f6fKdp/I3oAtJ41AZWsqTeQzY0qXnxN3fwHvXO8WXa4=;
        b=E6ZPNxYUQZEUp2kfYTVx+u++gszDAwN5h1/4yViI0XrX9W+5a4cREaW3fzw/DlDexa
         ms5ooQ43n+UohTJTeNd7TBZNxrSAxHeaSazntEJTdJAbx3fuK+C1nk2YOv+nM/6BcvA4
         g6HCwh4iRCPOLo3TnornCSWtFYe3FW+4elQK8hz+dfeB+3cn0mJSWDfw1lZgOIE0047u
         pCS6C4SS1agIVmKUjjbUbNAfk/f9znMXO+HR+MyM9qayEEvT/9yBJbzF+dxjXm/DX/vn
         dQ4/hKbsiCs2jw304NcvXNBT51NeWdCF8KYfxiPAUOGTSOB919Z6rPN5wtyHjNxM7PB9
         1Vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752564587; x=1753169387;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6fKdp/I3oAtJ41AZWsqTeQzY0qXnxN3fwHvXO8WXa4=;
        b=b6UwiWebLskZ2ISQsSecyGO2du8IhOmPK6/SMBSoMR90whiZbi1bjMEf+AZOil5cNY
         vo9IBDzgoLnGlIG5m8kR0uZ5tSQzhKG9ksTFfb/xstKaZ5KoumullFA3bir0hTKt1+5H
         lWARDYcQBeCs5XZZwsM5KtAgLjqbSUrUtc2oGNzKggjTcIEmr6HdgTlwyj2daArAN3kx
         osJzNx9M8oLjKvwbY1174jv5UUjcubjcoDrEGLLSKuweqKjgPgZXDLbY+UG+BY6huIrk
         Kg9xHeKY7Nt7bmQyn7mCWjwWUXEkYKT7C70xaX8RzGXEhSVMPP9UZVlPMBzNfEjSYhLQ
         c3Jw==
X-Forwarded-Encrypted: i=1; AJvYcCVhYh7bOFX9OGNMUPq7bK96vkvEwEI5FfSTGxKxow7OAkBgoM6oLBxbzoVNttLSBw8Z3Fzw+/Equ45GB5iC@vger.kernel.org
X-Gm-Message-State: AOJu0YyXFyifZWzyOlsmb6mrBLNtS5DrbQSiT21tVZEPJGVwl2/mKVEq
	q9HReA8yb3X31fzFjrVDB+zBAxd74hITMbHUKjdaNcWeTl41jFt4IVh21sIGS884HJL+VT7f4Ge
	Kzolw
X-Gm-Gg: ASbGncsPzfMVF7MOT7GBfV6mhsjqoOGQZxzAlxTqstdLMOxsrBj8kIna++JyxHZis5A
	sQLUJDGO5GhE7Lp1xDEAbsFj8eHQDWu2KHli3FLmfzTHOsQKjH5is7FcczwfWcHBQ9ft0QvkDXo
	+97jsqqUZrvlIClsCIxZG6wbKaO/NOoRpIXpHs7WUlQmPk0V2brD1jqDHcVxe2GMwPS7iXgVVoE
	z6+tcELI4HX8uYaCuTHQV5P3/o0aHccYjQBZPvLtVxHT39cLu6vYHpI81NBHrw2nfMCkifRndJQ
	GX6fWv0AmkwTu4i33WzuSWsf7PWwXF+5dXSm6z88D0DCLSos4KUqen2RY0v9my4/r08yc6mmmze
	X9m9SLCbU1yu2D3CtaljY5MQ3j21I7Ddvx+i7n5LYaSL8700a2yvnPtEn
X-Google-Smtp-Source: AGHT+IGG5/C3xBwiXlZfBkTPzKSCxIpXMT5JelM0B6XvmfLgCo3iFhVlka1xI/0VqzDpufUqJcL89w==
X-Received: by 2002:a05:600c:350f:b0:456:11a6:a511 with SMTP id 5b1f17b1804b1-45611a6a7e3mr67459555e9.20.1752564586974;
        Tue, 15 Jul 2025 00:29:46 -0700 (PDT)
Received: from otso.local (212095005088.public.telering.at. [212.95.5.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-455f8fc5a01sm106703395e9.32.2025.07.15.00.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 00:29:45 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/4] Changes for the eUSB2 PHY on Milos
Date: Tue, 15 Jul 2025 09:29:33 +0200
Message-Id: <20250715-sm7635-eusb-phy-v3-0-6c3224085eb6@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF0DdmgC/2XNwQ6DIAyA4VcxnMdSUGF62nssOyDUwUExsJEZ4
 7sPTZYls7e/Sb8uJGJwGElbLCRgctH5MUd5Koi2anwgdSY34cBrEBxoHKQoa4qv2NHJztSUnep
 EddGmZyRfTQF7997F2z23dfHpw7w/SGzbfq36YCVGgTaVkQJBCKnZtVcuTNaPeNZ+IJuX+M+Q0
 BwNno1KNoB5pEL4N9Z1/QBi9jRk9gAAAA==
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752564584; l=1471;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=fbYN3aPb3XXCiKQcnuxlj3EeuZKZPuonSYvZ100x1TE=;
 b=Rjj/7cfLdOoBVZeq1Uex30CfHl4mVnyxTojkjaBXB3wvxI+1Sg0gPtk3KypHpCgYRDpZMiCTv
 fBxKY9XYn3nBqH3/pWsaQOIzRV1+9BRmnl1PtkcifgHnhb/tPXnWY7h
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the eUSB2 PHY on Milos and add some driver changes for it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Make "extra register write" commit unconditional for all targets,
  write the register directly as per Konrad's suggestion
- Pick up tags
- Link to v2: https://lore.kernel.org/r/20250709-sm7635-eusb-phy-v2-0-4790eeee7ae0@fairphone.com

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
      phy: qcom: phy-qcom-snps-eusb2: Update init sequence per HPG 1.0.2

 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml      | 3 +++
 drivers/phy/phy-snps-eusb2.c                                   | 5 ++++-
 3 files changed, 8 insertions(+), 1 deletion(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-eusb-phy-d3bab648cdf1

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


