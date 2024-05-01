Return-Path: <linux-arm-msm+bounces-19068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C858B8DF7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 18:20:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60C391F2237C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 16:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075D1130AEF;
	Wed,  1 May 2024 16:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IdfmugaW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BE9130A4D
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 May 2024 16:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714580387; cv=none; b=K2zpcRbPZsIOHpP8svs0dokS2c5SCYtoyD0B0uAHogA9ZmjLmD6CLfp8TKh7gB2wAhN9h6Sbewi0VM79j6zPDV4NH94Nc72KFKAzcjYLDWIjbY7HhRaEw7MmPDIVpM89xs1vtwLvys5DaOlVnQDt8Y3nfS1u6RFG/4k0qINjJXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714580387; c=relaxed/simple;
	bh=reMWTTafaerBcmGlLpLFc80Ucy1bb2eDytgF9WWMKMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=teNKHUNvP4aRKMTdgXBiLe0vBL9F7NzzBXwapEJOZ5N3ZcXrInrdi7vT9DXKwIE2Zk2ULFcXQIAQcivl8GUZdSnhJDMcXVaThWE1p/9s9OP/6fgjhjqIzQWTjPjfczLz+om+dU59ZOee06r9w5JrSbV+/K3JSJR2MbCu77Xed3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IdfmugaW; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51ef3c1595eso311465e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 May 2024 09:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714580384; x=1715185184; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IwZX91+fyu2v2To8YAuRlrp8mqx8VMi7WeEYZ8W2110=;
        b=IdfmugaWSeyXpO2StwaTnxwkaWa6JaXS97XeG6Qbg3RDtkbgft1cW02UXxljFDq2gS
         Qh3RZGBoMRyiKiWN8qmArqcs+tlpC+ZT0CesXVfCJCUiuNVBIsJf+16hIrBtAdWFq6AJ
         smZcF8YHO5JfDAl2zDiqbXG5H5fc6OdmHAG+aOA1mZDcm7g5S1A0yM2DuCjTKHfu2Tfn
         776KWErcHy2uhuZaQ8YWOMmGgPoCMmIREySKbI+5V/mgdv2jvtxwakjiZg6sOgw5mSYc
         rN7xIyYceZz4fOZ5zuDDKGtnmRkoXOEO6BPQZtyJZK4036Smlbb9AGCKtCvvN2NajV8e
         O7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714580384; x=1715185184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IwZX91+fyu2v2To8YAuRlrp8mqx8VMi7WeEYZ8W2110=;
        b=Pj8I2t7lIlaA70TSFecAo+zaGH6rAnCePXD++Koz2tGV8U1+/DF5Ank4fCUVoYwZsn
         J4HXRllJcTzvlWoLFSHWfF6Y2zdodPY5gURuQznTxezV4hksjm3yr09wCS8Ys0fYforf
         DUBQiKl/sqgQtDc13orIy4Fe09hD0DVXvN3aAwvcOUd+B8Hvi7TrDJdtVJPiW6BHzLm5
         1SZko+qm1tALIY4oYxTangNtLVElVi+GO8laFWJy4t0d045Ey71EfOh6z8GHU8waz27i
         WDQyatHnNtA3oznacvd+R5sCsAt5Rj/DWMnilwUvFPsAZCtR1Yqk9s+bvI1Ug3fR1s0B
         eWMA==
X-Forwarded-Encrypted: i=1; AJvYcCVP8LTcWV8+Ci7IDw6soWG2oPGyrYb/dy8a6xvk1mtoIRsXZyoC5eH4jYisNGtupQkEi6aDvGkiOjbcWu428+Ml8rQ/mgruwtvURfgHVw==
X-Gm-Message-State: AOJu0Yw+bYLn9UHHVickyLIMTkNzVHG7fJspzN5IoXImHLhe1AoZgMzR
	X4qEMyx2amEfkALPG2TYH13ye2+0CWDvGDvht/FR5FURsui2ng3CSrxqbiEWV4A=
X-Google-Smtp-Source: AGHT+IG20sfl5EC5LLMXV4kcmeBO9vuLq7BnZkB28yj2/hwiT0Ze317OhVo+dSt1B/qoF7/EUeM7XA==
X-Received: by 2002:a05:6512:20c9:b0:51a:c207:12b with SMTP id u9-20020a05651220c900b0051ac207012bmr1484187lfr.37.1714580384459;
        Wed, 01 May 2024 09:19:44 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d30-20020a0565123d1e00b00516d0029383sm4909306lfv.28.2024.05.01.09.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 09:19:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 01 May 2024 19:19:30 +0300
Subject: [PATCH 04/13] arm64: dts: qcom: sc7180: drop extra UFS PHY compat
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240501-qcom-phy-fixes-v1-4-f1fd15c33fb3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=921;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=reMWTTafaerBcmGlLpLFc80Ucy1bb2eDytgF9WWMKMs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmMmuYIw1k7/VIRimo91ElHCaDOpuIa1DpOZFh5
 D3ntjMul7CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZjJrmAAKCRCLPIo+Aiko
 1bdyB/sEzD7K/i29E4xVZevYaekOPnK7qu5JW5OuE58rlBhVIZh5KWgpVKh/D5gQTDhIJpEAPwJ
 YsAcrlxEZmMRAf37N6fxZXLt4ko3t+Bz+5g8AdjnTu35CZGn0C7MKf7kvwjCXdck7mVHdtcHjwl
 etrwmLHSZJ4fH71QJxL28NV525ecyKhdPDhEsobzRwFbbKWeC3K3gwuPb3omnkeNb8DonIkc6K9
 fl3DLEXEI6fbI/0DzrepZwefeoiXdF8EgI+BOvLIT17BS4Di9iub3h6U4WiSRKjl+EeKGs2XlNj
 ij+BpqdPkSwxVBUk/Kiuz7l77s/0pa038i0pakrJFhzq9ynU
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The DT schema doesn't have a fallback compatible for
qcom,sc7180-qmp-ufs-phy. Drop it from the dtsi too.

Fixes: 858536d9dc94 ("arm64: dts: qcom: sc7180: Add UFS nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 4774a859bd7e..52d074a4fbf3 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1582,8 +1582,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 		};
 
 		ufs_mem_phy: phy@1d87000 {
-			compatible = "qcom,sc7180-qmp-ufs-phy",
-				     "qcom,sm7150-qmp-ufs-phy";
+			compatible = "qcom,sc7180-qmp-ufs-phy";
 			reg = <0 0x01d87000 0 0x1000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,

-- 
2.39.2


