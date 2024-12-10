Return-Path: <linux-arm-msm+bounces-41240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1571B9EAB5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 10:08:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AFAF2838C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 09:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36BBD232797;
	Tue, 10 Dec 2024 09:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wjyn51r9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A31E231C99
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 09:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733821680; cv=none; b=eVgjfsZrTZwSeQxx6tRWsmNZS3jpCk41K+5tGjAvnjUlC7LdWpFIhQetIV9if8MOUI0DXPGqhfRQXMm6k77E1jK9uxcS9t8Mq/c/7QNCr0RnvfCA8uDgEofvziS/5XdAmZ1PQvy54UOwVHBltDojNYqhN4Nqe2nkXiW5N9MWfz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733821680; c=relaxed/simple;
	bh=G62QDR9KzGAuOEXgvjGcNdCa05MWSfkst/s7DaSFLxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CECDubXWcvsyaf08crjdCMr7MoUtTmXquQiV7b2sz89wKbo3ujzdgrA6v3OeeBn+qLOwqGj0dj/kT7ycEaNlp/McsZD9eLJwUgHLmvTHEl29ADaU5VuGDBtrMDHdD2RyAQiFhYwGLY3QgiVCNHkDr9AdDLXcs1GxUwbKCNGAAro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wjyn51r9; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so4400869a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 01:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733821676; x=1734426476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=spfdeCDp4ZwiXNukmisW5nOmm3Xu2k+GZv9IXO8bo4c=;
        b=wjyn51r9C+OuGy4RoyTA9Piof1S1gPG2IKUQgqSWi+k8M0tO/F/D24ap6XrzRpWLCq
         hqNbd6ONnsbVNL28cbiJmgoTJkjaxzYQQZ1+bN2yMHiZC3X1bfmYrPsX+dazbVi/t67R
         9kbRtrVrYTghpaIMSZTXpSd3RGU6YyCAgsNCrlcH38cTuyEWUqCHHndmDO2pLa2fNW4l
         xINN12gE6ETfYqmSAFtHA0RtuTQk5ZZW3GtsufAYnF2wHklTWsvLSpM6lIDCKTI/Ap5N
         pxoyx454Vvf7G7fGhQcPdCLlhvJRI44mMfKdDwEWtM1u7XRGm+Ny3h5Tpe5TcS1S8vbc
         R7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733821676; x=1734426476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spfdeCDp4ZwiXNukmisW5nOmm3Xu2k+GZv9IXO8bo4c=;
        b=Sl2rMWitIGxap98t3DoXOHEU6cLCIAXWeTf3Ai/7KAiyQcqEpSxsHhMLpGNq2YwH19
         2feoIzhImqMfAaOO2z/T18xpuGI/U7RYHbv5tTPlVuEGde5w4OAxtZAUzMLDA5p4wU4M
         isx9CNtwKmtgYozy/BfTvBRerAl7TxW4ZUeAbv3AZMj5hxbc6FmJHAh6nc1U9tW3Cl+4
         GEtffk8qln0z9vjCgmWyz9+/mk3N9FTHmw3xA/KJgcPsl3VAqOlqUc24DJGbnhlSJEml
         w/c54iNFTNfYDhC0YT/fKlyMcYHaWSPtO+4d+EJm+OmNTGK+ARM6G4zQr5bNkM7GKjp3
         V/WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNMHS2hds1iWKUQ+RNgIvNupWSLvSSfRL2arN6+oPcIzClCOEliVKt1ycFR4WSc9MR0xllSgaL5kQw2eOY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw00ofonjFnTdWCtpQorPX/LHIzHl79FBcNv5+FzzLbkWB6n/MA
	9KX/eBIBPWb/mLZBrrZ8OwcEUrXa9JFpHydPwj5IxElst7AKpKlTbAXyLCU9DlM=
X-Gm-Gg: ASbGnctIplA3TMRJybb3Qacajl19N1Y8dPXizeWUC1roRbaSRfUPMdEdb7Dqperj8hd
	XRDx/jB0aywc00kMAPwtFQt/poEvjd1xvucrIUSEIZyy6czfWaHfu6TyviDX4UiQRbxElUybMyG
	7rZVIhFjlXQWWvEuJjuwk6pvkLTiArWL1NcMiCso0g0CXfALnbTz3FZOY/x+yIArlw8tYzl7DlE
	dhf2JFIrVo8dgN8M+Q1uk4IN4qWi29sY25YjGBMkVe2pW8Kkaf2crq5l4m1IHC8Qbg=
X-Google-Smtp-Source: AGHT+IH7bYRBDYrJ7HrKSF7yLAUmxKHJQ8udj3GCZqmJfB19omJ47klADUOW0EXIJovlwM0emjdl1g==
X-Received: by 2002:a05:6402:50cd:b0:5d0:fb56:3f with SMTP id 4fb4d7f45d1cf-5d4185073d1mr8704901a12.12.1733821676417;
        Tue, 10 Dec 2024 01:07:56 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef40:6709:8d26:5167:3c1d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa699618041sm173148066b.81.2024.12.10.01.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:07:56 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 10 Dec 2024 10:07:34 +0100
Subject: [PATCH 3/8] arm64: dts: qcom: x1e80100-asus-vivobook-s15: Fix USB
 QMP PHY supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-x1e80100-usb-qmp-supply-fix-v1-3-0adda5d30bbd@linaro.org>
References: <20241210-x1e80100-usb-qmp-supply-fix-v1-0-0adda5d30bbd@linaro.org>
In-Reply-To: <20241210-x1e80100-usb-qmp-supply-fix-v1-0-0adda5d30bbd@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Marc Zyngier <maz@kernel.org>, Xilin Wu <wuxilin123@gmail.com>, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2

On the X1E80100 CRD, &vreg_l3e_1p2 only powers &usb_mp_qmpphy0/1
(i.e. USBSS_3 and USBSS_4). The QMP PHYs for USB_0, USB_1 and USB_2
are actually powered by &vreg_l2j_1p2.

Since x1e80100-asus-vivobook-s15 mostly just mirrors the power supplies
from the x1e80100-crd device tree, assume that the fix also applies here.

Cc: stable@vger.kernel.org
Fixes: d0e2f8f62dff ("arm64: dts: qcom: Add device tree for ASUS Vivobook S 15")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index f25991b887de3fca0092c5f81c881c5d8bd71aac..bcb25782d541f43166229695ea1b83ee7b94a6c8 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -599,7 +599,7 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-phy-supply = <&vreg_l2j_1p2>;
 	vdda-pll-supply = <&vreg_l1j_0p8>;
 
 	status = "okay";
@@ -631,7 +631,7 @@ &usb_1_ss1_hsphy {
 };
 
 &usb_1_ss1_qmpphy {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-phy-supply = <&vreg_l2j_1p2>;
 	vdda-pll-supply = <&vreg_l2d_0p9>;
 
 	status = "okay";

-- 
2.47.0


