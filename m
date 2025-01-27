Return-Path: <linux-arm-msm+bounces-46254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74259A1D751
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 14:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C85163A3715
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 13:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40CFD204694;
	Mon, 27 Jan 2025 13:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qWN6L6e7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761212040A4
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 13:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737985709; cv=none; b=sPgMI+43CVd/BUVJal5OhyS0aSvvhI0/C4cSM/XP6xoB4kMtJT+YVS1tx7YgPRtdA3L9daFYKlA4NW7MTjmxVjdKBb/sf8zWSiHVJMssLcDg3lvUVd5aPeKTjBKPG3i4rMa5RQHfK4PBjBMFNDgZ3isZ6h3yA45j6U+ma1yCiLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737985709; c=relaxed/simple;
	bh=A4jh4RbBNIgIXMFXvk6TkDFlCVLpy+TudNDtmBl7nR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TcsDFmYOUFgmHJ5s4c1w6YK3SlXCaMJ+ZgCG5AIzEcB6sZzLQGORtfrfdXr0d0A3dYlKrMxZmPnfd7/HhkLeWP+jmFUSDtzUyAJ0iJki5AfOBkHcdJqeEIbBvcZU4e2SKtLx+H+JR6upFJl7HqZcnEfB+jjeYNgFuRD059A8LLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qWN6L6e7; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361aa6e517so7278945e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 05:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737985705; x=1738590505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxDkLiT1iuiEy0XM63c5gTLyzgBblv7vcY5wp6/QN5Y=;
        b=qWN6L6e7s3H+lAn0YxJTbQaoETY6rsIC2TmSdac/8IyYcs0Ji6MNNZ4/ouuH9yomFS
         EvhG/kTjWhNUP/fmITAx1a2kAv/juvbpjtD8CT/cc2RhPiyg+bFxWogz8HfjjFxu0Jcf
         BRQ9r8JyUgMpVejYMdRxZneH82QbLzSKOCtoxq5T382ocLpXTREByQweiyPwdJGnbSr4
         SV0gYPfaCXmSWQVvPqJRl0tpY9PA4UblMFnvIpCs0HcRn2SBluYJ9xVie2YxvlXCO+Ik
         nrdVVuT5eGtNTFdjvPJ2P5H9qQ6NTkwQMKxkA0dwDnavhc8eYVR63D8bbKkwy4ZaG4n+
         8gYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737985705; x=1738590505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AxDkLiT1iuiEy0XM63c5gTLyzgBblv7vcY5wp6/QN5Y=;
        b=CbuPBuSpsmcG7I4lCGKerNwHSyB/hzqdM50/WU6Ak1gyjqlVuuddnDVARRMA5ZmMIt
         Ii7qObz6+N2BOouQdNZiRaH9uwfj7Z9jEHfm+lfc35OPwKerekx7iv36sKVPDgJacHPc
         2n+Q6PgR1Kg5OKKVarltyWOYdIirijz74gfn5INunWmGyCqfND0w4mIYKXLUuNOXrKPe
         fBFLrumMEUfyOpLUixeSK9UOjf9gl0JZRW9nWghinCcRxgt3SoeWvAGRaCkPxDmR7pA0
         kBNd9nDBx3mXrhsMrmw3Ac70ushOaFEHfswG5wkWFYctndeCIPd5nPwXpC5EAAEVvBO9
         /OAQ==
X-Gm-Message-State: AOJu0YyjI2qczzFNSu/f9qAeGghJHOu5yDbfwBbfgOGkybgaaTULNMJQ
	5kXu2U7dniqel+ODZyP7TdiamKxCB4NjMa+C0D8rvMJL4tSrL4Bg96vJmtVGaFk=
X-Gm-Gg: ASbGncuXEHha7AWA8wEiy4FvFybe3fRA2Qn0U3MMhfldn5T6PyMv13IkRN0whpr/Paz
	HbWbuRUv8m3Y7sJi6yIECL+S3KBkDZhapylloFA5KkiKBoAbuh1OCSRBShDUQSD0KnHWuLZGt6O
	8e4b6xVVI+59sj/L5nhMZ5u1owj5cgHJENllRq+B2TYnyb/9bK31yTODdrGY7LYOE+z0eTV8GG0
	1bgDg9diSbblhY+akqPooVuzGD+5IJ5DAEir0W8aSyJ6cQAHklAZvF3vegp2+xGHFUDTubgBXV1
	u+FzYb+RRgqw8zVahzQ=
X-Google-Smtp-Source: AGHT+IEE7kfq3MD73carBdFcpanLvRlHkJKr/C2qCxdpw5CF5NDuBrt4IQodaGF40XhqlFAWwtLWKw==
X-Received: by 2002:a05:600c:1d07:b0:436:17f4:9b3d with SMTP id 5b1f17b1804b1-4389141cda7mr141184745e9.4.1737985704822;
        Mon, 27 Jan 2025 05:48:24 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f292sm131038555e9.3.2025.01.27.05.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:48:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 27 Jan 2025 14:47:47 +0100
Subject: [PATCH 14/24] arm64: dts: qcom: sdm670: Use the header with DSI
 phy clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-dts-qcom-dsi-phy-clocks-v1-14-9d8ddbcb1c7f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2351;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=A4jh4RbBNIgIXMFXvk6TkDFlCVLpy+TudNDtmBl7nR8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnl46Ld44uolfric/6wlKBJ+FAn7k0ixIKsQMv1
 bINY4kGhKaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ5eOiwAKCRDBN2bmhouD
 1xzjD/4kiCUqB9FYfBF4sS2uXF/knF1uLQJa81H1eJZyYOxY2riA0ZeXBU5dcOUcyjx0p93Hrwt
 /MuEtf2/QwCvyMES+ph4/kRFhS7zgA7B9LVLIGqX1pW1jGp8YNAV7Hj3lxT7C8zc2vtG9MbV8dD
 8FLynf0dGe6MKqP0b5OjsTZcxhVkJBSkSxQK/lE88ZF5OZ5c32QU+3WMIFRtiNQVFf3kgY+q6mW
 yfOSPohnS3+jcurKnGoN7jof/qFSZS25uQTOblFuMwwU18pIKQkjqjnZH5e8u7mx7SGYr9o0Uch
 y+q+XtXWpulclzNK9kTYgBBIj4M8tJsqYiUackrXlWn3AikZF/OGJHcaOcmlBQskL8lyf5Sz1Th
 1lFPfQNYi79Ng8ZY/WChiNEGJKorE/Ui1jB4KXDZGl8YjiZIVAQeXeMYfHjeoruZsWN25uW8evg
 jy587bEhx4wvTBYqqW6AumIyE+dujyG/VUWxDh5Q7VCf5WqpNlHn4hd3cVcOnNSulGClG+Hynq0
 ugxACTeyiA97CYgR49wST0Ju5HRej5cQwGg0MGn0SHwb8+iRHU//frkjs/4m7tk1BqLGKDYTwGD
 xKeGN/TlkXfEbP7mtlV10LlxUYQboEn1hpYHIUZLUNkhHMQelDyWCD+Nk6zVNGMrVkNhRg/w5aO
 tXtiIQWb2gh3mxQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on:
https://lore.kernel.org/all/20250127132105.107138-1-krzysztof.kozlowski@linaro.org/
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 279e62ec5433af70c0a7c594f2c5241800b465cf..a68ef6741f8d4f875a8897493c9f903e8ed3734e 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -7,6 +7,7 @@
  */
 
 #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-sdm845.h>
 #include <dt-bindings/clock/qcom,gpucc-sdm845.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
@@ -1720,8 +1721,8 @@ mdss_dsi0: dsi@ae94000 {
 					      "bus";
 				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>,
-							 <&mdss_dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SDM670_CX>;
@@ -1794,7 +1795,8 @@ mdss_dsi1: dsi@ae96000 {
 					      "bus";
 				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>;
+				assigned-clock-parents = <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SDM670_CX>;
@@ -1851,10 +1853,10 @@ dispcc: clock-controller@af00000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
 				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
-				 <&mdss_dsi0_phy 0>,
-				 <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi1_phy 0>,
-				 <&mdss_dsi1_phy 1>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
 				 <0>,
 				 <0>;
 			clock-names = "bi_tcxo",

-- 
2.43.0


