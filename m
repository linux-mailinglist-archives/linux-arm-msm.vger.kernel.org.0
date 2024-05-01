Return-Path: <linux-arm-msm+bounces-19075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECDB8B8E0E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 18:22:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71D3B1C20FDD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 16:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762B5132816;
	Wed,  1 May 2024 16:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t2+Jthxc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59A013049E
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 May 2024 16:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714580395; cv=none; b=SlOvPFSgTgSaflmAnzEu9fqfVr6iJz/RoWhBP/hEHTNAnEiQHjNaOKNDmbPWL8jowcmgzkcGU362vDYcC7fkXDjDdT95MKzM5twThX4Hjvd4spQXpmx72M+jbT3zz0LMsQc3/nvYz23ivw8jw5V5WpoL+zo2HLfvLaEo/weKfq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714580395; c=relaxed/simple;
	bh=LRBZxO+Nudwm9N9s/JWAgHDzC0dYV1KQNWrzIhyLeXM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nh+T9UgsGZARDrRQRoaZUwF7SaQyVoExcI6e8aH2epIIV7MS73ZlMXevlNuU5vCZOex3JDGvkBYgC8d3zuCdteYxb2o13TI16s7SyOtU7ekpnwGRMHkbqnVpCtIrU/JqFZJ6+ZE44c6h8Yo8OWWpDxhlE9RKURzrizMEzvX9wbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t2+Jthxc; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d8a2cbe1baso91435451fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 May 2024 09:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714580392; x=1715185192; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OBu8uJvPg1UvIc+mH2v8BNRxGrigWtykVG4/Hi5iSBE=;
        b=t2+JthxcNPtN3dM8+GiNWHRXjOpZh3uUDbD4/9vKEABTXT9ATENCDrfdL6eiewyzBl
         oZImwoEUJKXSF3yNA/sxmU8PWopBbc8Js0l5qItZvYIjZC7QiI6ImT4CArzyqRQBCYv0
         EzMwhjuCzP070BFHaUyAf5t5118YHeoLcDEL96ym8mZuTVLdmQ50zsArSf+Kk3enmO01
         XAsGJJ0Cz1IW39mimFQa1hV5M+mKY9krel0+tyct7vjy5SjwC8mbLVpXD2M0EtFn4sTg
         kBiuC19ru3HdEeKH3xgEMNfQNwIFnaYFQfCjPvjqvcWxv/mzFQYBJbImaj9KvYzqnbxc
         lFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714580392; x=1715185192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBu8uJvPg1UvIc+mH2v8BNRxGrigWtykVG4/Hi5iSBE=;
        b=BrqGVq3Yu/oGTtO+7avjMegcZ0hcIngvDS/LlSQLaYydo0NvjokreYM3BjxN3xOCP4
         PN91Tf5r1qD7uXkrd4H3yM9NFZC0mnsmcjIy9q+od6Ea/twmdM9V1bgbV2YlbIuMmKRg
         mberSY5wVu3mSoiKabHiclvEGqpKO0bBylCm85EQNA+XyLBPx14gqe9pqqGe0xS3kylb
         /AcCbF+gWy8ADOAOirJYsImIPMgmg8N3w5rGGi4uIrsKcCoYkFr3suU0dXczmrOKcffh
         P8Le5tChI7GSPqep3UPrOIEGIPF1AiJOIs4O7xQs/1IjOl77YyknUCGQ6kCMF9cgMw5h
         nvDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlEyudBO/CJCPj+KUp2n2+TjaRHq7+amroOht2RtOb7QQoFx08BF9/AKWa4dZNbHWyGCJ0Nwbj9Nq8SOSc5XRqpXm1UxaYB0pa0jdOqQ==
X-Gm-Message-State: AOJu0Yy7MPPa3p3aGqa5CDoPKvK9qPEV8D6xBAscq3H8A+Ktz9TYazJ0
	XAhWqtfkhlE0/IaXk6j7K/fx6Du/VMJQMEhUKWi5Co/ug/hXtN8LHR8i4gFnGME=
X-Google-Smtp-Source: AGHT+IHO8D7t79jPZVj7GXV0IfVFmAJztyQ9VRH2f50wnpSv+Pf+ol4AKyqgnp0U+Cq+lf34L9WmwA==
X-Received: by 2002:ac2:41c4:0:b0:51a:d9a3:dbf5 with SMTP id d4-20020ac241c4000000b0051ad9a3dbf5mr2356904lfi.47.1714580392074;
        Wed, 01 May 2024 09:19:52 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d30-20020a0565123d1e00b00516d0029383sm4909306lfv.28.2024.05.01.09.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 09:19:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 01 May 2024 19:19:37 +0300
Subject: [PATCH 11/13] arm64: dts: qcom: sm8450: add power-domain to UFS
 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240501-qcom-phy-fixes-v1-11-f1fd15c33fb3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=798;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=LRBZxO+Nudwm9N9s/JWAgHDzC0dYV1KQNWrzIhyLeXM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmMmua/rT0OXXocvCG8b8gq/7FNAEDPOaV91fBc
 6W0ZKsMdHeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZjJrmgAKCRCLPIo+Aiko
 1f+9B/0VYtVSGVWCZvPqh0QKUYhggov+CDpfC1AhnYA+ejG9qFFpC7F4AYWaU0NJmkpSx6Hilcj
 S7KVLLLMLwWN2MYwey5lM1g02FZnkaTiokCt4HehqxY4rZTnWzsh3byfcT0ZzqviHR4EmtbiUFD
 X6N9buwh8a0yPEUX3rb7h7mR2/f/hKSsOUoALc+gsZ6pRrzM+vnPFwAju6x9DVExxw37Tj5u93u
 i/uId9z0qQKt+nESK7UHfCmA3ASmYtLITTzREto1Z1c1rfse3nqw2bQLF3jkVhWKG4TFBAI7GXG
 pLwqajBK6GFL8yIf27UrOxs0+TLhBCVDCdE+d77cdQY+iiL7
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The UFS PHY is powered on via the UFS_PHY_GDSC power domain. Add
corresponding power-domain the the PHY node.

Fixes: 07fa917a335e ("arm64: dts: qcom: sm8450: add ufs nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 71797f337d19..ccb2255a94a2 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4429,6 +4429,8 @@ ufs_mem_phy: phy@1d87000 {
 				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
 				 <&gcc GCC_UFS_0_CLKREF_EN>;
 
+			power-domains = <&gcc UFS_PHY_GDSC>;
+
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
 

-- 
2.39.2


