Return-Path: <linux-arm-msm+bounces-19072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E85518B8E04
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 18:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32DE1B22EBC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 16:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A35E131BDE;
	Wed,  1 May 2024 16:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xQLaRh0R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B3D13174E
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 May 2024 16:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714580392; cv=none; b=iugu5RK2qPA39jkTpSWw2xywrm0L2ZIl0C75HnVklFuwhgWjtG/SEiyUqQjWMBuCtOr5WTFynCP4zuE2mr2wWsXH4IqUaO/oNl1Tw91JIKfjyY8OJaGWAVMS9U0jRO2x37eJ7Dkr0o1AynwHjF8aqSy8JZ6UpzUcAiXU1GXgkko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714580392; c=relaxed/simple;
	bh=0+KzZGJu1d5OGxNXPG6e3n4G8A0DMlgKu2iIRaXSmrw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m/LEJQNQoEbiy0QnbcrkNUtMIG80rCRWHx5UchRhvJeGchXPW/IVt7USPyoglBD92FrKGGRu1v/G22mYOx2HqkYpAPYZGfMlDPF/+u15dUvPVBE0niTj8l22uvTM/ortn8jRiRPtUkgR8XA2YRquazuLt/svwwblDZx3TiCraOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xQLaRh0R; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51967f75763so8128921e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 May 2024 09:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714580390; x=1715185190; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdE0TiTMN/48xeZ+pHH+oPuFReIZ69nKUJdRgCnFUAI=;
        b=xQLaRh0RJcA7LYAZy58T/EF0aV+2nZkPHo29GYBoSGWLo6MqRw3UOqny+LfmDdB8AW
         +a/YPqDjERe0MmXwIPGI9eRHApYwK5YD6WLRphh5e0GEyStNmDT+DV1KRQIjahJW4Z1Y
         3Ews0QtPAvt1cOaE+UrNujiCMvsIgWMpnAqu1CXf7HVHAWRBLDnZlj4vUxrCqtZ/P97Y
         GJVffVp5chvW+Rfh+C3bUjWr4R0F4tnngaBtS7W9U0sWtcHeVJJmKtRaJ/lDluUN/UdZ
         vVInYCEhcPSmUjc167axIdCGMEtdVHnAh2BFWdiNMIP3uFI0oqOrDTwtgmt2geT59vGe
         WAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714580390; x=1715185190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SdE0TiTMN/48xeZ+pHH+oPuFReIZ69nKUJdRgCnFUAI=;
        b=RSOq/d1nqOyumV7q/q4Leth+chOxBIx8FiGdRPuqw6mzXH6Du3JKsA982jKQt761FP
         sDxI9MzWlp8EC2vkc8evjxwMLHu+AEl5R16/XkeEPOTZ2Ln2/79a7C8zhsGWyapvOcr3
         aRGhT+Dnxc+GkSOYPnJ8rXe487CyWYQuAmMiYZuwkW248gjihNHAa0uD374kmjwt+umo
         ClanHXwQb0pJCTVpArZH/M/U3FWr76TaLu8injfERVx0i/XrpYyHJ8EQ+/qmiOr6M5VE
         GDYmOa4Ewjy4pw7CECSpdQHBe1N/hMWOLFJplW4M6caDYXNT7Wtm+YMxakXhtUaXsnx+
         2y7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVuKmQidNgVlmKMU/IqfRwXqKpSWQ+DP2mQWwBQal9OVkKs8uMMwkwwxZqifxdSPOxTv0EU9Hbe+2SXh39rKgr0rBavX0cMpV4HiQrSNA==
X-Gm-Message-State: AOJu0YwM/fdOoXicK7E9AuqoYeBUR5aEoiG85qA3iRF79qXA5CKufBED
	b2d/UMjNwAoNPq15RvFXssK3rT6FlDAsMYdhqAyJWJxAdevpbD+0Vrgqo2fcnaI=
X-Google-Smtp-Source: AGHT+IEzH1r+KAKKI0+V0TSv0eZBFtF+pUKpqOpQ2nnjVvVXz1kUbLHYfMDVODAGrvd6no8Kxp4S4Q==
X-Received: by 2002:a05:6512:717:b0:51c:1fb4:2327 with SMTP id b23-20020a056512071700b0051c1fb42327mr1723969lfs.24.1714580389720;
        Wed, 01 May 2024 09:19:49 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d30-20020a0565123d1e00b00516d0029383sm4909306lfv.28.2024.05.01.09.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 09:19:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 01 May 2024 19:19:34 +0300
Subject: [PATCH 08/13] arm64: dts: qcom: sm6350: add power-domain to UFS
 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240501-qcom-phy-fixes-v1-8-f1fd15c33fb3@linaro.org>
References: <20240501-qcom-phy-fixes-v1-0-f1fd15c33fb3@linaro.org>
In-Reply-To: <20240501-qcom-phy-fixes-v1-0-f1fd15c33fb3@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 David Wronek <davidwronek@gmail.com>, Andy Gross <andy.gross@linaro.org>, 
 Evan Green <evgreen@chromium.org>, Douglas Anderson <dianders@chromium.org>, 
 Iskren Chernev <me@iskren.info>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=767;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0+KzZGJu1d5OGxNXPG6e3n4G8A0DMlgKu2iIRaXSmrw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmMmuZG9KMaWwMEuMGJ6kOQpZ9m+V4z8y3kNlwO
 mGlES+81UKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZjJrmQAKCRCLPIo+Aiko
 1c+zB/40c/bo//8AFR25A6n7dxcgpQLMeBuOuILTaGaPo7ScL2YXqhYwmyqoNCs1rq4Nrk4dW/z
 OhFRMF2bv5IWrbF536sObeUhNiot4h7LzixMbpsg1+bsd1qWs4VP6RfMoT/ov6T4EMS0r7gBKpu
 VmwZncz3OagI0BbtBgOGsRalVmVafEAHUNbgWMN9H9Stq9mUOJpQQftFZr09JRtOs9aV3u2iU01
 U3Grhdtw6P/ULCrdlcIRvGJlKK0+1d7uIlR8RmcRAuNMxhkCl++OdtT0tK7LbrRgamVCD12YwTN
 Stbr+SbA+u3OE0Wy0gBFYWjHRZiG5Ul91RZOwgVjpq1rb2R5
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The UFS PHY is powered on via the UFS_PHY_GDSC power domain. Add
corresponding power-domain the the PHY node.

Fixes: 5a814af5fc22 ("arm64: dts: qcom: sm6350: Add UFS nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 84ff20a96c83..acf0b0f73af9 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1197,6 +1197,8 @@ ufs_mem_phy: phy@1d87000 {
 				      "ref_aux",
 				      "qref";
 
+			power-domains = <&gcc UFS_PHY_GDSC>;
+
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
 

-- 
2.39.2


