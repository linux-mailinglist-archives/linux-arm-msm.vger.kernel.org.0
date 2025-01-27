Return-Path: <linux-arm-msm+bounces-46244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9848FA1D72D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 14:49:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6D797A1F0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 13:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99F6201027;
	Mon, 27 Jan 2025 13:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lWmd1LSq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13638200BB7
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 13:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737985696; cv=none; b=dJLlYWdZlS0y4bHRq1fvHPh2PDbkFI/hwfRQiU9ihPMYJNiT4SbzrN2y1XJ+fGp0wkgaOrQQCz6yZqiP8MVr2GMNu5Gzq6+CpXyLfiA3cNpwyj5+sVBWtHAM/kUTCCXFoD1+Do2V05Fk3JflIr73ITqCVMsalQGc9+E9nTdTrps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737985696; c=relaxed/simple;
	bh=zWUbLAUYpft7hbv9yMmY/s1ZO5A3FIp2EXzOJ1TgXFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rZgqiTPs3YH1/lO4bBtrunUWi6VSHOcN2v8uTKcDiNZxKEdv4nt9TxTE2xm8Wdtlov4lpM1DTIOYjdNbnlf+lS+9bZbwH8/DSL/5TRNU/2vyeghptVCZwgion7q16ZE4PEqXRSRRWJbkKLET6vzRNd595lbVHM4Tvuin8tEZTE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lWmd1LSq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361f09be37so7286815e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 05:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737985692; x=1738590492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ugABKu0ItW2Lpbs1ECvxbL95EBd7mRq6qs/bbJP0oRk=;
        b=lWmd1LSq5jSZSwTDagWaUxLUbMfN7cPgdrrtrkqU/5SKfAiKST82RNr6+AGUYkKwQf
         hr9pOlVEJxzDpkqfVtib9840Vr0DZJh9AfcUEElGkZNz2fmreceIfNJi9zAr+2GF/Q72
         JLqUHI7lVaV+6XH8A0gw8HManw8xGW6MjK/2v+suU7X2HU460YfUYaXLF7uk1+xACFGA
         qCdFUyMBdr602BcWFxy1LOHqq+XBLXXNtOC4kiaeaA3rUtGHKcZqv1DlorKUP3aenQlq
         NOl1Ol7v1ru3X/ZrlTBoamaeSokJDsmg+ovY1K8F6FBiVEdRn5pvJVN0jjOH3l0z/crr
         lFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737985692; x=1738590492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugABKu0ItW2Lpbs1ECvxbL95EBd7mRq6qs/bbJP0oRk=;
        b=bn45kIfNce6hR3Gk60mUZ/alkeEqdzlybwVrLn7oHB3GQIS/Fq9JkOlbhcIN35BanQ
         MsMFDmPyypj5Im8i5kRV1t3IEj2SMRLRUA9SWeuG6t9Tg+cpdkoFxXWatWEIpbuBJvq9
         OWHomHKDCxbavdKwuWbJc9vw4241I/lC7eZbLrsamfLAfyNSHXhUd3/kb9/Z0Yzy+PJs
         7Rsmm/TFhXEHuGnM/7PGyN6u3n98aB23E/uaVbLz4avYGB0BHMaibeiCD/n1JeMSdyPL
         yqwbGkvlcKywa5WOkCObF/4AdIjuYCeDVyAVn8nePE0E/Exz35Jrl4qvNiD1v00uw7ID
         YUrg==
X-Gm-Message-State: AOJu0YymnwCq783D4jUnyXdXBZxEYoW+Sm22JCHuJWUxAFo2XNa3Vfcg
	lGqP4xUHRYZDBOiMHOffS4l5ud7jdglzPwi45X+ABs4F8jEUhd7GVo6Y3bB8E6U+8EwPyANGcD0
	V
X-Gm-Gg: ASbGncuNqQt3KShnyOpTAZUj7e3P9+mVloSHRxiDP+TUj83i7o7AwcLtRTM0IYJmcBy
	Mb4LimYrKcyEjgzONc29VmcEP6lcJMxog3+Mzuy2eoEKvdf1+xy8xUZ4Yvv/eRc0WLwmQV/9lu8
	MH2Eo4oZ2K3HXf5bHIc0iiKDYw0Nn6YGiQcJzQ2+afAW1w5LfD0GLc3495WUqQHCmBQul81TMr5
	WCH+fAxgdQPR5n9DYeHBaUQE1iEHuwnA8KBLX/iZnAHDnnEWOhoLQW35nrEdPjXfggUC9+zj8mT
	IZqE98SirR9t/LZRSkw=
X-Google-Smtp-Source: AGHT+IFURcwVWxkrZZuEH9nTG5+V6mgWguZ7UMUGNEDvLhaTuDXejdIdMBU5y79UNKiQkHfzoOpd0A==
X-Received: by 2002:a05:600c:4fd6:b0:434:f1d5:144a with SMTP id 5b1f17b1804b1-438912d37d8mr142295605e9.0.1737985692387;
        Mon, 27 Jan 2025 05:48:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f292sm131038555e9.3.2025.01.27.05.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:48:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 27 Jan 2025 14:47:37 +0100
Subject: [PATCH 04/24] arm64: dts: qcom: msm8917: Use the header with DSI
 phy clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-dts-qcom-dsi-phy-clocks-v1-4-9d8ddbcb1c7f@linaro.org>
References: <20250127-dts-qcom-dsi-phy-clocks-v1-0-9d8ddbcb1c7f@linaro.org>
In-Reply-To: <20250127-dts-qcom-dsi-phy-clocks-v1-0-9d8ddbcb1c7f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1709;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=zWUbLAUYpft7hbv9yMmY/s1ZO5A3FIp2EXzOJ1TgXFM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnl46CwQ3qQBaqodlJow6zbkr6wu2ISgAF7O2zt
 EzVZYdYmmmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ5eOggAKCRDBN2bmhouD
 1xHRD/9KNr32DohntcbRGldHF8llr2mi7ce9s4AW2OT2bj3M3l1PwupU8QRJx5Nr9XExb3mbO71
 EfrIqc/Qk27SzJYVRoZ8r6442F5EfEpMQc6UDlnOJBOZ7JCf82b6bGKtIMn85Y08oh+h04Y9nb9
 ki632RraezT0D6D1uVfyeGhXJEd2JkSsTPll+TZKWe2yBCY/ZJivoslASJBEBVkcqlwP2o789Mh
 0cqjsrn8cIkCumK5B53DSH+zLJMSbb2I9uOONYsnrIp5+H3687RhuZgx8YJViUzgz83UFf1qDJG
 h9blvk4c4WIbJ9Gq3jFee1L5RBN+N6DVuM0sCujmE14QxHselXVffC49TMfq3lliC6k1ykcTc02
 8NZT+PgCp28qnnm/iMA0pFgFA6i+fWpfQ6qlb41x2659wYgw+vzJCm3vomUyEsXJ8F+a3t8UQVD
 idmcYt1+pwrtiqittII5ZydCFKxhZJYmnYlv8Z3Li63PrBl3CGH7TVsoI6FaqRNEd437CmubIZM
 zxKOnTLdIn7rlKvi2n8SHmRcU35E8ejiTs1YdXcU3h28PevK9X0Yd8OQgRgFkeF2KmDZ12cEwWY
 mSmdpbXFpIeMo8LyC2lvFziiu6Gmjw853nhAOR8fItyhlZ83y3D3m15aPSOBlJPZj8RkIf5/XTg
 zgu9WCQ4pcCJQkg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on:
https://lore.kernel.org/all/20250127132105.107138-1-krzysztof.kozlowski@linaro.org/

Please wait with merging till this hit mainline.
---
 arch/arm64/boot/dts/qcom/msm8917.dtsi | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8917.dtsi b/arch/arm64/boot/dts/qcom/msm8917.dtsi
index 7bf58dd0146eecdc96e29187f6dd475598669c02..dcc79b851ebfc77623e4bd16bdf939789c7c64f7 100644
--- a/arch/arm64/boot/dts/qcom/msm8917.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8917.dtsi
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-msm8917.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -961,8 +962,8 @@ gcc: clock-controller@1800000 {
 			#power-domain-cells = <1>;
 			clocks = <&xo_board>,
 				 <&sleep_clk>,
-				 <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi0_phy 0>;
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>;
 			clock-names = "xo",
 				      "sleep_clk",
 				      "dsi0pll",
@@ -1051,8 +1052,8 @@ mdss_dsi0: dsi@1a94000 {
 
 				assigned-clocks = <&gcc BYTE0_CLK_SRC>,
 						  <&gcc PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>,
-							 <&mdss_dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				clocks = <&gcc GCC_MDSS_MDP_CLK>,
 					 <&gcc GCC_MDSS_AHB_CLK>,

-- 
2.43.0


