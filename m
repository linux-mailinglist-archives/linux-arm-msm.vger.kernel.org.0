Return-Path: <linux-arm-msm+bounces-18529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4BD8B1C73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 10:07:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CACE31C2104E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 08:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371F66A355;
	Thu, 25 Apr 2024 08:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zdUR7JT7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7B16D1A7
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 08:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714032449; cv=none; b=klU9kyL4lena2gC4AG7OC4qOZ1K0+3t/ibrQ8jo774PEHIokFkdJPQSmcKFF63ZfYlTLftjo3sbFZFPfyk3l5Wm36YlV3zD+7VWOD1IdOEKMJq1a0Y95ueJd4lOuRwYWa0lDRGYnVA4DyC67RuAqrE24BAzuCmMhrfNOToGoxBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714032449; c=relaxed/simple;
	bh=fc3Tt26AuhRfC8lt6Xad8GbuqDghssQi4g9bwtH5BAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ri7NImS8OvuGChcvV/u4e6Gv+PfrhCsal8VqQ0JWh4n+9p01GJ5jLAsGMJFQyfh9LwpyKwihRkyoLOgQTuMws3MjsIIByOnPFZ6w886kSZes9sl2jZleNOYv8qpvJBH4lOxKHbsd10YDBT+CEmTuJ/iuTfoH0la3y9OgA7MVMOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zdUR7JT7; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-41b5dc5e0d6so691515e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 01:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714032446; x=1714637246; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LyUoEeLBK0Y7y3XYOS3H0VfeNoTOYEFbRWEhtJbr/Mk=;
        b=zdUR7JT75ZfiSt7/6iGY2G28BVa5sQ4pmBvVlAW/B6Px3ffYz9kVb8S399PltYm2nc
         169RBOcSjaKUxj3rNeE14GdFC8jr493Rk1F80rEVmcXEwukyX+LiYaP7bjiukvPLUBDp
         hRCEtvi+dNjiMSqtt0/jdTPvdz9wOep+lUmL+QoJeH+vfjwVL/TqHEelWIGp4JZcZun3
         L0eaV/e6QM3DfXXuYgnR2CbOUKmFN/t7I9OjSGr2hMJgDAcvuCcdYLPTVcO73e57FbSm
         02eFeGKWNsJtiULBzekAVYoxtDJquI4zowhCRVd3a/toZkvTvaBXjJYVFhy3xxTF/ca1
         0/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714032446; x=1714637246;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LyUoEeLBK0Y7y3XYOS3H0VfeNoTOYEFbRWEhtJbr/Mk=;
        b=oNPZj2p3xuXOyRsNhFmU2xKCppqSE07rrYlm5WfTOAk4EuqfmS779YALeh0u7IvlD4
         dyf/89ZYyzZrP4SGsGJpv8qQTvwFAN6LwJuswevOMxQj3IEiGKzkCOllp2XfQxS0JAUt
         rpz1/Kfu+PmGBs4F6BcC6q1FHAVT21bq/EtgE65L5ixy6IVZ6PVJ79JGbMbgcNo7zpHA
         YTGREWRKbhowRpVENt8bHl2dsNd4qj1oYUb5z8KcjNYzg26ovv7Moyj4gerTIkVvqo0V
         d9HCCZUEP2HgkQYoVegkvQ1AalKrhuVG4UQVDeejYImB+u9Ybc5GX5UhaIzkhlSaRN+d
         7pRA==
X-Gm-Message-State: AOJu0YyIlhpan7riL/rmsP5yFRp2U+U9QatrLCeTJ/otC5Fdzyrhf+Oz
	D/0ckL7ay+uog4sV6YHJMRqOVaPQ/0bGHGYDX5sJ/ynVHpcWDqm5ujHQGyj53zU=
X-Google-Smtp-Source: AGHT+IFEEiaeJBP5tSVIm+XL5n2eKQ7it2z6ik/js0SokRwDh5hxpeu/0xuqugetal8Z7LDdJEEp+w==
X-Received: by 2002:a05:600c:4e94:b0:41a:f9db:88ac with SMTP id f20-20020a05600c4e9400b0041af9db88acmr3490397wmq.14.1714032445510;
        Thu, 25 Apr 2024 01:07:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id fc9-20020a05600c524900b0041ac5f19213sm8042321wmb.8.2024.04.25.01.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 01:07:20 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 25 Apr 2024 10:07:16 +0200
Subject: [PATCH] arm64: dts: qcom: sm8650-hdk: enable GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240425-topic-sm8650-upstream-hdk-gpu-v1-1-465a11af7441@linaro.org>
X-B4-Tracking: v=1; b=H4sIADMPKmYC/x3MzQpAQBAA4FfRnE2taf3kVeRgGUzCtoOUvLvN8
 bt8DygHYYU6eSDwJSr7FpGlCfRzt02MMkQDGbLGUo7H7qVHXasiN3h6PQJ3K87DgpM/kayz5Ep
 yGZUQDx94lPv/m/Z9P6yykClvAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=893;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=fc3Tt26AuhRfC8lt6Xad8GbuqDghssQi4g9bwtH5BAQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmKg81nLaJCVWiTo+CX1gaOg+Bd9umwn4yB+udmxjt
 28lnJjuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZioPNQAKCRB33NvayMhJ0ZHRD/
 4vgLKi25J8V17H0CfCxmJAa0Kyc6XpmPEeRx7qoCScAavG7Jk8NvgcNoVXxaitfTqwQJP2NVCF4c8M
 MIxvsCapRiZCRhDhQc/GQI1iEkLeLUiyax7FXbNsoE2ePeSrnoC9f3zH2d6pl/ndaMTGEi95PoZFK9
 L1SWMiU6zATMoUOmxxULYfvUjjMEHI0cqDrttZYuMTV7DjsTaQHolRApqY+WPs0oEWP/7s25kSV8nv
 xapKMMRTkWhxWnE2fCBoHswe/wrNx5KmbRLpM4ZVmV2yZVEebn6CPo48PoH/0WZVNXwVmd1DxNblKJ
 3eRYn8v/04YLZGevd0G6unwrjxzxbZCQUuIfupzesvxvxrq+6V8XEQJUOc4o1xOhDLBxLp/hkvxdb0
 MIqX/eYmkMK+n/cQw5eBgEDL0YioxJ2AUj8Ft4lfD5OG9Qbuy94SVAoXWJnqkrgWWcIIgkhvmgN5sb
 oUE99TfXfL0Nt3/IR3CzRMhFS0PLVtOZYFiNZvDfG6vIVm5mDY+2GmFxb0kARtqihucbpu2FMoBlCY
 FU5cEXqmZax/vrYo5SrxdU51NkFwUKEp0dkV4Y5o010xU0OxUhSZFEQtOiMtNAkqBgY4wBykEvW8kF
 7U6oVhiery02DePGmLkFe8GYiASfFny+ZTCYhocLFDlFFdc9qYbdAGZUntOw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add path of the GPU firmware for the SM8650-HDK board

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index 3791c36579be..7f2dbada63b5 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -836,6 +836,14 @@ &ipa {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/sm8650/gen70900_zap.mbn";
+	};
+};
+
 &lpass_tlmm {
 	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
 		pins = "gpio21";

---
base-commit: 3a01487d6106128530737d62f28c6a7833ff5ccf
change-id: 20240425-topic-sm8650-upstream-hdk-gpu-24b42b72b127

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


