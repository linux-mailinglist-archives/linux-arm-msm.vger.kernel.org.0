Return-Path: <linux-arm-msm+bounces-75586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B0FBAD0D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 15:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F58E320136
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 13:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF772F5301;
	Tue, 30 Sep 2025 13:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aaXmhwDa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7FC230D0F
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 13:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759238836; cv=none; b=mzm+xPvfzXRmreVpaEHHozxPJ8Ua6dYBDjeK7R63ZWHMI6rwWTKpIGodOe/HF84SZwpeziFLevgaiwqM/VV+q/DYg33UBXDE/C3OGR7NTaXHw3wvGQEazemdi3zP+1Ma/OgoZ977uid2pWsdGuUDckh+GOfz16Eseb54GF894zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759238836; c=relaxed/simple;
	bh=C2c+iYmbNgGTOO2nKF6xIbNLg4yN9mRhc5CtHzgpGc4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fGna8kAN+Z73LamHHVEhBjdg2nV8J5S9dTr8G7JdgJ2w0dEvkRfjIJhl/cyC/GvpYjmZ6QnhCPBvP/ULi8egoeeLfPIa87WSXqQbNZBNCyFOo/y26qDkL9pbVePvlumohpBjr+SFqQ/aZ+S3ArwD2r0M6f2ay/DDJ9LpdymucjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aaXmhwDa; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b4539dddd99so130188666b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 06:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759238834; x=1759843634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pEYWNqVN+hXm3csWbV92tvh3D0m5lJ5Vd6pA/p8j2lM=;
        b=aaXmhwDafjIq8CmeSc2aZEr69FBaH8jalQuIio+zTpzuBMCFyrevY6oUJQ/6dygtTd
         riCuHIE1+Ryt082KbELkkeoO2Fi9ip+9g25nDnOp/v4xbCY4XC8Nus029t4m4/FE/9kq
         RjsyHbg1RFwNPbziPpvJYMlMe6o3RmK0o1q8q2bNKIVKTlNS6GsukMIj/NrQ/ELtyXPm
         28N3moCURJ0/UxOMLEEvzC3+wpKQtKugXkl6xhUmRsR3flUfibprAim+Rp5UqN7mxgvz
         6xvj9cjvOpTjXP67L6p3tTq9BQloBz0L0n5B4lgdU5wAx+iA2dPVcGXpUIgrM8GeBz/f
         4DjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759238834; x=1759843634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEYWNqVN+hXm3csWbV92tvh3D0m5lJ5Vd6pA/p8j2lM=;
        b=vbtlCTHVIr0FoRjokaGPn1zLIq7DKs4fAWbPfXlBqNGYGB452iJqa/8KPVQ9VEtAbd
         i3YqCn2OAU66sjHF//RCaa5JsM2KKF0m90M0poxjtQsxJX98wZh+EZ0E7yfgAP+8UabK
         ItESdL8Fw9dp2jou2/L+SjB4VgRM62+tweuh5PGrRDPhGe7XjVo7DWW39pAqawjGnDH4
         Q4ldlqVD4EEfRgSOqGoUgSVRvfjq+xwSuTn4/2IMnxIqBYG6plBnW4nC9OzaolhOivWh
         RszTl/53CZV4cksTFeSjJcHwATWHzulbKMqbRg8N2lG3E+AMYBpab9PzmEQTpW0PdcOD
         WMeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUH3H4xdR+/w1Ur+ROnQGyCXTFKAOFkPOYjzkzrVSkWcZT8dmAMCJSre2SxbECNXB/Nfu1cEeJgMQS4pbQ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp+ZUWkrwed2JcZyxZhomSzhDpudoV6wLVeVU+pGlFGMQbpK0b
	xeJgGUIPq9gsyUCjZaYBGcPFJhGiTTpNoKcCO1ZTTtbbSZgLaNv638OT
X-Gm-Gg: ASbGncsbgrsEBgSLfp341qvYjZnEF8Cf+jB/DBTX7/cfRRFU+bRPrNhGeJIdkxpOcGR
	DfTZJEry+8P06aZyLjS5jQEBcYHxcdW8xoED6ZnC0bcIW2ZQuCLa30GU9ApIyeOdC5TQjnpjcLO
	YEodPB2nHfAmFXHDqZUkPOf/beBxbqPS86gqDC7hUcFI/H6kxho4UiLNukuRyzSuNDQcBaSYHd6
	JmKO1sYXtW/kRITe5zYnL4/vn+kRXj+vdoAJRZWYSOFaax4NVOoa0zIKoBtj6VjANYonhcqJxVD
	zvQz0S5PamZokIxxuMoPsG7JgBm9wlutfNwlXnsmAZObMn/8qgiW8ersd924P8g04vKMbhK5nIB
	7BvqEqC/opLyQAsAolcI3gvz7P9Dn8gAbGZxwYUf99napJkUmM+UiluZCM5mIP8rauQ==
X-Google-Smtp-Source: AGHT+IEIubUseLSqrueCli47kNdptFpvg2o9b0qj23reXDH/dzzBpT/3wCPqEhs77WVKuNIkRCUy9A==
X-Received: by 2002:a17:907:728d:b0:b3b:d167:944a with SMTP id a640c23a62f3a-b3bd167d29dmr1320480866b.57.1759238833521;
        Tue, 30 Sep 2025 06:27:13 -0700 (PDT)
Received: from crusty-box ([88.223.153.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353efa46b2sm1143934766b.24.2025.09.30.06.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 06:27:13 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH 0/2] arm64: dts: qcom: msm8939-asus-z00t: add initial device tree
Date: Tue, 30 Sep 2025 16:20:08 +0300
Message-ID: <20250930132556.266434-1-xerikasxx@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This dts adds support for Asus ZenFone 2 Laser/Selfie (1080p) smartphone
released in 2015.

Add an initial device tree support for Z00T with support for:
- GPIO keys
- SDHCI (Internal and external storage)
- WCNSS (WiFi/BT)
- Sensors (accelerometer and magnetometer)
- Touchscreen
- Audio input and output
- Vibrator

Erikas Bitovtas (2):
  dt-bindings: arm: qcom: Add Asus ZenFone 2 Laser/Selfie
  arm64: dts: qcom: msm8939-asus-z00t: add initial device tree

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 255 ++++++++++++++++++
 3 files changed, 257 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts

-- 
2.51.0


