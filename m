Return-Path: <linux-arm-msm+bounces-11980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB9385CF0E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 04:48:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07B001F21568
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 03:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1EEE3F8CD;
	Wed, 21 Feb 2024 03:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V4o8bKZS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07E43EA6F
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 03:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708486980; cv=none; b=AqG1ovw5EwMam+zn+Yk7y+mFzW6Mg/myIJODhEXCkb9vHnn+Q2byYDJ3CgTrdUrbxUDxXqOJ6KCz/vtd5+wYB6oKHgzo3G7S2ixJUiFQX6UBG6rC0eB1sjXmYvphWjVARpKkMVRAi9Z/CdYtwcstzXchWrMjku5KD/oeIIodzVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708486980; c=relaxed/simple;
	bh=v0NanrCHtPUCEUAvQdovAHbjQxA9Yuc4bxKGmsuGhc8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PG/ceFZG0rHa8dN/zr6g1rl6RLU1Z1Tcwwl9bpgIyxaTv4EcU+3frXjx05+PxJcy+LBHdXSCwvYCueGvTit7y48Cs5mmBzmcYm7mGpgMJ6Q4KrpEVpUpholJP9BCFNWWWqs9VWRPsadg7ZlAMHFwBFy1lMEcYPYIUoQJFhpOgqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V4o8bKZS; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6da4a923b1bso5232183b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 19:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708486977; x=1709091777; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VNXd84IFJbhmOHdXNTbZBZOPnufOfmzRvPaXP24uTLs=;
        b=V4o8bKZSJSZU2xlRFOeRe+IZs0zpUN3V81rQbD98XnHk0Au9QpXzmVBAIkPqMpPAL0
         YqcwYcfH+DvQRS4OtCjdc+jyO2LijT0ewnl/XttqWXumrJbxQYpj0IpeI/bS4xNTHWNM
         PlwYgMgn3jSMFDaj3dcfMa4yNjBX0bonrnhtTKNhht1d1kqCxFPVfiPC1v+nztZJlH17
         4HZilWsiSWGrETZMsNZI6Hu7EeCFaeAdK8PxNjKNZY2H4LqQdJxn/uon6uG2q0x/vZwn
         mgrIPrtSoKa3QNOgGQmddO7vJZBLV05MYa3wQIb0sS0Ae0vL2V2VHA1jqmvFDE/q5D5g
         iSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708486977; x=1709091777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VNXd84IFJbhmOHdXNTbZBZOPnufOfmzRvPaXP24uTLs=;
        b=Ui109M/9LWwgbYvGGJjU1e+dV5nXyHSMRcozkW0uuxv6BElUtuhyZ4PTcTLrk7X0XO
         CnFsEbATZAcd1gjs5WhIsQsHF58y4wJeAKQRqJZ0+KR/G1EaXP78UGyQ8671QI/W3J72
         ysfXyJ6PMG9/WqFplWJUkkDqh5RlNrI3/EbqQybF0rGaF5bBa/331lY1XDXz7nOjtXbf
         xV1/jAfF02A/WSUYwBueCio3Ht0DwsJyHOH/bvy7eHd/CjgaiAbpw9YcH0JZTTqukGkz
         HczTY9OVjhF+Mz7Mc07PPeRoaFAIpcGvv21jvQdgZttnyhtJXbFKIePQO7t5mkpk1DzQ
         mC6w==
X-Gm-Message-State: AOJu0Yw/jEq+5rcqwWq0vjsDLZL9f9AkWyvG3+jewYMxArTFL9nfK8mP
	9HB0Y6t7W2Xy+NN+nkTgJoy+OPfejzdM3G1+T38/3gfZaQSgUzOr1xGoimUI0Q==
X-Google-Smtp-Source: AGHT+IHjcDwZCbB1jFvmn+LlZxXAUGpkCGy8INEhx2LahEFD15AwObMhXhld5sXNlknu6mogBKQBfQ==
X-Received: by 2002:a05:6a00:4fd1:b0:6e0:f6ed:cf19 with SMTP id le17-20020a056a004fd100b006e0f6edcf19mr17965602pfb.18.1708486977102;
        Tue, 20 Feb 2024 19:42:57 -0800 (PST)
Received: from [127.0.1.1] ([117.207.28.224])
        by smtp.gmail.com with ESMTPSA id o23-20020a056a001b5700b006e466369645sm4436231pfv.132.2024.02.20.19.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 19:42:56 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 21 Feb 2024 09:12:00 +0530
Subject: [PATCH 14/21] arm64: dts: qcom: msm8996: Add PCIe bridge node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-pcie-qcom-bridge-dts-v1-14-6c6df0f9450d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1567;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=v0NanrCHtPUCEUAvQdovAHbjQxA9Yuc4bxKGmsuGhc8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl1XEI8VDFXBQaqdwVWhl8JNsDSbjO9PYWlQm4P
 yQVfsbj8Y6JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdVxCAAKCRBVnxHm/pHO
 9Sj4B/9zzpH91kAZBS39fhvKSAaU+3NFzzblxZl4hrI12T4eG4lhYaE33YnB2aTrqqlQ9I3l2Q5
 OAMvAi10kI9rKs2CGPAO1/s+juix0dMMtRtHeWcbLBIYcq/QE7kG46lC3po4Bb9fIIFUqeqWve4
 uv2RgBP6pv5fSl2Dpc0Lhak14CF85xYAgAfMQj7CINNrw+PU6DcploLgBMxr6Bv0z1e86pjDBIm
 O6q4A53O2xINBPovyQBfIwwkMiypaiJ8tZML4fsDP9W0u1SfuVQoKrJyeRizsODAvcCMnCMB/x6
 9Tr3+agGzVRliIPXH3QZ9E5RbEj8XgH4N5EhtRNCDfelIEVt
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
for each controller instance. Hence, add a node to represent the bridge.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 8d41ed261adf..cd28b368ebb6 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1956,6 +1956,16 @@ pcie0: pcie@600000 {
 						"cfg",
 						"bus_master",
 						"bus_slave";
+
+				pcie@0 {
+					device_type = "pci";
+					reg = <0x0 0x0 0x0 0x0 0x0>;
+					bus-range = <0x01 0xff>;
+
+					#address-cells = <3>;
+					#size-cells = <2>;
+					ranges;
+				};
 			};
 
 			pcie1: pcie@608000 {
@@ -2009,6 +2019,16 @@ pcie1: pcie@608000 {
 						"cfg",
 						"bus_master",
 						"bus_slave";
+
+				pcie@0 {
+					device_type = "pci";
+					reg = <0x0 0x0 0x0 0x0 0x0>;
+					bus-range = <0x01 0xff>;
+
+					#address-cells = <3>;
+					#size-cells = <2>;
+					ranges;
+				};
 			};
 
 			pcie2: pcie@610000 {
@@ -2059,6 +2079,16 @@ pcie2: pcie@610000 {
 						"cfg",
 						"bus_master",
 						"bus_slave";
+
+				pcie@0 {
+					device_type = "pci";
+					reg = <0x0 0x0 0x0 0x0 0x0>;
+					bus-range = <0x01 0xff>;
+
+					#address-cells = <3>;
+					#size-cells = <2>;
+					ranges;
+				};
 			};
 		};
 

-- 
2.25.1


