Return-Path: <linux-arm-msm+bounces-20948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 678EE8D39B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 16:47:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADC99B2514F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 14:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E578F180A7E;
	Wed, 29 May 2024 14:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gGbDIlKa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2AD17DE0D
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 14:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716994030; cv=none; b=DzPc+f3+kPNSJEBul9ZzIfa/Uo7Y4YTcjg48UlAYdMWkLY4m76WFZCEgOPR4YZ/XJjVcwZdpAEjAN4R3s26Bl5GxNZLaWJMfT8eYQ7as3428lyTu2LaZj1mpXjap7V4W3TvK10KKl96+q7e6FIFQZtIz56r3igf/kqfuF3hLgVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716994030; c=relaxed/simple;
	bh=efm+IHUJ1gyGBEQDbtWwDLgNHtx+hRJSWzbFoBIcMe8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sOjiJ1LIhRjS0r4hdyYYYuDjeOuxRE3c/CHpV+768G4JEAlXdSc4Pyy1Tup6qBP62EvsPuglIXeP1TUHqXFZzE/natY5KqXOJYCeVxPv1yC5H3IZ3Bt32fDG7TAPTpspbtBHNJri+HKJ1yO8rmmomeCvtLlREtoneOZAh5THZtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gGbDIlKa; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e3efa18e6aso373821fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 07:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716994027; x=1717598827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EmcXmv0vM7R1Q30++GJfNW0y7hLTKdDFrf+Tedwk3q8=;
        b=gGbDIlKa0VkNJV2UkQmIwEgdU7uJPTzbg9MedrPyy4jmazRDofV9wucORoXmuGrExl
         cKBPxdgUHy76CWsyoLFgESIzufGWjct0omDzpghhP/8/Thy/zN8zndaKk9WkykSaotdi
         c58TCU7l/rssMZhVoTlMTTbeShlZABdryClXT/0xvtUyvaz9V7SvnVmR7SVNc6xGNe7Y
         cYEbr3Rc2ZhdO95vJLy5j1GvmAWtBkP4e39DezCa4/9aPtcYaHsg1DJ0/9/q3JCe4mTl
         7z7fpwqhF1Vk+J2kSlamYdoisGZ5SX8XjW0w1shQZlboY0UCzZpnmyIfc415hJ76n7TD
         vylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716994027; x=1717598827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmcXmv0vM7R1Q30++GJfNW0y7hLTKdDFrf+Tedwk3q8=;
        b=r7ZbzEOi5f1W9G8B3LB1n6atmxFQUL0WbQ8zEbRdUjKLLXdwka3evy/3/tjzYV1RVm
         m3yZleXCJIKpDwf22TJrqQ60FGx2RAa/+I4z0nNQ/s+DKrX8LBcHVB8QeKkDAoDrFz70
         eOezQEVkvlpaTJVouvwJEbqR1o7qd65CF4+kKLkHx0CHipx0pveIotDtbtsouGSl3RHS
         7CSZrH9ql4HK8/eeQa74OnkZWv5m9Xz9ZvOt5MZDqrOOWt3cGPsN+8S8WnAaZmsB90NC
         MTnNjx9W69U9EWyr3OrVGqhjXYvTmMafqbQYHkjod8JlMZPcLi+TT3GDvzaHZ6Eh06IL
         wMpg==
X-Gm-Message-State: AOJu0YxjCtxZ9osGc1QYjl0+1lpCvXcL3A9EF8g104zdUhPSHPV6ChPh
	ffvKRxcNby9ejmelbALNrjtKpCE/46IVGHGgUaLGlUkCNyjAuuhkuLXzHwmxQgk=
X-Google-Smtp-Source: AGHT+IFXnqmVF71aR56UFrM5I4k4QNrZxCzbTXozXYB4tkw6byoktMhiSbmh21QJ4eN71oJ+Pyc8jA==
X-Received: by 2002:a05:651c:2215:b0:2e9:8803:2e3d with SMTP id 38308e7fff4ca-2ea4c84f805mr8261221fa.13.1716994026972;
        Wed, 29 May 2024 07:47:06 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e98c45df0csm3791951fa.68.2024.05.29.07.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:47:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 29 May 2024 17:47:03 +0300
Subject: [PATCH v2 05/14] ARM: dts: qcom: msm8660: drop #power-domain-cells
 property of GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-qcom-gdscs-v2-5-69c63d0ae1e7@linaro.org>
References: <20240529-qcom-gdscs-v2-0-69c63d0ae1e7@linaro.org>
In-Reply-To: <20240529-qcom-gdscs-v2-0-69c63d0ae1e7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=824;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=efm+IHUJ1gyGBEQDbtWwDLgNHtx+hRJSWzbFoBIcMe8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVz/lgbtWW2OK6FPM1xF+appjfsE4Umi6/sqlv
 4uaUWDNWN+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlc/5QAKCRCLPIo+Aiko
 1ZYUB/4nmXjpa+rMxDXBEVJiE7urrUlTsAiSEGjhtjJFx37GBLo2R+AKB948wyEFEtHK2Q/YnId
 3Yh0jQqXIdRiKinTkn8pvHqBi2lSU5LziaTdnv79UXc7u4N8Gj93kvvaq0J8v45FlCVeIz2lCzp
 Lfezcvpn8YoFoGK08lxkZtI1PNjYMACHfO3K6KumfGc5jPC63Ys8uJbloBo8JSweDVNNRBs7nLP
 sn8jED2Kc+YyBv0q8J2W7gxhuf5+N/dCp72HzD/Nla1hANAuQ2Dy89OqmdUxL4EAXbvMAZlu6yu
 SUNfF3WvD3xhU6wFLNY/Ud/C0sOGiHiKSDEZb5rDtu06zE8A
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On MSM8660 the Global Clock Controller (GCC) doesn't provide power
domains. Drop the #power-domain-cells property from the controller
device node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8660.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
index 455ba4bf1bf4..a66c474cd1aa 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
@@ -113,7 +113,6 @@ tlmm: pinctrl@800000 {
 		gcc: clock-controller@900000 {
 			compatible = "qcom,gcc-msm8660";
 			#clock-cells = <1>;
-			#power-domain-cells = <1>;
 			#reset-cells = <1>;
 			reg = <0x900000 0x4000>;
 			clocks = <&pxo_board>, <&cxo_board>;

-- 
2.39.2


