Return-Path: <linux-arm-msm+bounces-11695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3212085A4F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 14:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 656C81C232B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 13:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D933CF5F;
	Mon, 19 Feb 2024 13:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hVLDPwnQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DF73C09F
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 13:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708349786; cv=none; b=lWRuJi50ITopf3guasBiRV7pu0FFTEHYHhuAumYHtbW33qOCNxNEEESENjccEuBYR5VV9B9j3DFrmaAnuwLKBw83/cw4Bh/yDEKfF4d5Is0f9hBkIDEj6ayc4AxdKB7W54Mm7wiTmcT9VCWrZUxl8GklAg41WoRMhk563VG4lrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708349786; c=relaxed/simple;
	bh=Qqtg4ojpOawwNYOqVpOvtJgi/pUtWJ369I3bzfKA0X4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E0Qix3Wx3eDreKo/ev8abxsQZNjoFXSlANSBI4bEnIWkvHpD63h6QHno2FhlDce33BU9RYPNmFTaunG2ajOEugWVDp0n2WKGOuBqnKKEpO3F8S4vJMWHvKSRXMT/9hyeGOKZgtLTPfH8zA/kWak9IV/+GPeuVrr2ppvKULBovHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hVLDPwnQ; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-512b29f82d1so1391387e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 05:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708349783; x=1708954583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lYeaGN05CrS5pFcr/tEpV5+bAgqlMkDoOULt3QF1Ggk=;
        b=hVLDPwnQZk2yW6UDBf540LepB2o7SAzdv3IAAhs+f315m2ruNaY5oo2kY+NL6pdvTY
         1zrNhzMutFQSFIczXSYX+hRE0G80b1cmO8Sm9V5gfsAnINMSYn8iTvpVKvynYrJksQHS
         Hob/YZoweIAobxcombbBod4Eh+kp1ol+VJKPUUvFELxOvXMtsb599gV3SCn6aKalOhtP
         95t/n6yIPDJ1kQ1jyOvaWBoU4q7mAlM7F7augd1FemG49Q16t5w1zzMOTh/NSP2o6BIJ
         Puv86dEFqdKAI0Z/c/yM/+ttvyKiB5Am/q6aBEe4cKvYEOYo42pYUzeDqUflVn7Gjp2K
         Zfgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708349783; x=1708954583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYeaGN05CrS5pFcr/tEpV5+bAgqlMkDoOULt3QF1Ggk=;
        b=T7TO78kQGGPmxkK6n+lGWYEUYaNY25OhGJzIFBcUnkZfxVmHyEKL5FTuRqAONIX0iZ
         0fHrAJLhYqZg4Vyk/xWV/yVeDlQsvroYH7MEnBmEa+BgZ5sk007rn2gfJrVJ9MRCwHcW
         0OcWEoKx75xRuv8YdHd0hovatPBBxoUnB7rCW7BioTPXtobgIUFtu1wVSGh7Y/X/b02m
         lZaHMZKETzCCPqCYGokCSNStdMjxLwv1tW/vvz+NHPhh29Ojz3iWapKRwN5Rv41jnCQ1
         EEo6CUAdxCSDbyp5JeacErDT/Q+hqaDxhJQx1wX2Gy84cBHxMbVI5txZKRnE/IYpmI4d
         +1DA==
X-Forwarded-Encrypted: i=1; AJvYcCXpCoctLCgQYYg9mLmP7hPAlih5ZtY4T60Wwtj5y8ju1MwceNqctu4sfKrP5tHakMVFRcf+L/ylF+ri23CPUmBVOoI2gPXevk5UE6FL0Q==
X-Gm-Message-State: AOJu0YzHkSq/Ntwkh+3EYvcQwOOF5DgH92C0K9bOcdU1k6UhkvDTLiFw
	CgOrrLmUWKsjH4P9YhjZgspZBINbp859nJeRotJ0QcIpqJbwy9JQ+MzR8jHyr/k=
X-Google-Smtp-Source: AGHT+IFrCmmRI9koWR8+2EcQASd/IAuIdf+8BxbSGOHLyOpoeNa+Y8fldaDiDE1mcZ7oQlR5RnyK8A==
X-Received: by 2002:a05:6512:e8f:b0:512:be57:6dce with SMTP id bi15-20020a0565120e8f00b00512be576dcemr701562lfb.12.1708349782988;
        Mon, 19 Feb 2024 05:36:22 -0800 (PST)
Received: from [10.167.154.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id q29-20020a50cc9d000000b00563a3ff30basm2900168edi.59.2024.02.19.05.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 05:36:22 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 19 Feb 2024 14:35:53 +0100
Subject: [PATCH 8/8] arm64: dts: qcom: qrb2210-rb1: Enable the GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240219-topic-rb1_gpu-v1-8-d260fa854707@linaro.org>
References: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708349759; l=852;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Qqtg4ojpOawwNYOqVpOvtJgi/pUtWJ369I3bzfKA0X4=;
 b=7s6b1o0Wbq+2Q9UxmDpWZcz1X+WrOuTL3z3Ndhfv4cWpB+GS8fT0yuSsDnxb4CeS4G3tVFSpH
 aC1g/6W2UwABvq/j2FmZN37rrNOb1IlvgJD1D3eP0KEN8TNjCvQO0bL
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Enable the A702 GPU (also marketed as "3D accelerator by qcom [1], lol).

[1] https://docs.qualcomm.com/bundle/publicresource/87-61720-1_REV_A_QUALCOMM_ROBOTICS_RB1_PLATFORM__QUALCOMM_QRB2210__PRODUCT_BRIEF.pdf
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 6e9dd0312adc..c9abca5a7e39 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -199,6 +199,14 @@ &gpi_dma0 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/qcm2290/a702_zap.mbn";
+	};
+};
+
 &i2c2 {
 	clock-frequency = <400000>;
 	status = "okay";

-- 
2.43.2


