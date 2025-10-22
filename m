Return-Path: <linux-arm-msm+bounces-78258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 45608BFA2AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 08:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D2E7B4FFD60
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 06:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E05422EE5FC;
	Wed, 22 Oct 2025 06:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cevypGaq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F782EC097
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761113231; cv=none; b=RrT918BijP7a5yyBx06J1wVO1H9ONcRTZcxF5R1dF09ty00K7421Gg+2rio3Bmu5UN3y/Sx4a/NTan++QLcOigBicIfBJO8AHjoQ2LNki2KQg7BV+aXQHZiz0E/MtV5cFggb9wvPoPx9beCJFdHaSEkd7FxQWJpwtEIk5mrcPH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761113231; c=relaxed/simple;
	bh=PuhNIsXn9gttM7pCatxgdPRfxI8eKFytwCjci5lswhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bQ63Lrz1AMwMIooVdfrsyLdp8BLasRrf6zoGrByhTy8dqiFxrat/ea+rNXuuEBy1WQpzNq9tt5w5p8+8A2eRxtvfIpGOeHB0S1dBOPM3vIxqhe0U2pSHNo/HZXQpfXlwWztXx5FyJR5oW4vdZMJFTg7M737E/z8Aib7PYAKLMEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cevypGaq; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47103b6058fso3776085e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 23:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761113228; x=1761718028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//34rvi82AnqDieMydgJVTZIokdiMPBeG7Fzj9fzlEE=;
        b=cevypGaqq4Yjb7c9GIucHbbdDlu7F7uQaBeZDemrIYBH6XVdDnQrKLqaFzaYLeigE8
         7mLjKDDCaq1RrAcnRTCnS1O6JeRC3efFAcnBjj4QpHGkcTDaVFSiUD8qpMKZJdF5F+eH
         ToEXXmtlvT23SImzLdVH9tcTRRaW6RfWAbxf/LyiztZ8FfBDFYdSYBp3mlGtlmomlTsQ
         G6ay55j1bXazqa//K8VBAJhYvhi6+vODYxD6nP4tjt/+KgfZ5tKOOHOoeGTbSfOStaTY
         0KLy2AEW0llKfsT1BmWdA/9DJkn9DxvYCR4EN3CJfvh8tc68rbORL54iF25b/3jlBj8Z
         2grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761113228; x=1761718028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//34rvi82AnqDieMydgJVTZIokdiMPBeG7Fzj9fzlEE=;
        b=PqRLFIjpc3/LOiVFbgIrxTmYyANvA+X2mhbeIisE8WZGaMr6Ef36z2aHGz42kFf54Y
         DyiK+laoNGNxwVhu8MIbb88x8S++7RIu9VPA3qBudtSNZ3lbqw//Wv2hQ5JfElM4NQiC
         +A346Z8qjKfTbFieqIQEj1MXeI7ng+Sr9R7S0MhDCZJRI1fcdeiNc02SSlUNm3bDhYGy
         PEtiIrsHAX4QafIG2I+hMTPB0YO87YWemlNt169TIT8wAePga+9iktbtFbyaTM8TwV9V
         TKXilmmH/cyFKEPn7OctnBvdRYmt8dF0CEOfe04nxtX3oF3H0JTuJ47FzwlGp8h/t18j
         /qog==
X-Forwarded-Encrypted: i=1; AJvYcCVJsYLPFpN8KfP2aQJZosEItvn7ZWAsJ06HNktLdCoXPDf4XyN5jmJ4vb3j4WP8B/HHoZ6WoZyWIpyTs3tX@vger.kernel.org
X-Gm-Message-State: AOJu0YwI1phygIh0uMIRSSPWndxvLEsVjl4RI/AO2YK0VNVYRf+w8FNe
	C4oAxS4js++p6viX0FUk3AlpteH19ciG142no4rdaoaGslYjeN3P0dh+gA9CNTqUzmI=
X-Gm-Gg: ASbGncvB//xd6EmJlqZ0aDWIgB94U8JcZvd8Eh8FPI35+kp6lPW4jRvotetIj4cRUVO
	GGWO6lY35S2Gglu4ujhwQM0aa/p27tPpXlMo5DCFvFSGUHvXK4Y0RZcWdiLUzoz1VDf3q9BKkpc
	ewin2GMZiZ2Zf80mDxH0cM3TXx7HIC1WykN3oQ3NwWp6lv4wqVYqFifPn3UIaCvgE+2nQHB5PFy
	baTKO9xjOLqiryeGRlzsDOyUbIQp/Rbnrpdi6I8Mr9AqEBNHIlbIANV5u7XChqfV/QeMBLFQ3nl
	eRVfSmXIaEHFmAQ4OWBnTxPKoo5SGMmhA+Im7dWCqb2eylDw3iOMRTFUfZnWYUHiIftyVlwyNcC
	O8S97QklVEQvVnL1Rk6L817xCGDC5UwQuLBLgDSt3dfFKkScJNn7j5PeHyhLVac+Je/XFx4/NaC
	yXPWm7F/i6S9VQPbL4
X-Google-Smtp-Source: AGHT+IHpMXyFR/tPlDOICiK+dKxQNn4WouM9bvYwnhmK6iquazWF671SAXHrZLEjrQhXYCPWxy5KoA==
X-Received: by 2002:a05:600c:5d5:b0:471:331:8058 with SMTP id 5b1f17b1804b1-475c6f20089mr1241255e9.7.1761113227744;
        Tue, 21 Oct 2025 23:07:07 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:11f4:2b3f:7c5a:5c10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a75bsm23794067f8f.23.2025.10.21.23.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:07:07 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 22 Oct 2025 07:06:43 +0100
Subject: [PATCH v3 3/3] arm64: dts: qcom: qrb2210-rb1: add HDMI/I2S audio
 playback support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-rb1_hdmi_audio-v3-3-0d38f777a547@linaro.org>
References: <20251022-rb1_hdmi_audio-v3-0-0d38f777a547@linaro.org>
In-Reply-To: <20251022-rb1_hdmi_audio-v3-0-0d38f777a547@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Add sound node and aDSP-related pieces to enable HDMI+I2S audio playback
support on Qualcomm QR2210 RB1 board. That is the only sound output
supported for now.

The audio playback is verified using the following commands:
amixer -c0 cset iface=MIXER,name='SEC_MI2S_RX Audio Mixer MultiMedia1' 1
aplay -D hw:0,0 /usr/share/sounds/alsa/Front_Center.wav

Cc: Srinivas Kandagatla <srini@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 55 ++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 67ba508e92ba1f0ef3bcf8b248eae125de059869..43af25d17aa8314354b1ecb8617510cdd6c857a3 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -188,6 +188,53 @@ vph_pwr: regulator-vph-pwr {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	sound {
+		compatible = "qcom,qrb2210-sndcard";
+		pinctrl-0 = <&lpi_i2s2_active>;
+		pinctrl-names = "default";
+		model = "Qualcomm-RB1-WSA8815-Speaker-DMIC0";
+
+		mm1-dai-link {
+			link-name = "MultiMedia1";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+			};
+		};
+
+		mm2-dai-link {
+			link-name = "MultiMedia2";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
+			};
+		};
+
+		mm3-dai-link {
+			link-name = "MultiMedia3";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
+			};
+		};
+
+		hdmi-i2s-dai-link {
+			link-name = "HDMI/I2S Playback";
+
+			codec {
+				sound-dai = <&lt9611_codec 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai SECONDARY_MI2S_RX>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+	};
 };
 
 &cpu_pd0 {
@@ -323,6 +370,14 @@ &pm4125_vbus {
 	status = "okay";
 };
 
+/* SECONDARY I2S uses 1 I2S SD Line for audio on LT9611UXC HDMI Bridge */
+&q6afedai {
+	dai@18 {
+		reg = <SECONDARY_MI2S_RX>;
+		qcom,sd-lines = <0>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.47.3


