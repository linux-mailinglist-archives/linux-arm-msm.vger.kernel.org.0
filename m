Return-Path: <linux-arm-msm+bounces-8081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B1283A310
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 08:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18BACB23857
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 07:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAE51168BC;
	Wed, 24 Jan 2024 07:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P0vSR7s9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F59D1775B
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 07:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706081831; cv=none; b=B0ruZ+ZHvg4nPIp/0iv/ePR8k45SfoVqtFttDnH7BkvyR+ab5KH45XJJ2T3PzoD1zEEJJBh07zWq8ucMQ+DVoMCpR559RUt38P3i1qfQ1VOIRsdoX7BsNzYL9gqKDicB33RM16jp3sdUoc6eoZEac7BfbHVpRhyTocNgJ9yTQ9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706081831; c=relaxed/simple;
	bh=w51HxUcd7PIFxEJ6OgE0FVVFmZ15T0vvM8776BQDfiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HCAHbBvkIR9D7vHDm0mmRNg5r6MB3yTDnv/BsaAlkVIIM1t5yyncxKJMIv2pnSoNVcsCe9q/A/pbR/TiE+gEt4TLKc4UyOQs36d9/Xnpg05PMwQtO++ulo7vTfnL3hNJxz30PBWAQWSLHH4F6MxfMmUhaa+2q5K1NBiC4gt3EGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P0vSR7s9; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d750660a0aso15087115ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 23:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706081830; x=1706686630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZuZcdUnAaZplEI/q0+jQccDNm87eHwhpTq9IdQtppg=;
        b=P0vSR7s9hNe/6eS8BWQLHtN+Ewjd5AjE0ComrDZYbeeROhPnOtuO01ki0oDu7q+X1T
         crBqjXJfsBsHqTx4Uww0PWdTxtIBGiH8nHqvL8uisvkPqdztYtTlLkRMqdSYuC5IO/b4
         thpSSvSsVgfnsmZm2ncu6U8x6MXIDYTrgI/fU/iMmsVvnyogmTepWnkmEi/V6PHa3mQF
         0Oyur5YxEz/PUFpYkyqGNNNxUni/F/mNv0y8uqByQyRHjDttpznSQY43X17Dyk/ZxX3D
         GFa7dH8V4LG4b8y0iCAYzWLVlcJ9R5bWEeRAqJTzySCSW4CfbIOrGKTf7izRAEzpPclu
         Y+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706081830; x=1706686630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZuZcdUnAaZplEI/q0+jQccDNm87eHwhpTq9IdQtppg=;
        b=LI9mGU9GRQ42GfvD90RrdYStetAbrMKXlk8YlZXuh/GP3UZsyT6cFttJO7rOq0NWIK
         BVSfTVmlqIOy6aiudg4fmXwMPmk4eDB8ervtdL04Kfr4Lsfh/ZaXMNI4olufW9Sctkt+
         B3mc6QJKGQPTYEzKqBbobfV+Sci2il9Sg2BXJpWieHixRbzvSQi/tvn3MtF2EQEu7UVx
         fERM/9gu+5mOAEwGVTByFetVLoi+ugT2qorTMKE1j3nygSGT+e1zKkJsqGjnc7k+9kWs
         yKKgrJL1XoYh+9OdBs8kWq7273A7wxSGucOm3eud+jTQJkAHMizKgQoJeWlTi0pGmQ4l
         PDfg==
X-Gm-Message-State: AOJu0YyP3KTs+fCwOwwqrFHuSllPkHr7Db/Cr/ZqINR+Ayyzyg5BPxQD
	SMwl1kICsCRjReEfVuUtttUPRT3PKKYsc6GbnJSAzkGiRwlBensZVk8V7b6EmQ==
X-Google-Smtp-Source: AGHT+IG/mhM1tXpIYDJ+QgSt5kfSy06HMtXU3+wdXvqf7yd/1q4iuQ8Li1G5PSzHd1qUO9SSeGiszQ==
X-Received: by 2002:a17:902:a9ca:b0:1d7:599d:ed25 with SMTP id b10-20020a170902a9ca00b001d7599ded25mr293175plr.39.1706081829738;
        Tue, 23 Jan 2024 23:37:09 -0800 (PST)
Received: from [127.0.1.1] ([117.217.189.109])
        by smtp.gmail.com with ESMTPSA id t3-20020a170902b20300b001d726d9f591sm7386982plr.196.2024.01.23.23.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 23:37:09 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 24 Jan 2024 13:06:33 +0530
Subject: [PATCH 05/14] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 Document missing compatible for SM8350 3x2 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240124-pcie-aux-clk-fix-v1-5-d8a4852b6ba6@linaro.org>
References: <20240124-pcie-aux-clk-fix-v1-0-d8a4852b6ba6@linaro.org>
In-Reply-To: <20240124-pcie-aux-clk-fix-v1-0-d8a4852b6ba6@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1285;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=w51HxUcd7PIFxEJ6OgE0FVVFmZ15T0vvM8776BQDfiI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBlsL4Do/rhrRxBBcGh4nzbe8uTfLLa/A6k1e8Nm
 cQmYLYOUzuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZbC+AwAKCRBVnxHm/pHO
 9WSnB/wMBNvlf+Eb1MLAZ8tHAt7hDQbZWgUDPDi2vLIc8inCjo3y79EjNMOBDVB8rvgiO6TDEkF
 TvJIRY+rMb+1aAPNL/PGpk9TQHAOUHj9jIbQEHkZf3Ff+x0HThfGIQjSEiqTqWSwFZE8p1o/Z7u
 DVsMJL4cpCICemBXdHgOZW354scZhFwG4lJevvjElux9zZ1ZP6yeme47movn5L0e8oI8FMhHg6L
 gHZCqGC+Z3AeNALkvgGj89QPtz1x69XxWUmRzRn6mvdyXsyzC6fxRhikZ5fttFyaLW3sRKrHqXb
 8fHNzR6BVRYNQcBT9Qs3tlIUuRWNVfn4Dce4+rcsM568XqXA
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Document the compatible for SM8350 PCIe Gen3 x2 lane PHY.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 2396a457f9c8..77338184cdb4 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -33,6 +33,7 @@ properties:
       - qcom,sm8250-qmp-gen3x2-pcie-phy
       - qcom,sm8250-qmp-modem-pcie-phy
       - qcom,sm8350-qmp-gen3x1-pcie-phy
+      - qcom,sm8350-qmp-gen3x2-pcie-phy
       - qcom,sm8450-qmp-gen3x1-pcie-phy
       - qcom,sm8450-qmp-gen4x2-pcie-phy
       - qcom,sm8550-qmp-gen3x2-pcie-phy
@@ -131,6 +132,7 @@ allOf:
             enum:
               - qcom,sc7280-qmp-pcie-phy
               - qcom,sm8350-qmp-gen3x1-pcie-phy
+              - qcom,sm8350-qmp-gen3x2-pcie-phy
               - qcom,sm8450-qmp-gen3x1-pcie-phy
               - qcom,sm8450-qmp-gen3x2-pcie-phy
               - qcom,sm8550-qmp-gen3x2-pcie-phy

-- 
2.25.1


