Return-Path: <linux-arm-msm+bounces-19696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2B58C253B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 14:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 656611F25DF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B12B16F900;
	Fri, 10 May 2024 12:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bRh6CPD4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F248912FB35
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 12:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715345927; cv=none; b=pzAQiY/ASJ6KUH9TREhm1hXUUwrJ597XvUjI7tgIYXgVW+ZeAgzTwp24uN32kA2K22sbtRrUV+Gkf+KrUM8+8AsXlgZmOqbrAnTiEdbz1wxOsWTJVeyGsJZZnL1yAd04fHW+DlxIJUht2cx+wJii2JUV4I3h5XfmIvY3ZXGOYGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715345927; c=relaxed/simple;
	bh=bRUdpwvsxjVEA+bEIQiwaB+/SrBiEO/590bU96RlLgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hFdc2vjameUQ0iebK8Wv09UN+tqzWSt/t/RxzjLAp9Tp1eumWpFobWanGptisssXGI5NYupQizaUj96dKHSfFOQpyKFwROL6ml6aXkCsgDWJGXLjBCjuBoV2JqalclKaK7exjZnTzIbo8Z5MahV9+9OXZ1xyhsJn/4utkaoWdb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bRh6CPD4; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a59c0a6415fso570535466b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 05:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715345924; x=1715950724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tv5Or4RfPJ0awNc1s7KQ9nHBJpQAMX0v2SVx0hn6YRI=;
        b=bRh6CPD4nhn8Q+FjDTxNcSuUg1zKmgfSdqStowhgu0YH9MPfXu+Av8EhcaZKxlwTU9
         ZVcSs1GBIVP8fYcyv0cTGvhMORTymYbz0PDLaNsRGqIRtZFMgy/NQ+ZXfz/ab5fDeNmx
         iogriMiCGMszOJlOnA5aSdtuEl5F90nN24/82pgeiNMFZ/ayONV5L7CsnVMn5Lqg5flU
         vCxOzGfg2NagcMktkdws0r9wtQ76a4ozOt8vHtyoDraH+v0xZOoqbAL0zWfpEwBoMsZT
         kwiKtT6fTkFVxyqSaf6bSTYUlK3EErEbcqWKvcbbe4c+dX4RJ097gfZgpwNGpRfiApud
         rlYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715345924; x=1715950724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tv5Or4RfPJ0awNc1s7KQ9nHBJpQAMX0v2SVx0hn6YRI=;
        b=ea2U79aQMDU3j1QcbD5YxMnCVM/fxW3UefGPjblyO/LR9agTT26QVdc54tXlzEUw4n
         jHl4nQIp+ihECc/ife/ftZ4ptYEgJ1+jVLWe3DSW91Pw7YlgvoG+7mdWU8oLq+4VP6Ez
         FvtJx3DcCDwEMfXUj6yJsgLctAtZKB7FRUBM6+/XcYRiHQ8CzxGKy9bl9BE5CQSyf8JP
         hlurxEHBktcsBelGVbd/2wIVgflkfEtct5br3kWvstpiJY2lBd5hMBFWKgXzkuwjTOja
         x8teIOuUsl2upt4OfebCLmtkHzMBWYB70CAvrt/FWW+SLA6qkH65yCywiTjMoIryq8vj
         VSVg==
X-Gm-Message-State: AOJu0YxN0DelQMduUDIVAROvN2gQ5IeZSCVgRty+AQCyHkhDZWmG7OnF
	H6e7DbpP7nk8sbWQguivlro70qny6yQjyQqogCNmtLpo8oxA8lcI+Jg5nX7CP+g=
X-Google-Smtp-Source: AGHT+IHD0lGCCIKmW6BWOHjW9Nj61cGVsLD6S57fVLRbgBMQdAoeu+mJwyfD2wrtNtlC6lofYf/JBQ==
X-Received: by 2002:a17:907:7f94:b0:a59:ab57:741e with SMTP id a640c23a62f3a-a5a2d675779mr221351466b.76.1715345924587;
        Fri, 10 May 2024 05:58:44 -0700 (PDT)
Received: from [127.0.1.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d6bfsm181857366b.31.2024.05.10.05.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 05:58:44 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 10 May 2024 14:58:35 +0200
Subject: [PATCH 06/12] arm64: dts: qcom: sm6350: Update GPU thermal zone
 settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-topic-gpus_are_cool_now-v1-6-ababc269a438@linaro.org>
References: <20240510-topic-gpus_are_cool_now-v1-0-ababc269a438@linaro.org>
In-Reply-To: <20240510-topic-gpus_are_cool_now-v1-0-ababc269a438@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev

Lower the thresholds to something more reasonable and introduce a
passive polling delay to make sure more than one "passive" thermal point
is taken into account when throttling.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index abfaa1178a39..99813f380df0 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -3177,18 +3177,20 @@ ddr-crit {
 		};
 
 		gpuss0-thermal {
+			polling-delay-passive = <250>;
+
 			thermal-sensors = <&tsens0 13>;
 
 			trips {
 				gpuss0_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature = <85000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
 				gpuss0-crit {
-					temperature = <115000>;
-					hysteresis = <0>;
+					temperature = <110000>;
+					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
@@ -3202,18 +3204,20 @@ map0 {
 		};
 
 		gpuss1-thermal {
+			polling-delay-passive = <250>;
+
 			thermal-sensors = <&tsens0 14>;
 
 			trips {
 				gpuss1_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature = <85000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
 				gpuss1-crit {
-					temperature = <115000>;
-					hysteresis = <0>;
+					temperature = <110000>;
+					hysteresis = <1000>;
 					type = "critical";
 				};
 			};

-- 
2.40.1


