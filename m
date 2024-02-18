Return-Path: <linux-arm-msm+bounces-11591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB16859740
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Feb 2024 14:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC60D2810A9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Feb 2024 13:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44FDA6BFD5;
	Sun, 18 Feb 2024 13:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V24Z44xY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A84A6BB44
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Feb 2024 13:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708264601; cv=none; b=WQNbzs/b3BYLR3E6HdqgwfnLU31ZScrm5gdLpgy1rIRe2pgtktUAKzkUmQ6kJK/1W8BiIXDvC16psTMNV70n+NwOTVqZGfvUdO/NC2xiKDPplZGym1vsNgE8Q49eqk7K7sYVtKUMD/DemqJVs4YO2IAhga5ZepzueqejU9o32VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708264601; c=relaxed/simple;
	bh=8Jw52K/qybWNDYMmkfmKEVECM6bSjDnqNRJimByERIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lMW7AbFDCFTazc/T63uz/S2GDnqblh8IkEsV5Zoa5g/fCihr7APeEfc6oEa/yYGZo0AB4eQd8VGh4ym+WVX7Lq5CR8jv9jxdIPHeb63M/FIkWIkYIqX+tBr6b7g6T6fVuoR/sCZ0moCd5jQNQn9oeaH3oK761xOoUFU+R4ml4F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V24Z44xY; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-512acc1a881so494103e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Feb 2024 05:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708264597; x=1708869397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/wysQ9aXGGhXLcp2eBZzGgvMjVSvkeyoH1wNdoYdsI=;
        b=V24Z44xY8YZqIrtvw+e88MvHzo+IFvkAv4kzi2w2hWegT8jSZj+xPcQoq9jwaGyyMy
         gP+4kaPrK7zs/YfCkpt11ZmEf8+rGK34vzkwHheRHKQxjL/9T1DlVRaFyROHDGqp+Oer
         26Mp9E6HAEyqfxqQ0x6Lh21AGeyzngE7JUXqLVqKp6xohEkQ/nDR55hQAIGrZF8ZaVSp
         mbTxAmz/dchQXlTTCnAtmLgM3GMl1fZBC0q8qRBruzOJQCXedGT4D/tDRTmE4ks31TVx
         s0eoos+AC3pwGlNc3Sv4cp0pIl6ry2aoEOEE2jdDFirDQ+WJ7lie7WPjlgXoxDyCucCC
         buBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708264597; x=1708869397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j/wysQ9aXGGhXLcp2eBZzGgvMjVSvkeyoH1wNdoYdsI=;
        b=uKeXcP1LrAtYkAsy1Au+yTjYV3GCEvCmzL0x3t3sJVNBDOiW34R8fbXCQA6Oc2LAlU
         cDi7DQByEC2zx8hV6aiyAw31KKTV+1/WGB0YH6HtIQcOxd3GAk0GNgwXoUD4bL1yjms8
         JiLd4Pe9UUiM0pjL15V9WMjOg6lfCOcxPB/vrIpcsjF6qPPrOvnX1F3TjqjJbvlfTkM8
         mUr+2rgCD/HcaRZ4jpbxelsKPG4mdMOGlRoP5bkRfTECt78mrHjIGt9J++hCU+CJsWmp
         BGYSgyRSTFal8OV9U+ZCp4KCV/0v8xa/XJ0WiTa3zkA56deITIWmSpjgFXZC6BxtvZQV
         LA2g==
X-Gm-Message-State: AOJu0Yzezq6O4Ov3vjxfyerkoi9R47Cvl3zv+I6+cDDqMjfjr0OewxvP
	Wv76JzXAR6J0edvWj56wIv2Adk2n63BUrVUhjlw7CQJqB/zbBvp6ThELu+2SMls=
X-Google-Smtp-Source: AGHT+IFL5RmXbxgZsZdS/aW5kG9euoaEuFb5V08Lnqfuv5FdgBlWBEWZtRRP9J5to5emztf4vaYPDA==
X-Received: by 2002:a05:6512:220d:b0:512:ac4c:abf7 with SMTP id h13-20020a056512220d00b00512ac4cabf7mr1276217lfu.65.1708264597654;
        Sun, 18 Feb 2024 05:56:37 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w9-20020a05651204c900b005119fdbac87sm548698lfq.289.2024.02.18.05.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 05:56:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 18 Feb 2024 15:56:35 +0200
Subject: [PATCH v3 2/5] arm64: dts: qcom: msm8996: specify UFS core_clk
 frequencies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240218-msm8996-fix-ufs-v3-2-40aab49899a3@linaro.org>
References: <20240218-msm8996-fix-ufs-v3-0-40aab49899a3@linaro.org>
In-Reply-To: <20240218-msm8996-fix-ufs-v3-0-40aab49899a3@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Nitin Rawat <quic_nitirawa@quicinc.com>, Can Guo <quic_cang@quicinc.com>, 
 Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1101;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8Jw52K/qybWNDYMmkfmKEVECM6bSjDnqNRJimByERIo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl0gySFeeR8Nqww3tj/VSGTJTNnyikgeG2I7SyZ
 nNXRvBa+i6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdIMkgAKCRCLPIo+Aiko
 1agICACMPq45pXJ2FruwpBy6twqsBFRy9Y0zr0Gwe0U2kTtQ+uzvScPfqTrP1YHBZh5MvwylSWd
 qHM8jpr/LVUAqqwFc9WtFPG+kC4eFdHHj3dxjw5eh80S5PS8dZoHE898Dk3c0h+BVm4CY/QD894
 Y8184PCxoytoLP4mmFX7jvk2cAnoV6RK6CpqRHhbkYhk+Ztb1Sqia0YfSjDB5nPJuqKFsOTCIk4
 0PRzx39Vx9n7aTOPwp5fKv7/Qlp8qCEyat4aSdkBbCGw0qApwitzCRUAdxVioVV/zeli3fugrE6
 HLKByBugfx3unbAO52L9mCTYcV12wipnd4jazSgrAr9jaxf6
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Follow the example of other platforms and specify core_clk frequencies
in the frequency table in addition to the core_clk_src frequencies. The
driver should be setting the leaf frequency instead of some interim
clock freq.

Suggested-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Fixes: 57fc67ef0d35 ("arm64: dts: qcom: msm8996: Add ufs related nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 80d83e01bb4d..401c6cce9fec 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2072,7 +2072,7 @@ ufshc: ufshc@624000 {
 				<&gcc GCC_UFS_RX_SYMBOL_0_CLK>;
 			freq-table-hz =
 				<100000000 200000000>,
-				<0 0>,
+				<100000000 200000000>,
 				<0 0>,
 				<0 0>,
 				<0 0>,

-- 
2.39.2


