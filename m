Return-Path: <linux-arm-msm+bounces-54742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A4FA937B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 15:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31B9C920D15
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 13:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C56A2279330;
	Fri, 18 Apr 2025 13:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="eAkgn5Q9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B669277806
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 13:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982047; cv=none; b=jdQ/M3TAKu6OAbuVfg4hnl6M1clTKWLxlDrG6CZvFRcwG7m3oL8Z1/sa15OSB70ZLC8bBFVxYI2/8Q7LotJ964NYyj+pWH7OdHfTX0LCTTCt80jzYfkuJzW/uQZBIuk/sNROsKINfKb0Vo2J2ZefJki9ThoTu10rVvnU/+xlBnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982047; c=relaxed/simple;
	bh=7W8nlNtWeSVZAoWHnHqSB5kTMZ8gnqpruhrnUubBDVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rxQ0ae7hGb2dcEcMJM+tX6P8SDe/DQS9KOFcq7p7KHN2X82EM6bJP9w8xQTbU9/lVX/4aEET1vrN2uhr5Y4OVxXAHhsCUWO11f5J2ssV5kvFPXIf22LkDJg+BWa4dWOTGyd1ymzojzChx7t5NHckL1ddAEJSyCGjlmH0bhVX1nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=eAkgn5Q9; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so279427166b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 06:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1744982044; x=1745586844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2opD8nWNn1a16aqwefGGL4ApPA8i/bb2N5C33dKCms=;
        b=eAkgn5Q9ye2e2Vof3H9Zxxsv0LeJP9fAAGs5laxIOv4OUFi2fx5QCACZYRZ1xc7FAR
         k9PGZtfBTFYAiOll6XNKqJqFtxIJJ8nfg20KnHUzemZ48ZTyZ/ITWGFqZEW7bG2Rm4Gj
         Kya4WBhcSeOcT8pyAJzSVEYMCke/7v7UycUmKbAaHwTjM4VJbYHLOF+amZEsl6YHKTym
         7LSOFXya/ftVqNcl5JkgOjDvpyvTYtvbXHRKAhtmyoYhQJk201GswqzfnsBg+5MFovGA
         2c7rvIbaTYvG+N3BYQkhdutCzPodXdJbDreqYZDY7ehxvMJzWD694U6cWKz9VuFPt53L
         iYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982044; x=1745586844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2opD8nWNn1a16aqwefGGL4ApPA8i/bb2N5C33dKCms=;
        b=U6GM28PtPv1gWGAjjmM+o3/JgSJyC5FjdUgoQ0JLBIrAq2MjGs7FZH0qZSmDVt8v5K
         imw5aHL9DKYchIrgS1hDMpfiV9oMSeUbBpHJi2u2FsxpkTHn3zp9/DS9IFuRRHPMPL+1
         cIIuS8O+ZiCuEyKGyGCfwqlqkYF+xXDVRnxDphv8LaBf/mjl4aN5JZ0/VWVEhJRIE1HL
         j9pkOEnbMlJMRkIye+aiDQdF8EAUEMn6pB/s54hwFDDAv18ONrZr1zYh0+tRgv1xqBpk
         QRaA4/NxWaKytBdwv1amU6LEYnvzA0a++VnmGM8yJ3fJWcK2wQ7QwA41kPAVRFpPxUFH
         IivQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqhRTMJ6K2Qh6GdOp200w2aWmHHbgrPnl8jRrtdtoLlK4O751oes1snwRzXj6S6UFhaAriyLActmxEsZsw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3OV+pzSsrML/YUwHaSsunQmwx+vmgwelDfqkAoL+RBpq6pPCB
	/VVCMRSVtDat5E1w8dLNaQk4Q4bcV0s8JNGffqbDgw4IusLRaw503uYJrC7SISk=
X-Gm-Gg: ASbGncvwW8SmXpTxT4mVebKXPpZfY/gmgsFHlt1hRtf+nd/RWOMvYNL/a+92O3lrwgo
	hcIwXExGNGi/9Of8D7yYzm9iouQnc3qavi9SfrCZMpOWv/VqaXOxXUgDV00cWq7SPQOSSAi6aYB
	VbkSLpf+SZcWpgX7P9Y+ul6SZZ8bGEBNcMTPEb8zDBJazp5y6NmICpCkWQU/+hfV9V5mJqCv+XF
	IU/hpClczl+I3G6dHn7sSwCs5hFTD4weI8AxManCLq4neg0b5GJLCMo0sHvE9Uo03h4zgi70Kda
	3gWnHPvqTDNgwK4PB6MSDwzBbmhmWdTa8R4jjVJD2XoIOHmy9zbN35Yo1kjJ1KkDPblmzPZCI24
	1w+Ke0KMJWriJmg==
X-Google-Smtp-Source: AGHT+IFTPwO4j2zMKdap8t+bRIhg7rN6LnVakCV5EvwVUc0rb5eLZEGy0q9hARUTa5SmeCSVugZM8A==
X-Received: by 2002:a17:907:96a4:b0:abf:4708:8644 with SMTP id a640c23a62f3a-acb74d85693mr230821666b.43.1744982043795;
        Fri, 18 Apr 2025 06:14:03 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef41605sm115901966b.124.2025.04.18.06.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:14:03 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 18 Apr 2025 15:13:46 +0200
Subject: [PATCH v2 5/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 DisplayPort sound support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-fp5-dp-sound-v2-5-05d65f084b05@fairphone.com>
References: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
In-Reply-To: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add the required nodes for sound playback via a connected external
display (DisplayPort over USB-C).

In user space just the following route needs to be set (e.g. using
ALSA UCM):

  amixer -c0 cset name='DISPLAY_PORT_RX Audio Mixer MultiMedia1' 1

Afterwards one can play audio on the MultiMedia1 sound device, e.g.:

  aplay -D plughw:0,0 test.wav

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 9e8f9fb57c4723a24704a8239a86c6081910916b..e115b6a52b299ef663ccfb614785f8f89091f39d 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -14,6 +14,8 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include "sc7280.dtsi"
 #include "pm7250b.dtsi"
 #include "pm7325.dtsi"
@@ -1147,6 +1149,35 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "fairphone,fp5-sndcard";
+	model = "Fairphone 5";
+
+	mm1-dai-link {
+		link-name = "MultiMedia1";
+
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+		};
+	};
+
+	displayport-rx-dai-link {
+		link-name = "DisplayPort Playback";
+
+		codec {
+			sound-dai = <&mdss_dp>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai DISPLAY_PORT_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+};
+
 &spi13 {
 	status = "okay";
 

-- 
2.49.0


