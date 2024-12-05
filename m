Return-Path: <linux-arm-msm+bounces-40429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 111419E4C51
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 03:34:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DCB31881968
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 02:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4736193064;
	Thu,  5 Dec 2024 02:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TnnrcNqs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810A418FDDC
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 02:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733366036; cv=none; b=CG0qVW95w1anr1aKJEb7tbgaJHpMgfHpCutCwAblQrWUcNtEBA6VM3I58e1/iBkYzm7zFH/BFgGDq2ES0t2lHtDM/tCiKN7VKfHxkTVPs0kRDzeGEY8waW84xXHUkgU4NKefsAXp/yBdb3Ak4YyRHsJezdK/bPxyTqPg7gzAG1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733366036; c=relaxed/simple;
	bh=YRQBf0W9frh8FEHOrg3W9F5a40CVpeTKHJworaSbgRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FuecQmj0XfWTvurBLyLdaTfLnP0TBO+RcD6UdK+qyP2f/bUd4QWtZHc3eVGQplZQE+GVuTKC1owTshWEDX1Khw7bF86X9iGFBM1H7ud8yhTASFzMxzxERE82cc7+P4gMfYMjAEZutieD9TUf+27TT/2rUaAw5n0mhJ5F5uiT5XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TnnrcNqs; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4349fb56260so2574965e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 18:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733366032; x=1733970832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pbQg49fwfqiAPqum0vO3xu6S8El0T9nuKTumPVo3HTs=;
        b=TnnrcNqsn93sKAISSgUaYd0yus1Q+fHfc2Mh40HZJOsOGHITxzmlaAJ0i2eg8ek2Hs
         CCGcAy5ZHIHbZKxYpc+66mcBuNzh5so3b6a+pPyl5w4L/LciqjXBbdC44NvO0FUToNWm
         4DJYDI5A39PfSIAsjWe27tnK6xNiOrnmCSGZJufq1TRab5It0k8h2eytrAsH8oz+OOJJ
         wgxzHqUOZgZSQrprjAsOYojxw9encbZJfq3dFFYHosqwmMBL2TnE6WMOSpicKyssauQx
         Kr1tYeEA5uGrPDIBzj0Yn+ypDUv/V41DQBOkAWus7CZQBXHoV3pd9UuwU74NwUGYoxb7
         z9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733366032; x=1733970832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pbQg49fwfqiAPqum0vO3xu6S8El0T9nuKTumPVo3HTs=;
        b=q4xwvyyHBkNE1aC4a9fTNInV6Yqj4dGruzJQdaGiAKi7OwxHMjPsqy6ERM8n2qS6r5
         6B40PvZvkgzgF2dsIOYXLstOTP0Z3fY+HVqQ6oWRtM2ChUfW4EPlretDFKtFDm5WH/Fs
         SHN0ATNi8SgpieN1LD6A3QlVLvDq9XO/TYmgOGW/3LO4nAxlP0lrGI1pvgtfOvV69fhD
         Pfx3CbOV6sUS9uDp1nT4tFwkE7d1YkCcUX/UY9rtFYOz6qJXEbYulE5ueRAlCHXidLz9
         8yfILJEv4ddUVKLPUW+n6Z5QQxkjB7IAinX6MSgIfKysykby5rfzeKQM6Cj73I8m/odS
         ScwA==
X-Forwarded-Encrypted: i=1; AJvYcCV8xCBxjnTGu78Jj27zX6T4M5YKG+NNF4T+hC39H16BOiYlKzFBkFky6f/MA7orPHQFyG2T3Q/vJJQE1HtA@vger.kernel.org
X-Gm-Message-State: AOJu0YwVs4xUYyY2xM48/kqq/F6nlQCfa/7fR2EhMRxzanOrEVuOo1Rz
	QKbm9NSiTHES0Dkk6x7CPjusj1vXySQw53ODPok3i6UcQ9toTlHtIWHUfo7x3fyOz9duziIuZmT
	J
X-Gm-Gg: ASbGncs1PFlSkU7fGcLhCulVJH17NiVhOqrfb3Fgg0m8/MQ2yCL0AJGxOvd4d5NMkJ2
	Gx9QFHlWymwoZUqz2z0UCBWAxvUlmgDrPhwZUtqp/7K3PJtg17o/ckIh22n2WUAWbo7+NcTCUoN
	0gmA4giDVyVNwzfB0khkmdOyEbUgp3EtgvkE94J9i89lKX3lXVvwgffXJzPqStreDCzInGPn/PB
	xA6jpwCQTN2WEpLEU7x/k8a1/vNsoNKoj9gglb6nUvZ8TrOuYleQSQhcoUMj5YojzIB
X-Google-Smtp-Source: AGHT+IEr04HIyGIAbnMgCxehAiEsQghxVfR78l+LYpgdbWvEFCUYjvf5mRhaEkf1BZj3PO52s5tGig==
X-Received: by 2002:a05:600c:46ca:b0:432:d82d:6a6c with SMTP id 5b1f17b1804b1-434d0a1db91mr81932695e9.30.1733366031850;
        Wed, 04 Dec 2024 18:33:51 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d5273440sm44444325e9.18.2024.12.04.18.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 18:33:50 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: broonie@kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] arm64: dts: qcom: sdm845-db845c: add i2s playback support via LS1 connector
Date: Thu,  5 Dec 2024 02:33:44 +0000
Message-ID: <20241205023344.2232529-4-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241205023344.2232529-1-alexey.klimov@linaro.org>
References: <20241205023344.2232529-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DB845c board (RB3 board) has i2s signals exported via the first low-speed
connector and this is also required by 96boards specification. Enable
playback support via this connector. Since this is specific only to DB845c
board the pins configuration is also in this board-specific file only.

This playback output is fixed to 16bit, i2s format and 48 kHz and works
with simple DACs.

It was verified with the following commands:
amixer -c0 cset iface=MIXER,name='SEC_MI2S_RX Audio Mixer MultiMedia3' 1
SDL_AUDIODRIVER="alsa" AUDIODEV="hw:0,2" ffplay -autoexit test.mp3

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 43 +++++++++++++++++++++-
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 1cc0f571e1f7..6ca719281788 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -707,12 +707,21 @@ led@5 {
 	};
 };
 
-/* QUAT I2S Uses 4 I2S SD Lines for audio on LT9611 HDMI Bridge */
 &q6afedai {
+	/* QUAT I2S Uses 4 I2S SD Lines for audio on LT9611 HDMI Bridge */
 	dai@22 {
 		reg = <QUATERNARY_MI2S_RX>;
 		qcom,sd-lines = <0 1 2 3>;
 	};
+
+	/*
+	 * Secondary I2S uses 1 I2S SD Line for audio playback on
+	 * LT9611 HDMI Bridge
+	 */
+	dai@18 {
+		reg = <SECONDARY_MI2S_RX>;
+		qcom,sd-lines = <0>;
+	};
 };
 
 &q6asmdai {
@@ -762,7 +771,8 @@ &sound {
 			 &quat_mi2s_sd0_active
 			 &quat_mi2s_sd1_active
 			 &quat_mi2s_sd2_active
-			 &quat_mi2s_sd3_active>;
+			 &quat_mi2s_sd3_active
+			 &sec_mi2s_active>;
 	pinctrl-names = "default";
 	model = "DB845c";
 	audio-routing =
@@ -852,6 +862,17 @@ codec {
 			sound-dai = <&wcd9340 1>;
 		};
 	};
+
+	i2s-sec-dai-link {
+		link-name = "I2S LS1 Playback";
+		cpu {
+			sound-dai = <&q6afedai SECONDARY_MI2S_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
 };
 
 &spi0 {
@@ -994,6 +1015,24 @@ reset-n-pins {
 		};
 	};
 
+	sec_mi2s_active: sec-mi2s-active {
+		clk-pins {
+			/* sclk and ws */
+			pins = "gpio80", "gpio81";
+			function = "sec_mi2s";
+			drive-strength = <8>;
+			bias-disable;
+			output-high;
+		};
+
+		data-pins {
+			pins = "gpio82", "gpio83";
+			function = "sec_mi2s";
+			drive-strength = <8>;
+			bias-disable;
+		};
+	};
+
 	sdc2_default_state: sdc2-default-state {
 		clk-pins {
 			pins = "sdc2_clk";
-- 
2.45.2


