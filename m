Return-Path: <linux-arm-msm+bounces-18789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 835A88B58E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 14:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38F8D2873EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 12:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B08BF44377;
	Mon, 29 Apr 2024 12:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vam+CK/S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17FF7350E
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 12:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714394633; cv=none; b=ECD0fPhnuLSHqHQ2wRR6tF0nO6Emgvt+wiIOQzyLoclhNT/d6mi5y1kQFxjLgxTuhfOGdyk5XvS0b0yzLHOkC45U1p3+Z2NtCS+qiovmcaYQO/vY6kT20j6BTk1O4q+O3TBcLGLdQpQoy2gzO/r1YeZPpHldC6k1juT/tnznKGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714394633; c=relaxed/simple;
	bh=VaKZ66FGWwoQy5me5qchzFwSeHkkEPWbc66wOo3Oj3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YcxWyNBJkvJcadrBUQlJb19gTfOaMMSWAymmGCgUPAnai+Ib42ibgfX/8O3mC9f8j7SzpEDU+I2Pk1LvIn6joAVEQFdbHKYHJxaT4JpZixTwqb8dVP3e3HCQzokZ24Cd3zgy6FTTMs5kd0ECv4fpdeobfurSSf4TfkQjt6rX7Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vam+CK/S; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-516d2b9cd69so5207116e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 05:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714394630; x=1714999430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zKB+Sic8syn3+o0jtrrv0P7ILrPMpb5h/T3oEmMkcuo=;
        b=Vam+CK/STgm21CC5Y5logqy4B0XEW/tKoRn7Tcr3E3SoPU06lkWd5rq0GC+Oqbkx8K
         bv1CW+lzNpHRB+C+9ZwnmyqBjvSnSY6CSpE0QfBFZ/5u7ejjJavFN42TmHlpKGqyPRqr
         886rWE9uLLyr0jKa/iC0KPzHDl8lIDAFfgOfxoUjCmYbbv3b8dk1p1KCX5Q/w7I+Je8w
         W1o6wknWSx2cIgpSispNI/pX/IxeO+kw1SWnHv4uqLyNGgcnUAUeR4rr7rlhb4zJwc+F
         OXlOlE28cosWcRWUUZ6vGxq0OlLQqmfbEyi4KlUwhJBnLJkEbNZblASwKPZwjdflLWWe
         nd+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714394630; x=1714999430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zKB+Sic8syn3+o0jtrrv0P7ILrPMpb5h/T3oEmMkcuo=;
        b=eUFwLaeVbx4DWeHlaEL+yxGUkfgneRSxGudMtTgXKI3yowV8jZ+FCEFVr/sptERC6T
         bmxYBhIg8wt4JSiRtC25cfHmeKvtAASrI6aCDubD4/LJIxLDhFeF7o1Azw8vFXUrG0jt
         s88CMQ2rWXhvqyYY6jUKmPIevt3TOHPlr2ie4BHjJEzMOjxg0dxTD1Ka6zMafUxB7g2h
         CwmLxT1bltutPJrPsTVetKURaWOWhKOWFm4lA5NrFR0UCeT6ykhSs8/qKjVLZnrc2Ink
         7qeszjEBLYoFjtcKDfJwsPAYidW6G3Tqs0UMhfhUyVXw0Jks+8w0dbEab1IqOROLBiOb
         ogMQ==
X-Gm-Message-State: AOJu0YwOdHFtD4kfUIUDB1nML8T5kdGRhiunuM/VWYuTuf9LATZJZ5ML
	yKPisdkYSPfW9ifaoMg6wKCPR7FavV7bblMLVw9C0mZyuCAQKSCLUy+HWf9U3/8=
X-Google-Smtp-Source: AGHT+IEqbYs5fTpD5xtsPvfVABBMdcLK3Bo/n9Z/EIQdUx7e1HHaKKZtQ4KBjmsztN5x0DBz5fC60w==
X-Received: by 2002:a05:6512:3991:b0:51e:1bed:13a8 with SMTP id j17-20020a056512399100b0051e1bed13a8mr269088lfu.29.1714394630402;
        Mon, 29 Apr 2024 05:43:50 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h18-20020a0565123c9200b0051d94297380sm467538lfv.241.2024.04.29.05.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 05:43:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Apr 2024 15:43:44 +0300
Subject: [PATCH 07/12] arm64: dts: qcom: sm8450: move PHY's
 orientation-switch to SoC dtsi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-usb-link-dtsi-v1-7-87c341b55cdf@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1206;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=VaKZ66FGWwoQy5me5qchzFwSeHkkEPWbc66wOo3Oj3o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmL5X+TKHOdrRtR+dO0bJrcvCX7TBwc/ICKi+CX
 HGu1rfpj9mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZi+V/gAKCRCLPIo+Aiko
 1bSMB/439o1/JP3m+BS+BjFJBvDpiipkcmNarD+dyeYzpRRHd8PgTSsx4pr5dASI9YTBPxy6bVw
 yIqDffO8uI9IApPE0DhcRgugSXSZgsbmotwbSaE+288EjyAOl+Yz/+lBuWumMczq4J4HzoPuXoh
 R9LzzQB9B/rMsC9Zh7Phwd90oJIy2TbV7oG8a77Cqda9uLPXvKCGOBMv2fjSuXF3yiG7vv1iQ1M
 U9Ull470QADuun0mP6UpWbUNouNRh9BdX/xkOIffsC42GgIFoRQ2FuzT8qqrrdd16NouIEOzjzC
 9SH+cssa6lHnpi3v7mSZtrBpwbHig4J3zyd7xMATMxNq0sYB
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The orientation-switch of the USB+DP QMP PHY is not a property of the
board, it is a design property of the QMP PHY itself. Move the property
from board DTS to SoC DTSI.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 2 --
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 9926294e4f84..71dc06db7736 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -1120,8 +1120,6 @@ &usb_1_qmpphy {
 
 	vdda-phy-supply = <&vreg_l6b_1p2>;
 	vdda-pll-supply = <&vreg_l1b_0p91>;
-
-	orientation-switch;
 };
 
 &usb_1_qmpphy_out {
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index d138b90bb280..3494d5076368 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2304,6 +2304,8 @@ usb_1_qmpphy: phy@88e8000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
+			orientation-switch;
+
 			status = "disabled";
 
 			ports {

-- 
2.39.2


