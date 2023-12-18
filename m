Return-Path: <linux-arm-msm+bounces-5231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0846D816DA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 13:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F6D91C23B2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 12:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2054CB44;
	Mon, 18 Dec 2023 12:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V7IyBxI/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD5C57318
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 12:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d3cfb1568eso1340155ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 04:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702901340; x=1703506140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90h9raFSlwYqtZtEwRi3utD1Y8btrpvvb6rt2ijbFWY=;
        b=V7IyBxI/v/WgQklxeliq38sMRo15tqKQ4Mr466jtVh4s7zVnxRc/FIPJHykQRTR5py
         3DgTI0+puHqVGeVHKV9gJoXCdGd23vbamPdThte8f8dpgx5f0PixzlhTAiQga9zdPwuU
         12VZ2RgtSdto3qTW6WBI13DvVez4Y5nO/L81cEuPPVsTbGVSpbsM6QZZYtP5pg6/0EWx
         /Yfrxzvo0AfOLggUyC+Mu04MCzHfSbx/Rof0GCaadPauMIzv0WjzyjF9LSNzUa3w1QvX
         ot3bIUufFdi7O2s+tzqhM4CUfiv5oFA5lNBdAAv9+QzHNvEYlr89TNjVfJ+JwR8pKRv+
         +Q8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702901340; x=1703506140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=90h9raFSlwYqtZtEwRi3utD1Y8btrpvvb6rt2ijbFWY=;
        b=KIWOndYSlMTRxXP/p1tuJlhQ7uqOO6uBi27z/DcIztleK+dza0BS3HfORkRAV3N7Io
         fhL++LpKA1pkE7FUCSbjqPGNMFP7qDkoe85qghUYUBz0QG/fmeN6bjq5DP2+IOf736AZ
         FA+BHuZGliTikVqd+gcwoVUYglY04dU7m/WCPYCvfHmVgcuPw1fKKs09fNBG0T1qGaWy
         KCDoWp6+Iffi5h/jNOKwbVxAiiPD03P19NqOqzyiwV7y5Bpabuhi8N8FGyASTSyxyF1o
         XOGAKAFcXXktC5Ldj0DeSCNxeJiI88tzXBHZxz4q/x5Do+PIHUN863uLzYNPLOXzKyED
         PNQw==
X-Gm-Message-State: AOJu0YwI2I/pPD+sjIqUITHl4WDHoa2co2/fp0/HbmUHjKSE3gv5x0Ih
	MVDkly0LuxOd75mxzoiYdJTR
X-Google-Smtp-Source: AGHT+IH6YQIoz7g6eSuI6OBkFycERp/zo6TTsmB3JpzQ5Mkr+OSBAEVaXvjIhrOv9oP9NCPayYUGgA==
X-Received: by 2002:a17:903:2292:b0:1d0:92a0:4929 with SMTP id b18-20020a170903229200b001d092a04929mr21153502plh.85.1702901340343;
        Mon, 18 Dec 2023 04:09:00 -0800 (PST)
Received: from localhost.localdomain ([117.207.27.21])
        by smtp.gmail.com with ESMTPSA id j18-20020a170902c3d200b001d368c778dasm1285709plj.235.2023.12.18.04.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 04:09:00 -0800 (PST)
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
Subject: [PATCH v2 16/16] arm64: dts: qcom: sm8550: Fix UFS PHY clocks
Date: Mon, 18 Dec 2023 17:37:12 +0530
Message-Id: <20231218120712.16438-17-manivannan.sadhasivam@linaro.org>
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

QMP PHY used in SM8550 requires 3 clocks:

* ref - 19.2MHz reference clock from RPMh
* ref_aux - Auxiliary reference clock from GCC
* qref - QREF clock from TCSR

Fixes: 35cf1aaab169 ("arm64: dts: qcom: sm8550: Add UFS host controller and phy nodes")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index baa8540868a4..386ffd0d72c4 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1891,9 +1891,12 @@ crypto: crypto@1dfa000 {
 		ufs_mem_phy: phy@1d80000 {
 			compatible = "qcom,sm8550-qmp-ufs-phy";
 			reg = <0x0 0x01d80000 0x0 0x2000>;
-			clocks = <&tcsr TCSR_UFS_CLKREF_EN>,
-				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
-			clock-names = "ref", "ref_aux";
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 <&tcsr TCSR_UFS_CLKREF_EN>;
+			clock-names = "ref",
+				      "ref_aux",
+				      "qref";
 
 			power-domains = <&gcc UFS_MEM_PHY_GDSC>;
 
-- 
2.25.1


