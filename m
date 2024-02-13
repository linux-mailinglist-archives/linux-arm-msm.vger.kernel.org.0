Return-Path: <linux-arm-msm+bounces-10872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D8030852F41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 12:27:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F06AB2109F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 11:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5B2154FA3;
	Tue, 13 Feb 2024 11:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EwDyIszB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE48C3B79E
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 11:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707823348; cv=none; b=APaX4CW3MUse6XxjWAGsoSYarycr8hmdGqMHgG12lB5OhOx/qD2rW/BfByLR6EGO+yXv9DaBwS0twR3c4q06LMXRaoE66Y8AaVwoaa+x10zYSxAxBdh5P0wr27wa71XYPI2tA6Eh6RJMcoX8afu2cjLWNNgyGD7O7Mmm8NnR4rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707823348; c=relaxed/simple;
	bh=iD4ooa7gvFH4iiY2/KlUwjcOqPjF6mqUsxynf2nxGNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e60TcQsqe4PMyiVCZfqRB8KQJQC1MKoAiDmgYX9mqzhF+KJsWih0LuF31tCKiCjYWPkI62YitG65nTLNb+ydFGplKkxA35h1OlKlGxep8uT/qJ2HRIdwW2ghP/FpP8t11uTzXrwX8GYtatvw+DFq0Jg0OSa2hM90OA6PQoz+6eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EwDyIszB; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d09cf00214so55623211fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 03:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707823345; x=1708428145; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M9V8sbN4gr+TLnTlXHz3cByz2rorgZMwaVdaiFbdyko=;
        b=EwDyIszBHc6QQ724khD7SZ6GuCuPgpAVHj1iX/X6IfJ+Ty9oP1apr+wa7ZlSCwoEEy
         MzB4+D9YjXYrCKcUTvKImk+BamZwHRyMbNx6AvG3tl34fLJbNUfyUpVOkOvlFvtg2QXh
         LexoSG4bHnQwnslR5hRMWl2ztESJnDefibg5DT2et3xZ/VDDt+XBu3G/rhtxjSyy0v8Z
         C1BszyuldC8LZiMUchYTywW5YJzQw7UaFzgD+ipiTYWG7MCy7HZTwQSZyaeCKSEtlvjp
         JfIjy65IoLvA0plUe95E+ohPxSG8VjYqKe3ehxi+gD+RNJ921u4LVsnrLVmEmtIeGZvR
         ixjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707823345; x=1708428145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9V8sbN4gr+TLnTlXHz3cByz2rorgZMwaVdaiFbdyko=;
        b=wxenM3+zacQTKdPt+O08AmxPqxaTFNaUN5t02oCMw/JhjJ+yqgSjHMhnnCAwmIiAbv
         LJvMd/U4Yw3RXJVfKZMtDPaooh5SwRm1U5m8ER5KM/fZOYsUzpGm1WRomzYmJtjpw+Yn
         VZPFP3fjhqOojFHhVu7TPFa41qmo89tGYJeI34+U26HRXy7xrXSfWVq91+o/S6vvedJG
         ymIDGhgBrKwsSgqVlfXfWAqSOwswyDyM4+9chtXKTovwkxgJs9X6CKiSEL8/XEZBPQpA
         npse0Bchl1uxxnlI55jUZi3J2zZBDfFK6Sv41jw6LWB6ajgCUHna056vnC2104jW2m2O
         x++Q==
X-Gm-Message-State: AOJu0YwHkzeDvvHc915UQ2QYsO/7+sQMSZrzoKLwPeCkes+KbgTWSsyB
	YpxfQyTtKPMoWukD2Q4FT7SSY4eerGrspabnJdpV6j/bqjM/c0m9jbYwkohvAM8=
X-Google-Smtp-Source: AGHT+IGu58abjsFrIK1v8rGFCA0U+F6imMK60PwDOF6Uo8JxD7BDOdZBIV88nDYqdLj2EMOKtUdqhQ==
X-Received: by 2002:a2e:8784:0:b0:2d0:acba:302c with SMTP id n4-20020a2e8784000000b002d0acba302cmr5058906lji.38.1707823344758;
        Tue, 13 Feb 2024 03:22:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW3m5vE+sJaaRrnsq+SdkjsaVzhAG1+xXj41PM8wmKPgN/IR1ztRvUeb5KNGWg3DBgNp7CfPju/IdB5arZFrT3pt/j80CMlTV1+9UBz0tLS0ZkIxV5fXGGKAp/oavyT+fXgEY1efZ79yvMUe7VPOL3COnhlXtsoOtW1d1CN2d8gDQDe8rcYBT+xMGn9zDwqApzAzYmHiX+XpWh+HTVjKEriSuJAXbj7cTo+24/9NQahVV3IDZtdzp+aS6kDUpv8PFZ92HTR11/APnWyU9taN2/V2ECVn3F6URV3mYr+OkVP+34c0+dkTmn/IimkWuI9DT2EdZtyX77RSzCNG+DoQJBpY1czHHTLszhbrtBect7JraTHnCr+2UDHNsa/HIS8WjVNxPwOI11U9t1eOQDeHb78lNU1S9iwg04/sPRuGzxnrQieVKfLd+z0/NFyIDiWagQALoetMY8ylqscHnltXSxd9ObNPeWUw1H5fXe/xs/acRdNj+eHQXCB/e2+Tr+6MWKyY8Oruy7BQj91EOeuIJH5XQxSEPZRwfSmr6E2Ihq3womVYglOeVWQbdFdfZMajz0o
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z11-20020a2e964b000000b002ce04e9d944sm451107ljh.69.2024.02.13.03.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 03:22:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 13 Feb 2024 13:22:22 +0200
Subject: [PATCH v2 6/6] arm64: dts: qcom: msm8996: drop source clock
 entries from the UFS node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240213-msm8996-fix-ufs-v2-6-650758c26458@linaro.org>
References: <20240213-msm8996-fix-ufs-v2-0-650758c26458@linaro.org>
In-Reply-To: <20240213-msm8996-fix-ufs-v2-0-650758c26458@linaro.org>
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
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1469;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=iD4ooa7gvFH4iiY2/KlUwjcOqPjF6mqUsxynf2nxGNs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBly1DrJy1H3oYWSSDAMZFzwBPQ1VH6fqx8zhgAs
 7GSHotR9vCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZctQ6wAKCRCLPIo+Aiko
 1d7bCACCfJ4zpXitap/cJOFAu7Js4O9gVA7De66YByXSIF7ebZvVbXEt3BP7iGCh/KvYgWyLC6O
 HXOsnDJUUncZ060nYQJGFcDFij2S2EzAcLuzWGQGKfzgcdzUecBgb61K4YgW8j9V2F6i1zeGlkc
 rOr1PNTp8/b4xZgEfXBVlerQUxfnGMuExDgET6ZDTtmoukg/RQiGOzjkRGlgMQIX0imAiILLc7f
 ZV0c0qdp3wzbo2uIKWfbKScrQNrfQR9jBCtp6T/ITe+jwLpYJqnXmV/OKM7oKlrbVSJnxgglvdU
 8CabrLISpv4ZE1Kj/5hatjpdKXuR7lxw5Uuu4fmg+H8fm237
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There is no need to mention and/or to touch in any way the intermediate
(source) clocks. Drop them from MSM8996 UFSHCD schema, making it follow
the example lead by all other platforms.

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


