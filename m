Return-Path: <linux-arm-msm+bounces-78642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CE4C033C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 21:53:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEE421A68106
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 19:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8EC434EF11;
	Thu, 23 Oct 2025 19:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="NBlHOUX4";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="XB+Hhwer"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F91D34EF08;
	Thu, 23 Oct 2025 19:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761249177; cv=none; b=N1UgK+e9Gck+44OgUOeMrxVneb9BkbMHnxSFX1xwnVChsGBY7qu5Hcxw1wItyF1IfPBfICXXunYyUVUBNkLZw8XhwNBUZTu4KPJt/bxoZJPm9/FCdUewMc4gDgIBx+fP3huIGEOf7/uk0RST4FjzQrgVtUz/UKAqnb14OtuocB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761249177; c=relaxed/simple;
	bh=XkCFV7kQMF+UdCqXzcpZ5l0Jrqpw//50JO2YNYemhXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pb3Td24DE9+jR2SbPrSqDAgShhQnPDScAXLHvRrI+S9ET+xwBsAv1ygLxCc7SFlHg/mDfQbOJnf5fLjhgoDSktvv4v9yFv0dS0vSm8LGhUvskRRBiBXy3VMGcjT9BRW8uJzTXWaaw40IUHgu82r+s65U0byJXUb5/V5EyPaXJzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=NBlHOUX4; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=XB+Hhwer; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1761249131; bh=xm4LduRCq2//QsRDs7TP7kW
	oXcuXVNBbPQWdSjZ5g5A=; b=NBlHOUX4ezeij37WNIP9nBDEGZMQaPLQoqdS0y/KUdCBFeczfF
	T6abq7s373xnTr3tBnoqMjHyHv0dHa003AJsZGseUIvbVj8TiRWfoZQYRIjw8m9dVoG8Osk3A1o
	wn8XE/m7yU5usAsljItMVMWZbh/kpy3OsFHCs8/FvlCaSfATtDzZKew3hdFpxDeRPeg7lScixAL
	zQr0xI0zO3MFWU9RI++MrmOZUHU15sRdjbCQZlTsYaug0oXLvRMdYrUPKJerndIcJbRTb8GmqSN
	uFYpMUCBnhkj+ovasolWuJMu9zZOfwjEemIj0ClPYtKbyl8Gv+7Ea5Fujg2uA4OSFsQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1761249131; bh=xm4LduRCq2//QsRDs7TP7kW
	oXcuXVNBbPQWdSjZ5g5A=; b=XB+HhwersYVj16y+dSP20jPpkea9sMX/2VpHFcIHqvYCv26JFx
	STkDOr0UKQ0vxLPY3A+DxnJU18wXMgjyWADw==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Thu, 23 Oct 2025 22:52:01 +0300
Subject: [PATCH v2 3/3] arm64: dts: qcom: sdm630: Add FastRPC nodes to ADSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-3-895ffe50ab5f@mainlining.org>
References: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-0-895ffe50ab5f@mainlining.org>
In-Reply-To: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-0-895ffe50ab5f@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, Nickolay Goppen <setotau@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761249128; l=1337;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=XkCFV7kQMF+UdCqXzcpZ5l0Jrqpw//50JO2YNYemhXs=;
 b=Oasg1XB+DxnDwtcJulAZtdnz1oq7hbLVOXG8E8XfT954JNjSvPlz+IZdUcd08zn6pp2f7ey2N
 0oik3QE8gn5AcFn5wLBm20VWWikR2p+fcnnWCQVUsV0TuWL/e7dMCVZ
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

Add FastRPC subnode with compute-cb subnodes to ADSP node.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index f4906ee3f0c3..2764666714e6 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -2342,6 +2342,39 @@ q6routing: routing {
 						};
 					};
 				};
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&lpass_smmu 3>;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&lpass_smmu 7>;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&lpass_smmu 8>;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&lpass_smmu 9>;
+					};
+				};
 			};
 		};
 

-- 
2.51.1


