Return-Path: <linux-arm-msm+bounces-43224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC829FBC1D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 11:22:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A38911885A86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 10:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A15B1B6D1E;
	Tue, 24 Dec 2024 10:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J04eBuK0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CD31B4132
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 10:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735035436; cv=none; b=P2skFzgN+YKhng63rWWPJMrCIufPF8t2w679WxYB+3mQ/XuDBdZq4QDXOJ0OT3GCsmixQEdlpBsf7b9NEiLow9tptvN14K4cJXy4VscjvfVFaLoW2yBVm4wV+1wrrHPtucj5/pIBpA8DbdiHUR/0bG5xxdXmS70hqVUqtL6XAio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735035436; c=relaxed/simple;
	bh=RRNUGJhydbP97WLehq1T9w+y0AXTLiZzoSCdrYYWsLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lrsr9o6D68AfttDXOxYZC+cf1CnmhBHdphIqJF/omhNoTBbLDZ35pH76QkUEBaTzfBQ5yzReX3zWOWP/JZaDftJwXo9An9KFFndRj3dUmxGhMZwa3kuUxuxjJd0/+ccHUqN9qCWaHbc8tZbwMOImDILrSfo814kgA4eKkI9gjTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J04eBuK0; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso5434682e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 02:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735035433; x=1735640233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epR874hobbwB7Q3STH+BJThMFI2d8KsVV/Va6kd5V5w=;
        b=J04eBuK0eAC6Ud1NnSfbPXCMKqLjp0VdFPwPbAOhzgNgqvmcoJDjyuZ06ive+w2mUZ
         TXHFVeH7RcoeSGgHY6vrUnELFDZ5vVIR2zVgDOPj8R6ozr0zej08OMeK3q1xCMr44BV0
         AL9gIarofBMFY+i3GRN64zNHUD8LztQ8Onh7s1xzXAr60SrL7YnxHnhMYodq4+2baacS
         5P56xuK9yWdq3PWDo6ujI4ub03gbvJZf9TFvJ1vl8ItprNYU9vNC0eaBp8dGF8rtLQy4
         DO73LZPNXEeN08wxfyRULJqzGFncpqMC+DmLr/Zt2yrgesHG5VRmiALhvdmSnSDuCISC
         /3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735035433; x=1735640233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=epR874hobbwB7Q3STH+BJThMFI2d8KsVV/Va6kd5V5w=;
        b=CfFCZzalALNkWlqlKSyUPemXZQ97x3nc210fhxRwGmTE1ShkD1LXNDlOSi6YaiyUL2
         Yj3yKq/qpCWQpfSzM23JH+llG6j51KBOfPt4YbSKk29B8JmG1WUGPuCH5PoxXSgBwIdr
         8k+TQEyrgeaVcGWCGS3+28Qy2ovb4ktlebMTmrExk4HOM3q0rU32i7u6rtWo7g1TCqX4
         dstw8Sc39Ajl3S2FhFsAC8F7DvV6DFz/O+XGZ4+3OZr37BVYdB5+lBe6BeERYE7EBHqj
         NEzDCXWf6ihT0zdu8J/QdIhCyqX1yGONFJhZaJvS0lDKD+RgH18297nw4GQWcZCVo1wv
         2fIg==
X-Forwarded-Encrypted: i=1; AJvYcCU6V2+ME/ICYD7OtUgeIBmwVMetpPywUCzRo1xLlPToLljB0VK5ve6pMQ/ZH6we2h3bpUiaqJ4zYqX3wvFO@vger.kernel.org
X-Gm-Message-State: AOJu0YxWHog8lbfI/tpEFn8nUd8sQa+dksjNljKTkjVFmi0+x4a3lECS
	B7rP19DLS8B4DxFyZZ2zmIewJhAzW847L1hBeKfDlzxsQoL38d5RPJwwBxqyMzw=
X-Gm-Gg: ASbGnctP2f4NCOoTpPoJpMLL3ZEEiOub/fcbUomBsJKibV08bIqc9ZCTNCXfYYSqs9r
	0N5H7Nx7XgdDTE+Abbe0laWEiU/dj0DyzEzh7gYYjjCs49PywFbt16NjhMqR6zhrjWyprH4JS0Z
	I6O869PD0/lMh5GknyYyBh9LXFfsCriRlty+L9oZFqiV99/rPvGEEGX+hAtRG4TMsbKzQgAYX/U
	P2nuDzU16oRAhGQ/p6OmjnPKOflooR6OJYfkCuMkuTYqcLmZYl2kdZAX280B3g7
X-Google-Smtp-Source: AGHT+IFUtDqJ8+nxM4thkcJ6RnTmhESMACVCUIcvvBSYPXqlnvIN4pwNk3scHWzLOP4tKEXgRYgCHg==
X-Received: by 2002:a05:6512:10d4:b0:540:23af:837e with SMTP id 2adb3069b0e04-5422955fc5bmr4497195e87.39.1735035432734;
        Tue, 24 Dec 2024 02:17:12 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223600596sm1576865e87.92.2024.12.24.02.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:17:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 12:17:00 +0200
Subject: [PATCH v3 01/21] arm64: dts: qcom: msm8916: correct sleep clock
 frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-fix-board-clocks-v3-1-e9b08fbeadd3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=922;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=RRNUGJhydbP97WLehq1T9w+y0AXTLiZzoSCdrYYWsLQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaoogSCbyYs3URdwMTGQMgeH/zYpYzG+aKY02K
 m4ge9/rgVmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2qKIAAKCRCLPIo+Aiko
 1U2qB/9D3hai3SyhFJL9pbfPEIiJsXBpWgnottBU7lEYHppvRe9UvzhS14NlvLUCngkeDw2cu19
 BIqjUwIZsxZlTVUDGyN8yLnB7aQt5woGZZp98woEcsECBYgvb8S0GdpH5TIkoNpEodya8yLDcML
 oSmTZwQF793pvgPBwa+lpwGLpqdrvqBWr90E2MQHdB16xhi/YQ/xjhXZrMBnlBGnxlnma5QoPDv
 q9yxQVVvW0MoubEaB+G1A0a35RJ63ZMa46z9Gf4sqijFf27ZIGIovtoFfbO7oJ5jv+bqxpQj7P1
 CwFkJmYPnYgHaQychrjoscnatHI6evsM9uVjV53xttUfzdA5
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The MSM8916 platform uses PM8916 to provide sleep clock. According to the
documentation, that clock has 32.7645 kHz frequency. Correct the sleep
clock definition.

Fixes: f4fb6aeafaaa ("arm64: dts: qcom: msm8916: Add fixed rate on-board oscillators")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 5e558bcc9d87893486352e5e211f131d4a1f67e5..8f35c9af18782aa1da7089988692e6588c4b7c5d 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -125,7 +125,7 @@ xo_board: xo-board {
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
-			clock-frequency = <32768>;
+			clock-frequency = <32764>;
 		};
 	};
 

-- 
2.39.5


