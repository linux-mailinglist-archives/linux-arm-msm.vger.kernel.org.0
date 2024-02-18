Return-Path: <linux-arm-msm+bounces-11594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 722BF859748
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Feb 2024 14:57:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3B2728101F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Feb 2024 13:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C77E6D1B3;
	Sun, 18 Feb 2024 13:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BKPiNtPd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728B96BFDA
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Feb 2024 13:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708264603; cv=none; b=X7kpHzax9/nmiKPpo/eaPonJkr5gO7v/ZD6yYkJdZo9hdsfNQ/Cgx0+LvpkhIu72UUSB978wskRQP/RuYaw1TyyRzKI+HYlsg2fyv2iglfVMiaSzIzk4FNPXa9ySL4sH0EIxI4dZK3xCyWlPQEBGLn1CSyh5hejcCF8q/+EDMwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708264603; c=relaxed/simple;
	bh=5/2tUPFDY8rn6BKKryQEGZNAdZyZ7qK6H/ztEl0/dfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sJu6+ZXFkXfwf1Dz2x30kZywEL6itdTtunbGLJSZL1gWNox+4AX0U7wW+1rOacJ+GVWLq0frlw2faxxb4n7cIMgDWTcrtlAwcO0K2Wnhw5lcYOSzkjvqps9xwUM2CWL2EWR02IZ/P93DMs2knq0dbupOfwdkQMV2ofFpGX6Dqb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BKPiNtPd; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51299e0cb8fso2372182e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Feb 2024 05:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708264599; x=1708869399; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qVoA1ANzdbe0FJlv0J4O2Wqp7VzCUhtM15EgEKGlLeo=;
        b=BKPiNtPdHraV9Ffm4LdMVta+tmdDUyrqZvBgDqrR/wK6hh4sAg0Pc5pkeY030ulvHW
         CfvvOr9P9g1pHV9g9SoT2RrcHMGwKVSBKlvwrtu/rePNY7/iLFUGCyR0soivkbKqtllD
         E96sGsmClE5DW0Ry6HnooBBd0QuoFVlcOvO7eLkAywboXBWlLhw9FzSO6cckxAjCzmIN
         WegSKj7u3Gy8cuenExYEsbUcxjRNYDYYeSYtIe/SfS4yj7+veB6aNrQmG08g40SzrzHl
         /SRPEyl7x5nHg2BWqSAi8IB8yekQP5eU9ghZEGo6s3FMjZt+dVLB3cBTf3UUnm/gRj00
         RP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708264599; x=1708869399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qVoA1ANzdbe0FJlv0J4O2Wqp7VzCUhtM15EgEKGlLeo=;
        b=FN25/V4IA5iVWrffF08ljB9/q99tr5VNiIxmzSRsu2Q+EzQEhWUmPATv27haOLemRR
         WeJWnKc/vFOcWlI666wZD8lMpTYf6aHKq3iJRBY+BunCs8vJlBI4DhxMPc75O3caePR5
         +1abBBta78cFyvNVuLjdFuBIu5RbpO6Z4ZzRo8Rm042In37X8qQxq+kGn7Vgn3/rjccT
         KKDFkLpLu42YTNHHKiLHTQr+yf5tJqUJEyQPOXWGEs1sRBw2J5lPunxpw9G1Mp2/RVFT
         V4VB8TE93AeKhOPUlaw7r+O1babTg5t6uD+jULK6ysRyMeuseBJ9RnYb3wPwYUhfj7xZ
         KNdg==
X-Gm-Message-State: AOJu0YyBVCTS4ogCWoAmzr9u2EV0Bl7S0xYevK8IRQeDzsHNjSn/xdJw
	jXJ8n2CH+gN/4G4OMcvPF5MtERuh+iREHrhLCCpKWG8br121IfXt+Um6d+G0wmw=
X-Google-Smtp-Source: AGHT+IHlNOGJwWnLzPunxcunoXNUiKAL4QraL+pMHJvkl+d6rEs5Suy6efn7K6MOWQsV9Cwe+MbokQ==
X-Received: by 2002:a05:6512:3485:b0:512:b2ff:aaa5 with SMTP id v5-20020a056512348500b00512b2ffaaa5mr294158lfr.20.1708264599751;
        Sun, 18 Feb 2024 05:56:39 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w9-20020a05651204c900b005119fdbac87sm548698lfq.289.2024.02.18.05.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 05:56:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 18 Feb 2024 15:56:38 +0200
Subject: [PATCH v3 5/5] arm64: dts: qcom: msm8996: drop source clock
 entries from the UFS node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240218-msm8996-fix-ufs-v3-5-40aab49899a3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1595;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=5/2tUPFDY8rn6BKKryQEGZNAdZyZ7qK6H/ztEl0/dfM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl0gyT5VUkDlw8c6k5qZmwVfZjWiSZypdHWwl+v
 X7gZ/C9q+OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdIMkwAKCRCLPIo+Aiko
 1Z7vB/9sWdR56Hve+vaWP2jvHtgdAf5iIaAwRBMU8brmRi0Hg/Z38UWqHf2hhu/kgMc7lQdb9eR
 dGCJs8fFsoyOSVqpW1ps9fxTqujpVSNqCzZDW/s5w2cnHHMhTiFN03/iuJ7mN9McCoe+1WYpiw5
 ST1otAxFE+J7gF1/Qb0Y//ol0yXnzUxF2IKeN/xu5zvDerbQLnFStjBV0wKMUR075hn/LSSHsSS
 p6agOKhlF4U0RgFLDFKX9CFcODQRi+1oqdedAJs7ENH5R8udTaxKRCJAzTje948LXOSwHXbCVlY
 y+n/BmS2VkkqSScP6aVyXKX1isLB0fwPZyqqZ9UGG5+CGKwm
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There is no need to mention and/or to touch in any way the intermediate
(source) clocks. Drop them from MSM8996 UFSHCD schema, making it follow
the example lead by all other platforms.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index ce94e2af6bc5..f18d80a97bbf 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2047,24 +2047,20 @@ ufshc: ufshc@624000 {
 			power-domains = <&gcc UFS_GDSC>;
 
 			clock-names =
-				"core_clk_src",
 				"core_clk",
 				"bus_clk",
 				"bus_aggr_clk",
 				"iface_clk",
-				"core_clk_unipro_src",
 				"core_clk_unipro",
 				"core_clk_ice",
 				"ref_clk",
 				"tx_lane0_sync_clk",
 				"rx_lane0_sync_clk";
 			clocks =
-				<&gcc UFS_AXI_CLK_SRC>,
 				<&gcc GCC_UFS_AXI_CLK>,
 				<&gcc GCC_SYS_NOC_UFS_AXI_CLK>,
 				<&gcc GCC_AGGRE2_UFS_AXI_CLK>,
 				<&gcc GCC_UFS_AHB_CLK>,
-				<&gcc UFS_ICE_CORE_CLK_SRC>,
 				<&gcc GCC_UFS_UNIPRO_CORE_CLK>,
 				<&gcc GCC_UFS_ICE_CORE_CLK>,
 				<&rpmcc RPM_SMD_LN_BB_CLK>,
@@ -2072,8 +2068,6 @@ ufshc: ufshc@624000 {
 				<&gcc GCC_UFS_RX_SYMBOL_0_CLK>;
 			freq-table-hz =
 				<100000000 200000000>,
-				<100000000 200000000>,
-				<0 0>,
 				<0 0>,
 				<0 0>,
 				<0 0>,

-- 
2.39.2


