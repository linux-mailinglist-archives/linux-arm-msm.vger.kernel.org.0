Return-Path: <linux-arm-msm+bounces-24548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A39F691B47C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 03:08:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D48511C21613
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 01:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD3F20DE8;
	Fri, 28 Jun 2024 01:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qg2B1Vno"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D281BF37
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 01:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719536845; cv=none; b=cNG4mUbCR2JMowJ+wpel7Ej1+8wA6rVkQIDfi/SYC+j0TmPpC8ON26CrORQogJezJCKmrbW136BZhkzT69qvJuY7UOtZP5F6uXt2lQAQGxegK4FP/AyKP7jk+j3xf+jPjrcJipvjS7seB4v2T12/TmWy8wb7miNEMYyYszsUmN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719536845; c=relaxed/simple;
	bh=eAsxPRlEzNTeurZUlbb1dRpSlSCLeJU/Bps8eIDqRWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EGjbIE84dCzF8jVehY7n/kXxal4FZvoiMKgdfDZfE/68Kb6XRnwnu+2tu8tErxGSLSKlyRZLwHKivPXRdlSQCsSq/BunkK94qlkkIzM5WWTKSOfSWIy26NUYLcFIbLiqAbbqkbCUJc1Wr0zR6ykTFSjwPWoeAJAbf+siA+a6aQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qg2B1Vno; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42563a9fa58so572585e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 18:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719536841; x=1720141641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8Cullp4heLq3j3LJu15lP4LYL9Xcky4j2OZDLvmJ7E=;
        b=Qg2B1Vno0FL8wBBbo1dszQ+DE6LcDB+7iaAYYF4QjvboPKQeK8Xow3V4/RDmBAbCkx
         ESeGs1eFBpB7v7VAA2EfCPhiqBxVygFrTtrA7ZB3GYzpVh2XTjPznL6BmnQkOHby5XNg
         aLPak+1WhmEscosK2YQ7SEnkKbZD+mA2ANj6ebQ3/WLUQNlL4uk6gX2AvFTrWk72vzbq
         SzBaM7qIR8zWRkUMjjxPzek6G1TAvQKLuCVomY8g4nAB9sF3iN7ZgCW+6BAM980pwUxS
         JBApRM//hpR2Ul+Cfvtom5TYgcgUJKPaAlLUqaufOgnQBJE9ILeWCgag43YJWH2KJarC
         EIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719536841; x=1720141641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8Cullp4heLq3j3LJu15lP4LYL9Xcky4j2OZDLvmJ7E=;
        b=dllcU5OwPf7SY+0UIFlmXk8ZG1Xd5hkOFnGlFpca3Ri9WWjGU//kj4YEhULTEAmDub
         EMRL8ReFXvur/UP2Fw+Iho8hREG9DPQeYnF7sQplEx2mqd+tKwpf0MzvFkbhzzxhhT4E
         KP2c0DEix7wHpUu+6cAEfK7312PwbxCFKd7YDu1H+v2pE6d22SuS1g8Me/AS0em0CfA7
         gOzq/OJmtUvQXYxVcbOhVzA6/ZoCFKECX7oCmgvTOuY84ii2hEiDkDo53mTPO5TJQayw
         KFansbVBO7KOOzVNRRBH8pR6cscVcUZbYtNbhxamC3pNbAH/H/+VO8P4gZEqYMRau/i4
         RAUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA4sBe4B3JYArIuRyZ5paY0Ig+1IGeecHsGjKa2nmexQ7pWY02gDtxOQrYlw2mnszZiJ04/efULXyW/7JsdYWiv9OoCPwgHsyxLjleGQ==
X-Gm-Message-State: AOJu0Yza+1GxYjDZKRfE//3TyPSgC22ut1uOZeQiwmCfao9cbIe3fwVe
	ZWi3RlJnYWQotp0Oaz+S+1/EqAJAfMHU3feY7BhRtcEd4/pcGvXeGQC/FsnNHmo=
X-Google-Smtp-Source: AGHT+IFE15Or4v64XjwbEff7c+MWOISRCnhFWtQM6ObQ3evXM/ffhHAIMMW/rwLFVOHlxMVgJL8Gew==
X-Received: by 2002:a05:600c:1504:b0:425:633d:926a with SMTP id 5b1f17b1804b1-425633d9463mr28806335e9.21.1719536841671;
        Thu, 27 Jun 2024 18:07:21 -0700 (PDT)
Received: from fuerta.Home ([2a02:c7c:7213:c700:2cd1:b0e8:abb:540])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af3c27dsm13075805e9.7.2024.06.27.18.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 18:07:21 -0700 (PDT)
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
Subject: [PATCH 5/7] arm64: dts: qcom: sm6115: add LPASS LPI pin controller
Date: Fri, 28 Jun 2024 02:07:13 +0100
Message-ID: <20240628010715.438471-6-alexey.klimov@linaro.org>
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

Add the Low Power Audio SubSystem Low Power Island (LPASS LPI)
pin controller device node required for audio subsystem on
Qualcomm QRB4210 RB2.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index c49aca3d0772..3a9fb1780c90 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -15,6 +15,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -809,6 +810,21 @@ data-pins {
 			};
 		};
 
+		lpass_tlmm: pinctrl@a7c0000 {
+			compatible = "qcom,sm4250-lpass-lpi-pinctrl";
+			reg = <0x0 0xa7c0000 0x0 0x20000>,
+			      <0x0 0xa950000 0x0 0x10000>;
+
+			clocks = <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "audio";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 26>;
+
+			status = "disabled";
+		};
+
 		gcc: clock-controller@1400000 {
 			compatible = "qcom,gcc-sm6115";
 			reg = <0x0 0x01400000 0x0 0x1f0000>;
@@ -3068,6 +3084,9 @@ cpufreq_hw: cpufreq@f521000 {
 		};
 	};
 
+	sound: sound {
+	};
+
 	thermal-zones {
 		mapss-thermal {
 			polling-delay-passive = <0>;
-- 
2.45.2


