Return-Path: <linux-arm-msm+bounces-36036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 070B99B1A40
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 20:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 861FAB21950
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 18:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E241D63C6;
	Sat, 26 Oct 2024 17:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vXgZP2q5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D991D54FA
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 17:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729965594; cv=none; b=We8u6BOQajJ56tI8dJMbNTgG3uko6gwDfgtS9S9U4zBr/J+lriECpzUug22RAgf+2A8/xzJGKAw1E7w6lDIy4xMtra6GwdbJomV1batEHOJu9c0IQg6kDLuDHmHKv4B3nYGniuZRIEZwcH9tJJrGCxcywWx7m+17UkK65wXr0uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729965594; c=relaxed/simple;
	bh=W+RGPqPnbhu9Q3x8lJkcTlZu/uDp2T0PEcID/5CYBT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qLjopLg1aK0oDm7ofYKRVRP+JYepQeFvXxReBLzTLAV21nMVrmcLEa6zJgPhSum4tRITYBZQdrjUyH4FGEi04Wpxfp9fsR4+qmiudQI8Rkmi8sKoEDKNe1qf7dHC1KdCFKecyamsNWOgWVY8matNMvZaX1XnN2Abr7ALnnPHVFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vXgZP2q5; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so28022341fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 10:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729965591; x=1730570391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ix2+YHi6Hwn7k02ZYsRrumtAZZIu1FGEvAr1ZAiI+6Y=;
        b=vXgZP2q5rcMAzuE6kJnyGR8hR9XDGLOMI9/Pq4I/8SpnIKYaWkVfzuzOnwzXnNFYMN
         n5dkHEVYOHzbJhs7sNHVR4vUszvzXpdQh/OY5eggenm8jnoJi4WsETR+KmFcbGdFr3VP
         Jf62r2066QfLcJ0dQqCguf1x89F9Cmbp/9U1tChYz00cQRnHE4YiHrkE2Nq6PyUrwAxi
         cvLqZys9Xqo2i/GJdtFFJ2kDHp1TAuIhfBZYg3gt2Itv8U3+77y9Ndan9RL0g8hVqz98
         PrDdJiPHWHamGxhLSJmXfCYjPN2X2iU6uTJXXyIpQxnG3e20cuVF6OL70jKGZgOq1B7+
         IyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729965591; x=1730570391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ix2+YHi6Hwn7k02ZYsRrumtAZZIu1FGEvAr1ZAiI+6Y=;
        b=iuZTRo2edJbzC/+/iOIzGn8a1TPwYssR5NOXdY4V9lOgiro/XRplywVLjlNw/rg3V6
         yOas5jWF+Bj1YzfuPBPpuaNnih4UJKH8zimgtw8hJAHlRaYlDcxREM9WwsFsg0lB9DWu
         Pxigh4en9qrx7jLoxOOJo3uhFZ17UWa0z4+y71o5LCraKAjkgBQTyFzPB+8ApKPObPlh
         9uA3PBgaj6gb2Lewa3xc4jSzi4fTuxcXQnjeZlRNGK+d4/m9YWlJgx3i8nDm+dSr4dYe
         Xqe9HBJw97KkLthGg51p+uafY69VAQNuq3veyyHArDmJUFF/2a/omPbeOWE8p0S7guTA
         9T5g==
X-Forwarded-Encrypted: i=1; AJvYcCU+DJfmpdPqMRTa3MSNxHzRWBzyHmwneUFk/tnZGrjceFRzmyxUpeLU8lsXipB1jVRF78VaJpdfKbXgxt3L@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Yugb7gUypK0qEEZLfnXzmf9GqxmDmJWWtrUJX0I6bJatSXOh
	DsbT8CofLlEs89Rh/4ZQshK6diCvZluxgMdgPk7Xy8LIE2lVQS4LYST0Mv7+XAk=
X-Google-Smtp-Source: AGHT+IHJENZiqkul8liw5mKMMkdYQixr2MLk7dKug07H53qh3Nesxap3BkNWKvtYQ7V/0e9vXr2p7w==
X-Received: by 2002:a05:651c:2228:b0:2fb:5a19:5b92 with SMTP id 38308e7fff4ca-2fcbe0b5efbmr10792691fa.40.1729965590716;
        Sat, 26 Oct 2024 10:59:50 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb453e53esm5970631fa.71.2024.10.26.10.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 10:59:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 26 Oct 2024 20:59:40 +0300
Subject: [PATCH v2 1/2] arm64: dts: qcom: sm8550: correct MDSS
 interconnects
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-fix-sm8x50-mdp-icc-v2-1-fd8ddf755acc@linaro.org>
References: <20241026-fix-sm8x50-mdp-icc-v2-0-fd8ddf755acc@linaro.org>
In-Reply-To: <20241026-fix-sm8x50-mdp-icc-v2-0-fd8ddf755acc@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org, 
 stable@kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1570;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=W+RGPqPnbhu9Q3x8lJkcTlZu/uDp2T0PEcID/5CYBT8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7qsnkCq4pN4vY07jQTfy5q8zGCe4SiUm9PW0GGbxFejW
 r7uk0wnozELAyMXg6yYIotPQcvUmE3JYR92TK2HGcTKBDKFgYtTACbitZH9D4eYlZRfaDrfjvKQ
 qsvNvnIXXAUbkzOS2RZ6pOy+2eUxR59nC0fDsjIJoZC3Jy93/72mtuKe1JeJahsrup+d0j+iJt7
 5741AqZRv3nlDGyNjLeveK9ZNZvdZNttesV/29x2f7+yPe35cSHmg9as+/ZdLqtnLSeYeic8dsi
 +euXIqSe7xzFP3Fk7dnpSgG74q01qf1zhhWt7GIv46do2iiQZT8/4r/xdss1Q7s+Dij6fbjl/4f
 5NfXlar/O/jjuu53gIXHl9wOfWn5wM7c9el3HzFPLcOk+dVm3MzyvYlObzcZPm8b+/vXaXz0lna
 XYJaDMqDtAp/Mm8+I2VxqlSiY3JHduuixGXf37vkMGUDAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

SM8550 lists two interconnects for the display subsystem, mdp0-mem
(between MDP and LLCC) and mdp1-mem (between LLCC and EBI, memory).
The second interconnect is a misuse. mdpN-mem paths should be used for
several outboud MDP interconnects rather than the path between LLCC and
memory. This kind of misuse can result in bandwidth underflows, possibly
degrading picture quality as the required memory bandwidth is divided
between all mdpN-mem paths (and LLCC-EBI should not be a part of such
division).

Drop the second path and use direct MDP-EBI path for mdp0-mem until we
support separate MDP-LLCC and LLCC-EBI paths.

Fixes: d7da51db5b81 ("arm64: dts: qcom: sm8550: add display hardware devices")
Cc: stable@kernel.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 9dc0ee3eb98f..cca10f9faa14 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2871,9 +2871,8 @@ mdss: display-subsystem@ae00000 {
 
 			power-domains = <&dispcc MDSS_GDSC>;
 
-			interconnects = <&mmss_noc MASTER_MDP 0 &gem_noc SLAVE_LLCC 0>,
-					<&mc_virt MASTER_LLCC 0 &mc_virt SLAVE_EBI1 0>;
-			interconnect-names = "mdp0-mem", "mdp1-mem";
+			interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "mdp0-mem";
 
 			iommus = <&apps_smmu 0x1c00 0x2>;
 

-- 
2.39.5


