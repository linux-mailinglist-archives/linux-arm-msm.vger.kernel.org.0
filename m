Return-Path: <linux-arm-msm+bounces-40381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4DA9E46CE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C660286F30
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 21:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 909071922FD;
	Wed,  4 Dec 2024 21:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EecvgY12"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0DE1F5415;
	Wed,  4 Dec 2024 21:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733348117; cv=none; b=YvkvUmXcMvZZXKZZR5DP3BEmIYSMc1VJn0UZNvWpfctm+D/f9UUNrwkyLE5SvwX3sdJTeHOGYviYJhlPB2EuICpl1M3wcjONYIcC/j7yEh1A8BJrxWPZOCmyT0y6f9KEFqouBFl36QEuw2xAUj1plXVeHRoQ1XSQngoqn9U28EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733348117; c=relaxed/simple;
	bh=7nGbNBR2rlmrlKV+/i/enn28MQ/yQq/coI0HrSWcwhM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tk8V16ID5XqxeDDI89dURXKKR5plnrrZ1tRpJIyRm4J9W0GNvQBAsH80+VPVpK9oBHo2vS1acfQ2O838UtZK8VaclNxgz3m5SwagT6ZA0Vwt3m5FWfeTYadfNCDS1QIJ61XxIZRmKGk5xzequkIGQLrVyA8NvB0GN6xntfdG06k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EecvgY12; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa549f2f9d2so29184866b.3;
        Wed, 04 Dec 2024 13:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733348114; x=1733952914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4L7W9BAIQ/n8Lu+TgBIRQR0dd3Tfyg7NM8s+Xthj6m8=;
        b=EecvgY12dzXQGn8lay+CaQx7gbCnt7SDnq8gihm83BwWQ1wjbJkS6o8RQgqmf00Eqi
         TLw7ruzHnjJ8lHpJPbENdr5pIQAn7l1NcDs8myYgBqY0b18HvVCJKMOzCuvJYyGbWL+W
         1YgfzHF5OWLoaJoKzZnjAbDHvZcqlBWg6512rHycvBADrku8C7mkvTHl5hIHUIiwjaXI
         ZjTxN201z6bYTP6RJ8VUdLzuRgkru46rLkRoSTPmgm2+9YgTZed1C/JKWctzNINgZtIw
         SQEUHQZVEz9U4FPzpMLxBJzJT+s8hvnNgEpREvLAGJ5T2emhUBs4ZYc3CHU97kITNVHg
         ul3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733348114; x=1733952914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4L7W9BAIQ/n8Lu+TgBIRQR0dd3Tfyg7NM8s+Xthj6m8=;
        b=jD5s9Gg43fyaAD2I9+850A4ABRzkcqhvvfDYtrEYDt2EqCJESMLDYDYpAhMhhMOhs6
         rXM9lFR3QUHIx3gpa9itwirAiqUbiCCP0NCvsD5LtGzisRzXAyph7P6qC04C533GBosK
         MTXiBwvhyCU54np4Rfj96xUozxZxdH5789YSvUibTJ94medHB/9rSYRxT2bVtnFlVxGM
         JRwMaDgGDkxNBf9ZaRT5uc8CCNHOUEAqFIHz2FWSy4XAdeUZnM9hY7Yu8dVsoXGznGyn
         F6bg4tILCBtZ1GMp3b3mTBBqQPMnkoR91L3NFi31b5rjShyEkePNicaaNORyD0WdRcpq
         xhLg==
X-Forwarded-Encrypted: i=1; AJvYcCU7KI52oZgxRfuXVT6Vft1NetBZECF3FhWKeG9Ap5jnLvX/0M6rbw3WJAWhLCskK0kZGpI4iHSkN6ojJgVI@vger.kernel.org, AJvYcCUW1ulA6lYnBSKfo3dvuniCwPcCbIT9fZtWbA+aAHF1MhmMisGbDUwfeBHVGcSKfM5Mtfppf9ufNM9o@vger.kernel.org, AJvYcCXkgoxxA/WnqTu3hx2KQbHBM5DGZUMUSOXpBrX5bR6bcQkUQafQXXdiaP46sMWGVq/7hOYMAfIgN4mOH4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwijINrUirCp/iRja5E4kzAXcALdt3rAdOFy4QJWo1faJn7t+xC
	4pEcNBDKkNlCb3W0BRIE34y8XtY2dwqJuuGYGgq/SxsME5Epu+bjnME5Lg==
X-Gm-Gg: ASbGnctLs1WiReR3RrQ33UgMFCm+Cr2r1FMdnBznz7YCjwmiv++Pm5iVX+0UTHnXVSW
	Q1PwSgGQ2UIptV627tGfU2r5h4rzIfESAyXDT5uhznS538IVnU+ELaRUm2s/hl0AvYceMCVCe4m
	9ShMGoXmHzloYcKDQUnOrLeUgAP0Yb4F/WE5X7XH4uHiWGh7VIP3TVsy0czve6tZDMyxEKQB3Nw
	qlQCp6G4xEROMfPmFC0ALodwVfhWSJueOYiYm64D/RpFjGu
X-Google-Smtp-Source: AGHT+IFd9GiPgYKS0OrJ8X51O88yZiCTaqgVAj++KcnEwdhvfjlIINzTyh5N9DzuJOTQi91gHf6qAg==
X-Received: by 2002:a17:906:4c2:b0:aa5:4672:663b with SMTP id a640c23a62f3a-aa5f7f2ba80mr603979166b.55.1733348113622;
        Wed, 04 Dec 2024 13:35:13 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa62601b5ddsm4506966b.118.2024.12.04.13.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 13:35:13 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 05 Dec 2024 00:34:53 +0300
Subject: [PATCH v7 06/14] arm64: dts: qcom: sdm845-starqltechn: refactor
 node order
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-starqltechn_integration_upstream-v7-6-84f9a3547803@gmail.com>
References: <20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com>
In-Reply-To: <20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733348104; l=1030;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=7nGbNBR2rlmrlKV+/i/enn28MQ/yQq/coI0HrSWcwhM=;
 b=jJR5LsGtcevXVXF4PPpy2xEEiqnPLOmi805809B9C8p/A7L86qFimNCuOYs6ez4485tCrNghS
 fDhlMclwPKkBJ5Dj1ytYppYsC6MEp5SEEWFYZoLGRzqKUAUZoM05zhR
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

---
Changes in v6:
- refactor: no space between tag in commit message.
- refactor: s/starqltechn/sdm845-starqltechn in subject.
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index f3f2b25883d8..8a0d63bd594b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -382,8 +382,8 @@ &ufs_mem_phy {
 };
 
 &sdhc_2 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&sdc2_clk_state &sdc2_cmd_state &sdc2_data_state &sd_card_det_n_state>;
+	pinctrl-names = "default";
 	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&vreg_l21a_2p95>;
 	vqmmc-supply = <&vddpx_2>;

-- 
2.39.5


