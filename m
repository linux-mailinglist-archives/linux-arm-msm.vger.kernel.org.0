Return-Path: <linux-arm-msm+bounces-19685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0A58C24D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 14:27:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7BDF2816F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 356FA16F90B;
	Fri, 10 May 2024 12:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="qDiGUUcG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA0412A166
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 12:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715344043; cv=none; b=k5Il2G9pn1mnkznqbJhPGO7YMHpqqjqjRKPVoMkYrZxDBIeYB3ElO4yZhT5qD7Rf/f1QsoNnaizK4mi2w/XS2Wr4rK6fjfqODr/1dsREh0l36BAO2UD6Nb1wZeJXH9twCvCh1+5uYOUQxq5M8prsKMCMu9pa2Jjfslqy1p++WIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715344043; c=relaxed/simple;
	bh=fVRg0B+SoKGyQZjZGM35V3zycwmERzXO4crppui7oW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dt/zJvFDrX7kSpo2G5J2FuIMAbyldm2CmK73wj9cROohPpnNOHRzR5ArATVS9HNfOu+IirbGLaAWFciwccE7R1iQXpMyVO7+QB4JqweMaZ3AX+4/HJ6A6GGOs0C7hEsj0SwbvHW2z491PZcjFeUYwVvS6l4T4qqrmInHZrPr+w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=qDiGUUcG; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a59a387fbc9so517449966b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 05:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1715344040; x=1715948840; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+mcIqLuJJPw3GiMJfbLNtSKUQP2lsFTPw8ADS4mj8Dg=;
        b=qDiGUUcGQPj4ZkBovTn1ywv1ie8jJ/zs3nfLD9y9YMa1mbgHpXAs6QluP9ktsvPsFS
         MtARIyixoIgBs7OqyJPVf2sT6nY1d1GpPY26OCXfgE6OypaQBp8CN+Z7JhsqKiNY/+9d
         aS1vDujZTDQsSEiQZTcO0Z0WOb6lzNoxDMSJvy6MXnCmLuN9401DfRGxYo92BhWtSb21
         PFvum/MrdSz9tWpoGGLUfX+HxWzNaNmurPZRZW3afngozUW7ZQ0SPZsoVjy0hDA7NhJa
         XIRDVdHlr/i/xalkBlloSfsumr07KiVGIO4WZGvEjpgV+3jlaIMm96QT+SbcQNdVeLGT
         UO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715344040; x=1715948840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mcIqLuJJPw3GiMJfbLNtSKUQP2lsFTPw8ADS4mj8Dg=;
        b=IhxpaRsi/woBM1Zhs8fQXRCJzPoF4a4YmIy3fN3LjLDcVSaj8vZPZxPkkgYEPzd51O
         jl9cHCSEM/bFqbR6uMvw2YOD9vUK5Uqy13+rHnOD2u8NDihu8kzTAJRkzgZWjQUlq3q4
         7ya52J+RmhSICUUjKqptNuus4PWzGgwzjBJiXI9D4w2QwY4rtj9qjcJwTRbM3JOC24J9
         hqgmYfEFgMtN2feG0xYbnn1ydRxRyWKxSZGBDSkkKfbpG5MBHTBag1guvoZIdke7QZX7
         Ko/C1BdOFpmxR+jeK3XugHWZMKLoLhu1lWmQiEXyDDY5nS5+9e4UjxLqzJDXaTZuDdra
         a8sw==
X-Forwarded-Encrypted: i=1; AJvYcCV7lYwplC38XsrBDWy8B4JNBSl9CVwmlPTUalSofA6U1g5HqVwVnHA82wmcy12nnQvKTgU//TuSQtQED65jvqGZsBKqGPcZ9oWW9zfGUQ==
X-Gm-Message-State: AOJu0Yz87PPJSpkZJ4DgREjFZlERM7aBiHkBSDyMfAH4VzQ8x5xdI1f5
	8n5mz2rQzdclt0lB+c5lxaL+jKDm/hMA1HeXeq1qerCSOjlvxaJg2txRFYES+m4=
X-Google-Smtp-Source: AGHT+IHRZ6F9QRbCi+Ce6mddApr315w18te4B3o9cg98Wf4XxL2oksDu0esFm+ifb+xhkWK/GDdzIA==
X-Received: by 2002:a17:906:3c56:b0:a59:f380:1823 with SMTP id a640c23a62f3a-a5a2d66b493mr165210566b.49.1715344039844;
        Fri, 10 May 2024 05:27:19 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (2a02-a210-20ba-5a00-9ceb-707b-2d57-26f7.cable.dynamic.v6.ziggo.nl. [2a02:a210:20ba:5a00:9ceb:707b:2d57:26f7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b017b1sm178043366b.181.2024.05.10.05.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 05:27:19 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 May 2024 14:27:09 +0200
Subject: [PATCH DNM 2/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 DisplayPort sound support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-sc7280-apr-v1-2-e9eabda05f85@fairphone.com>
References: <20240510-sc7280-apr-v1-0-e9eabda05f85@fairphone.com>
In-Reply-To: <20240510-sc7280-apr-v1-0-e9eabda05f85@fairphone.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, 
 Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0

Add the required nodes for sound playback via a connected external
display (DisplayPort over USB-C).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Depends on a bunch of patches upstream doing bringup of Display (DSI),
DisplayPort, GPU, and then finally audio could land. But we're blocked
on DPU 1:1:1 topology for all of that unfortunately.

And also machine driver for sound just exists a bit hackily.
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 05bbf1da5cb8..2bbbcaeff95e 100644
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
@@ -774,6 +776,12 @@ &pon_resin {
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
@@ -847,6 +855,34 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "fairphone,fp5-sndcard";
+	model = "Fairphone 5";
+
+	mm1-dai-link {
+		link-name = "MultiMedia1";
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
2.45.0


