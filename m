Return-Path: <linux-arm-msm+bounces-52-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF0D7E39E6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 11:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCD8E280EDA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 10:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E9FCA69;
	Tue,  7 Nov 2023 10:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DySTqw1o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B0028E29
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 10:35:47 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 181CA99
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 02:35:46 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9dbb3d12aefso799575666b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 02:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699353344; x=1699958144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zkKRn9nghMmuE3432di/HrZ3jPO+EnQVaOT7ILYUMGE=;
        b=DySTqw1oH4L8CxUNXzEYI69y2IpeHVSWWyppXdu2iWnJ7pUYwquPpqYe4YY7kZlDXG
         fr2Q9ttTdXbikQ0gHNB/zvvDSRarS48rINUV4MUB2tAMGkMCPwwohs+4X0+ywhSwr0gJ
         iZKlqCXxC0lw/z+t9ocM9chbUN6eAPYQ2Rbv4pUEy/uyXfNfu6NGz9CHJ1cRmuKuzqXx
         rMuOPak1NB2FYHO50aCZBFA8iFNmH545A2iH1lIB7bJVAF5C2SETF7vlMtqYKl7fe+IW
         jIpvaPSuuIXYA+e4dzu6kVcjFWW6nNVRMD03Az/m/aKCMmdC3MOurZqqjdgCjklGMdji
         EXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699353344; x=1699958144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zkKRn9nghMmuE3432di/HrZ3jPO+EnQVaOT7ILYUMGE=;
        b=sZm3GJX0nppUqKMKeiU3jcMlABWaweXPNHBch+IASX1Znh7e3f4pBKWDEQ0IBaXqeu
         PbTAGpAiLKhNCFQwHVFXCdeYO9CeEs6jSNWEdSnRkJpgigLMXpBHMkv3B/XVt3Fcsfv0
         tU9AksgGWauVmTRQmAJG5VOPQmAu7EQ1lJyJMvSylslAqNgt4PEaHUtLYH/d6BYFEEpF
         vxLwvaJt/5YRjxgzVHf0dCURZ55IfwNiHxWoQLUwys/uzSPXExvmGYmvcrWRfOuCE4ul
         oT8BuWi1hfqJJdyXFxwcBw8MwMcSyHZTW1PIIYZdaDDi4+B9D8vGxYFjUOLrwQi0afrR
         665g==
X-Gm-Message-State: AOJu0YwziNtGLdFQ9R+Zbk22q7LmHKHh5u9tqob9gJ19L+dSs7JSinQx
	FFKDqxh2VhjTmZ/c7ZB2OH6L2A==
X-Google-Smtp-Source: AGHT+IGbq1apWVW+o6Ak/B4q0Y8orYYZgw7fYmEJLabNmjpjG6BX1jMi4mVWmlF/VW0RoFwzxrjn6w==
X-Received: by 2002:a17:906:c141:b0:9dd:82b4:4221 with SMTP id dp1-20020a170906c14100b009dd82b44221mr9050148ejc.2.1699353344574;
        Tue, 07 Nov 2023 02:35:44 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u21-20020a17090626d500b0099bd86f9248sm882998ejc.63.2023.11.07.02.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:35:44 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] arm64: dts: qcom: sc8180x-primus: drop sound-dai-cells from eDisplayPort
Date: Tue,  7 Nov 2023 11:35:38 +0100
Message-Id: <20231107103540.27353-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm MDSS Embedded DisplayPort bindings do not allow
sound-dai-cells:

  sc8180x-primus.dtb: displayport-controller@ae9a000: #sound-dai-cells: False schema does not allow [[0]]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index a34f438ef2d9..73d9e8039e32 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -3117,8 +3117,6 @@ mdss_edp: displayport-controller@ae9a000 {
 				phys = <&edp_phy>;
 				phy-names = "dp";
 
-				#sound-dai-cells = <0>;
-
 				operating-points-v2 = <&edp_opp_table>;
 				power-domains = <&rpmhpd SC8180X_MMCX>;
 
-- 
2.34.1


