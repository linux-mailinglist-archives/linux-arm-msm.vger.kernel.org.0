Return-Path: <linux-arm-msm+bounces-81859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E33CC5D182
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 13:24:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A069135D40E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 12:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC22F320A38;
	Fri, 14 Nov 2025 12:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="UFrhOayv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A603164A0
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 12:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763122755; cv=none; b=JQpW3LeD+JaI4E7vljhxjuug9l8JhhF68z7cVSY6I96kzbkqhsr1GYShF/pQTjgQzg6/uCau2a+lZA4S5AcoLEgGd6QJ7LvY9/zvGg31PGtlGJzVCbHR6VQ2vz53/LrWCtFyIUXGKRDlxAsYDv9kHv/6HntoFY4cCkjBopjRWjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763122755; c=relaxed/simple;
	bh=v/7uPsJjdK6hkCP+JByBQAqQMgqhmqudYFyLuedkCDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j239sBj1dmqylt3oG7u7Qctf0ok7sL0QWBoRUKXyHXsVziw6BogyCQ6KRvcqNMmQoTYk+k/0rpis2EF+ndBdUbv/qh9hjp5r7UUgcrtZx7qVuD94WmSIKFHqqTd9kbMda81134TTMJ8VnnC0h1Up2/8HPTWUb0MGWCRmk4aDKGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=UFrhOayv; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b72bf7e703fso319521766b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 04:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1763122751; x=1763727551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzGfb6M6LDc07sFh0FCxc5ya/PA6tX+CSaRhCVUxnTA=;
        b=UFrhOayvR8BPf/5DJVhUqIpttCvoUPhbaVT4YGu/vEalMBZR9anFpH/rzbM9yG5vRR
         oFiNAv+V6CiNXQl0EatwKgrwkr+cOzZJc2SqZpCJS2t6grPNP9lMBiDEAZrKX/MRaAIj
         Yt4G4yiGK56qZ8ZnRsot0iN8/DRPA5TwdFkns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763122751; x=1763727551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZzGfb6M6LDc07sFh0FCxc5ya/PA6tX+CSaRhCVUxnTA=;
        b=EP0MweliCiBDhLn3Z4yrQc3lqbr0B/lO4fW5QMIZnqhf7ZdXKsglETjtYP3uhqiaT/
         iPtl4sJmOhYlKQZAUsugcxC9M1zV93CfrFbhICdhioZgH178jaEoUMC0rg+p3Cl1/YJ1
         kMUQJAF12Bp3K1P0stQ4S/be6ktkZAYg+NHXJblOHCbcdW0RVvBOg35MmFrKYZLgowI3
         r3ksSd5UQ6fdNmhmwYfOK/PF/mz/epDLOzgVRc3EW3vSrpziAY8pQ5epYhJeFtdByxds
         oqM7xsA6PGgV2Q5fqjVTEpewEQI2Xel60lREebcTtUJxyFp7YqhaXGyUDS6WGwGJRxKk
         wLPA==
X-Forwarded-Encrypted: i=1; AJvYcCUBEREmUHjnXpQoGgNCWzYS+2eudZAyBiMAE81TY8hfhyBZkV10NhmGE8aEAoeeTuaSCHAfXNBVHJqDG3dm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4UxN1/Ws2JIUdwuFkFYARXsLlsWO3HPvpc3h40JbvZOu7kbNI
	w4SeWDsUFSdeV9Hx2gJjzT6sCXoiXECr2j7ww79xCIYxt81/9lv9VgKj1ojNzyjpz8k=
X-Gm-Gg: ASbGnctM5taGAkDL5ixPivhxDK2t397X4uNlEs0p7Nfujh9K6H7mI+lRp1MdCXVgzfN
	Avl3WDbnKazRnmqJqnyxrLNY+QWaLLzAbxst9xu8AoMbcyZMv5F0ZlRVUsZUrmtYJZYV2Xm0UhY
	xVFsRYbHFmT4QbM/AAueZniAOMV4vUnGCfnVAYY8kbWBlQbbr28moNJ9WcBSVIDZpgZLzMRX200
	s24v+nGasLnKb6xGYlsWSbAVfIXrczMy5P6AgpRSsWb/k47ITJoTSYtuR7LQmcwUialZRruHNk0
	jUDkrUw5IRcUGMSuyvDqbaX58SwItgsSrGVeXwT4X28pU82TajpprIIEoOVxfTDGrfBlu2e0RpQ
	dli7319O47gWLnptNxUyoY/w/1NuSDImW2Q9C3p/HTi4Gu0o5QXD6H93SotInnnP9AFqXWWlo7p
	QSRU2RGuAX73EenM5l80AtZFTjioaK0F7TbuNbGorIzsBdK9ih37LcGsoJUetp44JoqIv8yw==
X-Google-Smtp-Source: AGHT+IFeewfr9FC7ryApv29fPjOj/V6vl6UKmdtpGVrdxO0aA8KBZyJv8Wn9C7yHWIC0Ffli0JLYfg==
X-Received: by 2002:a17:906:c113:b0:b70:b7f8:868f with SMTP id a640c23a62f3a-b73678c0493mr308686966b.27.1763122751172;
        Fri, 14 Nov 2025 04:19:11 -0800 (PST)
Received: from riccardo-work.fritz.box (host-82-52-164-74.retail.telecomitalia.it. [82.52.164.74])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fed6315sm375295666b.64.2025.11.14.04.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 04:19:10 -0800 (PST)
From: Riccardo Mereu <r.mereu.kernel@arduino.cc>
X-Google-Original-From: Riccardo Mereu <r.mereu@arduino.cc>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org
Cc: linux@roeck-us.net,
	Jonathan.Cameron@huawei.com,
	wenswang@yeah.net,
	naresh.solanki@9elements.com,
	michal.simek@amd.com,
	nuno.sa@analog.com,
	chou.cosmo@gmail.com,
	grantpeltier93@gmail.com,
	eajames@linux.ibm.com,
	farouk.bouabid@cherry.de,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	m.facchin@arduino.cc,
	Riccardo Mereu <r.mereu@arduino.cc>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 5/6] arm64: dts: qcom: agatti: add uart2 node
Date: Fri, 14 Nov 2025 13:18:52 +0100
Message-ID: <20251114121853.16472-6-r.mereu@arduino.cc>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114121853.16472-1-r.mereu@arduino.cc>
References: <20251114121853.16472-1-r.mereu@arduino.cc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uart2 is used in Arduino UnoQ as an interface between microprocessor and
microcontroller.

Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 8bf5c5583fc2..992a157c571f 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -562,6 +562,13 @@ qup_uart1_default: qup-uart1-default-state {
 				bias-disable;
 			};
 
+			qup_uart2_default: qup-uart2-default-state {
+				pins = "gpio6", "gpio7", "gpio71", "gpio80";
+				function = "qup2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			qup_uart3_default: qup-uart3-default-state {
 				pins = "gpio8", "gpio9", "gpio10", "gpio11";
 				function = "qup3";
@@ -1315,6 +1322,23 @@ &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 				status = "disabled";
 			};
 
+			uart2: serial@4a88000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x04a88000 0x0 0x4000>;
+				interrupts = <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart2_default>;
+				pinctrl-names = "default";
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
+						 &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				status = "disabled";
+			};
+
 			i2c3: i2c@4a8c000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x04a8c000 0x0 0x4000>;
-- 
2.51.2


