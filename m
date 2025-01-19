Return-Path: <linux-arm-msm+bounces-45481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA605A15F78
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 01:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA8AB3A71E5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 00:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 108F963CB;
	Sun, 19 Jan 2025 00:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tpTM9NnU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013D118052
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jan 2025 00:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737248107; cv=none; b=NGULlaqnaQG7T58Qs3l/NNaT49kc7F7cLrXVUZ8txF1QjhHnTh5pfybYhmvKGK6XuK3eZ8PDsiE9I1SZ3r2hopSoDfXMBySHSEzdi0HerH+JvU2ukVXZdQNkL2v+W8F+hPL4VFq6BuX3PE5LCHHXKFKOD2MYabgn8C+FcQHyxFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737248107; c=relaxed/simple;
	bh=80L1Dq12JtzwjRpRwlHmEABXhE6lvfKAML2aLdMXNSE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V89Ek/vR6y+4F5+Fh89mi97uU4U4fuL4qkUcm04M04kaTvSMLveu1PAwkMC6QHHGlVzuvS0b+jH8FE/hs52o4gCTYHc191VpB2UMcvFp257a86sNDWiNUm/pse1+uV+DNdNBaIlwh+h9ke2d8cOqymlb9mxBwjRW3lpagBlZrdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tpTM9NnU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436a39e4891so21872285e9.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jan 2025 16:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737248102; x=1737852902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CQoxBf1rxJNQe529IwiFy/vpDH6p6LVPDnMsO57jplU=;
        b=tpTM9NnUwcq+whVVBkZZ1FXhwtv2GtszdvYakNDnFOU3GHtR/OGOXA8OWQ4S4sCfF7
         PhO9YYqQbMIUatFJUHqh7wV67CLt4bjh8E6sGgrMUV8vPkD18j1n8V+cn+Rr89XfCRm/
         +jcm+i1wXILsCobG1T242q+tS/zKuYomVZy64swN4flv9yllN9ZxadOsIxSUVT38cOkq
         8i0fd/gf85Hbvbryp+thAMNbihfWNgkg7mt1ue6BwXba1ZZqDFlGPT6xS9T5KV2ZE3nf
         HzhX8EotrY5HpM/VxHUZX5xxI45iuTM05uychLqnUaDdAR1Yv7mBCjj6cbvbZsad6gYH
         4X/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737248102; x=1737852902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQoxBf1rxJNQe529IwiFy/vpDH6p6LVPDnMsO57jplU=;
        b=kNn4doY0tkLta064mR5509O/0RrHBWt7752TWP++0FXHoUvdWjeXHFDUePDPKOghpP
         Qush20lmiW7/CPljAVSB9HPzD2K9pGdVSh9c8IFZvEqE1BQQsal1bNHzL/gsODS8vuj/
         Wf+g5dHpSM091nF5mVKZ9UypE/RD0aeRCLSbUinPR65hxuz++f/bsdbbXQfXyH4gS7DY
         TyM0T31U+7/c3xWDXo8SIBAxbwQ7K+TUOLZoYh2Zf/EUFooQe5q6RLLnzy0PNczphmR6
         R/ST7ffMMvr1Vo91rmz5s3tHsupijeTEhToBOWKOxoPugn8wgNbCjw99EU52pqA4Uqn/
         Dqew==
X-Forwarded-Encrypted: i=1; AJvYcCUJm2tJnZ4Ma+A/auu5JJXLzvimorufMCAzKJFKHmbWuwrkOvqj7AddKUQyM0qYR6vRKL9DO8ePKa4aQM/g@vger.kernel.org
X-Gm-Message-State: AOJu0YzkW4t/OVdWX+qhIogu4L+SkJAzJ3AHT8ufOvwPCAtd5VPxVeuW
	apdM2fRVHLu0S5usBEwTW5BzhMFpJ7O75lOuMWOwwmzDPQEMk9fx0dCE/i9TWDs=
X-Gm-Gg: ASbGncvrQkHOF4ddOPaHy/oYXNCTsR1TP6MOYkTE1jf/v7wxMNB/TYfcbKnqF/4Es8Z
	UJ6G4mkNNWqNzzV9A25BY4hCvJD5zgUPPfpi40wEuMFM8Z+CTFtDSHJ+n9HqSREgWbR4w2DWvlz
	oghW02kDKnF9wA45VMLUqlbIXWiTEYFR+NsJGIaJGsmxBEIKzURmisDt+BFs2ufgP2sgBPT7azA
	2/56RIc1Lj5eEQWDZNUpYLUMScJeTm8KiWeHKpRtHbyN1kH6SZiLnVVh/mzINJD3N6vB/6siOEK
	nH0=
X-Google-Smtp-Source: AGHT+IEs+fLhbgQF7j4JK5dh+oehSJaN8Iml4g6zGqcT2YF6zI+kW80IlP/CdnQP5m2nGotoSUt0gg==
X-Received: by 2002:a05:6000:1863:b0:385:df2c:91aa with SMTP id ffacd0b85a97d-38bf565579fmr6508914f8f.7.1737248102427;
        Sat, 18 Jan 2025 16:55:02 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322aa40sm6339241f8f.45.2025.01.18.16.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 16:55:01 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 19 Jan 2025 00:54:54 +0000
Subject: [PATCH v4 2/4] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-2-c2964504131c@linaro.org>
References: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-0-c2964504131c@linaro.org>
In-Reply-To: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-0-c2964504131c@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-33ea6

Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
of previous CAMCC blocks with the exception of having two required
power-domains not just one.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 9d38436763432..10035bcfa89bb 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
+#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
@@ -5109,6 +5110,21 @@ usb_1_ss1_dwc3_ss: endpoint {
 			};
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,x1e80100-camcc";
+			reg = <0 0x0ade0000 0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,x1e80100-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;

-- 
2.47.1


