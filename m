Return-Path: <linux-arm-msm+bounces-67911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE61B1C607
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 14:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00E2418A84EF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 12:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2D428C039;
	Wed,  6 Aug 2025 12:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VMjrY7YU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B033728BAA6
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 12:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754483929; cv=none; b=ZCpKhsRQhMNr9pCJiiz6X7Fgeg71FnyDg6ZeX1rNZe0ASb0aePeu1ePYVI51vPd9NpuCM47NwmDtUoC8F8rfgjjA7Clmuo/xrqaQ1QSsyoh66r9TSuLSZ04G9kHSXku+eceWEouX5NATrcMga6bMVWa4IbfCMtJZp2odDtOk0hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754483929; c=relaxed/simple;
	bh=7FJHiMUT0ZV5ouqNF0thtObhYJGVIi7u5XHjhFFPFr4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PGIo9w4sbrYxtHzqU9nrf76T8a0aOT0Cmn4cck9fhNjlU+56bTv7+qK+eHSiwHpuuYRPUhKKMvTweO0aoOGRwgFV2N77+LAW2tn2SBg9Spd9AAKm5al+G1tbKMbizgB0wKPjTsjBBs3N1IzROU+BfgCmuYVhi9/7+WJvIw8uOdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VMjrY7YU; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-af99942ba4cso5193766b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 05:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754483926; x=1755088726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4P78aqvCdLwTiUcDeg6coC9m01Qjv9ZrSFuTnuFlyY8=;
        b=VMjrY7YUANxeNDBCNJ4+yF/akPquKvDwmfuDr//qTcViqtBkzGpwO/sylyyon+tKF8
         Oc7MJxrbuhNmrQnR1bdpJ52c+rubMPtG0c8U9eN4LEPZcx1Mu5i3i3HXFYCvo8myPycg
         O6E4H6ZRSDg+uzv49qJbtBh0hReTNF+LZVYOHTeIVIFoUZt2PCJW15sm9H9CJgJs7oy3
         whTe7cOBX0r8p+Ep6aOUoYddn6lOryxlUHLnu4U3f5p7Grqj1Zw5EBV/18g+1xtz4K4Z
         54CLeCIQd/l21wvYrL89SqMwIpouTLEew33WJgVd/U22g/Eydsb1hElskNmgNfUvzgpN
         N/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754483926; x=1755088726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4P78aqvCdLwTiUcDeg6coC9m01Qjv9ZrSFuTnuFlyY8=;
        b=c/F/zCOkWnQNsPi5lL6FswDzX8Il29syOnnB7tBxQ6wLTJR7PgalOB/OZnPAVD+BpL
         l6z67kRrvpBPqxLFi8w6JiizsKrmShZN4up0tn9FsKkIR3/Ys3dm6OjkVPI/lV2+1QZp
         YjyTB3u231Hu626iHDCRAu1czWV3JJzOqKiExzXBxIx96blDIUxbt1Y1Jb1vSFBNl789
         +0vVfu7iQWqQwSUwLZFJ2HmYfbrzDZGZF4ysFLHz5dKFNE0XMTZPoaoxpTgrcRujonCc
         jJK8aqLMSbZbVMiQbm3r3bdbrqJZwdx0fIab+2wlLGAZCuO2uiQc5fkSYLoGX07DTdIG
         FR6w==
X-Gm-Message-State: AOJu0YwsfgGUBX2UcnujW5LZWUf7RtZV5rfSQJfOj57smPQIifJOL927
	4FAfQIbg51k4Qn/W9yUrZu6vZ2hIZVXn0VMpA1JO/3HsEzoUMNL3NJioFHkR6xrazXw=
X-Gm-Gg: ASbGncvX5r60kj3vd67nlTLC3TUzgzxcq1nvB381WXPXtRRX6sV2y6cDRUrcLtn/VCD
	QXfiJ2ldznsyuUPgTV7PZ9/rMa3gX5yLx9TllDC5gdIaxzLAI2GsmcJqW9cJUEZMmzRL2g9wZjC
	jZGebOlvwigD0UJGPi8J19fWIt+TN2pcczm/ZHEdHvi7Qh0zaxNyFmPHDKW5JVr+72yT+hQSS4B
	DKMalBsXqW0RksYGX5WkF+StRxO2mWzwKl7itGNuKrKR4bDyPMuCUpksg6okRPPOMHNB/p0y7vA
	nCAii6LhVL9Uzq1//JH3TXtBfuw7F+SaUHnvBRO40PYtm28bsB5kMp4bcB+/70CG2gugQPPiEg6
	UwuyfQAp9PMs1IuC0Xh4ikC2MiT1IWBMlvc0oenGME9Q9oAnurg==
X-Google-Smtp-Source: AGHT+IF/Qme6sfIWfz8klv+ODqlN2IQqpbvufYppyk4Z5CD9EwccO5nqIWXmpeKiUOcg7vWgt5+ehQ==
X-Received: by 2002:a17:907:96ab:b0:af9:3116:e10d with SMTP id a640c23a62f3a-af990447a58mr109056566b.11.1754483925983;
        Wed, 06 Aug 2025 05:38:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.218.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c081sm1083866766b.97.2025.08.06.05.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 05:38:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 06 Aug 2025 14:38:31 +0200
Subject: [PATCH DO NOT MERGE RFC v2 2/3] arm64: dts: qcom: sm8750-mtp:
 Enable Iris codec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250806-b4-sm8750-iris-dts-v2-2-2ce197525eed@linaro.org>
References: <20250806-b4-sm8750-iris-dts-v2-0-2ce197525eed@linaro.org>
In-Reply-To: <20250806-b4-sm8750-iris-dts-v2-0-2ce197525eed@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=7FJHiMUT0ZV5ouqNF0thtObhYJGVIi7u5XHjhFFPFr4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBok0zP52rmG2bxi7HmDpp3Cr6VxQLIdJjAQjvqd
 bYwNE+SGAGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaJNMzwAKCRDBN2bmhouD
 10CIEACVA2Mq4Yy1GMAKMguhi14btLsXOLCYusl9u590ryUfojwWOIK//gc455Am0bcqUbFUAVJ
 e8ck3Yo1QDVxDcRYoK2d0+yZzapqiJ8SjL9fFsnlZ5+qTPUF719hzoqKZ5hZD1unjXEqnXkycnB
 +grzWlQrJTyK83v8sMyyEVHM4i4DY9+HnOIYQfCtNLcpfMM9yBjYgjzWsG/kWIaaghaACeVwsoK
 8PZpG5aMbEpk1e+c+2Uwr3KKOMqB0ElJ9w7JCZPNVIA6NMuUXJRaOMGeKBQqptVQLhX2S42xFrm
 pPRuYndmzARhG9yj0FB7vaIEkacNTIv6lDYe635X6U/cxMpi4vTcx/MAAfb1UUJebdFWNjdOp4B
 MeCyi3zPfXZo/KM2c8SKH4VsyM8bfOmo4rH2ZoIMtOXEkN3o5T32Jh1WR9NgiYMlgWKZmhY+XuG
 obUTgxhDW61/9SHuWMF30TG7SqO+Tj/hA1EItYcvor7lRaSGmesjldP7Q3R7qBSVRPMW/tSzHBm
 0XsizK898Tp++lPNb3OYugm3AT6L7bGeMU2duW8n0Jl/GP8yTgRaE7sDo9fP45pma76JEbOzMfS
 c8R/dqjuUnB+7v4KzMwTYspxvtfh/6eFCwMLQXxj7Pn47A7IONF4i7SsctcccJapkX8VVEbilHR
 q1W35d3vDO9v4vw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Enable on SM8750 MTP the Iris video codec for accelerated video
encoding/decoding.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Do not merge because firmware (hard-coded in the driver) is not released.

For Rob's bot reports:

qcom,sm8750-videocc bindings and clock headers dependency (will fail
build):
https://lore.kernel.org/all/20241206-sm8750_videocc-v1-0-5da6e7eea2bd@quicinc.com/

qcom,sm8750-iris bindings:
https://lore.kernel.org/r/20250804-sm8750-iris-v2-0-6d78407f8078@linaro.org
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 75cfbb510be57a1ab8cb3d870b5c34d3baa53c70..4c155b731a68138154f66fdb0d0e6db5e47adf3c 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -812,6 +812,10 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&iris {
+	status = "okay";
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";

-- 
2.48.1


