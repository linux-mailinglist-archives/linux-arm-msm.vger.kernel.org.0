Return-Path: <linux-arm-msm+bounces-46241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00533A1D721
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 14:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B3893A1327
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 13:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209DC1FFC65;
	Mon, 27 Jan 2025 13:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FcOtoimq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA1A1FF7D4
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 13:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737985691; cv=none; b=WRBeHLLKYkF4dRyQGGcJCY6i57DyyJ+j+lYOpR9dtiPJ3GAxdZNHd/jVt2STNw9eMsd7ft5RVUDzX8QYW6s/FMqJbft8XscQSxXdpyyUbEWBqFzZw9vFtQdGDNTXCRYRLNEyXe2euiwb/QahPr5SQrkeBIn9/NX60N6pKwVDSOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737985691; c=relaxed/simple;
	bh=UfENSiU1Z1EiZp0xMPahrQJ1WrLZ3y4ZDLqWk7VnnG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WUFUCxXqkMgVykDG+JgZq+KNkjGJZBUH1gR6AwCbu+kTsNs2kXmHnxa4S/spUd2lUMPnOpNAOvNOQVxz0VW5VkFTGbcn24m1CdbBFFAFAViSaAmSj9AQBl5lva4eYbhMebzr8kqye6y9xvSyI3tzIPligr/cEwPpkImQB7QGeSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FcOtoimq; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436381876e2so2801555e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 05:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737985687; x=1738590487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GWZdyuqhtVX8cKa3rZC6C9ew4qGleoXt2cULJLHpLsk=;
        b=FcOtoimqJfrAW1zqfR/KDdPep6TIu0wblalAoYO8nrHVDhMq5IXBf1GpbSTU1+7qLm
         gDQ6x1jeLa5IDGJjxj3icZJNdC/Im/UWlHbdkvjSQsuhxmsMOBcMRqmNeYTSlXS+UX6F
         qnvxPV1S3v7MX6P+iete1wnw50ieOFU4ukb1Lx2LvlZdKWcd/cDCAclMqzaDgx5eNwoV
         J4L0b5LhA5FG+f/PzOtfE3Dv6wX1AOt6RlodeCSiJ8iSjsksONGGc2wE17CTgQTA3B/g
         NM7zp8RJejTv2wgQQonwFZKpWw6kaUZGxBkM9/NsTDRmQyczztGytOrBm7tDes1FTpOf
         z2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737985687; x=1738590487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GWZdyuqhtVX8cKa3rZC6C9ew4qGleoXt2cULJLHpLsk=;
        b=IPuZis3M/Z40AXln80837aFdfczYolXmrj24WR/JVkoC11/O3e9lKnU8vzc03qxMAA
         NXn1soJVMCpMr1bKmIfgMSIRW75+9oJgpuPzooTz+h4ULK1REYNy+kk4IQLnhyiKuTCC
         GsrYITneUi/xTa8iOosX1yrlI11GJYo52/KJfQAxWbbGNsAWRXG3WFRc8Zxzv6qu3fEq
         Be/yT6JWuZKLRtxEjOSy2dk5hUmYWIKj0w9XPWedS6/KWW+d0kN6aukefHMaqWlF3qe9
         r+zClH3G9ekX90vylLHYWxzUayTWtko+7zAOYlhg9wHWf/Qwp5RfMCAKJekxrjpalG01
         aLEw==
X-Gm-Message-State: AOJu0YwM5EEYg0e4Eh0ewbiCxNsJ7qEZ7aTDktNqXsOompalrQ0t46qR
	aRKAxydXZIJTyj6lpBOPrVQIsbgf4010aED4NNSIWp6AKMHSSbetO/RpoWtvj+aUDDT9qiGqSgs
	t
X-Gm-Gg: ASbGncvM9z4cdyfZDxlTrE5jTfaLqAv/WcK5jIubry6aO5Kqd/ksgAredZSc5E4d3jk
	kpEMsSTOkraNmAZj7qTOda3dYhXjQXariYG9cFpl8Q/HAPS/WUbzNRZxQ6SLuUr/eoZ316M4i/x
	ug9eG7VGR4PTlffisxnfgeRAOXXxodRxQRk48uy6mx+e+1BWNmg3gh2j7RKIZ1z4vU8RKL9gHKC
	cKBehVscbSRKO0OwgQ9Lu6Do0842iDwf1EarXJZjH5wOF8bR7CXsIVraRNFr7dKX0jG/qVKVXxL
	D5AS0FQnrhvm9IBK9h4=
X-Google-Smtp-Source: AGHT+IGI/OIMZv5zxxuAaPROZkgJ01jByKMgLdXZXA5Orw/xyDS2l+HhyZ8L42nIl3C2HCHio+TsuQ==
X-Received: by 2002:a05:600c:3ac6:b0:42c:b55f:f4f with SMTP id 5b1f17b1804b1-438b17d0086mr84392675e9.6.1737985687579;
        Mon, 27 Jan 2025 05:48:07 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f292sm131038555e9.3.2025.01.27.05.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:48:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 27 Jan 2025 14:47:34 +0100
Subject: [PATCH 01/24] ARM: dts: qcom: msm8226: Use the header with DSI phy
 clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-dts-qcom-dsi-phy-clocks-v1-1-9d8ddbcb1c7f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1763;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=UfENSiU1Z1EiZp0xMPahrQJ1WrLZ3y4ZDLqWk7VnnG0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnl45/U5wIHf5qN26zn8VdUwtZRXVX9hwhDEYMV
 uge84GaoReJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ5eOfwAKCRDBN2bmhouD
 169ZEACP4jFaf3f5DK1SXPYDX6oY2rgfTU1R4ZpB5suhrHIpp0QfXivLvOelE+Y/X08zcVJPq34
 HzswX8gl2vylJPwRrC9tXinry14gjKFAfvaV4lYN2ikHepzMAw/XDKC9mSmyfBsPMRsRz1oEawJ
 13/uETiGzBc5e04psYg9ueIOKGybHeH9zg1cV/C8s9gXkvTx4IkYcGWuStK+jtWebABlg0Fe84K
 2A2cZA8i1mTOmNGag7JTLRk1xoMPccnqOTNF1v8ChyjOBjhMq33O3oGsIwx91B/ry2QhcIwVp+8
 dCR3+ZO8XWQyJ5AjztrK9FQ6NmR1PCR0vJzbC14B7NI5rAopk1R+skj15Ay8qep+L5U/xBmI2Pl
 FBUjFAm17PhIVimXtsagPwtOXe6CpBysB+HKNWhIGEpXcqaIv+ss0txXI3ASifJZUdx1C+K3OrX
 TYWS1ayRUfeKM4oSSGNXp7pqehxGuPNu1Dw1FM8lQwVgV0FtkZCJs6TTmw76lSrs6ht5+TbZ/dd
 9um5rfRn6F3u0j/c4rRATwxTIW+6H45i9mDdbT+eJko8BfcSddLZCFND0O3UXWGOX9nKMgegW/s
 p4gdLE18JIRJw48oD+hCRbq9ylxrDd5kALkV4HgQZjZUCwCF9oImCd331oqcHt5p603RHwKVE+b
 cE6Y6Pch/ULz9Pw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on:
https://lore.kernel.org/all/20250127132105.107138-1-krzysztof.kozlowski@linaro.org/

Please wait with merging till this hit mainline.
---
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
index 64c8ac94f352e46dc4a18f902d2c30114ecd91d2..c84320ef5ca24effc50a6f22ee3b403d6d6e85bf 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-msm8974.h>
 #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
@@ -983,8 +984,8 @@ mmcc: clock-controller@fd8c0000 {
 				 <&gcc GPLL0_VOTE>,
 				 <&gcc GPLL1_VOTE>,
 				 <&rpmcc RPM_SMD_GFX3D_CLK_SRC>,
-				 <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi0_phy 0>;
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>;
 			clock-names = "xo",
 				      "mmss_gpll0_vote",
 				      "gpll0_vote",
@@ -1060,8 +1061,8 @@ mdss_dsi0: dsi@fd922800 {
 
 				assigned-clocks = <&mmcc BYTE0_CLK_SRC>,
 						  <&mmcc PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>,
-							 <&mdss_dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				clocks = <&mmcc MDSS_MDP_CLK>,
 					 <&mmcc MDSS_AHB_CLK>,

-- 
2.43.0


