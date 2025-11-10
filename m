Return-Path: <linux-arm-msm+bounces-81137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 78179C48E60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 20:09:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C0D784F6D85
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 19:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669C433B6FA;
	Mon, 10 Nov 2025 18:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="DjwEHmzY";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="G8ROzNz3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB4C33B6C8;
	Mon, 10 Nov 2025 18:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762800920; cv=none; b=dOBJJ123DbBD5TvP05C0qETPqhM+jdZn6zAUgDiMXhSn0LCFPgyAhkBK0WuyOb9UqVBvE+oZLdfdtdA0sTs6qzlHYBog/1jU/mOaSnue5ok7Qbkbsqu1oCKiF27QfvdfPvdKGVNsmR6uPMBZjquqlz1OrlV28jhducP4/mOiw84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762800920; c=relaxed/simple;
	bh=fPuoTgZC7rNwrfkVKiHzNGBC3fyoM+tBSWoj9cq5rag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=btyP7oGWz+vNrKUZFEDu0BVCNZkFLZP5ow/xOA78X2z7L3x4+o1h3GTsqgesZl+eUnzGHonkYkAeYCTsz8C8uAMWfhejwxuLJ/tGS9taqwLoasBk15DHmXM0Knc7nTzysdItpxFaBN7MvqiX0mhtBBmAyLVAk3VRM9Ke24/wvkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=DjwEHmzY; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=G8ROzNz3; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1762800911; bh=o1J75RrinyqC7VsB+e/l2lA
	YXB8pWyZVmDUqipNZARA=; b=DjwEHmzYNofsdi1SVeR+varM7x6D9YXGcB8aqKKwTqYAfozFzx
	y3aL1rSUTexc270IULT9TcmMWUDdAboje8+3wcDOkkYtpDpiLCFpDc7emBCkbW+2J0tCuME56at
	OEgdqBVgvOndERJAmXu1MiuuZ96rVmxNdsvuK9TpCK/MbTSKpaef3nrDumPIBrYNPR5pvRdvUet
	33XPPwYhntfwamY5aJr4ZlGSezDi9rfKywF6/LIOnGpwoxaAoCyq1cC9G/xRTJEJXJTdnuBMixt
	g0zOD+Rf444UBGVQW+EdU/gG+djyE9F80Ssj6lkMqKGICSsyXDsv6/Piu4KLIy/yOuw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1762800911; bh=o1J75RrinyqC7VsB+e/l2lA
	YXB8pWyZVmDUqipNZARA=; b=G8ROzNz3siUq5Fs30OORy1KG0gLtfhwCikze5iEz8+CnExy5gc
	oX+iodawfVcF/a0EWnWPcjOslKmXJBEoCuAQ==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Mon, 10 Nov 2025 21:55:08 +0300
Subject: [PATCH v3 3/3] arm64: dts: qcom: sdm630: Add FastRPC nodes to ADSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-qcom-sdm660-cdsp-adsp-dts-v3-3-d1f1c86e2e6d@mainlining.org>
References: <20251110-qcom-sdm660-cdsp-adsp-dts-v3-0-d1f1c86e2e6d@mainlining.org>
In-Reply-To: <20251110-qcom-sdm660-cdsp-adsp-dts-v3-0-d1f1c86e2e6d@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, Nickolay Goppen <setotau@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762800909; l=1337;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=fPuoTgZC7rNwrfkVKiHzNGBC3fyoM+tBSWoj9cq5rag=;
 b=49e6v70G1J1sJ2637d3khbKFpxqOBJ2rR7JY/MfeW2F2SHSQt8bzHv2o/+AESrwjKKhorzjwX
 IawWcCXhHn0ASPic/aD4n5CusKoa4wkSZQa7O0aoE0/jWZXA1tpPXAG
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
2.51.2


