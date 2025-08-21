Return-Path: <linux-arm-msm+bounces-70064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EADB2EF58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 09:20:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BF615E772D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 07:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8742E9EB9;
	Thu, 21 Aug 2025 07:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="njxYqY9C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF522E8E03
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 07:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755760609; cv=none; b=KfUmHDfC4wsMmkP/a4O6eXspwNcPbVknlaik3eqMNhIMXxhQtCPoiLbDqyR3wHza2zC7UDlKE1YyCNwfbJmB5wayvby8/T11AqYpDVnku8jwBv4kLsv8/zMUTkL5ChR37IH6GJJGrmlmkoahFZPFCih01iyzu4U35pDZ28dlHjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755760609; c=relaxed/simple;
	bh=wo+28rzLb9E7nLBgQRSXIPSdalCHv6JNOeyFv5zLcqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Anet/dPFEb6eDmlSXyt2f7zvouQI2w4KrVgKUPrQymzUxPHNJlxZ87ficUhCUGq6xa5hp3efsCjek6Vh8c+nq3+VSFqNtJLkrqhG/NUYyHt+9P8k6ZW0FoWJbJ8j1fiHSR1AiHnjZH+WjUkc04Gfwa7InHKov1oC64/G5SKyfJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=njxYqY9C; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1b00f187so3164545e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 00:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755760606; x=1756365406; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A4iYMHLc4WfPh2tAiIuQ5o+Q2It/ACAsF7CETw+1bqM=;
        b=njxYqY9Cronul0IVMPMu1SPaO8r2HX083A5rd6v0Q5Fx3S1/Xdta6kxuEX+HpmE8qp
         k4gsGOfY3hSAGZU7KZGLh+m1M6P7EqEaE0cWvjFIq9ViTCoE3c2ivn7EXZAesm/QPVyx
         0ds3ugjNnoz+moNEjLu36+f4Q4nTeQeYKJ9vF/yK/O0lrtOdNpGG720aW7PK3swp7Y1K
         aYPz8OAbdV75ALdpd40p8To7lIjf0ewMu4jS/00ftKCz13BMOYIKBanSY5ZCPfTiYJHt
         wrzHFjFcq3I26sSh2vhqs94784mM3tdVT24a7U8M7x+Py/Ml7kNJ5y6pHq8SGq+3qmnM
         NQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755760606; x=1756365406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4iYMHLc4WfPh2tAiIuQ5o+Q2It/ACAsF7CETw+1bqM=;
        b=OKo/xtci6qXMxECPbfpUXbMPeyjP4Cx7inziRJBPfKRluh9VrVXZkRDJbdbZV4pVhW
         vQ//MiBdf23ERKfCMzvmYRJ+Nff+bObs8HmMBKC+rFCoIqDq2zqgA0CeOwKvpjhMStGS
         gwO/gaH6eMAxF8sPYgt5oqvQdqbBEE5Rq/1HAQYEXNP/7FQDlsSmrzYje8mHd9qjCSOM
         uao1Z5wMS8DkuxxtfJnmqVfqjq6Zw88sLvhYu8dsCj0Pyk14MNF99zwuiEYxA9KagNXf
         gNSSYyTt7M1o6qikzpmn1FflALeexCTij9Gieip0xQpXe8U8P1aA2ziMGrKUhgmr2+0i
         nyrw==
X-Gm-Message-State: AOJu0YwcOeQZIvrrKRaxTceYQQedH2lhsvbzpvpF14lNsddjD6BhOt/s
	WQJr5Z96fbfWC4VSHLyxIDd1AIorrID4Jn9o5agG1rz3658Dumc2d8B3Jtd4uxw1oEQ=
X-Gm-Gg: ASbGncvcUyIBvHh2ONEzeEYpjXBc+wqgFTTfSvBlVKD3QM7WWOri/KtqpmSpdGjGNuc
	t3VuHsWmRgbe9wj6OsgZ5/+8ek2buK1LLN7egJElb45+D4dODX4n6V+bFdtlGgbPXKQaqTyYqEt
	EwJtIqLVrfbgE0ABS6jDUx6sHN/Vi0wbNkHIGu2ZnCRrK32Uy8QhaV4wk+zikKMMUlr6sDlDh+6
	YkLiJn67cJlMx/Nu5ZVZOEFl3eM/jhiId9i4gHWF44mNuq4n4NcY5GTzAYIRA1drplnVoF+1gnk
	L2lid+QTOo8kh1M7meMxQKKWMiMTJW4nbVHMxEJMDdkB+rXV5cWqmNZflmI6o+MyRdvX61PZEq0
	J5k1ftdvlf5jRtMNDzEiLLChX/df/rPmoCLAdb7gTILM=
X-Google-Smtp-Source: AGHT+IFTN5FaBHcuFjtS6gPq50ktmEC49nU6Ixl0wCwR3dx0Y/oG1NSklwCNCUe2CCdnfQMG8oi51g==
X-Received: by 2002:a05:600c:4689:b0:459:e025:8c5b with SMTP id 5b1f17b1804b1-45b4d85020cmr11366555e9.30.1755760605583;
        Thu, 21 Aug 2025 00:16:45 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4de5b52esm14411455e9.20.2025.08.21.00.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 00:16:45 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 21 Aug 2025 09:16:39 +0200
Subject: [PATCH 6/6] arm64: dts: qcom: sm8650: Additionally manage MXC
 power domain in camcc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-topic-sm8x50-upstream-pll-multi-pd-voting-dt-v1-6-a510c72da096@linaro.org>
References: <20250821-topic-sm8x50-upstream-pll-multi-pd-voting-dt-v1-0-a510c72da096@linaro.org>
In-Reply-To: <20250821-topic-sm8x50-upstream-pll-multi-pd-voting-dt-v1-0-a510c72da096@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1186;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ZndUBUupjU+OOdgcN5TmqiL/eMh2uIr1+LmbccinqKg=;
 b=owEBbAKT/ZANAwAKAXfc29rIyEnRAcsmYgBopsfXTHMWaB4GmgoNn/oesvGn1puHFjxEkD9cnP8+
 cychFD6JAjIEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKbH1wAKCRB33NvayMhJ0UBJD/
 iwIbnXLJfyoOtrhErUmJrfRf3rZDMcxTeX3THEYABCMZQXDVk/BIdx46pcfjjKpVNod5BtfGrzSvwp
 /iw24iZwkUoLoOMasEDdwOOdRM2fbnmlzJVG8hZsMBO808DoXSor5LYoAxmMB7I5XUIB35s4pqTPLD
 Wbls37hQn053K/PYD3jzJkKbCFEdtu8cZPd0J2wJ1qwm05fQGqTYLfW2iioWfLvKTmpnlJXCi1H2Ly
 N8D/7oHzJptzt6OkF1c95Qhjxla9uBRvRxYlHz2ADAn50Mn8uEg+HpQNoeRhxN328KsEPx6h36BnyV
 bixvgyW0Hyu/aVEwNHR0yjQSMVhB0+t3rT9yYgzYtqByytDlY5euay0SBr5DYgLDiCG6ljJv1izcXf
 HqpuRVxtyAVoJcNwZSnXkkBFTR7gTC5TBYPeStwBIcoX6Nh7V8oh2qy9aEoJYBMbWLpWsc6gKD9ukv
 a3LqvAP3YzWGQkNdmacHkBpG/nksE9SR5BpBTgdVPXpR+ECxhbV/st3/k+m1BnD8sos2Yk4MPNA4+D
 s8OfimoEibCudoqxwnYtbtbMlpZwnYBl+o46nafU+TU1TRxmepSbHdreFPjotR1yQ4b5fmln+6DlZv
 h1jDbgXM1Brorp1CeL+Odqj2qTMNfgrDpzC4270v3BOgzwisEKPNXTdgEG
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

From: Jagadeesh Kona <quic_jkona@quicinc.com>

Camcc requires both MMCX and MXC rails to be powered ON to configure
the camera PLLs on SM8650 platform. Hence add MXC power domain to
camcc node on SM8650.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 99b7c6603f284df54b0a4e0ed554817fa8ce6f35..890c4341179a471416bd63308d13b0e313188142 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5349,7 +5349,8 @@ camcc: clock-controller@ade0000 {
 				 <&bi_tcxo_div2>,
 				 <&bi_tcxo_ao_div2>,
 				 <&sleep_clk>;
-			power-domains = <&rpmhpd RPMHPD_MMCX>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1


