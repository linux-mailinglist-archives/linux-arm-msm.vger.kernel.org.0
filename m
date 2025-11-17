Return-Path: <linux-arm-msm+bounces-82142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A234C657C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 18:29:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C95D84F6A97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 17:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0571D328269;
	Mon, 17 Nov 2025 17:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="GqUz6BT/";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="IdqUIJ9J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A18B32548D;
	Mon, 17 Nov 2025 17:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763399882; cv=none; b=M8kYYEsqDNsFK+3meRS/DWd4zVrmsY5pttS2mVMkV7wgwL5x3ctXTpZWjI/LAvrKndwBROZJe2DmzxWuyS4U7mN/sR0f3ePJ7IEQ+XH/mE3xBj0KLxpsGTptVpQPxSvdy/JT2vfzWEWDBmxLcyfzWEJ4wgzodep5ALSwG93FXXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763399882; c=relaxed/simple;
	bh=luxMh6nSPe4a4WQfUhnTlp8BlrYVOLeHoOixQvBd5wo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=infqv2BWSEubsLX16AfbuOc2Us66hn69OM9JRhVxOOpnfl9AcVxG4DiS5fVCmItOeTOUBXbRhvpRhx4gSW/+xhCe5K7tZAACsJbufjHlY3lO/8lb2LX9M0L2168fBt9PW6oqXTxHhTyfGss2qKkB8fPg0V+TxVg6i9BaNVieRGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=GqUz6BT/; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=IdqUIJ9J; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763399878; bh=wscdxgqJFP079dwx6QgJV44
	ViczuO6mV5R4gurjE0ng=; b=GqUz6BT/00NFKRYO8d5CKoLnPuEtBiVpFIqbZtXomSbydm0dpf
	pPkZQ4vhofj0HKzTGHAARXl/nhA7+Fsnyb+HYVZayDFEauLsaXkWUmeCjuEoNzcX6b2r1CssrTy
	0kYZbw5g7niqIJXqItpqP1nEcoYeF74gZqn8pESu/VizMP+ZGD4Sci4ANS824W8/w4OoIWmId2f
	i7NkzyXN58MyDbGWQvxuwFmGrYd7LNYPdkKtZlPOyUWEMGiDBgEvNwMCPvXr4cKfoP9woAVTD85
	f1ZWDz6HR3XW1hu9N+u3AijqCT9S980x9jo/NP2asXYL07J+x1FYb8Uk5w6tYCFzS+A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763399878; bh=wscdxgqJFP079dwx6QgJV44
	ViczuO6mV5R4gurjE0ng=; b=IdqUIJ9Jq9DnsRlVlCI+Ar5ytxw45K64h+soOZ8K6+AcDaLt9S
	gPX6g60GD4LrhUDOFVarJ2a4EIXTxbthQACA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 17 Nov 2025 18:17:55 +0100
Subject: [PATCH v2 4/4] arm64: dts: qcom: msm8937: add reset for display
 subsystem
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251117-mdss-resets-msm8917-msm8937-v2-4-a7e9bbdaac96@mainlining.org>
References: <20251117-mdss-resets-msm8917-msm8937-v2-0-a7e9bbdaac96@mainlining.org>
In-Reply-To: <20251117-mdss-resets-msm8917-msm8937-v2-0-a7e9bbdaac96@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763399874; l=731;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=luxMh6nSPe4a4WQfUhnTlp8BlrYVOLeHoOixQvBd5wo=;
 b=ufw4U8QdV82PJejJ/TKL/XeTGnA2lIAtLtccGnwgMO/Jhv038BbX6SAWvKAj5V2A5gSKsHEVh
 kI/mDA2N8sqCZpyG+t8194347ExDRG3NbyiL+Umi5cCryb+KvizjWqU
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add reset for display subsystem.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8937.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8937.dtsi b/arch/arm64/boot/dts/qcom/msm8937.dtsi
index b93621080989..c94eb14e31bd 100644
--- a/arch/arm64/boot/dts/qcom/msm8937.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8937.dtsi
@@ -1044,6 +1044,7 @@ mdss: display-subsystem@1a00000 {
 			clock-names = "iface",
 				      "bus",
 				      "vsync";
+			resets = <&gcc GCC_MDSS_BCR>;
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 
 			interrupt-controller;

-- 
2.51.2


