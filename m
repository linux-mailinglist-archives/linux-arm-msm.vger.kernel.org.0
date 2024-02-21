Return-Path: <linux-arm-msm+bounces-11977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB1C85CF03
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 04:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0CBE1F2296E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 03:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83C939AFC;
	Wed, 21 Feb 2024 03:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ho6nul7z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2604E3D978
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 03:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708486969; cv=none; b=WN4X0C/acHx3iSK1Ql7vO64TUIgt8byV41F25Up8jPBixN/amVzu4WWPV1eqDkA4zbQ4UCOpriFlqnexi1zFvLFqFPP1yoebujXffMJnJXRgMrzuSGf7jMOJIfl3wclataqgFTPfRy8ToDBsu6biCmKMcjA8rtOOEGKlaaTWMSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708486969; c=relaxed/simple;
	bh=BbQQkpeOeA66pP2wXmauBkA1XYRqBdBb32HZYiFLKSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W/rEj+VBLTMx5OO2L50Jb6iGmbnUpJuuS997Jb+zrtMIec7GWXZlKA9Fk+EkdLDXPg3e/1QPQYAvHoBDnNY9BvNEgqxZZ4mlyXJUcntjHX5MaHU9VfIZnRJgDYBSrKlIsXvu4Upg2f84zqCXfW9d6Rnh90PthHOkT4aLNI8/3MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ho6nul7z; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3c02b993a5aso3757555b6e.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 19:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708486967; x=1709091767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZEXhIxlpCp/6yPDV3L3sew0PB6WLEXPCTkfgJIvJO+E=;
        b=Ho6nul7zl0aNO6t2G0R16aYwtVqNVwpH1T5JFuKvwpcUhysdeH4zOPMdKgvMUOPf+7
         pM7v+KWh7/Q9OF+Pi5Dh8VFZynJb2fEoxMwAYxrHyV0TlegCyF6WLWFVBY1dxl89S91E
         iacoY5XYlBJthI3Ck/EN0dwrgoefUIkvqn4gIZ6ZnhiRss23M/jMV6z0hhB3toi07wyP
         Qidkh3xXyVrdyfVVDVGdXcFSkjLmLKYZ9ylSG9/4jSo9dmvrGpuQbGZ7lq2wQiRkgQbD
         P/ibgPuSwI7aqbEjzuyf7KEwPeYex8o17tEZF1LMPeVrkuD8kujDno1bisVkSTHkdX+j
         OvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708486967; x=1709091767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZEXhIxlpCp/6yPDV3L3sew0PB6WLEXPCTkfgJIvJO+E=;
        b=rl4iWhka9C8Chxzcd3ZkPp4ZFNIlfiKokDXRVQaKNcUxEfgJksDn8uxCoryt9PnR2T
         UaaePbTbKnE4QMSx5hUiLBqyotmJ5MKsfRmIPjUUIqIKNNHeOisz7WsF1CxRTzVsnvUu
         pXUslXnNo8TjFv7hrULtMYyYz/CGTMfhfdtPUmrque/FnaKloz7sLN6r5kNuddHvvGiB
         V1D5fGGZleTNjtAeE39fkcVMKLuwZdRbKxbZZew3VsgN5YkDpjBovst0noWpN+SKr8V4
         YfTmGlVvti6iB3TGZKiHFZ5Bx4Wq6YmzEhPXHeZRfc+ZGnsnWtvKqRuFBTuySIu7UrOh
         2goA==
X-Gm-Message-State: AOJu0YyAFdEATtmszLeQORfL6bFMNW3NpOQxv+Sfx53WowegS6/mI0sT
	m1JHJ8ERolBGdvDmTPv3IFjU02n3S3hUsKK1x/QMnxbNhXIoQzznvYro6NiA/A==
X-Google-Smtp-Source: AGHT+IFP+lzH+b+afHi9Aa2LfmBFyuhdtUaGpcaDMMJtnczeNE+/M85Bm1MXIeptMdXF/qMxlVak6A==
X-Received: by 2002:a05:6808:22a6:b0:3be:a638:ee97 with SMTP id bo38-20020a05680822a600b003bea638ee97mr19961919oib.19.1708486967299;
        Tue, 20 Feb 2024 19:42:47 -0800 (PST)
Received: from [127.0.1.1] ([117.207.28.224])
        by smtp.gmail.com with ESMTPSA id o23-20020a056a001b5700b006e466369645sm4436231pfv.132.2024.02.20.19.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 19:42:46 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 21 Feb 2024 09:11:57 +0530
Subject: [PATCH 11/21] arm64: dts: qcom: sc7280: Add PCIe bridge node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-pcie-qcom-bridge-dts-v1-11-6c6df0f9450d@linaro.org>
References: <20240221-pcie-qcom-bridge-dts-v1-0-6c6df0f9450d@linaro.org>
In-Reply-To: <20240221-pcie-qcom-bridge-dts-v1-0-6c6df0f9450d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=896;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=BbQQkpeOeA66pP2wXmauBkA1XYRqBdBb32HZYiFLKSI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl1XEHr63B0MAejk9My2Apsx1t061f0O7/XW39R
 8RWpf9V81KJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdVxBwAKCRBVnxHm/pHO
 9U0eB/46oECfntP/VJRvdK//+zlBCefJCHCYIM0HbNQP+aLVIuhhzMFrbVCkKHIqeHnjBc++bE+
 4W0yv3r+KNjjmSeS8ER2Q9GoD/9g50kOn1T99JLj77L5gdXt84AF+gqblcAedm15MtpCOCoGNjj
 14/GpM8z8c8VGFwZz2MPc9YCQVKzgM0fLgUmuOKkgU312TZ+f43cfIw93ubCRjMj/KBimSehMYD
 RqWw8BFt4yfAJRMgZrAi0n6qVYtwrtUXpB/T/4sPOdOtf0Z3oKd6t0KE4nllBCEmLKlWD5opGAB
 fsYS3vYIkUH9XF+RxC0kqIwe/bVawqXpem5yDbimq/Rved5x
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
for each controller instance. Hence, add a node to represent the bridge.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 83b5b76ba179..3b52d467dc8d 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2235,6 +2235,16 @@ pcie1: pcie@1c08000 {
 				    <0x100 &apps_smmu 0x1c81 0x1>;
 
 			status = "disabled";
+
+			pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie1_phy: phy@1c0e000 {

-- 
2.25.1


