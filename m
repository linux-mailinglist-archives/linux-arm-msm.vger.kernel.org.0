Return-Path: <linux-arm-msm+bounces-2725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CD97FF309
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 15:58:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD348B21025
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 14:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C8A51C3B;
	Thu, 30 Nov 2023 14:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gSQCn9/K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA317D48
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 06:58:30 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50bbb4de875so1485183e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 06:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701356309; x=1701961109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xng1xwZB9cDO1oxrLqlkI81HPzaBItT+WlRJtOG/UQY=;
        b=gSQCn9/Kj+Q2++oa+g2hXO8D6AOqX0cO28IQru+PXP+64EkkbKw9SUWP0AVi8Sgk1Q
         cCKkJ15RAHUUTamtLIYBL7NqmrkAoWPYIK12sz7/ooPEvrDxutJFgB0Tec11jm5rgowX
         2in1k2ja0TxzaOmN7BUth4TiYqwPX+zCm/NeBmXodfEN/nDcgZdjZcy7hNkjA3x/fXSs
         PCKqxZ6qLjkzNzCiVX152Vg3yr79C7//vpOfYoq5O+q0pYwcycrsK9TjbufhBu8UMrot
         U0PF/BQHJiUkrHXUvZ4o8DRq4NLNcj1u6sPZ17nm7BHoYf62gRHsDrPotsX6CNJ4JKee
         k2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701356309; x=1701961109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xng1xwZB9cDO1oxrLqlkI81HPzaBItT+WlRJtOG/UQY=;
        b=NX1K3tmCqdWrxSYdk8DIrt81ruJ8ETLgLUhDninQJ8BMw669u22Yb41ZxEEbEsIoiN
         6hEHb2VAr77jkFMsImHXrppdiUtPUCPaZNxwMhF+Kg22NTwyeW8aw2t/6mkxFhF3bz5m
         mgVXTsbfzmQJu2wyr8kmtJwG8V541vfnRkRlPzmlj2wc1SuPhD7DxxaXCgRVxlO0218k
         bXxeiJYgyobAzJMkdBMWxQk6A9WOHB4vI1Gt5ecM5UpxLB14dojPd/TvrqXo8R62vn6S
         exDADo1cSunb/tWTKxKsSv/p5LB4/ClifE2HJITwQAK/Bt0ANPahETB7/NjAQ7oJbGnq
         0u9w==
X-Gm-Message-State: AOJu0YxL9LMml2Fjr+RWh6gIH/QocDGSKriRVnmmXMrRSY/uK1kvlE4W
	uItuGgLz5NvACE009jmSFMRVIw==
X-Google-Smtp-Source: AGHT+IE+x0e6fM2Sld54pRVkxjJM0Ov342/SGbgVbHrX1CbFqfvVdau9Bl5nKdVgEzg5dvCwFQjQng==
X-Received: by 2002:a19:5510:0:b0:50b:d48a:4485 with SMTP id n16-20020a195510000000b0050bd48a4485mr463550lfe.57.1701356309027;
        Thu, 30 Nov 2023 06:58:29 -0800 (PST)
Received: from [10.167.154.1] (178235187166.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.166])
        by smtp.gmail.com with ESMTPSA id a5-20020a17090640c500b009e50ea0a05asm756753ejk.99.2023.11.30.06.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 06:58:28 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 30 Nov 2023 15:58:23 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add QMP handle to RPMh
 stats
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231130-topic-ddr_sleep_stats-v1-3-5981c2e764b6@linaro.org>
References: <20231130-topic-ddr_sleep_stats-v1-0-5981c2e764b6@linaro.org>
In-Reply-To: <20231130-topic-ddr_sleep_stats-v1-0-5981c2e764b6@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maulik Shah <quic_mkshah@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701356302; l=709;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=AdWzrO0qrOnMAL7Fi5VjoxkzGyXFuWjhYPFtxK0xg6A=;
 b=AOeNm9HNFQg94wdn21vQ88b2ZtoR2PkMw/FDhSytFW6ofC/cn5rDkJdLl57t9V3DoU8/byEyl
 jSL7fXlgnhsAnj/L1fYzA5SSjThWYVloBRvdBQCScrgz3mZk215xgC9
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

When a handle to QMP is accessible, we can query even more internal
power management stats. Add it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index cad59af7ccef..38cc823c9c87 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -4030,6 +4030,7 @@ aoss_qmp: power-management@c300000 {
 		sram@c3f0000 {
 			compatible = "qcom,rpmh-stats";
 			reg = <0 0x0c3f0000 0 0x400>;
+			qcom,qmp = <&aoss_qmp>;
 		};
 
 		spmi_bus: spmi@c440000 {

-- 
2.43.0


