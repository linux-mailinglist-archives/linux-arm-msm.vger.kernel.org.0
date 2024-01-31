Return-Path: <linux-arm-msm+bounces-9172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5290184373B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 08:10:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08A101F257B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 07:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988E154FB8;
	Wed, 31 Jan 2024 07:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m2XlTFFD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6725DF17
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 07:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706684930; cv=none; b=O8NLjkftxothecTgoMxjB6hSWTy3jd19ud4/WZayZeMKQ8az5IjWZTnT2FML61kfk/1yY7E4r++WW1O/m0qD4W8CakIzAVAZ/xgsbUXc+UW+/wZuclkp9+LZ9k8T0Y2NBl+zdsI2BrHIaAyPXrkQ2KnRvaCWAsJC0zmd1/8yJKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706684930; c=relaxed/simple;
	bh=ntzdDmf4FOP4JYl7D86W3Hb9BDqaLc8AljqlYstG++U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DlQDt1Xz5o2MoRHcamDq2aT355iy93QXDHBI0VvM88243lXOGmpfCtP+h6R5ch9QEmzkehkc4itaaBx5go2tM1gYQm0WV3eLn7R4QAPXI3OLAoQeGO27nTZuGPiXb9LcBQBnK6OuM1ZvcO8j+ijFr1XFDoRLEYWv907hPPor1q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m2XlTFFD; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6e141ee9c14so558535a34.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 23:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706684928; x=1707289728; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7oNmgtgCElW74VgkhCqruhhIpDueOdHK2RkVOvuNPn0=;
        b=m2XlTFFDFfgz2mvje7zsjxRJaIBQ7BsQKuVN7AQihYVW5dLuXzn6hHOi8XEDh8FZgY
         V0y0HqJNsQZbfSkcHlBnAZwgc5FIYvpcLU7/B8usr4AWJG+xidmH5AQMNG1Lv0AiqV/a
         PU8Cr+YgeZceKBdaPaWrcLkoxwMBKuzmhRwPCLvTPYAUhkxaEnZFY/a4DUZRzu+631sj
         3spBrzgnaRpT0k2dWVK9yQSmrCm6GfN3PIWvd39991TOjyUqEtU0LOAJlkiFr2yvXxi/
         Ib5CnSLmsyDvyACson7LA1OhsOZC38+ieHw0HF7nJmvD8VQIBha7PGe3msa14BW4BC1b
         87aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706684928; x=1707289728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7oNmgtgCElW74VgkhCqruhhIpDueOdHK2RkVOvuNPn0=;
        b=dOuxf62Qqr5jL6XwJgKORhLvIsS0ECj6hOmwSmpll/1hUeprwrPcK5RD/9vQk4+nr4
         S47GwXDHEhkNL7fFsAZTvG7cUplI+XNeW9CJHdO4RVBdG4ZcBs0WIfKBfWwLANFSplRr
         tNK0Uz7NT4IRXrVKgkpCllszL/SrIWL7FN04jg42K7Zkaur8UMS3Qk5f1HTSeZZdiT+z
         a6QNBBYtNgkBQRJ71l0c+CeuxZL8JVRi0ht7Knoybkyno5xQ18lThWINjBHjwvKy7RkL
         DH940Bt0kWA7wTzsaOvmZbpUpo3mxi3dhUnE+nn+5mx7e6IypjM32Q3YCrtBEleQXcrQ
         OiNQ==
X-Gm-Message-State: AOJu0YwZppeqyEe0O5Qu3L1t0afOfftDx9LV6D1B2yi1XYD6ORU/ay2n
	5cEs1vEaUu8l5xrt5RIVEXtsjtbRSwDRegg2ju7CEzIfudQ5h0eivx+vStwmxg==
X-Google-Smtp-Source: AGHT+IEJpAeTczd0tUQq+sU2xCwLdqKOnFAWNye3Ir3ULRnmoSV+/aku6ccP/Y0extXBkhaha6umzA==
X-Received: by 2002:a05:6830:1bd7:b0:6dc:224:21ca with SMTP id v23-20020a0568301bd700b006dc022421camr522371ota.73.1706684928074;
        Tue, 30 Jan 2024 23:08:48 -0800 (PST)
Received: from [127.0.1.1] ([103.28.246.26])
        by smtp.gmail.com with ESMTPSA id lp17-20020a056a003d5100b006ddd182bf1csm9087956pfb.46.2024.01.30.23.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 23:08:47 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 31 Jan 2024 12:37:31 +0530
Subject: [PATCH v3 08/17] arm64: dts: qcom: sm6115: Fix UFS PHY clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240131-ufs-phy-clock-v3-8-58a49d2f4605@linaro.org>
References: <20240131-ufs-phy-clock-v3-0-58a49d2f4605@linaro.org>
In-Reply-To: <20240131-ufs-phy-clock-v3-0-58a49d2f4605@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, quic_cang@quicinc.com, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1205;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=ntzdDmf4FOP4JYl7D86W3Hb9BDqaLc8AljqlYstG++U=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBlufG8NNFnEdD6AWOhi0T1MZrEuBjXyTANfkvyf
 kU/dOw3owuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZbnxvAAKCRBVnxHm/pHO
 9bPQB/wK5qsLJdCyrzYKQmXRamB47fq/4jsJAe5EM2dfZoEhQTbOugH9qvJtG1AEQ6HwxgqrZkk
 5Oef+iz0pbpqFOKFp0Hv66+Ek5yk4CxydWFb8yWvhknXbsk9rNHfD+y8JBilNL+DTSmY1EVkJiA
 N7loSSlaC0/48acL5ye9kbUHREf4CGCFyARKOd1CF+itad/9VIYyUvtgVHHO3Nw8k8YqhqfC6qx
 Xe6RTo0ZaDYhbVWZj8PvOLgE9Kx/TxQ4RXau9OujMCEcHB31nylKtCo3FP2jaFiPBCtzCyerAHI
 aYFG+eJNxWDLG6lnoHRKCkWHpQzjHiX0MrX0xEEHNkf+1C9g
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

QMP PHY used in SM6115 requires 3 clocks:

* ref - 19.2MHz reference clock from RPM
* ref_aux - Auxiliary reference clock from GCC
* qref - QREF clock from GCC

Fixes: 97e563bf5ba1 ("arm64: dts: qcom: sm6115: Add basic soc dtsi")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index e71cbdef7784..261349c148b6 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1195,8 +1195,12 @@ ufs_mem_phy: phy@4807000 {
 			compatible = "qcom,sm6115-qmp-ufs-phy";
 			reg = <0x0 0x04807000 0x0 0x1000>;
 
-			clocks = <&gcc GCC_UFS_CLKREF_CLK>, <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
-			clock-names = "ref", "ref_aux";
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 <&gcc GCC_UFS_CLKREF_CLK>;
+			clock-names = "ref",
+				      "ref_aux",
+				      "qref";
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";

-- 
2.25.1


