Return-Path: <linux-arm-msm+bounces-2886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D41800C8E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 14:50:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98F1A28176A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 13:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C08374FD;
	Fri,  1 Dec 2023 13:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GiGrVGiD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8797010FC
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 05:50:50 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40b4f6006d5so20477335e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 05:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701438649; x=1702043449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ylbvBaCtGkOr9v3ebXBx4OP+NlathOIL8CvJ0tgXpcA=;
        b=GiGrVGiDZPmnsS8n0nGLo9gtxn6c3d+CXUBjWXg9P7PBb0JjINIRZzVKubnvqC5ZC/
         AGaNnIQFxrBNWUn+StE1xPVk/UUTr7bZ91BOQvNaRkCPQj+3CSatt/TQA2cwfhZCu5eu
         1g3YlQe8XmBmKA/Hi3abDoTL4OHADMXm3O2jXwp96EmRVAxW04rVACO/J5tkK5CYMgoF
         ixjwdIpj2r66Icw44Gwqr+HkvuvAoi4FXxEAPmptMy4uio6Qw241lM4LLy4ti0+h/vq8
         y3r1RqNlT01K2WYU9MyH7ED6/dW8W3tfO0y0ep46KlUXBeUrIzsVwM6zYN3JYBMNKM7k
         b5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701438649; x=1702043449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ylbvBaCtGkOr9v3ebXBx4OP+NlathOIL8CvJ0tgXpcA=;
        b=TVSzcDe6Mamt77+qGu7vdsEKp2czekQ/xOEz1zitw5Fa8+FO4QjUSScikx92vneJfB
         6otNMwZG9sMkQlU3URFWLj6kJN/kJhvu+2/X580rTCEsQDXBeoDHZr7i7VILHoTLLAif
         2UyHXW4ZwQwG/hk9G3OY8PxHuVBN2fiDh4enAh9ciCMtQpAR6zFnngzlXTkx/p55aDvr
         bBKaVaBXCiYDtrMYbZOEm4iUe7sWgu5FueDmJK5Qv6YW+yIq1xAiyob7fctz/yJ6AJd3
         sbRM/1cf7/etE6mG7yKFdjncLsjWpVZYviPBuFC0q9TlmpSV593V/YrNTEkzVhauuLIK
         kQNw==
X-Gm-Message-State: AOJu0YwoygOifTQrBSj945bOE1+fsigYTwwtSrkqv13uYdq3+nSM851S
	zqnBEB9iR0pxsXEDsgmcUosCmA==
X-Google-Smtp-Source: AGHT+IE9CwsDjTl/5hZna/K7kGCFLWqfddeMFWTn3xMop2rQmLvJNTlpHF9HnPxUt+kVNeo7WeU6ng==
X-Received: by 2002:a05:600c:1f90:b0:40b:54ef:ff07 with SMTP id je16-20020a05600c1f9000b0040b54efff07mr436220wmb.32.1701438648757;
        Fri, 01 Dec 2023 05:50:48 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id s8-20020a05600c45c800b00405c7591b09sm5539942wmo.35.2023.12.01.05.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:50:48 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 01 Dec 2023 14:50:41 +0100
Subject: [PATCH 1/2] arm64: dts: qcom: sm8650: add IPA information
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231201-topic-sm8650-upstream-ipa-v1-1-7e8cf7200cd2@linaro.org>
References: <20231201-topic-sm8650-upstream-ipa-v1-0-7e8cf7200cd2@linaro.org>
In-Reply-To: <20231201-topic-sm8650-upstream-ipa-v1-0-7e8cf7200cd2@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@linaro.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1928;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=d9zg/kzQS8fG7uanCYvaRGQMwgYvhVG1NNJ0Q3b4OrA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlaeS2lEadsueYkzQ1p1S/dpDPKgM/ebJwp/ev3a8Q
 SowTmHyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWnktgAKCRB33NvayMhJ0XyTD/
 919kZDYpR1wiQPckhxQAfcw2ToPF1BkVILBoTLkGHTEnyrODqHnJ9uWdZr1em/EU/L9LdGCBTsmCNj
 DqQYkw/cfmPoWhGyz44EyZpahM37oo9xZQ2Yo+N+q4LLHuYJ9+w6Q2oxZso8rN786ZmnstU3fSFWfe
 mJtSvRbonQWCgGq5XJNmEuFsREoPsO9xl4//AYCbrHT/mFN/U8dy8B4HQLHdi6GiNO+0iL19GL/KDp
 dJbAYIQKYXdHJZ9pSfnxRGyfFR4pFb4RiXLSz/Ghm4m0fH/4iZItnO0IKq7l/05URqW5rs0zD0EbVF
 Nk7+yUkEhSznNCrORPTpWAOLlq7otmM4s4VzzSBRdpOpiCo0wMx5OFHyEziqgt5/mlEEQUljMofzeW
 dqdvaRuCE0r2/epC49bXh0TUmU9OM/v1e+LWTUL3nLfXZosmi3b6zLohPamC1bRwcxU5WJLL2FtwRY
 BC76yRIKMZv+ZHrUL0vXvfLQgCilCyZupNvP+45wt22wc0aqOLx7qaf2QkMxilsT9grIpfhAR9Ns/E
 Qv1r7BGs+NRVZsbPlpFY6tAhmjzkxs2qww1MXktU6XRXjPt+NKttw0myBSv5oB7/arTrLbb/ChYtFy
 5HKJkfF9vO4qwZHNhuP9aNhzdudtkLgDl7hehNaO6E8VbdpLRqRMnM9qsQqA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add IPA-related nodes and definitions to SM8650 dtsi,
which uses IPA v5.5.1 a minor revision of v5.5 found
in the SM8550 SoC.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 39 ++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 41dfa5e19a15..13dc1305109b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2558,6 +2558,45 @@ gpucc: clock-controller@3d90000 {
 			#power-domain-cells = <1>;
 		};
 
+		ipa: ipa@3f40000 {
+			compatible = "qcom,sm8650-ipa", "qcom,sm8550-ipa";
+
+			iommus = <&apps_smmu 0x4a0 0x0>,
+				 <&apps_smmu 0x4a2 0x0>;
+			reg = <0 0x3f40000 0 0x10000>,
+			      <0 0x3f50000 0 0x5000>,
+			      <0 0x3e04000 0 0xfc000>;
+			reg-names = "ipa-reg",
+				    "ipa-shared",
+				    "gsi";
+
+			interrupts-extended = <&intc GIC_SPI 654 IRQ_TYPE_EDGE_RISING>,
+					      <&intc GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>,
+					      <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ipa",
+					  "gsi",
+					  "ipa-clock-query",
+					  "ipa-setup-ready";
+
+			clocks = <&rpmhcc RPMH_IPA_CLK>;
+			clock-names = "core";
+
+			interconnects = <&aggre2_noc MASTER_IPA 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_IPA_CFG 0>;
+			interconnect-names = "memory",
+					     "config";
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&ipa_smp2p_out 0>,
+					   <&ipa_smp2p_out 1>;
+			qcom,smem-state-names = "ipa-clock-enabled-valid",
+						"ipa-clock-enabled";
+
+			status = "disabled";
+		};
+
 		remoteproc_mpss: remoteproc@4080000 {
 			compatible = "qcom,sm8650-mpss-pas";
 			reg = <0 0x04080000 0 0x4040>;

-- 
2.34.1


