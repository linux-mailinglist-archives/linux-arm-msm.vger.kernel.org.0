Return-Path: <linux-arm-msm+bounces-6142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3625A820683
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Dec 2023 14:07:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E737A2820BF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Dec 2023 13:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1C4F156C8;
	Sat, 30 Dec 2023 13:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KxxCvqrH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5747814AAA
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Dec 2023 13:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-554fe147ddeso4496727a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Dec 2023 05:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703941482; x=1704546282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIS8BVV6xMe2SYH6GmTY+cChP0QmWaX59VMotnHi2Jo=;
        b=KxxCvqrHO4/drNDWV4CWPSqHhtYeJl7olP7tsF7CbEKRTnjIO8lyNkcLfM0gXE57WT
         CrkojEuPivqn4ew6NUXELnN8LYVmr+gKT45Cl+HaccChdK/+4ZH4JY1cB0IBQ8qI74q6
         H1WP8VhPXAfQif4qweJZOY6x4lN6L4NqrMyT8jd1GIKNqyfnx3sbenioCGj6do/7d45J
         /3OZo1cWVa7xDXCBUgu3r+sicHuilBThIlLjE/5Nwo7ZN426XemAxaFJoqeDaHwfOWD3
         sdgdTxHyYsRLK53BrNsFBJnzQIkWUwqFfoRJDeEXuti8LB2I7mgc5dXjPCIWJaDzIoE4
         /QqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703941482; x=1704546282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EIS8BVV6xMe2SYH6GmTY+cChP0QmWaX59VMotnHi2Jo=;
        b=ql4ngmhw6dfMpkP2WV0HW4kFevuV4+MFKBJqBVFWMB91PRAaEEODX1IPU+lbjD4ufc
         8xmr46oDLfd8mcbbStGnCGwq+t8l1ADOLrCr1itVDzoNxg9fsZt+DQORG/Tj5ybEvCxv
         YRjH8oBuytRB/xq9hnGxitGhnYZkUmvXk/nKjk395YcQ1VanKrct2+IBKyXIqTyq7/iB
         DhnEklf9snfcxO/W5GB/0qf5orsDKqZ3f1PipC5uCdIb2k1cBJ4abJUtfFExRyKbWiQr
         q5F8sMEGlzzC9jqd11//Fjr9sg16xVBTHiiQd4Vvqa7SN2IomiNbGVRpQH20Nzd3ONqK
         Pb3A==
X-Gm-Message-State: AOJu0Yz1qbKBVQ0dqso3YTdKQLh1pTeQrqyiFl0p7v7VWwo+hxncKCSe
	R5eO6ZtbIYUsD9GWYIqyu/mrHC32Q43V9w==
X-Google-Smtp-Source: AGHT+IGVcURXqxidAdIs2dZlk4wni3bZ/v5fZi21exN0qfgk4ncWS12LCpGSLe9ozHmNAspQ8oQLkw==
X-Received: by 2002:a50:8a92:0:b0:54c:4fec:e3 with SMTP id j18-20020a508a92000000b0054c4fec00e3mr5855215edj.114.1703941482766;
        Sat, 30 Dec 2023 05:04:42 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id ij14-20020a056402158e00b00554368c9ce8sm11359578edb.1.2023.12.30.05.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 05:04:42 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 30 Dec 2023 14:04:12 +0100
Subject: [PATCH v4 10/12] arm64: dts: qcom: qcm2290: Add VDD_CX to GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-topic-branch_aon_cleanup-v4-10-32c293ded915@linaro.org>
References: <20230717-topic-branch_aon_cleanup-v4-0-32c293ded915@linaro.org>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v4-0-32c293ded915@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703941465; l=764;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=HEE3DdJ4zQzS/Foajh/2RBi9l8ssp2UwDgoH6XqPOSE=;
 b=9J3qXflG8Scq/7kdhRwm8M6cjo138i21rmtDQKUhjTi2dwX/DXp8Ms6kCDV5ud/j6x16z/vMC
 cQ19VkWCoBECAMWq+OQoZ0en5K843K+Zo6HeRwZ6hBWsgYPToaaIvu/
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The GCC block is mainly powered by VDD_CX. Describe that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 0911fb08ed63..51b05019ee25 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -647,6 +647,7 @@ gcc: clock-controller@1400000 {
 			reg = <0x0 0x01400000 0x0 0x1f0000>;
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&sleep_clk>;
 			clock-names = "bi_tcxo", "sleep_clk";
+			power-domains = <&rpmpd QCM2290_VDDCX>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.43.0


