Return-Path: <linux-arm-msm+bounces-41006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 699159E9158
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:04:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32BD3162217
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 11:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A43421A921;
	Mon,  9 Dec 2024 11:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xz7XRAvG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029FB219E96
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 11:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733742157; cv=none; b=fXGpYxTvd3RTfYP2uIWvcTmHbi34ajoVI1czftApqI9DlwYuUby5giCEc4YYCzOE3JI2XDR+EUeBSCAw/eQ40yj2EEjJAFzt42+TukRe3kKtoRNUeaVwOrbBteUdq+KeVXCwgYiixx8CoE4+MfKCtLYnWDTHh86uVmP/Ck4TGGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733742157; c=relaxed/simple;
	bh=PuDf73tdKDHbHnwQKtTDXx3s1+y6oHS3JD5Fye3Pvgs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mI6WZrY8T9Ub3CzmoQwwc522aeHDb+HTkUD98qsgbfRqy6HgVowgbFOZWpRufGlU7W5eiy9TP1kceoFRGGUVKtYgVJxDhd0uQkXcenPjGB18BhinEsuzZD9whC6qJTURHOn3DWHOKkFwKaYViAvsb76Ydh53z54qU6KRmfN7DBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xz7XRAvG; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d3c1f68f1bso276835a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 03:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733742153; x=1734346953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9RqT1kv6j4/9BLcMgXCVstovd0I53X/UQb6AnamVm8=;
        b=xz7XRAvGA/5fvYRtXnorV1XnI5VZiEsx0E+Ks/hSZ1+QsJEPZ3vpu8YF1tjW6a/GrA
         wO8HfxCNXNE1te5WZ9v4LWMqJA3UDJgQCmkPEOOovB76XOozkgl4Z5EFh7ODS5UCvlAn
         ywC4cMr8iH9BzV47z12gz27KqcNNXqm7y9uazl0cP5ZApIulKw9Tvg+90O6rP+okByaD
         RQuDO507621UHakPe8I7WW2ov+md6cYYeMDS+vOZEz2gDaqJhQV8+V2ZpzHcMwyhvphx
         1DKDyShFnN8u50AreYeqOxo1VSeMRKNzazO58jzC/7OYyPaZMltcRz1aKFEfDmMTvPmF
         NYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733742153; x=1734346953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9RqT1kv6j4/9BLcMgXCVstovd0I53X/UQb6AnamVm8=;
        b=O4UQCkIRaSRzlKf7wMZURLS+OIqSgX6zCwlGkdf3DS9Sb9OEMlPcGeJGYacRj7VTIh
         jPFFzF3MMPGFIYb9C4JnPU4cYbN7s5h4q7J9yp8J8TglZAGSJETp0OaNmQlO5bg7GgXq
         VvBJjjtx+L2pBZH0JKyC1hldaaw7VeRtjCWIXoBIPZX/RBziMOXx+S1OeGgCLZXYi7Cc
         XKWzuOPJ2+FHcNmk2IECp5yZ0orUuEK/yaqH0nlWxzY09NPfiT9DPVoIHcPR1hAACG3A
         LppV84Nl2oDJU8srpUKom3+JPtEVWXIhNWzbjaDqzmesloYIjkkWVKe4Pr2bcUOpshaE
         s2YQ==
X-Gm-Message-State: AOJu0Yyp8h/Z2s0Q6O0iQHccjv64oqchfuZXqlMzmmWRiuq8uLDzGgqr
	8GSJaXYDEtzKnoQ6egUlRN5jrCY+GLCFNNs4K5RoJcz1G6xavX0VYuWSfRbI7Yc=
X-Gm-Gg: ASbGncvhnnF5vi09dhLe5HIxQYHW2Q2NgSShtU8M0Qo01sJChfcrVvuUDiJgqD/ono7
	DNOnRiFL6cAy8dWk5yCpi/XHEk4SvdfJtHhIiPwMpty4wV8OdRQfDbbhVDeregIf5LhfgytoeOa
	HmmcfnP6UQ1NsjCrWBMvo7YIvIeMDycN3zLU998qs9iavdyMuUC/3Gp/zpYmv6jhXGQcihYHXpW
	XaztdXw4bjs2kKnvNkptC8rpJpQOkiBskBfw3hw9FgYEveE1ukNWFWsXtkcAU+0CA==
X-Google-Smtp-Source: AGHT+IGVjfe6LbUwcIZPJI79Mm7GY/0ynVUSdji+K6kOobx+/TDNPg8/46CFtUJpnBRMDCCkpudU9w==
X-Received: by 2002:a05:6402:5106:b0:5cf:6635:858f with SMTP id 4fb4d7f45d1cf-5d3be6d6a3dmr4549624a12.3.1733742153340;
        Mon, 09 Dec 2024 03:02:33 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3dd4f641bsm3348818a12.51.2024.12.09.03.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 03:02:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Dec 2024 12:02:08 +0100
Subject: [PATCH v2 03/19] arm64: dts: qcom: sm8350: Fix MPSS memory length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-dts-qcom-cdsp-mpss-base-address-v2-3-d85a3bd5cced@linaro.org>
References: <20241209-dts-qcom-cdsp-mpss-base-address-v2-0-d85a3bd5cced@linaro.org>
In-Reply-To: <20241209-dts-qcom-cdsp-mpss-base-address-v2-0-d85a3bd5cced@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1271;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PuDf73tdKDHbHnwQKtTDXx3s1+y6oHS3JD5Fye3Pvgs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnVs4zx4Qf+rpIkNGcPUwo5cgEVuPjjzI+mbSx2
 2SoDseo/GmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ1bOMwAKCRDBN2bmhouD
 1xrHD/wMjG9aXTZHJMYSwawWIy96BMwUyjOBu2qm9ov4YvfD1wMk0Idmcn6hTRjGS0kpEAP74ua
 EQIBGXXria/KtrVQLOghr8dv/PiBq491MPv8XSmXcY5A6UyAManDl2Qk6nvDoIMh07iohp/zE44
 YRC3nOYZTtdSd0UqYqjzKxmTk4CicFXYNO+aVKUnHQYM7s/5PuwKJ/vg6lbxE/I9VmV5MM5OnLD
 uWas6ck6s+97dSnBRYyLn8WPFiuMLcxnKnGN9IrcwXUD+Gy9qbhd61nDPlcMTS6LqZW+eOV6Oes
 FBVvDxRC7oltG5dGKWETxrHWkzb2+cbclPMopz8GY2Sfco9cXtaLz9sdOBqh/AYEvhGs/qb6nUi
 dlhVec3qE7l6sbvHHzmJU3/K4LfkDW+55pxmStQkuN5fb/IcUk4bf0FEtr/83I7ng9cUFYv+v5I
 CADaC+8AScZqbMCVeUO9rL12/OIs4elSUJe7vxN0DUGMWUY/xo5RnjXQNtkhBImNAU+kV7MAAEw
 eS7rS6INojjR3lt17m6/lr4YFURtfxXbaZLtlCVgLXr7BZCQatxkexcqlZiRlWkGCLUNE+2Gkev
 skO/GYHl1MIU/hpPhitBK33OEbr7y+JAMYJJao/MRZKtdpqjf1Qg0QkmAAlMXZe/z994afnhNne
 ksS3Uqzk9lj9OJw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The address space in MPSS/Modem PAS (Peripheral Authentication Service)
remoteproc node should point to the QDSP PUB address space
(QDSP6...SS_PUB) which has a length of 0x10000.  Value of 0x4040 was
copied from older DTS, but it grew since then.

This should have no functional impact on Linux users, because PAS loader
does not use this address space at all.

Fixes: 177fcf0aeda2 ("arm64: dts: qcom: sm8350: Add remoteprocs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 2a62405c0c9eff959abc4cee57753a8b1545c9bf..7d77dc528eb734a86be5f194b120b6d926f150c6 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2214,7 +2214,7 @@ lpass_ag_noc: interconnect@3c40000 {
 
 		mpss: remoteproc@4080000 {
 			compatible = "qcom,sm8350-mpss-pas";
-			reg = <0x0 0x04080000 0x0 0x4040>;
+			reg = <0x0 0x04080000 0x0 0x10000>;
 
 			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_modem_in 0 IRQ_TYPE_EDGE_RISING>,

-- 
2.43.0


