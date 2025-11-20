Return-Path: <linux-arm-msm+bounces-82758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D2EC7693A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 00:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DBCD635599F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 23:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83F08302CB3;
	Thu, 20 Nov 2025 23:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLsnBm3H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75BB30214D
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 23:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763680272; cv=none; b=PNTFd6v/0Mu7yMktqP+WG5NU6Opfzml5JYU4Oyzg6IoPlI/7tEdkHuZS8F3EsbttEkcNci4lsut8/ieZzltg4Io+UStkIBag0R53l3u3N70Rt2dvriMmz+tkQLeytuWwuMwHUMGyXdB4BeaNDBIUVDs9tkMKwhfor2gmwSUX73c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763680272; c=relaxed/simple;
	bh=f09Ph1eIgetZWHLJK7FoNd8ccKR+tymPGV+3sp1g5K8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m+bFc2OitUjAkm73xlyvP1mHE5IB3WI6yhM1+lmOEGpQLbPCel5pmlhadvjGrTCCE6u6VEBDFaoznr5D/59kSkUr3bzOen+bNoRLFEzycnt9ypTZPaJ+tUYdbeyw/jW0LW2Lkug70owpZsnmR0AnScIxpqF2O+C8LemnlTKkAKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLsnBm3H; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-787f586532bso14175537b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 15:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763680270; x=1764285070; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OIBL9zhNeDx90fnwrwztaJK024OToElBIomfLRD7cbw=;
        b=iLsnBm3H5b/SPaiMATkAyU7mViaLc8kVHebiqeI0wKMK7svUPKfIE/UwEDOF/CSwQU
         XPGDCU3zhIEWogtX06y2lW1n6YQGDHlZSreIDTW6pGukl5VSLXh8eoOd7WwdG6aLueZR
         Vaa4AWWJ/ySaDyR4Qls1iMtNOxJpjhrh25yJu0xLGWrFurUgQtgSDapUe0/5I77iypl9
         1Ydi9HXTsrbRA7N3XNNJVN1tmWL8Tjrq4YUv8vUBZ2qYzHnDs0NgJJBCWI4SiyuDnEAI
         5bM9w6aOVRvS8vlPYkzONWBQLL3H4ZVyxKOyIOF6giuGFp9z3EAbAwk2NZg3nRWEr9OZ
         +71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763680270; x=1764285070;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIBL9zhNeDx90fnwrwztaJK024OToElBIomfLRD7cbw=;
        b=XxzYtgzr2CdzfRcnjQ4Ijq3NFqbRnis5RYpop7IpEk0DR9a4BN2ln3VAzG8+j6NtFu
         vV6qMilKBX6mT0xGZwM9aGhm+47AGHmQH8G2DmKuulfZF6JBoairR/AEo0QfZsWhPHer
         +H0FxU5Ke1/McmVWTdz0Ud1AbgxqY2it0WJrwgM5sMnUQVYI7Ry1c1stOAlqGsHTF0oL
         vXvohAqlgkq2K9g6+x7cTb1GVr1QKcqL7CwGMiDTPgMuEZXGuhe0N7l1d054R/UaP3d7
         vmvr6lcnFN8/rD4+GftZVRz7A2DsGBb+8wxJruXfeBAtAcOXHoon2ElCX9HwxE0UtPLQ
         282g==
X-Gm-Message-State: AOJu0YyYDvHDhF8D3Y5GwGUEvYKmRDIQHa4pEw5RYKuNraQD/VfEOZ3m
	bGeeQzYlXHNfwCl4SMtPPxYBHjsN7OhSQomksn877v8H2C6hAzAo/KCR
X-Gm-Gg: ASbGncvlY8HnJg4+dqRAj6BrqobsveAK0Pcg4pcheyZDNix2M7HS5nNeFi9OxFOeO90
	GLFj5iIAIEh3HwZLQIkE0ORwG7jVCDGGQsQOBVuAtd2UnR70mofsUVs/BAeozBUM8i67KS2wcyi
	lxXBW6eAfg7GE6buCbGp+fVgTrOCReNvuYlBJp0fCopVY91rn3dre6gLpOfJqz6WpH7lx0AGcER
	tyvtUsqVwkS1L/dxyCA6EeVNWSkx6Z+jwfEhiDxrDcQatOTi8DNldhU7tJ5vJauqbmKhJssbvqk
	l7G1o5d1Zu1+r3mW1Poj8j7Id87rW8s16iblUi1plja/vFKBCNWJjlPLzSJEcDXJFG6nvLGhoK3
	5vbuvmLOSdGkV8WY1Ss7T3Ujy1Vrs2zzczRTgl6vGZtxdTA9HqHsF6St3bOI/W/uh+N52RKQHMO
	w4fRK4aZaBJKqCGQ==
X-Google-Smtp-Source: AGHT+IHQW4azgv81UpzbgS0IYJMpaV8AqndCImbd1VY7yIzNWeXySfqUd/IcqRYt3Qox3ks+I9+JOw==
X-Received: by 2002:a05:690c:688a:b0:784:841e:c044 with SMTP id 00721157ae682-78a8b5672ddmr904707b3.59.1763680269837;
        Thu, 20 Nov 2025 15:11:09 -0800 (PST)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78a798a7f19sm11356807b3.20.2025.11.20.15.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 15:11:09 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v2 0/2] Asus ZenFone 2 Laser/Selfie includes a battery
 measured by voltage mode BMS and a simple GPIO hall effect sensor. The
 following commits include support for these components.
Date: Fri, 21 Nov 2025 01:10:47 +0200
Message-Id: <20251121-battery-hall-v2-0-d29e0828f214@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPefH2kC/3XMQQqDMBCF4avIrJviRKLSVe9RXCRx1AE1JQmhI
 rl7U/dd/g/ed0IgzxTgUZ3gKXFgt5eQtwrsoveZBI+lQdZSIaISRsdI/hCLXlfR1GS6yRjdSgv
 l8vY08efiXkPphUN0/rj0hL/1D5RQ1AJV38q+GbGz3XPeNK936zYYcs5faFGvgKgAAAA=
X-Change-ID: 20251115-battery-hall-30eb7fbba62c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.14.3

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Changes in v2:
- Reworded the battery commit to include a link to the downstream code
  on which it was based.
- Separated hall sensor pin configuration from gpio-keys.
- Link to v1: https://lore.kernel.org/r/20251115-battery-hall-v1-0-1586283d17c7@gmail.com

---
Erikas Bitovtas (2):
      arm64: dts: qcom: msm8939-asus-z00t: add battery
      arm64: dts: qcom: msm8939-asus-z00t: add hall sensor

 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 43 +++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)
---
base-commit: 0f2995693867bfb26197b117cd55624ddc57582f
change-id: 20251115-battery-hall-30eb7fbba62c

Best regards,
-- 
Erikas Bitovtas <xerikasxx@gmail.com>


