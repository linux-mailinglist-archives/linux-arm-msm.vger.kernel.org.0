Return-Path: <linux-arm-msm+bounces-11984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA0E85CF18
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 04:49:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 500591F21546
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 03:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024903A1AC;
	Wed, 21 Feb 2024 03:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q7SX/YCx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B39D3FB01
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 03:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708486992; cv=none; b=un9R37oxmdGIV2SZcYZXERHRYl9eR/1ghJRNd225ILlmgA7SiYVWaixPNnjJnilSzedj/BecmfVwjfKRKjy2heGvq4gGFgyHeBPeKtr8xuoJRP7KVSnge4T0RVWO4WYKFR2xVNtjHzEn6yRDR9yS09QjGLWcQwx9AEJUNIQYPZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708486992; c=relaxed/simple;
	bh=qYfhZr1QKvnAAFBzBwVdnJgmr64ONfGX2GtsdC7/1Ys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BP/jfLP7gM8htmpIOyYc0kuPUTojlwi8uRmqHWP+OAurKBZxqm8pBgTB50mhAhJiwa3Q7ouQ5MknczOiiMyWvgJwCj0VzbqHPZv4ga1+D3cIeKJJnH+IdeMYgaGDTiPt8pLP/XxMc7Gw29PW9d9MSvPAlmR9LG17AYZAseIea14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q7SX/YCx; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3c02b993a5aso3757694b6e.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 19:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708486990; x=1709091790; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6AdtRtmeVfkqKZ33AOntJFK5isZ/CwV6F70tMVzXM9I=;
        b=q7SX/YCx6mOkKCuYaaGO8p0V8ffksG6WqTtsFoUschhTZRk1UnKK77kxosGWgGLWYj
         Dmol0fcY0vvVtqf2CIyFxMP734im8+hvRGAblGllpmAVpEK92JLUZ02dUGHRuxW5MmhG
         oZawdepk0zXHrodnIVraOxyJM4XlJ55CFfenUhPGSkY8BPXNZIPh9cNDNivt3NvI6Igz
         XzQl1CoWWVha93SS5nfqNvug9I3AQNXCUwybMgAkBRRR4JtXnDZo13ykv02mA51rvKfm
         Ezl2ykycJa99jZhustdyLg4v0zHYj7BgV+hl5o6hcon/A435nc5rhoLQspr2tpfmtKLW
         zcpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708486990; x=1709091790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6AdtRtmeVfkqKZ33AOntJFK5isZ/CwV6F70tMVzXM9I=;
        b=uhv1gQF6Dz35DikLwnCOfIpjrpr1dUt8e2yIfzSbnBc6kg5hxXP0gCVmLqcbls35Cm
         CNyD2cyTR+WMA2hxUBqBe25vx34nl8up9IlYtvES0j++CYFS/9Q8R+y0rsLUyk26Rvtk
         4aJE9/UagkGGsa12SpOKiSG9Z0mxHFHauZoJ+ytcuHkMmIpo+iw2UDdEIA7KBDe/hsPA
         LoJ1CLNNuIE0FFRseX1pl5FL+76yigm7KxuMCoAz0TGzP0iD9bfaMoZCar7jMherbkOd
         UfZzdDFuu5PWuE1+RPIqtgNCzMlDIcsZwwllUqY6Vm0Gezf/EtywSQc0TFZpQDYv3SNr
         b8kA==
X-Gm-Message-State: AOJu0YyUd5xHBHszrc2PAXPYSz6r2d8pyS50H5GsSM7Y9nUfWXnFHy1p
	GRIHTCns8Ee8+MuWk2dAc4RZO+sQEUUsRQqVR9GVZ47t+v3gVznHWGDaV8t1uA==
X-Google-Smtp-Source: AGHT+IFbKYmBdONwdxTxmycNKv2VXYD0fDwtip+3v34VqKC6cXFILPPyIp8I1XJwYqxbZI66lMuPFg==
X-Received: by 2002:a05:6808:1446:b0:3c1:3763:148c with SMTP id x6-20020a056808144600b003c13763148cmr21273569oiv.17.1708486990575;
        Tue, 20 Feb 2024 19:43:10 -0800 (PST)
Received: from [127.0.1.1] ([117.207.28.224])
        by smtp.gmail.com with ESMTPSA id o23-20020a056a001b5700b006e466369645sm4436231pfv.132.2024.02.20.19.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 19:43:10 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 21 Feb 2024 09:12:04 +0530
Subject: [PATCH 18/21] ARM: dts: qcom: ipq4019: Add PCIe bridge node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-pcie-qcom-bridge-dts-v1-18-6c6df0f9450d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=907;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=qYfhZr1QKvnAAFBzBwVdnJgmr64ONfGX2GtsdC7/1Ys=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl1XEJn2hZJQI1xY6nJLkvym9As+cYR7cOiZkVW
 gnh6dBk1WiJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdVxCQAKCRBVnxHm/pHO
 9eDqB/4gEpk5BBdLsM1zc5MBaovqSm0P4nx/IATGFAM/CX+uz2jOCdilJVaQHuIut4InNP7Fmhf
 4irBka51M78j6Zx7gF628eijNAxFCtrn3byuLrF1658EHsjXUn41iBhkucwwCu/q5RuggLUnXjE
 rStiP89KBE+5oF3oSFUayWto5GvMq5A48aiIYQzqf2OlvTjB0shn5xk+RCR63ZsWuoiP+Mrz8I8
 Ra/gzA1jKQV4J1BnkRrCExp7sirzxHWnU0Lv237RjsKU1YoKhtLMDdIjBS/8vUxuKgGnDbYJY9H
 NHUbxzazFo/jaW61lklPSwRSm425STq83uL7JX11uJ9diRjI
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
for each controller instance. Hence, add a node to represent the bridge.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
index f989bd741cd1..03bd421a2ce7 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
@@ -475,6 +475,16 @@ pcie0: pcie@40000000 {
 				      "phy_ahb";
 
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
 
 		qpic_bam: dma-controller@7984000 {

-- 
2.25.1


