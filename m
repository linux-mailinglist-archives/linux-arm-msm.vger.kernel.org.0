Return-Path: <linux-arm-msm+bounces-18926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 669058B7043
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 12:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9A93B21568
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 10:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1184B12D201;
	Tue, 30 Apr 2024 10:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWOJJOhC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6556B12CDBE;
	Tue, 30 Apr 2024 10:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714473857; cv=none; b=r4j8GZ27i0f33D8bC4b5jJhrJPUTa1BNtUAtiun2VY/xlIO5NN9l5BySYeMcaMYVEyKWxaPxbNSdu7ArSEJZ0xLAPcAKIe5cAy5FKj6tWuvRTQo19HU90DdTGm4vJDLUsOIyyjfTVhyuvkQ1k3MPv/HYuAESB4FCP5SIIshQLl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714473857; c=relaxed/simple;
	bh=HdWAhjQ4Ivj20LLc1l3rIJf0eWqfBf5t1jj2qSpI0Qs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hBV3bEFdZqnXvPsaWe/wOS18BkrgeVidwIpeGK5k3Yyg6MWhsr5w0TpDZSJ/AwlXsS0cBU3dSyBR/bk63VQ+RzP2ql3tEOPoi91miVdn2OASqcr3QACG0NCjUZjtdwMwCOI/hkl58o5Dk4G+7/Kb9HntZEm8RuXFqsGti7S+yeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWOJJOhC; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-34d7a32bdd3so415468f8f.0;
        Tue, 30 Apr 2024 03:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714473854; x=1715078654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wHg7UtYU1KMEjXYLs7aZhgbiXDVGh+SnHXlklvKuJBI=;
        b=eWOJJOhC40zB3mhFAQoOU+0S39hvASc6m0sPwz+4Su+Nr/txx6RBmZITLq6EYWio7L
         BULvsimaytuGGvWEZLXVuO6pFRWqvhD9D8CGy0t9zKX3jhxNmCGg7IVybBqRAPwaC9nZ
         KwTRA1zOWL/9jqLiXKZ8sBH9UEZ3iXU+FfBwppl2QoYB33GBujQbvdE8/jB4mEHnVLVY
         XP/Cof20qb8b1MfGgq/oCTpZdZBZtVm/7rUVp3h7T1YhYNeD1blqenkDlsH/Vs1y9h6i
         J9ax8H7iHiG/x2YFH68Aa5IH3nDDYT5zecjKHsF5lcEM7HCOnQPcwyuqdhHs5FUXYyMB
         f2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714473854; x=1715078654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHg7UtYU1KMEjXYLs7aZhgbiXDVGh+SnHXlklvKuJBI=;
        b=uhJZlLngALHzGIoGlCsOPo6ie15peMCkbpz9F/x/K2IM51r+73fZRjcNdeknjt0YEy
         LoueHZwnkhTjVzY9FryGXp2kGfQRA/JEIOCN6YW7UQNVnt7Dc4RSlbQIYYc3unDKRzDA
         Sxkt1ZbvBuHv8pZbkLWIWlCB/xD8JQ0AMdQ7w9vK98lq6/kpFha/YiqkAGTajD8p1HJV
         2RaqKsq5TU5k1CESmiX9ZjkTv4kEIAysUob8rFgp5FGPlvtkbPhkOGQOvTpAvkjZBRCv
         H/HUCBeZMpYivnTWhwmNal6ZtANDPJ7uavGgP95aLxQhfyzE9rv01C9i+mb/aoqQF4qg
         hUTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcPUiFGPZ5Lt/gx/kcsIf5vB7sLCTRMhZgllMMmrcK8YD1zzf3vjbS+Jbtex8+3obLxCbpqg1aLh/8K+nxwwnw/9ZVQPBS4Al5BQ==
X-Gm-Message-State: AOJu0Yy8wT6UCtYg2OQajeaoZxeDRC/26tTLx8t6oqyN7mgxAFvLarVz
	uQBKzzkG70ECwCqfcc8joh2kgADqAlgG+78GjW8FSDYKBvGTnHaa
X-Google-Smtp-Source: AGHT+IHTWKARXtM+OX30Ny91ja/jEBv3AnBIxeDt+3L3eLSW3k5m3ejus6fyMafMYPFEJVEb94bHLQ==
X-Received: by 2002:a5d:6c6a:0:b0:34d:b45:9b33 with SMTP id r10-20020a5d6c6a000000b0034d0b459b33mr5006036wrz.52.1714473852859;
        Tue, 30 Apr 2024 03:44:12 -0700 (PDT)
Received: from [192.168.0.20] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id p8-20020a5d48c8000000b0034af40b2efdsm23595951wrs.108.2024.04.30.03.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 03:44:12 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 30 Apr 2024 11:43:15 +0100
Subject: [PATCH v3 1/6] arm64: dts: qcom: sm8650: Fix GPU cx_mem size
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-a750-raytracing-v3-1-7f57c5ac082d@gmail.com>
References: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com>
In-Reply-To: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714473850; l=1032;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=HdWAhjQ4Ivj20LLc1l3rIJf0eWqfBf5t1jj2qSpI0Qs=;
 b=uqOrau62L/MfHeD5TX92TkT+xOevf/c/Yi4elm/DQW1IHtSszoYJpU80NmvEDFBiFwqgvpNzT
 ru8WS1Ozt+MD8t4lnszsEdOAc8twvwEJ260RmG9Jd4qSSb/yCy/K/ah
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

This is doubled compared to previous GPUs. We can't access the new
SW_FUSE_VALUE register without this.

Fixes: db33633b05c0 ("arm64: dts: qcom: sm8650: add GPU nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 658ad2b41c5a..78b8944eaab2 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2607,7 +2607,7 @@ tcsr: clock-controller@1fc0000 {
 		gpu: gpu@3d00000 {
 			compatible = "qcom,adreno-43051401", "qcom,adreno";
 			reg = <0x0 0x03d00000 0x0 0x40000>,
-			      <0x0 0x03d9e000 0x0 0x1000>,
+			      <0x0 0x03d9e000 0x0 0x2000>,
 			      <0x0 0x03d61000 0x0 0x800>;
 			reg-names = "kgsl_3d0_reg_memory",
 				    "cx_mem",

-- 
2.31.1


