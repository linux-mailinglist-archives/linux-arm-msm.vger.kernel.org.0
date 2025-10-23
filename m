Return-Path: <linux-arm-msm+bounces-78569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ACDC00C99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 13:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 595281895BE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A6D30BF78;
	Thu, 23 Oct 2025 11:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="vtOjg5wO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7B72F99BE
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219473; cv=none; b=lie59bUCQ72scFMKoWDiaUU0XLki88EmZpbLi+05e3hUwQXu+Rn2Kahjui/16weAlEKPUEtS8q9/C0U47inVw062mTjZSeCRnouEEk+u+SHYIkiEsm8IApVEX2evMf49U+0yZJw/0nnEKzRF2irhoJbq/le6LSGVHqV99LpbBGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219473; c=relaxed/simple;
	bh=DWNX42d2o0p3UKA2TRUwPtkFgHSS6IWQH6Pd1wztGVc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tQ7b47xX3qReKf5ExTSqsUD6oZq8QUMCQGMh7b2qaav4rgvDIJLsAhLVO7I4ytDOF0D6noii8KETP9TqVnFuWKfv4HYDYhODAJUSm5t2j5m22uyU9jT75U11wOoe81Dt/EXBVGHrc3y3pcPZfoM6FOk/yzbe1zWhmAa1C3LGbAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=vtOjg5wO; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b403bb7843eso146496666b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761219470; x=1761824270; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VxMcMyLuAyYtT6gutxdzEE2BGizoE4ASkRahe6sYBf0=;
        b=vtOjg5wO1dAxjGa5P5ntjIceLEItalAgdpxzXGOn5ZsVLstRk6qt0lJh6qDDHmX4l+
         iQOuK0E1vN7t3vZM9Dptm6WPI0HgyU8ndhMPmtGrb2TfJCY54lP94GX4DWqFmW72sMra
         pXbYCl41Lo1qbNc1WNlyc2d2jJ7dX/jE2XcR2ZoMGn690kv3aH3LJ+ivwRPuDqt/HEmR
         n0ZuzUHEik5WxOrXjKg8cBs4qLpsmKmamnGr4/uAJiMEFL2IADzhHe3ZZU28z5hixPO+
         Qz3zN6gyqv2WKEm1IBWQdCxS+EWEU9VTpFuVA6Sn+CVzWArbxrHFoZcRv0q5f1C157Vu
         wikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219470; x=1761824270;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VxMcMyLuAyYtT6gutxdzEE2BGizoE4ASkRahe6sYBf0=;
        b=muFa1m4nrKtycZ/sol1Ex5RBDphnfliihy1/PtsJNfNQRRnMdwhSpgaZdYspK9U6Vi
         r2GEq+Ixx19o/2NJ/EMU6aGJQDgd1HwfDv1p0xbAjLe2rbG/UF26m/rBVCkLrGbHmlK2
         4ekGRNoZE1+lAkZij0Pv/mZ9CS16Mzp6Rly7cEeZX4i5Zgp8Xr4EZzaZ4bXEbO4lYiTz
         EOtBV6pvFHcMtJlP1cMeUlEPZV+AgIaU+tPABa+5FgaMhgVBRivFJbbxobVBMDVopQk2
         1bZDcn90EmvfUJdjr1ixvoBLr5Q4o3NnSZzzf7gQr8nYjD20IIStoIKkgdUdlwNvCyOR
         8GLw==
X-Forwarded-Encrypted: i=1; AJvYcCVZultqHy4s9uhpN5qUPcxiTXyHyAnaXijJ5EJvrb6lkA+mWHMUVOsjtkpg8gErmIf6bqme+odp0J28YAsZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ1Z2mACqP6ylHwNctkRh4+91kJ1/PG9L9dekrZrpwDBs8eKtN
	I7yl98FwBLBE6IxbJiHCl1d3A8gtriLFDG3Oc86V6ruoQjo0klWFvCO6xiXnnsqcnvg=
X-Gm-Gg: ASbGncttFEtd3H5iHCX1kSGPs4BUzkl3pI16U06ss+K+Wy+CkcGozgiQvCZ3e5/5vOb
	HuuXrzihLizhoX9kzw4SLiDfKv7RgM5TMPhaRZh/tCl/pEVne+/KmphakKomO3Rgi0UkBrLI1wN
	7a1e52q9ES1zXk+p+QI6SU0b0lHzSEsVqraZpAThhhUFc/nb4xSb39TkuJF0xoM8w5P1Kf/pP6q
	84yIRJ/CjGV3mZ/sPWaEv5yKTRgff+UriLqy3ShXzxDjRP9dwJFqQrr6pVRXxxJOWcurcGDAjz4
	RnFgxAWjciiPJ/KaqLJ8RdUER83pCRpeSUPxRUTbN8ztp828Mi7O6WnimRA2+FLMP77BgdFuJ4M
	4Rkb9wvvo5NUlAUbT0ZV23+g3+uecI24osjC29WOT/BNfczz31xLtahcAX746fIs0pf4lvlB9A2
	yxX/WhsO4/beHrXChvI26d/w6T1t3LKA1uYT7I1/xNAkU+zg==
X-Google-Smtp-Source: AGHT+IFFi0kxjJXcdhbKgL+sbBm/wBkqtVc9R3u5L/V+k7O/f9DsWz4cBNYXQNrlVhDEV4kqiqw0cA==
X-Received: by 2002:a17:907:9492:b0:b3c:4ebc:85e5 with SMTP id a640c23a62f3a-b647482d7a7mr2977703766b.59.1761219469769;
        Thu, 23 Oct 2025 04:37:49 -0700 (PDT)
Received: from [192.168.178.36] (046124199085.public.t-mobile.at. [46.124.199.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d511f8634sm194429666b.29.2025.10.23.04.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:37:49 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/3] Fixes/improvements for SM6350 UFS
Date: Thu, 23 Oct 2025 13:37:25 +0200
Message-Id: <20251023-sm6350-ufs-things-v2-0-799d59178713@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHUT+mgC/32OOw6DMBBEr4JcZyN/YqRQ5R4RBTFrvAV2YhtEh
 Lh7DPQp36xm3q4sYSRMrKlWFnGmRMEXkJeKGdf5AYH6wkxyqbkSN0hjrTSHySbIjvyQQCuje7x
 bNBpZ6b0jWlqOzWdb2FHKIX4PxSz29N/aLICDqjlXtTRGS/OwHcW3Cx6vJoys3U5FxM9Uvs2nh
 726hFDuI+Wm8rhk2B2CS1Ua2w+4N+y05wAAAA==
X-Change-ID: 20250314-sm6350-ufs-things-53c5de9fec5e
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761219468; l=867;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=DWNX42d2o0p3UKA2TRUwPtkFgHSS6IWQH6Pd1wztGVc=;
 b=IueMu5/zmuTihJM5QLRB8Bas9Cu2sBN8bwvFfnp/k1+2y+VhxB5dubhVKv9BIN0vIf05Ow/gp
 YSmWl7IIFkKD3ARXHft+sp28/WHo7ipwQhJNnNHXZ7bJSVVqF4OoFs0
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Fix the order of the freq-table-hz property, then convert to OPP tables
and add interconnect support for UFS for the SM6350 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Resend, pick up tags
- Link to v1: https://lore.kernel.org/r/20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com

---
Luca Weiss (3):
      arm64: dts: qcom: sm6350: Fix wrong order of freq-table-hz for UFS
      arm64: dts: qcom: sm6350: Add OPP table support to UFSHC
      arm64: dts: qcom: sm6350: Add interconnect support to UFS

 arch/arm64/boot/dts/qcom/sm6350.dtsi | 49 ++++++++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 10 deletions(-)
---
base-commit: a92c761bcac3d5042559107fa7679470727a4bcb
change-id: 20250314-sm6350-ufs-things-53c5de9fec5e

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


