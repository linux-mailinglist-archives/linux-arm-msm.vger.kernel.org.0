Return-Path: <linux-arm-msm+bounces-11973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF6E85CEF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 04:46:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99E031C22333
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 03:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE373D0C0;
	Wed, 21 Feb 2024 03:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g3HoUckJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E8B3D0B6
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 03:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708486954; cv=none; b=gwOppq6qrYdSCJY6Qd5NGc7P1jQ3m2c6+OvAMKoAsQMGYNOLZa11Y/7OAElPMw1zODOBrUFxVOFS8hnRJgZh4FRVsCs4lymxM+PHpmInT5K/ztQYqG1yoWdTXbSAtcXQEkTe0CfojT8VuR6KdKDVLWpWQ+PBvVp71W9q5dIsR+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708486954; c=relaxed/simple;
	bh=2Q/c7cqWrxsgCvrUBqcb1kHsDO6XcH9wkH7M5swouBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WSH81PNe/07iXF6D+/Zl888Dj4KayU++PERRobvTBxOLGVZfq4zIZ1AjkAjSSfe3XdJT2Wu9aAuHAfgS3MKLNURX1GO2RRltjHYqlo2M6qGqMoScWLQw03YeprcwSdMSVOUX9qjqZVSPYh3FOiLN16kLzWEvZkG/4EgzLmvIMt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g3HoUckJ; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-59927972125so4081452eaf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 19:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708486952; x=1709091752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gdJpMsEJXCfnbuJdfeEgIk0A3Aka66MaEAybndFuIgY=;
        b=g3HoUckJa/KjmQvOLK9ID5uyi5ZT8iT4fDYUKVMNiBuNJKfWJIPnUwVL3/TsG45dpb
         1458y8/ZCZqrZRvKZFBcFLo7By15IpUCCeqJqgUlNPp8aW/PxSFauohgBH9US1c60pwn
         juNXQL22Ekqsz/T1b8rzc9s4fwMxDfVuBphgxCC8ThC7+LCOeucI2gcRJlGsXtPRA7bn
         JhyKiIVBuuoJJz5KswABk3/ds5TvlqgryfZD4GEhMJlYObs0Li5TPV1ZMNXaW7Uaqll8
         flW++myF+fI3hFs4HKvWfa4RofGPfLMJ1TDKl0D2gdy5LQf2ftgqT3CH6x7b+3cFMjFr
         veUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708486952; x=1709091752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gdJpMsEJXCfnbuJdfeEgIk0A3Aka66MaEAybndFuIgY=;
        b=PTg+4Pc3P8EOOoRrIp9BC0MRNdTuKMGUGELSgKuoDnmjOf2SnSL6ho2zA9GIVSsYnE
         uEARX82nkyignvlwAOe7b/vbsPjnft+e8iiUqNaSKbLlxe+Be5v+IZVLU+eJh6QQHloH
         EuBRq6X3naplsTgsaH06kVLZf3QEsinQvoQnW/JEWZG0BfytRvNHtUh4lwQjjJ840GGF
         9LFsoNXWS8PzkNPZl2FmsCA7iRqpC9pn6l/pWY7DJKYgWSlEpCMsnL0MsPzeYcoa6X2O
         mRLeTD91PwIT3sB3Ibdf82s5peuFMLtidT34vxEe/v1kUm0MpMsJp552sx/3m4ZrrpXE
         rHEA==
X-Gm-Message-State: AOJu0YyFjc87aTDswniebQKKf6Hko5WS1Tp149VmQ7PnG2mABLCAGbqV
	volx1HwBYSJ41tvqdDPDt3P7QZDsljujK0MNlinr/lJB5bfO+oIXhcMLg4kYLVs7HUH4qCqYDQc
	=
X-Google-Smtp-Source: AGHT+IHBsEMmKzRMGNztlIYHFtnKFfn4++Gsz0Ujp6913/iD8DkXORuxF96J2/09UtBpCGb8KxbMGg==
X-Received: by 2002:a05:6358:2913:b0:177:afce:b12 with SMTP id y19-20020a056358291300b00177afce0b12mr16822385rwb.31.1708486952514;
        Tue, 20 Feb 2024 19:42:32 -0800 (PST)
Received: from [127.0.1.1] ([117.207.28.224])
        by smtp.gmail.com with ESMTPSA id o23-20020a056a001b5700b006e466369645sm4436231pfv.132.2024.02.20.19.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 19:42:32 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 21 Feb 2024 09:11:53 +0530
Subject: [PATCH 07/21] arm64: dts: qcom: sm8650: Add PCIe bridge node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-pcie-qcom-bridge-dts-v1-7-6c6df0f9450d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1286;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=2Q/c7cqWrxsgCvrUBqcb1kHsDO6XcH9wkH7M5swouBc=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl1XEG3L/MMQLUUU5YiEPeYWXMJ3zBIYu2KPjm4
 u+aES6erhyJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdVxBgAKCRBVnxHm/pHO
 9U2QB/kBs6laNU7JRlhgMKm6ASX0OS6MYaQvS2tL1rajvK8SCI69MfZTsB80Q8ODw/yvJz4cMoB
 NCZN+LPTealKSn8cdF7Jdj2Pw5PVTpMPGZdhNoR3qKAWYYKrHZZ80qVW9yBYfyryS1uiSd/pPRb
 8ivwqpEEWugE/H4tUbYYY11Z232YEuuCHE2KlGRUPST1rv3BBp0CAMWfkyACBuX/ked5WvqNa7i
 EcJt3noB63jTK4wKTeFUEi0ReVpHZhytL7eLBolR+ezbyGIWMFNdiqbu+o7i8+G+ssissRac5w4
 9EJmUIOIlinZT7iRQQbWIH/Iu9FVIfulRzxlOiLnanrIXick
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
for each controller instance. Hence, add a node to represent the bridge.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 2df77123a8c7..57a1ea84aa59 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2270,6 +2270,16 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
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
@@ -2379,6 +2389,16 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
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


