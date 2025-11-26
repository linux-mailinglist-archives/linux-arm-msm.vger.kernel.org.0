Return-Path: <linux-arm-msm+bounces-83350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA30C87AE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 02:21:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B903A355033
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 01:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2102F7AC5;
	Wed, 26 Nov 2025 01:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D06r/qKM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD04B2F6919
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 01:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764120057; cv=none; b=JR+MmPuUuC11noo/pNdPkqxQU19DS5WwW3VizlIm4B3pgd8eKotxJP0LqePOIEq/Lyoekdj+Cw/69rZNmbkTCi3cgLlB4FIK+c1IRPs4qAectdgp8PJ2+8e1BzQX7C/T/W5husmCPwWYPFYDje2SnEfgwg2x+hWrqQWobiVjdaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764120057; c=relaxed/simple;
	bh=O5AYm8UgXFda5Rhv6hRjYkriPGhENALejT5nZbIUKY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nFc6Bz0k7/8GEP4x0R+Tnp3NauIIkPYyKCGNReAVZ2EGVD5Wfhqlkcl7AaQ73IhdMsq9UxZ37dV0GgjSMBCik1Os/HHBU20IUzrT8veY2Ayk79vg4m/kfPy8v0sEqt3l94kk46XjSMyHkfFXWCFsV85x1hmpuZM1QWb+FQqW/7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D06r/qKM; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59424b0fabcso900475e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 17:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764120054; x=1764724854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHYSN5gCmUewuhOTm/qYl1OCkfyvY1/sIo5yqUViP30=;
        b=D06r/qKMMoA8rw1IueWiA3vpB//jBV6hOzPvbz0yNPC3o5qd+5aCMUHkWigDVJ5SfB
         juKBES67tGLHzAO/Pj1Bzx0unXrFKSaiwZdXcCCGYyiAxM4QpeeTWSdRrUGJqGKM5nM4
         BsD78K1fsda9FmdLkIOyUERuKle9z8SeNt9v7vI+PAYXcDogbe2gn3geQy0FfvqlEiYp
         bNGWHOPHO35RfNPn+U+dosf5wHf2Lchdq8c1VyhZoKe3z86ALMjpL4GKeJW2RNtT4AzP
         2/L7ITLSGGhYeal9BGTlVQ4cNYLwlk8dnIrO5yaP9l8carzlWvxcwbQEOvAOoUVlAbBD
         rUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764120054; x=1764724854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uHYSN5gCmUewuhOTm/qYl1OCkfyvY1/sIo5yqUViP30=;
        b=cewyYBsVpTEF1v1CLXd+i3bEAFzoqhhB4vXrvmW7EQtYBEVIUAtyqRXVxIzdSgOiMW
         JJqiw+nsYMuX7hfIwNeOjpZ90t0F8dr6H1SlOXA8pdDgj833kIXObk9QpwTn33xQckuc
         Ct18b+tqg9r7k2L4qQOz1tHEmKnYLe+8WQcGQUmcmSEr1J/+efDSANDVv7XZW0kFl2k0
         AecLpBT6ySqb9uooaVlFonxLl/Nic/lsDaqpkGAe2maROktKnlSNjVzr2FaR225frDtp
         UgrUtgxvyZP4lXVNiJNl0WC73nCJhVaJgumwTqv+++mLn77FztiBRm1p+kRI5PzBgqTR
         Icmw==
X-Forwarded-Encrypted: i=1; AJvYcCUJb7sYnozItJUjnCefDrVpjZ6fN1GdOmbmiMDH2etU9G9SwnAkns7/6WeAYx1MhZp6FZ7UXQQi4iZeK2H8@vger.kernel.org
X-Gm-Message-State: AOJu0YxBdiwz2OZFgQvyMLf0Svl7d53tzqJ/5K9lTMInumXGnu5BGJqs
	K3ag2S172s/XgbtJT/AIYrD6QibO6cMSSGI8aPokOfeXlEmqe+v4pDksKNdL+s4Cicg=
X-Gm-Gg: ASbGncuFdbQkRxOVEzb+qJYJYHsWq4PrFOTpkxiRjrdQrjaX9NomVEIFtmlwgOrJjOl
	0jza9JmRW1ATZyqaredqCGBUUB2e+RLRA56RgX6FIEhy58x94B/xgOzACMNvJRRqbXGKIjMMAfY
	SsvIg539+0pNKPzHThASrWh+nWnbdfQKJQf1uoz00h3ddwbJIj3V+ep3s5rWbZygIZE8HNID96o
	Tt8J6FdVZpdSSOXP9NLblwuq5wh6YY+cOYAoM0lPEylBHZw9w5e75LJQHRVJhM5R+YAcuJNW79W
	ixjqSmXbv6EVe512kyCbBL4wQmX7yiwSijjb84zjAWX6uD9DKYxz6y059UunyreZcUtKWp+oexr
	rr1fqdizUN6ALfm7Agq0aloMyC254pCHQtNZ+tAIlLQoCu+uDKSyzYaOWkWAiTQssFRTW2e12gi
	Y7lM/moovpoNP9ZnVdpdu05UVg+sHSoI9IE3XCn4Fpe7JNDc70LcQj1g==
X-Google-Smtp-Source: AGHT+IFvDf+hOYvfYaVau59nov8KjsBa8sI18PblnT8lAfg1M6hf2k8V1G+kWd7f2epYCUshI61v7Q==
X-Received: by 2002:a05:6512:23a9:b0:594:2a33:ac17 with SMTP id 2adb3069b0e04-596a3e979ebmr3200758e87.2.1764120053800;
        Tue, 25 Nov 2025 17:20:53 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbc597bsm5584426e87.69.2025.11.25.17.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 17:20:52 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: qcom: sm8550: Enable UHS-I SDR50 and SDR104 SD card modes
Date: Wed, 26 Nov 2025 03:20:42 +0200
Message-ID: <20251126012043.3764567-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251126012043.3764567-1-vladimir.zapolskiy@linaro.org>
References: <20251126012043.3764567-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The restriction on UHS-I speed modes was added to all SM8550 platforms
by copying it from SM8450 dtsi file, and due to the overclocking of SD
cards it was an actually reproducible problem. Since the latter issue
has been fixed, UHS-I speed modes are working fine on SM8550 boards,
below is the test performed on SM8550-HDK:

SDR50 speed mode:

    mmc0: new UHS-I speed SDR50 SDHC card at address 0001
    mmcblk0: mmc0:0001 00000 14.6 GiB
     mmcblk0: p1

    % dd if=/dev/mmcblk0p1 of=/dev/null bs=1M count=1024
    1024+0 records in
    1024+0 records out
    1073741824 bytes (1.1 GB, 1.0 GiB) copied, 23.5468 s, 45.6 MB/s

SDR104 speed mode:

    mmc0: new UHS-I speed SDR104 SDHC card at address 59b4
    mmcblk0: mmc0:59b4 USDU1 28.3 GiB
     mmcblk0: p1

    % dd if=/dev/mmcblk0p1 of=/dev/null bs=1M count=1024
    1024+0 records in
    1024+0 records out
    1073741824 bytes (1.1 GB, 1.0 GiB) copied, 11.9819 s, 89.6 MB/s

Unset the UHS-I speed mode restrictions from the SM8550 platform dtsi
file, there is no indication that the SDHC controller is broken.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 7724dba75db7..7f5a8574059f 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3191,9 +3191,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			bus-width = <4>;
 			dma-coherent;
 
-			/* Forbid SDR104/SDR50 - broken hw! */
-			sdhci-caps-mask = <0x3 0>;
-
 			status = "disabled";
 
 			sdhc2_opp_table: opp-table {
-- 
2.49.0


