Return-Path: <linux-arm-msm+bounces-32658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5059C988284
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 12:32:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CD14282C1C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 10:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14501891BA;
	Fri, 27 Sep 2024 10:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PGVNDkIL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D2215FD16
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Sep 2024 10:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727433139; cv=none; b=f5HndSiy/4i/yZwdWuj7FLElfXok/M3UD0t9OnvP+Xepql9h4sVXrwPIkyFH6zmKa3H8AOj2/LXjPOE0MCNv0aCi0jNZcA7WDsnyeycx8zvu9R1uSaaF9K2AGFEqDX6h25Xp6EusyjxUs5b3OeKGzV0W3kHnCqc43cHNaHc6il4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727433139; c=relaxed/simple;
	bh=VpBNp249YzpZXC9Rky5huhq6sb6/jAcrlMwbud4eelw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b/KFOjyGYZmMH48aR2+h7kklTFa/UoKfHrSf/oG2Ijie9s14uvTRmkNdWodiI3uTscNpWKHhllq2J9ZpPNijGixb/YOfFjYvl0q11JXQ2+vYCWFONm5VoMDwcgqVyyDCaaJ6V8XVufcaSeBChgFmkegvCiASiaEbSl+E8lZtyKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PGVNDkIL; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f8c439bc1dso1202591fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Sep 2024 03:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727433136; x=1728037936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OrSvEBMT63eFKBOH/M9CK7Cc9dzPCKyHIsn8PR3V8co=;
        b=PGVNDkILwM8JGOC4US6aEYRU1JRSuX682QuDqca4HbFhaKfonBQgjkdqGnzp84B6lk
         Sv4vqXVNhZDF+QhXMC3iIRLmFYPHWmQbru2SoZ0IrETAGr4dsIIOtrQ8d5w6QzwPVpH0
         Jl6P+1c4horo/TWfMdsL1LxrIlzVkAOtc8JyHujCOaMFqnFw7AvMwHfpe0gerkUrKa+/
         olGHz4RFWweGzmaqkOf56KQhUe024yShNSXsjmSLmEnGzkM9g0EmwVxDIZqWmuG/drE5
         2cdUq1mkeXH7gLLyNW3A1Qc3Jhh+qqM7jeiVSQO3ogHtpIX38uolhpXTQloK288/wr4b
         rq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727433136; x=1728037936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OrSvEBMT63eFKBOH/M9CK7Cc9dzPCKyHIsn8PR3V8co=;
        b=AOO7X3a81E2XYs4g8+CsT/QFH+JJfvlVbEfqQXIN+WSrtrUZPrLIX0vkq8xGAySuoJ
         55g7C4OF7x+wq7mT4MyECNPsmreKRtBkzxpl6O1HLGLj1X0cJ3JqWBJh1HHBFWCRtXTL
         TolllSrm40f9WZNiFbHDyf8h2QbZr4YVMd9x0nijAQ0JgZ+LnFJj5pbv8YFCAaoKalhJ
         vHrrTJ1ovdKflR4em7mcqBjNQQTg02QWzchfhpQNJbELf1sDzyPVCXu7Maxsl2aOVBH3
         K1pkVb/GxNsVCdHZlmbMn78Lz0i1zFM1WlO5eaNXaJb8D7p1pXSzZ0XvMoBN78wa4QXw
         T4NA==
X-Forwarded-Encrypted: i=1; AJvYcCVbBmnpYyAx41WXjjIfovJ3cbGh5XI+i9UQ/QNu5XeutX6msEWNxb/s0TgjIvbp2gXEHTEq0j8kDV7TYzcz@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb4Y4GorpdqvzINDyrK1opOmyrCF+vviD6hzCy1/1uMBnGDq88
	4AfgvfWNYOeWjU35E7QvL5I/Hf2GfmXbFuW82dd5WJXBRQsa7SJ3GtS0y3VbSv4=
X-Google-Smtp-Source: AGHT+IGcdmN2CX08WxP43TGUcVs80qumV8LOKvPfnAtO/+6Y5H5nrPaYJjWrIlkM9WODMBJ1MMd2rg==
X-Received: by 2002:a05:651c:54c:b0:2f7:5c23:98fd with SMTP id 38308e7fff4ca-2f9d41c1bc0mr5341211fa.12.1727433136151;
        Fri, 27 Sep 2024 03:32:16 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5389fd5e333sm259724e87.76.2024.09.27.03.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 03:32:14 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/3] arm: qcom: sm8550: Change camcc power domain from  MMCX to MXC
Date: Fri, 27 Sep 2024 13:32:09 +0300
Message-ID: <20240927103212.4154273-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The problem is trivial to reproduce and the fix is trivial to verify,
it's sufficient to enable SM8550 camera clock controller and a CCI
controller, for instance on SM8550-QRD CCI0 or CCI1 can be enabled:

    &cci0 {
	status = "okay";
    };

I made a special effort to check that the power domain in SM8550 camcc
is sufficient to be replaced, and Titan and other provided GDSCs can
be turned on/off, if the clock controller is disconneced from MMCX and
MMCX is off according to /sys/kernel/debug/pm_genpd/pm_genpd_summary.

Vladimir Zapolskiy (3):
  arm64: dts: qcom: sm8550: Change camcc power domain from MMCX to MXC
  dt-bindings: clock: qcom,sm8450-camcc: do not restrict power domain to MMCX
  dt-bindings: clock: qcom,sm8450-camcc: generalize title and description

 .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml      | 8 ++++----
 arch/arm64/boot/dts/qcom/sm8550.dtsi                      | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)


base-commit: 11a299a7933e03c83818b431e6a1c53ad387423d
-- 
2.45.2


