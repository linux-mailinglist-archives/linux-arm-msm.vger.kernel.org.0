Return-Path: <linux-arm-msm+bounces-4712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B75F9812B56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 10:12:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 606291F21572
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 09:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2ECE2C847;
	Thu, 14 Dec 2023 09:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="clxzH0FP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28251138
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 01:12:35 -0800 (PST)
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-77f44cd99c6so34861785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 01:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702545154; x=1703149954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkhidzmVun0Q+RVPRPkagjowO4OR2Vwj/TtI5d1pEJU=;
        b=clxzH0FPsT5iPZx+DVeG9g4dLw9kIzROfXH+lilTPy2AD9hGKVHriS6EV++/jMeops
         /W1L4Bk0k8kS1kB/BixiOHaMlv99z014kiZxEiD1k5A28yo4q1YNmhfRGXM9UNg7S1wA
         /lFHKtgr+3QdgfcP9fVihw4fky1fRiA/B+KqMfAW/e7HP6Bvj6uOsyjQZsL1v2KzCIBc
         Yj7mqYsaBXzRgG8G6vq09rsJ+swGufRz90D/aR2QQmRVCVFufC8hhCAEMn/urh6epb+G
         YYcNuwVJG7HSe0sDrxkAi1iNzeh53Iu81YE0XL6/r1d5F7MO/PQ9ErAC9BaKagtNx8OW
         wEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702545154; x=1703149954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkhidzmVun0Q+RVPRPkagjowO4OR2Vwj/TtI5d1pEJU=;
        b=Gi4iba1soq0U7+04PdvUsrBGajkktERm6XHA61IFdgGiike22vCbJGXIIMkkBer4/R
         jNBmnNCkADYtIYNBOW1VhgaEX2fms2UfFg+cFREXFU5yAouZ/QTZtk+7AQBOWXa6IjhE
         Ey5gs71JWd5HpU1GhiVVI23Etupkk2xRV2p/Wt4ADcUPwBNFZPqCf0eW+At6ASmmr0Pm
         iXYokUXTXlR2//nqwtHI7Y2gEUZIbGCsK8LnheaHnb42FSv0j9VmQu8yR+C9moNXnOir
         Gr1jJpKQzAEuExdDAeZb9kAtLnxjo3u+kz3P2eGtlU396/AQ54xsGk8lp/mhknQG6+qt
         Y7Mg==
X-Gm-Message-State: AOJu0YwlIKOrVOXx1m/2LWZ+kaAu8/QtBGR4DXBJRxiUgX0N21KnDcHN
	Ra2n3FaAhFHgmMfkcSe70qHW
X-Google-Smtp-Source: AGHT+IHEtm7mEgCIyDmSr/wXhkhEOgi12WL0DLU2N7twPYVrahWhPEqWyDCKPCHrKSIdtshq633qyw==
X-Received: by 2002:a05:620a:14af:b0:77e:fba3:3e61 with SMTP id x15-20020a05620a14af00b0077efba33e61mr12750317qkj.42.1702545154261;
        Thu, 14 Dec 2023 01:12:34 -0800 (PST)
Received: from localhost.localdomain ([117.213.102.12])
        by smtp.gmail.com with ESMTPSA id qt13-20020a05620a8a0d00b0077d75164ef9sm5144119qkn.124.2023.12.14.01.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 01:12:34 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	vkoul@kernel.org,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 13/16] arm64: dts: qcom: sc8180x: Fix UFS PHY clocks
Date: Thu, 14 Dec 2023 14:40:58 +0530
Message-Id: <20231214091101.45713-14-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231214091101.45713-1-manivannan.sadhasivam@linaro.org>
References: <20231214091101.45713-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

QMP PHY used in SC8180X requires 3 clocks:

* ref - 19.2MHz reference clock from RPMh
* ref_aux - Auxiliary reference clock from GCC
* qref - QREF clock from GCC

Fixes: 8575f197b077 ("arm64: dts: qcom: Introduce the SC8180x platform")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 8bcc8c0bb0d0..5591e147bde1 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2122,9 +2122,11 @@ ufs_mem_phy: phy-wrapper@1d87000 {
 			reg = <0 0x01d87000 0 0x1000>;
 
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 <&gcc GCC_UFS_MEM_CLKREF_EN>;
 			clock-names = "ref",
-				      "ref_aux";
+				      "ref_aux",
+				      "qref";
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
-- 
2.25.1


