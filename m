Return-Path: <linux-arm-msm+bounces-6236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7DD821CAC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 14:35:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53BC61C220A4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 13:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2298212E5F;
	Tue,  2 Jan 2024 13:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cwLdJ70I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D24FBF3
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jan 2024 13:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a271a28aeb4so548113166b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jan 2024 05:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704202462; x=1704807262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KOAtXsI/uyP60NRG3xZQcpZuT7i2wbzmgZI2BTLUXGQ=;
        b=cwLdJ70Iu6w7HJJiUM6Q6aVDwZcLJIRCT17O0XtdF0vP6MhmtL21+MjuMXK/CiXKX1
         DYqpZ9FMDIubwDVSYbwWn0GuVH7ur8RkmUpj0X+9LVPN5nUUQy5t1Yauzspdh91G7RDq
         BgDC6YBRJUuA50Bd4d9s5ZV6VgkIcRSZrkI5VtvwJPZhW36qCOVCPctKmIaN/TdBibty
         omZAUHsCa0illCz5gKoOuV+9IyM0BKd2E9NNJMJnOFqXboe55dIwevf5LDGD/LLNaaMW
         Abr6q/0H2p7f2XQPkKCe+Es4fEfoR+sTu+BdwS2vxDtZeYrVlEo6SrPoR1NwhGYjqtcI
         zNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704202462; x=1704807262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KOAtXsI/uyP60NRG3xZQcpZuT7i2wbzmgZI2BTLUXGQ=;
        b=YoIhkMLYvRbKVyXDqGFiVi3oOQyz2FzN1qWYe7uVCtZVBVOsywnwBva3uURM2yvQMp
         eth+DGebGHs54Tpv9ivBNc5VSdUi8qRlT4NW2NiSyB+JGRcjCfWOMSuoRMDj9nwSDjVl
         kHb6LVjT07USwwFj2+xpZ9KwClfh3v6jxm7KDV2V8DYjTpVAUD/2ihg1jw/ApyaWxPTC
         F+ZEKy3RGY0bmym2/AdVUMm4wWGC/tSX6gFYpGHW+zp7A3VyaZVxGDZcxoF0wuFc6gNX
         Po9ExIZcIr5LvnjvNkZIxmLN3eWSApxDX6zD6nx5jezm9ZEylaF0H27hhLgzEZO8znKB
         kT8g==
X-Gm-Message-State: AOJu0YycCBcQMdz9CElZN1jCG5xyGjeYnAcuARxIKnOh4JkhljJd4GNV
	oiiJQGc+KiktZnM1ol/pek5hWdyjS7gzkA==
X-Google-Smtp-Source: AGHT+IFLkStxmpygHl5wNEMZju5WTXCJ4MlOl04HMR6hl0o+e0M7iEB9zfITG4DtpJJL20mI5gtibA==
X-Received: by 2002:a17:906:51dd:b0:a27:e711:8b7f with SMTP id v29-20020a17090651dd00b00a27e7118b7fmr1709373ejk.20.1704202461908;
        Tue, 02 Jan 2024 05:34:21 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id u23-20020a170906109700b00a26af5717e9sm10950923eju.42.2024.01.02.05.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 05:34:21 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 02 Jan 2024 14:34:06 +0100
Subject: [PATCH 02/12] arm64: dts: qcom: msm8939: Hook up GPU cooling
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-topic-gpu_cooling-v1-2-fda30c57e353@linaro.org>
References: <20240102-topic-gpu_cooling-v1-0-fda30c57e353@linaro.org>
In-Reply-To: <20240102-topic-gpu_cooling-v1-0-fda30c57e353@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704202458; l=1054;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=1NgY9bVcLf6ubSjBJsunesS1yE8LCS8qHk+beqjE2Yg=;
 b=V7yOCEVXcQPjLL6quQMaUNQeZk328WuCDWD+AQW2cBe4pP9+62UnE1pCj0YW1ymUUY+GKNeiQ
 bxDTNWsobI3Byx1wO4FASpJdQWDVQfv8BWC+1QgmBjQWyc9NKXRGxZV
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

In order to allow for throttling the GPU, hook up the cooling device
to the respective thermal zones.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index 29f6bd9df2eb..e0521a060cf8 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1439,6 +1439,8 @@ gpu: gpu@1c00000 {
 			power-domains = <&gcc OXILI_GDSC>;
 			operating-points-v2 = <&opp_table>;
 			iommus = <&gpu_iommu 1>, <&gpu_iommu 2>;
+			#cooling-cells = <2>;
+
 			status = "disabled";
 
 			opp_table: opp-table {
@@ -2468,6 +2470,13 @@ gpu-thermal {
 
 			thermal-sensors = <&tsens 3>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
 				gpu_alert0: trip-point0 {
 					temperature = <75000>;

-- 
2.43.0


