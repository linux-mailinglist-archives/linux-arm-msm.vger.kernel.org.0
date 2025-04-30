Return-Path: <linux-arm-msm+bounces-56269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E75AA4C99
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 15:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 225CA1BA4725
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 13:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA3725D8F6;
	Wed, 30 Apr 2025 13:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WsxZh5oY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA50725B1E0
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 13:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018075; cv=none; b=YHiffel50+zsI0WFoqr0TdHSLjRigGmRhP+S3J5ClX0QA5GwZNC7TSoLyK8g+8rep/aGGecB/v4ETXonNpglRs/FEB0sNWtMwjgExdXilClDSUQWd9XlNHZiHFZuwt5GB+vBxaV5zCswilhN25tgmOSA7KsLuQZcbi5GlSw3eIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018075; c=relaxed/simple;
	bh=h4KR3WnX0MpzZeRbCF4d1eyLafzyThDf4gmxGutr8Tw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dzj8uQ/WBZArraUhOWOU+iaiFzuR5Ncbj0F+S5e08IXUIL2jSQytofIudkor36CaM4UthkqykpYAUwPmjCPDXg6MuKm1M1V6C7/kSQa2yJY4nqbPhhGO3Zjgb+gtz/c2/nc3I6Cn3Fn5Ok2x5p3Ms4FAmv+z4fVjlouhCDOgNdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WsxZh5oY; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c2688e2bbso483571f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 06:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746018070; x=1746622870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F6gCmCTf9fhJeLeRlyqxE/da/koMwMWDALPPwEDJzQU=;
        b=WsxZh5oYQhq1dhBdIC0Becji6anhwT73REU1JZ6G0aWEBHZjZJDL1YtWs7XeOBsrbD
         tdVj9eW/ldxTBBkjzBpFMICGoTI6soeP/VMaWmzX5O1pfcsWS4Fu8cRU7oQ3p96hVbj+
         cLPc/SxUVGUlIMU950zi8LOMWDdY5f950h0sZFI11tSfLIh/MaIa08c6C4LF9t/QUPb2
         mLaNZy/Qk1M2EBRkPfk6mlgr9PR9StFVFl3LEfp0YSjPmgNKaW6frqDlIoz6wmAVWkjA
         lA69GPZnY+AmmLebJkbL5Rdc2KI7fei0+8TibK0zxxPRma3DsvAsrToLQtUH8ol5ptcX
         YSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018070; x=1746622870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6gCmCTf9fhJeLeRlyqxE/da/koMwMWDALPPwEDJzQU=;
        b=GnOboyjw3AmypT+H1owaJGxs952VSpZuuHYLp8kD/yHjgFAYbEDXu1OoReWCPeaRF5
         fVRjWgjkSlzs0/27HzXKIKGPNYnsv44SfB9VTNBA3+CdWZZz0xhAIrL9tUNghM2ycdpO
         RCCZlVutIwOk8y/uIaI71tke0m5VXJUXhtdIPKibXm+ePHuBlxbdRhDSrHt6BbJBcKQD
         aKKdTdT2YYIpSfLy/wi2Z80AsRX6WMYBpduV4m74sv97TwMUdVIrHdYFBhvn/fWY3ePY
         8Ub9gmvRLS8dlmRQpQd0a8FPn7LTM4QPLjaeDvZwk1jMtpxzQ3NBSMbgW0I8t7ydZbw5
         MbgQ==
X-Gm-Message-State: AOJu0YyUdsu0gyseilAB6NBBi50+SoOjeKtO/hqAyJZ7hjqCMtIbDiKi
	PULRCFfQmhuPIaiKg1dVpzcYAVdjRrThseYNw+HWnApM78hlfryzVCeMBLh+O70=
X-Gm-Gg: ASbGnctMPBVb+CNSAzWjipRn+t38C9MDVZ18ZW25F/dUkOxfSs0FaJ35Vz762q0H0Np
	Xv2EBMlfBb47dyVN05Uj1zH6qtqJi/rT1PwK97qD7QuV9oB+jP/bRY8zuf2OhYviSdI0XFJafQg
	RhdoU3teFzo0yit7qbFO0shQC7knZ/xBbUwHWc9aOZAibibjmgfji7xJ8MvXFbkz83id9AYA8py
	RpXbjFnmItPtmCHrQf5fSOL6/YLv6/UAkOUfquQmZtwtQridtA2KU5xx66o7RjsrE7IqJ/+vREz
	kdwl0Ox5VnUYCxYAceKDzsxZ8TZN9LeAWfXrV+fNSgoTaM6B2sb7bBiL0dU=
X-Google-Smtp-Source: AGHT+IEVgUlmrLBnvxqbwa/LUtoMOM3hDEY1L7MbBEMnMdxIfLiTgCeXpDac1Fk21Uc5r+CcXiaKsg==
X-Received: by 2002:a5d:64a3:0:b0:3a0:7d47:8d7e with SMTP id ffacd0b85a97d-3a08ff7216dmr710931f8f.8.1746018069194;
        Wed, 30 Apr 2025 06:01:09 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:01:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:31 +0200
Subject: [PATCH v5 01/24] dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-1-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=918;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=h4KR3WnX0MpzZeRbCF4d1eyLafzyThDf4gmxGutr8Tw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh7zKshEp4Q5qZHFef+w5ypkEzUmWV7dVpRJZ
 ewDM8XJrw+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIe8wAKCRDBN2bmhouD
 1z71EACbQ2OraW+4hnjm9Npk2+TB5ZWYJCsNSLyybCHA5phKCLlCGfHFgtY62sFOaFj/RU4ew5n
 xyP3rTZO73eGfUICcmPUFTtlQD9C58INJxLSrYwXXE6MXx/HCE/pkjwC5n6jO4iZrv2UshJbiK1
 i7rznCiMAUPiH35rDDhWG/PCaGfQjsGB2pkgL05axN5RUDqvs7owv9o7aJPGkm9vF2jkWu6xpCn
 //2jfRn6N3RJI8xCsH262B+7hpU1gqkTv8tvRVARpIph+fnqtRIl/UgAwJD16TfWUO/ESa97t5U
 Fq0AJChbIEtWGIv0CSheWLDVkGlGeYt/dFpBfM1Dc1YPXcPq1TiFybcCGHWsPEbnZUpCF0l2Uk5
 bmAb+vlIOlJFzQOPQbl8en+XxBz2tNIWLy07aINr0SyxGXY+9iGXj668LBCUxA6b/sa2v/F/WsT
 el9tAU+N8Kcr/lLTri1EN5A8bnvyKvW8971lbI3JxrN4pJChWeIPlgAw94VFYDmK6+qqpMe9GTv
 /sJcc35uAQDfbnJZM3t3UAxRDQGBQU8DOcwMa2pthlck9xds3XNBAPlo3ep5BciZayeoKNpQKJ4
 GoH73cOa+Md7U2TxqEls0p9VxxgUMgnGX2seqfJPcOb3ximzCf8eTr2CjgeJilIumv+WBA/phIM
 jcwslAE4AOUFjnw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add DSI PHY v7.0 for Qualcomm SM8750 SoC which is quite different from
previous (SM8650) generation.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 321470435e654f1d569fc54f6a810e3f70fb168c..4ac262d3feb1293c65633f3b804b4f34c518400c 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -23,6 +23,7 @@ properties:
       - qcom,sm8450-dsi-phy-5nm
       - qcom,sm8550-dsi-phy-4nm
       - qcom,sm8650-dsi-phy-4nm
+      - qcom,sm8750-dsi-phy-3nm
 
   reg:
     items:

-- 
2.45.2


