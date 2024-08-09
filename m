Return-Path: <linux-arm-msm+bounces-28224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 000A394CC56
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 10:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 774FA1F23537
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 08:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFDDA1922D3;
	Fri,  9 Aug 2024 08:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="NpluVjjP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF779191F63
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Aug 2024 08:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723192457; cv=none; b=quf7oKDnNgLaaBxv4+luEPi5rmxkpCWViB5/4dx7HbbvBpIVlW764Rl6LwSO9BNTRHrj8+1s1D5uetwPegXTSz5R8eG/vHQ2goBNlfR0W4cPPBYU9+4g+kALzxr3lBWOsCPTolFohpSVILA6VPP5qgYR0cnXiDuqXKxLjDO4Qd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723192457; c=relaxed/simple;
	bh=OI0BTlanZ3ouih1Oc8Ys+Q4/CwcrtvqnlxKkb99HXII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bso6pcLzzuqQtFBCmyf5aTzlMdEwlV6H9SiBcxd1sV5y7YOpjMCtKoSjoM9e/8ZPnPwGj+spuwu6pWEhf4fxI+WBRS4l6oKxFnxykai4pSu41lqEYN50d92dvxVDLi1F46M3yiK2yeSvUqQNALikA5Q9OJbI8M+k0hqeFxDfGDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=NpluVjjP; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5ba43b433beso2056175a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Aug 2024 01:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1723192454; x=1723797254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SY4fryrxNkvZgli9BRICsfInr4nHVNsC/F28oVigWAk=;
        b=NpluVjjPupcYcpoNGGUuKRsFEmM8tuxoI24HaNfPXgrQDoojRfokOtGTjCeGS898NX
         DsW5ZTsdPMU6aCEmOQ4KqyqDRnkLZYcbLPhElpnrYw33H4o85JxrnrBXH1G0UmrCTbkN
         7bjbaXHKPQBaLQxpJNzFhZs1DOFsuNnvcwLWuSb4UDi6sTErXGzSX0/tF0CVXKlB9n2I
         EZpKCWFFqISSNZau/9ZRK96VEQfBjmq1MgQ4X0ys1oO5TPUbP2DSlMwCSB2ykgPR/iDc
         TkKgD6toxLAm9DDy3+hLYT2Pdu+8X2DtTrVM08LGogoBC4WU4jHpSQorHyxNIcOvS7Dq
         StXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723192454; x=1723797254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SY4fryrxNkvZgli9BRICsfInr4nHVNsC/F28oVigWAk=;
        b=Frk1LvB+1Eg92dUZZ/TLC56E2efSZ+Rkqok+edzN+ihxNQam/97ROqsdRvKEgGyOqa
         li3tqDJJInJ6O3Fn8/ch3KemJVjkjw72z1PeePkURjUpLlLoP1d14NgKFNChqEGKWKNi
         f8es5sb+ER3yDrwQuMD64Fvf2TKJc1t2/jbf60vxlCBlOAe/60W+iXUJdJhcvOkDlnhM
         TsymivwAVXyZmOKZXVsAo/CPkN1PVn9IJjLmkgzuNR5d76fJb6g5Fcj4Kb0MmcAYBTZI
         MnnBueCMAbS2HFnx3B0ZbhW5K0UGE/NuNkznGqfH5Kd2EMEQy1f3n2Oso1yExPakIpB+
         hzKw==
X-Forwarded-Encrypted: i=1; AJvYcCV3u4/NVBphoJ7U8FxRO5jeVZai1Fzof1gmw63+TknTh6rjAOCWi1ww7w6BRVulZB4EWpSLlQJ1eaFgJEBtz/M6zhPcqQWhhIkoFNnPxQ==
X-Gm-Message-State: AOJu0YyaD9aZm1OA8Tw4andiJBQUtO1YoWzkMIeEp5MNmyuyT7Sp+J3U
	r/gaOhLjovhKG1JT88fs0GLn0xsJ0WSvwFfp4MW4enQPhmZSe1Vl9/zD1gITYCg=
X-Google-Smtp-Source: AGHT+IFR/fUi2PxofvVcuUfiPXGSTvHp8HjNo2okFizvskVBpDGatZfaIDw3fHAvXy9BNCnQOZOyKg==
X-Received: by 2002:a05:6402:4309:b0:5a1:b42f:c93 with SMTP id 4fb4d7f45d1cf-5bd0a588be6mr680639a12.13.1723192454170;
        Fri, 09 Aug 2024 01:34:14 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c41916sm1336288a12.41.2024.08.09.01.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 01:34:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 09 Aug 2024 10:33:59 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 DisplayPort sound support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240809-fp5-dp-sound-v1-3-d7ba2c24f6b9@fairphone.com>
References: <20240809-fp5-dp-sound-v1-0-d7ba2c24f6b9@fairphone.com>
In-Reply-To: <20240809-fp5-dp-sound-v1-0-d7ba2c24f6b9@fairphone.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
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
X-Mailer: b4 0.14.1

Add the required nodes for sound playback via a connected external
display (DisplayPort over USB-C).

In user space just the following route needs to be set (e.g. using
ALSA UCM):

  amixer -c0 cset name='DISPLAY_PORT_RX Audio Mixer MultiMedia1' 1

Afterwards one can play audio on the MultiMedia1 sound device, e.g.:

  aplay -D plughw:0,0 test.wav

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
(from cover letter)
Unfortunately DisplayPort enablement itself for Fairphone 5 is not
upstream yet. This is blocked by DSI display bringup upstream which is
blocked by DSC 1:1:1 not being supported upstream yet and just working
with a hacky patch. Nevertheless, DisplayPort audio was validated
working with no additional sound-related changes so once DisplayPort
gets enabled, sound should also just work upstream.
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 8ab30c01712e..45d4512546fe 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -14,6 +14,8 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 #include "sc7280.dtsi"
 #include "pm7250b.dtsi"
 #include "pm7325.dtsi"
@@ -841,6 +843,12 @@ &pon_resin {
 	status = "okay";
 };
 
+&q6afedai {
+	dai@104 {
+		reg = <DISPLAY_PORT_RX>;
+	};
+};
+
 &qup_spi13_cs {
 	drive-strength = <6>;
 	bias-disable;
@@ -914,6 +922,35 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "qcom,qcm6490-sndcard";
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
+		cpu {
+			sound-dai = <&q6afedai DISPLAY_PORT_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&mdss_dp>;
+		};
+	};
+};
+
 &spi13 {
 	status = "okay";
 

-- 
2.46.0


