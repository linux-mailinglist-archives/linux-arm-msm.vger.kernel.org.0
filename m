Return-Path: <linux-arm-msm+bounces-64269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 870DBAFECDC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 16:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB50D17A381
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 14:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2352E6D16;
	Wed,  9 Jul 2025 14:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="E1BwbKxT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3182E0B44
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 14:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752072927; cv=none; b=bc3qX71fE0ACmJWm/YfbUneLrVgjoDkymgJCWd4tNVN/9H9KC5wWjBI8CvuYNbh5JQOCXguGMU2zlrZOcLzNb7gbTSJ3TWF54zfN6KvgRLmGGm1Ltg8eszDIEELPlJQ8SVsACnHF3eiYPVNcYig6Ub0pmGT4AOaaG0ofRJJw4xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752072927; c=relaxed/simple;
	bh=+2bfuo/XxdFtjNlpBnRSz55oWsfelV2bXIgIhY/HOGo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kxUZOmcoO5+PgJrXGdOaUVgYs78MOysy+q9C1A6YUl9L28tvy3MvQAixMjdCrtZc3qocNhLPHlll82OfXiMFWcJOJEsfR4j46Eo4oXwjHnkB2rD7qFAAkvNYkNWjOKYJYxDULyo7O0YfvwlhXSg2gSvtDCzqoAolYIbO66xC1mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=E1BwbKxT; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so1811436a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 07:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752072924; x=1752677724; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xsudQgPEXLO/8rlrHg7A+VcqH4UVc0XGQUOkZdmkbM4=;
        b=E1BwbKxTcKBCaV5Ij/+rHcE8p3g0bwuFB75skGhRurqQLpG69++LXi8ntlEKOZSY1i
         S5aVNip+/zOF0yFON+7v6uW/QmZUjR6in5NOtAwEo2YcLk95LUCBteD6HZ4EtbMlJ+sN
         LthDYz5Fe6VW3RDlMiNG0wC/d34MDA1fQpNWITEGQtf3XfQSu65mcQIHAEzOd3YKhUIv
         FHxt/+J9G6mPvm6I/xMByj1BmBCVE6yeB75OwzYdL72YkoLNo+AHcOej809fHjzMXUJX
         k8FvTVqDtd4Jtxutjwa39PJawUcE9Sdxe7Y2fEM7gRk4vTyPJV2VusGZ94a+5SKHDJVU
         LivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752072924; x=1752677724;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xsudQgPEXLO/8rlrHg7A+VcqH4UVc0XGQUOkZdmkbM4=;
        b=LsR6AXp94tRVZiPYnQpuyUBorsn6heQ2S2OAUFn1oAvxECwr5/ihb9c8U6s2x3tDUY
         bsyDQt+3LJIXtEOgMR/rbCd0iNJQyYX4k1BrsjDSfqItW9qiGi9oKM3Fd+ASLl0aME1V
         HBfE3RGwUscYAFMeTtLmiup4BndZ83VVfy7+4JYV1MUpaHBz8ncaMzfgOkR9xJUHqxGg
         bo0Fhtm9zppFtWxtqvDjYyPutlO8rn0ii0l4pIqJ6yY6Jla9jShDQsxg+obIOnVjNDBw
         kL2KxDn5lFvBPYxV1NOUnVA3sUhgqq+A3i3pRVoE7/oJHiPeep66zrM+1wXcEANu1gUa
         cU/w==
X-Forwarded-Encrypted: i=1; AJvYcCVO7bM9p2fK1fm/FXd5iNXQB7u1PtLuSBE+QKv9QPDkbOeHhUejiMFS2dVplgNHQr3F3cAe5VN/UnbW2lyW@vger.kernel.org
X-Gm-Message-State: AOJu0YxUwpIMflpRkNRG4JJRqmhDQel2ViIQkjug1mXCGg2EemCAGpRW
	n4XQEB583SQ4NMDDGUkXQ9gU+o+NUOj5E/lCzFv66whq1avqEnz+M/SFwt3Du7gq+ms=
X-Gm-Gg: ASbGncuVS/D800ztOgwa/TXSSgrDNiHmnH0ScoG9VZ2raMJVIRPqBVe654L5WvyUp9M
	7YpL5dFrauHbNctlRlJuLIEK26Y4TSz+x9YDahIZDdWucDw7OH6fWB+hz/XfeXQUjd6Vi+qKupd
	NH5JkZzhk/UhFK9ePkNk4DxIbeZsm8RDhwE4kMrYqJrLGCk4eopMH+QLnOjfgqhmeC3U1Y0pCYS
	aCB4UTGmA4cAuqYOpNHYIhnbt/TLIOlfqGOcawQdsBPP5IkQTu/hxD9EnIq3Ydz/JVxb8Cm616z
	UtKGreo1PEDuNWNwqJgaYPUr72ZdIOutJeqRSs/GWi3EkcL0x2wDRl0J0UYyNM1p54BlwmsTmqj
	GWYfcpVJgT0w8mdoTx3pzz2A0hSbfiRm5KzLXcLFaZMc=
X-Google-Smtp-Source: AGHT+IEJi9D3i6knXbAjsckZ7Ciww/QJ7BLM67HvKfXZJLKXPgCmFN58CA6mh9SyrO15bCmZYpI2PQ==
X-Received: by 2002:a17:907:3c88:b0:ae3:ee3a:56ee with SMTP id a640c23a62f3a-ae6d1266a1bmr305624866b.3.1752072924078;
        Wed, 09 Jul 2025 07:55:24 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b600ddsm1116795766b.158.2025.07.09.07.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:55:23 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/4] Add support for eUSB2 repeater on PMIV0104
Date: Wed, 09 Jul 2025 16:55:13 +0200
Message-Id: <20250709-sm7635-eusb-repeater-v2-0-b6eff075c097@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANGCbmgC/22Pwa7CIBBFf6WZtWOACtWu3n+8uKB0sCxKK1CiM
 f33h/UlunB5ZzL3nHlApOAoQls9IFB20U2+BLGrwAzaXwhdXzIIJiRTgmEcG1VLpCV2GGgmnSg
 g65ujlbIRJ2ahnM6BrLtttb/nVw50XUp7eg2h05HQTOPoUltltecKg+HwiS0WG7SsnjTxxqXFO
 39BK1Vdc6M6bnWbBTxJg4tpCvftn8w31L+6/K6eOTLkp/4o5YFTdzA/VrswD5OnffGD87quf4d
 lDUsmAQAA
X-Change-ID: 20250620-sm7635-eusb-repeater-0d78f557290f
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752072923; l=1322;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=+2bfuo/XxdFtjNlpBnRSz55oWsfelV2bXIgIhY/HOGo=;
 b=xWvHS2PiKGx9o1Y75d8aHnX5JAyJpQ/n8m6U4OfOHpTGyPApAs6B48YmWcriEDLmsi3xk8qVe
 PPsYGLmQPflDDpV6LeYtlYy1puVL7D8jpEP5qSk6tv1ji9/vpUFkq2+
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a new property qcom,tune-res-fsdif for the eUSB2 repeater and add
the compatible for the repeater on the PMIV0104 PMIC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Expand the dt-bindings qcom,tune-res-fsdif commit message regarding
  the register value in dt.
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com

---
Luca Weiss (4):
      dt-bindings: phy: qcom,snps-eusb2-repeater: Document qcom,tune-res-fsdif
      phy: qualcomm: phy-qcom-eusb2-repeater: Support tune-res-fsdif prop
      dt-bindings: phy: qcom,snps-eusb2-repeater: Add compatible for PMIV0104
      phy: qualcomm: phy-qcom-eusb2-repeater: Add support for PMIV0104

 .../devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml |  7 +++++++
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c            | 15 +++++++++++++++
 2 files changed, 22 insertions(+)
---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250620-sm7635-eusb-repeater-0d78f557290f
prerequisite-change-id: 20250616-eusb2-repeater-tuning-f56331c6b1fa:v2
prerequisite-patch-id: 5c504d171a4d1acd9ec376e01e0dd0fddbad92b8
prerequisite-patch-id: 0c97dcf5472fbed8ef4cffbd482f3169fe1e972d

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


