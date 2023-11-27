Return-Path: <linux-arm-msm+bounces-2139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E742E7FA625
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 17:20:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2443B1C20B83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 16:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C3A36AF1;
	Mon, 27 Nov 2023 16:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="To2sSPpS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CB741BB
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 08:20:22 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9ffef4b2741so595506566b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 08:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701102020; x=1701706820; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+c7o+g11wQaVIfs6Upk57wmZsR4iWH52vbiNHzvWM8=;
        b=To2sSPpSziK+Wlz+BUdzbCJ94utfLl57qE++BM+6U071Tl+KtenLvLDnO6o2YJEZri
         krRPBNj3xhDOQ0ZZ17XtBc9CgHihwj6wMUFKx29kDI1Jqd66p9MrHogHMZqtcJDXBouE
         6pMcvylY5nV13l3EAsuxBMPcGPtjj4IQHAPhX/BtTPTNfVqWN5uq9tEl5BS2R+bpuPkf
         +2BaiNMDGh2LcmmOiR2QngRxtvG6+Eq0S0DZKIXF6zt3OgpQSjpp+pJwdIyk5TKaYEcq
         HZH1pNd9xuoDkpvfLD4PEuJzuf1dHDKb4pmowboPwaeAEqqsoUNg4r48H48pM+qWH21x
         jQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701102020; x=1701706820;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+c7o+g11wQaVIfs6Upk57wmZsR4iWH52vbiNHzvWM8=;
        b=Kw7KTU0APs6K4BMlLbCSaI+PGqyze9PQJ/M9MdGqGJjLCONjJmwiMjKqnSINa3OhPK
         svbFZGzuefrAlA15/9qMJcf5YDDHRA/a6ConSVjiE9DN5jA0vz5dleDbyHVSq2Z3+FdL
         b76jCDC9N90titqX8fFeBQi1spcx9QU61VjxdRuxsIn3Y8Llo37FCixXOupYsIFnFg/U
         WqlXFvox+o8OokFQsazHM/z2Z9aviLxe3IDgkMUmplU5WfbWVtAUcfcLOIXTCbBZgCss
         6Vq8LSeyJIIFv4fR8nWVw3ewR9Ixv8GebgMOxdJ60xBZkSsnCMf419WGn8p5XD8rcE3t
         GyJw==
X-Gm-Message-State: AOJu0YxmdmQUdLVQucCq6P1rr3P+lK4MAt2vLF9bFRlSJ49DTbNkK75V
	MTHzKSrAIU6bgF8OPnre5ofXTg==
X-Google-Smtp-Source: AGHT+IEqwnM1Zk0NU5iClHhAf8DuvbmDFdZ/y49v5SALbxoGoB9jxKWr8LOq25RqeNMDSYJdvz5jQg==
X-Received: by 2002:a17:906:1dd0:b0:9fe:4d14:800e with SMTP id v16-20020a1709061dd000b009fe4d14800emr9032787ejh.39.1701102020723;
        Mon, 27 Nov 2023 08:20:20 -0800 (PST)
Received: from [10.167.154.1] (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
        by smtp.gmail.com with ESMTPSA id m12-20020a1709062acc00b009c3828fec06sm5734760eje.81.2023.11.27.08.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 08:20:20 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 27 Nov 2023 17:20:07 +0100
Subject: [PATCH 5/6] arm64: dts: qcom: sm8550-mtp: Enable the A740 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231127-topic-a7xx_dt-v1-5-a228b8122ebf@linaro.org>
References: <20231127-topic-a7xx_dt-v1-0-a228b8122ebf@linaro.org>
In-Reply-To: <20231127-topic-a7xx_dt-v1-0-a228b8122ebf@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701102008; l=668;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=kZlLueRiP9pbt+9Wm47psoQj32zcJNffjpfPIXiL3Bo=;
 b=WRE83MLWSmpWessB7dY2coUQjzm2iYdVGzHYcmSdqDG6gP7YK80Ny1kvOBPNCJW7eUVt17kWT
 iGpNakUX2RMDVvsD7DpAWz4E9Kr/O4fKm9GopVgSiee5bK+ao4OTcRl
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Enable the GPU and provide a path for the ZAP blob.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 9a70875028b7..52244e9bfdee 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -512,6 +512,14 @@ vreg_l3g_1p2: ldo3 {
 	};
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/sm8550/a740_zap.mbn";
+	};
+};
+
 &i2c_master_hub_0 {
 	status = "okay";
 };

-- 
2.43.0


