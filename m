Return-Path: <linux-arm-msm+bounces-76144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE95ABBFFFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 04:04:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5C843C2771
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 02:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57DD720E032;
	Tue,  7 Oct 2025 02:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dTrVQHHi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597541E5B7B
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 02:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759802623; cv=none; b=qW4LgsA3C5G9CzvXcimHvbD8CmfqHZctXhYl8ruHa5wmytD/hR00v77SlMBRWN6cczOpwk0rGctTf2oRMnLtKMmdayM54Gc4hALnKNfk3D0EDJRrihcnO1gLdz3OBpED7j8AyRGtUGIyrzdiDkCXpKMA8a74qnKXdKV9UOWkwk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759802623; c=relaxed/simple;
	bh=VXDNFmwIX3pmm1RNqu8UxbDnHVOaIoAOH+SdXHl9U1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rseXurHpgh7zyo4dtVA8BTaswm1uNSkdUg8yiSoJMZQXuv/MBRs/nKiw2NW/oPmROTKKByvN7cThUIMG4aIe31GIvPdpvSjwLHM/Fo2ep5TudeNwulitce6D41xI2nFp4niDV+AKD99F3r1vOkjTnVkZ3s3lQqKIlWAblwnhqGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dTrVQHHi; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-36d77de259bso47435961fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 19:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759802620; x=1760407420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UvT/TglfcrWJfggrZckfEyOiFactKbMJClmt0smjuQk=;
        b=dTrVQHHiskmU1+WanWHVh0yrdEMpONRRJqppy9QgL+HHJ2c7GbPffxHtKcpVyir89u
         jUVgH07ehuiCGxHsp4prwU+Qpdrp8SRiJHcXYSSfJ4N4YgeOsbKvQV/0q8oTRpM8Qsdn
         9IAKEvFLWVZFcBbcd3YQ7QqZ5/xGzBryVbdBo+AUAkZ61TYDt1nbBT0Y+pdvlORCWfX/
         hkFShCUSvasyWZW3aFR/jYV1kw2p5DbRLT9wl/ZfiCbvlMj404mVWPSOG2hFlDoDy3vg
         Je6IL6wEv11fzvBph9ia1QM3WduLo1XibdeYXSd9ZbXklRFu1JfPflqHnjFnEQSi0qQ3
         r1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759802620; x=1760407420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UvT/TglfcrWJfggrZckfEyOiFactKbMJClmt0smjuQk=;
        b=KXNuVTOUTJT2kOW/jl3SGiG/KEVD72GYGKZrXGTB/LJI4wLkfFdlWwoxWf1Y/vX6ss
         0rBmZs37eOyXnk7l/px7G7Wu9PmbdsEDTbU9M4T+mDN319FU1gEBnaa9AFA/g4NMty2N
         ngNzt361bVqwETXRYEEZnKOqjSy3I+pu5cYvJ80nF+ezAKpQ4+ZjDEU0XL1PkA/rlGb5
         rmpCXEK5iHy9BJTmxYbH283hL/Z4Gq7nuhszaozckd7N8gV7twETttWQVaDlzUNP41Zl
         mxYsX3mzrY/eSLz/jbqgaOI5fUJ4DVvCvaPyowEQehvY/xy3mSZbgJ33fIVHroFfBVRI
         7TKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmXJxRGKhkvyhz7N708+JPugbTuio34QZCxVNXPMOwCC4CpJELG1ub/ZSzx6B2R5Q0XUo9SjIS8kkte+ll@vger.kernel.org
X-Gm-Message-State: AOJu0YyFc8AN7Cy2L2jbsUEsJwmJowheP8+Zcp2w4+ytisphbni+NINo
	jM7nq1CB9MoOpiwlPXqF0+NczpVpjCXPrR9JBGD6DS/yAMyCDGtWQEuw45WTWLLQdRhoperFmmQ
	JDvGV
X-Gm-Gg: ASbGnctWKA37umK+pOf51VDKNOsuE03JEDwp4acNNCyjA6bC2gCUztksZB0znBIe+de
	QQ24OBBLGEPmfV9TVbpgOhUaEvlwrrWpV5YqC9l6PWhRO4K09W23U/cJaB+trn7D1N0gHDoQW5p
	7YypJVc5TmFtOheF8rT/zNVGBcCOtYUnfz4wtCHRTMaP18x5qlPIn5p783eyd24r2mSndI5qkrF
	wBgMLIeAamGO/+e6qJ9PYhnDsPdTxIvKUjlLR2v8UsrB/KLEy0qjlr4LDHMCzrbZaPxGCRss55t
	WzTr/eY/Kmfr04wXnIomyfFX/EZ9d7MYs28ZSrcCj0Fgo+7acMJZ/MKWArEGektz1gVgs2OWkMV
	yWbPGcTpV8pG3D+hMSm6sOBJ8p9yHfg1e1DIPPyLncEHLueavRk+eHkm+ql1lM4miwTs=
X-Google-Smtp-Source: AGHT+IE6kE+08lGifMlbSFxL63V0GVp/y1UlrRZI3ChDCaIR4Mc4TOIHRtBHsz2zClThQzzpsuDRMQ==
X-Received: by 2002:a05:651c:1992:b0:372:9992:1b0 with SMTP id 38308e7fff4ca-374c3823058mr35559001fa.31.1759802619600;
        Mon, 06 Oct 2025 19:03:39 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:22ae:baa0:7d1a:8c1f])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3b81e45sm5150391fa.46.2025.10.06.19.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 19:03:38 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 07 Oct 2025 03:03:29 +0100
Subject: [PATCH v2 1/4] dt-bindings: pinctrl: qcom,sm6115-lpass-lpi: add
 QCM2290 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-rb1_hdmi_audio-v2-1-821b6a705e4c@linaro.org>
References: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
In-Reply-To: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

Add a compatible for the LPASS LPI pin controller on QCM2290. It seems
to be compatible with sm6115 LPASS pinctrl.

Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml           | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml
index f4cf2ce86fcd425b7522918442de25c836bf24f0..ec1cd684753ad22050ae349a2e7acbb2545a9070 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml
@@ -16,7 +16,13 @@ description:
 
 properties:
   compatible:
-    const: qcom,sm6115-lpass-lpi-pinctrl
+    oneOf:
+      - enum:
+          - qcom,sm6115-lpass-lpi-pinctrl
+      - items:
+          - enum:
+              - qcom,qcm2290-lpass-lpi-pinctrl
+          - const: qcom,sm6115-lpass-lpi-pinctrl
 
   reg:
     items:

-- 
2.47.3


