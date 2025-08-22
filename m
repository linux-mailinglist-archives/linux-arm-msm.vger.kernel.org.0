Return-Path: <linux-arm-msm+bounces-70295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F21F6B31309
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF1AB1C8626D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A282EB5C9;
	Fri, 22 Aug 2025 09:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nO/HTrwQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BF02E2F17
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854803; cv=none; b=gv+fcmVh4nuMHd1uka78atWwygk8pO6YyN7TWcr/GiDXbCdhPseeYdtLKmzcbhV528zQ9zzTevgGFgmLZfsMFaP6uxriSHNcMAZwS0l321M5CRo/gDDjRLdXM2snJgQxsegJ7D+FsNYEmEQIiH0maPzUy+hjQpEA8a/BpCzxedg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854803; c=relaxed/simple;
	bh=C4TnU2YDn79d1hZKPF33rnSJzJUcjFicRADIi/s+iJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rEwIIrWF8moNqGxsEb5B71YNikABSV8HLB8dbPQKVrb8vPLlZlwyoqT0rN7cbAieRN6jqC3fapiBUVTyTFWxbrrve73f/84QNsVq279ATFja6RUVUQuj+BiOE5lCvuT8MP0lUKE9FUS9RvYuk2D/ljlI2zoLCrc2P0AZ3w4ObOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nO/HTrwQ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a1b05ac1eso10815135e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 02:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755854800; x=1756459600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zuj+iAOhtgXhlr4DasU1PClq4DgoiYTAxV9eMIo4W6U=;
        b=nO/HTrwQAGrs56YntvQnX9WInslLWfyiXY1GKvaIoiSOhotNICSeCQP126qHCw+oZy
         hN/h33UkerSl9BUVxWTFR64gaXEpXcVaBFGazhqa7SJ9forMvohVrP5xI/PEVk7A6d6B
         YAKAiUB2CBkhg9RQhOVHh/0/Tl1E0Y+lizytTbgwWsmoAo/whrnfezEFO10RnHOptahG
         t2XiUGWa7HV0QdcgrkEuS/GYlmJjl7t1YxPzm6ZlhfuulL0EQL53YhCc/PisbqS4QNAg
         kO1DKGrECaauOyTZYGXb8vFMjdFdUkU5qorPyrooGrVXNqgRNAAOezKJa1/eKQTFAOka
         /p7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755854800; x=1756459600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zuj+iAOhtgXhlr4DasU1PClq4DgoiYTAxV9eMIo4W6U=;
        b=Y9I6PdTaQyVco29f27YxSPOYXLNZU+TO8K8v88J8aJm6Y/erRjyuwsDu/bKkd4lL41
         M6n2CtEnjJqM9neT8Fgd6GAxst1nfyn4uounH54fh7YzuFYyGpOppZcaKCBplfiIpamn
         yX0REOnheKbTTWpZYg3Ym1rJRprZ4r3CeIIUXtDzo0MCsm1NVZWbl5FJANpIJTM/MneI
         WZsfQ+rEJqZQ+OCz0dAk6B4LzQa7v4d9UIB7HnRARnDEXU/JULzkJ0vDOvfy19PdrxIp
         WFp++j2BUIj1ozGdMEzHjKwtHs70PMFHFbIbTLIfaGDkTBx2VlMydCtnBBGl39UdsZTg
         KmHQ==
X-Gm-Message-State: AOJu0Yxk7hOaNObld0j5IlOYnRS7Zvat3RdxOODkmalImHD4hoVQLmph
	wtPkYmN4Z1CLrPxnJfR0BBgV3B3IZbFntC3/GEH9P5R3zmt9PeXrA57Ien77A1k/8AA=
X-Gm-Gg: ASbGnctaYqbeK9JXjtM8CveYhJm5I/zDcKjsK7mQMtEebMF9U0LLplQHd7uh09fVkoa
	BgOGFTCEqBHLKWQoMFrOG0O76s36E1Bj+jBuO9+Wyj9fE8/1oaCnDIkSS8yix3cjzWSiliEi7s7
	Rmcu4EsAtBXztRfI4zbyPJku8AD6b/L1ku8Kijx6q8xGJOoriWm2D7lhEXpB9TF2U3A3P5QnHiD
	oe8thx0jVoD0BtsDybk6yvkrojktovc9OViiVPy2L2KLimwy6XPOncwquUZTHxPAF62VDd1DnVK
	snLxrvO7EmvByvk9m5ynUSjVuVtmjNg+dtnk5+dGNnNOVz5WwSYgooJ3kDwxjQ7qQP2MaiPg61G
	PpQaDWHCYPNBQfPQp473zEt8bcKp0ZnuWN8k/WyKvh4Q=
X-Google-Smtp-Source: AGHT+IH3SCVoDUXzpVQKZUne86yIuRvYTzTQ9SllmeMy+IlSalvEzfIiZoJ4B1+D9DEPGFwISwhoqg==
X-Received: by 2002:a05:6000:2c09:b0:3c4:39cc:362 with SMTP id ffacd0b85a97d-3c5dcff39damr1827701f8f.58.1755854800301;
        Fri, 22 Aug 2025 02:26:40 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c5826751d5sm3297007f8f.14.2025.08.22.02.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 02:26:40 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 22 Aug 2025 11:26:33 +0200
Subject: [PATCH v2 1/6] arm64: dts: qcom: sm8450: Additionally manage MXC
 power domain in videocc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-topic-sm8x50-upstream-pll-multi-pd-voting-dt-v2-1-28f35728a146@linaro.org>
References: <20250822-topic-sm8x50-upstream-pll-multi-pd-voting-dt-v2-0-28f35728a146@linaro.org>
In-Reply-To: <20250822-topic-sm8x50-upstream-pll-multi-pd-voting-dt-v2-0-28f35728a146@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1344;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=C1mW1P5f/eV3xTX9/EGe13scB+qV+ElK9sPewtfbTHI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoqDfMfhIPjtACjZgd0bI50dxn2aaDFeJJEfr64mpu
 INzDkeSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKg3zAAKCRB33NvayMhJ0XMQEA
 DG0tz589Sl25rBka2R/i99dzIpRPqcEYcTv0ET+k1iemoOysfu5KvrVTh8Ml4qSjyHv35zOsj10TTs
 JhErTCmS4xCnb9Fp9FDvEx99JqlvxwHe4NEKA8k2OhWHrlK4RgOfIBqlXG5s7oQ7jQZIZqeImH1jPQ
 TRFrebXTgmO9Pp+7uKutenUh6LyyFrGrlzoV+kEYwV2asH0S8uOAQEIsZILsLqJLUPE5Ijy1/K+Isr
 1pQtiZaNktJZbo+7J4g/zXvX8J9q9b/JQdjDO5y2lEwOz7ZLFKHviCKLNX8se1F0lHXNUyDJPSa8/9
 fiL/Shl13dw6nwhmp8fP/2wug2zmkoE2Pvedm+QeAuzrRdqc+A0+jPCeturasb6gQQxKsC3NgRL4NG
 3HuUhC0El41aCNpK+Nxf5XN5gCrO6EWjwoZVV5AwKXyS/01hXtOpmjmoGjoTOD3ZWbFOBsu4p51gIH
 3k1Bs/BFKhkDaJTEjj6Lh/S+oNE1FcspKRsA9UfTPR3gGu/b7+ehks118LajKfFK59GIaEKF6W2d+W
 fLNrd20cYhIQrMdg9ItljzDaZZKlB/uOZJlVCPcg1AdUlrfBaRf/qfXfx8fUtvkbLhwOMYC26F2DwF
 tDZ8vKxt657Aq1PDDLPjNhvuBAiugHb/1zouFhtELTY1YiRWyFacEe/XxGWA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

From: Jagadeesh Kona <quic_jkona@quicinc.com>

Videocc requires both MMCX and MXC rails to be powered ON to configure
the video PLLs on SM8450 platform. Hence add MXC power domain to videocc
node on SM8450.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 2baef6869ed7c17efb239e86013c15ef6ef5f48f..8f6db0d78f738b14c776735d6b3ae9233b165026 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3199,8 +3199,10 @@ videocc: clock-controller@aaf0000 {
 			reg = <0 0x0aaf0000 0 0x10000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_VIDEO_AHB_CLK>;
-			power-domains = <&rpmhpd RPMHPD_MMCX>;
-			required-opps = <&rpmhpd_opp_low_svs>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1


