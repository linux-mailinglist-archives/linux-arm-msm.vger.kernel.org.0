Return-Path: <linux-arm-msm+bounces-46258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0130A1D76E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 14:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 274507A4DF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 13:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502D22054EF;
	Mon, 27 Jan 2025 13:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JldgJlkU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B84204F78
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 13:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737985714; cv=none; b=aPoDx6hnw+yH444ju1fS8z5NtuR0KDB+RqKCQWuV7maSLBixptmfBcwlxow98JfnY+/A6o8mB2s5GFWEMhMGiujx80P/3TywmPOo+4u1NqIU65SrubNHig41t/hfzur9MAZ7Ep0n8/t2kxPYkm7mipqOjfWBTc4EfD2Yivlf6Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737985714; c=relaxed/simple;
	bh=T8F9q6L3xxGtSl+njNnru6ExReMWCn8MciYg/Hh1kjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kjULDDUQ3B0ebUINc79qa9G+CtpRmrOPZUvn/4vTs7YgDLbYfN7BIhHb9B3Cz9FUzM5bjZDez7cItwD2hoUDCxExeZzyrNj77QJUJp3lKLCowanLtVVZc5PmULfJYPdbDXyWOFxOlsm3QB/8eR5Lsi6Ynu9zj4D271wNl5O+MXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JldgJlkU; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-436381876e2so2802145e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 05:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737985710; x=1738590510; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JXi/CyMU7iHWGF7/c/KfypBCsJz8/NJCXYKeZ5FTdwQ=;
        b=JldgJlkUrjdVDBT5W7rMPhK3PNo6q18URrFz2sUvS0QmYWLUpWj34oTUL2LUOWZb9q
         H9puOm9ZyIwyPkg5w/CpMxPWg9noj59mz4jErKuUvd02BntBQcKZE+lT7AdyxlxKJ3Rl
         DM7aGAk4R+xliQPS0vbF8Hm4FtLbbzn9f6tqrpKJ2GBpe47f9sEE9qGWHvA74FaGUrSd
         WNGmTFJYVRfDjnSdYYUntc029MYsq2bHJLYp940ZWR6beyZGVSmK6M4hM/DRbm8yB0Sx
         PXV4+Z9PHNAuX8XBZiRAa8HqWp8YpDtKQHDMiSa8YUcWMxaWB8j7OjSiv2XVzS0dpJ3q
         8b0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737985710; x=1738590510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JXi/CyMU7iHWGF7/c/KfypBCsJz8/NJCXYKeZ5FTdwQ=;
        b=ZuBLbb21RVffFjaVdIWPggh7frFfD2So8Go4M+QUnbecmsXTK68C9YeHAbKr7aHvL5
         0jtpISPbwMpE6nta3ePl+NMm/7zpQUoHhuHx92KDjGBDXoCQJxXjFV8gvRU4svkMCbnI
         5onAJkuOvP/EontLfmA1/b0AtylpT1G+QSGkBSMgvBXqkl4j0CaCLsaDPzmkXIZg11/n
         tGsTc6Ni5Mg3tSldEgRD0Xgyr/eUr6Nf7UhK+Ev6rV/6dT5kbSq30gamO0utApzQ7wKz
         ngYQxl6FN4aiFzsQzdAqM6ge7teY7kCAFbVRHSA8GnlMjJLLy5VXkHE8ZYU0pKMFnqpV
         pkDg==
X-Gm-Message-State: AOJu0YyZH09qflJc8uYTQRZIiV6ou+p/CnbjzRio4Y58uqqJhXPYT29d
	r8DlUqQaWFWd7weIIxkqVMJ53NqvTAMxF3W8+ywwbXvF8jIG/Mn1JbX329ajHmI=
X-Gm-Gg: ASbGncsj41aYHNn2ouKHFvmAD4bUOUrB7PeH6PlyecTkVf6kLp6vJ+2aFpJrn6HdrsQ
	7g68NbBwwvoZo4BOVupcWKIQiqguLm2UFRa9w7yPm3YR0bqYjjfcFanKFdWGea6nUxMRNdC95y5
	8zDLnRiAFgoEH9HiNXkZLmJHTNP+IO+n/rXW9lCgJTIu0yT4mZPi1hRSo5QjPdB0gE770VFzj9f
	Ku9uZkJ+aqXr68KBoJGm2BYasTRAKs7lnICQ8aYPEdc7aZ8ly3g0vrWGv4RadbxpsNfcyC2kdg3
	vREGtFdE7Jze8afjB0E=
X-Google-Smtp-Source: AGHT+IFmbJ7jxH0g2r/Eb8E260JnyPVAj8wzNGaiuU6T66k83KEA1UxXp1+/ZOOTTuK2/CI8ziBD5g==
X-Received: by 2002:a05:600c:1f10:b0:436:fb10:d595 with SMTP id 5b1f17b1804b1-438b1763eeemr81292315e9.1.1737985709741;
        Mon, 27 Jan 2025 05:48:29 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f292sm131038555e9.3.2025.01.27.05.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:48:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 27 Jan 2025 14:47:51 +0100
Subject: [PATCH 18/24] arm64: dts: qcom: sm6350: Use the header with DSI
 phy clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-dts-qcom-dsi-phy-clocks-v1-18-9d8ddbcb1c7f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1792;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=T8F9q6L3xxGtSl+njNnru6ExReMWCn8MciYg/Hh1kjQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnl46Pcyuxpf/bTwq33iGyggn9dUtrF5hZUBl8a
 6KTMc4ZxLSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ5eOjwAKCRDBN2bmhouD
 10BXD/9WTf8hzDiwGJQDm9Ix2Dd/Ilm1vJig+OQlOo8/uK20O45NjFQasEMw5kPXukMtjftEscr
 2iOUIZFPNTuHx7aZgfYDxWh2gXii+IIPxFMXYACmib2uocABWhUmZXe07MMVmaP2JYSYtsbVK14
 2bvSe0oYUS8RcE+BCIpsuDWU+MjgPwpTDnv0LuguURx68rN7gbjlKfAbbJtDCzfAcY5Qoylg1pf
 n7/9iszt0yKsBaLQbNlF9Gvol5ztxkYApCNwWmQA9sZZ2Fsu6a823xVczUiQsjNAhFyHNoNulC6
 rBKWfcj826t/LqQ5meHrUDAicM5mtwvp5lsHbMpy5Vm6SrH79HBgLUA+3/QQWnkWArd4yl6Fe7b
 kDUpZ+1xaKiv2g5homkKE2z+k5jJI1O3mZN/XQfy7kOvn+sj8a0KZ+gHI3PTaYAYidDsd9vt4KQ
 9+F8zkQYuXmjptY7QH4qI1taceIoZ8gFt4AC5ZyJGVXMPx8eq0c87c/JVSQplKIE2Gik/wN+m1K
 HYiPkblcYh+3GfpQNbRRdmp19M1J4A4NMYVDqyxwoYnK7rUWqzn/R0lsMc8KaYrb0GM/VB8yG5g
 sKJstYsibYvNNcD/CNXfdgMtHTie4b4RJBXgucQ8M8FTjNi6RPD5IcBDu8tIp6Ik2Byl+6TazZW
 zCNQaGgSJDc5UvQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on:
https://lore.kernel.org/all/20250127132105.107138-1-krzysztof.kozlowski@linaro.org/
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 00ad1d09a19558d9e2bc61f1a81a36d466adc88e..1f2ac20e537eca90d96f755e9c76c6c3fc7f97b1 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/clock/qcom,dispcc-sm6350.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-sm6350.h>
 #include <dt-bindings/clock/qcom,gpucc-sm6350.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
@@ -2269,7 +2270,8 @@ mdss_dsi0: dsi@ae94000 {
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&mdss_dsi_opp_table>;
 				power-domains = <&rpmhpd SM6350_MX>;
@@ -2347,8 +2349,8 @@ dispcc: clock-controller@af00000 {
 			reg = <0 0x0af00000 0 0x20000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_DISP_GPLL0_CLK>,
-				 <&mdss_dsi0_phy 0>,
-				 <&mdss_dsi0_phy 1>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
 				 <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
 				 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 			clock-names = "bi_tcxo",

-- 
2.43.0


