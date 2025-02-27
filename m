Return-Path: <linux-arm-msm+bounces-49628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A48A474D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 05:44:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65527170285
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 04:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA33C233148;
	Thu, 27 Feb 2025 04:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aj1Ji3vl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CE1231A55
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 04:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740631088; cv=none; b=A5KEso8YkpiUD+iBkY9NToCMDefIFQ6ursrSOIRF4Q21Mz6X06wgea5S+TKoP0BE6gikZaChx2FcdVXLsYLDzid5XxzrUpUPfNlrdrnZsX8Y5Zb4XVptyd3HoNKO/hrgGlgYZfIBfMbs/EAuSM3gTIzc/FPM+lAxGFPWHI4CFxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740631088; c=relaxed/simple;
	bh=MSivXoBjhAmFSDzHG8U1LTjK1GNQVhU00y3QUrQPRLA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KC23Ca5NKGHNJ2vz9A6OuHwafIrBynIh+6pLseBUR5NNb7mhH/Fu7VvKJHnU7Un0Yvp1fF5YXnH7dRggSt25oYCSjkp/15wQYvjZunOQnCX8XWaijOq4DvQRZV0xzcWbTtVC7Eevld4yLIVu1LnuwnUKWsN26nTVxHO1rBBTHtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aj1Ji3vl; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-546210287c1so457846e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 20:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740631085; x=1741235885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8Qfog7C+RF4zPzBr1L919bNbTJtyOk3Zvza1VKHBAM=;
        b=aj1Ji3vlmD0Kh79LSj1yBEI0FY5ZzjsESPFbk51hH3qDD0DtOB9e1RyCoVmBC31o+h
         ltTthQ75kBWlQKBvZ2h0HblXB6FRtTOL/21u/NYf10ztw5nGC1ze5hQt2RUpektRtkxl
         km5jSWB6j9x1ZI2Nh4JA7qDRzmlbtbKJcwaHQVP7Pa8Ya6dZLWi0MB0gvb1FLeugORoL
         7RzXJg8hsHY1aGXT3TdjHR9nsMxKbfUd9trUhTP0zsA/ZXQ2oGNqTuMG2n1YY0OfpmQH
         DyKwFIyKzucWwG/xkGxXY35RcS0alq83ITdnMVoKCuWmxv7a1V4T32MG4UiuYCThegs5
         siLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740631085; x=1741235885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8Qfog7C+RF4zPzBr1L919bNbTJtyOk3Zvza1VKHBAM=;
        b=eBbZuCmvcAbtWYN+Oi9zmvSLBgqur+bV96eao8FHuvXSI7+4G61uXNqjfhI1ghAcEr
         02WjONW5lLDCAGKb8pzdvwh5gZLURhT4IcFXl3P/SWv0eCYYrv62TIp9IXT3w+1MQFCw
         ETKCXazZutrTWC5MwkjZVYYrvfCoFr98q/Hs1v7ppWeAt4Vgo95yACRkpeu8mteUT96q
         za83fh5vwZdvHQzLlujRFzCtcuv6dsg9XjU2KT93Q/V/9w5K4mlszVZYhAGrUrS4NwiX
         IIpL4Le0OoAUBe9jDbzWB3ixtxsFZ38WDs/WLM+ZShJwkcSBfk2CSxY99lBUYLEfMnKB
         4XJg==
X-Gm-Message-State: AOJu0YyElxF4F6bgl3AytHU4VvJdRm90BROSry+LhDIczm5RAkLDOXEP
	zkNMfCIDhudCYoXRxh9ghSmcxs0hFpSt2qhf7nfIxey620CKXETrmuM8m+9FB/o=
X-Gm-Gg: ASbGncsVKCmunPY6QD1PxW1TO4xfKNsSaa0ZqB0XSeO+EfIfduyO0DRLMRpp0ZCvp2f
	OfVTLB8nkpVrm6o+s6zd5PbJg6qubCEZHegjYQtHv1GXhCYToMUiRRHInnpozljQQJypZRg251N
	V5/PiEbh3/ztOcYZrkEHFzTo5I3wYr/wWZUvdFXmhEtHR2/jlNZyDdzPJ8BQHv4ttCfnLWG8M4L
	IBN1kCMnifyOv27D0Mjxkx84yDXl5fqJAZYLMusAgaapnbdidTACb7vKSwdcS4mMouMqNCLRg6k
	6qRJAwy4OpPRY0NjA7vP1iP94LEYnKhVaZhWVxou8Q==
X-Google-Smtp-Source: AGHT+IH6ScpF7u8mldxrlNnCmDDwIVQKTOZg6njtMYsTmsyEuGMk70Dk1+pUhOrMej8BfEuwJN/Jqw==
X-Received: by 2002:a05:6512:3ca5:b0:545:f90:2753 with SMTP id 2adb3069b0e04-54839147f34mr10569238e87.30.1740631084978;
        Wed, 26 Feb 2025 20:38:04 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 20:38:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 0/4] dt-bindings: display: qcom,sm8[56]50-mdss: properly document the interconnect paths
Date: Thu, 27 Feb 2025 06:37:33 +0200
Message-Id: <174063096232.3733075.9096699710834268349.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-0-3fa0bc42dd38@linaro.org>
References: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-0-3fa0bc42dd38@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 13 Feb 2025 17:27:55 +0100, Neil Armstrong wrote:
> The mdp1-mem is not supported on the SM8550 & SM8650 SoCs, so properly document
> the mdp0-mem and cpu-cfg interconnect entries.
> 
> This fixes the following errors:
> display-subsystem@ae00000: interconnects: [[200, 3, 7, 32, 1, 7]] is too short
>         from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
> display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
>         from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: display: qcom,sm8550-mdss: explicitly document mdp0-mem and cpu-cfg interconnect paths
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e05b233ae13b
[2/4] dt-bindings: display: qcom,sm8650-mdss: explicitly document mdp0-mem and cpu-cfg interconnect paths
      https://gitlab.freedesktop.org/lumag/msm/-/commit/162c57b8e7a1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

