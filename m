Return-Path: <linux-arm-msm+bounces-3253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 554B580338A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 13:56:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8160C1C20AC9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 12:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77E832421F;
	Mon,  4 Dec 2023 12:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HaPsjEty"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E01BD2
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 04:55:50 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c9c18e7990so59236011fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 04:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701694549; x=1702299349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rNQ9eoIjbihkMBids/A7yvSvLEz/1dSNBCDwED7GiWA=;
        b=HaPsjEtyPU3k19q/qyhsLfaD1uQN9qijerpHgFfAMqGC+WaZW9Zj5+cksnUsOcVIya
         eqbMpm/Hs9jIBVhduboiJ2UiOAOz7Ks3k0jdsie1WdWLq9QT9+sQj7Qt7mIySn10lqpq
         vsUjeNZpcBvSCrLKO6msYxW4/prV9fdieyR2WZnU9y9565B3i3kEnrWnesCCSqeBdhdW
         blY3pxG/s+LkmEG9WMqCwm6qqYuAAOaL9lzYRS+RwEmJ6d/3+9PWqe0MtzaynG6bqfGk
         D186aveAWrVfg2/B4JQExxbMTa8k587SK7JWrAl9RhB/B8zlMeZc7UUT/QnF4VRkSVpx
         1ioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701694549; x=1702299349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNQ9eoIjbihkMBids/A7yvSvLEz/1dSNBCDwED7GiWA=;
        b=PXxrb0BV2Rd3bDIigBy9TTeUriBlCEDRl6mKeU2YBAesedi4BRLcqXBxOeYE4iLRmE
         3QXSEZRluN+I5nIwuYwSJrF/6D153GdiEZuIt6BZYjuKkzz6BZW0Kn75WWAs9nq7KGYa
         /oypI3ld+SFudOq9KAs3uZWkwp9B82Wlv8jzZ4XWRMkz9+mVnZhzNRpqzU0nmcTS6qcI
         g4zAPx5IMRXb/g31c0nbVk5Ee/+5cP627snzXvVwHRSSGnsPJM1ZLtHHiVP39K7KHgHh
         Nvaw1epIfpLnGd7PceqNB1O8nvnfmSiUEyvH1Udg+91f41xtPrdqj6UEelZbX41ovVSp
         B7WQ==
X-Gm-Message-State: AOJu0YzrFk2tIFzJ3E6fq3Ecsi6Q45egRFsuGTvDerYAXtaLvDmFH0vW
	h0Bk+F5XWk8N5hhZO2nwHqLknw==
X-Google-Smtp-Source: AGHT+IH4SmbQ/yfFGY+S1fotYDWx2YJj9ibDEy0bCNmkp78l1pCEiMegKfwF5e3/7oHwxwx2RHkA5Q==
X-Received: by 2002:a2e:9455:0:b0:2c9:b8b4:849a with SMTP id o21-20020a2e9455000000b002c9b8b4849amr2402449ljh.13.1701694548843;
        Mon, 04 Dec 2023 04:55:48 -0800 (PST)
Received: from [10.167.154.1] (178235179097.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.97])
        by smtp.gmail.com with ESMTPSA id ay22-20020a170906d29600b009efe6fdf615sm5241373ejb.150.2023.12.04.04.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 04:55:48 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 04 Dec 2023 13:55:25 +0100
Subject: [PATCH v2 6/6] arm64: dts: qcom: sm8450-hdk: Enable the A730 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231127-topic-a7xx_dt-v2-6-2a437588e563@linaro.org>
References: <20231127-topic-a7xx_dt-v2-0-2a437588e563@linaro.org>
In-Reply-To: <20231127-topic-a7xx_dt-v2-0-2a437588e563@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701694533; l=742;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=5wrD+vCj1p2Cee2rl5pPwaxhLb9h2pOZBD/QHizMBSw=;
 b=vmX8yPPaJKbK1Wbx4M2B51h7DEAnbLVxVGAYZqmt+w2sqzK4Pygh9iEsbPCNUPEZQU3p6/yte
 scSp8FFO7+mD1svtKUGpstIdPzgaFqF0OjkIucB79ENPXei3wQ73c6O
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Enable the GPU and provide a path for the ZAP blob.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 20153d08edde..a20d5d76af35 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -580,6 +580,14 @@ &dispcc {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/sm8450/a730_zap.mbn";
+	};
+};
+
 &i2c9 {
 	clock-frequency = <400000>;
 	status = "okay";

-- 
2.43.0


