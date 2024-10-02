Return-Path: <linux-arm-msm+bounces-32918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8855598CB30
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 04:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1A3E1C21FA7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 02:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A0E4D8A7;
	Wed,  2 Oct 2024 02:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tMYFWKyw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C8743ADF
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Oct 2024 02:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727835636; cv=none; b=JKD1Pv53qI3UdqXN/K82F7UyULMFSuRp7XVwjbxxgVWPcy7Yp93Nj+lZXtYlWOBbcZZ1Cv4/9LQw80C/8wMywQ8mQbc6miHqWRY9G5sLNEOOSx63JIJ8yIQqQsZ96kTAyDlW2Mrk9wD9KYNsT2TC8ie0Pp2RAIQ3PAN9KQzoBmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727835636; c=relaxed/simple;
	bh=VK3mA+AhP1mrvIRSe3pu3j8qw4QKvKCuPM781iHQdpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R1Udn2MUh96v9LLtEDujUrfi1LFBMM/J9QtBKy6SKApxGKQeW3OI2chdYt0Aulo9GXc8sWuNeBDS3JasYRpIiTp43daDVwV581dF47C4KAceRTU8izSP/s1L3g56znMEOwTHdXGS2IQRRa71Q0D8EZ1LihSHxYK9p29itxRtrZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tMYFWKyw; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a8d6ac24a3bso71592166b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2024 19:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727835633; x=1728440433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzwSX8KKGAPRaj5lljRiy6wNpS+zMVuqbW0wkWepzfk=;
        b=tMYFWKyw5wmya+LnJOsoHqAh/vcol7XpGytOcGhF/s1j4yUtRsjaCbGuRaPVEWCivD
         5BgHg17UfBpvyvm9bJ8Ca4EhYx4YyRSxztLl5EOMyDHWb9QXd4zjwvO2Crm5XLBj+JTZ
         FWCvD0m9g4Oa5RZ0tegH+xQXYJje2eLYNF8Hn9AjxTQntGIQ5ykNsVMkJN2I+2QbBQPy
         dY8pb20DEp6FxPLCKYJ+5hFHmoqKXtaskrFx15Tq39arzGAbD+zfm/tErz2OifCdOs+d
         olkQsQ89SYKOwLnpX/f9gns1XK4adRHQ4LmCdkorAfmyEpZlFTtwKBuEeD8qWkV8I2MK
         lGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727835633; x=1728440433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzwSX8KKGAPRaj5lljRiy6wNpS+zMVuqbW0wkWepzfk=;
        b=qGMTkqUOnCf30qWX1TJKpKrEOQb254BwsecMJXND4xqF7gcilSFY5GN1dQTiC1bXfw
         Z1vRM4bjcaAdI5c88BkIILiK+uUMvty9+l3YMgGAn8A8AoTeMvbwhyZX1vNWf4lL9UPl
         hDdpdUyKQD9epRFa6Ivi9TP7q8A6idl4lalppCMJejgo6SBCTflsIbSqHWD47tBD5zGv
         YNuXJGwSBsjrbmtCp6aeAhcBci1sTNLjHvAdJwGQ0+1pOzd9yoSNKqV6SoN/Rd0CvBug
         NaajWMO2+lS1fs7jJC6TTL2YgJal1urAb090QRQA909lnmaDt9eEtU9776m0/Ifv8gta
         OO8A==
X-Forwarded-Encrypted: i=1; AJvYcCVMbhcqNbPFHwgBq0tuURVNdTAmfKnr35iVIRKVJP9CrCT6+0szfm+L5PxOtdmSs6ltuzQKo4M4fl7etYOy@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+7SnyeR0W1kwl3ugFo+1QkLvjCWWkhUnyqSqYKAqSgnLrBreG
	sjNgwEFBjBcefqhsFA61hjGngkV/h93g6+0PtiS+vBLxRdKgDigJDNMxLPNVcbE=
X-Google-Smtp-Source: AGHT+IGZ5ivi7b3Y/1bXAvJ8gbbuRZ08q/qwpCO5zK4rpaNumj2OK1NNdOIgEbMH7T44U5eW8iMtBQ==
X-Received: by 2002:a17:907:3ea8:b0:a8d:2bc7:6331 with SMTP id a640c23a62f3a-a967c0b46bemr535600666b.27.1727835632904;
        Tue, 01 Oct 2024 19:20:32 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2945f2esm787518866b.117.2024.10.01.19.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 19:20:31 -0700 (PDT)
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
	a39.skl@gmail.com,
	alexey.klimov@linaro.org
Subject: [PATCH v2 6/7] arm64: dts: qcom: qrb4210-rb2: add description of lpi_i2s2 pins
Date: Wed,  2 Oct 2024 03:20:14 +0100
Message-ID: <20241002022015.867031-7-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002022015.867031-1-alexey.klimov@linaro.org>
References: <20241002022015.867031-1-alexey.klimov@linaro.org>
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
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 36 ++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 1888d99d398b..7731681688d5 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -634,6 +634,42 @@ sdc2_card_det_n: sd-card-det-n-state {
 	};
 };
 
+&lpass_tlmm {
+	lpi_i2s2_active: lpi-i2s2-active-state {
+		sck-pin {
+			pins = "gpio10";
+			function = "i2s2_clk";
+			bias-disable;
+			drive-strength = <8>;
+			output-high;
+		};
+
+		ws-pins {
+			pins = "gpio11";
+			function = "i2s2_ws";
+			bias-disable;
+			drive-strength = <8>;
+			output-high;
+		};
+
+		data-pins {
+			pins = "gpio12";
+			function = "i2s2_data";
+			bias-disable;
+			drive-strength = <8>;
+			output-high;
+		};
+
+		ext-mclk1 {
+			pins = "gpio18";
+			function = "ext_mclk1_a";
+			bias-disable;
+			drive-strength = <16>;
+			output-high;
+		};
+	};
+};
+
 &uart3 {
 	interrupts-extended = <&intc GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
 			      <&tlmm 11 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.45.2


