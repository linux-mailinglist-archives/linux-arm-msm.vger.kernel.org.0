Return-Path: <linux-arm-msm+bounces-6246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A56821CCB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 14:38:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D75511C2210C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 13:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F4E16415;
	Tue,  2 Jan 2024 13:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vf8rxYT/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D4415E92
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jan 2024 13:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50ea226bda8so248991e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jan 2024 05:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704202475; x=1704807275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zeKwT1A3XsXuuDojkgywa+/EpDJdsCptqUtmXkx5794=;
        b=Vf8rxYT/cUQV/82ACMVl+SFhMehHNmfIxv73Y7aY6oLTtJYb2EpRa6+nhHIyHc0KKW
         wdo5cxr8OSZBwKbVmpr5qw1mGI/gSYwtCl/V+hB2+js3SAPsMO/mAYKCMTNcAWUhAdwB
         kZdRlNT6bEKV64ujRkGojPDtihlugobIhXJfl4TvC379zuOOT4CNZmSjTj0yoMBQU09K
         ciqNJ4XqC1IFxK3yqlPoKZB192IIG9wR+wHfmfW6RsEnbFO47EzPqs8em8cj+Fd/ewHJ
         90JCAg0PsZszz3eJPz+g9AQaxjw5WQ94KscvY4ip4sTrlgoguSXGbwmWPQdF8mli/yyQ
         aD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704202475; x=1704807275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zeKwT1A3XsXuuDojkgywa+/EpDJdsCptqUtmXkx5794=;
        b=lcJiZP5c+Rmu0ch2JmXDBHIGRs+nVkxRc2HMBoOmcD1CQDmfpleKWnlQs9J9ZaMPLO
         rWm+Q07aKtEfcV8HzrUByqZkne89x2ydBJ8UHh1khBXdRyu1J9AOLMeFZzARnN0JN5JF
         wqgT+CYkMf8W9i7Q3lehxUOLZ6AbnkX3kz4N0JTpSmAxHMfqm4FUX8FHzOavERyY5t8G
         kJ0CKJNdwXr4Wx9PU9jwKcMrVu1QHew7CE13/Mwi7aSna9/TGUgqDlbHcbGhIWqyPoCw
         Hby20gOM4CqQtskAv7VGHdTPoeoIcPJbSE6YnNIT6zqf6OUgPNYtIJuYHB8tl2Nx220A
         E+Mw==
X-Gm-Message-State: AOJu0YyT4UwhB3W/IvpaegnybjjFUSd/1MhhDvemQ/fh8z5dhUsQ/gfZ
	DH/XlJDa0wNfo6p6enFIQKO034FIQne9iw==
X-Google-Smtp-Source: AGHT+IGiqR0JDwID0n3wdeBwAvdvieXgN6ZSyb5hHkLZQG2NRFovAJb7WIX9mIkPnIsl2BZkIL28Ow==
X-Received: by 2002:ac2:4836:0:b0:50e:7dfe:fe82 with SMTP id 22-20020ac24836000000b0050e7dfefe82mr4306564lft.82.1704202474834;
        Tue, 02 Jan 2024 05:34:34 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id u23-20020a170906109700b00a26af5717e9sm10950923eju.42.2024.01.02.05.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 05:34:34 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 02 Jan 2024 14:34:16 +0100
Subject: [PATCH 12/12] arm64: dts: qcom: sdm630: Hook up GPU cooling device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-topic-gpu_cooling-v1-12-fda30c57e353@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704202458; l=1248;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=dkeGc5o0HQxWFtiMDhc/Q4H/20eU/xyAL75klKJTI2M=;
 b=E2ErxoQ3kpFQPbKINlrBy6Bu2+Ni5vxkudf5gW7KmKfY/ZCu82WDVuQ7h6Fbth7tWCFbKEVxo
 KjJLpsPDLoPDWIqV1jSwBCBpmFQLG0voDpYCBVsHcrLBIs0duhS7zn0
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

In order to allow for throttling the GPU, hook up the cooling device
to the respective thermal zones.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 775700f78e0f..fc06665861e2 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/thermal/thermal.h>
 #include <dt-bindings/soc/qcom,apr.h>
 
 / {
@@ -1120,6 +1121,7 @@ adreno_gpu: gpu@5000000 {
 			interconnect-names = "gfx-mem";
 
 			operating-points-v2 = <&gpu_sdm630_opp_table>;
+			#cooling-cells = <2>;
 
 			status = "disabled";
 
@@ -2580,6 +2582,13 @@ gpu-thermal {
 
 			thermal-sensors = <&tsens 8>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert0>;
+					cooling-device = <&adreno_gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
 				gpu_alert0: trip-point0 {
 					temperature = <90000>;

-- 
2.43.0


