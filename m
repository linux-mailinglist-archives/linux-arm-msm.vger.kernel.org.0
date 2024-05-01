Return-Path: <linux-arm-msm+bounces-19073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0498B8E07
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 18:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8059B231A0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 16:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A53131E43;
	Wed,  1 May 2024 16:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DF2gAxuD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D43F131BAD
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 May 2024 16:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714580393; cv=none; b=i465kc5NBeGfcD1IjqgbCFICM1/DAeV9U7K+RG2Flna5kc7ehDKwE6e/eXfEUyc1v3wMwcnMLy7I2VXzflOokSOebUa0cryUpVx0N2sJCP3USCpNGiz67VWU1bu4eiMmZQXW8AtC0u4a+HR6N3e3QmcNQtHyeFIv+yH41KT2xHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714580393; c=relaxed/simple;
	bh=v75KRPGJTvZofiWFQUifaPBPxJ84dw2ZsWnNnHjcb2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KdlfMZjCWVG4GMO56PsLeooLCgepMna44dxlCjLFZUPglzv0/zI16VzyoSJC1W5+GfhleRSFjqccryTBmUFjWYLhh3ez+Ng1lpwJLeYV+rnnb0cCYAqUmeCt6XVx/UHPzkSoHtvmjJciOPMGtu8Aql+yX10Y7ZqDf0mWvQNOrxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DF2gAxuD; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-516d3a470d5so8753314e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 May 2024 09:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714580390; x=1715185190; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j0hw3jt/ESZ12mRMzPe0JCXtbJkvAHqnRe43cp2kTY0=;
        b=DF2gAxuDqwNr/IHYFMGxLEdCbCsXwfID6Wt+i1n//QMEOK+v/pKg2hEkUxwiaRDmkh
         i7jMeXVKQCYp4GtDfkx5O+VwWU0VDA+hIdpEpAsTZPz9e9d7eCdNku2bepbHWnpCJNpZ
         hj9Y6cYczL0D7gmER9ho3CxgdvCZ5ss8PeodGYUI0i9nkrlStEgX2TV6IMfk4gsYRvFG
         T4K+GDlBoA/xnH4wz9YQCAWPChFsR0YCrwGQkX2GFopWojVygQehWL82EftQLfypOGnw
         0tFYk9zQEzzokApoP0kXfS8JM9OvfcYv8Cf4Da909lIuxThR2pUfvbM19St7+QqGwiNW
         tTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714580390; x=1715185190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0hw3jt/ESZ12mRMzPe0JCXtbJkvAHqnRe43cp2kTY0=;
        b=XST5cjcb6fImz7rxKg+HH9u9dlMEV6DEbLWBnHIXODnyf/s+53DY38KnAGibOBDvAd
         dy+BrlGO1S0AvIOAaq77AgDhnb9i1OMV0Vy2/RO8ZvkkJfMWjPBHRH8AUPS30swSjlAW
         uhmBfExGvp6dYNQAgm7dlBOvibrGg59g0kn0uBzIKLBSd3Mr6k5OeLuWfVuHJCzqXHx6
         9aphzB3B3LN40O2zL4CwFd7HotscxH06udlnyFdcl4F2ldqacDIsL3khXFoTo3PFpiLo
         yNh86VMVzsCN3on2Rpe0fkaM8O3YpYpmtKwUSrK9VT8v/VhHgkt8RCXuB1KC7p9T88d/
         MLCA==
X-Forwarded-Encrypted: i=1; AJvYcCV2FZfGbbqRv0oKejdLKA/0ZgBxttrA+xGYRHccYCz49tpWQ94+B3YUU9g58Qqi7eFVvGqCd/dbswu8SociGf3eqPPFKJ6ZC82PvGSWMw==
X-Gm-Message-State: AOJu0Yxeu5dAEbfkXx32/g4vntXaKSwelfwJg0EAt98mRf58ZtR+REzI
	deIsQb1ulHDf14rU9WFTeQl4vZOiUUzVB0iYcTqBzCSvNVa2ME4xbIeQn6x2aYM=
X-Google-Smtp-Source: AGHT+IHbn0ATZmCrTkG805J1yCfXno0/oCz4XkCrrJFKmR+qZAY7zCpYwUM8J23sHr1uKxIPRHhlkQ==
X-Received: by 2002:a05:6512:3048:b0:51d:5de5:8189 with SMTP id b8-20020a056512304800b0051d5de58189mr2893596lfb.30.1714580390657;
        Wed, 01 May 2024 09:19:50 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d30-20020a0565123d1e00b00516d0029383sm4909306lfv.28.2024.05.01.09.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 09:19:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 01 May 2024 19:19:35 +0300
Subject: [PATCH 09/13] arm64: dts: qcom: sm8250: add power-domain to UFS
 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240501-qcom-phy-fixes-v1-9-f1fd15c33fb3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=786;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=v75KRPGJTvZofiWFQUifaPBPxJ84dw2ZsWnNnHjcb2k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmMmuZkLhep7ItNeEem0QksekwHSJWJPgoJNXPV
 gY4PL/YOl2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZjJrmQAKCRCLPIo+Aiko
 1T2mCACbrpJPNbomiyQ95LQspmXzNhzZ8TBqV4Tzi/wJ6dCaqK+3f/qUlriWRaf0NCvwetrkx1l
 J0hW7d62W87h6mQj0IHlfziTv3N9J8KGOz3fIveTQ+CkYZDsZFLyMMBgsb7VRSwKAIaN/Xd/S+R
 WqYaU3V9B+DfOHHzPpF1oeqHDBm8QIdLxx935DNpoTviKHlxUleygeYQxT/2eMuTyBHZnmlrefO
 lgOoIaOdk6thH6fNp3TGi17mjnuXcBYuQ+S76HYR63r/ONMuBBGyEObr4zXvNfkErNAijObnGD8
 PY9g+5CBsHogpb19+OqIRlwZbENg/sG4E/GjLa2TSR3tS3gL
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The UFS PHY is powered on via the UFS_PHY_GDSC power domain. Add
corresponding power-domain the the PHY node.

Fixes: b7e2fba06622 ("arm64: dts: qcom: sm8250: Add UFS controller and PHY")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index d6c8c6c2eced..425449ffac30 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2580,6 +2580,8 @@ ufs_mem_phy: phy@1d87000 {
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
 
+			power-domains = <&gcc UFS_PHY_GDSC>;
+
 			#phy-cells = <0>;
 
 			status = "disabled";

-- 
2.39.2


