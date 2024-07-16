Return-Path: <linux-arm-msm+bounces-26309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F43D932432
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 12:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70C131C22E60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 10:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC6119922A;
	Tue, 16 Jul 2024 10:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XzpAVsza"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1031990D9
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 10:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721126114; cv=none; b=UdhvLutg7ZCe80yfdbF+wdcmc1zQZXFlrEY+Fo4MkaY2ldyyTrOpH0wqPlX8agTbgRnuJm+zguHWnGg3S/IE5+j8IZNWXlC8Kk8wlx06XfoLqV2q4vYKWHcEijJZpGG7vi5S3Hqg6YO67pVI/HArBtcnHnHZcaoHEL/uiQPEQ2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721126114; c=relaxed/simple;
	bh=bfCH8and0eCwiNx1UPmuC/ofW1D0oXAEWmEsWNK2XYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P4Fyp6SfzOACrBsGlUCnjA+MoHXjNGEbABlBbibIFie1s2t5qpNCr9wh1og+MoYWUPsQU6CserWp3gjSOPWkR7qEqnV1HUsKFoatEDKx9O00hQzgwfeFCnW/LKvKHHaklu7WZDd2WaLmwwSC+/9rNvuL1SQ1tE1J4O9XNFBuWcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XzpAVsza; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52ea79e689eso7688794e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 03:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721126110; x=1721730910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=glaL1NwucAvvOF+fsdv/caKhQoNYoSfHGDOwMp1a1Rs=;
        b=XzpAVszapSb4H1kUr7mUK3fSUYlzp3cixW1Lw3V2rZv0Hx44o4Xa9ei1isppVGVluR
         PxwsrG5vr1g7Z4IzA8SAIQGfZ7jGez1vYuUg4ZPTVXDhG8G1AgxS3lU6alRKvQ0DRuep
         ngUGxrlvbEhMMNJIu8W19vHUaTG6rxK63QSxpz4fp3iYC46i24cggWdvnka1uo1IprIa
         ovY2uscJoS8d6rIinu2niJJ3A3AgFLvSRtyK0F89cxXQ6WEocIMX2ZJOoDHiB8ZUnfAH
         WTSaCVRrH/2tMtjgcWANRFW1nKnTrzJUQrclsN7A2FjFpXfGhl8z+XgrKCY0W8Ma/RAU
         TrgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721126110; x=1721730910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glaL1NwucAvvOF+fsdv/caKhQoNYoSfHGDOwMp1a1Rs=;
        b=lGyPn1YLN3pQu/wAf7D72v+mtW+7wLIDr5WuHVwAPGk6reqm+KCf0S3m+1lSGsm21D
         cW214oxXdk+ejpfjyxQJRP4rhOgdjdrrvee+qjpw/witVG1e76GowN2SuoXkB4H5V7Ct
         J2aJ7L58fjp3w/cv99ZwWTFzJ3Fnnbq53himbGkMJrftrCFchuwHkVRVTBVgHsDKdhFi
         ADLy1LHiwfYSIFGMjMGFgk3tjqmA+cpYjLpoKvnhyqLR/vbeY5g/GsrnTK1asseL1QwW
         bTyaawVHEk8r9sPKidZG5J4qEmETqAM5N+E6RAxQKEKskNJxku9T+Rv9xs+MF+aG86jd
         9GsA==
X-Forwarded-Encrypted: i=1; AJvYcCXuQXL9l8CIW+iKlfjb9fKl08N/I5sYND0LYLAa85SFYbaC+duxB3JkyLkWDiaRN9cosOfyp3kYnJrxpZgMcb6yjsHM6fFAfWSDIUTWuw==
X-Gm-Message-State: AOJu0YyB2wZfFmx0aCPgZS0ceRLjK/KrmuF+3MMBYCHmhFfFJlymDA0e
	/fAnOsRMnxHgmKUg5be71vbISU+SMlply1aV4ABqMYl1yzafjzxCKJhm3Vxg3j9Cpbq8qiS1jSx
	Q
X-Google-Smtp-Source: AGHT+IF/FYTXOKFpO/Y/dd8V/daSVJZBtL/wBmD7Ccmrac1MynmYXdqAUgFGPZ4mHCUKx38XS2OJbw==
X-Received: by 2002:a05:6512:3e0d:b0:52e:936e:a237 with SMTP id 2adb3069b0e04-52edef1e994mr1301018e87.16.1721126110428;
        Tue, 16 Jul 2024 03:35:10 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5b7eb4sm294039766b.60.2024.07.16.03.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 03:35:10 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 16 Jul 2024 12:35:04 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: x1e80100: Update C4/C5
 residency/exit numbers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240716-topic-h_bits-v1-2-f6c5d3ff982c@linaro.org>
References: <20240716-topic-h_bits-v1-0-f6c5d3ff982c@linaro.org>
In-Reply-To: <20240716-topic-h_bits-v1-0-f6c5d3ff982c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721126104; l=1137;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=bfCH8and0eCwiNx1UPmuC/ofW1D0oXAEWmEsWNK2XYU=;
 b=seaZkneu+YvqlDp0QXFYgUyISOmkiDpU6GX4/CSMyUiwyVBHJ9wxhy5YPcWiNJApmdUUSrpuW
 uYpgXySxt7LAzZXrkIdcLQOBNOdDCa+5uIkJwpJ2rnVEUu4gUlldZ6E
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Update the numbers based on the information found in the DSDT.

Fixes: af16b00578a7 ("arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 47bb26a66b2e..120bc418c444 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -278,8 +278,8 @@ CLUSTER_C4: cpu-sleep-0 {
 				idle-state-name = "ret";
 				arm,psci-suspend-param = <0x00000004>;
 				entry-latency-us = <180>;
-				exit-latency-us = <320>;
-				min-residency-us = <1000>;
+				exit-latency-us = <500>;
+				min-residency-us = <600>;
 			};
 		};
 
@@ -298,7 +298,7 @@ CLUSTER_CL5: cluster-sleep-1 {
 				idle-state-name = "ret-pll-off";
 				arm,psci-suspend-param = <0x01000054>;
 				entry-latency-us = <2200>;
-				exit-latency-us = <2500>;
+				exit-latency-us = <4000>;
 				min-residency-us = <7000>;
 			};
 		};

-- 
2.45.2


