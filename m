Return-Path: <linux-arm-msm+bounces-89641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F202D3A7B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:02:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADCE83099402
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B784931ED68;
	Mon, 19 Jan 2026 11:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SFTQgtVI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB8D31E0FB;
	Mon, 19 Jan 2026 11:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768823934; cv=none; b=Eqcfj5+2xpUqdBny7Vl+B3IRzgq8gO4W6v/G1HLo896KKB+StnhmptnoWFmifWNNXkNRi3fGh6fIANRI3aqjAhggpxUolCBgiUYf8pV2G9H47XpS+c4+5PazpuYH36b6EXJziqVR/POJox4ZBPJ5WC9/WlrXLEVLL4NAQm6IB60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768823934; c=relaxed/simple;
	bh=UJH03pt/HCNAVGxlSPOAvNDktJX9VtuZbMWmI3zKO+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O8RkRAReMjpb7GIKaZmCoJvnak1mnJ9Xhiu9NvcvmrJ8c9pta3QQ7YYehQoji6j3Cu5qGzkVfvTddifb+MVK6IRiFIEgcXgmmHZ7tj+nS9SYp/JxwU+c9qOHO41GSR4+3hgyM+KYzUsw+PxafgrENaLL7YVsudJ3S56waEa+VY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SFTQgtVI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E90FBC19424;
	Mon, 19 Jan 2026 11:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768823934;
	bh=UJH03pt/HCNAVGxlSPOAvNDktJX9VtuZbMWmI3zKO+s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SFTQgtVIwKSSmZwN6SXhqcJLGVROqQAYu+XWX0YpJx/VIweX7y0rdgvsSEIdhS15X
	 aVsz21cOyILBzTbyIJtgXrN9L4Fbbn6JZQX53tSpToFvFTh0EAgFweNSaHBC0VUNi5
	 y5ma5cs/mr9G+sHYoFheaKRosDjIfSGyKc4NNkUo9+BNe7sKvTXOn0lDB/5YEJGyI7
	 /2taxR7dU21xrGfB/M03BMH8JUsqTPz7Rd6HDKrAz1O0W3XhRlcvHvhgmWGApdLqTm
	 kRMAYZgDjjOlyrF0Sxm15p9kNeDk6B1EV3QeTINoMKgbu1dnkYAQ9xG5zQau9axC4J
	 PR8grK7lWEB/w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF299CCF2F2;
	Mon, 19 Jan 2026 11:58:53 +0000 (UTC)
From: Petr Hodina via B4 Relay <devnull+petr.hodina.protonmail.com@kernel.org>
Date: Mon, 19 Jan 2026 12:58:52 +0100
Subject: [PATCH 1/2] arm64: dts: qcom: sdm845-sony-xperia-tama: Correct
 uart instances
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-akatsuki-uart-v1-1-238f4da4fa56@protonmail.com>
References: <20260119-akatsuki-uart-v1-0-238f4da4fa56@protonmail.com>
In-Reply-To: <20260119-akatsuki-uart-v1-0-238f4da4fa56@protonmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Petr Hodina <petr.hodina@protonmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768823932; l=772;
 i=petr.hodina@protonmail.com; s=20260107; h=from:subject:message-id;
 bh=yP+WtTK/ZuMwm0Tv1MowvsKSjWzVcZPOtxKougxOT5o=;
 b=fmrL/yCCVSP+940lTVa3WEeYjdMPiRPZp4cYzJwgtP9/EKqcEBXAAKb+IY65xCP17Uwf1en9D
 ZN7jBKoTLLtD1iEjJlYruNb+JbXH8b6RlavIf43UmZE70i/BHwNjO6K
X-Developer-Key: i=petr.hodina@protonmail.com; a=ed25519;
 pk=3QaVc6AaAu1IsyyH86+LIOOFhD7kCws8Xhe+wwyE7Bg=
X-Endpoint-Received: by B4 Relay for petr.hodina@protonmail.com/20260107
 with auth_id=594
X-Original-From: Petr Hodina <petr.hodina@protonmail.com>
Reply-To: petr.hodina@protonmail.com

From: Petr Hodina <petr.hodina@protonmail.com>

Change the uart instances:
- uart6 is for bluetooth
- uart9 is for serial console (available on the uSD pinout)

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
index 7dc9349eedfd..68841e036c20 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
@@ -17,8 +17,8 @@ / {
 	qcom,board-id = <8 0>;
 
 	aliases {
-		serial0 = &uart6;
-		serial1 = &uart9;
+		serial0 = &uart9;
+		serial1 = &uart6;
 	};
 
 	chosen {

-- 
2.52.0



