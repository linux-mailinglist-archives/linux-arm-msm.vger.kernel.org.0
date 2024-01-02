Return-Path: <linux-arm-msm+bounces-6209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB9082173D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 06:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62E1C1F21AA4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 05:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9EC3F9CF;
	Tue,  2 Jan 2024 05:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pyAANgtI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C6E46BC
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jan 2024 05:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50e7d6565b5so6066269e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jan 2024 21:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704172655; x=1704777455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y8lOYzf9lHGaVZlb8fS25sx1nT4DOcz2DYNgc47/brc=;
        b=pyAANgtIg7FhqhMLwCj8fjQL4NHgnmu9KlNoGPWIMRzEGW9gGGYfnlkpv8wkWM+WDo
         8Rpc98cuTJPspCatn6/gsHO/p2CTEXr31rPXvjxRqcKzH3AcIp77na7gDON1PvBx2za2
         z9xRmnzeCJZl+zO9MODZ1HqBTSKiSnrrCWn6oxrfWMy/Yl/o1NcgZzJIZIHA8bLeY/Wn
         DtjURRtZCgqbBKiFoR2g9RAOLecLBSiQfMfrd+wxJSjdsHLTu3NngUGYY//Ekup20odI
         STbJOiSgRKhOE3INgZJg9y8m0k79cbIR2ae651GNzAe2gjXB3qUQ+BUIwsSDgC+T4NSu
         SNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704172655; x=1704777455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8lOYzf9lHGaVZlb8fS25sx1nT4DOcz2DYNgc47/brc=;
        b=qMjNcxmiXMADeJsyICGZEuHa8s+vcBVRHSSNiCixFqY60FbcFCX7NvL/antoDRmPNh
         LMsFbBxBIO+3BSlRL9Ag6tnx9550IX+8eYu5WbDnHc38u97qm3Q7lKc7mkZgXd2IeXAW
         fwJa+dXbVEBj+wG2KjGoKlywUyCmg44dxnQv4rr9l1bPgWAb7DSSuBHjv/YVqVzvJ9fR
         uLKfk9vhsxj/szXn26KoqCgg2I+Xu+xhXR9tzSvIgf7sZtG7DLbzoA4/HruER8NFiHIO
         kiIROTd/eumDPax6d9qgd6A/Zjsg28W5jOsz0+S7/l33aSG1o3w4LBUeGpKSu7/WYV6i
         bliA==
X-Gm-Message-State: AOJu0YxuNko7YoOwqPSlxq3eCAHdQoKYLsvFMR3ckV9L2dFKG3GVjTPg
	BkPWnGq8FjZjMxEwW2BaLH07SXr3zoFK2pUmRRhXD2P4zMU5zg==
X-Google-Smtp-Source: AGHT+IGCg6pTmUcv049c71VMzug4Vn+CPYDuVQbJSuAGW2pz0Z5jWRTxdSPrZYKrPTg8Py/b4NqW8g==
X-Received: by 2002:ac2:4882:0:b0:50b:e08a:4d00 with SMTP id x2-20020ac24882000000b0050be08a4d00mr6417022lfc.84.1704172654981;
        Mon, 01 Jan 2024 21:17:34 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r25-20020ac252b9000000b0050e810689e5sm2081827lfm.33.2024.01.01.21.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 21:17:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Jan 2024 07:17:31 +0200
Subject: [PATCH v7 11/22] ARM: dts: qcom: apq8064: rename SAW nodes to
 power-manager
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-saw2-spm-regulator-v7-11-0472ec237f49@linaro.org>
References: <20240102-saw2-spm-regulator-v7-0-0472ec237f49@linaro.org>
In-Reply-To: <20240102-saw2-spm-regulator-v7-0-0472ec237f49@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1593;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=V7C8+ahwDabFuLNNyvz6+tURjnNkYYcsgAUkWRFmUhw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlk5xk3eMZfg6T8We3lCZj1yP2p3bDudzTdnTOh
 tK5V7lV6zKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZOcZAAKCRCLPIo+Aiko
 1TqyB/wKfc9hJRud0u9XHVu3uCCZ+NWpTjFub2uj6mPCLPRsXADndGXDM8y4RP+cuYPvQbC/4Es
 Q7X/1Jlmtc70VuOy+owSY0nsMqT4kOpfEkFSUb6eEpGLq0ZROcW6gSbDJneh2oMpNqiiRvA4ALZ
 18XuClOTxwmvvQaOh6+STTc5Z/sKfjtvleFm1A6zrXqwvzsn62kls9mN6M+Z5kAqHIuVp91pH3D
 jRrdJfVaFoQexFF4qSmNW+TQ6f5ApNCQlRECaOIajAAM+EZq4OOOBE5d1KU00OgkXISKQp3vdUl
 N5f96CNVxK3BlDerJOLFW6PA0k3C7pBqk44snwL1EK+gK1N3
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Per the power-domain.yaml, the power-controller node name is reserved
for power-domain providers. Rename SAW2 nodes to 'power-manager', the
name which is suggested by qcom,saw2.yaml

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 3faf57035d54..3066ee49daa7 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -365,25 +365,25 @@ acc3: clock-controller@20b8000 {
 			#clock-cells = <0>;
 		};
 
-		saw0: power-controller@2089000 {
+		saw0: power-manager@2089000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x02089000 0x1000>, <0x02009000 0x1000>;
 			regulator;
 		};
 
-		saw1: power-controller@2099000 {
+		saw1: power-manager@2099000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x02099000 0x1000>, <0x02009000 0x1000>;
 			regulator;
 		};
 
-		saw2: power-controller@20a9000 {
+		saw2: power-manager@20a9000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x020a9000 0x1000>, <0x02009000 0x1000>;
 			regulator;
 		};
 
-		saw3: power-controller@20b9000 {
+		saw3: power-manager@20b9000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x020b9000 0x1000>, <0x02009000 0x1000>;
 			regulator;

-- 
2.39.2


