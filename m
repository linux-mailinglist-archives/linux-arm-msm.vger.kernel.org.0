Return-Path: <linux-arm-msm+bounces-6216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B4D821752
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 06:22:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 153CE2822E5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 05:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875FE14F76;
	Tue,  2 Jan 2024 05:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lflsEZpT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682F0125CA
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jan 2024 05:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50e7dff3e9fso6182060e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jan 2024 21:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704172659; x=1704777459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VtkYGKI/Facsed70xRG043uUGhbAPCEinrMcrIy+Rs=;
        b=lflsEZpTx4eXjKjuYYV2FAEW2k2ViLx03kB7o1c6atF1Go4yOPqtFZT5X+T/dXMBPJ
         rHzqDBnrdOH/RjaGa8yoGIpPogAkY0a2aOExwQXJv8JUrtUDokQoibf7zRrwpuH4FvA3
         lU323B75AY5+Pz//fKVx76IItrolRH2g5ETcfRaLZknIRXSfSCMc3oSNWzmh3NQZ0LtT
         3r2S6d8KOYhTLcZ1YvO3YwxI5/KHEFiSgHOoASWNoXcBIqK+QJl/B5pafPA403gliyF8
         ISLCWalO2XqzjH3KAVRZWtIqFnFmvUPJmif39GJ4Kt5pqsMDIve2dShr1wR711gFSk9M
         5l4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704172659; x=1704777459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VtkYGKI/Facsed70xRG043uUGhbAPCEinrMcrIy+Rs=;
        b=bIkNGGU0Hmte0hKrMGhaaEDX5Z5E5XWF4Oeyi805DwOWYpkHlXGIYCBhmNgwRJlVXp
         YqyYs3dypOpOPRQJKiDE24HRoIl+rv+CTKQh2cz0ItymZprdzAJXqR9RL6c3dKau7VQc
         37MWuXMpXaThA+xORsKxX4Z8dmPhs8VyxXOLRPEdXhsr5hqgvnHWPbGDZQ6txRnTsl6h
         +dXlwiCsQiWeGWNAlwF0QI3JtOi5xPDZbgdZ6RAnw8mGK1bBxPWkdYGjzrlX7YHkjj3v
         lGab55F3+X3sq/7FGeeM9VJAjCH6C2KqA5TIm5UjmP2dWsiqIf8fI6YlDULx4NNE+6LI
         Vqag==
X-Gm-Message-State: AOJu0YzKMbRUael3RfBCduPTTvVlb8fjza0LG2iQwaxpMkc6gvVwMDtE
	S0Yc63lNyDBtUsBh18AsdH2/FSdMcNwAUlnw4uuDwEqHsSMi/w==
X-Google-Smtp-Source: AGHT+IHhy79j9J6JLyB7iCbrZV8yppuNAxbCOOv4VEht9ySX6gSVLd+4H918JbiXVANZrVXqNdRiUg==
X-Received: by 2002:a19:e043:0:b0:50e:3812:c075 with SMTP id g3-20020a19e043000000b0050e3812c075mr6917824lfj.117.1704172659436;
        Mon, 01 Jan 2024 21:17:39 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r25-20020ac252b9000000b0050e810689e5sm2081827lfm.33.2024.01.01.21.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 21:17:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Jan 2024 07:17:38 +0200
Subject: [PATCH v7 18/22] ARM: dts: qcom: msm8960: declare SAW2 regulators
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-saw2-spm-regulator-v7-18-0472ec237f49@linaro.org>
References: <20240102-saw2-spm-regulator-v7-0-0472ec237f49@linaro.org>
In-Reply-To: <20240102-saw2-spm-regulator-v7-0-0472ec237f49@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1323;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=xv2z1mRLciwpFcRbJRoxzOojlPfXpF0Q42hsn36SmXU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlk5xmoyNfziZAKt/pWZxSQU8cGTJKv+aT+OaC0
 CdICTZnPzKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZOcZgAKCRCLPIo+Aiko
 1cRUCACFC6N9EFQ7FYhRYtRRbIMtgsi1JK5KlJ/1rQdqkae16orOmJy9evmJAc91hSmBI2K+gYm
 +NgMUJdJ7xqboZbTaE+IGLr0YOPCwMFX9/rUDsVbZPb5vuPoeruMe8X0UTZ0UWq/NAy/CbF/JyR
 UsPOJ9nXRNA+1Z/RJkWJYalE0Qz7HgQ6Eh42jEM8YG5hgQbFUCP4gT7gwzhd5S04Elc+7aoOmgj
 ymF21jhbm6ZJ2X+uQMuBv/dssVbgZPxX33JkInNZf+vPAgsnDllQcmNhMTsiAyNiO03iup9OJWU
 HZz8/nL+33KLnckA1SjW5wC89au6bf1Q3iDKs7b+T5d3wbX5
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The SAW2 (SPM and AVS Wrapper) among other things is yet another way to
handle CPU-related PMIC regulators. Provide a way to control voltage of
these regulators.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 84c3d3ac63b9..e02e56a43fd5 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -223,13 +223,21 @@ acc1: clock-controller@2098000 {
 		saw0: power-manager@2089000 {
 			compatible = "qcom,msm8960-saw2-cpu", "qcom,saw2";
 			reg = <0x02089000 0x1000>, <0x02009000 0x1000>;
-			regulator;
+
+			saw0_vreg: regulator {
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1300000>;
+			};
 		};
 
 		saw1: power-manager@2099000 {
 			compatible = "qcom,msm8960-saw2-cpu", "qcom,saw2";
 			reg = <0x02099000 0x1000>, <0x02009000 0x1000>;
-			regulator;
+
+			saw1_vreg: regulator {
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1300000>;
+			};
 		};
 
 		gsbi5: gsbi@16400000 {

-- 
2.39.2


