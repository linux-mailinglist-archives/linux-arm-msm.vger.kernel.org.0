Return-Path: <linux-arm-msm+bounces-14342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E48287E404
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 08:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37F35281179
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 07:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D04382577D;
	Mon, 18 Mar 2024 07:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EHeZtgPE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E2C25761
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 07:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710746361; cv=none; b=jw2xh1dqWpF1YByvl7/sxVODeUCq83m1b1Y6+rWU1cPYiYfPB5G0dnVEIEedlNgxq/fvb1a+q2I/DjSy67l4hkFi40hoWDeEYCWEvcGTXGaMt8D2Ssq7uwpV0ros7FA1h91gq8783Lh3voFTfs/b35N21eDofHOf2plzW8pS1xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710746361; c=relaxed/simple;
	bh=rq/JWeJfwa+47UTE5z66gjbDrTKJLAljsi84x0YRn1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f1RyrngXz2ahxef/ek43ygYXkvIR35NDq3oJFGNjB/GoRKop5xoM191RgSbPHlC4GkSZgbeJNxnKqPfQJa2AJODQUGdWEfofAjId6BjNO/+Xaz28Xjhn/naFPkWWy21OXF6sg5QVSoXHzlY+0IK2HDjUu4D7aLDIvK4bVMRYoV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EHeZtgPE; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3c1a1e1e539so3436574b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 00:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710746359; x=1711351159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=peDqrf3lDzXyT27A8hkXTSlSS0NQMm0NYY4FTf2ze+I=;
        b=EHeZtgPEE3EiEuSLPsy3uMr0EVavsgo7zuRtpsiH8kZyEMaXnU7DG7QVOW3Y5TuPum
         NZGiPP6xAjSU6GFCdyHH17a0CKDoyDeioSyYMfoFET28RzGAaMoaLaayPOH5NyRTsMVm
         0mUxKqQL3BuYBrJ9gVmFwCII5HMPDEg5kI7VC1rlPLfFTATif/G9KY5ch/d/tAheR1HQ
         TfgKov1KM+J+tSrK5nSkxKPj+hLQ7JonqRkoKB3VuqQfrzdAB655qI9F+DFRGyFbKTFw
         a0vNTqgOVdkj4gnFwe2BxK+zH8J/L14i0+gGgA8VsQU/lhcL3UvH8MxSv5CWfwC7M8ni
         4YCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710746359; x=1711351159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=peDqrf3lDzXyT27A8hkXTSlSS0NQMm0NYY4FTf2ze+I=;
        b=dYDfW96kvnZYHdRfjxtndQzCd8DRjTkGGrw/S8Loub1UZ3R8B6XohFn0RVydUrCYWt
         U6NNoAgkKcRL3lAUOqZSGiCy1o4Zosmyqion+UOX0HwWCZLJKwSu1qeDjeB6qDJ6l+sb
         zlVgpRzBKGmjfkMMpN+fZGfr09V8QRk81eUB4Sr/EtndqR4rjbl3BtTfzB7HClT2XjeS
         l0jOSt8T54EYCGamzJ287oL4dtdAVm9lle9EeN8UgF2lxI1VZ+zVcQqZnIFQoCY8vncU
         O9VMXgEdOzmpvHRX3AmaFShyY512qKl7ZiarRXI0r8MrZozKaH21w18/7H4C64GErVxx
         bhcQ==
X-Gm-Message-State: AOJu0YxGpp+MycSE0bho+8zSM1dFo5ZNZyzkKjgJis6gqmwclr+9ck3R
	eL/4RL38fmsvAXNEOieLZbKHk99p+sbSmZpP6GdFrUohdkcU+RqAVyBgdoFxvw==
X-Google-Smtp-Source: AGHT+IHCEXCkkicFHPqzMoJYtv957hUagwd50f9Vz56pVIGqLDE1HWdz5aTIjyYY+wc/RBG4HywTog==
X-Received: by 2002:a05:6808:2e4b:b0:3c3:8830:86fe with SMTP id gp11-20020a0568082e4b00b003c3883086femr3449028oib.12.1710746359276;
        Mon, 18 Mar 2024 00:19:19 -0700 (PDT)
Received: from [127.0.1.1] ([103.246.195.160])
        by smtp.gmail.com with ESMTPSA id x16-20020aa784d0000000b006e66c9bb00dsm7387515pfn.179.2024.03.18.00.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 00:19:18 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 18 Mar 2024 12:49:05 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: sm8650: Fix the msi-map entries
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240318-pci-bdf-sid-fix-v1-3-acca6c5d9cf1@linaro.org>
References: <20240318-pci-bdf-sid-fix-v1-0-acca6c5d9cf1@linaro.org>
In-Reply-To: <20240318-pci-bdf-sid-fix-v1-0-acca6c5d9cf1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1806;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=rq/JWeJfwa+47UTE5z66gjbDrTKJLAljsi84x0YRn1E=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl9+rqpS3tSZyn5nT5m8XnYf433vP7qur3M016c
 weAuR6t29WJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZffq6gAKCRBVnxHm/pHO
 9Sm0CACbPTZu35ob3v4W4ZENolLAtUV5EG/zM1Pxidibyfa06T/ak/gljL32kJjKT/+kwc+ZAxg
 IXs2VabHIxsQ6rgqmVa2OqMRjU1E8gLzDTpBCmAC/0afS/qdj3fsmIXGpZd9xqp68SzDbthmBLG
 Zr+jVZDmNWSh7sqtyqT6NDJZlPy5KbyBnZ4RU5lnYq5S4guFnl+FB/NvJyIK0ox2T6z/P14fJxU
 4eSgmVm0aZESSDPdHGMUrIL8LUOnC4pZUaBMTtbr8ah1vhRCGln5l+r9xHaWbrbfYVMsq8bepyq
 7QImZZoJeVD2853iiC/klWcHXkUNiMiicYZ/y9OkidjzVfez
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

While adding the GIC ITS MSI support, it was found that the msi-map entries
needed to be swapped to receive MSIs from the endpoint.

But later it was identified that the swapping was needed due to a bug in
the Qualcomm PCIe controller driver. And since the bug is now fixed with
commit bf79e33cdd89 ("PCI: qcom: Enable BDF to SID translation properly"),
let's fix the msi-map entries also to reflect the actual mapping in the
hardware.

Fixes: a33a532b3b1e ("arm64: dts: qcom: sm8650: Use GIC-ITS for PCIe0 and PCIe1")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index ba72d8f38420..eb117866e59f 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2274,9 +2274,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			interrupt-map-mask = <0 0 0 0x7>;
 			#interrupt-cells = <1>;
 
-			/* Entries are reversed due to the unusual ITS DeviceID encoding */
-			msi-map = <0x0 &gic_its 0x1401 0x1>,
-				  <0x100 &gic_its 0x1400 0x1>;
+			msi-map = <0x0 &gic_its 0x1400 0x1>,
+				  <0x100 &gic_its 0x1401 0x1>;
 			msi-map-mask = <0xff00>;
 
 			linux,pci-domain = <0>;
@@ -2402,9 +2401,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			interrupt-map-mask = <0 0 0 0x7>;
 			#interrupt-cells = <1>;
 
-			/* Entries are reversed due to the unusual ITS DeviceID encoding */
-			msi-map = <0x0 &gic_its 0x1481 0x1>,
-				  <0x100 &gic_its 0x1480 0x1>;
+			msi-map = <0x0 &gic_its 0x1480 0x1>,
+				  <0x100 &gic_its 0x1481 0x1>;
 			msi-map-mask = <0xff00>;
 
 			linux,pci-domain = <1>;

-- 
2.25.1


