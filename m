Return-Path: <linux-arm-msm+bounces-11156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CA0855DD0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 10:21:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 011811F2B91E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 09:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CACD21BC30;
	Thu, 15 Feb 2024 09:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aZUjHMiP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E0D1B815
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 09:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707988841; cv=none; b=ZeL+RmLMh+GdBo1sW/PsV8XidatxdfXqnTKNgjh4kLpGEtf1hG68o0gneXKWQ4V7Nm6ZwI2UjQkV/TnM67C7kgfATgijPPIjZD5xAvEFNs+KYC8ma/iG9Mj8W7MQGfIm+lnlkosk3WFHvBXMIzsnfEkUR8oFWq0uPrQDlpmawwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707988841; c=relaxed/simple;
	bh=eK619A8Ja/rJOcWssIzBbWM6D0kuHt0880KvRuYuMKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i8PXNP0k442RBx+n7kJPP3boz5VRXSdhEHW323X/wl48fLbc0DR/bnT5zutQoNG7497T0efmsNU8Ll8xE9JxbAD0BcYxxrsnRoLZsLwBFUoi9WKSazdMAy9TMKemXDIZaUTSrJvK23DOze245PVHaBSALYlS6tbfqIY4yi8pgfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aZUjHMiP; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-41211acfcfcso3870395e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 01:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707988838; x=1708593638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M4VUVivuxhBItwCnLx0xGdHQH3tLZmkPnVy151EVhso=;
        b=aZUjHMiP++lWCKRStAIBEX/Yog2Uxl9v/fsfVM/oR/Bhidn5hGe/1nfu74cbxc9zZU
         5JIuT+KuCF9hHhDYEY5p6fuMUnvwmLN20xHBFO244HCo7gwG6rrmPUY2Y61bX3b55UQ0
         pk0445Kcc091Cjme6+GrV11AsYC3IojTi03+CJyngHUCrxDZSvbkzmTXWQ3SJsTFPcaz
         CPuT5ry6mH3empq/FwrPkBNHYaEkvxASO4I8yYsEZh6L38NoG83DdihTb3P1nH8eV3T3
         PjbaXWYTt47YptiiB1pAYF09oxJ81JCxLukluGB3ReumUFCDE7UIX2gNICLRw/804k2+
         P45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707988838; x=1708593638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4VUVivuxhBItwCnLx0xGdHQH3tLZmkPnVy151EVhso=;
        b=drcVUebOEENDNh79rQF+PxgKMZtF3JnnCm11hGO9daF8fYpNsf0NPX3uiFt6X6HFUr
         j7Wne5oV4rD8bndjJ+HiiZV3WbrjVtxwdNodCG9yq6oBt5348n4hoTOvv0JXboCo51j6
         hoq9dtQ51HU9ZFHMrZfaddatRqkyZabmhifD5coOKIqPKbEqsXhIOf2s98zMO4B0dg5y
         vlRmomuS1qqpaDXuJmbNueDq3MKcc78qH74du8NrBI8X88BMap+Vb/qCXYMBybeGp10h
         Lhex0YmdaBpX0yLn0qVVgxyeZuXCHTQZ8LgVcgHssgv0DNdrg8Kw5o6FXecSHrg9h2WX
         5H2Q==
X-Gm-Message-State: AOJu0YxxxUc14mN2uDahUBeWSWuwXioNF4uqGG3bMCCbhepxU2y9ahl7
	bHC3RpAoBBps4Tw4NTNpW1EEZN1lCtb6GodvZuqSoTagUXlsczpT26hEXpQUfic=
X-Google-Smtp-Source: AGHT+IFXVVQ/uxEk2n2UTx3FliemDL2HGwWD3N47dVkf/bJsy8vsKAGapR4cnCOAJNCWIz4P+M5s3A==
X-Received: by 2002:a05:600c:310c:b0:40f:bd81:e738 with SMTP id g12-20020a05600c310c00b0040fbd81e738mr956462wmo.29.1707988838302;
        Thu, 15 Feb 2024 01:20:38 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id l8-20020adfa388000000b0033b66c2d61esm1156435wrb.48.2024.02.15.01.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 01:20:37 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 15 Feb 2024 10:20:28 +0100
Subject: [PATCH v2 6/6] arm64: dts: qcom: sm8650-qrd: enable GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240215-topic-sm8650-gpu-v2-6-6be0b4bf2e09@linaro.org>
References: <20240215-topic-sm8650-gpu-v2-0-6be0b4bf2e09@linaro.org>
In-Reply-To: <20240215-topic-sm8650-gpu-v2-0-6be0b4bf2e09@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=771;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=eK619A8Ja/rJOcWssIzBbWM6D0kuHt0880KvRuYuMKM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlzddcVOTYaWXhqXz7CR0Hulwvc1BGcUEkmWvV2LSR
 NKZ9k7WJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZc3XXAAKCRB33NvayMhJ0eCAD/
 sGA6LkVKECsn38P5DH+wqPkMbxKjQP2fox10vCL1kOfmXAKY/TaOdQkclGH3g5hLpEOBA6CGarOlrU
 2kLTIui0bQVTUNKVtHdGewsVaGpZN5nCMv4Wdkg49nAZcS24QNPFFOf+L1AJtcLGM/F9lCH/J+89qv
 NgItVT649rOPF27s7wX1fSsFPZINwwsNY67B1I2bxKAEJC4I/nkTUPYnfwHlE0cGXTnlmPRJ+pVDhQ
 LHR0O0YnsS3Le9JGqEPyXxgjuil1IgUbKHiIa1/1uebw+aeeovJWnvsnFlMFhLltxJN8rTRFsa0Ht5
 vrqvc6TRjKwunCDjeQXaNsI4s9UQUA1bH1rQW7S9uji5sNURGP8FBNaYvbaLOmWkZLaJIFeXxNdjlt
 MvQ+TLWxwVU0/rsUG7j0qWlaN+i5zCEL+LVpY/Ewy/ENXU24l2iJYdNqRcvwg8WU1m7ryjIzBLPt7O
 +j1wfBYW/j+LCzrMonIWxtC+EOZW075OCV8Tdn90s97iADzC1nPKs4R4igTsm5H9/c20PVBejk3lep
 tjFjyda0GmKOGOYLxHSriW32Jacwk8nqT7Rd31uwmS+91HwYTCdiCzgxC/kYx+qUvHnIznYLeq0r9f
 Kv1VFYO/ReEoD5Dx+S0CnoWDPQO4CpB6v5J2zsqYVi+s2F/zjKwonhjw+XEA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add path of the GPU firmware for the SM8650-QRD board

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index b07cac2e5bc8..dc91f0bf4b8c 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -766,6 +766,14 @@ &ipa {
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

-- 
2.34.1


