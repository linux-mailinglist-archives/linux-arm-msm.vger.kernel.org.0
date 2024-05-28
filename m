Return-Path: <linux-arm-msm+bounces-20826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 569238D2629
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 22:44:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 883B31C25BC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 20:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E2B17B4E7;
	Tue, 28 May 2024 20:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zZlAzq1R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2628D17966C
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 20:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716929021; cv=none; b=N0ec5yVs6x4IbF7kg9z86V1uRcN/hcd54U8xE1yDbfSvkTK/YPXwe1tpcB4BWOLN8hH7O39KpqZwYm8GUtJW6APMoMFbNdrKRIw9ik32Ocere1spbwSHvlfm+1GDmhDyu5827OtXR6cXkPzrDXAHV9KQdkYBQtBHGP88vGoh3/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716929021; c=relaxed/simple;
	bh=fpN/sB1kdV03hmunL8ZhnuGTpWrKPaZSw7oap98ctMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F7pIiZoi7drrtEz0KAxJEUmU04hztI2KGfFYVsKNMNoAz9MlJC3WrCU61Kk/gCEnTEcAuwIxqRDzMs+tfdYy2QyjsMBdeB6Zn9VrQSpU8vw5P2TI1buugPXlLDkypZmlbNBN8fo8AvQ+cgUiD7BzyuPP5vlCc+ED0z6Mq8V26Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zZlAzq1R; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e95a7622cfso14553471fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 13:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716929016; x=1717533816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1vW2j7fTo5NMoWHmkFtlyEs04u2QSV5yhTmOY/QdIkQ=;
        b=zZlAzq1RrtFtdfBhaKVyRsX5t7ub7CU/DZy0Ai9VYOd3BFo9JyGAImskvA6Q9uZUoV
         8XrX5C5nOT7yId+sHGMwtmNjYPWI3NsT7k6G7469beKzYbjcFI+mMdiaZMCRKG+IZyjn
         i8AUS+gNNJmrpqr+YbpGdUPy4HnG83H15bILiTQ2KOhV9a5lMyU/N/oDDj6SNiBnGrwR
         DER61gRMfGfgNju2bJIEfesQsH5zPWkY/kwm5tp8Jqtcq6dlPgXalWyK23FsTNMUbclG
         3nhEWGW4Qh5uuz95Vwg9XTB1mXDu45QxETr/akY9/c5LgUuUPaSFgZ8/kp6LtAsP+7TT
         DOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716929016; x=1717533816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vW2j7fTo5NMoWHmkFtlyEs04u2QSV5yhTmOY/QdIkQ=;
        b=uwCnHlzJknMQSThwYVtCHvpxq//TyAitkN2lUxXtt/3K9h5ulfKqCsOdKb6JWAZqCC
         qW7A0j1qdfG1KvH39eoXKWRRq0Cvi+m1ygx0D2aqqeNylgvii3ZTiU0+fe5pIYrp15BV
         vgmwFXe79f73KfElrICvG+h1Hz1XFQ/Y7H41N6sLHLxdADb+EbJxQeXaGs/+sT6n5LpI
         sj7SsgwEv1M7SIHdwoyRkiZE0cMOTN9rUkXGe59jZzBpu4K6O7GHUqhhrpjGEKV38TE7
         /IHOEp2RK3rYSkBmE4etzg1PFh+UmYuEm8rb6YnQLwnY/CP7ey4CyOGaECBoxcc20F7J
         VFFQ==
X-Gm-Message-State: AOJu0YxKPyNLcXzPj6HGu796wjbmc7Bph9auvIWHb/dYhzCBckS3eItX
	uIZV5q+9v5zPWLvbjjDp0usnMkpFvuDHDUFYmQ+UxIbLVsIAlk1pTjZdhNVXvfE=
X-Google-Smtp-Source: AGHT+IEL9AzhuGLTfai+hLmqWw4PGEnzD7fFTLqG8UeScBRya/bMsCh5jGa49XTlXcK8v939pBG9Ug==
X-Received: by 2002:a05:6512:220d:b0:523:481e:9f32 with SMTP id 2adb3069b0e04-529671810bfmr11045978e87.69.1716929016384;
        Tue, 28 May 2024 13:43:36 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5297066b885sm1095493e87.127.2024.05.28.13.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 13:43:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 May 2024 23:43:20 +0300
Subject: [PATCH 02/10] dt-bindings: clock: qcom,gcc-apq8064: use
 non-power-domain version of GCC schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-qcom-gdscs-v1-2-03cf1b102a4f@linaro.org>
References: <20240528-qcom-gdscs-v1-0-03cf1b102a4f@linaro.org>
In-Reply-To: <20240528-qcom-gdscs-v1-0-03cf1b102a4f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=fpN/sB1kdV03hmunL8ZhnuGTpWrKPaZSw7oap98ctMo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVkH072OkVIH9zjHnmZOmF9rbfrcdmv631L5wl
 +26JPp2YXeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlZB9AAKCRCLPIo+Aiko
 1X/lCACf9sXQw8yS4XTvsPSnT3oHm7RsIA47ciM+Q8S2LTZL1WSXHWTYFJD2svfm/l66j49mwkW
 1iS9OMRGoYh4MbcpyNv5f8ymdn2Sw3A+fpfnGILqH+9LvewsIX9iQSPSTKOvMI7NjZIhgGS6XHC
 lpK7Fft+SaMZV7VYPPtQFwRSkVprmMHaCKwFiIQYaIoy/4qlVmFH7EK6DERNl4KOU9oH8Ov8/tA
 zUdJiBjXmJN7bYSlROtvyaak54e4FPVK4KMPLlLYd/49Ecs3ptbz9QtArihigS4q3fEokWUzWPH
 7JoBoAEusLWeVztRKbMjFKxKo5V/zNm9VWv/FLEJBJirAafu
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On APQ8064 and MSM8960 the GCC doesn't provide power domains. Switch it
to use new qcom,gcc-nopd.yaml schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
index 19211176ee0b..f06720fcb531 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
@@ -19,7 +19,7 @@ description: |
     include/dt-bindings/reset/qcom,gcc-msm8960.h
 
 allOf:
-  - $ref: qcom,gcc.yaml#
+  - $ref: qcom,gcc-nopd.yaml#
 
 properties:
   compatible:

-- 
2.39.2


