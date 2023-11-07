Return-Path: <linux-arm-msm+bounces-48-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 026F07E38E9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 11:21:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B309B280FC6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 10:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE75913AE1;
	Tue,  7 Nov 2023 10:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y1UjO4II"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9697E1401A
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 10:21:20 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7EBB116
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 02:21:18 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9df8d0c2505so444971966b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 02:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699352477; x=1699957277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47MAytI0wpXklmtxz3ze9/twRYMKCl4qLroxZ/CA07k=;
        b=Y1UjO4IIqrwPPYEmLCUY8uelNoCArPvpCWQnW01NMiHVhsHLKnYHOzjD4XFN09wp1n
         Ovwxr6V0iNQCCPQgDH7RA0xyRGwK/f7tt13ivtKFUQLOEGHG2UPxHZblI7/+88z6ussA
         sQIXmSr0/5C+QycG3hJ3ozNhWY48eWFz1Z+Sa08ot8JcBmVbGW60gbqMqO1mqPQyhxqT
         NpiyEKVHEtyxo3CW/oxRcBMsh3+kkSDAt/yZgo/8Ny8kb4LvNsMhrO12CxvRTUy15ZgM
         2Mv4AsLGmgCvQlKkeF+KRETKQeYI7PSQHJTsvMqK0z92u3LnAS0JYFgQRKTLTBNMZI77
         O0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699352477; x=1699957277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47MAytI0wpXklmtxz3ze9/twRYMKCl4qLroxZ/CA07k=;
        b=rM44WJXu79b/DqtL0QSiWKVITCyFMfLcOlW5THUPOKeYXOCtzod3We+9tbsho9I3GB
         bFCwYavBBBE5n6/enPUPp15UH2D77aLwrBv7ro4fBAT4n5fNqls3XI7ZU0wvOX2w+ech
         AFqbNS6KYPpqdBeaWUDF367CiJ+za/6saezl+io946aKnmkv0ts8y0hjfl5WchKc2/Fk
         77bLoFTas1P6xWK+A5rruzjVw14S+x7JTdLPiW/xiDDBsCJBqzfiLZH9vZtg7ZSAGfxB
         anLMwSr8RgqHxBpvBclAa4qFnsPN55jBNGohN4shzYSsmDNrOdEmWXxCFaNBPcePVxES
         ChRA==
X-Gm-Message-State: AOJu0YwzHYWslRq7rd6YIAj1ApmcfZuMVnQLFeVuJA0zLWOsRLMQfnZS
	ZK4Xl/uJ19UlEpQT+Jya9Dtg4w==
X-Google-Smtp-Source: AGHT+IHX0QvvlKra6NCllPEzGPvfh8orZQvj1X1s22+LFf8HWHGhNFdEdr9eI9GC+bvgIuyZye2dwg==
X-Received: by 2002:a17:907:7fa5:b0:9a9:f0e6:904e with SMTP id qk37-20020a1709077fa500b009a9f0e6904emr2099101ejc.16.1699352477298;
        Tue, 07 Nov 2023 02:21:17 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id h25-20020a1709062dd900b00988f168811bsm862729eji.135.2023.11.07.02.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:21:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: sm8250: correct Soundwire node name
Date: Tue,  7 Nov 2023 11:21:11 +0100
Message-Id: <20231107102111.16465-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107102111.16465-1-krzysztof.kozlowski@linaro.org>
References: <20231107102111.16465-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Soundwire Devicetree bindings expect the Soundwire controller device
node to be named just "soundwire":

  sm8250-xiaomi-elish-boe.dtb: soundwire-controller@3250000: $nodename:0: 'soundwire-controller@3250000' does not match '^soundwire(@.*)?$'

Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index da71de5e1a80..e18a18a9e767 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2557,7 +2557,7 @@ wsamacro: codec@3240000 {
 			status = "disabled";
 		};
 
-		swr0: soundwire-controller@3250000 {
+		swr0: soundwire@3250000 {
 			reg = <0 0x03250000 0 0x2000>;
 			compatible = "qcom,soundwire-v1.5.1";
 			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
@@ -2623,7 +2623,7 @@ rxmacro: rxmacro@3200000 {
 			#sound-dai-cells = <1>;
 		};
 
-		swr1: soundwire-controller@3210000 {
+		swr1: soundwire@3210000 {
 			reg = <0 0x03210000 0 0x2000>;
 			compatible = "qcom,soundwire-v1.5.1";
 			status = "disabled";
@@ -2670,7 +2670,7 @@ txmacro: txmacro@3220000 {
 		};
 
 		/* tx macro */
-		swr2: soundwire-controller@3230000 {
+		swr2: soundwire@3230000 {
 			reg = <0 0x03230000 0 0x2000>;
 			compatible = "qcom,soundwire-v1.5.1";
 			interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1


