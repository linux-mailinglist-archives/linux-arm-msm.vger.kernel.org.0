Return-Path: <linux-arm-msm+bounces-39188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EFB9D9568
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 11:23:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FF47282390
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 10:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CABA1CCEED;
	Tue, 26 Nov 2024 10:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S3bJ1CGm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3527A1C5799
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 10:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732616581; cv=none; b=YfHnsoZ4K2AdBpjxVjFjIv2qF4u/5Bb6REZNwiGcZtYffjH5CcrifM2R68M48HH2qZ9evvJ99acqieCbCfqZl6tssyoW7gLX2+0kXWU8jpKnV395NkoBRjCsTxJ4VlsdjBTlBlEJGdJgaFreyTX+dFMx2n5VvWkUQxIXlDlrCRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732616581; c=relaxed/simple;
	bh=DSfkUxtAoj5mu81yWWFvAAd0RzmXItr4kWCdyj1bISk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BtZIDvvxQ77/DcDcvIOK4P39C4I7qXamffZ2HZR9oxH/CQ9sQqbGv/cQY+JuEx0ivFgj7uFpPktVBZ7SUpXPAmQs6kI5zvDZlmKxJmEm5oaMyKdDoh19/HasmkB9fgl5NAgCVbZI/lq+1WwaFaIGn8dWMQ+H8Yb0idhAoxHMwk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S3bJ1CGm; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434a8b94fb5so749785e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 02:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732616577; x=1733221377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yGY7qn3T/vVH05XwetJnmcN100gMBe4kn/nqWGga67s=;
        b=S3bJ1CGml+rVJGVxl4jTciWrCEhbfod+SdDcZiH5zPZbRcQ+og0nmEeMZcEtFuAkof
         tm6KGVXO4YkmOIb1I+BZZiE8YfafcgbqDJyvJxXNkiFcHjeN/SzAqS+iX6hzsyeBGhkM
         TelUbSVscGXMiVtvPqlcz+mFsUOUoiHS162M6EgKYGXOFTcM1zcwFYyjg/x8Y4y5kc8l
         WgAmcLbSf52PqzsBqqlE9VQGVOVh0n8fbHEhLn34kNv5mYkMdvKq9cXzLjbeRWedOKry
         JC96+Ku/tTc/ArZVq6qGwtm+RfQzruY6DYP7IVEwiRg7dSydcIKn3Xvp9/l61FUWd+sO
         UqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732616577; x=1733221377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yGY7qn3T/vVH05XwetJnmcN100gMBe4kn/nqWGga67s=;
        b=ChlifOvx+WMpOmXEjX4hDlbv1gPJNvIDLdAVqAM1GEjKWfs/54Sm11SVqB/cIOiGGp
         BiyaZ0ctj/mfz6PyF7obojYKzOM9mWFFBxiAOvZaVMe19hQ1Amhn3uVNoMt0kkT7K2At
         VNU7sWjJwbnLV3/3gdUpcBFj09hbUfBK4GnKwTu/GJj2lgDuE7SkMWhu+xEMuAFolIDb
         k/f/6dV/uWFDTexl3HAtb0Q3P5KA0MncHUbG4V8cg8G5bdTyV6t8xMAs7US/6cgK+SLf
         xsGJNlncu1R5lH+A+soagzybpYNP7eznUf2Iav5azbMigjZ043KJo5R01ERrOcY2IiA/
         E5kA==
X-Gm-Message-State: AOJu0Yx1qEL+cyOg/kL/Xk1rw5zbY3joruTsmHdqaxUjDBOkdlmMX5as
	xSIpuOiPlaXVS3zzOFYRoCnyyidwOeWYi4mRU/fNkPgM5rTTsJGsuTKOxPxCQ90=
X-Gm-Gg: ASbGnctnnjsZAjDtc0unUHyVnybKXqRnEmtePZFvhL29yBnfzqIt6T98wzRoeSs3p5B
	F4+r1FVnstaotqEGN3O3e0yfEdHKiKCQlKP23J9uw7eS/lDqmgeq+zhMaLghA4PzIRpgWbm1xxO
	kpbJNjLh2lI/2WiKw4PWyWfaQdAytSnkjZfLyjc/WzxEepPZKQZWQQk7WrMsnz8ewHjmSnyGa9d
	7DuufRueajhBEs7bl2JBnqCRbC0qsPIHGZjXZ9Ye3ed/fS1bwiVfU3Wa1KjegGPLyddl64=
X-Google-Smtp-Source: AGHT+IGPAdKF60KJgbdHpQ0rkkHhQT35BoPjigPNj6uM+GadsiYB0acZNjOjuCklQM7MHaWYJOgR3g==
X-Received: by 2002:a05:600c:3552:b0:431:55f3:d34e with SMTP id 5b1f17b1804b1-434a4e97451mr21967545e9.15.1732616577530;
        Tue, 26 Nov 2024 02:22:57 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b01e1046sm228378075e9.4.2024.11.26.02.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 02:22:57 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 26 Nov 2024 11:22:50 +0100
Subject: [PATCH 2/3] arm64: dts: qcom: sm8550: Add 'global' interrupt to
 the PCIe RC nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-topic-sm8x50-pcie-global-irq-v1-2-4049cfccd073@linaro.org>
References: <20241126-topic-sm8x50-pcie-global-irq-v1-0-4049cfccd073@linaro.org>
In-Reply-To: <20241126-topic-sm8x50-pcie-global-irq-v1-0-4049cfccd073@linaro.org>
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2127;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=DSfkUxtAoj5mu81yWWFvAAd0RzmXItr4kWCdyj1bISk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnRaF9prwC2FE/20VAFkxL2ILMYJ+aAmceOxTvbWRS
 z4ZM7MOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ0WhfQAKCRB33NvayMhJ0bHOEA
 CG5c18zN7eCFM7GX/zPfQuFA7GTJzLR2x/AC88IfhPfsmqMToQCucnNGm8OhNoq92kLLMMv7P/6qR3
 uhlj9VIvuZCbODoAKm+9fDgi6A0qGikNYp5X5y/39351trqDgEQfsEVOqXlHAW8PUvL574nffugOjP
 3brwvr89SeGqpVci8pCM/MNwukm8MTPax0eTl/k6gEJGbZIKtl4TYRTlBIsMi0K76pwI11qXuYNHB9
 X4T3KzeeueNn7XvKlB8ZFarJfNd6n8WQAVHZ8Sh76nHPMLi/aPsC+J0NCpI/Pt/Oc6pr2PQ/dB3xWK
 YJNrcqQSEXQGjLEnGACG5LLBkRkvAsYRokxV/cSrMVBCL2wMPJCM4Ciesk1kkLEiJqgMV4jJh5CdHB
 cZdfTfRlmx5SbM1KIwQNRYg3lEcvJt0Bnd5D6XBbBxQ9hQGd4bhmUTaBBEeJpquDLPqHuIli7+xooF
 0cLHpXR9IPykR7iA8QlDAAKqW+YRgu/HEg51nt7c+X0IbuZjBBlJFmVVeb6Noyc6kwCeEHrquVIydJ
 nvx8YrkpTgqVJqDI5rK5Q+DY/W8K6sVCbWlTTuh1G7FdKPmNrKH5Mf8c4MYue7D5iGk5VJBBBIgdDW
 +sqPlG/LpvsT/V8qkgbh6FVHgdIwC4Ado8JpIZXGqJRsU0G5b4Kkfy7hK0xA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Qcom PCIe RC controllers are capable of generating 'global' SPI interrupt
to the host CPUs. This interrupt can be used by the device driver to
identify events such as PCIe link specific events, safety events, etc...

Hence, add it to the PCIe RC node along with the existing MSI interrupts.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 9dc0ee3eb98f8711e01934e47331b99e3bb73682..44613fbe0c7f352ea0499782ca825cbe2a257aab 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1734,7 +1734,8 @@ pcie0: pcie@1c00000 {
 				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "msi0",
 					  "msi1",
 					  "msi2",
@@ -1742,7 +1743,8 @@ pcie0: pcie@1c00000 {
 					  "msi4",
 					  "msi5",
 					  "msi6",
-					  "msi7";
+					  "msi7",
+					  "global";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
 			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
@@ -1850,7 +1852,8 @@ pcie1: pcie@1c08000 {
 				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "msi0",
 					  "msi1",
 					  "msi2",
@@ -1858,7 +1861,8 @@ pcie1: pcie@1c08000 {
 					  "msi4",
 					  "msi5",
 					  "msi6",
-					  "msi7";
+					  "msi7",
+					  "global";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
 			interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */

-- 
2.34.1


