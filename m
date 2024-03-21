Return-Path: <linux-arm-msm+bounces-14738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF4C88583A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 12:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED8201F23B1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 11:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69DE858200;
	Thu, 21 Mar 2024 11:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sMNGUraF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22635820E
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 11:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711020256; cv=none; b=YxdyIqIqXEStvo9D3uf9dg5KRparXMJLnUoNkXGw263MZDYDKRe/1yuGDy3+FZVrxeiUmjtLUeV8EGDTWiKVTsYK3Ukl7Sc2m52SRZcLNREeSF8CF/ZhNceFjU+GTpSLfmFePCDZOlT9s0Hi7a6yXP7CrEwRC1Kd+RDIwVCveec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711020256; c=relaxed/simple;
	bh=JjX5rQTZo4PnOzDIoK07BP23seNYxLCWEZfQhQdyN1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MlVGMUp63/rj16feeE5srDS4TMEv2k/grctjGEfbiiq3G1yff0Ox3I3iwn9d2ge6E/DnbUdMMx71PY0pKZK4OZsvR1H2cQgCJzEzpqf3oF43st6IxatKBURbDp5HOVZZavDYzXHmafc9ZXiBFOXRY/klVrDhL4ecZ0wadoLwEhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sMNGUraF; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3c37c136d25so813641b6e.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 04:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711020254; x=1711625054; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BTVw3VOLiPjAAnXNFxWBHmzEpyoJ/0WYArrSCRNtDwk=;
        b=sMNGUraF+Gvsf5rU9z5IULwxvtrHRDNO6HUWPmQTc9Rqqh/3UFlengvh1exEISedYm
         gD1DP+XHu8Id3H+YYK5vgf+fCH5cQWAg1l0F0RUbfDzJRj7xDcKWmEItl+1XfOQQwCEh
         9gJEytvXKdvaNXJJYu2BSKxYXVjoEpa+eaX7TalspnqZHAjd13leoe6XJ/8EA/Yx9RRi
         U6cVdCe+qprP7hP1ftHSBhcHVcU0cq4RDZVzpTsTakwX95FSN7PLnHVBEtjM1e3YveOq
         OkJWvgM2OdCiSLT9Lz8ZH44/6xeBxtUiQIGBw3Pz/fp7ZKOEmwLRTbSJyNwaQTw+ct8g
         D8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711020254; x=1711625054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BTVw3VOLiPjAAnXNFxWBHmzEpyoJ/0WYArrSCRNtDwk=;
        b=nf3BTnxujYCTN/Q7Ajc9j37XRoFdXdxcCNWasu5tCC0SOOEQnrWK+QuFjoryBEUXRd
         aQxX9RVUC3Yr7x0x/q4Do1/JMm0wUfTTLa1w+Cv1t7B7sl+I6NV2G7Gkcqm6p4yUab17
         6OMTZVM9lpAQH+eXYcpuY1EcaQWbWtwMtH+LrojKfyohw5BV9CFD0/cj1piRCuvozVDz
         urvLjS2G2Tcgzs63Q+5qPJcx0yAHZ+0tbjkahzUiEM2MwoExy8ICwzNGvBqtcZGX+kgk
         W9GpRVcSzBeJ2XKwfS/YRAOh/KXcQcpSeGQqcZUwDKSZsSpaBp4gJhwpY9qR4zMn70or
         wSXw==
X-Gm-Message-State: AOJu0Ywa9wOQhWNcuAi0CI3cO/Dm5i9I6PTSidPl37xnoAo6IS12NdcZ
	F/6PwxEa/YUv6jat3I8Qh6OArlFoZh0NS23G1GbvvU45YWIq6mxW/WPfgc2XnWd7JhVpuJpXoAA
	=
X-Google-Smtp-Source: AGHT+IGwvyGUkGDV6ho8SQWENellaGbkh9BcDgzJIU3V296S/hqDZk5/JFLnDkcfFmeXKk/l8XWvvA==
X-Received: by 2002:a05:6a21:6d9f:b0:1a3:4c8f:dbf2 with SMTP id wl31-20020a056a216d9f00b001a34c8fdbf2mr3288711pzb.27.1711019828039;
        Thu, 21 Mar 2024 04:17:08 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:102b:a64b:d832:a82a:837c:6d3])
        by smtp.gmail.com with ESMTPSA id ka6-20020a056a00938600b006e7324d32bbsm5531120pfb.122.2024.03.21.04.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 04:17:07 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 21 Mar 2024 16:46:27 +0530
Subject: [PATCH v2 07/21] arm64: dts: qcom: sm8650: Add PCIe bridge node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240321-pcie-qcom-bridge-dts-v2-7-1eb790c53e43@linaro.org>
References: <20240321-pcie-qcom-bridge-dts-v2-0-1eb790c53e43@linaro.org>
In-Reply-To: <20240321-pcie-qcom-bridge-dts-v2-0-1eb790c53e43@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1343;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=JjX5rQTZo4PnOzDIoK07BP23seNYxLCWEZfQhQdyN1Q=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl/BcKfo6nILZjT0uVxu9k6L61zmAF0krMsgWSM
 o7hLHsVsL6JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfwXCgAKCRBVnxHm/pHO
 9fpRB/4yJ5GNKfkKv4TU5wFicnI6n/82CVm1TD/Fjc2OFsnwNPP0kQQbQ+5IuThXGWfv9243m8E
 WJN4lpImXtRMHtCESd571i5xfvcIhiJnQiIOuZF22UMQ7X/IOKys6FY1FDct+W1tdzJLRQfjBYt
 8pac7biguPo74gZH2fXpDX4j6th9SJkMnziR/VtbQZMueDJlzJQ8bBFKnVDWBl2orkndM5ao2i1
 zE8bBQjm/OP8CiZaBY30hZG7Iplc4LAW+Y5c2XgWKFliF0SRthvNJIlPVbcb0as28QS4W6zuLuN
 7jongFh1sIqnMAS290MvHGe4Mp6le+ojO0M3DoBeaozuGNP9
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
for each controller instance. Hence, add a node to represent the bridge.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index ba72d8f38420..06d2b6432ab1 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2294,6 +2294,16 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			dma-coherent;
 
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
@@ -2422,6 +2432,16 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 				 <0x02000000 0 0x40300000 0 0x40300000 0 0x1fd00000>;
 
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


