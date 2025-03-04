Return-Path: <linux-arm-msm+bounces-50185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A83F7A4DEC9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 14:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DACD189A948
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 13:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C31205E01;
	Tue,  4 Mar 2025 13:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tZTujuxP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D027205518
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 13:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741093643; cv=none; b=HdMHxXYuzTjXWL1QLVZ0bn9/0JTVYxumYmVOrv/uZsVXLSDExJaLSHmfkH/2TvU/Qp9VMfKeZg+efxVb3MZh+YB5EOuXZy/SNHHDnYfcr0/hTerOcz/6IvPsfbbAHqN+UGpklEDxW7ChO4bQ9GfGvbpAw7MfkKw0ldljFYScCLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741093643; c=relaxed/simple;
	bh=hbTVezICqr8e2a2ELXb8vmVSM+zmKLpGBJ8kAi4wDWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cyxvKBfejC5zzFG2KwvPTc0gK6aKgmMV9ZLBTYfT7hsr/++SqE0EZ5CB7DBrFA3F89rVqtSDMTOqvDaSUlK6VChTUDnnSurP5v0sZopZD7AhWbOuvnQrUXNlPMmHKZb0chdGJ1f4HUeUokdp4gKJAdgLOkpfjuGG7VjdduPsdj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tZTujuxP; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43bc4b1603fso12867615e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 05:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741093640; x=1741698440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sMLvCT1fnTWe+fQQZYyr06r8CMaLxKRmrVcKoI1NIQ=;
        b=tZTujuxPDg2GNgl1jcs1IhE7wLC4TNKfyI0C5rE9aBY7nF7r23ql5s22CPO2b1GTIY
         1SpJ3jEtI7kG842OfqgYsFZoX6+4hErHw28dw75EtCTH7FfrjPsmqhoU6MsixhW9gcX9
         zhA3bcUHoV1p3EAEaLMMD+V77FHr4k/nTHd4f7CYyLNPoYDWajUQ0JAbjsggkExNVIIF
         tCnO+x+wRgrZOt3QptBx2igALb3RY7wk7LYCTeP9kQle831yO18y7P75VJwP7trH6vZR
         14mqh8e6Jl+b/mH6SItHvuPLT/d9H0Gok+Q7/lozlQGno8IupClXclvlvbRSoNj5k7Q0
         wobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741093640; x=1741698440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0sMLvCT1fnTWe+fQQZYyr06r8CMaLxKRmrVcKoI1NIQ=;
        b=XiZb3Nq0xEltMqk0CuWD8AW+jlCskHebra07mYbzcmNuJUZ97rTz/cFT1RBsqA5Y+6
         hyQsd8MWKz4VDExYsJv9eRYSeA1pKLkEa6Rp9sKsHCmly+qDVubYHj9Mw3ubV6eHEzOC
         fNqjlEeao7pHe+TBH7ak/2fellHoBXIf/+YM6NfIz3QsUcrdb6Ka5lat0ywWWUdUjHKl
         i2/puzScl9hsEBggYS7/Z/6F/FKsturNiBC67pgteKQxZNJlYqc4thRrsxQLysejF6xH
         Go3FUho+hO4greu6NH458s2ftlxLZEWxTJJhFgMBSMQhBlk573VqpDZ0nJOsbg/JEr8X
         m0uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE8XC54NpY6OCdp0D2P9gBTcTDj6dV4EHYl7O3m2sbb/OIb+wjWoWJf7J+8vnhA/YSZzsi/lHe7ESE2iLV@vger.kernel.org
X-Gm-Message-State: AOJu0YwZAEmBZKu0a2A+RIpDPwS/zLgZWog/Z16C/X/YEg/BrAlWrmuB
	2lwHMzGpD/ZzUV4yVR5Q7CbpxCfuIUjGIv63kWfD7ZFamCSjH2LTpVUaTQOYbGs=
X-Gm-Gg: ASbGncunC2iivktHkRYVTLK/3aBiSaQGAD+kQoDD3wjE/Fcg5gA6aVl4UylVYbjBzvU
	6ErOAxhNTMTmCaNEUA294Zvju3SduloHkNWRDkQNFHixE3hhCawSm7CR398pkjtlA4Y9iygufpV
	a2BDdYj2xXGiZMeR1uNw9hX8J/qVXOr4teCTAZ6L/YkFwXNgKjvYrAr0hTCtZFWqGMMGWohqRlj
	qL4E5VKPz/Q0lOebzhWzu0D4ireiKY9Pj/KyJ8UfdJ4l21ywDVpdbeFkqCI88RugbLN79VUI4IB
	d3J/m5+uvcukG5aPLuaNmr7JfRAT9nOsirBHSjyEIVI1/iA0JBnf8qHAWdtXiJEjGGfApcMPTtR
	RMQ240Q==
X-Google-Smtp-Source: AGHT+IG7Hqk+59fncwqRhoiQZI0qgVNSHDtmwiVCCcb9ZVYfhmFpPhJTWaXXdGtM/0s4DaDuW44HFQ==
X-Received: by 2002:a05:6000:1789:b0:391:ab2:9e80 with SMTP id ffacd0b85a97d-3910ab2a206mr6605504f8f.24.1741093639862;
        Tue, 04 Mar 2025 05:07:19 -0800 (PST)
Received: from [127.0.1.1] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b6cd8sm17401715f8f.44.2025.03.04.05.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 05:07:19 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 04 Mar 2025 13:07:14 +0000
Subject: [PATCH 8/8] arm64: dts: qcom: sc8280xp-x13s: Enable Venus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-8-279c7ea55493@linaro.org>
References: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
In-Reply-To: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15-dev-33ea6

From: Konrad Dybcio <konradybcio@kernel.org>

Enable Venus and point the driver to the correct firmware file.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index f3190f408f4b2..d4c53845eebb7 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -1477,6 +1477,11 @@ &vamacro {
 	status = "okay";
 };
 
+&venus {
+	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcvss8280.mbn";
+	status = "okay";
+};
+
 &wsamacro {
 	status = "okay";
 };

-- 
2.47.2


