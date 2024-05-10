Return-Path: <linux-arm-msm+bounces-19662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB298C2435
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 14:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACEE61C22115
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59ED172BDC;
	Fri, 10 May 2024 11:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hoIFCxP2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071DC16F269
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 11:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715342390; cv=none; b=k/6K9qxXa+XHaxjCKcK7O/Tb4tftGMPSwn8bF0Yernh/Oi1Cr0QbdyOyYPThkMLm7q7UAxB3vLTK/V25fGRhfIZJZDpmjXbiH8+Y89UNz8tzg8SFXkgKTjzyLyUaBrd663T2tfj6UnDfeUHMb17GgIrEIALdKb9ZySG1gUjvC+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715342390; c=relaxed/simple;
	bh=F6LVDFMYAmM7JcjujCIXWZBP4TC8w8mBfjUWcwOJmNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s1nf3lV5jv3nphN/b7EXx5y3FfcVc44pMEdkwVbRvLnd7exKP6g/jy0E4w+6bVTrsrak+5rGXtrlqUt4bruqUSXyI1tTngwEzpFE2LX04+1zXnMYVHlqR/bXYZFXx6J35RGvM/ig11Ynkme+GPEWcqLAhP9/Nx1Bgs4CLJTJpmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hoIFCxP2; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a59e4136010so478046566b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 04:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715342387; x=1715947187; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1YCAIvPNRaWCiuoixyBepvQGa1SGEK7bmvVw2e9ptmQ=;
        b=hoIFCxP2mwmnZNeX8Rr/24MBC3D0tr2YbnomDy/iO+qPaFb78U0cSpgc24VRABU/vv
         pTdyUv7cxczi8yamc0uNH+e8yTX7w7xHrvs/ixy/EgfUqsUdki/u7mfIW4O0L1bI5L3g
         jJJFnFP60mrZkKyXpSfSKbO+4kJRs5Nts85j1lFA6Hydw7hCrwn3o/0pwle296HqnSEn
         QLFjOgLvPzqnrkmp+aqUIKhB6AS8uzpbqyp8eWmZ+6OF/BiyX+7rnwrv9UX9wZeTxxZW
         0riFdfmZsTGiEJUi2CrHUTU8xAkXVK1qV/LvZWndVelll6N8soRqug12qRL5b0A2fAw9
         svng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715342387; x=1715947187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YCAIvPNRaWCiuoixyBepvQGa1SGEK7bmvVw2e9ptmQ=;
        b=IyXpMwDVHVS1mv/0JVvdyKiUHlI1zJ/bE7S3K5cjDkcqX51TeKY1zUg2HOIuqsNK5t
         vli2DX2RkPAaht12wmvbMZ6RDe/PUGMjXEMDxoglgzwlc0KJuiUurJJmWCVk4HCXwWJl
         vW+MFh1/8DE5519CYVEcm9ZDqMF5ZRQgB3JxH0PZxkziQ+DHjFqd6w7hWUOhtpBuuoXX
         m/MZ3kqfIlHISdUPrFQtYGj4j9OSpbRyMlmkY2T/qD6IWOrE6vM/v43sh2ezAiikKtdL
         18jAqEF/D1d18GTPZClV3yYCYq/h66lf5Btp4nP1sI4zOcHIem2yNMczX5mwg10aZqPy
         TzWg==
X-Gm-Message-State: AOJu0YyBWuZWj18W51d7bcnIMCTJW6X80Nmr/Twz4NODbcZ+xU6k1h9/
	LKwZ/dNSO2sB+uXJt8rErYetiBEJcjFq+5IerEydxAig1uip5kr9+YKMHg/mx1E=
X-Google-Smtp-Source: AGHT+IG1bLjKOe41AMRsBmA5uo/6L3/L2uOpaPU9NQ+8MTiil1v575HvVjy/jkMYVI19AfvIYu4f7w==
X-Received: by 2002:a17:907:78cf:b0:a5a:1b60:7cf8 with SMTP id a640c23a62f3a-a5a2d53af8dmr143767966b.15.1715342387555;
        Fri, 10 May 2024 04:59:47 -0700 (PDT)
Received: from [127.0.1.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7df7sm176795666b.111.2024.05.10.04.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 04:59:47 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 10 May 2024 13:59:33 +0200
Subject: [PATCH v2 10/31] arm64: dts: qcom: pm7550ba: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-topic-msm-polling-cleanup-v2-10-436ca4218da2@linaro.org>
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
 arch/arm64/boot/dts/qcom/pm7550ba.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm7550ba.dtsi b/arch/arm64/boot/dts/qcom/pm7550ba.dtsi
index 8b00ece987d1..853a1d83a7f0 100644
--- a/arch/arm64/boot/dts/qcom/pm7550ba.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7550ba.dtsi
@@ -10,7 +10,6 @@ / {
 	thermal-zones {
 		pm7550ba-thermal {
 			polling-delay-passive = <100>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&pm7550ba_temp_alarm>;
 

-- 
2.40.1


