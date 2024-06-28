Return-Path: <linux-arm-msm+bounces-24549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB3791B47E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 03:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6140C1F226CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 01:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28D814265;
	Fri, 28 Jun 2024 01:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i9XeR50I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E245F1CF9A
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 01:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719536845; cv=none; b=ZOmKNF+KWniH3hXi/B60a1GFVwRdxI8XuTxMNFU4qKZWGLFroWo7RFda4rVBh9eDoOZ8Uw5YVwUwDKezDTQ1qiqHraZt1B+WC6oVekIbDz5FGeZN7LIgJMJ+jEweofgmBPca+e0GeQ5WIh0oc1sBtdDmmvuxLEgc6A79LmSNVvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719536845; c=relaxed/simple;
	bh=ZZbdHFT9ZRAwH2jwxwKvq+WMg4pTAYm+sxzcfmphUPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ix9mqB/FhnY6y4OGN13nJVu8LzZRX3jZp6CIbth2rSzXa/0Q3tT8Lj1evR9eOn72M+KN9tNJzCfpbm1EQuvcKDgCAj3iVy1o2GUmiUIlqXiIOxcIDpAgPgehhBcL04tzX9W7lYW4IKgNzh0/VrmNi1qYtW3O3ZVqxemjO6dI9jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i9XeR50I; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42562e4b5d1so480385e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 18:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719536842; x=1720141642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dynAb/Zg+8LwHqw/4XbLMs/MXNbFYTrBo5jd++nUj2c=;
        b=i9XeR50I6m+nb9xnfrPel0TRjc5ET8RlXxnweIh4FBk3vvoc3WHiU/Xl1BZATkWjhq
         5Y6cHnjKDhHSx1N8+ZVS7c9YXKPYdkdioppITH9qsKUlCOOSQdaDiQgAt5twENRKPNzX
         HOH3uyc4NcMTyWlK6+0B4r6WFioWlUitt7tEu7X+6LqYYRsa6HMs5OSon0bSNZTXyBEt
         eOGEFtCnajJKHjiaXKs92AJLdqZnsN82E/nGhE8vEz09nA0eK1aR/omy6nJl4NKcXORC
         CS3muZEgvO+DGZYrRdpaIIa/fCuug7tpBokUM2EJfW+flLsYws+40f9wTKiXeglQCJvu
         a+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719536842; x=1720141642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dynAb/Zg+8LwHqw/4XbLMs/MXNbFYTrBo5jd++nUj2c=;
        b=ayQrZ5SE0bG9Mtzrb7neawci3c4O5Drmae0P9oSxyqHZBOaYXIEnx35fcSTXDdmi/W
         AvaXmx5tF+1nNViZRBJjlT8fKZyy0wkqpdHtAosBfAbPH2c6xGJVi4JPhnafvGjYDTti
         NPqE0Ta3byIMawg3wPGpihctb4fjjzCzUJIxx5kHXzCo47s9s/ySUgx63TvpNGbjXI5H
         H6D6aWL1gTR9mKULBcJ7u4ZvProox4SA7JXMy3i3S8tBpJA1O2IHcxFxnTa3SYfwUXfg
         ixxTIIrKYqaqntejphP8mNgAkVNSMSxBx991/PASNPbVPx75+KsEvuRhsZm1dKPNUiSQ
         8Rpw==
X-Forwarded-Encrypted: i=1; AJvYcCUcPG/iJdUCD+ycBBeAjneiib0l+x7eEtelKE+Q1LYo0U4jr4AYllzz4YbGAmvDxBQkXyNCFKY0YV45WH7E3xn+foXF+i8JM9MHNRkREA==
X-Gm-Message-State: AOJu0YxtMSbP9QP5MwAcaphff6WNy5vur54jlZH++qnQCNO9uHSVSAij
	RISgwx+5ykb/Ra0hNKcCkAxkiV1uwq1JYLoDQv9QOtnm1g0qRrlUZmih1RSMvXw=
X-Google-Smtp-Source: AGHT+IGOKI5oJNmHOq5jyVwdpyCLf2KYJIoEqX0YWFdClIjga1qqCIxKbsEXzORyUUOyqTbaEueFlA==
X-Received: by 2002:a05:600c:1789:b0:424:a403:565f with SMTP id 5b1f17b1804b1-424a4035701mr65078085e9.11.1719536842616;
        Thu, 27 Jun 2024 18:07:22 -0700 (PDT)
Received: from fuerta.Home ([2a02:c7c:7213:c700:2cd1:b0e8:abb:540])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af3c27dsm13075805e9.7.2024.06.27.18.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 18:07:22 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	elder@linaro.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	linux-kernel@vger.kernel.org,
	alexey.klimov@linaro.org
Subject: [PATCH 6/7] arm64: dts: qcom: sm6115: add description of lpi_i2s2 pins
Date: Fri, 28 Jun 2024 02:07:14 +0100
Message-ID: <20240628010715.438471-7-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628010715.438471-1-alexey.klimov@linaro.org>
References: <20240628010715.438471-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is required to enable to HDMI audio playback on
QRB4210 RB2 board.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 3a9fb1780c90..5487b274836f 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -823,6 +823,40 @@ lpass_tlmm: pinctrl@a7c0000 {
 			gpio-ranges = <&lpass_tlmm 0 0 26>;
 
 			status = "disabled";
+
+			lpi_i2s2_active: lpi-i2s2-active-state {
+				sck-pin {
+					pins = "gpio10";
+					function = "i2s2_clk";
+					bias-disable;
+					drive-strength = <8>;
+					output-high;
+				};
+
+				ws-pins {
+					pins = "gpio11";
+					function = "i2s2_ws";
+					bias-disable;
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio12";
+					function = "i2s2_data";
+					bias-disable;
+					drive-strength = <8>;
+					output-high;
+				};
+
+				ext-mclk1 {
+					pins = "gpio18";
+					function = "ext_mclk1_a";
+					bias-disable;
+					drive-strength = <16>;
+					output-high;
+				};
+			};
 		};
 
 		gcc: clock-controller@1400000 {
-- 
2.45.2


