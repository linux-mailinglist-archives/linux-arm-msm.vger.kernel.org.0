Return-Path: <linux-arm-msm+bounces-5230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE25816DA3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 13:12:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 134211C23B20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 12:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE9C04C3BC;
	Mon, 18 Dec 2023 12:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZpAYqYoG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4C156471
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 12:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5c1f8b0c149so1001233a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 04:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702901334; x=1703506134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnV4bcTFVg58y8kcgwcwL2c2t/omr5+/badatgzAJ70=;
        b=ZpAYqYoGXTEnYHHoyRbRUFg2pSIbPxu3YMVzvirk75Zl7sL8YILWU9X8gAyiDCo5J0
         wGbpcoKt1c4cUdKCH3qVJbYE4UUtHxvsgIRYoSSW3iq48CGxcqzdadpyUcUPUxRGMsZn
         UFlt9dYTfqhasvnBMUASVFdWtielw5oGrfxoy17osjdxbCLBeBC1y7EeuNFA4wh8rrVs
         kFT15pyyVpYWuY00j013u34Zb4c46/lobKb5pj8/Yn/07QJeqii1xF1wR2M8+zW9rkmG
         Pp9h9IauBVip3Nu4Nr9mPCasgPBNCzzIw/pgQDaaeGGkV5T8FaanNzAlGeKjG6F6MqqK
         VAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702901334; x=1703506134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dnV4bcTFVg58y8kcgwcwL2c2t/omr5+/badatgzAJ70=;
        b=Fmgiiln14Zuv8fLkyl31K1yMZY4wCgw7jjFkkf6o/nB5iNd8N5rl46JfFLXpaQ9I4E
         sRjG25ZvSX8hbSAxKsbwlzHBxYF0pHHL6vGK1Vn+xuKRRGesFSZNKbyGdLMTNfFHpbQX
         8UpylZFotPuXPjpjqVRppHwriXdT/fGfkKKInapbf2iKBmcj+LNHhh4ML70GkoLpI0Sw
         0d/SlkrChxzQ8k3vzcsK5vYMXOx5YQEshu+y1Pn1ROLz4XVZLH0aninOzUzLQO5gyUYb
         QJtUBWgSDWzPI/j/0NsNN2EgmsTCPykg6YLlrmsNYWExzs6UNuAJXGlJr57ajTbolGB+
         +kFw==
X-Gm-Message-State: AOJu0YwqggVUyBaMADB/Tme1M8/3qSmJhAFu6qjz+JrhrhhfFnER6aLF
	Ky7zKE2s10MVhu4dpMl4hCLg
X-Google-Smtp-Source: AGHT+IHuv5DOigTJpGQgYUD2uD4WFD1pDTqLP86zuwQpiBhfnEWtjDbqCvw3kbTgKREgnnrh11wFeg==
X-Received: by 2002:a05:6a20:5603:b0:18f:97c:ba1d with SMTP id ir3-20020a056a20560300b0018f097cba1dmr7867193pzc.119.1702901334495;
        Mon, 18 Dec 2023 04:08:54 -0800 (PST)
Received: from localhost.localdomain ([117.207.27.21])
        by smtp.gmail.com with ESMTPSA id j18-20020a170902c3d200b001d368c778dasm1285709plj.235.2023.12.18.04.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 04:08:54 -0800 (PST)
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
Subject: [PATCH v2 15/16] arm64: dts: qcom: sm8350: Fix UFS PHY clocks
Date: Mon, 18 Dec 2023 17:37:11 +0530
Message-Id: <20231218120712.16438-16-manivannan.sadhasivam@linaro.org>
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

QMP PHY used in SM8350 requires 3 clocks:

* ref - 19.2MHz reference clock from RPMh
* ref_aux - Auxiliary reference clock from GCC
* qref - QREF clock from GCC

While at it, let's move 'clocks' property before 'clock-names' to match
the style used commonly.

Fixes: 59c7cf814783 ("arm64: dts: qcom: sm8350: Add UFS nodes")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index f4b8439200f5..38a09d71b3e9 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1727,10 +1727,12 @@ ufs_mem_phy: phy@1d87000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
-			clock-names = "ref",
-				      "ref_aux";
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 <&gcc GCC_UFS_1_CLKREF_EN>;
+			clock-names = "ref",
+				      "ref_aux",
+				      "qref";
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
-- 
2.25.1


