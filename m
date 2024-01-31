Return-Path: <linux-arm-msm+bounces-9170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5642843733
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 08:09:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61A541F27085
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 07:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD7454BD3;
	Wed, 31 Jan 2024 07:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IbAFxe4g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722EF5A0FA
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 07:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706684920; cv=none; b=VozjhkCmzMCg+H1Wy4amXzxgLZCXl/hq5elB3H1x2WnZ2KyeSlW0zLAzx1EeR1zLS26jGw0ZRPkk6+2QvrM7yigwOnWZa7jYT8XAKNmLhPWEuZ/iN2YstS97WHOmNdvqhl7o+nt3d3B6uVGx82N9vVzfif3AUd2eVSWQdIMu4bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706684920; c=relaxed/simple;
	bh=e7nJmTvx/9CHmZViBGU+Oy61iNya1IQ/hQ7GwRFLJgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d4AeWk8oicV1S7r3jJQH8vlJ7KcEao+m7SN1kXRdCNLs1z0T7Rhq1pWJa6qx2zfYil9ZvnrGHFO+h0Bd9JWy4VTpsPHK0ekWkRDHtaVYgHJv62UI+aXX2LlPOAjsA0hJX8vnNskSSK7rVstAiTg9ufyEmGCfp3B3CPModjvG9s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IbAFxe4g; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3bd884146e9so4147379b6e.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 23:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706684917; x=1707289717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8indJKUI8pGQPbvIeJ9tzfW5gFCDfCoIo/mhOUWR34=;
        b=IbAFxe4ga/XVyr2CHHCceL3wdIzPw1nElmh+6mG0C5LIdHjPQcLW6OWAuJr5SmhGVZ
         94+YzihrQ2hziRpzaGD2z+VNDWespUiBSed8vleN2khvDvGW0CCjn4xkFgz6MQe5yxCv
         sWg5Q1ygVVtWwoJY7OuIw7G/JuEXACPikyWQf0Dv+efGIB+u87KjHZiN+agPm0te2LVB
         /ZBatF9Sba+xCQ2fPnwcdv6dAvam6tKRvsYxdS46wWjvqQOeglOIyvxULVlkBpSOxTvu
         QB0FFdN1GdlsspyS90PasEkorkooBtw4D/1F0RUYy0jmGG8s4+REEU58WmiH8Xfk06yT
         QP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706684917; x=1707289717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8indJKUI8pGQPbvIeJ9tzfW5gFCDfCoIo/mhOUWR34=;
        b=lo12+XvLlxyy+qHt0/amS+1UqIBbrWTEIyNtFztcEo9AAIcAj3HJBEOWEwT5yb3nhZ
         drBFBSxKC/kvecKHNnFJpMchgUQ5BerTkTx9qvSoiW2VupR6SdlOlOc+nopYtHQ2Ukfa
         fya3Ys0O9POxLsNuGdcscKjkgEALdWjj5dRTqPOzEl4GwxgQjirggBuAM1Oms/A2/474
         X1SCKm8OV2TQBp5X/qjZ4jGVZ+yWHOEcmnsfqb+qrM1gxBKBqhC5tiL9UO5BTvRDSI0u
         nCuwgJpcOoTcwFpJcqNebDLuxf2ZOghM63QNGo7DZLQxwWj8Jv7VYBABijFH9v0QA9XW
         uEOg==
X-Gm-Message-State: AOJu0YyNwzv/OyLEwoUNVVody1qaY8RLoE62xUeVVPk+tHeUN3c2zLHW
	chUJI6H4e6dQzpEwavfebYvv5Lqs5OegfJTk/rYzI5R/j8mEng7Z9k0hyMcfjA==
X-Google-Smtp-Source: AGHT+IGcth/fxCroCHkJkiBlCEEVz9j1ekHj56akkeS7TqDFY6QyojDtaRnH7UXtZIDJHJ4Kzm5K3A==
X-Received: by 2002:a05:6808:1401:b0:3be:6cf:c321 with SMTP id w1-20020a056808140100b003be06cfc321mr1072595oiv.36.1706684917547;
        Tue, 30 Jan 2024 23:08:37 -0800 (PST)
Received: from [127.0.1.1] ([103.28.246.26])
        by smtp.gmail.com with ESMTPSA id lp17-20020a056a003d5100b006ddd182bf1csm9087956pfb.46.2024.01.30.23.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 23:08:37 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 31 Jan 2024 12:37:29 +0530
Subject: [PATCH v3 06/17] arm64: dts: qcom: msm8998: Fix UFS PHY clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240131-ufs-phy-clock-v3-6-58a49d2f4605@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1212;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=e7nJmTvx/9CHmZViBGU+Oy61iNya1IQ/hQ7GwRFLJgk=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBlufG8cDqh3gn5ouf8J0xFBIJgGqGxYPII45jdo
 JjvtJ+nuL6JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZbnxvAAKCRBVnxHm/pHO
 9QNTB/wIL75aClSvj1fZKDiN/MxxFSiGp6t815HxU2g74mUwq+NJlVYxL1X9p5Jz3KBnn1sPj3D
 iPeNvxLoVk8K2Obm8qRUEunKa55/wrCjlk8DgbcOOB3osPC5ZnQMqb4tQd8s7pIsxZs4Gdhj57R
 Hajw+9u25ynORWBIMybM3FwCL+hY7XdyeUzNu4EEFBMobrBFqWvbHz/voEytIoWxMu+9HX3eP/z
 l/uUueyBeyCgPY+Rf5bT4Kgk3uizpHsEo6mIWcC5cGM0Euv94ybpZh9zkh5qlWncqOaKmzuQ6Yd
 X15tBflDWATttpEYXLwU2RBTSnBOT70GwEzLz1uwwzUv8wSf
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

QMP PHY used in MSM8998 requires 3 clocks:

* ref - 19.2MHz reference clock from RPM
* ref_aux - Auxiliary reference clock from GCC
* qref - QREF clock from GCC

Fixes: cd3dbe2a4e6c ("arm64: dts: qcom: msm8998: Add UFS nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 348eee866451..a4716b1c50e6 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1047,12 +1047,12 @@ ufsphy: phy@1da7000 {
 			compatible = "qcom,msm8998-qmp-ufs-phy";
 			reg = <0x01da7000 0x1000>;
 
-			clock-names =
-				"ref",
-				"ref_aux";
-			clocks =
-				<&gcc GCC_UFS_CLKREF_CLK>,
-				<&gcc GCC_UFS_PHY_AUX_CLK>;
+			clocks = <&rpmcc RPM_SMD_LN_BB_CLK1>,
+				 <&gcc GCC_UFS_PHY_AUX_CLK>,
+				 <&gcc GCC_UFS_CLKREF_CLK>;
+			clock-names = "ref",
+				      "ref_aux",
+				      "qref";
 
 			reset-names = "ufsphy";
 			resets = <&ufshc 0>;

-- 
2.25.1


