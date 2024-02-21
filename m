Return-Path: <linux-arm-msm+bounces-11968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A5385CEE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 04:43:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E0EE1F23384
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 03:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7983A8CB;
	Wed, 21 Feb 2024 03:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zMe917S/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C92F3A8D7
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 03:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708486937; cv=none; b=Hh3jWZ92Q58OcRbR1IMK6ce6ui1+IQCou1AmYvJhNbt8L046lvGUL5NGHvT9ftyO3hdcSK/1dm+qmYqgGrMz+1p7MwMnRkKw4GScbY51znAqrKYlP/3zlfdXCORJYY1bAmcUyQFOAdO+2TyJO3YwuzF/twbwc9Zk29+hpzkzHcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708486937; c=relaxed/simple;
	bh=O5og4OchozAQWq8Cp+6rFJKQ0XxsxNLCk+2059Ri2hQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=usAz7mt9rQ79BtWb71iUs1P66a+hfJNHCJzVPkaMya6uUEEe9w2OPaHrLg/nk5mwKHvlTPE1qgobmdJQgltx9myGd8YcxFQwKclKxOsuyAxXn2NVj26kyXJNu/jrAivrcYKdeRk4BfU2l9Y+mr4kHue0pRM5dPz1N32Bo9DrnSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zMe917S/; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-59f7d59d3f1so81121eaf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 19:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708486935; x=1709091735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhFwmGfAyp+KPgy1YNp5dgOHOitxxPzL4bzjbrdh2qo=;
        b=zMe917S/CM62eKt3aNxF07cnUppXFgC/C+B0w29/psv4CdWSFy5p27jdBUw4MoTYfi
         RWtcgFcpK0qxMRxo6mopJQY6khWMopFnTCKjQwLm0sS1143b+YUJvoLgZqFPIjwa/IzN
         uNOy+GgZ7wuPJuf9FvoX1zMfWvd2HWsemw0VxkqvTjwheHDcv6Zbmn7TvW5JHpFPPZpy
         lcKGuimLRNCIzGesoNKiFBAwlMbfj3b2djtDT3EB/CfOGzCYIvaTyqWvppjwnsmLflNg
         vafdNtqC5NEftPhn8sMK1X/UT5J2AOQ+TmUQv1PZk5iSZnJhN3lLXveoJhowSz3KesGn
         ylzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708486935; x=1709091735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jhFwmGfAyp+KPgy1YNp5dgOHOitxxPzL4bzjbrdh2qo=;
        b=dT3ezPFW+Q8fdVBjUcwkSUBGJNNRaXbJshd/VuaV1RC2ZkAEGTTwRlh8DLLSJinKLn
         03gtQvt7BbiBaMSL6C+xfFPpzuDSABOjC4sg9sFtxPFiCTMPkH1UaWrkpuhziH0d6Gqi
         4iCgrw8h+DSUbbr9yPjel0RPG0TXInlAvSTUBjyJCrTfFuQYgAuKW2UARVH0VEj+7eZe
         cntUCuAqXFoNZB4cO76/UqFh5xMWeQrYdIco4qJ17gDSG3PHXIRUGZdiGhBaUI5fKt8o
         wf+Kv3imUusH8ruZhTcwDTI071WKVJ1QF/jAI5pWmGUEAD380vx+Sj/JufnDiLsC0Ln5
         ogYQ==
X-Gm-Message-State: AOJu0Yyd27HIf5R/BJpmXrpuFy5+b4XmNDn/5/RC09ggQuJ6kdcFYw1I
	DqFjALCLJKnTPTXXH7rNTtUEXW8NyS2yeEcNWfqM5xZqnPeRTKO9khHtgiOnog==
X-Google-Smtp-Source: AGHT+IFSKx6GZ4yxulHPpTju/HaIehaHxCGHrqoUPm0YfYGbYPjQYdJI6R94uzZ5myHGjPluz6NN8g==
X-Received: by 2002:a05:6358:e4a5:b0:17a:cfb0:828a with SMTP id by37-20020a056358e4a500b0017acfb0828amr20251290rwb.19.1708486935010;
        Tue, 20 Feb 2024 19:42:15 -0800 (PST)
Received: from [127.0.1.1] ([117.207.28.224])
        by smtp.gmail.com with ESMTPSA id o23-20020a056a001b5700b006e466369645sm4436231pfv.132.2024.02.20.19.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 19:42:14 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 21 Feb 2024 09:11:48 +0530
Subject: [PATCH 02/21] arm64: dts: qcom: sdm845: Add PCIe bridge node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-pcie-qcom-bridge-dts-v1-2-6c6df0f9450d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1223;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=O5og4OchozAQWq8Cp+6rFJKQ0XxsxNLCk+2059Ri2hQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl1XEFB56RCU+KeRm0TqjjtZdY2xuOfLd0HbpOI
 eg3yrsgWzOJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdVxBQAKCRBVnxHm/pHO
 9Vp5B/0Xvnk+89DL2B2kXhbUkU17AS0b/4yteiC/i/vFI2Fj70O/IwPyIHJ782fqMaBMSuThV2Z
 5mf23v05A15lNpMTpXNCVDMdoHGv+fyBn8gyCTMXgQtTz3a8Smdbg+L7RiL85V/OxL+inb8NNYU
 0P0AaagGlL0t8kVKSc7Adv3NIWQYgBBniVtJqGBU7ArtnpVMyacm9/7SVJgTCuNvAJ44TMTVvJW
 mHlB5gLPuq7MH7hQde7tahQ3nb0mOLCh1NMccD5PsQlPXd80aJApI+gtN7r2KzK8ce5ry5MObgE
 IRG30t0ALKjO96Iy1wXDkgUe8OiP4l7mM5F7iz67oKqsy4Vq
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
for each controller instance. Hence, add a node to represent the bridge.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index c2244824355a..9a6e3bcdc5e4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2375,6 +2375,16 @@ pcie0: pcie@1c00000 {
 			phy-names = "pciephy";
 
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
 
 		pcie0_phy: phy@1c06000 {
@@ -2479,6 +2489,16 @@ pcie1: pcie@1c08000 {
 			phy-names = "pciephy";
 
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
 
 		pcie1_phy: phy@1c0a000 {

-- 
2.25.1


