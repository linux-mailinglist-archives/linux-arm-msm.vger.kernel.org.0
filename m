Return-Path: <linux-arm-msm+bounces-89699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC225D3AE8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 16:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6962230022F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 15:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4CA38944A;
	Mon, 19 Jan 2026 15:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkKZN5Tf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6064E36E496;
	Mon, 19 Jan 2026 15:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768835585; cv=none; b=hQ4P+bkXLSFh3IiXvSk0tuTIhW6UPzMQk2/dRN4qYEkHGAfffu4wI1JmMINb8yroImKw+6HFlWOWFm4O+1aFso9ZmLv8MbwEwKZQ5z15y69kvvEfe+VwAjb22xxlhhkz5zd4IOhYpJxXAKxbTQnOLmtTPEWIYAf55LSxY9oxqQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768835585; c=relaxed/simple;
	bh=Dc0V1b2Wd0E2tiGFSsj4sqXyOLcncruQAPeInqcRFFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=trBhsgYywa7KZrugN2TQt9CnHh37ifjQto/jwzLLjllhHgUZlySh0eH9nc4uG1BEvKDMiTGMSvgPUFP/69cyUXRrdbHiz4yWj+/TEtyYBnKBZme/uy/RPcmqYKbKmN4z05kxGNXkHgJekVf3foVFqaWLg70B6HoJyPVUesMv1ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkKZN5Tf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31CE7C2BC87;
	Mon, 19 Jan 2026 15:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768835585;
	bh=Dc0V1b2Wd0E2tiGFSsj4sqXyOLcncruQAPeInqcRFFc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TkKZN5Tf+Ov0FbMlVFGpIVfkyKAl+QB8Qihg1Gbpazj4HmWNxVh0U16FAFb2ooD5X
	 JhWVdwzojWg2Fxmd9aV/20Qb0FBLXS5sLWYTYUU+tTzvNkE2wHn/va9jrHJSqOoy17
	 cxuM07cAoyWrr24ly+NkVJCSJM8TxoCj7KOIaVDK8BCt10UUDBr8zthMjLo35OGgow
	 tFtMYL5pOS/6K3tRfgTSplFdehXsc5ecArx5wgcB4bh7rpRb8ZwT+0n3TvBFYWJLwi
	 h94rF0gWbGWBzB+MthM/excePpkF1HU80oTiUEuFXoJzi1R9hEmol0df32S2d6DHFQ
	 yX115Y1gK6/nw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2B8D29C33;
	Mon, 19 Jan 2026 15:13:05 +0000 (UTC)
From: Biswapriyo Nath via B4 Relay <devnull+nathbappai.gmail.com@kernel.org>
Date: Mon, 19 Jan 2026 15:13:05 +0000
Subject: [PATCH 3/5] arm64: dts: qcom: sm6125: Add PRNG node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-xiaomi-ginkgo-features-v1-3-3c8fae984bda@gmail.com>
References: <20260119-xiaomi-ginkgo-features-v1-0-3c8fae984bda@gmail.com>
In-Reply-To: <20260119-xiaomi-ginkgo-features-v1-0-3c8fae984bda@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768835583; l=817;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=59zkknkV+4u3lCcwhYSFnDAH6nnfGIvbUcRT8uB4bM4=;
 b=o7zG7AUUiabBW6FOM9TqEKHI50UeE9ZUt+r9/PPaEivylVEWpUeB6RW27Xt+GRMjranECLCrn
 Th7/ZLn8kXrBS+EcnG9ohgwTXQp8rWPatuvVBwOyNkHx3SzA/hXtDDt
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Endpoint-Received: by B4 Relay for nathbappai@gmail.com/20260118 with
 auth_id=607
X-Original-From: Biswapriyo Nath <nathbappai@gmail.com>
Reply-To: nathbappai@gmail.com

From: Biswapriyo Nath <nathbappai@gmail.com>

Add a node for the PRNG to enable hardware accelerated pseudo random
number generation.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 8f2d65543..e60d4d74c 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -686,6 +686,13 @@ hsusb_phy1: phy@1613000 {
 			status = "disabled";
 		};
 
+		rng: rng@1b53000 {
+			compatible = "qcom,prng-ee";
+			reg = <0x01b53000 0x1000>;
+			clocks = <&gcc GCC_PRNG_AHB_CLK>;
+			clock-names = "core";
+		};
+
 		spmi_bus: spmi@1c40000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0x01c40000 0x1100>,

-- 
2.52.0



