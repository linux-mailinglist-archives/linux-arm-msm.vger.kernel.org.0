Return-Path: <linux-arm-msm+bounces-34838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B84E9A3319
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 04:56:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FEFC1C23511
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 02:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B08154C00;
	Fri, 18 Oct 2024 02:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n8Y+azj+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5171017ADE8
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 02:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729220107; cv=none; b=Ov5PZMwMP27ZgTeUI1QQIsfLlOGPtwXbfO0d9jVXmAj552uGqXaLnNpJHaHOx1CIzO+q9+51szbTWwY0MH69ce9YeEGOmu9FwXICVNLDsFLBH3rd3FFmqV7k0jHhAcbm+/q7oqqck7k9PddPNgVZKsRMBTQkwD2lkl3KwBL715Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729220107; c=relaxed/simple;
	bh=ZVT6El7iz922hDOLpUqchub2X741fAdkUYp69UrPaoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bJYWGKeKJ78/HRHrJer64BASPfT78kDTt8jcnIkfukC3bSAy939q4raPfImojtu1KoSfCHNS7F4QY3qb0KipVbT50eUYJs/GB92En5tTe/hszaUOL7UlyncUjVTdrtguLCVLJaYCNqCBxaQXiRf08uDjR8OqT+r5yyQJzEQ1qwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n8Y+azj+; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37d43a9bc03so1045725f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 19:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729220104; x=1729824904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TkCC3xeL5jRNwjkZxx9c+emYe/54fbSEayFnAD+hbQ=;
        b=n8Y+azj+bK59AnxF5y5+swCXdpRZ61pXM1XTY0WIzXRlMNy44lMS2VyabSFUsSVE7G
         E2tJNrfMSkDvPY5MXuiwqegeQxOYPBXnQvuJW2dpgqS8lmtbnAzq6qJopQ3WvV20XVTA
         Zlhs2mQNnd8L7fu3hFJD/82LXX9VxtAe24r7oOGQOVZKQSi7odhVXJj7mtLybevUOWYa
         pcw9gp2sIjRpMS/15QTQdTZbzcWlO7B4/4CGM/C09T5Fan7xVIfejygu9KLil8uw0ID4
         FEGm6jtnApOHEziLVxwpIzBQEdK0/mAQvyIT4Pkuirht2hLjSA3OMLGo1iz1XZFvf3TT
         20TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729220104; x=1729824904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4TkCC3xeL5jRNwjkZxx9c+emYe/54fbSEayFnAD+hbQ=;
        b=Y5HIOrNKrZ98LC1G9kraptrxHjrsBwenHldydom96S6z0YfCbAydrvQd1UAmT/mquU
         GPBvaLdODiV9yraiInDcKcxMIj4xG4y+OzcbVaYnlAzlzM2STxuoyZ1iWJWP9NmyXvjl
         ZU7kFZdtBOEFwf89SGvQuCNeqEWRk/9Jm3VAbO1SpLi4Dry+mhWW0Sy8yDbaoxx0cuZE
         irh+FomiScZGYK3xLMTmShQeap6cTozY73WoYgGYfS6z9cUy95mUAzfBFQzNnrEaRy6o
         5h2OIeW8qY29c/+F6F+tsoK4PNXu0mySK4MbK5lPCEYm3l7hodjHeEdiF2rLnl6O32m4
         XSuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcHj3hcsasW9ECIn8vjAiHGBWuXubK2gVFZxEm4EXrZFpwxs4sbDH0YZYHpQxqaBYXq7O1wLjOXApXn2iL@vger.kernel.org
X-Gm-Message-State: AOJu0YyGSH6TFJ89SgMXYeSiXFLNUPmuFf/wqQKXJ8TJoIK0yqHeBSrm
	zQ3Rp6Lv5P7FtuL/w6Wn4zmxsyl23d83VuX8yYnhc+UBhlnUzk+PU6wZEE92xDM=
X-Google-Smtp-Source: AGHT+IHDV7pFYa3NXkQh4aK6DpE6INTXZK6209FUOzYSDD9ZHBdPaCJK6U8wzGyi6zE3YqCtg5L0eg==
X-Received: by 2002:a05:6000:120e:b0:37d:5046:571 with SMTP id ffacd0b85a97d-37ea21918c9mr519548f8f.22.1729220103586;
        Thu, 17 Oct 2024 19:55:03 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0ed599sm596135f8f.69.2024.10.17.19.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 19:55:02 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	linux-kernel@vger.kernel.org,
	a39.skl@gmail.com
Subject: [PATCH v3 5/5] arm64: dts: qcom: qrb4210-rb2: add HDMI audio playback support
Date: Fri, 18 Oct 2024 03:54:51 +0100
Message-ID: <20241018025452.1362293-6-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241018025452.1362293-1-alexey.klimov@linaro.org>
References: <20241018025452.1362293-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add sound node and dsp-related piece to enable HDMI audio
playback support on Qualcomm QRB4210 RB2 board. That is the
only sound output supported for now.

The audio playback is verified using the following commands:

amixer -c0 cset iface=MIXER,name='SEC_MI2S_RX Audio Mixer MultiMedia1' 1
aplay -D hw:0,0 /usr/share/sounds/alsa/Front_Center.wav

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 55 ++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 1888d99d398b..5f671b9c8fb9 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -6,6 +6,8 @@
 /dts-v1/;
 
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 #include <dt-bindings/usb/pd.h>
 #include "sm4250.dtsi"
 #include "pm6125.dtsi"
@@ -103,6 +105,51 @@ led-wlan {
 		};
 	};
 
+	sound {
+		compatible = "qcom,qrb4210-rb2-sndcard";
+		pinctrl-0 = <&lpi_i2s2_active>;
+		pinctrl-names = "default";
+		model = "Qualcomm-RB2-WSA8815-Speakers-DMIC0";
+		audio-routing = "MM_DL1",  "MultiMedia1 Playback",
+				"MM_DL2",  "MultiMedia2 Playback";
+
+		mm1-dai-link {
+			link-name = "MultiMedia1";
+			cpu {
+				sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA1>;
+			};
+		};
+
+		mm2-dai-link {
+			link-name = "MultiMedia2";
+			cpu {
+				sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA2>;
+			};
+		};
+
+		mm3-dai-link {
+			link-name = "MultiMedia3";
+			cpu {
+				sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA3>;
+			};
+		};
+
+		hdmi-dai-link {
+			link-name = "HDMI Playback";
+			cpu {
+				sound-dai = <&q6afedai SECONDARY_MI2S_RX>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+
+			codec {
+				sound-dai = <&lt9611_codec 0>;
+			};
+		};
+	};
+
 	vreg_hdmi_out_1p2: regulator-hdmi-out-1p2 {
 		compatible = "regulator-fixed";
 		regulator-name = "VREG_HDMI_OUT_1P2";
@@ -318,6 +365,14 @@ &pon_resin {
 	status = "okay";
 };
 
+/* SECONDARY I2S uses 1 I2S SD Line for audio on LT9611UXC HDMI Bridge */
+&q6afedai {
+	dai@20 {
+		reg = <SECONDARY_MI2S_RX>;
+		qcom,sd-lines = <0>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
-- 
2.45.2


