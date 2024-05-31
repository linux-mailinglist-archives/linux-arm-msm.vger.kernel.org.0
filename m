Return-Path: <linux-arm-msm+bounces-21278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C338D6385
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 15:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C100B28F0B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 13:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9611315AACD;
	Fri, 31 May 2024 13:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="py49z71V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6B5159216
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 13:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163562; cv=none; b=Ea4kQCcO3DR7um1G5w2OVFVkfwfZMtJndaKBaYc3NBer4MEEVYYNIgCCFElmIyt7HMQZM6j9DDJD7gAyRxo0MxGSvOK45qcd5bdVOJZwxqpOSLMOBMIjo9Mt8HXm50g0Q4HPAM4K5Btuhvt0fySjeOCMJpzal1R+oE2eafMwllw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163562; c=relaxed/simple;
	bh=j/WC3jnjZyf0K44mQixIq2B70xpaQcjKVZAzgZ3adEk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aeu3YmfU9PDpYDj+K5ho0zTqvDFli1r/bKxV8N2+mfDAEZJRriDDyOSIW5RQqnMCh8fqqsHBl/smArqcArnMCSCMNMA/rAmLOVWDAzl6K5iSznatateyR9fmsxvM7HWr+gyfthnl2wdiZklf0ZPStHs3HeuoDFNkWyWESstfvj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=py49z71V; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4211249fbafso19499585e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 06:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717163559; x=1717768359; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aax01O0DeJKalXzhukBYsIXBzFqtQn3OH1HKXSy2CvQ=;
        b=py49z71VHoJdiCrwEXCZlCRDLAYKvVcATRC5DlERlMtKWHS8QVNsmSh6E7rb5ybk6L
         l2Ma0NnYmqPeVAr7YYxjEAtwN9eFzEBXysfI1ilE8DoRYCPeD3gyh4wefgopdCYjyUtI
         eWDRk6GT6lkkOA/xz0bM82fW06eNEoiRTGFexL/1Dc0HeXP7/M+uiX1U3gCNed33EGUL
         FZ2rxK7y31yTEYBTeGe3yEU3HdPCiwhdxkeOlfyLqTzCVBQYawglif6P2GQtljOi5zJY
         K4Z1iJ8ldLY1hoIATzjSOKNyOyl3jBwmHAfkG0yES5H9Y1eLgTMVnJeH2KoRqf/QFfoC
         7Kew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717163559; x=1717768359;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aax01O0DeJKalXzhukBYsIXBzFqtQn3OH1HKXSy2CvQ=;
        b=OoQ6z7bubmTkhGdA7OGM4S67R7n9NeedkzKdSLMrgrp8Ehtl4jkGwtdXJiaYooLahU
         t6VlkTM8SH8H7AXWWpUD8Wo2pOAqG1EsBzEHocnzAwq4NSiaqUt5EAYxhmCG2zoZUBLb
         adQ8HXyNSanONsl27A9GpaQTvUVI/hc9N2K/WwVf7fCt1pO3zQfFtAAslgMc/Ur1ardZ
         kF6BOCwUi+Ksgd76dR39FyM+aGKNq9lNhc4yuuZQwllV+RRrKANH8Eb3w+bRy5EfKEDD
         wnuuZCGmKjQzWk8xGHojbg8x6ZjiN1kJFf0xUrBR7a5cR3aCtS2rVHUDmiOSE838OHxl
         4pAw==
X-Gm-Message-State: AOJu0Yw62kExMM7VnwS+DMnMS42DucQCZE3boKOU9YKyxTR25xYW23vk
	mQBou0Op8Mj0bL/SPa8Qdp6icTQF3BWDlQsEXa+a+9WIr5jvuFOAtQPuqRIC414=
X-Google-Smtp-Source: AGHT+IH5B/oK8/lXYvaAyc1Mognx87Qds3zMxz70bVKJ3RPglT7nxQSbFtqo10VVo4wsb6UBkZm1jg==
X-Received: by 2002:a05:600c:4fc9:b0:41b:f30a:41f1 with SMTP id 5b1f17b1804b1-4212e04422bmr17173685e9.7.1717163559109;
        Fri, 31 May 2024 06:52:39 -0700 (PDT)
Received: from [127.0.1.1] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b85ec87sm26762735e9.27.2024.05.31.06.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 06:52:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/16] dt-bindings: clock: qcom: reference qcom-gcc.yaml
Date: Fri, 31 May 2024 15:52:18 +0200
Message-Id: <20240531-dt-bindings-qcom-gcc-v1-0-b37d49fe1421@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABLWWWYC/x3MQQ5AMBBA0avIrE0ySiVcRSxoR81C0YpIpHfXW
 L7F/y9EDsIR+uKFwLdE2X1GVRZg1sk7RrHZoEg1pOsK7YWzeCveRTzNvqEzBll1Wi+2JaIGcno
 EXuT5t8OY0geT6nIyZgAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Del Regno <angelogioacchino.delregno@somainline.org>, 
 Loic Poulain <loic.poulain@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3134;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=j/WC3jnjZyf0K44mQixIq2B70xpaQcjKVZAzgZ3adEk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmWdYUg5Rt7EoWSiYdNL0CMM0oHeSrRkbG7lQk4
 Ost+bqdEkGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZlnWFAAKCRDBN2bmhouD
 15lXEACAs0PetkPbRsZ4eDDU+jlebRbuH/sJ2zm7cykjMluK7Hhvq37TZXG8ixpUHbDHAP6Uk2p
 LIF9a+Ca0/g35oS0JO3FQSXvY4oe74vC1BEboTwtCIhwvgQHg9Z/P2O+yJn13fmx8AvGmBKyWNM
 bks5R4v1ZE+Gg+xo1PLOCodLSN/wUacEKo9kJq620xbZ7t2r/FU594Wy2dfLHgCPiD8UL/kdKGI
 SygPAh7GQnaLHLNlezFwBV+JWPtXLFf2nh18HsECvBbX/fqu9zQlfjehfyX9vutqcCvtRGCDJOo
 RNCzxdBaoguoOSiWDb68a0IwsuH6nrnbyiGmplSh6Ef2y0z8GKoK5CZ7QSpn2NoubhLs+qZbjh1
 cUJAUgcwSLd3IT5QmLZrMzCWc6zEey4+RKDU1jvWo1jd+1gaI7vYads43SqRF7MDmYFzmHuy0fC
 rpDDsv5KbgpA5073S3a3JMCW8cy6iPvp48yAHlpoVipgKOaglCQa73+dV9lJ/szeZRKbgjA49hT
 ozuFqxf3fFRJuWqoSgT3i7pvZjUOKNfZCCTKHxa5ngXUVzfkx2xZM+sD+eV67MDPwWDkZMRe8A4
 M501eKCrowYJZT1KM/G4FAFHoMAUXhOnMOcD1JVI5X9Q5YA3P+5h8cmiKpFA+rXPPqJ+d4cZueW
 9+d68ictjSQyLJQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Hi,

Unify Qualcomm clock controllers by referencing qcom,gcc.yaml where
applicable.  Several existing bindings for these display/GPU/CAM clock
controllers already do it.

No external dependencies, this CAN be applied independently, but require
power-domain-cells in each binding, just like Dmitry's new set is doing.

https://lore.kernel.org/all/20240529-qcom-gdscs-v2-0-69c63d0ae1e7@linaro.org/

Best regards,
Krzysztof

---
Krzysztof Kozlowski (16):
      dt-bindings: clock: qcom,sm8450-videocc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,videocc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,dispcc-sc8280xp: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,dispcc-sm6350: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,dispcc-sm8x50: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,gpucc-sdm660: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,gpucc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,msm8998-gpucc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,qcm2290-dispcc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,sc7180-dispcc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,sc7280-dispcc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,sdm845-dispcc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,sm6115-dispcc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,sm8450-dispcc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,sm8550-dispcc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,sm8450-gpucc: reference qcom,gcc.yaml

 .../bindings/clock/qcom,dispcc-sc8280xp.yaml         | 20 ++++----------------
 .../bindings/clock/qcom,dispcc-sm6350.yaml           | 20 ++++----------------
 .../bindings/clock/qcom,dispcc-sm8x50.yaml           | 18 ++----------------
 .../devicetree/bindings/clock/qcom,gpucc-sdm660.yaml | 20 ++++----------------
 .../devicetree/bindings/clock/qcom,gpucc.yaml        | 20 ++++----------------
 .../bindings/clock/qcom,msm8998-gpucc.yaml           | 20 ++++----------------
 .../bindings/clock/qcom,qcm2290-dispcc.yaml          | 20 ++++----------------
 .../bindings/clock/qcom,sc7180-dispcc.yaml           | 20 ++++----------------
 .../bindings/clock/qcom,sc7280-dispcc.yaml           | 20 ++++----------------
 .../bindings/clock/qcom,sdm845-dispcc.yaml           | 20 ++++----------------
 .../bindings/clock/qcom,sm6115-dispcc.yaml           | 20 ++++----------------
 .../bindings/clock/qcom,sm8450-dispcc.yaml           | 20 ++++----------------
 .../devicetree/bindings/clock/qcom,sm8450-gpucc.yaml | 20 ++++----------------
 .../bindings/clock/qcom,sm8450-videocc.yaml          | 20 ++++----------------
 .../bindings/clock/qcom,sm8550-dispcc.yaml           | 20 ++++----------------
 .../devicetree/bindings/clock/qcom,videocc.yaml      | 19 +++----------------
 16 files changed, 61 insertions(+), 256 deletions(-)
---
base-commit: b0afb900b7d235d879f8e8e4babfe77d9db76f2f
change-id: 20240531-dt-bindings-qcom-gcc-e2955fd60004

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


