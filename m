Return-Path: <linux-arm-msm+bounces-18792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B80178B58EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 14:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 457711F250A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 12:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A661B7CF2B;
	Mon, 29 Apr 2024 12:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bt1rJ1A3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63727A15C
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 12:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714394637; cv=none; b=RgCWHB0Ok4ivBRHFfaELJ3xCxbu3wBVR7DhqtFowBDU3Jb6JGJqAMVI3ziY8ZwQUqboRTPoxQVtwgTZ/VdEN6ayFgZMjdefbFw6WDfEGc/xbc8aexnBfhVQZ04lAJJ+G7JcKqXXZi+0Pigu2D4oZ30ARbivMl9oXR368I4Qav5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714394637; c=relaxed/simple;
	bh=il5vunYSrfVqpfM431mg6nLZaZ2x9lAoqs3lcglIC74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TWFJmzKjkQD/iDU1LF3wTpB4jFwgBh1Yyi8n1/oyxmUXyEYcCN376a+X5V2oAIwl8aPR9M0XoD8+eXP0U3ijMCJn/Z8z5UXFb+aIwydAwwEng+TkdFC3EgK/F3sxIR7ISsJTTiPZbvw8SHhD9G2ikvktKC/+dzB24seL5nq3bM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bt1rJ1A3; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51ac5923ef6so3939168e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 05:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714394634; x=1714999434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmNDHnUFEW30Sp7PavPEqyUvJ/mANSFLXHcjWoqAqXg=;
        b=bt1rJ1A3SL4liGPlc3cOtgdg8COLMWRZpYhrqWzueU5IVmQF7SKhURRJ8r6b5QCRQN
         G1I1PHraxKdVp6FXv8EIPPTTb3UxrgtJnpQYdj3ZlwGG9URh8QvuKNjstnAs6bQQC62+
         cwZde35y/fHHQcs/059hdmAGF1eCNReQ28jRMuXz97NcVDaxVXSxuk0MJ71Cplj7kaja
         OhWkGisPERcU+TMxYKiW8QGl9dEqyLh4JefwVQR1+i+fQHF1tcF458uhetW1rh9SEz0W
         vl6VHajTwRCnQ7+OEpwpWLW4ByI3nDd8DwYKTR2raUMrKE+EB8Ace0Rt9sX48hPw8EMe
         l6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714394634; x=1714999434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmNDHnUFEW30Sp7PavPEqyUvJ/mANSFLXHcjWoqAqXg=;
        b=sTb9Bq3FhWUtBTD/AtsHxO4Al6aSCJLK69tvE4wKoymA1rcX56a7/tKGeu1PRY0/tk
         0d4n3YgkRG/h6JwEsOFaIDBVgnLp+mg6RCrojc8FX9oktkC0wkMkpn8UCBrjZZqpI/BB
         3Hfi2IPG5hcHdS3RPc7jd8jmEOFjYCvfrkO63HesQpzPgtaHerm5cEMJ1w0OGnR863bD
         xM4bi0m2FUOS05s9wXer5NqV6OXFSWucZ3kGpcaQ7vhaa7nOKOBOSOi2TeTctFkjXOLM
         gCINAMbmtxopnhLnGT1osEjMTbaNI3IVsAgLWEgS9ejjDFn8LLw/Rstv0zbCNTZ3tD9G
         og9Q==
X-Gm-Message-State: AOJu0YwtFyub/rDF4XXtGf2dtagichhGtiy9uHQl6AF5NPAVTRHP581Z
	t6Vgph++tqY+4iI/nClCVe1nZH5h2SvYZRR3ujqiPXh31GG7fbrqcwnjIMr0CIs=
X-Google-Smtp-Source: AGHT+IE5ZGSUe9qERTPZ7RrhWZtLmbHwAvKUuqU3gkuJWDsJnsPoZZMhc7agdDnbWvXel8SUxp+xIw==
X-Received: by 2002:ac2:42ce:0:b0:518:f4e9:201c with SMTP id n14-20020ac242ce000000b00518f4e9201cmr1918457lfl.16.1714394634046;
        Mon, 29 Apr 2024 05:43:54 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h18-20020a0565123c9200b0051d94297380sm467538lfv.241.2024.04.29.05.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 05:43:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Apr 2024 15:43:47 +0300
Subject: [PATCH 10/12] arm64: dts: qcom: sm8650-mtp: connect USB-C SS port
 to QMP PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-usb-link-dtsi-v1-10-87c341b55cdf@linaro.org>
References: <20240429-usb-link-dtsi-v1-0-87c341b55cdf@linaro.org>
In-Reply-To: <20240429-usb-link-dtsi-v1-0-87c341b55cdf@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1246;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=il5vunYSrfVqpfM431mg6nLZaZ2x9lAoqs3lcglIC74=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmL5X+CLTXxFzwPPjv5JStujURmepqH7FoamzNM
 pYCKW6nSRSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZi+V/gAKCRCLPIo+Aiko
 1fF0B/433m89T8i1llMfmuSOBt5xduI1UZEvjDYdAyPGkt5UqSdlJ7cXpXLRjRShuKevJ0Ccg62
 EJVs8agEDWskn2AvDEZ8mJKNps3zGF4S5aaELzs2zAT+s6vCGHasKNsFvqWgs6vW5UgL1BHkTr7
 tV2HCjdxD754JA6C9HfkGTwj+S8Yk33mGdR/ewGLS31SIN61P5L+xwz/eZQLamRwO35Gd9cWrvQ
 UFEWhxFqGODJbkqnTl8cq4I026Rd6pPfnmgaZ3+kNydKNweMUbXp2UoNSFB5Jam1fnooPmvT9IU
 8QUbVRISGXEHrz3Yf+INTi9op17y/CMkS+NjwZNWqpgg94tx
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The lanes from the USB-C SS port are connected to the combo USB+DP QMP
PHY rather than the SS port of the USB controller. Move the connection
endpoint to the QMP PHY out port.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index d04ceaa73c2b..819f6eadba07 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -59,7 +59,7 @@ port@1 {
 					reg = <1>;
 
 					pmic_glink_ss_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_ss>;
+						remote-endpoint = <&usb_dp_qmpphy_out>;
 					};
 				};
 			};
@@ -853,10 +853,6 @@ &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
-&usb_1_dwc3_ss {
-	remote-endpoint = <&pmic_glink_ss_in>;
-};
-
 &usb_1_hsphy {
 	vdd-supply = <&vreg_l1i_0p88>;
 	vdda12-supply = <&vreg_l3i_1p2>;
@@ -873,6 +869,10 @@ &usb_dp_qmpphy {
 	status = "okay";
 };
 
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
 &xo_board {
 	clock-frequency = <76800000>;
 };

-- 
2.39.2


