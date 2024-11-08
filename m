Return-Path: <linux-arm-msm+bounces-37363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D15709C274B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 23:05:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FBEBB2239A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 22:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 545D81F6675;
	Fri,  8 Nov 2024 22:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xO9QnGQV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE241F26DD
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Nov 2024 22:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731103509; cv=none; b=nL6nlUXS5STuRT2kSVCNk3IlDOawKw35CtV5bX/7LjL5wd6EDmEOFT+8BMgAA71wNpQAiS+6nzY36Y6920jD+Nrt5iVVczUC1pnEauJWQqkohYmu4vJHrjhB3NurbCYKaZw1WbnVoUaf+hWQDx1Gfi+wKlwRBFYvKMslfcBsK3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731103509; c=relaxed/simple;
	bh=tzRvrPfLe7iWeS2C76flaewroFWUd6tFwInDUjg4GKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JB469ceyKV7eN7NzTX2+ZEi0vwj7T2GW6NLsU+q1t+NxMVU5HTJQ+AOnnMuazowXjl/ACCGAfsZl3A/8kim5x+hhtXu5FCeGo5zE2AfJD/ExlsU+zwFFl6wgAGHhnuxIrnhtRZsUtPadMPq5muM2ph5mXT7fkVc//61rcmYYKNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xO9QnGQV; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d538fe5f2so1810819f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Nov 2024 14:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731103506; x=1731708306; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LabBZ7pXmSsIG+c0Vbg7ntPmSxTFqGGL+H7IqzvgOxQ=;
        b=xO9QnGQVdMY4pVLARvYNfcUHRIfYTedAk5ceoaoPEuSZgPgOUT1AxdNNQwA6qSe1rR
         moHZ2w5V3WdE+TP0SBmFIIILI3ackAyshNGp94k7M21Vhm/aPfwGzHESeVzKfljQee8X
         8ToNnJ75+yg1G7piIwJODXmO0uyZh8tDiPPfSXJytA3vZIedSmYK8/j7l7rDUtv4Tpkq
         ORPyKjfJSITUDEgkWprsVf5ZqmhMKDfn9E1PTGAgairx3hjo+22qk9l5+E/DNwXbXC1g
         MmcSnBuM4GpRzEDQ+OwnUCPYI98XZtGn02WID+79wIZGjvOdZK7RrksrxZ8rN9Bwk9AS
         7Liw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731103506; x=1731708306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LabBZ7pXmSsIG+c0Vbg7ntPmSxTFqGGL+H7IqzvgOxQ=;
        b=cTAP7M2Mq/qRzWMoP6gH4ZaH7brgIywBf9RFMJAw6RLDx1M6WPL18loiHU1UPyRUQY
         Px5E2GNFTaCd122ofU3SIL+qQR87SnXY3Ccs8FpEnvnMjxULQibdJ6Ezh3Fu+JpxK3rw
         t+RNswujkBQgtB1tLrclxrfuP4lg7hko/+qCSgPGun2feSNLDSD4EocweOFIy6ED+9dm
         /Z65CbwkCczLUigZrzmpzaZDicsK4d3y1fe0zSmCtzurXvs9fw6/CVFvLbXtJxavHN4J
         YkjDhT8QoQucPR0PVSv9/ab74DEVg8qLM1YLhVTC+9tdMsMdjle05o+ZZCFyq2Gcgm8S
         T3ug==
X-Forwarded-Encrypted: i=1; AJvYcCU4buzJnz1b2RQ7Nac2DSVRY0GtfrrWrc7bOHjLC1gPiLgoxK0siE+Xta/fVQ0tQJIbU4CmmNyrJHC09jRH@vger.kernel.org
X-Gm-Message-State: AOJu0YxJJjKwy8wW6DwpZdShM32ERfSQO7l0vRTbAd2JpDBKZjIgyxYi
	mAwz2AamvcSxJz9soglQYXZxtIEvBp8YTzbJ80AL3tbmmgorq7oZF7bS6guyO3U=
X-Google-Smtp-Source: AGHT+IFZMd0c0pnccFI6OtFt+IbR/gQoFAtEILkbI82ropQR1aDb6w/C+eP/MDntzIQHfYB6aRH57w==
X-Received: by 2002:a05:6000:2a09:b0:381:f443:21e0 with SMTP id ffacd0b85a97d-381f443256bmr2030735f8f.6.1731103505800;
        Fri, 08 Nov 2024 14:05:05 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b054ad23sm81676125e9.13.2024.11.08.14.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 14:05:04 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Sat, 09 Nov 2024 00:04:42 +0200
Subject: [PATCH 1/3] arm64: dts: qcom: x1e80100: Add missing
 #address-cells/#size-cells to firmware node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-x1e80100-fix-address-size-cells-missing-warnings-v1-1-c1e173369657@linaro.org>
References: <20241109-x1e80100-fix-address-size-cells-missing-warnings-v1-0-c1e173369657@linaro.org>
In-Reply-To: <20241109-x1e80100-fix-address-size-cells-missing-warnings-v1-0-c1e173369657@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, stable+noautosel@kernel.org
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1401; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=tzRvrPfLe7iWeS2C76flaewroFWUd6tFwInDUjg4GKk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnLosI/V+//bph4jPMF6iW7B1BXTZi5i+2TtU5N
 8Q6aIa11D2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZy6LCAAKCRAbX0TJAJUV
 Vi4iD/9j+gv/wPw1DjsiQEE4wFGyy3nVGa3/xV4ROJISqplyNPft1CZ9TUsnuk6RF7m2BRSc2wG
 zNTVRc3KzI3eldTMP6HNk8lV6Pt31GhVcfrx511ztwHpBJnEiaito+5Vur+fyM/OHmmCJC5Our+
 be9O0FWp89q15j2o1f6Dp5Shy1+sro2EhISiGQdN6i2jO4vwtBwhA3XDoMANQwDwxiFy8jZYmox
 E4pwBhCZ+9UTxItAtuISHvUWHWoIl4TgOFZJEKMBsVpAfYwna9AWGR9YtZeK4ZBbJ/tpo7Go4h8
 L5OeFL3aEn5PwZ/S8d27j/Ju6fDCl5vfj0/IK1JlTFC2nj3XRpmfqRUzbcjwsUoZtC3zhUz+w7w
 2IWK0Xg5uTl+7eeonJAZnQ1mXKpskz/1fwr6/eWCBqjTYdskJe4m5QJ6aBSwpCX3IguFzBJxmrl
 7T9Hu9cOHpPlYxeRCUy+qzTGbpneHjvhqj6P5lnFisJ/kuj7B3c37NlyF6FzVLNvhciX+rjASw8
 U18YDxTEEFb8ptV7Ag+yL6kAvtiZcFlFz9HuCnljt3vlyzBYZ4GWlkSOAtoZdu60hnZ1oCGtv/e
 TcQILa05Ti5BJB0e+e8Xzj6qpV5RecJb0PHGcjNN9XyePVbbuj3LzhRbEQ+/z2pMDQF6QiJgGho
 vLy2icEEvKrUEQw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The commit 4b28a0dec185 ("of: WARN on deprecated #address-cells/#size-cells
handling") now forces the parent nodes to specify #adddress-cells
and #size-cells, otherwise it will throw a warning.

So add the #address-cells and #size-cells properties to the firmware node
to get rid of those warnings.

Cc: <stable+noautosel@kernel.org> # Depends on commit 4b28a0dec185
Fixes: af16b00578a7 ("arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 88805629ed2bf052ea6ec152794066217489cf52..c6b554bac616b9ea6a183e894d4e3d58516fbcd7 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -304,6 +304,9 @@ cluster_cl5: cluster-sleep-1 {
 	};
 
 	firmware {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		scm: scm {
 			compatible = "qcom,scm-x1e80100", "qcom,scm";
 			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
@@ -5804,6 +5807,9 @@ apps_rsc: rsc@17500000 {
 			label = "apps_rsc";
 			power-domains = <&system_pd>;
 
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			apps_bcm_voter: bcm-voter {
 				compatible = "qcom,bcm-voter";
 			};

-- 
2.34.1


