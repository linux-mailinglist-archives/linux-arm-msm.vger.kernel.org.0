Return-Path: <linux-arm-msm+bounces-16714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A3689B4DA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 02:04:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F4CB281305
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 00:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75288BE55;
	Mon,  8 Apr 2024 00:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nKw4Fguj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7898AD4C
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Apr 2024 00:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712534678; cv=none; b=Xrrqzb2vaQZ5Fw69lDJ+J7qeO8RBOV/X6yNVPd3ASr5fUSorXejVuLEbaqt6qrlQ6Dbw28jlqOEm9e/HAWjBC9AX3lBjtbIdh6E/OJekcE18oqpdX8G1k9TY0LUzj4Ftw8s2ysT7d+mzPNLxfMDKLXiobTqOezcirQJRH7eMqEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712534678; c=relaxed/simple;
	bh=aRYQeL4Y8toOXnkm/Yr4Y1fKV2VEuxZ++Bc+tR+WFvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kqmQwut8UOEEDDFrTcCM3HEigWyw+v4lOWKV/UBdSDMJvDIQ0I4frdSjew0/PZCuniHB4pUs2HV2p7k0ydM2yF1KIDVPG9SByfMsTeDxHAA0xQycprGVv2fdniFw6kUm+OnMokkq7ERsDAPDLCAuzRqa/dJeUcwpEipAiamMhxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nKw4Fguj; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d8743ecebdso17732611fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Apr 2024 17:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712534675; x=1713139475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2V4YfKJutpGTD3SdZOEw66m0js5pB+R1nvu58HzXs+g=;
        b=nKw4Fguj3hDWIcB4K7q2fC0wgUwaPVwLAkwDMYmE/uK/HnCLn6UvGmaezFkBBIu6gJ
         PqLkkr/eFlPT+W0Af3hFPVFHmWFo8FyVyMZzYcF8/RaImxlTiSc2pqnDndYSpnViSJWu
         CrvTNVVueHg7YLA91tyCMTFJQn07NgERWTnZMj4Qvd2BOsb5okUmFUnTHJ5hHeu+T579
         CBHbzEOQ2X/7OlfOY04eYaS1zKswcgZwcAIO5OvM9HoZNqHeYNuB2TxNKVCzwstWygoV
         BtaQ2KD/JdZjhtrtRFDOPvZoq72jgLtaSqBFLMNaPVBWtvuU+lkOu5Ys8oo6uWxgIKcs
         fIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712534675; x=1713139475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2V4YfKJutpGTD3SdZOEw66m0js5pB+R1nvu58HzXs+g=;
        b=uU2kgDSlUfiSWAx3BGlUXlTzn7OjSWPgcGuJbpf/UxRHYWiNwncLumbB+lxV+zW3vn
         BmPBEJb4k3tu5T5IaBjehK2b1qKDMdKvLqhh7iwDTAQB61AbIh/TwzQA2MWYTWi+N4KV
         XnVuhxm72FCJCaIX+CLi7nfIKHzHg8H7XJIaA9q0s51RrbltsBXc549hSwJcjzHg3Y44
         nLNulG6XsifIAbfP7cWMbuN1tihd0kuNkOsWO/L2dpAXRCTsGzEaWy6eR+Ckcz2iVpQX
         WiP44Fv/u16oLrRXaM+ZrbxOa67yog24kx8tcuBvNxf90Kmhc6KuCjCDUp/hEXHJrM13
         hf0A==
X-Gm-Message-State: AOJu0YwgsuBkuIKxMFOWiWioVIKr7oDVOznjNlvOkZOu8yee43VApDEB
	UaMBvpvhN4KoPC0cY1THrHaSBOxv3m7ftl9a1tFJ2BkU1hG6PYZdwSBVtBR+poM=
X-Google-Smtp-Source: AGHT+IE1D88d7O3vSYCxcmI0nBH04P0LNMhxQkl2m/MX0jIwy+GxEwOEd/jg3fCEUyILlPuE3VofGQ==
X-Received: by 2002:a2e:b17a:0:b0:2d8:2710:c64c with SMTP id a26-20020a2eb17a000000b002d82710c64cmr6077212ljm.1.1712534675071;
        Sun, 07 Apr 2024 17:04:35 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n9-20020a2e86c9000000b002d2191e20e1sm947077ljj.92.2024.04.07.17.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 17:04:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 08 Apr 2024 03:04:32 +0300
Subject: [PATCH v4 2/4] arm64: dts: qcom: msm8996: set GCC_UFS_ICE_CORE_CLK
 freq directly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240408-msm8996-fix-ufs-v4-2-ee1a28bf8579@linaro.org>
References: <20240408-msm8996-fix-ufs-v4-0-ee1a28bf8579@linaro.org>
In-Reply-To: <20240408-msm8996-fix-ufs-v4-0-ee1a28bf8579@linaro.org>
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
 devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=930;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=aRYQeL4Y8toOXnkm/Yr4Y1fKV2VEuxZ++Bc+tR+WFvg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmEzSQv043H5v3I8wskLuSYpY4T5Q0DSjfkySq3
 7WWrh+dVVWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhM0kAAKCRCLPIo+Aiko
 1efiCACtQV4p+1ZDOD2mn5pK/s4Nt7O9hVrFenLdII11PAOU2E18yOzudBiHJX66LFujZeKJeoC
 ux0UBI/gE0RNAD54vq2eaHI9sF0fIVZvLxxMJn1/RTOhUJXIyLx45fe3uf2l0eLFtGM3AYs5LRP
 yhaQ8UOWmJxYIRmqPLI9nYUwxqPSPSFjY+rwRgDfsZXcTQOjQBehmLa4Pfv1mS5sg7CmG/Pla/k
 avqtbJoIIktc6EMR6cb+cMARXHm1w1dCGBPEIkPWxbQKs+qEPRgy9A8s9MUo4nOtQT7YGIiLop9
 iEA1wV+z10uSi7mZ5BYvE5M+sW1P881XmyIUQWW5rFYkRdIR
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Instead of setting the frequency of the interim UFS_ICE_CORE_CLK_SRC
clock, set the frequency of the leaf GCC_UFS_ICE_CORE_CLK clock directly.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 42ad4872f94d..da7f599bd2a5 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2076,9 +2076,9 @@ ufshc: ufshc@624000 {
 				<0 0>,
 				<0 0>,
 				<0 0>,
-				<150000000 300000000>,
-				<75000000 150000000>,
 				<0 0>,
+				<75000000 150000000>,
+				<150000000 300000000>,
 				<0 0>,
 				<0 0>,
 				<0 0>;

-- 
2.39.2


