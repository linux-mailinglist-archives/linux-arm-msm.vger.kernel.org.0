Return-Path: <linux-arm-msm+bounces-20831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A1C8D263F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 22:45:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82C4B290438
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 20:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A3A01802BE;
	Tue, 28 May 2024 20:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BDBkY5Fc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377B217DE24
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 20:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716929026; cv=none; b=LXxlmgI//wwishTQB805yZw8Sf/PZKyu4vKmIbRVlTWIYvy2oGmFzf10Anuw9CsC4nT5uLsFKMnDY9YhiLsWtcHfagh6hxtuvrNYKl9j//tRYyZ8G96Qk3yh0uuwxHS875E30uEbNjV1LjKgD399UB3z1ctffdMtNApq5DdCNmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716929026; c=relaxed/simple;
	bh=efm+IHUJ1gyGBEQDbtWwDLgNHtx+hRJSWzbFoBIcMe8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ruc0TzaSs/jynQ1gd5kSCZS4kBmMPmRVVBNxCrZWZqr31eBygcVM3bPr959y3WmmTmooEbal3x9VSfww0lwtjCfBsfrPvYspvpkpEcmd3x23+nT2qYnIdINdBgDf2Yxht8AYMs1pFidoEa8QmQW7fm+83Io8KeB22Oqlzo1JYQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BDBkY5Fc; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5295eb47b48so1669964e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 13:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716929021; x=1717533821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EmcXmv0vM7R1Q30++GJfNW0y7hLTKdDFrf+Tedwk3q8=;
        b=BDBkY5FcE6f5cxfSZYm2Tw12qdUSXyyhKRGPoZ1xgSeIUhGDdhFpRU7qcnY1kYrcHD
         SpQfeuU5iKp0to4ukVEBOnSC6zO1aApNk9iMlUAqjNMvzuewzUsTWuhflroS/ydhpbyY
         eve4fznNHDoK4m8cP8NMpT0DNhPbwE9QmnhW0RLjYd/CXEyCl8jyuIHCf3G+94+Cu9pu
         WZbRrSyUkxnOER+uK8dM9I+p48gb08O+PUAjbRETpKGBO/1g8rcLbI6RlUaPwrWw0Zxr
         61VzEA6uRpzM2N3u76zlxu1PFNkzGTvTeJHD06z1CZqjCfjrE269+zZy0AzZa2l69VyG
         GfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716929021; x=1717533821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmcXmv0vM7R1Q30++GJfNW0y7hLTKdDFrf+Tedwk3q8=;
        b=oakUDpWWc/Gx/KSEDUOd3MZB9DFVlBBceJD7z2TQ4/bqb8iW6vu7QCeGuS/ycakhUj
         wd0W32+J/i1hI2v2GNMpFWF6RsFQKN0t4rlw4XABpSUUTjk0JfOKG3MAs5dScoTQGeas
         SMgEOlcWzzPs2fRLB9dn4vyZy18vX4pciGSslgoebBlwW7aryESgBCZj9ANGLL3m1z6R
         AvuS1lvScMFXCYH9SdLLupIT9ISSl2a04753DhDXvb07oRa+QeGGZhAOBtqpRjfB+Cbs
         He48Xi4X3iSjc0F3nDQjzkOy2D53qN1dKChRHic/iYUSCS+jvw0I0FBFlri2w+CO9Ter
         GwYQ==
X-Gm-Message-State: AOJu0YwapiLLPQmEvNH+XSHdMizav2vDANyhJKjvW/KZ2/lMCiZhyYxU
	C8DL29FbZMwkR/hvqideLgPMlSD22z+hkUyyIhIxQX6ooGlhiPXN/CJufdlY04o=
X-Google-Smtp-Source: AGHT+IFNpzCTrqaTcYkcEY6nP/9aGb8McoGYnt4x25NGIDAOtDme4ULq8b1blATxcvIvX8L4x31fvw==
X-Received: by 2002:a19:9104:0:b0:51a:bebb:690c with SMTP id 2adb3069b0e04-529645e331fmr8152294e87.12.1716929021550;
        Tue, 28 May 2024 13:43:41 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5297066b885sm1095493e87.127.2024.05.28.13.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 13:43:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 May 2024 23:43:25 +0300
Subject: [PATCH 07/10] ARM: dts: qcom: msm8660: drop #power-domain-cells
 property of GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-qcom-gdscs-v1-7-03cf1b102a4f@linaro.org>
References: <20240528-qcom-gdscs-v1-0-03cf1b102a4f@linaro.org>
In-Reply-To: <20240528-qcom-gdscs-v1-0-03cf1b102a4f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=824;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=efm+IHUJ1gyGBEQDbtWwDLgNHtx+hRJSWzbFoBIcMe8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVkH1PiaA7rMYukGgZW/ppDwT/j0XCoKa/xJ7e
 ytJq3x1L7GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlZB9QAKCRCLPIo+Aiko
 1XHjCAClBiTfjCpf1OW82jhz6TmnZNpwcb83AFpnS4PlCGcjBbRosPVnb2roSsDDVPTVImuG5J1
 ZvsrptyUH14OWU0UgjvLWmfImws4YBEQe8TnIFHHtuD07g8qtACsTPzxGxIeV9ppmZLcH4TtiBm
 OFrq4YZGg+RDHRspPrVINi+5MxZm43CejKyAWzYnKhIxpEfdvwR5xxdsA1PRJJpaMUTJ1JlWaBh
 reLZDuX9Ln8Mkl4E5Pe4dBdM5qywjETymneM+8Hx5btVNc3h9jA6ZE/78OTPkZgmNKe6u4v+rBE
 n4a2EaSVeduvVX4N2x0OkcgIjkfCUzQsn3wvIJ4X+kpn3zKA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On MSM8660 the Global Clock Controller (GCC) doesn't provide power
domains. Drop the #power-domain-cells property from the controller
device node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8660.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
index 455ba4bf1bf4..a66c474cd1aa 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
@@ -113,7 +113,6 @@ tlmm: pinctrl@800000 {
 		gcc: clock-controller@900000 {
 			compatible = "qcom,gcc-msm8660";
 			#clock-cells = <1>;
-			#power-domain-cells = <1>;
 			#reset-cells = <1>;
 			reg = <0x900000 0x4000>;
 			clocks = <&pxo_board>, <&cxo_board>;

-- 
2.39.2


