Return-Path: <linux-arm-msm+bounces-76147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BEBBC0020
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 04:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AA3174EA903
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 02:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CC70218AD1;
	Tue,  7 Oct 2025 02:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dQba29WX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDEE21D3EA
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 02:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759802633; cv=none; b=i+T0+JxnTBjcgweOIQFiQrJ3Hjc6N+4yY2xiMyWhp/6y2c/sTt3uFC0cgLjfK4yZBSW8FDZErvy6FiP2eG1rXrD62WL8YBzUZNCDtQc3MCDzuxnF7Wb8cK0Yj34ZUu0Uo85WzLXBMWeJz3tGO0mob258rNhUTy/JuOa0DL7LLIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759802633; c=relaxed/simple;
	bh=ViBe2WMm7kQxPxeRuekDdL8WZHiA1GXGLJT0PDfx7w8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l6orCUHDzlRDqgbZ6nIQkCC6HVj73p+yFLoNv/+Jgwf1t6p/yP9VSIwVY4RCas+4Q6jN6OxAUtuOs9i8evUEKhEarl35/swZUOiw8NQ3Ka3W6REfGrYNCqOldFxhDnWCoxKUK6J7xLKkrOL3J7NKsIcRAAe9YCbCiD61mn8pljA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dQba29WX; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-57db15eeb11so7023124e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 19:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759802629; x=1760407429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ysY18u2zKYmywl9mq+ndQhWk6KHVBYX5HfqkCVFIYg=;
        b=dQba29WXjmFucH7DB6LsQxcSWRfLBU4ysxtH8pJ3y3TLKDlOKCq4AiHFjjTs7O+kjd
         lQaROupmoSSA6TrszH5HeQ5MYJZdvRFWIt3kkIr3JmOV5u/5CPN0bRnGCUEcvN83/UlP
         uo7IjvukruYtoGtz8Mp15T+PNFSRabSLI2+rqmUw/7GmLRuqmf/bvNrc4jrUBjZopJHJ
         epPDJOOtJFOIIpjqbyTEW/bFlQeBtPLiZ/O7nxkXe/ooqs4VdruEY8+tz2Ov8CR4mp1p
         cPAFDIOT29DHok2hJE/cpS4lcHmCBUjSd/sF+ro9q51ol5i52g9V+ZvwtWzTuxXyGA1A
         Fgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759802630; x=1760407430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ysY18u2zKYmywl9mq+ndQhWk6KHVBYX5HfqkCVFIYg=;
        b=oOjFxr7DCCCZzJi6zenwwy88scfMqOmafq/uTjWHIMlbNv2SyaqhEl4tpdUXaTdtVh
         zMM9DVZr0jSePfowW0dGSYaokgyOdu4Z30wvZTXD4hsVIdRiJP2dQRbFrPpt7/l+EV4w
         V2MvBpmTRmhMTtumL72vZOjLd+vmgsgJyIBiLY+yhRcoH0Tn74gMpUi1tyRTSpwFBH3H
         oxMSBO3hn/H5elVfrTi176fGalSyUdVdaWJZta1YU+pDLKPVbakbJCvSEUuRockFFdvj
         2P21ZqkSJzGxRtgAWC23sAm7ZtCuB21F15uEQZsnKIyOk5SJDFylgaDx3rX6Y4XqABZg
         jRtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJUsXoK2icZ9m4c1ut6cFcAFeTS1R5kBFTA6Ybni2c2OWNVE09bSOhGT4q3W3q9gK4B2h5yHzpjYIMF7RG@vger.kernel.org
X-Gm-Message-State: AOJu0YxYogiVoGugf//NbHmnjXdduU73Co5MTCQk1k0/jjvbZhkrRq6/
	N2ZXYfpr874h6hhLuS8S4BnOg9wHzh6K4ZI2QeODpmfNyKJGyG77tNkJaKviaaIkGTY=
X-Gm-Gg: ASbGncuAv8oYSy0lJpJsEBfoNuzSRu309MFzzy+Z5q/UFQNewS1miqGNXwDPfBM3wby
	YQIMz+D/6uEMMTInmfK3oLEl5lJ6vpX3ZHNudNLGZFTSRLC03j8xNPhgPMVViD9b200excXLth3
	O8Htuy28GD0KrvvUXGL98VNj6chk688a5SIFBq5d/iW3B3+VTNjz8H/edE5bFBYLsWrTe6aI84n
	nkAMvrH8cInc/uGQNi0qPStZInRSv5vh7D17zBfMwby+WUF+4OjjEwMYq4q/5ZklZ12SKKFeG+6
	64Stf3y4ACQXb9TEWzbr/Ghbv6hAWVPNDdtCC96t1HPkzGXl3VTUOuvnmWGC14/bmi4g3Ceg5D5
	aVmjTZIiLY6OakW9GC6RubwTGXWjSZXbe45qjnnZBRF+sMvz8LgllDnm9qTkGMylhppU=
X-Google-Smtp-Source: AGHT+IHIQAFDlaxnS/YPLaaZASPGtjzqUskbAEsgwJPrLjmMvYfFHi4ayVxMDpBzxLLkErDPJhx74Q==
X-Received: by 2002:a2e:a987:0:b0:36d:4996:1c4d with SMTP id 38308e7fff4ca-374c36c4b2amr40767031fa.9.1759802629528;
        Mon, 06 Oct 2025 19:03:49 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:22ae:baa0:7d1a:8c1f])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3b81e45sm5150391fa.46.2025.10.06.19.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 19:03:48 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 07 Oct 2025 03:03:32 +0100
Subject: [PATCH v2 4/4] arm64: dts: qcom: qrb2210-rb1: add HDMI/I2S audio
 playback support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-rb1_hdmi_audio-v2-4-821b6a705e4c@linaro.org>
References: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
In-Reply-To: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>, 
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
index 67ba508e92ba1f0ef3bcf8b248eae125de059869..4ab5d3379ed22b43675284af40eb7f9304fbe1ef 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -188,6 +188,53 @@ vph_pwr: regulator-vph-pwr {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	sound {
+		compatible = "qcom,qrb2210-rb1-sndcard", "qcom,qrb2210-sndcard";
+		pinctrl-0 = <&lpi_i2s2_active>;
+		pinctrl-names = "default";
+		model = "Qualcomm-RB1-WSA8815-Speakers-DMIC0";
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


