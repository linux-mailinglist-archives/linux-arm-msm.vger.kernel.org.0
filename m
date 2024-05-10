Return-Path: <linux-arm-msm+bounces-19695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1D48C2538
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 14:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17A69B23444
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3774A14B08C;
	Fri, 10 May 2024 12:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DUV9Yfud"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D38712CD99
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 12:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715345926; cv=none; b=pK4O1zbC/42vpp4iY6cMs1YDay/vgZ4qtA9uorflyBff50pWIGJ/gctjRIPK59htmyxR1THZKtM0kWgZUr29wQVX2G72lhN+YelDu9+V9loqZqkyNzW0RSx+G91pHZNdH6ayXnf2OQQy8rYvvCD6M6XFJiH1KcVukTylXRla9g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715345926; c=relaxed/simple;
	bh=xr4WOE90b0yFT70mlWTOrZUkB4FzmYThMvJB/hOW8og=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ItN2FT4d/+aD6yoAxULod2oVpPP1DqDWyAppHZrkgSboySZCIJsxerPoJ8f84ytKtU0HedtLz9+6vmQ6qR3MwTpJXaYxXdn1J0L2RdCy6/bo/XkBhC6ivzfzy8m16eSXxs2704+tXOKCotq8h+t97Hg39/otiTLuvz1rs/Ct190=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DUV9Yfud; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51fdc9af005so3215164e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 05:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715345923; x=1715950723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OCBtongGKMs+efoOjSpIIFMYyV9OANLuyMGYx1s4Pl8=;
        b=DUV9Yfud8E0o1IPy9ww7n1kge1KStCDFJEXjML469Yu5FTDxm0i/x7uGd+39GGQ9QZ
         T6sAX2rnzLM4Sl/tnyBgGRlSaGJXpdpKqr57G+IvDb0ZprNLj5OYhlOmTYGN2OtoA50i
         trdBpux0MNVi9ubugp2gHQyWUxIC8kts0CxBfbH0YRB72cXDErW69kUWGKxlHR1fNcES
         DHSI8lcpPwacyv7JAl7adkfhcZobWc/GCaBwme5qiZ6XYVcy3nNF/3USdrZyk6s62dIC
         2YE6D1GhYho3a6yEVJ857DuFrxP3okPGrYaVZO9UxGhb9IhG0Xs0ESGamdyOhyv/DWdL
         Y8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715345923; x=1715950723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OCBtongGKMs+efoOjSpIIFMYyV9OANLuyMGYx1s4Pl8=;
        b=IG0fbUtR+ZGds/AoJSD/7QLYR4ORFd6QtXHwdaopfDQ9yuPTTnVQqspgANSiDakcb8
         FjLnqW1Kck+Bn26ZXbbNnwAbpG7xVJiHvGzMOfIYPbD5g+H6qg8BsqSu7Rd8njUto7EV
         ayXYyhNgO08Ye6j6Y2oPaLbfjqJDhphLsQhu40Uka5tRVKNgHO5bGY/hV6FP22JZTSKg
         XFadNyRQvoYskd3DTHxxVokRYGB5DJ78jrLRYhI1YGPfVm3K/SKkAwN5huJVbCNrttPn
         zJgITQtir1kAFGEaXUCyB4M4JFPXqoy06Bwp6YyWEXKHBm4D8dvCwSicbgV8jmws3HO8
         946Q==
X-Gm-Message-State: AOJu0YzYLLZhEUFNUZpVlxsy+Ch4/NrJwCF4mZRv5Ni+ByrLbv31NMYR
	OcI66mxzYtj8qN0uOyJxVaXE9jHgWz7l5KoStU2/+muIyZvVE+vYje8FAN7qMU2kVbe1Pj0++r4
	YGDI=
X-Google-Smtp-Source: AGHT+IH+YN13W0D8aUVsryu7SpYiRt5r1DezyR4hziV4BMefqRfWNCNwspAQXdw4tb+xT2vetrmyhA==
X-Received: by 2002:ac2:4c50:0:b0:51c:d1ac:c450 with SMTP id 2adb3069b0e04-5220fc7c5camr2948565e87.10.1715345922740;
        Fri, 10 May 2024 05:58:42 -0700 (PDT)
Received: from [127.0.1.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d6bfsm181857366b.31.2024.05.10.05.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 05:58:42 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 10 May 2024 14:58:34 +0200
Subject: [PATCH 05/12] arm64: dts: qcom: sm6115: Update GPU thermal zone
 settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-topic-gpus_are_cool_now-v1-5-ababc269a438@linaro.org>
References: <20240510-topic-gpus_are_cool_now-v1-0-ababc269a438@linaro.org>
In-Reply-To: <20240510-topic-gpus_are_cool_now-v1-0-ababc269a438@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev

Lower the thresholds to something more reasonable and introduce a
passive polling delay to make sure more than one "passive" thermal point
is taken into account when throttling.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 0a0bb5310849..afa08dd0dd69 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -3323,6 +3323,8 @@ trip-point1 {
 		};
 
 		gpu-thermal {
+			polling-delay-passive = <250>;
+
 			thermal-sensors = <&tsens0 15>;
 
 			cooling-maps {
@@ -3334,13 +3336,13 @@ map0 {
 
 			trips {
 				gpu_alert0: trip-point0 {
-					temperature = <115000>;
-					hysteresis = <5000>;
+					temperature = <85000>;
+					hysteresis = <1000>;
 					type = "passive";
 				};
 
 				trip-point1 {
-					temperature = <125000>;
+					temperature = <110000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};

-- 
2.40.1


