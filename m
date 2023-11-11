Return-Path: <linux-arm-msm+bounces-504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E6D7E8BB0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 17:42:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF228280EE1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 16:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7713D19BD0;
	Sat, 11 Nov 2023 16:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EqOSH7uA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D6814A84
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 16:42:39 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F141DD54
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 08:42:37 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c5071165d5so7704301fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 08:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699720956; x=1700325756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ArNDVIi+I4WcQ+l8h9DJ1wx6t4xBoPH7FgGqFbtahBs=;
        b=EqOSH7uAB+hLrc6VdJ7wgp+6CCavpxYjWRrNCvJG8LMFXcHWVi8uAdO2QFoTerj3ed
         WUnYOxMMPUzNnkfaeLsedq2lrnJyavHsvKAD8Ww3c02gxHBK98Q8THYez5v7WUe6IDxl
         wUyBk2F78jJF9a7t/j72o1jmJFjGDEmmk0ZW1SAdSxhNbmt9bcQjfA4vc36oVMMkJDhJ
         ZQnlrQkgpKJv6AXAhrCQQG2Jx5saxEIv4OjLrK4JkQeLOwVZrsZsXPhg4kwHI67ZZmEA
         Gpy3AUNDY4xHE+S/ujcpWtWSksv6JT6v3tK9XVOTPWbX+2FMAIG8mo1I7ypT4reGFH3r
         TAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699720956; x=1700325756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ArNDVIi+I4WcQ+l8h9DJ1wx6t4xBoPH7FgGqFbtahBs=;
        b=e74BYyViTpsGtnh8aTeDgWRJt9/in9iYUSi8hlLbgW9JBVwXAMxi5LeaBkVssxqXD/
         bJYfws9U7wtsHiIl39tcefsyA01boRESahzwHkwKJA+C9kijGr0dV+q/L+QFPptgXzbz
         8qQMdmPdZQOjcLeetPGw8WbD+a66YZ73JXy0j1BN6C6PfRW0WDAOSQ2O0qvacIjYQwsA
         9gZguLcX0za1oQ+1WhcA1am3XPVu4z2vhjmlMnxpqdqNwoTac91VFVHx9ffy2NvJQYpu
         3zhbxK/Xdu6GgyfhbKWNSIXGnoaeUN+FAzR4IqgDi7+o9ClWFFQ4C8Ou7gExVQbu1DXp
         ziaw==
X-Gm-Message-State: AOJu0YznUnor8F3M8PCcQx0abklWJUjv/2iPVoVvGDm/61CSIpapmAjc
	RzWNtoPXrBn+A2BEcKTEXDc3wQ==
X-Google-Smtp-Source: AGHT+IF+At48VBZ+wvrVPfmY34DhAOWVE5MBtQWhRwaMnvz02bNtk/Gq7LFsSjO8UFsQGfcOXZT9tQ==
X-Received: by 2002:a05:6512:3ca5:b0:509:8a47:3672 with SMTP id h37-20020a0565123ca500b005098a473672mr1394287lfv.34.1699720956174;
        Sat, 11 Nov 2023 08:42:36 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id k25-20020aa7c059000000b0053dd8898f75sm1161917edo.81.2023.11.11.08.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 08:42:35 -0800 (PST)
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
Subject: [PATCH 3/6] arm64: dts: qcom: sm8150: use 'gpios' suffix for PCI GPIOs
Date: Sat, 11 Nov 2023 17:42:26 +0100
Message-Id: <20231111164229.63803-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231111164229.63803-1-krzysztof.kozlowski@linaro.org>
References: <20231111164229.63803-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linux handles both versions, but bindings expect GPIO properties to
have 'gpios' suffix instead of 'gpio':

  sa8155p-adp.dtb: pci@1c00000: Unevaluated properties are not allowed ('perst-gpio' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index e39de6596a1e..9bcdc485c73a 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1878,7 +1878,7 @@ pcie0: pci@1c00000 {
 			phys = <&pcie0_phy>;
 			phy-names = "pciephy";
 
-			perst-gpio = <&tlmm 35 GPIO_ACTIVE_HIGH>;
+			perst-gpios = <&tlmm 35 GPIO_ACTIVE_HIGH>;
 			enable-gpio = <&tlmm 37 GPIO_ACTIVE_HIGH>;
 
 			pinctrl-names = "default";
@@ -1972,7 +1972,7 @@ pcie1: pci@1c08000 {
 			phys = <&pcie1_phy>;
 			phy-names = "pciephy";
 
-			perst-gpio = <&tlmm 102 GPIO_ACTIVE_HIGH>;
+			perst-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
 			enable-gpio = <&tlmm 104 GPIO_ACTIVE_HIGH>;
 
 			pinctrl-names = "default";
-- 
2.34.1


