Return-Path: <linux-arm-msm+bounces-3795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD9F809787
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 01:44:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA5BA1F213E6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 00:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526F41396;
	Fri,  8 Dec 2023 00:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gx81vl4m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69E07172A
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 16:44:27 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c9fdf53abcso13938881fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 16:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701996265; x=1702601065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rzx9Bm824S2wRWYFO7S2MdJvHvf/jzSVekqRFumNr7k=;
        b=gx81vl4mbnjYuvyTzPM8r+NXJe1fKk7JyIs3MJKI9q5TtkIywPCn9CSFOlROaIWGmW
         yvcGNSXk31876aDx4MPYAsztBbxCwqcNC13twV7TSOALib6LRGeujh8N6BFUghubdXKF
         LW+SKElddZtB2nmXjau441qSKJ9llyvWdjLTjM4mzNB3tnSS7NuSa2Ay8uq+7k2tYuT4
         ZvXASk5YTI6DaSMBZbBRH9f/WNxWYK2Vy0gbt96P2/1GePSyZYfuLsSVoYPR4C9TOO/Y
         RzoyEcQD+p1hOZp9UStVvPq8wLJFTB81LBalJL2+F1f/TOWGblmPy1/TXtAzx0SvmBms
         Y+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701996265; x=1702601065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rzx9Bm824S2wRWYFO7S2MdJvHvf/jzSVekqRFumNr7k=;
        b=Az0oOA15q47wbNrhgT9FyPE5/Bn8q+i5LXlQK6k+7QoEHN6yx2Rmg+Q36Mive6FoXJ
         EIFINIE83oYo0OstgE4PJjdski4VVRHBpi4rA6qe18PL1+IzKFK3w3xn2Hh2qom+yKnT
         3bh0ud6kGrQH9G9ylZ2QQxJJJS4g83bEnQt5xWtDjV+22cDbHozCdmbFlFjZWMYYi9rL
         mS5qYh285icZZNEUTd9WLTzudCEXqZLt8H4B5NlC+j4LCPSXMN9Vsw5wvBG2TNo6drvm
         /kvY7wNUOpPIaW9ANJ6mEajM1T5T4mi5nZjDg4JPHVNfdxJ84SIAsl7fSNb8pBX2qDyv
         6FPA==
X-Gm-Message-State: AOJu0Yw0zLW8qZZr4MIwsQCfBpL5lgYxKmX6Oyb4JIRWj8XjqtHgD0JL
	D7Ed9CwkctCgB6QzPjMhvQQG9tK28ns62eQWitA=
X-Google-Smtp-Source: AGHT+IEkooQEzU6pVeFzojl2VJJrOAtyIQajir1ICI20uMrx+iVRPimyAZGrVwQtJd87ZGXaQb4sWg==
X-Received: by 2002:a2e:3512:0:b0:2c9:f803:7c05 with SMTP id z18-20020a2e3512000000b002c9f8037c05mr35588ljz.1.1701996265804;
        Thu, 07 Dec 2023 16:44:25 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d1-20020a2eb041000000b002c9f2c7cdecsm82645ljl.22.2023.12.07.16.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 16:44:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v6 11/11] ARM: dts: qcom: ipq8064: drop 'regulator' property from SAW2 devices
Date: Fri,  8 Dec 2023 03:44:17 +0300
Message-Id: <20231208004417.3393299-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231208004417.3393299-1-dmitry.baryshkov@linaro.org>
References: <20231208004417.3393299-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SAW2 device should describe the regulator constraints rather than
just declaring that it has the regulator.

Drop the 'regulator' property. If/when CPU voltage scaling is
implemented for this platform, proper regulator nodes show be added
instead.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
index c3677440b786..191d1cb27cb7 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
@@ -589,7 +589,6 @@ acc0: clock-controller@2088000 {
 		saw0: regulator@2089000 {
 			compatible = "qcom,saw2";
 			reg = <0x02089000 0x1000>, <0x02009000 0x1000>;
-			regulator;
 		};
 
 		acc1: clock-controller@2098000 {
@@ -604,7 +603,6 @@ acc1: clock-controller@2098000 {
 		saw1: regulator@2099000 {
 			compatible = "qcom,saw2";
 			reg = <0x02099000 0x1000>, <0x02009000 0x1000>;
-			regulator;
 		};
 
 		nss_common: syscon@3000000 {
-- 
2.39.2


