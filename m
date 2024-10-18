Return-Path: <linux-arm-msm+bounces-34835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9379A3312
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 04:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF003282949
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 02:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC0BF1547C3;
	Fri, 18 Oct 2024 02:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KmRy08T3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6839156F45
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 02:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729220102; cv=none; b=ZycimYPna2XQi8ClXw/n64qHo9KG4sp5h1hxtXodMwECx3n1ILM6HeI7pL2Qi22BllTeXyOTJcYi/2VteINuTy5eFa759l+3srAAyQx31G5nnnpY08+qi3T7l9ezIWmYoFYhcPLlEjhW0WOM9whfyiELXIuuBwJvHM+QDuRDN+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729220102; c=relaxed/simple;
	bh=cHZgetbXPWgeOCxSwhPIInm/1PEkFkr8Mi+cb0BC4ZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S+YcXE8imsxI54FYjI20MW59i6i4vf62QJNFO8sEya6CoJqs3Z/rhGbu760lPC1Y007YNzMDtnIEcv+rAcN5DX91V7gFqHWm5Panu/cTY9qmT7lggu/mje2bIEzDp2Nyy24ybHUMSEvNPLIVaemstsdre94VOudr1eJwFo/eR0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KmRy08T3; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4315eeb2601so10870755e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 19:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729220098; x=1729824898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WY0P3VPSjLSHfvMT72jrd8ND+SsNFP9CUC8xBRQ9Gls=;
        b=KmRy08T3II4nCtuoMa5Xca/Kt/8IUZ+RgtwjuYvE+jPGzzgpX4KorPCx99d1sfZ3h2
         dA4slkj903N0OAXhPCsYPxEHcp8jpnz7+xOYXUenEQqAJ01K9x0fkoQ8GuItp4522mPj
         vKoQGif9DjgXH4ALRyOxKNpzxilNUcXpSd+IHLxoctK/jze6kZHrHZfQjCF33m8muGBs
         kIiqdJPVc13mTujIZk5ZfFvvEe7r0fv9qkDQHz2m47A7ohSUU80tosvKkCjOUDzk7+6A
         sXccoseOfdvf3mmOVSmtLMjr3+kgH4xlDX8hLcfC3dPrOt1r0zaRqsACOwEkFZNWBmUa
         ZEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729220098; x=1729824898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WY0P3VPSjLSHfvMT72jrd8ND+SsNFP9CUC8xBRQ9Gls=;
        b=fBt0SbOP6OhOyyqqJQmco1koTrygCIgoGGOpNeuZCsUJhEgV0B403B4GkT9whg4bce
         yxZvp5TSoRQaTk8jb678luG7v1y0XC6EZvOFKxhpi5/arXhhDgSFl8kdrZX6+cLQhnLC
         +NeiEoM4WOjmpnGUt8sowYVtyTc9Trlq2WBzEy/G+dXiLlXp4EbaE5/YKg5p9Vo8ENQi
         Hq1JE9Qwp/RYRZSnRFIEo/jX783Pv19K0Htt/qISAI1954yCey86dnf0YWPMsTsB2crQ
         h/rLFKCAYkpRewyq2lugb+Yt2mQK5DttWTqw/ePtVU4QsmM87fV5nc+8ZWcjMP+1Ypi6
         rQPA==
X-Forwarded-Encrypted: i=1; AJvYcCXuhzt5gmWm3f7i6hyFLXcuws1dcJRmXL8yhpHATp43vOsEu6T3e2YSn9e11k23lh3mal0VMrXkLFlWzWax@vger.kernel.org
X-Gm-Message-State: AOJu0YyiDeIJLZg6YCEj5b+FVM/jp6guzPMfLf6eM+KTmr7wzFy4anmC
	CRPhdL9hr96sstbF0N+W9pOy7XF3Dp950uG5OtGsuJPmp9/T1Yhz85T6/LNE57I=
X-Google-Smtp-Source: AGHT+IEEdszq2utAiaIdNu7RQTOuLxS5DpzAHRwm6FsrKTRLc6/fA4KPYzS36a/2YnofJP3f32b4lw==
X-Received: by 2002:a05:600c:4ed2:b0:431:52a3:d9d5 with SMTP id 5b1f17b1804b1-4316158fd55mr6918445e9.0.1729220098167;
        Thu, 17 Oct 2024 19:54:58 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0ed599sm596135f8f.69.2024.10.17.19.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 19:54:57 -0700 (PDT)
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
Subject: [PATCH v3 2/5] arm64: dts: qcom: sm6115: add apr and its services
Date: Fri, 18 Oct 2024 03:54:48 +0100
Message-ID: <20241018025452.1362293-3-alexey.klimov@linaro.org>
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

Add apr (asynchronous packet router) node and its associated services
required to enable audio on QRB4210 RB2 platform.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 72 ++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 41216cc319d6..b211a49982d6 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -14,6 +14,8 @@
 #include <dt-bindings/interconnect/qcom,sm6115.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,apr.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -2701,6 +2703,76 @@ glink-edge {
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
+
+							dai@0 {
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
+							};
+
+							dai@1 {
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
+							};
+
+							dai@2 {
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
+							};
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


