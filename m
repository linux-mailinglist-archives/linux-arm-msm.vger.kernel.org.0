Return-Path: <linux-arm-msm+bounces-43236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6343C9FBC4A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 11:29:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0EE2188A501
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 10:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8203F1DC9AF;
	Tue, 24 Dec 2024 10:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vjG6jDOL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87B31DC98B
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 10:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735035465; cv=none; b=rnbfxreiqUb+Kw2M/toG9GOohPZPDjLzBPXXFWXlhaD0Laf56lHag+nbaqVMAJtdWi4qRYnAweCQUMSoim4aWvZE1zUeEMxs7z7ADLkp+DsnkCc80XbJEziK9m20nVxFvfdNeTdW7dwQqQOLja4I2caEGH2BYHJz+fevxAxHqL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735035465; c=relaxed/simple;
	bh=t0rQXPrtoBaJrNoELAVHdj8ug8kB5TUw+I/NzNZW0co=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p8gdRTUYamCv2P1NNQdD2tT/pdcExAL/Mto739ynuP873CUiflQYDWVkg92zpbrHNfX9wYNHDqwPV4LOE93A9AfsnnxDoZjLc1YDgyjYaNsOic4F9/VU4/ZUHrJssnFHRbIy8lXKgsRhZAQBBErDT5SqUsNh99XpLCVMeghZKb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vjG6jDOL; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54025432becso5231240e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 02:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735035462; x=1735640262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZvlf47lLnOuGGVqz501ZYTHYvZy2AJJ5Z/oU2OF890=;
        b=vjG6jDOLQhcxKRoiJF9xd1b2h8BnR2Xb0w897j47hK3NMhca3e/NfJPKWSZQRkhvNy
         v4myjmGJSddji8opmbTK/JTlXd1l5K9CKmvNHJ9FnNP6COdJn6AEcBU6I2PrUbvUemC3
         /t+c6HegVmQoPr5RrBir5uxCaUROHuaavbVtDcq2iciYft9STpvhN65GemR4+rzaqma8
         kpC8B2D5bv2oSCMkfL1OD4X6LmoCvadORJKtvAUw1ocM2jZpjjZFl0nq3nXQMmGpKtWU
         wDdpOYMG86U8NndAYJmGZ6k4H44vfr62YZG+pJQopglfN3EF2pKW8ziaVTtKdMe9pD0f
         tiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735035462; x=1735640262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZvlf47lLnOuGGVqz501ZYTHYvZy2AJJ5Z/oU2OF890=;
        b=BdR2cKbMIk+yOIq5aT14QPTKQy0cNJ0HT54jQTimxniZ7nL57sC1o9HZKLY9lZjOdR
         57KFVjsMHloUxez5G0j6/Zke9dZEh09qib8Ja6RG85cKbiQ4zzz3v89DIkSNVzo3cWwi
         BSNq9EsJ0XAw++IxeBkXw0zTuIfQENF8Uf7slC22X0S1pnZUpGa/ZSoAgt4+YhhXkc/Q
         2eGy2+MqJ43HPU4lq8z0ZjVCcgPSXu7Y3oGeESPiZwkj2VpsamJe8+LL4v74uwWfUDH8
         ydhyNqq8Nn0uYX911e6llC5+FUC3pkj4iCoaNYeRDOcQguMXb9A0x2ZFmy7TCBgmayC0
         LmAg==
X-Forwarded-Encrypted: i=1; AJvYcCUZG1I5H5WkSU9waQ351kb8SrZCbO5pj5K4L2esleKqyd0pjI5oPFXk+eQGv5S6HCRm3bPJi05CJ+S+dyvr@vger.kernel.org
X-Gm-Message-State: AOJu0Yx88yLJf2b2c5UrBvEk1JumXe8jYhhqLm/wk0+c8k9XUFiyQP1I
	uElfKNrzMAK2pdWHtC5EiIJlEaE55qj7+118llIA8v3n2Qn/cVzH2p8x50jFqb4=
X-Gm-Gg: ASbGnctiqwz4mZRRmJMVvE4jwLzNkdUqwmlOi+CctgYkFZXwcmi0GZcwxALyJ5PsnLD
	A/5zREXZ7muRICdDvz8vlJNih4Q3ZPB4XxJ/nLNBmU2zKGnQqJ8KGxcomhklLCE5OpC2oB97xLn
	GuUwrR1FIhXWbhxH2IoRsntjDtlDWwj3J7sP+qL1g+hA9jKXNDn22zOPJwEJ6488al0p/Au3kbj
	tVUxtyVawB5UrEGWwNKht8C0lyXBhRRAuOt8yI3axZSuR1axITGWz6t5TV5FQjM
X-Google-Smtp-Source: AGHT+IGxhGOHWxlwjfHXni4jgqjY+M8R2QnS0+2eP3WAiaiHZA9jk641PfZgrwlgEilCxg9JQMeQ7w==
X-Received: by 2002:a05:6512:683:b0:542:2f0f:66d9 with SMTP id 2adb3069b0e04-5422f0f69d8mr3932707e87.16.1735035462028;
        Tue, 24 Dec 2024 02:17:42 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223600596sm1576865e87.92.2024.12.24.02.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:17:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 12:17:12 +0200
Subject: [PATCH v3 13/21] arm64: dts: qcom: sm8250: correct sleep clock
 frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-fix-board-clocks-v3-13-e9b08fbeadd3@linaro.org>
References: <20241224-fix-board-clocks-v3-0-e9b08fbeadd3@linaro.org>
In-Reply-To: <20241224-fix-board-clocks-v3-0-e9b08fbeadd3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Leo Yan <leo.yan@linux.dev>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shawn.guo@linaro.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Zac Crosby <zac@squareup.com>, 
 =?utf-8?q?Bastian_K=C3=B6cher?= <git@kchr.de>, 
 Jeremy McNicoll <jeremymc@redhat.com>, 
 Rohit Agarwal <quic_rohiagar@quicinc.com>, 
 Melody Olvera <quic_molvera@quicinc.com>, 
 cros-qcom-dts-watchers@chromium.org, Stephen Boyd <swboyd@chromium.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jonathan Marek <jonathan@marek.ca>, Vinod Koul <vkoul@kernel.org>, 
 Tengfei Fan <quic_tengfan@quicinc.com>, 
 Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
 Max Chen <mchen@squareup.com>, Vincent Knecht <vincent.knecht@mailoo.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=920;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=t0rQXPrtoBaJrNoELAVHdj8ug8kB5TUw+I/NzNZW0co=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaooi9ABuF6/gcvJtVneJJwiTskffxsrfuO9Cp
 skgPBE5yeKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2qKIgAKCRCLPIo+Aiko
 1fbFB/0eBVRT6Wzute2kVUQ5AQ61H09fKYyRVWO/htIufrooKRmjXOwG/4UvsXtdgqfU8mfZ1Ab
 wgb2UYdRG6WBJvNgYGfjDRlk05uxYYB2gwzEqQkBUXLV08HhgCt+jyYCWYCSdH7HGLIQ6BC8snR
 10mZBEUnqWiidmPygj4yHEtaBDL5m1YPNN+iVBnMFB/maA0+aB4966pqV7CljpekrFT/iOY+GDX
 jeCM3HHCU+SH8y5HzGFsqYS/wEHdoBX+NydR1q4czSBNBt7w73P3TFCZbE/8MT6YPWH7Klb+wEg
 pbc65+7AbDnF9VpbDIF8qj03VhZRgcKZMP6qBYdCdBKpde6P
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The SM8250 platform uses PM8150 to provide sleep clock. According to the
documentation, that clock has 32.7645 kHz frequency. Correct the sleep
clock definition.

Fixes: 9ff8b0591fcf ("arm64: dts: qcom: sm8250: use the right clock-freqency for sleep-clk")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 48318ed1ce98ab40de75129cb9bdfe32eda4c004..f39318304da8d02ded9bc4ff833bc88139ded744 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -84,7 +84,7 @@ xo_board: xo-board {
 
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
-			clock-frequency = <32768>;
+			clock-frequency = <32764>;
 			#clock-cells = <0>;
 		};
 	};

-- 
2.39.5


