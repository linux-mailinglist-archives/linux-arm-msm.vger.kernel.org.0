Return-Path: <linux-arm-msm+bounces-43239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC729FBC52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 11:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8B85168B20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 10:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386DF1DE2AB;
	Tue, 24 Dec 2024 10:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u1MwHGkv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DF71DDC29
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 10:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735035473; cv=none; b=iiWuYujnuNA1GB2VEvgtNbEK0zr19KU1FxEhRB2/RfirTInwUECgge8TXnwhSZK3cSn3eTA93Lf92+fWPiCh0ckbkgBP4SX+AeDLkJPjBbW7qeO0yCYbExt+ow7Ouox/+yWpMJw4nejqVVx+PFe0DG6WPUoO/s+cjNr0cJ3XQlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735035473; c=relaxed/simple;
	bh=oCnFN08aVITyKXapk9h/eTP1McSoWUQ0a6cbzA6vc4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BPo5xyaFfeL8q6gGCmbYsoI5yTBJqfn1uVIDlaYyAiZs7k8yx9zWonflGWz/GPg8+zDlAd55sngxfVlh5L8UZaDGvhf1gcg+mg2BqU64X1MUI0xVBDYu8r4DMSYbdojMlVJ9MKcEh+7OJ1nwnHQc1zruVsqMHqMvCjklRTkVr9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u1MwHGkv; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso5435199e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 02:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735035470; x=1735640270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o97PprEmFcE1YMTUzaFqHNHrKjzvxr4tsiAOHswBVG4=;
        b=u1MwHGkv9MH5wL+HEt0JgUO/zBXz2pXwBY561ZdZNhjpfgC78RtuZpKn2JLCaPyLkj
         K8OgoyN0JfL9gcPK+u2EV+ZghAe8QnsvDK87hsmgQ4IocEu1bqW0P9jhBdXeupFnawJb
         +PAbx7qPeaCKBwmewHJzwiklVtsUQ/AhewsNZYZGCk9rVHKGExQt8EsvMSIXwTADhL3w
         X88Ow72zjPdZUzKbkcqecEtMv0AL0UyPbBDjFoIa5Gk51XYWIS8kiZ113cjKNjv+rj2j
         tfhqb0DQrLbbPodQZE6t2v8HKOIONOID2/omt2i/1L+7OhU59GomqZ3z0goxctxncoKP
         arWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735035470; x=1735640270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o97PprEmFcE1YMTUzaFqHNHrKjzvxr4tsiAOHswBVG4=;
        b=h62ao6y7q/3Awe4+IoPKkpDM1Erys5KyAAmgS6o0PrL9S7nVWdYEVxNpHfEiUD5Ug+
         QoKU4RPcE1ba9OHcHkaXrF8Bbhz/dcBdJ8d6IFOBuo0aAWTJeqfBy4fCKOYt2vrlXDQ2
         ZuOhLv3UGy+EV9qAOEESbyd1DvQz1D8K9X1tlqkqVfjMD9SSW2FmleEMSCYy57rPmDSs
         jSKz03qVOh1RpuiXTa5t0vVM5934m9VI7OXIbN+3EYIrOZAf4y0663d6N3gcbnD764sO
         lnx3qBJ9qppZhlNjkeMp1N9qdUfbU88+hphA1qxIaW1EScg451zVuN02aUam9mPUkeWc
         VVlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbbLo0XJ+fSa3xRM8Q6/dBpjyw2kovbAW7ONOCHLGwN3r/3ojzu1k4DCXzPCAZhidYz3/spPtmNbUw83H6@vger.kernel.org
X-Gm-Message-State: AOJu0YwMzXRGu3SK/5an1R4MgP5MvO/CcKJqJOKY8Z/jbWy51FFe0SlI
	GPpKIs7tCXrSaSZkQaZ10K0gT+lmt97pB/wIWjdXxQ2AS6VIH2QkPeE6W8fhiK8=
X-Gm-Gg: ASbGnctDtm3LrXKuyCLA3IQe65QjerW/a+zZA2pI018yQ2kqKL18cLEPcyCfW9W7R14
	NqVej5dAkeiLQlEpS2rij09mjnaSWP8uRNLXfhM5/DqT7vLRV/S+mD0WyXZVIZ46zWDmJMA+e12
	akP8KbB2+aj/XoDArbCHUHAnEJd6yPWbYZoW1qnLstMUykV+gGYw5TV9XpgzTjURLbEn3OiapLx
	fdFFuH4yNYc1EIlHwrZ0l0LbKryYipKXC4bxyRXrzjWIyVkC366FakRBn+ORiKS
X-Google-Smtp-Source: AGHT+IFFuYnw2mi2dlwZnUXCzgCJaRggFiWga4xstZhpMZCf7C9BJpMQID/u3vnMQ43Vzd+JbTkSDA==
X-Received: by 2002:a05:6512:334f:b0:542:29a6:db5a with SMTP id 2adb3069b0e04-54229a6db7amr4262281e87.35.1735035469639;
        Tue, 24 Dec 2024 02:17:49 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223600596sm1576865e87.92.2024.12.24.02.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:17:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 12:17:15 +0200
Subject: [PATCH v3 16/21] arm64: dts: qcom: sm8550: correct sleep clock
 frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-fix-board-clocks-v3-16-e9b08fbeadd3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3849;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=oCnFN08aVITyKXapk9h/eTP1McSoWUQ0a6cbzA6vc4M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaooiUvXPsKx64BIcfs0pWTe5GSkIDnkz/PWmH
 zzTMlifF1iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2qKIgAKCRCLPIo+Aiko
 1cGoB/oDiW9NQW+6/Pmp0/oVFVtqlGAZSVDJUsxV4prEjK1sZDaqbuocaTfilBifQ5NvR924SPV
 zkprBuYLzpJEsmiOXPWr8lJ0ng0+84vUr/9nN7mZg0jPsUw+vektwIQ6T/k8b0CoYrZcUmMAEso
 KKRxcol1SEmo0g97wKQVlNiGErGB9L1CWRzxaJRygotSu4dGe0VHFxmYv2Ez6yR9qLXMx06XGz1
 mdHoRAgLovyvsAXu7/sd+CBX0NKziyZptSCcN9mf7dBsSdTWhdItIFuStxQXlGHc8W2EbI+uSiq
 /42zap/fHFLA9IugRr//muVPfC65uooQ/ellKE32oc0lLufg
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The SM8550 platform uses PMK8550 to provide sleep clock. According to the
documentation, that clock has 32.7645 kHz frequency. Correct the sleep
clock definition.

Fixes: 0b12da4e28d8 ("arm64: dts: qcom: add base AIM300 dtsi")
Fixes: b5e25ded2721 ("arm64: dts: qcom: sm8550: add support for the SM8550-HDK board")
Fixes: 71342fb91eae ("arm64: dts: qcom: Add base SM8550 MTP dts")
Fixes: d228efe88469 ("arm64: dts: qcom: sm8550-qrd: add QRD8550")
Fixes: ba2c082a401f ("arm64: dts: qcom: sm8550: Add support for Samsung Galaxy Z Fold5")
Fixes: 39c596304e44 ("arm64: dts: qcom: Add SM8550 Xperia 1 V")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi                | 2 +-
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts                     | 2 +-
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts                     | 2 +-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                     | 2 +-
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts             | 2 +-
 arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
index f6960e2d466a26bec4e5c3d31ac0bf54168ca1e5..e6ac529e6b7216ac4b9e10900c5ddc9a06c9011c 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
@@ -367,7 +367,7 @@ &pm8550b_eusb2_repeater {
 };
 
 &sleep_clk {
-	clock-frequency = <32000>;
+	clock-frequency = <32764>;
 };
 
 &ufs_mem_hc {
diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index 01c921602605726928bcba71abd937869880ea0d..29bc1ddfc7b25f203c9f3b530610e45c44ae4fb2 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -1172,7 +1172,7 @@ &sdhc_2 {
 };
 
 &sleep_clk {
-	clock-frequency = <32000>;
+	clock-frequency = <32764>;
 };
 
 &swr0 {
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index ab447fc252f7dd705fbe29725805bc1c146c10f9..5648ab60ba4c4bfaf5baa289969898277ee57cef 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -825,7 +825,7 @@ &sdhc_2 {
 };
 
 &sleep_clk {
-	clock-frequency = <32000>;
+	clock-frequency = <32764>;
 };
 
 &swr0 {
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 6052dd922ec55c65089e6b08e36c355b01bf24fa..3a6cb279130489168f8d20a6e27808647debdb41 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -1005,7 +1005,7 @@ &remoteproc_mpss {
 };
 
 &sleep_clk {
-	clock-frequency = <32000>;
+	clock-frequency = <32764>;
 };
 
 &swr0 {
diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
index 3c5d8d26704fd925857b5ddcc6067c2b14e1403d..e8383faac576a2f401fff74231a764712c832291 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
@@ -565,7 +565,7 @@ &remoteproc_mpss {
 };
 
 &sleep_clk {
-	clock-frequency = <32000>;
+	clock-frequency = <32764>;
 };
 
 &tlmm {
diff --git a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
index 85d487ef80a0be5c3586d9de69327abd2b64209b..d90dc7b37c4a74cbfb03c929646fda3381413084 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
@@ -722,7 +722,7 @@ &sdhc_2 {
 };
 
 &sleep_clk {
-	clock-frequency = <32000>;
+	clock-frequency = <32764>;
 };
 
 &tlmm {

-- 
2.39.5


