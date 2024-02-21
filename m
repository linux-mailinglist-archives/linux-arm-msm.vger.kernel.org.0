Return-Path: <linux-arm-msm+bounces-11986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A35FD85CF1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 04:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 368351F2202C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 03:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A70C3A1C2;
	Wed, 21 Feb 2024 03:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c2Yrls1s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A01C40BE6
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 03:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708486999; cv=none; b=NFkCmZ2EISx7sMI7zI8pKil5fq+oqJtbLC3Hmj+Oo5SbxXHZGuKQCGILb6jS+Ax3E/9W//KUkVqo6VnQNUGJrF3wbcxTbOgifdiFFmix3zEsZiOzxyAz6V+cnCEQujiLX3lkJcARR6kYxht/U9CmUdPmse1c7dc+gNdXcWEFOsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708486999; c=relaxed/simple;
	bh=3jx7xcLFBNs3MoMPC7hOG3cqD1b3y0NhSb/veZhqzaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NLs/2bzYxU5zXmhtKsv7iOHSFLnZfJZscAhEFqITo/2syY15NtgMeOBMF6GG0csWROzOvbAoiq7nxvybV2xmiyOw0OC/qBS8gXAPZHohb1K9+ZArWOwQXBg1T0T6H0v9/BJjSL5qhoy1yFAp5dgAL65NPYALb/d3nGA4edCnWjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c2Yrls1s; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dc745927098so193565276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 19:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708486997; x=1709091797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=syX1Qx9Iem4TSxZ/KaGRejBy0YhBu2VJFkbJL0HV4dk=;
        b=c2Yrls1sCcQWZrqNHGjCgD5NjXVbECXzjkixS9VwHo0hqs03B2HaCKhmgTpgVwjT3z
         /MBnBxKiqzfTToBP2I5+GgrQ+pGrtN/8H6VeI9+XmoTGsje5UIsBaE1tgGI+ssq/vs7+
         rmK9uZ1FiQjPZJx1afc/8tjWmy4ZLUoZUqGZJaj19mBEmXlltR3Mq7tsTo9M6wy8uNCX
         MF2bcHcxR5S3nRjgdJclU3+3sard8sCt6n+ZPOtzAoGdqfE1mnW8Mxf9J7b7XxdFLpaR
         CvL3dJoK/GZoSEjM2uud6nxpnxThhPlP/gAjmL4M0T0eh+fxBhVV26MTg1qBLGqnpzz1
         2IWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708486997; x=1709091797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=syX1Qx9Iem4TSxZ/KaGRejBy0YhBu2VJFkbJL0HV4dk=;
        b=OJ2thMtg54BonaGd30LffKrmwxauiEgVDm7mIY74G9aYkX1ZWyM4x6F3pFZQrzmzxP
         GkOvPDAhZPX8CKKuTlQEJrzz0HVkf3KBmS71kNCe90HCZFH7gTq40oha9+qFEr22Da8g
         t0+olZFPazap5xpItI/4I1wDS41q+2dZF+5ybwCQTQMbJWALAdjMVvzdpKlKCPpj6UZi
         xipYHnLdp6DehlutfT0UaaW+Cz7XGELQVSaFQ/4xpvvfrQVktrlkZ4gVxIvUCqM2Mc1I
         y7Ms6IuL9UMs3Y2ypDNTSpJh6eOWc9mzCEZoziuT5UFhRga1jjnK1QQw4KzSGOjU1YkL
         z7fg==
X-Gm-Message-State: AOJu0Yz90uDF1NKPcPcqhmTEAOOOBf3tSFQti3NTISmesXT4UPueFVgS
	glRxIche5GzhOJq2oMPtz2Pg2yIrgR1j29mQmWlFJCiWir8Q0gali96eK0xezQ==
X-Google-Smtp-Source: AGHT+IFBVWJpECMedkEX8/nOsa0s8lpnyOvjOn6f9DzOfF+clVYwUoyuh7w/f2/VM3FW8kxweFZPbw==
X-Received: by 2002:a25:a109:0:b0:dc6:fee4:e889 with SMTP id z9-20020a25a109000000b00dc6fee4e889mr14755046ybh.13.1708486997281;
        Tue, 20 Feb 2024 19:43:17 -0800 (PST)
Received: from [127.0.1.1] ([117.207.28.224])
        by smtp.gmail.com with ESMTPSA id o23-20020a056a001b5700b006e466369645sm4436231pfv.132.2024.02.20.19.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 19:43:16 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 21 Feb 2024 09:12:06 +0530
Subject: [PATCH 20/21] ARM: dts: qcom: sdx55: Add PCIe bridge node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-pcie-qcom-bridge-dts-v1-20-6c6df0f9450d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=895;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=3jx7xcLFBNs3MoMPC7hOG3cqD1b3y0NhSb/veZhqzaw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl1XEJ0dYtKghZH8nSt5KbXAa7K43VgCuWjwSTS
 qwWd7D9xTWJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdVxCQAKCRBVnxHm/pHO
 9eSqCACVezpkM5fzyHWjKwcI9D/5H8bEjfZ3JGxrFTpT375ZlftDiC8YFM9PwY6TARsaUtuir4h
 QfFsjMoctfImFxsrv4v8mIQE84JUA0BP3dQJYMZS7EHSIDs0p4KjQ7ywnV9YVW03kn0TJ+oFbWs
 KpqT4BHsfA2KrxztKIdc0cdc38ZZGl33T9w85pOb2E+hQXmyMPLDSiuucJZjZo/uVIXnCa4xc15
 0Xs/pCa1/EmlelG3a/0za6AoeGqOoFKXqLC4AUwhQ6FiG4zwogrgR+T+Es6Sdv86YoUHsX2t5K+
 AQytcdZsnb28J7q8Tw2qgQP7rJoO7MTdAJshR5hVXhg83OVl
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
for each controller instance. Hence, add a node to represent the bridge.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
index 2045fc779f88..053dac097c70 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
@@ -378,6 +378,16 @@ pcie_rc: pcie@1c00000 {
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
 
 		pcie_ep: pcie-ep@1c00000 {

-- 
2.25.1


