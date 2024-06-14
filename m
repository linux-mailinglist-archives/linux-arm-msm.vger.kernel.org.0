Return-Path: <linux-arm-msm+bounces-22717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C77790899C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 12:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42FC71C271E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 10:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB0E195F3B;
	Fri, 14 Jun 2024 10:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tuCkvvPQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5191957F9
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2024 10:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718360313; cv=none; b=Cs/7KfBKX551wKXKoufrfyX5JyEUk0yDD1TzZu52rOObKD/2ypSLa5k+8GXMi1KUTuTa0uI0FUOvfcwrEiOk/O7HVMvAqiS2FHLaTkxLnWc85lMUJv8Hbz1FGMRa5bmt+fjHR2iKPj0CCyqIAhcQJRZP/I3sdz2N/zU9ebyNfnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718360313; c=relaxed/simple;
	bh=KCN2eANWYAM84jA8/6xmT/BGXcDHwINY3x+bGOwx930=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WbzRzQjb836Th81/i3NVKDFjKlAvVWonF+lFqP+JEQ6zHCwZUFBrtB+i0gi1y3nTJVaYe9z1ylRqM96oy47nQ54LHcNyn9NDK+ONTuap2wolP8rS2dAXkyB2of19xuUefZSwU18gRqAjV4dgx+/QA6Gwt94USpnkKF+0Okn6zh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tuCkvvPQ; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ebd95f136bso21465701fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2024 03:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718360309; x=1718965109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wGVopoWdqPSFlNXF2M7QZAnj/iJou3aBuTjurw+RWuU=;
        b=tuCkvvPQPQ9er96BQ1fd4zG/04fC2JznXLcSmf3R+hW3TR5HpeaDCkDXvT3hXLlN28
         k306Z5NF9uTfJuX7rLsSxCiy1eEMK5iPOvZjtUC0nUAKzl4iSDnykA2No8WtE1gCY1TK
         7q0gq+LBofOzBoP0yv22eLxhqbcjgpmO4q2Rd6WoYAz0l6Bh2ixayjwTOuZtI4Js+zZy
         c9Spw54goBWO657mHglMbzWxLwF0CnCQwK3Q0ndjBRINOOtZd7uNfweXMcd5O5nr5Qdj
         PHUTNqqayLMneYAlMq/gp0B/1dkZdzCrFjNiUBmKdKbtnzbSIKE7VTtSXY6/6laUW4sr
         IdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718360309; x=1718965109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wGVopoWdqPSFlNXF2M7QZAnj/iJou3aBuTjurw+RWuU=;
        b=dgbOiVTGQNgffBUUczh0LSpn2POTgWOeDJg2UXhkC/tWvYyjk6OqbSDXSEwagezw4s
         VK4P5f/7Sic+CP0nUZCv6Vdq+EvnV23CyK9Q5WncPnhVL4alywS8F0CUQluQWBc9Q71Y
         hZxUgjlsnwO1GhMKMWkbNIir9iuvLk6gvvaUTXskBIAgxbrJY9hvAcfDmZeuLetO2xWF
         IyWbyQHS8EQ1z3Xvh9f2LTb8OjD9GfWYODMS+VVXSZ/V2eEdSG3MN1XO7moFUPWsw2ck
         mfNtmTIRb5Em72LpzXnbVjnJbdgam3UdDOQ43PvCAAv8hxMTkjjzYhPhBabe3SspSEj5
         x3MA==
X-Gm-Message-State: AOJu0YwvQvi1YumAFKA95UQmx0tH8QM6F8q5cdAts7QI/Oi79P7vrQH+
	V6f61SUwuyLGV4F6VL0dAAMLR4HeicFkzkICC1WI0nTYXbbxfqu/IlLVg+vdyNU=
X-Google-Smtp-Source: AGHT+IFyATDGv41JngQAe9aj+vnWhVV/kXtIgvKp3zBckXUUjiKaV+5loBQYPqXyPZSskmg8Uy8hzg==
X-Received: by 2002:a2e:a0d7:0:b0:2e9:881b:5f02 with SMTP id 38308e7fff4ca-2ec0e60dd17mr13624961fa.53.1718360309661;
        Fri, 14 Jun 2024 03:18:29 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05bf44c4sm5000241fa.9.2024.06.14.03.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 03:18:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Jun 2024 13:18:27 +0300
Subject: [PATCH v3 4/5] arm64: dts: qcom: sm8550: drop second clock name
 from clock-output-names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-fix-pcie-phy-compat-v3-4-730d1811acf4@linaro.org>
References: <20240614-fix-pcie-phy-compat-v3-0-730d1811acf4@linaro.org>
In-Reply-To: <20240614-fix-pcie-phy-compat-v3-0-730d1811acf4@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1027;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KCN2eANWYAM84jA8/6xmT/BGXcDHwINY3x+bGOwx930=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmbBjxQDKgfgt86XMAJTyJakQrvV9cTkYPD2CnO
 AXdxPAEv2yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmwY8QAKCRCLPIo+Aiko
 1bCyB/0eNH5okiS2Gr2nUlUxzqZjhc4rx4Wt6oaJZe6usRrqFLkqbZoJT1ARd3gk98E47ifpwsE
 NmfHLVTjCcZpM85X8raYBVRnXFNEywYHJoLvs1KtCrxQQLEkNbnRuPDWbRnBFvgv/8ZaT7vmerx
 X4kv584KWvjBNuH0nfnpy2LR8f+o6cvfvWfr3458R+jwH5jwGOzuj2g3mKvSfDfASj1LYxBBUDf
 +8qwCboUnTPjh2LbrbBE8mGtMfUG4kx6eAapz78uvzKpEASJV3XSws6V3idjux6znB0R0R1ySbH
 qLxNt+IzUg7HQ/l3BLDXN3xszs0UhDD0wqN2Qwcb4YwCno2c
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There is no need to specify exact name for the second (AUX) output
clock. It has never been used for the lookups based on the system
clock name. The driver generates it on its own, in order to remain
compatible with the older DT. Drop the clock name.

Fixes: 0cc97d9e3fdf ("arm64: dts: qcom: sm8550: remove pcie-1-phy-aux-clk and add pcie1_phy pcie1_phy_aux_clk")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 4234c92aafe3..be4f0609c436 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1939,7 +1939,7 @@ pcie1_phy: phy@1c0e000 {
 			power-domains = <&gcc PCIE_1_PHY_GDSC>;
 
 			#clock-cells = <1>;
-			clock-output-names = "pcie1_pipe_clk", "pcie1_phy_aux_clk";
+			clock-output-names = "pcie1_pipe_clk";
 
 			#phy-cells = <0>;
 

-- 
2.39.2


