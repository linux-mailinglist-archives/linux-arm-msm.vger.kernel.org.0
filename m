Return-Path: <linux-arm-msm+bounces-24547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC2891B479
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 03:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05D0DB22E0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 01:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453401DDE9;
	Fri, 28 Jun 2024 01:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O4z8FOax"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223FE12E75
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 01:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719536844; cv=none; b=Mgi3J86h4rcEULH1JyrfxlvAqICTasV+xQptP7Fb6Of6UJKr3NxeK8NUV13qs5QAGw5wPVHdViTugvp2zMk+kl7IrUaNeCMWK5gJGJOy91L07axSVNmljYhZnQPpERfboDt2B9ZOewd8QNCj81/GmIoSWdOcydiIqgkt1tcbBwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719536844; c=relaxed/simple;
	bh=YC+yCZxleCG05wr5Dx82fT/dLdVie8/UI+vk4bGhDr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nYnLMK9WNpdwuF5kLQCjKCXXhq/eluETdW954Cohk0NtcIKb4pdTAaXs0EV+Xtg0OS5LdPIO9mtGgDtNOdnrHW5izVohe2LfHxLZ8DQsMJpSNpcYCO2L/ZS4Vjz2XCCxDZeoV9BHz97TP5a2ibZP/8V0R0Cm9i77ORU7ntBcq0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O4z8FOax; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42138eadf64so493745e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 18:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719536841; x=1720141641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pcxRyzKXv6NGAGrzN/ICDppwf/NlnyWUCDPLH0CZx2c=;
        b=O4z8FOax+qjN7ZQ1qwrjEowoCV7m0iY2rJARph7P7RMr+A+Wqx/gtM8WDFQE1nJZvj
         deu8c51KOl4qfn33MC3iGUPZrP16TlMKUM98XUQuJzbPZh57ghNEjWehfdCOFegO5GON
         WQv87hJBoy4fEG3R3DY/r8AMJwqtrI2p3yh5aFYx5iOkfzmJPgEnwfdDb5uLeD9G/91m
         SBInoyrbGmq6Ksl9b4WTfN+xSPT218VubmfX1NlfExs+rjIU8ohnOdyiR6gFHI4AIXhz
         STW6ONn5E9HaM4XCuJ8Z6/6qMPx63f3U93w/Mjc7NVHeS4B3CbDvuKSwrHU7svz5eB57
         GNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719536841; x=1720141641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcxRyzKXv6NGAGrzN/ICDppwf/NlnyWUCDPLH0CZx2c=;
        b=fSO/4yzrdUXkW7kHJL/JpldRsgzFda8sKf7EnqOWjHu+SP7iIajVLRGrPKgIkyGp/c
         41Kfcs27tOheJHlEn7L+zhECkCg6H7RcRWTHkO7euJT3+2eXDStdKEDnFDJLYc2xc38L
         2ugIWAUPAR+87bctkaQwqB38f9AUcXwluHHul8neEa14gWfx61M9NQbRXBxD+5ghEF/C
         NPAjrsseJKEl7g4PvkaytGYFMG0oMqNVM/892/EWBB5asmDXMYAuOMgnkZa506gM+EeS
         zmkNtmczwEqfS3jcGic1qET5Em9KHdJIiTZFWHfzMnq3t08hdc+8n99ebzAEy8WhWYUO
         MFHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWv0wrb4nkKLHZlSQXzWJC2vKHEZAH46P7NU8rZPfV/fhs3C8ps/37g5A9HA9V/x3GbMXWvQY7n04NVUeNNaF3WoLdyVh239eMFwhNP6A==
X-Gm-Message-State: AOJu0Yy31rPkkaslvTtq+pqBP6oFIPsRz0wOzMczMmy0+afzxnpdk9+C
	horkxpIKnVCeEWee8dQIvUuKFfTMvHWNJQDWQIqG70jhfoYRiDcaPbnOWTTsrnY=
X-Google-Smtp-Source: AGHT+IHPN22MSh+P7jZjEm5freqL7ZysOn8u1UOe9bBR19X1ZgvHfUbx9z58xuswMEphBD4YtlPZuQ==
X-Received: by 2002:a05:600c:3b8b:b0:425:69b7:3361 with SMTP id 5b1f17b1804b1-42569b7352bmr8277325e9.18.1719536840736;
        Thu, 27 Jun 2024 18:07:20 -0700 (PDT)
Received: from fuerta.Home ([2a02:c7c:7213:c700:2cd1:b0e8:abb:540])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af3c27dsm13075805e9.7.2024.06.27.18.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 18:07:20 -0700 (PDT)
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
Subject: [PATCH 4/7] arm64: dts: qcom: sm6115: add apr, its services and simple sound node
Date: Fri, 28 Jun 2024 02:07:12 +0100
Message-ID: <20240628010715.438471-5-alexey.klimov@linaro.org>
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

Add apr (asynchronous packet router) node and its associated services
required to enable audio on QRB4210 RB2 platform.
Also, add an empty sound{} device node. This allows board dts
files to fill in required board specific properties.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 59 ++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index aca0a87092e4..c49aca3d0772 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -14,6 +14,7 @@
 #include <dt-bindings/interconnect/qcom,sm6115.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -2695,6 +2696,64 @@ glink-edge {
 				qcom,remote-pid = <2>;
 				mboxes = <&apcs_glb 8>;
 
+				apr {
+					compatible = "qcom,apr-v2";
+					qcom,glink-channels = "apr_audio_svc";
+					qcom,domain = <APR_DOMAIN_ADSP>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					service@3 {
+						reg = <APR_SVC_ADSP_CORE>;
+						compatible = "qcom,q6core";
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+					};
+
+					q6afe: service@4 {
+						compatible = "qcom,q6afe";
+						reg = <APR_SVC_AFE>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+						q6afedai: dais {
+							compatible = "qcom,q6afe-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+						};
+
+						q6afecc: clock-controller {
+							compatible = "qcom,q6afe-clocks";
+							#clock-cells = <2>;
+						};
+					};
+
+					q6asm: service@7 {
+						compatible = "qcom,q6asm";
+						reg = <APR_SVC_ASM>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+						q6asmdai: dais {
+							compatible = "qcom,q6asm-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+							iommus = <&apps_smmu 0x1c1 0x0>;
+						};
+					};
+
+					q6adm: service@8 {
+						compatible = "qcom,q6adm";
+						reg = <APR_SVC_ADM>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+						q6routing: routing {
+							compatible = "qcom,q6adm-routing";
+							#sound-dai-cells = <0>;
+						};
+					};
+				};
+
 				fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
-- 
2.45.2


