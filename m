Return-Path: <linux-arm-msm+bounces-61544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0448ADC4AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 10:26:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 622C4161422
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 08:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87268CA6F;
	Tue, 17 Jun 2025 08:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="SR34BgGP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79EF1E8322
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 08:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148812; cv=none; b=MGpwhKl4fPTL1kR6gp9tcgCEXvYmAyzYZNOG3w9JC1BhaEzAxt1/yKawgD7do8s68fByw6FQ5Lu+MqIH5kdeDdRd4mkZoNAgMQ00f2/OGaYgDupJK8xAzhR31+WG4fyFDlsxGcf9Sj4nzYC1vR1N0kx7x/emDP8OILxPehfJk7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148812; c=relaxed/simple;
	bh=NLs+qWJn+ZP5DPsry/eRPCLoqWTcxBnwPUA0+ZFuPm0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T6PzxBI2+6YrJE1pszU4EDlA+3sgM062L3T9KOG5GIlXXSXI7P4XwMVcyGYBGAvchLjwLn5wNJcPU748wn5CoWQW0uNdivijLAO6zhrnlSJjLgLgeHoPHXtQM1SLNJlZfna3BooMQ9H3K6yolw3OPV71OAdnElOu1cZTCvNFjBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=SR34BgGP; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-ade33027bcfso883440866b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 01:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750148809; x=1750753609; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ha51G6QljI8TE+htVqSGE/G45ppcBa69RDzMvs8Q1Bg=;
        b=SR34BgGPKs80ccdXZrqwNV10M6grPBV6sdEVTos8wUMwh+Xm8LMgKIx66WrTA66nFP
         Y5Go/LeNUtaE/K9OXzs86ptEKAbSECxTVuhbgzPt/3AghiwbKgg6GCTP1c6OYQrXAA+h
         vgpb9n5CrjslzZ8aP2RJKpL7pMSEjPBVxhR2zco2tncRo9z4fEhIJKYEcdvEGFSEWWKD
         DG8LeJfg9jrVTEqJTv8C9DYuW5L5pufDbOQfxsRbzvsc47GGf0fObzODYqSUWrRxSXL6
         OPiMeGr0HGgZmgY3SuaqPVFc6n1CoEu438/lk/fxatW/T49jeA8IY1XQvz1WU2MUUMl7
         LYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148809; x=1750753609;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ha51G6QljI8TE+htVqSGE/G45ppcBa69RDzMvs8Q1Bg=;
        b=f6Gnl4D+yRbRfPbCMcxODmlyz/S4Y2HPeVcD11o19rlcpX1UknMNzCnUPfxBN2OSq2
         sskBFNJRoT/6fEEkOw19QtQ3NmRqdJOV91cTLeNWErDUdXlSCdao38DZD0Va8w/2ld+u
         VPCAS3MX+BBLA0eYtpYaq2fNux/ML4MEpvxL79wV9a9svs/ZuhscpABdfbvsuevjZUoc
         pBjKtMC9IIK0BhOIq/qbn3T6Jg9o0fozGuFYUzEQXBLnaP9z3Vsel71juRBi8o1KOE4h
         Ek+l6kOYyi+Z3z029Z9dqWHjeR1rlUF9pP6DeoX+WL46BYmlfsbPeEpLrh49yKAkA6ob
         Ks1A==
X-Gm-Message-State: AOJu0YzLxZlqPzcstNcrBXDqiTmtqZ94vBeOoSHAYVZAxTXAGehoKbAt
	YFXyGe1AftxpQDEfmeSeEDPFeVPl3EJJsi2asTw/UQOqNTT8KG6lvez4YGGHxozNN+4=
X-Gm-Gg: ASbGnctsKGRCZwAm8FSWR39McJ3aUvoWcifZh7LooL5a7/qDnS7DW7AjEkrX32apOGd
	SouyopAJBpctXLYoBEmj7E6yCvwhCwgjg8JzfjhgkthgTBBWVnV2JXxiQjo2yRktaIs5w+hKojZ
	6TIKIhSzyH5chbKtJYZ8FLnMeHl6c0S4xQzPNlYH+giCMpa2NiLiwpPMBF8NuJRuM0BImgOLXt2
	b5SgSWXrB9mF8v2NwTQ9DAr+2H1YOInbZ5Js4pMlQK2hwxZqj4oZ8awd2qFS5MqmcykxVthDpYL
	+2pqMmJerqkKzGGMt3eQHNy0ltPaJI9yTJkQ/xk3A4hc+GePhaoFqArQrsGCEkKoVUS6kmP+xSb
	d+/NeF9om4/c+gUTmGEzxnGp3S35quFV2swTuIHLnsnI=
X-Google-Smtp-Source: AGHT+IHaLMRID3hoXAOduWJ6WVSzCTc3PiOOYPbCMGHsJkWbLuGR1uhowGvy7+2zgZveMdkL4Rhl7Q==
X-Received: by 2002:a17:907:d78a:b0:adb:3509:b459 with SMTP id a640c23a62f3a-adfad329678mr1353406366b.19.1750148808949;
        Tue, 17 Jun 2025 01:26:48 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec88fd993sm840343166b.94.2025.06.17.01.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 01:26:48 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/2] Fix tuning on eUSB2 repeater
Date: Tue, 17 Jun 2025 10:26:34 +0200
Message-Id: <20250617-eusb2-repeater-tuning-v2-0-ed6c484f18ee@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALomUWgC/4WNQQ6CMBBFr0K6dkxbbImuvIdhUXAGZmFLpkA0h
 LtbuYDL95L//qYyCmNWt2pTgitnTrGAPVWqH0McEPhZWFltnfbGAy65syA4YZhRYF4ixwHI+bo
 2ve8MBVW2kyDx++g+2sIj5znJ57hZzc/+K64GNFwvriHS1FHj7hRYpjFFPPfppdp937+dt31Bv
 gAAAA==
X-Change-ID: 20250616-eusb2-repeater-tuning-f56331c6b1fa
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750148807; l=1310;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=NLs+qWJn+ZP5DPsry/eRPCLoqWTcxBnwPUA0+ZFuPm0=;
 b=rx151nZm2NY70r0BR/IhQqna3HWEfZP2hVL3TqGjnULcMcPD/2K3GYVB43b9pA0Sw6Jws23B+
 aS7VXHp62ufAlpFof88Zsu88DJPzjdCyla1e58LwlwNqIsdZJJa8XSi
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Update the dt-bindings to remove the 'default' tuning values, since they
depend on the PMIC and are not guaranteed to be the same.

And add a fix into the driver to not zero-out all tuning registers if
they are not specified in the "init sequence", since zero is not the
reset value for most parameter and will lead to very unexpected tuning.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Fix wrong parameter used for refactored init tables
- Also drop "enum eusb2_reg_layout" completely since it's not used for
  anything now
- Use unsigned int instead of u8 in struct eusb2_repeater_init_tbl_reg
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250616-eusb2-repeater-tuning-v1-0-9457ff0fbf75@fairphone.com

---
Luca Weiss (2):
      dt-bindings: phy: qcom,snps-eusb2-repeater: Remove default tuning values
      phy: qualcomm: phy-qcom-eusb2-repeater: Don't zero-out registers

 .../bindings/phy/qcom,snps-eusb2-repeater.yaml     |  3 -
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c     | 83 ++++++++--------------
 2 files changed, 30 insertions(+), 56 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250616-eusb2-repeater-tuning-f56331c6b1fa

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


