Return-Path: <linux-arm-msm+bounces-9174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0332B843744
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 08:10:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACFC61F27252
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 07:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A131604C3;
	Wed, 31 Jan 2024 07:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I5WyQyuW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7670B60884
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 07:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706684941; cv=none; b=PtczPQm/+GrGxvGe/ct30raFUYmKkHY4x0B5eUKiBNeZFJ0f8Czhut5wRqpd8uwXcvK/0lLpauTM1kVNx0X2tQQkfmCEvYJorQz+zIFvmTaDackgcfkWHWm8X3hxTL2P+rDK6Sgl8fSAFKensXHIwDtlumPhrCH27NyILmkfpuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706684941; c=relaxed/simple;
	bh=oHo9/Iv14iEYhCE+ZaJXIeO4pW3mEpTmh/ZTf4/ZBSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PCiiM/sQNR3B7Im3vFHpZ+croDPbmsS9gD1mB1Z9DQXE/ZG0fjeduM1plvZHIA8g/9yvu2G1L63j7HIc+a6hKtSOdMGe91MYbQknYv8t3PyzaQ9AEeiQ03WPqU52TPl2zjaINhdvTMhsiA5vlC/qXf9HJtoqIYc2gwZ62Fx1n58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I5WyQyuW; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5d8b519e438so2556400a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 23:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706684939; x=1707289739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a+f1KbYOE8uwAMslptBk3PljatnhFo4ZiOznmj3zAzw=;
        b=I5WyQyuWS/4xsi5GM7XKzDGRSIJxIyXo1LnQMaXUKyvTr1SIJQaBWejgXJgw9rvAQt
         VrzIFby64bBkbNC02U4jhH4veNvgHAzOD12y1rJ29/H2oaKmnMmtLPrKPIdhU6bEGWG6
         3LumtCorFVUGCr33rBp+lzM3Y2eL5JdxOTh0Z1pNaX6lRVFLk0EFyYX1OaAlUxSSK5fu
         YEE0Ooq0sSl/PnouvgNa9hYHoAAes3CT/iHzM0S19j99WPuKdzp0TZoD6HLtYzLpAaNA
         WbHH6CgG8xIeCUoBhFp6zHq/FQ8TuTIwkb7aHG/dyGr6DV99zBIl5MCfhyZNPJWSTHX2
         4wew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706684939; x=1707289739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+f1KbYOE8uwAMslptBk3PljatnhFo4ZiOznmj3zAzw=;
        b=S3aaosFrhS2eMxf0T/A9Rp0T0Fkyo9AwlXabBRIOlJx3UGNNI1du8r+8sfjbtOsHcn
         UauZvl47fBi/9FgUoPMiStaxeIdDit2rNWPoYK0yeW0paaXbMFY6KZso8/dCL+eutVxb
         lir/gOTZZQ7U6D7E6Ou6vElKP8oZPqsBnWU9Mu1C9HVmkrdEqT48Toadx4t3EqDULWlj
         tiGQJ2h8RtLvYHA2ej+lD25J7S9M6o4oS6nAmlHNMQWYj3LTELibKAAuQyfRZTSQHXA8
         YqEJP8c2TW9367ARyAOUnZ8g+cKgiqS2Xbco1MfZD7ji1VNDK2jITEZsc73DFUclAx/C
         pmmQ==
X-Gm-Message-State: AOJu0YxX0X1CyeKkRpNpHNIQzZR46SUI9GWh131th8gxUW84yNDH+qeY
	cP9hbEcSSqjXCS/koFVkzv7wd63CJGmI/w+0VlG4qmgNsskGnLLsGHwOW5Tjeg==
X-Google-Smtp-Source: AGHT+IHrx7RXyom9N35srInD1Gmj8XfPv4lfYvTP2iZplvyzkBSLmKnfF5QQ2o1tJIpNorzQOWJarQ==
X-Received: by 2002:a05:6a21:9208:b0:19e:3096:ea24 with SMTP id tl8-20020a056a21920800b0019e3096ea24mr796815pzb.37.1706684938810;
        Tue, 30 Jan 2024 23:08:58 -0800 (PST)
Received: from [127.0.1.1] ([103.28.246.26])
        by smtp.gmail.com with ESMTPSA id lp17-20020a056a003d5100b006ddd182bf1csm9087956pfb.46.2024.01.30.23.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 23:08:58 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 31 Jan 2024 12:37:33 +0530
Subject: [PATCH v3 10/17] arm64: dts: qcom: sm6350: Fix UFS PHY clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240131-ufs-phy-clock-v3-10-58a49d2f4605@linaro.org>
References: <20240131-ufs-phy-clock-v3-0-58a49d2f4605@linaro.org>
In-Reply-To: <20240131-ufs-phy-clock-v3-0-58a49d2f4605@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, quic_cang@quicinc.com, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=oHo9/Iv14iEYhCE+ZaJXIeO4pW3mEpTmh/ZTf4/ZBSU=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBlufG9QqK47jNzzRNotnSEbEEAFk+SwBHVzDKUd
 ZHt30BHclWJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZbnxvQAKCRBVnxHm/pHO
 9R6OB/wMSfXE9mu08okpRkRqnZUZMmFoWUEwlG7quLwe3L+5xnSPWLu/SJ4o1XMRA+HGeM0118U
 Jf6XZghejsBxnhxHn+qkz+mrNocVRbcTPlQ+7+3jtXhRrRBzSmMNdMROZzSgAhEEfWC5SnD68m+
 1UcARLlmFie6CiUfpxVB/xR2ZWYvHcdcxTABL/WuMLht3K/o13XEM2FDtbaCb2uNJJbP3ikiT+7
 dgAPe5c7kLMD6RKXAXCar7Q02gwv5HKkabrWv4GX6AZ36RCZeOh8MihT6w84A1Klf8yNOoWJ9Nu
 YQkIB3mfRFzfKUFkRXk5GbDH20rSCofr2yUxx/nW0HmwPNVl
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

QMP PHY used in SM6350 requires 3 clocks:

* ref - 19.2MHz reference clock from RPMh
* ref_aux - Auxiliary reference clock from GCC
* qref - QREF clock from GCC

While at it, let's move 'clocks' property before 'clock-names' to match
the style used commonly.

Fixes: 5a814af5fc22 ("arm64: dts: qcom: sm6350: Add UFS nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 2fd363953bdc..49fc4cbe1294 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1189,10 +1189,12 @@ ufs_mem_phy: phy@1d87000 {
 			compatible = "qcom,sm6350-qmp-ufs-phy";
 			reg = <0 0x01d87000 0 0x1000>;
 
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 <&gcc GCC_UFS_MEM_CLKREF_CLK>;
 			clock-names = "ref",
-				      "ref_aux";
-			clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
-				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
+				      "ref_aux",
+				      "qref";
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";

-- 
2.25.1


