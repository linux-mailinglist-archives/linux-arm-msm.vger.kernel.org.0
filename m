Return-Path: <linux-arm-msm+bounces-7465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08374830786
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 15:04:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 884221F24D12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 14:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2328B208BD;
	Wed, 17 Jan 2024 14:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HHUbgYuR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469C9208A6
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 14:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705500272; cv=none; b=MLbYXkylY5M36IYdst1pO0O6++ac9FQ34NUn6ROlhITHIpJwmiMVDKikpEGDYB8YKh8DO5Fj2qKYBdLACZslhUUGGWlAE12Nc8ABWwKSuGR3aC/Xovk2M/e67TibPXYfeG7SLqZ+Mc9vraH8oj9r1BM4Be4qV/e6OsX8i8v/gCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705500272; c=relaxed/simple;
	bh=PIb4wJZB4VPlU9DjKkOwyEjMvVPp21zzloRzfQ9S7E8=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key; b=S8Na7Nr2qds62HyJo4IfgHPhUgTFw+ByOSyTTzM6B1Y91nHiEOr/XK+YT0dmWNkSVBclyGrCUNw6/fCJ3WUkGSwzqMmS6lYTiyRxQUlFpNUg1E/uSYqKcVOx7zeZbd3TzX6Cz1+vEhXNXkDhlFGxtN/3FupATmpvF2/uf8Q6Wio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HHUbgYuR; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50eaa8b447bso12558885e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 06:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705500267; x=1706105067; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UVMtrjYxxS8jU9P9HQIcKp62CJkYBOMDQz6j5+KpHA4=;
        b=HHUbgYuR/l4dQ704nWAHTkuMWuGO+nvjTD2qO65x/M0SgVhP2So2Jbw2oLELNIt290
         CVFc0nrAVcOTxfR4J0u7wLLynT2vSiKG26kk7jwNjF3xkNq5I6MBr1NnvXGIIa+3zn/c
         1ugYdoLJqjkkU3GCKjJwm30j5atHV8iYJKRMDmx7qbLjuIv4PZdyYr7C60aVizgNN79I
         fe2Jqpt4r14TubKYYdEr5PbiVh9pCNimJKpfhd5cdy6sp7zWxhlYORrSn9PueD/xiO2C
         aljJZ2mAMezNYhq+QZRLg+Y0wHW9gZMl5a8AWGnJQTQMGAKXq1j3vDPzV8p4QFkEUM2A
         3t/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705500267; x=1706105067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UVMtrjYxxS8jU9P9HQIcKp62CJkYBOMDQz6j5+KpHA4=;
        b=roXoG5RiKqpghxYbhVGer69y/0vpoT5YrkVeDQ8zg846i7sufctTmV4sgnfBE6JdW6
         RSJa8sPLwNd2zRO+V+vo4gnyNBX1XOcBKm80ns+vIacHHw/wM23XieTtecK0xrmIi+B9
         X4WD4Zkhfg8svz+H123FtR+Eqo2KQ2+iDWvZbPoDQ2tqUy0d+dkiTs4pt1r6WA2Dn6Rz
         DGMzci4QbCyHFjEqWe3l3zRm1Z2alM8rTEsPa9jIIvC86j4wkxy+5nowt7X/Ysmjfdur
         rJuroJMLa70+K9g7xgOU20JGOFX+w/BJ338SA6dbM/3OQ2pxgD1zGulfNOjZTbPx2S5E
         empA==
X-Gm-Message-State: AOJu0YyN4pt93PYxkTEoXBWum+xDJ3mdiMJwTn8//VLRxbhEVzWiRjcv
	NILqlQMGd5vjkLba6pkl+ZG6kMKPNsd67Q==
X-Google-Smtp-Source: AGHT+IGnKfW/zKJEKLJ57VfOhgD4hwJXRAAE7C1938RtE1q8aYT02DJ+oHYYF8UDbye1cQopCmc5qg==
X-Received: by 2002:a19:6455:0:b0:50e:ac2a:6b5b with SMTP id b21-20020a196455000000b0050eac2a6b5bmr2074559lfj.95.1705500267343;
        Wed, 17 Jan 2024 06:04:27 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y29-20020a19915d000000b0050ec7a26420sm269711lfj.204.2024.01.17.06.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 06:04:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jan 2024 16:04:25 +0200
Subject: [PATCH v2 4/6] arm64: dts: qcom: msm8998: declare VLS CLAMP
 register for USB3 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240117-usbc-phy-vls-clamp-v2-4-a950c223f10f@linaro.org>
References: <20240117-usbc-phy-vls-clamp-v2-0-a950c223f10f@linaro.org>
In-Reply-To: <20240117-usbc-phy-vls-clamp-v2-0-a950c223f10f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-phy@lists.infradead.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1222;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=PIb4wJZB4VPlU9DjKkOwyEjMvVPp21zzloRzfQ9S7E8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlp95nHnrAdiE2GmvCls+EigE0xuWR5GY7+JU01
 Af/HfcBhoeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZafeZwAKCRCLPIo+Aiko
 1WJ9B/9cRMVbhIbRZHH2bVMJlbRMpNAkNqBgxawM6doivzRBHH5vgI66vUToizJLw901etSNeuO
 zrwWdqqvLNU4auJhXTCl2lwLdqFfKpv2e4nJEzp55cJ6Djcjf5U5/JxD9gVf60FrdDso92OI2Fl
 WdA+lwvrYrC12gZwYGsHAmYyZs8Ce5YABZ8fAz4P+NnAvApYc/Lpp3cWBKrfAMapHFQlyoeaU1H
 viVvv73LppXB+nKK+glygLd/uUiZCKQ5ooaTkXUXdGEBxP15Y53qH5aoy2GCw9WLGpOX6R7n2ox
 2xpyf2IZBF5pA2dN9jUqmFK8VlJTAGRR63eUuUl2mfiH+I1A
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The USB3 PHY on the MSM8998 platform doesn't have built-in
PCS_MISC_CLAMP_ENABLE register. Instead clamping is handled separately
via the register in the TCSR space. Declare corresponding register.

Fixes: 026dad8f5873 ("arm64: dts: qcom: msm8998: Add USB-related nodes")
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 2793cc22d381..317a91d669f8 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1072,6 +1072,11 @@ tcsr_regs_1: syscon@1f60000 {
 			reg = <0x01f60000 0x20000>;
 		};
 
+		tcsr_regs_2: syscon@1fc0000 {
+			compatible = "qcom,msm8998-tcsr", "syscon";
+			reg = <0x01fc0000 0x26000>;
+		};
+
 		tlmm: pinctrl@3400000 {
 			compatible = "qcom,msm8998-pinctrl";
 			reg = <0x03400000 0xc00000>;
@@ -2174,6 +2179,8 @@ usb3phy: phy@c010000 {
 			reset-names = "phy",
 				      "phy_phy";
 
+			qcom,tcsr-reg = <&tcsr_regs_2 0xb244>;
+
 			status = "disabled";
 		};
 

-- 
2.39.2


