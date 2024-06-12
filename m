Return-Path: <linux-arm-msm+bounces-22525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00962905DFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 23:48:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80160282BE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 21:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC2231A67;
	Wed, 12 Jun 2024 21:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y+Z9KsJ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C41B84D02
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 21:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718228901; cv=none; b=XFyjtKqztG35FuQVWT/3oFHVOO6ueRXfhzzZ5wp6UfN+0vMzJjgO1bpTUAPmGoNmchi7rG/StNFA30rIVdShRtrcKi+s5VT3xc41c9OgH+i1DUg9zErrWbJW09USo21sknw849u43s1tTyI7WcQudFQ0+/TFLMz2LodymtUIyj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718228901; c=relaxed/simple;
	bh=52Tt3NW+ANKZQb7cZcBFFzPLEvp/e4YDY2iQa91g6pA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KTSqSrtm/rdNq1t6G8Vg6873wUV6YfMix+1js25VIMloW+Cljlcrb6wpD9oMWZM4Vf+qU8+frPvgB7iQUlark8s73NaqljbpSCq4QJ2btg9OuEvXZy+dr2KWCYRiVb6VEUHHo1oumtFjOYGWoqK9BOYl2+9amABx5q2QvzenrYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y+Z9KsJ/; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52c8260a9a9so60192e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 14:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718228898; x=1718833698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cFE+Zn1tmEAauc9dII1QLXSVzsx3AjtBMpF3fJlb5C8=;
        b=y+Z9KsJ/AbUX9edUq/zJn5+RgW5TVpCmA5gt/0AND3cdsBUNrjPIvTvjwiaPb7yArA
         TeKKfszIp5QmF1eZd4IuZQp7gzHLHofyyZAQLxJejy5PMZc44nrIieQf2VAEW4BE8hPD
         Twv27EToG7kiMDAc7nDp9/ONwf+aFaVj+mORKsu6bbTQQcVeKBI2zAz9+MidV6nkvZgA
         gQlx3VKD3btMK23K0qw3fYsyANlUfejMDgeYJnx+vUkLPU8rNLFdtad1MKkNGfpIIQiC
         +5fMhxJQA9A9DF+XJ3JopK+2GyEcg1C4g7j1NV79Rs7iOrJy+rQeK8gfaewFGHyss9ou
         NRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718228898; x=1718833698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cFE+Zn1tmEAauc9dII1QLXSVzsx3AjtBMpF3fJlb5C8=;
        b=e/f5PdLvy9aC7U/1GkEf7nMiY1Kb07o0XyOMIXl86WuxFSnVjJCrn1CZodYOiKdQVn
         WSW1efiM/S/qsy0sxi1p/G6d/9NiTsTe12tFJqZzYAOS/c6XkXUJZf/B6jg4PH9Po4NV
         eZ4E7MLGEjPQsiCfY2YyCPyKTopz2zk8zJ8PrSFVghSL5IftYx4LNwJ7n1bEcTAt2Ilw
         5Bwta9umDOdmLqdgsJW4ccKP6XSfBYvxS1WFZzk3HofeSifMKKwGW1m4mqBK3LbFk51u
         G5JKFixZDCJpDDVvJFBBEHNUORkJZ+GSh1UMr8XHzx46Ixq1ogtx/S/bundLUgvlAacD
         BXzg==
X-Forwarded-Encrypted: i=1; AJvYcCVsqcVmRyhLjiv+g1nh0ONkF3sXY3/Y9XTuKzg6rLS2u6tA95usdAUNZ6G8Sz2NcCRYUa4RlHJeNZd1LbrfkwziS76kaKfzu8gSW8Mf6g==
X-Gm-Message-State: AOJu0YxMuSDa7/ftdxZfTveloCddaTjsOn0Gm4MVClbM//Ol70X6ayRH
	ZDIqIR+KU4eryyTKs6ElEs7ZLzo1vWuJ9Wcs5tdTo9aL/3VTC8NhAH9UaM3Li4o=
X-Google-Smtp-Source: AGHT+IHBkY1T5rNg6UcaRlgOULtgIQE89IiT4QIFhldMkA5FIlJk2StjrJMJgXHuM9swnpPJsa33cw==
X-Received: by 2002:ac2:504d:0:b0:52b:b349:c224 with SMTP id 2adb3069b0e04-52c9a342daamr1496377e87.0.1718228897641;
        Wed, 12 Jun 2024 14:48:17 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52c912a84d4sm940264e87.185.2024.06.12.14.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 14:48:17 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH][RFT] arm64: dts: qcom: sm8550: Change camcc power domain from MMCX to MXC
Date: Thu, 13 Jun 2024 00:48:12 +0300
Message-Id: <20240612214812.1149019-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Any attempt to enable titan_top_gdsc on SM8550-QRD fails and produces
an error message that the gdsc is stuck at 'off' state.

However if MMCX power domain is simply replaced to MXC one, it allows
to turn titan_top_gdsc on successfully, even if MMCX is remained off
according to /sys/kernel/debug/pm_genpd/pm_genpd_summary report.

Note that at the moment qcom,sm8450-camcc.yaml gives a definite comment
that the supply power domain should be MMCX, and it may be needed in
some certain cases, but at the moment they are not unveiled on SM8550
platform.

Fixes: e271b59e39a6 ("arm64: dts: qcom: sm8550: Add camera clock controller")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 4234c92aafe3..a429115524a6 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2754,7 +2754,7 @@ camcc: clock-controller@ade0000 {
 				 <&bi_tcxo_div2>,
 				 <&bi_tcxo_ao_div2>,
 				 <&sleep_clk>;
-			power-domains = <&rpmhpd SM8550_MMCX>;
+			power-domains = <&rpmhpd SM8550_MXC>;
 			required-opps = <&rpmhpd_opp_low_svs>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
-- 
2.33.0


