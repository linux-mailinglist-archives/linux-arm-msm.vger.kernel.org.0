Return-Path: <linux-arm-msm+bounces-43228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6979FBC2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 11:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6270E1881AF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 10:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438831C5F1C;
	Tue, 24 Dec 2024 10:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KCBE9Fl1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A1A1C5482
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 10:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735035445; cv=none; b=OU7R48Q9UVqBMP57Xpc7neSTGARMGnnL+eY7YOq/BhOEWP0hDD6Le62WDFHK2tyEplmfrT9e28KX7w/gZD0Gf0VMYQcaVA4+Rgi2Zbs6h2bJiEVaKLXDpM8MfysWccZPD4044jQ6c2U7gMiOb+hwHiMbKsxo7QOP1sntdclbdrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735035445; c=relaxed/simple;
	bh=dSm81W8OxeK3gTXqKdadDd4ykcQub/N1yof6klx6nCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CjYmPxrSdGgnCHHLe6JcvYbQRVRx/YutX2PdXuY3s9he6h/8/3vIjME7PSZvwsUfg84d5Ta0mJ+ZdSxahbTOi73Acf/+Jncrk+OSnjRJuBraxMjBM/4E2/z0BH68kULKNhokoLDDw6z+YAjukliNT3zFVUDm3Luf/NOescpH30k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KCBE9Fl1; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53f757134cdso5511976e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 02:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735035442; x=1735640242; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JtqLBuuxq99YjBu1NlJsyy1afZJqqcmeNdDxNGeJwsY=;
        b=KCBE9Fl1dXZ1KQmoFQ7O4/cB9iIn+kzVFyEN01HHyaVBKJGlRCWo7Tl3W768COoyQW
         CJAUIpXPt1Mk9qgzXRK7I5RGVhQRjGDEt0WDr+j0K1k68NV50QWYUo9hq1azC9T+VNF3
         pHjLaZmv+aKIWzWAocCQgzeYT06r23nmhkFR4zJ3IDMvrUtcJPV4ZTDcn0CYT5G4lbar
         8lKPB9eAkVpQoXHoGKZm1Oa0MRB5jXxFolFMZ4ZwuaGDmB8HVm/ul3UuvGDBq5yfft85
         t8xO3bvePQrgamlrzaQ3LzZwo/HdMi6Jf7dCMEl7G5Waw6+lOZlV1hQXoy35lT1gGVbq
         IsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735035442; x=1735640242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JtqLBuuxq99YjBu1NlJsyy1afZJqqcmeNdDxNGeJwsY=;
        b=oJH0moqxWNskC6nNwlaBMON7OyZTr+4wOojn3U8w0UkE8k5TJkdUFh8ihmC6LiFLxs
         UBSlVf6hb2BifMSQz5P5oD/5taF0ZrkfDrK/XcBg9lVkLpaOKC0HG5SHazFIdJ43/end
         p1zp0ZD2tIMffLwcxn8xPAbWZ8vtYet6E6KoenwCHlYhiNUC9AU2uEVSDHT/KEaFAxk/
         bqK2efjgS2bvjt+Lo5+e2N6whQ7xw8uvZgN6sfT3l3npGfc97ke6OKp6BMtv1B/gL/BN
         IgBOwoo1/sAj94Gx7nQah0e3DN6siHwksHX9WqR76yLNAYLaPmMemOTMsTddqjEAL3s/
         bT+w==
X-Forwarded-Encrypted: i=1; AJvYcCWzRfHqj3fpOGajgV/DbVSBm4v539ACSHwKUVa+YOFfSpXGc+zs5Bf5m+LsvvUCiUm1aLQIw3zTNd+ga70l@vger.kernel.org
X-Gm-Message-State: AOJu0YzipudifF1uyi70h3lWyYprE8pLIq2P+0bs7GoO06BkM7I7a1on
	4rIkIqmN4v77/JKHbHorFLqxzTVyaDsKToyVZaqzLDbYmoytmo8yrst2z/rsBZY=
X-Gm-Gg: ASbGncsiVn7Mzz40A8qeAk403guCx8NrcxJvkUfn3/S60ibcyWXSIpUkZ1QzHq1B6NL
	rzvlbCGfQYsnvPta3ygidDvDL5zFr8WGxkwbwYMny+qjALdfcNo5bfp6IR6hkcI3jDVSjE6Gmk+
	gZ7U1PM7GT+k1tlf9ICYx6evHw6Ri9/pMTHcIz41LV5OCzTjmqq9Fmehh8sOYKlzlnINimmB+J/
	Tonc1ej8AYbOIo7BcgE9kPHHo68PP4k7cdKAfgjcVTHRWnq8+Oh0lEPk3foKWtM
X-Google-Smtp-Source: AGHT+IF6QJiCqxJuoH8TFWA7zu5t2JOJkZf3Q7UBbClicTBlW+dojDW+a/L90QWnjTJFG837detNUA==
X-Received: by 2002:a05:6512:1396:b0:540:c349:a80f with SMTP id 2adb3069b0e04-54229561adcmr5953634e87.38.1735035441731;
        Tue, 24 Dec 2024 02:17:21 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223600596sm1576865e87.92.2024.12.24.02.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:17:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 12:17:04 +0200
Subject: [PATCH v3 05/21] arm64: dts: qcom: q[dr]u1000: correct sleep clock
 frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-fix-board-clocks-v3-5-e9b08fbeadd3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1483;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=dSm81W8OxeK3gTXqKdadDd4ykcQub/N1yof6klx6nCs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaoogj20Rs8aW8Hkeaud3j5vPOPK3p/qeQoW9U
 3RnNotUY/2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2qKIAAKCRCLPIo+Aiko
 1RcxCACrEo4bNVWFuhVh3GPK8a+xv2HPdXbuTuZxU+s0AQayGGLmyRUbRJypctuKcwykTKQzAzY
 WGxJ0M/xSo+noBpTXJdH02JTf1FSKGWNi8gLd8QgkOyNI11wFMHRbmjJQ+cETi/69yjjV8vai0U
 4fpTI6p9o4Imeyy+G7XEEP7DQzKoJCthXSehl6XiGyDZMv8843EVdqOfBgQ7EtLgXB2aymmU8/C
 QwvdRaNNv7p5p1SWAYn9QW1oAeSvZ+lIoEKHpGUfVQAZdPJi2+LAOcfGtHWce7mExvMXr+eIb1H
 WZOdM2t/Dk5LWxlBujSjUOZ2huqOavoQAF+YAvrj/S+qjoul
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The Q[DR]U1000 platforms use PM8150 to provide sleep clock. According to
the documentation, that clock has 32.7645 kHz frequency. Correct the
sleep clock definition.

Fixes: d1f2cfe2f669 ("arm64: dts: qcom: Add base QDU1000/QRU1000 IDP DTs")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qdu1000-idp.dts | 2 +-
 arch/arm64/boot/dts/qcom/qru1000-idp.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
index e65305f8136c886c076bd9603b48aadedf59730a..c73eda75faf8206181764df4d1ea32f96c9cfcd0 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
@@ -31,7 +31,7 @@ xo_board: xo-board-clk {
 
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
-			clock-frequency = <32000>;
+			clock-frequency = <32764>;
 			#clock-cells = <0>;
 		};
 	};
diff --git a/arch/arm64/boot/dts/qcom/qru1000-idp.dts b/arch/arm64/boot/dts/qcom/qru1000-idp.dts
index 1c781d9e24cf4d4f45380860c6d89c21e8df9925..52ce51e56e2fdc51c05fb637ed4b1922801ff94b 100644
--- a/arch/arm64/boot/dts/qcom/qru1000-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qru1000-idp.dts
@@ -31,7 +31,7 @@ xo_board: xo-board-clk {
 
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
-			clock-frequency = <32000>;
+			clock-frequency = <32764>;
 			#clock-cells = <0>;
 		};
 	};

-- 
2.39.5


