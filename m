Return-Path: <linux-arm-msm+bounces-5221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E363816D7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 13:10:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A280C1C22AB1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 12:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78DAE4CB5E;
	Mon, 18 Dec 2023 12:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ODfaBI6M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF14B4EB50
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 12:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d3b8184a84so2490265ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 04:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702901281; x=1703506081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7tHzmERAQbZImeje4EMokx1gYyccc/9b3w+T8ZyCDU=;
        b=ODfaBI6MdLWnZLQs2IFwNd7Z0Q32q1lBgzbLy00zhyEN79d3+wWBGzd442us10TE7+
         haxuduk5aK2zemnoFdjag9PBaF81QoZvR1PedVD5yT2wd0Uq2sk878+m95ccLG25wga+
         4pyQDron9VA9POvLCCW+QQGQM1OWQ307mRl/jDe/YDPpDUvNycLIdteRky8AZSR7xZLB
         OgAbnc4tHEj34Y+rjfLV1QvVsa3IgEwrEA7wZ3r3ix0JK1VV9kfW1LVliiiJzYhoMvHg
         sPDF8g4VFTlNvVvnX/ZTs7Jktln8OfpFdVZauHjubfFgyT/szJ0lfMvGKcesAhNP7FPp
         gWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702901281; x=1703506081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7tHzmERAQbZImeje4EMokx1gYyccc/9b3w+T8ZyCDU=;
        b=lyocNkARLpmUQCRy5lpR2jotNerk6Adn+SzGNatyB2kspLWPNLB+GTW8+YttPOQc62
         QqbYXc4Io7tOOwfFklKKJBvObPsvRZL6TVZMBK7saO9X7dQ75Galk3gZL9DfQRHKR2a7
         c+WVlgFlL21xC5Us74OZxTW1pXvUnQ8sVggnJbZ9g/NztQ86aTReXW6iElShmwS3sSbX
         ZrtWn2Ze1JG2lrC8wCU6r5Tctit+0gEk1QStWmxyrdMVTfFPtDy+EnEE+lyxsXs2gW8/
         b2Acvc8m/3eyfAmrLVN5Yklxy0pbwWRSc6j8bSA3UAJ8icjFOF2DWixNtqz6lwYsIOV4
         x5Qw==
X-Gm-Message-State: AOJu0YwMp7XijPSiRlcNxUt1Sb3besaKKziW7/FEVFbQ3ICGK/KLHRGb
	xS1d69Nn6tYItwdo9y/8WSGh
X-Google-Smtp-Source: AGHT+IFpmFbwrX35pR8JXljDwh59BiNAQY5Eow8L0IqGWR6FSSBRUPbJHpRKtOzNMeLuiWR9vuMXoQ==
X-Received: by 2002:a17:902:ced2:b0:1d3:6408:211a with SMTP id d18-20020a170902ced200b001d36408211amr4518454plg.129.1702901281187;
        Mon, 18 Dec 2023 04:08:01 -0800 (PST)
Received: from localhost.localdomain ([117.207.27.21])
        by smtp.gmail.com with ESMTPSA id j18-20020a170902c3d200b001d368c778dasm1285709plj.235.2023.12.18.04.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 04:08:00 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	vkoul@kernel.org,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	quic_cang@quicinc.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 06/16] arm64: dts: qcom: msm8998: Fix UFS PHY clocks
Date: Mon, 18 Dec 2023 17:37:02 +0530
Message-Id: <20231218120712.16438-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231218120712.16438-1-manivannan.sadhasivam@linaro.org>
References: <20231218120712.16438-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

QMP PHY used in MSM8998 requires 3 clocks:

* ref - 19.2MHz reference clock from RPM
* ref_aux - Auxiliary reference clock from GCC
* qref - QREF clock from GCC

Fixes: cd3dbe2a4e6c ("arm64: dts: qcom: msm8998: Add UFS nodes")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index b6a3e6afaefd..d4c55e2b0043 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1051,12 +1051,12 @@ ufsphy: phy@1da7000 {
 			status = "disabled";
 			ranges;
 
-			clock-names =
-				"ref",
-				"ref_aux";
-			clocks =
-				<&gcc GCC_UFS_CLKREF_CLK>,
-				<&gcc GCC_UFS_PHY_AUX_CLK>;
+			clocks = <&rpmcc RPM_SMD_LN_BB_CLK1>,
+				 <&gcc GCC_UFS_PHY_AUX_CLK>,
+				 <&gcc GCC_UFS_CLKREF_CLK>;
+			clock-names = "ref",
+				      "ref_aux",
+				      "qref";
 
 			reset-names = "ufsphy";
 			resets = <&ufshc 0>;
-- 
2.25.1


