Return-Path: <linux-arm-msm+bounces-53487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F76AA7F9C0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 11:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 608201899529
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 09:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8940F266B53;
	Tue,  8 Apr 2025 09:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AbNfU+O6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF622673A2
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 09:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104764; cv=none; b=mZl2+NOHouXB0XJl9d9DhedBvd9B+kZfAe+yVBerXp1Rp/DZu2xXX51lbCDU4aZQD6YNjcYqSOlasRQzPmQ+2OUXfBIm39jNQ87hMUdxYh44wpB758vgL49JOnIJQcDxDJm2mPcwKxANGB2lP03Q3s67nbMn+KITWyXvhouBSJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104764; c=relaxed/simple;
	bh=nKtT69qvhwRTk49MZvN2v7X4GaZFlj11oxGVqHC/0w0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nil/AbGfc6CSUUtXXH1/qrgDKG5Xl9so8c8vuM3+PW4B9uGuMa1/0LIiaTpj/hYZacQAekKQlQAFXMOgUFnf+lOL3tgIpwtimQo+GtBaISMWod0ZlS9LYsOw1/4uIP+gbWdzA6xjmMR65bfezOarcEsfOjFDBwf0IoivK34qvPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AbNfU+O6; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43eeb4e09b5so1879415e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 02:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744104761; x=1744709561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ke4i0sccmYnkzIeEfcvgwv2Qa6GTLK3zqjPfyL+K/do=;
        b=AbNfU+O6lvQ6yds9Vrm5LMilzORSvQ27FjlkU5yKXB5Jrn+CRusQ7tx1VcyoUFD6DN
         mVLyxyp74Z1X8ZkNBeJRNBQuxmqkBUYDO9AgZ+FY43HMEF/jWLLsjHnOW+v51YKmR8HY
         eTI/9p7as6DTnYtRKeapEP1F1JfTBZeWO4fczoq+oJxWZb9xjgdsJ2pXDlfciV9ZRCOB
         4OS/FffvN+84m7PPgY7bmx1C/AkbMq8rzIqnH/toUAKHEe3t4DZFwCNq6Q9aDApkxnlm
         bHB5MoJE5E9m32voROgWWnKnZG3kliyUn2r451PmzfjRyl/vNxD8MxKWiuCiYg8eGw75
         1tWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104761; x=1744709561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ke4i0sccmYnkzIeEfcvgwv2Qa6GTLK3zqjPfyL+K/do=;
        b=czy07Fim9uyF9M3m0/rjDayRe+r5zy7Q35Rv7bseU2XUscn6SC2EzoXX4O4L6Q4b+z
         f7Fed1pNpGol1mM+D3fCyI35mFXITzzEzFXp4MRHEDujbaMv2OkkigR7acfDPrAtJmJq
         RWiHA2BkJ6HVPq2pv0ww9Ag5RVp0n9HD77yJoSqlQ4MCIz8NawOgFmmOYZrZrQBeNhZa
         13ympqY0/PEGvxAb0m7iSgYiAWaBsQX8nUmajwVQxiSVy7JtlAjHpzcJomj78mdi6mPM
         I6QndxSrVhyl648ZtKlfcKOeiYAU8wD1OikFpFssK83uRrqw1e71SUQ9pIA34pzpHEzf
         d4wg==
X-Gm-Message-State: AOJu0YzvKVE4qrhri3u6zpCMase8Yl4x28P0qxVvJlkADUeoDnzvVdJr
	L2110sSbVohxe0fC1wJPPkdLyIIwQ6DSdHWRmY4HlRmgG7d2LUBUJcqTTRhvxTY=
X-Gm-Gg: ASbGnct8ZM/5LnYxbANYecAQUrAqCQcqK9yh8SvCHH3HkheP/ik7bIavYGiWB4mIL9K
	s7dDygSOsXuesfSIUAai/WVJDoHpxYVO/7qA6MKdyP7VhmKp+XrPDCOxyELhfM4XNcZ54jD8oIZ
	cdnqEhxKZS6zTnTeyANBOVzJnRosZx/QFMTAQe+gDZUw6qc70aPznn7TIARNr0B6Cmxb84lL+aA
	fC45mxbY3uv6KkeGP9H/6ZUbz2u3L2Od02XwTKhPc6uXk/YeGSo8EWZ1CX45PUVmo3TtsQFd3hn
	OUHJXtzKxONOSJ+oDYSG7QN9Ja4Gk3a3tVkxjCSIA/DjIXfkyz5L/dAqr3bpmvY=
X-Google-Smtp-Source: AGHT+IFu6McdkHFhsucQjj/v/FK75uWflBzaZ84B4oOwfaXDnBmn4UN/BCAN/YPn+GO9M/J3OJbjPQ==
X-Received: by 2002:a05:600c:3107:b0:439:9a5a:d3bb with SMTP id 5b1f17b1804b1-43ecf81d976mr54258625e9.2.1744104760926;
        Tue, 08 Apr 2025 02:32:40 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2f4sm153680085e9.19.2025.04.08.02.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:32:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 08 Apr 2025 11:32:04 +0200
Subject: [PATCH v2 07/24] arm64: dts: qcom: msm8976: Use the header with
 DSI phy clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-dts-qcom-dsi-phy-clocks-v2-7-73b482a6dd02@linaro.org>
References: <20250408-dts-qcom-dsi-phy-clocks-v2-0-73b482a6dd02@linaro.org>
In-Reply-To: <20250408-dts-qcom-dsi-phy-clocks-v2-0-73b482a6dd02@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2187;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nKtT69qvhwRTk49MZvN2v7X4GaZFlj11oxGVqHC/0w0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn9O0c7KEW6xsI8ire61ZwT1f6dnJjArEkk4tBZ
 zVgAAJrfDiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/TtHAAKCRDBN2bmhouD
 12EAD/9hE1guHJBwFmnLwtgjFyCCS2WYHdiViotnpqB7Z9MHMxZcSKaOyRDgBNi8UuQQGQryAp1
 HfLt7z/W++ppFoZqGWWoTLSbE90MSxYy0N04Knmo4nPUUVHNM51Hd0HqLvDdImsCDUHjuB0J/WX
 1njAxyG4uP+XVzPmU+zxOnB1ASBqd+vbbzkeuo7uQ4U4fB36daxeCo8G34+fLt161Ld3HbyUPRQ
 wbjBi1tVmHtBS7ClGXfI066fxVULwYwoNZMJVnMb1EHz/fxrwZnOFzawk/dm7vqz2SiKSc7PtDh
 JEwRJYUO/wJXqoKGQbf99VHgC/Gpsc3QPcxZV22DlDiNX96Df+Kz9wlL/sEBr4nrsKzDxKkuWvT
 KecD7aBZdbdpBLClq4x7CMOlnsC+hLSRaNeMUmzTNhhl2R+IJTmDutFjc58GWtovnMHyeRjdwbf
 SulhnPoWo1xN3j0X3dcbFpZgeuGSt9ffscaNhSbYDhswmelTKH+58HCdTbbEytXxzsByki5VAEw
 tB8g88p0sCfYVZhrtRErL0oRu+U0LHudMACfWLS1MCJnuaVMK6ETeujzF+yZMTBXOeq/EdlLAH5
 /3YlvQwteOoeWpZmpJhTGSee5mV4ydJmR0PLpKxeDSQYHm1DctoxX2r0NsA8rrzKAmRBTLHQ1HA
 NbSoCC4rFZskTjg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8976.dtsi | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
index d036f31dfdca162debe18ed6ed9a7767a34aced6..e2ac2fd6882fcf47e846a92d45e0fcb9beba633a 100644
--- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -6,6 +6,7 @@
  * Copyright (c) 2022, Marijn Suijten <marijn.suijten@somainline.org>
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-msm8976.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -824,10 +825,10 @@ gcc: clock-controller@1800000 {
 
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
 				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
-				 <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi0_phy 0>,
-				 <&mdss_dsi1_phy 1>,
-				 <&mdss_dsi1_phy 0>;
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>;
 			clock-names = "xo",
 				      "xo_a",
 				      "dsi0pll",
@@ -970,8 +971,8 @@ mdss_dsi0: dsi@1a94000 {
 
 				assigned-clocks = <&gcc GCC_MDSS_BYTE0_CLK_SRC>,
 						  <&gcc GCC_MDSS_PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>,
-							 <&mdss_dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				phys = <&mdss_dsi0_phy>;
 
@@ -1046,8 +1047,8 @@ mdss_dsi1: dsi@1a96000 {
 
 				assigned-clocks = <&gcc GCC_MDSS_BYTE1_CLK_SRC>,
 						  <&gcc GCC_MDSS_PCLK1_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi1_phy 0>,
-							 <&mdss_dsi1_phy 1>;
+				assigned-clock-parents = <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>;
 
 				phys = <&mdss_dsi1_phy>;
 

-- 
2.45.2


