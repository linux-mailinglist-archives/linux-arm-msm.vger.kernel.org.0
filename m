Return-Path: <linux-arm-msm+bounces-56042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED2AAA04C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 09:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68C16483430
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 07:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601B1279347;
	Tue, 29 Apr 2025 07:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sEFom6vH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03062777E4
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 07:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745912586; cv=none; b=fzxypIAr7dHlWaY7gUxMkZ28z0nftUmXLUvtwmE2RrsosTbfCw6AIuSfhMgkdIL2VQ9hVoaVSxNetp2zI4CtfyaAihhVFK3ChFvob6oI6wZyU5mH1S+Dzg6eoXcC/1y03alcyyFCJrErKmw6dJu3YPkWrKw9Z0L1+1XhnatGY8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745912586; c=relaxed/simple;
	bh=dYvB61tFWaA6yh8/duxHkHb9Z9xmEpElUy7jETtqYYQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DII0e5eF+5j+O9w4tP4/2Oq3/VXMm9RDtl58V37ahqBZ9XkhC349GrBlsiDtBnUIWNyRcENi5GIahWu2wsAlEWR7cn3N7lHzpTe2/Ct5YStocWQhzIXklrEfBUkh1cOwXifrDkepm0AUzgLuJ8XeXM9xPwEpQQNTS+pbVhYoO5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sEFom6vH; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac29fd22163so824598266b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 00:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745912581; x=1746517381; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F+uTNBkxVqUzOlu1JM6vCecH5db95DiIuI060h8Clm0=;
        b=sEFom6vHqF6TpBxqXZ2vDfjMZG3Dt93eaHkldtOe0kwFJOTo73UUwWH8tpPVCHKzlL
         MI5KRUoyGiRdaa7R+PvjbVpY56WNFBDyL6zRd6vjxh+wJMFgRpi5RiHg5BCHENQiCevw
         tFByb0IvG7M4o74NpLKdZlR5gR2ecylE7i5HMbTENxAud8Uor8hbjVNIeNwnSTJQ5arw
         IJe9MHKXV1mpKkxFTFIa9OZ1F0KJBP8g6dxIaIYKeAzdJeuqC19umK4gM2/Ts1foQFy8
         2V56wNPpODUXk7A/FJLKdzQD7YFYaxBxibPO7HaLz13rvSp6wvcWeSA/MbxfXWph4RUJ
         E34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745912581; x=1746517381;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+uTNBkxVqUzOlu1JM6vCecH5db95DiIuI060h8Clm0=;
        b=uKlMKU3+F6Zx6/8rjFgwuWZf4sWYAdW/BelBQyhsATR5Ey7Pv7rc+w3+jReslIoh9C
         AJfd24/IbrnQEWMwJage7KhH4lrHWdCoCcid/4XPxpkl/vXFoSLi/B5y1mVZQfUzg73X
         xs1cW3dySkpt/4CqDYUsaobjs/3ww5drIunTWIZVqYjWGt1Onk+AZWzc0DF5m0ZieE4S
         Dx8Wb14/UjxnrIm7Qn4mJlAQJrLN4v95kGG267sOC43lK55tbBEPqir6CWJk7yaj0mOJ
         nvcVZ/knJ0QEGCuqldXNEmFY+UIIemksTW7ydWR1qPXrZfc3c21uIXnkUspNYsZvc93V
         TvRg==
X-Forwarded-Encrypted: i=1; AJvYcCUkadvOAPBUloiWmV4HKJYLRg4OY7t4xBIJDzNCTFaS2TS+IdIA7C/Kx2463aGtuIc8uWw1G6/JuYCnyWIx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0arI/r8Dea/Isutpc0vd8V133L2HCj3KX7vFnBfjG7gHDv9lQ
	DBVMgVJi/EeNyq4jIL1g/TVaJUBfNGRm8e6wDT5Ocl7SkHzJHqXGXgSJj6mh+bQ=
X-Gm-Gg: ASbGncv2fO1D+9fdTxyYFbEO03+77780fZU/STXjwW9dZhpXLegHfiGTiYEiENYyvlg
	4dQc2UotdcWCcgydkWtpNZLvRaBy/82IHUXk7UpzGDuNYC/g94el1pHm/4ZS80K+JNBwwUx0IWb
	wZB98SxBKGAQE67IfdrlSlgbH2xs7MP8MWd13zNI/PUz8zDLFRWSruilb9w+fbgdHl6Uv7m0cbb
	RcXRKs+77kNJdGjJ+p3PpEJtVWK/6m1E1kqwTdO+qLPVt41TiDWAYICXoZDZCNigd5AQnhkaEE5
	7sT33vRDr9Vazfu5xWB/KlQeOwDxFbDJx0o+zcw=
X-Google-Smtp-Source: AGHT+IGFbkcLdkOebqlvhktc4XxOR+kPFeyvv1NmZrdv/VsALlmOV+cvbZCLiOzMiV42WIgb7kMs1g==
X-Received: by 2002:a17:907:7208:b0:ace:3c0b:1965 with SMTP id a640c23a62f3a-acec4eadb28mr219125866b.39.1745912580861;
        Tue, 29 Apr 2025 00:43:00 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013ff4e7sm7048114a12.22.2025.04.29.00.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 00:43:00 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 0/7] arm64: dts: qcom: x1e80100-*: Drop useless DP3
 compatible override
Date: Tue, 29 Apr 2025 10:42:28 +0300
Message-Id: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOSCEGgC/x3NwQqDMAyA4VeRnBdoizq3Vxk72CbbAs6WxIkgv
 rtlx+/y/zsYq7DBvdlBeRWTPFf4SwPpM85vRqFqCC50rg033DwPzjuHtBiS5oI/44mtomDK3zI
 uEifGvLKqECPFoetD6uM1EdRsUX7J9l8+nsdxAiAXmvmCAAAA
X-Change-ID: 20250429-x1e80100-dts-drop-useless-dp-compatible-override-db8562c6b7cd
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, Xilin Wu <wuxilin123@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Konrad Dybcio <quic_kdybcio@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1759; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=dYvB61tFWaA6yh8/duxHkHb9Z9xmEpElUy7jETtqYYQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBoEILuUvIun7C9opgeq7YaOnb/BTs/CChz/FbDv
 5NoEh5Nn/WJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaBCC7gAKCRAbX0TJAJUV
 VqkcEACwAL7XbUoToWC2EYt1kXamDT3RaIr6kpc57YKTrNux1sQZhZCohb49PD5xlzXAZxPoqNH
 vyBjG+hPkFq1qeJoTyZAZwu0+iDMzE5M+HInhHU/0ZzvlmcES1zZrGEMHRu+M+SUbS1wnHFgpUw
 CfBmMbAycDh9gbCLqcmUhF8iy4Io78PTsJTqNq6sAXjf4leJz+HhqQDvTgFopeZIQaU+IUXKxTN
 qV/zOjB5dWucAAQdaixnBZk1jV/gU9WkqD7s0CiApU4owqAwwow2h9AvnPUhD1wRJga5SzVM7K0
 fe1DwDTGU8biiFo2163uIt25c5VktpG+L7isNPplazwZOkAscAuEckCCfudtHGncz9o09Pps792
 3rB2dqgBvbQFnLpKqDuI+PrW3//t6FeP1Rqk6JNFNx2gvckix2aWzn9Kd4uUCpZ2zivkIxftQP+
 GyNrXWlGgrNhY1W/lUyWbGP6l4T3te3e/1mXKj2VGyZnsWeVOFQyImeNo2HXB3qMiyVxqtre1BG
 lgP4sZkkLPn+QvBImpDYlLODAioYW0r0bwz2SQZH+iywl0pE3DQir9CEiwKmleWD3S+niX4wm7c
 0/zFaZ9ozD2OiQqUiktnnbV2Bd2bUcEqRDoNxbqXo6kaS0zJzB/gomu7ApHe8s5/J2BznkV9OxC
 unDP2g1+IcZEFrQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

It all started with the support for CRD back when we had different
compatibles for eDP and DP. Meanwhile, that has been sorted out and it
is now figured out at runtime while using only the DP compatible.

It's almost funny how this got copied over from CRD and spread to all
X Elite platforms.

TBH, the best reason to drop it ASAP is to make sure this doesn't spread
beyond X Elite to newer platforms.

Functionally nothing changes.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Abel Vesa (7):
      arm64: dts: qcom: x1e-crd: Drop useless DP3 compatible override
      arm64: dts: acom: x1e80100-qcp: Drop useless DP3 compatible override
      arm64: dts: qcom: x1e80100-t14s: Drop useless DP3 compatible override
      arm64: dts: qcom: x1e80100-s15: Drop useless DP3 compatible override
      arm64: dts: qcom: x1e80100-hp-x14: Drop useless DP3 compatible override
      arm64: dts: qcom: x1e80100: Drop useless DP3 compatible override
      arm64: dts: qcom: x1e80100-romulus: Drop useless DP3 compatible override

 arch/arm64/boot/dts/qcom/x1-crd.dtsi                        | 1 -
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 1 -
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts     | 1 -
 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts       | 1 -
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts    | 1 -
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi    | 1 -
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                   | 1 -
 7 files changed, 7 deletions(-)
---
base-commit: 7e69ad9a1f7ba8554c4d3d1ccbffcccafcd45c2e
change-id: 20250429-x1e80100-dts-drop-useless-dp-compatible-override-db8562c6b7cd

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


