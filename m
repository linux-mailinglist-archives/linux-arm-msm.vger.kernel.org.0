Return-Path: <linux-arm-msm+bounces-4811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A09D8139A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 19:14:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36E74281689
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 18:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1012368B60;
	Thu, 14 Dec 2023 18:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CI+NnKSW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2672F125
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 10:13:57 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50bfa7f7093so10911108e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 10:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702577635; x=1703182435; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KDl/5My1xLkJRpwqZFmnSzRYwMADfJleMVV/jfBPrF8=;
        b=CI+NnKSWadXCpuDa34yiX6u4IC1a2qIIsxtyPnBx7emBjTLvpawGgG9G9gC10H6QzA
         B2G2bk/0fjInNyqg5UAM5P4YlBy4rdnhAeJUvs7oHTCwmlLHRZIULiLEjOlRihWpd1ng
         iR/NHTEjuvsQzHoFrYC9QilIb9/6neytEekOpnLCIxuk3n7ujJlwujBqt1+hb+MpOi7S
         HYbD9HXblbYaRowYoaYWXs3bOQlKqEUuYjeHGWiINpwB6iSRlltRj4GKScK4PQquLSCJ
         1NRSZNnwQJP7JpOCGQ52ReyQHxnA/o6OyPAe1xmxJVMrk/HtpnNSIXzoI7jngPSms9gj
         Qhaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702577635; x=1703182435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KDl/5My1xLkJRpwqZFmnSzRYwMADfJleMVV/jfBPrF8=;
        b=o8XELsCyfKGI8CMl0Xsfo6VG8J+txL12N0VsrT/LpCSDhs5adGo9trE0lYgHA/xqBD
         4xydbmQaA0C8pgKD+8P2gqZIN191y6+gPRLEPCJl9k+2SE98E5tjcsGt17UdfknNi/Ya
         IF52GNTMbRF5vGZ3nf9LJ4oBfYzRvCap+f2vQekRIIfF8i1P8rKPpwDeF8m8lXbyIrVa
         4sa3hUa1uUlK2xNQ2M5IF85a5AVVBkKI4agCWLvFaksHBSHhmFoqvluCiEIfyX0III/L
         HlO/+FSeqPXICrGWm7Mq8mRd7jinj20J4Q9vj0xyDThT8zGSb8Q+6cOABAjc/96DQi6r
         ZtPw==
X-Gm-Message-State: AOJu0YwY/hnxIZigWeAaB4qOgn4Cu6w8UHL7XDSFRzu0dQqiYVmAzqPu
	qrFMJ2js3QztkWOYpWiVSISA1w==
X-Google-Smtp-Source: AGHT+IFiqxfsAnPjpTM4RI3tV+Q1YP0UXWmiaY7vOr7muxEYy1b5pZbdq+7ZX1Mhwflskp6g/OyciA==
X-Received: by 2002:ac2:5399:0:b0:50b:f8da:23f2 with SMTP id g25-20020ac25399000000b0050bf8da23f2mr5190095lfh.135.1702577635312;
        Thu, 14 Dec 2023 10:13:55 -0800 (PST)
Received: from [127.0.1.1] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id n11-20020a0565120acb00b0050be6038170sm1928838lfu.48.2023.12.14.10.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 10:13:55 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 14 Dec 2023 19:13:41 +0100
Subject: [PATCH 4/6] arm64: dts: qcom: sc8180x: Add interconnects to UFS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231214-topic-sc8180_fixes-v1-4-421904863006@linaro.org>
References: <20231214-topic-sc8180_fixes-v1-0-421904863006@linaro.org>
In-Reply-To: <20231214-topic-sc8180_fixes-v1-0-421904863006@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Georgi Djakov <djakov@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Maximilian Luz <luzmaximilian@gmail.com>, 
 Gustave Monce <gustave.monce@outlook.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13-dev-0438c
X-Spam-Level: *

To ensure the required paths don't collapse, add interconnect properties
to the UFS controller.

Fixes: 8575f197b077 ("arm64: dts: qcom: Introduce the SC8180x platform")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index c970dfb11fe5..98fc3ec881a3 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/qcom,gcc-sc8180x.h>
 #include <dt-bindings/clock/qcom,gpucc-sm8150.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sc8180x.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -2112,6 +2113,12 @@ ufs_mem_hc: ufshc@1d84000 {
 
 			power-domains = <&gcc UFS_PHY_GDSC>;
 
+			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_UFS_MEM_0_CFG QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ufs-ddr", "cpu-ufs";
+
 			status = "disabled";
 		};
 

-- 
2.40.1


