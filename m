Return-Path: <linux-arm-msm+bounces-43225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8471D9FBC1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 11:22:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86B081887402
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 10:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36D01B87FE;
	Tue, 24 Dec 2024 10:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R5tVIx5D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2951B6CF8
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 10:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735035437; cv=none; b=pFDW5PpNBUc6VDUrHblkXh5K0t419S1TOJXgJiCdx6p45q8FBrPAUCcXWjxVLn0E6JVoOq2dfgYyeePJ5akDAqztVdyqQ5llBpjNFxEO/Dho7Ym+JHMfyCUvloIApOy5tPwfdRNQyckWmi6hKVIOJE+AKlZCAHZwMTi6qHk8348=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735035437; c=relaxed/simple;
	bh=AcRj8PcnHg5wF8WrCCf+iONlLmGYiLAyr6ue6biir2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dyNpT/6CRi9xoFXQt95G0X4oTTacFQnlM7M2/wv5SYbbpCz0OrNMf7gkIBSVHuW8bmp+tj3QhGNKDX4kOwxmRQmIdNKuoC/NbchegOztTkFK7jiuMPOdg78Fk75XzCMmMZPiPNWUIZlmNIT1jZzy1Y9HkY7NgPRQkKaJ+KxzP+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R5tVIx5D; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53e3a90336eso5487462e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 02:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735035434; x=1735640234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ehDXhExaGgh+zo/Qn+x4TP62l4KmX0Vf5iuas4mEBCQ=;
        b=R5tVIx5Dj2LJK+mIxELIw/d5gJB0tb+6eOONlAQ+E3H1eWoWnCarLm2Qcmq7JEWURq
         2/+reaF8JqvVE9tqorCzUFV3Rom3kmF282UcAiu2u7sfureMZ/WoP/wfWtrg5HdurrDY
         UFHFtwXXsGZUiSAHJV+6mPypl5zOlaKj3VzkSMAAre3JHYOA+d1ge8QxX4cYJGRG8D8M
         0ue/QkNZqf+OzK2WV7VYcdJqVmhliL2ggiqWclrUi8RKF1Vxh91jUw/4ODxysmvLZOtw
         ukqozRz7rlbzVZm83gQQHjU5uTqxvkKejiSYXcoUyCq1dKFTr9bGqKupXeMwgX2WhcFR
         z5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735035434; x=1735640234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehDXhExaGgh+zo/Qn+x4TP62l4KmX0Vf5iuas4mEBCQ=;
        b=TrbR1GonaEGIJe8xC/ICxM5aweD49lcV06QQuKiDgAUMWvBwszVTPghiPOtgdpaJxT
         uf0iu9PAMHhGjeVahHAErL12dnw6TtdQW1vgymCG516OCqVRi19awdJsLbh7eHDzcDnx
         Gwt0XMqqpTPVRSz3ifYaJQIwnTT7HZUNvbOX/OVvEj05fHIEP63QXbcWEywoA/GRNyr4
         OPrwW92PaYC5jnAPqnJYYcEgYRazEbbHEgTMggHA6i2H0j9Hwlbg/Zi6R6jah0HRQhvK
         YnWEFmFSqdimRkY2vOCYDvO6uoMps5Kjr3UT6POjPBfNvhdJamyseiTZL1QdrDzIRPpM
         A8ow==
X-Forwarded-Encrypted: i=1; AJvYcCWYw8TzqrbfAdQRhoRBbfP0Yu7GCs97AzSQBNgG9w5brX1WmqzjuZjU2hKQ4tXrASdGla9odrIvuVH24k7B@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjd9tfY1LewgP2bEaFRTixOnAp5yT476VTGRDvSAPgr6o48DJR
	+VxMmqf2138wkOW5fTl9RSjrrjroyaGDnzHU3R1z7E6qUuGwqrb5YZClS4Eik9g=
X-Gm-Gg: ASbGncuuKCZDCuhJge660c/StHCIf/WFupwMpxMaehxUbAwdZFuEUczjj46SRGAKlZx
	MPoHjGxIsULSPMjOaWQwKjXnhbLKhMUgYWrHIe3YYbtD3EwHeTKAXU2hXE01sEVIH1o0T5Ko2i0
	BXXHDmnLXvLM8N/ssJ2UxgIZftxDoE1vqZ5gwZTAIYoDhTBDlR+4Z2QzaL5LHBknqqysOmed0dv
	ZQDeyTMZOypIeHMJOEolR43YU1yBzvSKilaqKQr9FSX/7laM7jEeY1mRFQZ91HF
X-Google-Smtp-Source: AGHT+IGr+fgJ4sOQMTBrTgoRc9M5Ykj2ncBEesnyPEt7iu6x4BYK+kfQ/2QCEAN5A4En2MFhTgdk7w==
X-Received: by 2002:a05:6512:1247:b0:540:1fd9:b634 with SMTP id 2adb3069b0e04-542295493ffmr5166999e87.34.1735035434422;
        Tue, 24 Dec 2024 02:17:14 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223600596sm1576865e87.92.2024.12.24.02.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:17:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 12:17:01 +0200
Subject: [PATCH v3 02/21] arm64: dts: qcom: msm8939: correct sleep clock
 frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-fix-board-clocks-v3-2-e9b08fbeadd3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=891;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AcRj8PcnHg5wF8WrCCf+iONlLmGYiLAyr6ue6biir2o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaoogd5XEqxYO2UZD2PK6QPR+/s0BuiQfRfExy
 zWitx8ZXZaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2qKIAAKCRCLPIo+Aiko
 1deuB/96TcPetOdM36uMbM+QEYIAziWEVm269HHZkBqGYXzkMXW5EkrqwjKr81TcDaQI4Gzwzh9
 slu/V713gyN1Z4rPISgbxrpOOg8z4EjuBkvzUCRMsxawJoPRUxIxhAtUoAQ2drM8vsuK0OzBiLB
 up+VQYvKTOsfX7k4Ye2NMpjwqYKDlY+8k2f9QUI4KgOreDpHiizwTx1imbVwq8eMixputggiVZJ
 LIZ3e0voswWYB3vY4NiHS5SsLQjXgzaItEq8OqlB88FpjDpfFqAjOJZUarSkuJKJoCy0bYQ3hMG
 lWHNudVD0B3wbnyEWAE+XicuMChwYmbtt5hIgMNTycwP92qY
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The MSM8939 platform uses PM8916 to provide sleep clock. According to the
documentation, that clock has 32.7645 kHz frequency. Correct the sleep
clock definition.

Fixes: 61550c6c156c ("arm64: dts: qcom: Add msm8939 SoC")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index 7a6f1eeaa3fc438f7b6c1d3b2dd17fb1b6f81d9a..7cd5660de1b33def5b9dc8a0d02583c3eaffb17f 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -34,7 +34,7 @@ xo_board: xo-board {
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
-			clock-frequency = <32768>;
+			clock-frequency = <32764>;
 		};
 	};
 

-- 
2.39.5


