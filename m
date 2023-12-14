Return-Path: <linux-arm-msm+bounces-4715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3595B812B64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 10:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B3851C214E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 09:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DDAD2D05D;
	Thu, 14 Dec 2023 09:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oBUfICXI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B904127
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 01:12:52 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-77f9c7d35deso56610085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 01:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702545172; x=1703149972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90h9raFSlwYqtZtEwRi3utD1Y8btrpvvb6rt2ijbFWY=;
        b=oBUfICXIt6FQlFyXmmLGXvyZUfztr89Kd74kAKtimFIFE4LLA0VKtz7+1Pl3X6QK9U
         +ioY7JTNSOyL4XYB/ecfoJPKv7cDazqWkqR48Kh8fmiOG2ccX6swHbG2rEA1bxXKXmyH
         Nd2xS4RPD2h5pgvkAlrX8DYZTmwMva4JgtKflvlU9rkr5xjNtkArmt7Fvhz0kjHP2+BO
         qCHtwC+YBeSzO2qow1anvOqXka1LefVbUJps4+H7NB2pbLLI4yrtIFUq5XTmv0H06GuU
         uGagyO+fv4kKI8paCdit2TOp5JttL+u3H01ud5QKX6isBzwJNhXJZSXGIIrz4G6CtYeF
         hA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702545172; x=1703149972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=90h9raFSlwYqtZtEwRi3utD1Y8btrpvvb6rt2ijbFWY=;
        b=XR1e4W8N/1AQkBIuH/ZQuC/FPRx4oT35O/CufWsLCjBfKQHDyWueaHuKo/GIGhGDGf
         nG80qMmc6sElLqW3X7seTjz0EI+QtxeK5dNp3qJ3Z/QRZ6C/UJx+3uTAn3W+qc40JB7V
         qo+5vpnEDKCCMjitwnq7yK4mc6DQFf1xNprDai0o1FsANa835dTgJ1fjwUhrJTHWFYj7
         g6L00upEOzf7qY7I+t1t1YLx9EO+qrU/cu8DxlMjRUO0DlJtY4O2EYc+pDO5co4qVvWG
         pU7slNdpZilzTL53l+e+D/QyZzQnNwaFZDm3pwj0T6mLCvQ5ohsg8SMYwa6zcyZZn+wC
         AR/Q==
X-Gm-Message-State: AOJu0YyfBWQPkr5BZuGVIsuUcZlEg6COW6tj50QsdAyNfi/Z+CGdNm05
	6EwI8R7eFdZ/m3fc0ptj5Q7N
X-Google-Smtp-Source: AGHT+IEGFG/+5WBdW+QF3Y2B4MEmKQm1lHv2/KY/sKl8G6B/VvdbDTPntO5+kmWw7bf4yF46kQC8FA==
X-Received: by 2002:a05:620a:956:b0:77e:fba3:a7af with SMTP id w22-20020a05620a095600b0077efba3a7afmr6304092qkw.141.1702545171754;
        Thu, 14 Dec 2023 01:12:51 -0800 (PST)
Received: from localhost.localdomain ([117.213.102.12])
        by smtp.gmail.com with ESMTPSA id qt13-20020a05620a8a0d00b0077d75164ef9sm5144119qkn.124.2023.12.14.01.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 01:12:51 -0800 (PST)
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
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 16/16] arm64: dts: qcom: sm8550: Fix UFS PHY clocks
Date: Thu, 14 Dec 2023 14:41:01 +0530
Message-Id: <20231214091101.45713-17-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231214091101.45713-1-manivannan.sadhasivam@linaro.org>
References: <20231214091101.45713-1-manivannan.sadhasivam@linaro.org>
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


