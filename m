Return-Path: <linux-arm-msm+bounces-19656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C43668C2425
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 14:00:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EBA428A60D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A3516EBE7;
	Fri, 10 May 2024 11:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DL/bf464"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABA2170834
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 11:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715342383; cv=none; b=bO9VQU4JyFBsMNS2NG20FU4xmQaOvVBMeCUuds6oq9LYbCiA0ccAoHc5T5aqKu0rGmjjZzxTppOR9Vf/owZ/IEB+FfduHynQf0211MoaJGRY7stJWlkTOlBmtOSuep+lDvOTYLNJl8u8xKHUGjcY0LAG1+e33pFnRIgO7gGQI/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715342383; c=relaxed/simple;
	bh=HdqV9I/cC9FHTK9lor056nOM+1qDwv9QeFXs5S5Hx4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HpygK2p5bJR5P1U8Fw2u+tJjAVp3XAqrwzaUjpFWvS/aynPhkczjVU9bOkz/lmKix9wwVwBn2crG8YI0ZES7ltMZCjTikey/YoteF3DLJTi00YrEYI6lrvaxquTFfdskhpgl3es1COwLxcJ5tG9cmd6IdXtbxeHR4dorBQFKKnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DL/bf464; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a59e4136010so478008566b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 04:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715342379; x=1715947179; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LNYQpQoUGdmagV0V+he0KHN0CGNQAiBlkilmdZNLYvY=;
        b=DL/bf464ePChsAHNTNDxvDTJjD7aEglQjHG9iR/lJGWo+g8RhlyDrTe2Ybx+ODvEfE
         giSHDG8zrkpJOTmzi05dKA0vqjKoi6ZPAxR/nUsZA215WcBgdzXVO2gPUfLDPcpbiWSU
         yT0XzTwodr06vRI8+ARyJ4Dwe6X1lC6kLH8agkYPjhL6R2h3Rlq40Z5/IxJBNz3TOw/i
         r5+kM4ZfUVK4zYfvXP63W13iOaf9ykZ5n/oB1JDQH/rbRsSZawCgjtGyc8yswukIZLt9
         lD0sfAYugJ3o0CVIu6DX09pA1cq9s5Lwbpy5rNy/B70hPrgIQvJk2j2XR+fUDS5qcJqc
         jjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715342379; x=1715947179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LNYQpQoUGdmagV0V+he0KHN0CGNQAiBlkilmdZNLYvY=;
        b=filapZMrRPdRy/YeY57YieHGkeIO+TzkrtqrEU+Wo8pnqiQXY5xR6dO9Cb1DUY8nXL
         Fp8RyMEgQv4RGQuO4WYaqzTVsFYuArVy1RnBeYpTIaQAdiNwGldYKQgHVMCS9yb9quaa
         NmNpoz+Uzcm7klar3baiPu+kzE8IdVAR38CwK2J7o9FUx0SgCbHkxOmWCXvw73th2VVK
         C30++VK2BXc856gs4uTVKIXfjMjtFlGlVs38r4DlmPDjSmEWStJYDwucuhmJQl/C4b9P
         yk4VLcf2kVKmsfNGpYlwUOObZqhkH57t/Z5tKCcVNwu1jdwO3a9GcuLvKBJlQ0Mevz3g
         SpPg==
X-Gm-Message-State: AOJu0YwuXf/jjE/h/K4SgaIjlVtnbPfG64Gk6k9zrgMqHM57g2Jscz9J
	m4havRj5f0LSqVBrgi8DPhOCUiyv32o7DLIQgS1KU6zCqDrWZaKJ22r6zDycizk=
X-Google-Smtp-Source: AGHT+IHUm2VbNlNU3jecKcX+NBteQPyNZxFTjZkWqSRBi8qr0KfjbkM+Le2/OnaCXYfWedwkuUSl+A==
X-Received: by 2002:a17:907:1c26:b0:a59:aa3a:e6b6 with SMTP id a640c23a62f3a-a5a2d55eb33mr214190566b.18.1715342379384;
        Fri, 10 May 2024 04:59:39 -0700 (PDT)
Received: from [127.0.1.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7df7sm176795666b.111.2024.05.10.04.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 04:59:39 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 10 May 2024 13:59:27 +0200
Subject: [PATCH v2 04/31] arm64: dts: qcom: msm8916-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-topic-msm-polling-cleanup-v2-4-436ca4218da2@linaro.org>
References: <20240510-topic-msm-polling-cleanup-v2-0-436ca4218da2@linaro.org>
In-Reply-To: <20240510-topic-msm-polling-cleanup-v2-0-436ca4218da2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev

All of the thermal zone suppliers are interrupt-driven, remove the
bogus and unnecessary polling that only wastes CPU time.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index cedff4166bfb..1fa1defc38ea 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -2626,7 +2626,6 @@ cpu3_saw: power-manager@b0b9000 {
 	thermal-zones {
 		cpu0-1-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 5>;
 
@@ -2656,7 +2655,6 @@ map0 {
 
 		cpu2-3-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 4>;
 
@@ -2686,7 +2684,6 @@ map0 {
 
 		gpu-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 2>;
 
@@ -2713,7 +2710,6 @@ gpu_crit: gpu-crit {
 
 		camera-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 1>;
 
@@ -2728,7 +2724,6 @@ cam_alert0: trip-point0 {
 
 		modem-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 0>;
 

-- 
2.40.1


