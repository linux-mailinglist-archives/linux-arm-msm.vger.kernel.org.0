Return-Path: <linux-arm-msm+bounces-86803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9B4CE6171
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 08:13:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 798EA30078B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 07:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351652E7F29;
	Mon, 29 Dec 2025 07:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YK4ln576"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C653D2E092E;
	Mon, 29 Dec 2025 07:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766992407; cv=none; b=CIHF2s5+Bxpxb9qJ+KoOtLVHUI22wClgtHqTvulyzh6Kl4D/JJxH23ksPsfohD2DI+Cvls2i9jfGtn7dFuSRHO7mHuxCl6LM6HZjcmWDFv7Mm7UohPR/Fdet5/YdpC56Uf/OZrGUxdthjCFodtSQDje82AeSGjvGJK4kUv8rXAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766992407; c=relaxed/simple;
	bh=Ecd356netppr0Ylf9iL299ZOMRUmJGlaHlNAyhnvCIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CAFxbEIOpv0cGHzTlr8UOMAg/NNPHla86juo5Xi3iGTweiYRdIzAXGXRPQoIPYFZz1qZCUzEPT+Ke7O7O1XgEckumx/liK7LUAzFUgFIXZsp9erwh/hAPfLsYKn+d1UYpSqLrjN4V1DSqeO23Xy3YEUKlJIZn6gr5B8iPzKU2Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YK4ln576; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D91CEC116B1;
	Mon, 29 Dec 2025 07:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766992407;
	bh=Ecd356netppr0Ylf9iL299ZOMRUmJGlaHlNAyhnvCIE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YK4ln5767k2Por1qxXVrhJIaVE7b3JH09ha3zD+o+NLHK1OtFe4qfKXObFRKAVjv3
	 /s1EyrH3h3TwcWjyqEAo+Bil3gueMLHqsGyh+9IsLIJT1VYmftz1DOJQMca2QDOJ+o
	 AmaGRQp6ixrVkHWBPqCqwPx6i+Z7/KvGccebOjCH/ayT2FQEtAgMt25zzdLCUAowjU
	 00Nne5M8o++rljMmYgCcdP1+t98syWecGjHNBxc3hcOmJzSt65LaFlcegebVqcgU+v
	 /AgDku1J8gzNYKGBzmqb1KkFCDEz5Yr6rIOAp2bXszfLLR778k8s3/Q4Zwv2ZDlsII
	 uczZi2Kzx3eVQ==
From: Sumit Garg <sumit.garg@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	akhilpo@oss.qualcomm.com,
	vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: qcom: agatti: Address Gunyah memory alignment needs
Date: Mon, 29 Dec 2025 12:42:58 +0530
Message-ID: <20251229071258.456254-2-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251229071258.456254-1-sumit.garg@kernel.org>
References: <20251229071258.456254-1-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sumit Garg <sumit.garg@oss.qualcomm.com>

Gunyah hypervisor requires it's memory start address to be 2MB aligned.
So the address map for Agatti is updated to incorporate that requirement.
This should be a backwards compatible DT change which should work with
legacy QHEE based firmware stack too.

Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index e705eb24160a..153916980ac0 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -298,8 +298,8 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
-		hyp_mem: hyp@45700000 {
-			reg = <0x0 0x45700000 0x0 0x600000>;
+		hyp_mem: hyp@45600000 {
+			reg = <0x0 0x45600000 0x0 0x700000>;
 			no-map;
 		};
 
-- 
2.51.0


