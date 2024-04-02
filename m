Return-Path: <linux-arm-msm+bounces-16007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BC28949B9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 04:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AF591F21FC3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 02:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3346014F64;
	Tue,  2 Apr 2024 02:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AjVAOsQ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCB813AE2
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Apr 2024 02:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712026643; cv=none; b=DY3+KzZsP+welq3cdPPl0OD2oI9AKvUi/YDwyRvnWDx34rVLkb0ZiiZDD4NOXXbIfSUm7hMOhBXjWwO0PiOujGzt7TUHuK8Z/ksW3ZjGCbcGLHl+HF+XLoq02kRcOD6KTv90G4+swsANSaUwcb3+8PbbsTIoKkLcOOHLKbP3bQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712026643; c=relaxed/simple;
	bh=w5zQXOnPzB+6T+6japHE8hZUXFKbXI4e5KFMpuaJ0rw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mRw/Wq1foie0AAK6QeKJtIsovy65VfWM2LC0s6G/0f8+xCEMvMVFaRYz2ppCkbve8SKHs5WcxwCosiRVw3YsEuEPJB+jyz7mTVi9K1MXpy8FmoT3bgvCP77tYurrIOMEGAnS2Vk7pNykmsmO3G5z2DhRQ4w7JmtkqILfnZW4bO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AjVAOsQ+; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d475b6609eso50304471fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Apr 2024 19:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712026639; x=1712631439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5IC23W8dkfkeGv7PhNwXY6wfYxaTqv1Otp0zqPc/pE=;
        b=AjVAOsQ+T9HCRF8G8TvPK9yJTSOWySDavKOIWoy9EIXdgSbp2N0I+DJ3pIWB14fD5I
         eqKFxUpfdpOXCOMFFPKXuPx3NVwN0BKsGFROxusNVPLsFyX0+wBr8EV0zDR7805rUWSK
         ogieDlcqPjXyDZM/3V+IHc/R/oN+DM2vTU75C5trTSMbba3L2ZOU/dYKVtaGTzOEiv5s
         JKwWqEFioRaoBpuaE8VfGuctmjOe5/0w+g4mFbRSZ+bzh4VpTELbRfMXrBIV03P80yWp
         gJYo5zNUV9UYb7+Cfr2Txy1kMnORrwjmoL/eEQikglEmgrJWglHAfr591/0pF3hdWfUB
         YcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712026639; x=1712631439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5IC23W8dkfkeGv7PhNwXY6wfYxaTqv1Otp0zqPc/pE=;
        b=hPRq53ocWWz4WbIx9NrPAgmvgHtWS91mGqdAhywWmLPvD71yjFpmlPd83btIeh6d7O
         o/yv3ixeoctFWYaRg47yKlKUspyet9nKScjVj6hQ43QC2EgoYNPwLOOXklAx7WlfHSy5
         mM5tT3nSfZ5NMg5TteTnWd1sWTeYiFs2z/tZ20w5Obs4cxiJDy0fM5zHWkEjQFtj43c4
         idO1vc8ODbiDDXLPzVQcQNXAYNlEK8j1pdR0U2/VCRpU+l57YjmUhD0BVqC88gnMpp12
         MV2BMn45i5cLGWmE5zAgQxHKmZT/T7S6dlGq+Ba0roEFYiRE+pumRXx4jicsGMCjRojU
         5AZQ==
X-Gm-Message-State: AOJu0Yx7ll+qOS3aZuEvGTrOW7jJW02I1ZE88JGCO/a/eQHMXReNMkEq
	x7li75uhSe3a2zbmtnKN/Hl1GJgFRYzui5JppO2qg4j0gcbEb/mu8dd3su+SZD4=
X-Google-Smtp-Source: AGHT+IE5/I0Ui+n+NiAwymmYa3FFUUviJesGwNK15ik0L4EqKpZG6dgdOX1WTj1V5kOdlUI1dCc+Fg==
X-Received: by 2002:a2e:82d7:0:b0:2d4:35d6:1984 with SMTP id n23-20020a2e82d7000000b002d435d61984mr7265060ljh.6.1712026638803;
        Mon, 01 Apr 2024 19:57:18 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 14-20020a2eb94e000000b002d48dcd10a9sm1562356ljs.86.2024.04.01.19.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 19:57:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Apr 2024 05:57:16 +0300
Subject: [PATCH v3 2/4] arm64: dts: qcom: sc8180x: drop legacy property
 #stream-id-cells
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240402-fd-fix-schema-v3-2-817ea6ddf775@linaro.org>
References: <20240402-fd-fix-schema-v3-0-817ea6ddf775@linaro.org>
In-Reply-To: <20240402-fd-fix-schema-v3-0-817ea6ddf775@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=862;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=w5zQXOnPzB+6T+6japHE8hZUXFKbXI4e5KFMpuaJ0rw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmC3QM9OVJQVRYKxY615wIyW5tU7qgiHe2AT9Oh
 SAP7fUs9JqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgt0DAAKCRCLPIo+Aiko
 1eHpCACpIHEWWSt0ZG579x3SBHA4VNC/sjNCXH8JkSj1JtlfRqYbN/WdQ5nl1tw8/wVXUbj56ms
 AQwQxDLa9qQIgQT1sNNfryf8WQxIgYC0KtIFZC40l/3gB+2863sA1k+u+Z3Dt3RecGJfJkhYfBh
 ObYbuPO6WVE0+DAXD5QOtA/291yH2jCldHm+ZxqL/XYu/PEb4ZT26jyjL6bxmXSIftBmmBvlkH9
 t3t8iVJ2vxXz+7Za5GsbYpP5UDWF8+P6Lki9z+3d7dyJNXu1jMu+uNv3jgZb67zRKbZe0yee3e2
 ooZ6r/TUAKv9AvPeohukO87QN8LjEmI+kl/VfYY8hItlgTNs
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The property #stream-id-cells is legacy, it is not documented as valid
for the GPU. Drop it now.

Fixes: 494dec9b6f54 ("arm64: dts: qcom: sc8180x: Add display and gpu nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 32afc78d5b76..99462b42cfc5 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2225,7 +2225,6 @@ tcsr_mutex: hwlock@1f40000 {
 
 		gpu: gpu@2c00000 {
 			compatible = "qcom,adreno-680.1", "qcom,adreno";
-			#stream-id-cells = <16>;
 
 			reg = <0 0x02c00000 0 0x40000>;
 			reg-names = "kgsl_3d0_reg_memory";

-- 
2.39.2


