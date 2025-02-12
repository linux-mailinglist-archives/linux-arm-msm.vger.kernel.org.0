Return-Path: <linux-arm-msm+bounces-47792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5D6A32CCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 18:05:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AC52188B9E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 17:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A8325C70F;
	Wed, 12 Feb 2025 17:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fplOecLa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACA125A2D3
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 17:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739379859; cv=none; b=b6rK2Cl2FtJOMJ2W9b31r9FAnjuA05OWEIV42LLTe03j4bY6WQQLZTyvRSuo8WmqR48ZUfJdPlosewBim6IERk+MU+WTQTIqL5JwhNX8CQUhcsDSast8Wjr6bY5ktmxdM7UXkLy3584Y/jfryBCp4RbXaT25BwcD+el1JiC1Oqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739379859; c=relaxed/simple;
	bh=sItJi983hvl01AxWCTmMFX7g70a0Fg4QZpXz/Tz/yyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C1bformVZHJh6uAHa6E7Ow3vsEk8Nex/FlUrnD+QAL2no+TovFaTCcs6WXaHTKgq95wFiI6CYwx8BoDxsfFNO9UXLRc5HNH2ZZwuEQ8nH5pQ/pCxoyEuPYvf+QjrhHBrNQiS1h8bB38JTdCXCwY7EPnTnj8SUO+dx8ks+oii6bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fplOecLa; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so10076448a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 09:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739379856; x=1739984656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6w5okXU2Yu7jFnBUo43BoM84SGqbG4jaCw++xQVChE=;
        b=fplOecLazFKo5bPFXcwrIqQPAKwTv/hZFpxZ3qpbztC1+19mMbHK2yFc9WbbDYe6ET
         nVv2e+6D9DuF8iYMYSAxCSn/+K7FkrhohfbI8R1ZB09JmdhREq+uNQG6asRfeB5jYh/R
         J+/O33zB22fnrkfnKzU0nYNvaA4t5FsRiE7uN6r2KtUFu6E5ep0JGhidgUksXKaX3ooF
         +6HzAoeAOFLQ0qAFQ8YyuRiHkQTRm496czah6qCk9eTAO8m8wW1gI4sW4WJr1RwIP3Gx
         Sd3sHqk/+hdVd6wIigKkkemT2eCMZZfsWf5jPlJ6LBsfXRPK/k3/hJMUk3yD2IN/i7aP
         HHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739379856; x=1739984656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S6w5okXU2Yu7jFnBUo43BoM84SGqbG4jaCw++xQVChE=;
        b=RcPK5+i+2S7drsyHIxSUKTHYOqFI602AKGD0LUWEVU3gDPKh/wEoMQkZRtlYsBnhq1
         Ov1mN9qNwN+RlW3JxQ4tXylG2RK69wa3SY2Cb1M99m+ArWoU3HFcmg9wIbMLz+FFB3bz
         +UZ6BgWvTMguKM2Ni+rRXDqz92FnWF+9RbuDbJpzRe4EwwqbzRFkdsAuZsP3OtCZTeBY
         gBbFuFBj2Dls/ds4YjBAxqEZfktt3CiQXKL9dmu/1tV7HwZTqsCXskfIlKN5/TKM8mX7
         tnEcZKdjK2kUbIKvkB0LUsRrCLwKgdsRaMng+d29kvSitg2NGYYp1knD67VMxdCT/EWl
         uzdw==
X-Forwarded-Encrypted: i=1; AJvYcCXb+z9CEH7mdIM2CgHI1aTlXY679WLnMmxWMFqDeWWibjvnFx639s4fHXwaxYyZ/ivLRV7X/y317do3fxQ4@vger.kernel.org
X-Gm-Message-State: AOJu0YxiPmisatsZtdud3nodeg8LO3JHQd6sdhmkY14zGsBcqNnxVgbp
	nCQozWY68jQzYWf8j6wrFyUkLbjB2R5YwfuRGHehgsy+DjGFaV6/gtoWDZQ+1Jo=
X-Gm-Gg: ASbGncuqRpHOXJ5tHrunOtqeFzPkLqkh5c6Qgr0duuUJl6hJHg+bjlcOqvIpyIoBL3O
	VtXIjDLGEgDeR8lXAY/X6CMVZHVzEsSDwzCern/FQ4XCxgKHuCMbSfXNg/Q5kk6rVB7ZqL27wqE
	e0Wc0rfTlULj7US0AZkV7RDojNhZchqcdH+9b3ip2U4LMFp0hWGoSeNFHOwbIDf0uZKtO3Ms4bI
	BdELz5D+qg5k5Ubw+ZxYyrxlaz10B9aznTR5NLWK3oTs8iwtWlMgteLtrTnJZtfYHgiXk9nVsNS
	LWwNDVJdSfrL06xEN4AX8dAoNm4x
X-Google-Smtp-Source: AGHT+IEABcOOIELXz+JFdeOSsPBTKQScoxzR7QmtBueg1gF7h6+a32NeKWZuRnmzY2n57dt66bqjMQ==
X-Received: by 2002:a05:6402:26cf:b0:5de:42f5:817b with SMTP id 4fb4d7f45d1cf-5deade15403mr3357122a12.31.1739379854662;
        Wed, 12 Feb 2025 09:04:14 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:52e8:f77:3aca:520e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5deb9f6e46bsm819230a12.71.2025.02.12.09.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:04:14 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 12 Feb 2025 18:03:48 +0100
Subject: [PATCH 2/8] arm64: dts: qcom: sm8450: Add missing properties for
 cryptobam
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-bam-dma-fixes-v1-2-f560889e65d8@linaro.org>
References: <20250212-bam-dma-fixes-v1-0-f560889e65d8@linaro.org>
In-Reply-To: <20250212-bam-dma-fixes-v1-0-f560889e65d8@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Yuvaraj Ranganathan <quic_yrangana@quicinc.com>, 
 Anusha Rao <quic_anusha@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

num-channels and qcom,num-ees are required for BAM nodes without clock,
because the driver cannot ensure the hardware is powered on when trying to
obtain the information from the hardware registers. Specifying the node
without these properties is unsafe and has caused early boot crashes for
other SoCs before [1, 2].

Add the missing information from the hardware registers to ensure the
driver can probe successfully without causing crashes.

[1]: https://lore.kernel.org/r/CY01EKQVWE36.B9X5TDXAREPF@fairphone.com/
[2]: https://lore.kernel.org/r/20230626145959.646747-1-krzysztof.kozlowski@linaro.org/

Cc: stable@vger.kernel.org
Fixes: b92b0d2f7582 ("arm64: dts: qcom: sm8450: add crypto nodes")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 9c809fc5fa45a98ff5441a0b6809931588897243..419df72cd04b0c328756fdc484f4e46b6c325412 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -5283,6 +5283,8 @@ cryptobam: dma-controller@1dc4000 {
 			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
 			#dma-cells = <1>;
 			qcom,ee = <0>;
+			qcom,num-ees = <4>;
+			num-channels = <16>;
 			qcom,controlled-remotely;
 			iommus = <&apps_smmu 0x584 0x11>,
 				 <&apps_smmu 0x588 0x0>,

-- 
2.47.2


