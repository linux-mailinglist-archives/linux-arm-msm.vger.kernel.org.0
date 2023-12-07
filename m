Return-Path: <linux-arm-msm+bounces-3711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2139C8088DC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 14:07:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D19C528282F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 13:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 459433EA87;
	Thu,  7 Dec 2023 13:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="noT1QQ5J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F1F110F1
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 05:07:11 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50bf2d9b3fdso834228e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 05:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701954429; x=1702559229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRH0ltu/8xOeCYgi26zDqsTtGrYZ67tsC2xGcsHS4PY=;
        b=noT1QQ5JvJmco7Zx2DiaCaQZEPhdmbywAujcKJRNc6oUydwpcrLlDHpyvdfuhuUqfm
         Zmh8ALAr6Af/pR11aQ/JNNu3TTY8WfejXiiiJ8h8VMaIVjvbD2nABn3JOYc4qU0iqVmG
         Q22ry9NzyCKrP77rpxJmw1fyJa1WC4o21FYh0pvc7ME6DWaSbR42dCYrHNj0aQhXoMAj
         81oJYO0QJ+Saj29bnHv1a705bgIVC/+EmLWfmuuwoR+w3A/LbIxa+Fg7FYiYxv9bC4Op
         EmXF2QKqhbj79zMvL3EePIT23YM/jtVlfA0zvF6OTDjoB/M254kpcV2WqMtWlkiJvKId
         HB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701954429; x=1702559229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tRH0ltu/8xOeCYgi26zDqsTtGrYZ67tsC2xGcsHS4PY=;
        b=XHxp+9K/gnOxloFu/M57JIlAjE+q57vLiuoa20jg14FBQXXTjG9DqxMpjlS7YczmeZ
         Rj+28aEueSj+itv1iSBHjCXmnML9PCZT2t6L0PoAeLftvd8RzXs82BX68BkhPJlzKsUn
         7o736fAX0vei3qAu6qgM2eA7tHm32r40VP1yyFvKvCAD0nfAxZyF7UPKB3vwLAPNP9F3
         nAADhKvl1sCQ15zrzeqSyYVp7qG2J6rWm1ssvXpJe3Qq/N4sFRpwdKK1RSk2aiKW6WXC
         YnUsIfUHjI2g87WC/Bq/hZ2hyzSGxVJ/3QId07Q9YgVt+zeVpP6g5YA9rEi6Iaze3YR6
         qo1A==
X-Gm-Message-State: AOJu0YxWnVQ/SSI0YZpEL2lZdk/IEiLYZwBIvheZKcsb9C++5tTN9hEZ
	BuRcAPCal3IwVgXSo4IEKDW4wQ==
X-Google-Smtp-Source: AGHT+IEsyxo0MGyaQjyuCabGJdhhwA/ISqYGFHCfD0Cv0cJ6xp/BS7GC183ITUf6/GYMLLK663TFIA==
X-Received: by 2002:a05:6512:3124:b0:50c:a39:ee37 with SMTP id p4-20020a056512312400b0050c0a39ee37mr1543140lfd.109.1701954429293;
        Thu, 07 Dec 2023 05:07:09 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j21-20020a056512109500b0050bc41caf04sm167685lfg.304.2023.12.07.05.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 05:07:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5 06/10] ARM: dts: qcom: msm8960: declare SAW2 regulators
Date: Thu,  7 Dec 2023 16:06:59 +0300
Message-Id: <20231207130703.3322321-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207130703.3322321-1-dmitry.baryshkov@linaro.org>
References: <20231207130703.3322321-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SAW2 (SPM and AVS Wrapper) among other things is yet another way to
handle CPU-related PMIC regulators. Provide a way to control voltage of
these regulators.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index f420740e068e..0ab340405784 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -223,13 +223,21 @@ acc1: clock-controller@2098000 {
 		saw0: regulator@2089000 {
 			compatible = "qcom,saw2";
 			reg = <0x02089000 0x1000>, <0x02009000 0x1000>;
-			regulator;
+
+			saw0_vreg: regulator {
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1300000>;
+			};
 		};
 
 		saw1: regulator@2099000 {
 			compatible = "qcom,saw2";
 			reg = <0x02099000 0x1000>, <0x02009000 0x1000>;
-			regulator;
+
+			saw1_vreg: regulator {
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1300000>;
+			};
 		};
 
 		gsbi5: gsbi@16400000 {
-- 
2.39.2


