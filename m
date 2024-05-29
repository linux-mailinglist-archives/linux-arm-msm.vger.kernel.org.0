Return-Path: <linux-arm-msm+bounces-20950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D37E8D39BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 16:48:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D7F11C236CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 14:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A40E181331;
	Wed, 29 May 2024 14:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RCb56Bm0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6038B17DE34
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 14:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716994031; cv=none; b=rxY37dHiDgeEMBrtamfvtY9AZV9MqbcaSH+AZG32lpmd+0mM0SjrymTTFJjaGe0T9Kmi+B5QxvOsqoMwjKzp7TKLKlzQxWqr9+Q8QTqtFQXcULee7waRmi3vAu3AH/5xK4hHWgkoWB+TVsVMuI9UtGVMI1GXV31AhDKZE+hPzis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716994031; c=relaxed/simple;
	bh=XSG2io/KT2M4j/vkBu34/bvT+NFOKJLYvm/1exVCbms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lqfGwzodtU3+l6ugm9fuO5XrJPmlXn8Bxt7TFCpyUMaNcknAw+1Cga5CLCLGFHDrT3tJ5lyJ3XZuxDiaAJoo0Hfn7vdZ2HdPf3GUUWi+eHRKpARzXL8q20yki1CoHtp8Suyvf1z8AMRYkVJPiUejKv66veSvB1ZYyKtbox3aack=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RCb56Bm0; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e95abc7259so23388781fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 07:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716994027; x=1717598827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kvfgkm5LLEnmSpnWtVy++FJezRV6uw2fSY4Upd5a0NE=;
        b=RCb56Bm0IhXCYc96uu66Hhf3u3ctvFzdJ9X/7I5PhcAhwcNGQG9ap7DSmb/P3EFIzs
         Vugol417SOAYuFbsZT9FRZvoPdzFokzSDCgYl9vtn6fV+PEg63WAdQbV2wFvMdi0z3+X
         gJ97TdzOb0Nc1A4Jt8hnHXbhk8J/gFNWHRpA7Cik8ibMl18LeRkO9RoOLsyiJSzOObyd
         wKLZ//VDGzzSvK+2L6iv3mO6pQkmFzN8WIN30MZSvX4l9ywFo09d4FZwK5kEf+rrTPt5
         YofftNUtztXlj9KET+iQfyatfbUzYJYnsk/XhqxJOl1tZ7Ciywu4ZImYd6RWFBVLQIF0
         jiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716994027; x=1717598827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kvfgkm5LLEnmSpnWtVy++FJezRV6uw2fSY4Upd5a0NE=;
        b=vQmkpgKi0rkaP5IfZUNm3I+mSaWTeqOK0l5hi0aLoIwIhlpjlHuXMZdhWLR5AXlKiZ
         PYwp244rziIdwqoJrjwzfXi5lWsrag/65kz5V95O/TxxJbISoCR9DxMbdeBccjQcSYPU
         mifEYOyQrce7ycuF7ncEyyNXGyWpU+geJxa2HgccghrY23BRGxPvjxqt9ArjH8zdzaIH
         lB7+dh8d78ITn0AfwUSvl5AWW7sv6r3KYHKh2jESm+pcAnK7ymgYQZZHx3w6onn/xklN
         W8k2fQfnP7FDBmXKb7cIRjy7+Dumgrt8HYFjBDCb9cHrRGhyQyVrlI7FWTAJiOVXnN8z
         pNZw==
X-Gm-Message-State: AOJu0Yxe6FOClTOWeDCjXt2dfIGXluRNVyiggqKN1VzTYXUvGqHw2HN0
	l/gLljFxu+RAmBdDLvb1E+L+rR91qKUv4gUrxzjnSQHkibc8Zh4GBISu2P3RLuw=
X-Google-Smtp-Source: AGHT+IGSuajEGcbJWQPrxSuzqmMqwfPM02Y32hXjcJRyFdL2FncMffzUPQ4HLghqTHZdXQ3p2pmmJw==
X-Received: by 2002:a2e:900f:0:b0:2e6:f2e1:32a6 with SMTP id 38308e7fff4ca-2e95b1daa48mr88751281fa.27.1716994027592;
        Wed, 29 May 2024 07:47:07 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e98c45df0csm3791951fa.68.2024.05.29.07.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:47:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 29 May 2024 17:47:04 +0300
Subject: [PATCH v2 06/14] ARM: dts: qcom: msm8960: drop #power-domain-cells
 property of GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-qcom-gdscs-v2-6-69c63d0ae1e7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=813;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XSG2io/KT2M4j/vkBu34/bvT+NFOKJLYvm/1exVCbms=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVz/lZmP24TonDeECQz6EyyZ/IjGofkLA0IIx8
 HSYR8b/meqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlc/5QAKCRCLPIo+Aiko
 1WBqB/0U5APVf/wshwa1y34DGhgBUREJrD6wGwCgOmqPjK2YNR2B07sdn8Gt/PNewLiBvMDk9dI
 7OyI58ASRnak0Ofr9pxOmNvVE7C9aoGt/sIDS7V3mQk6d1sRoO6iaQHXEFbZ+vtcV2hIYSlm1MZ
 edfX/B//LeNulclXW/jqS/OlvDRlEEt8jxNDplqF9ZBQAabJ300bSUPuBQ3omNxuJ/99PJoe4Gy
 N47Rg51FqWSrgQOlOBN3ooM3E6HivWrr/O41ecioCdq8JNP17MzODAnwathjR81QYguXkCxN+uV
 Fq6KNpsaAYzDGOFoW+4J7PzsO1eoQ5zi/hCFdHejBPhjK8yz
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On MSM8960 the Global Clock Controller (GCC) doesn't provide power
domains. Drop the #power-domain-cells property from the controller
device node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 922f9e49468a..a9c6d2dbb460 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -129,7 +129,6 @@ msmgpio: pinctrl@800000 {
 		gcc: clock-controller@900000 {
 			compatible = "qcom,gcc-msm8960";
 			#clock-cells = <1>;
-			#power-domain-cells = <1>;
 			#reset-cells = <1>;
 			reg = <0x900000 0x4000>;
 			clocks = <&cxo_board>,

-- 
2.39.2


