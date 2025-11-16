Return-Path: <linux-arm-msm+bounces-81956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD9AC60E57
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 02:14:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6BB044EB4C0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 01:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC7DC1DA61B;
	Sun, 16 Nov 2025 01:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="AJuYWDNd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A0921578F
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 01:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763255616; cv=none; b=K3SSU6zfWUAB6AWsuc+CoQwR3Y6gx0HAUCqUQyV5h4zRO8sa4xnnqTLTF4zH+NMsMxG79yV1M56Ht0tQ6mI3rRIO4yRdmVNbE1p3kJeYN9hRUKvIP9lsF7qqObqzWeVrODA/ySjmI2mYsMjGfOjQXMK/9xagPv6vuaUzYs+2imI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763255616; c=relaxed/simple;
	bh=bTyV/HYwPwuHc6C1YROdxFSSqnjzqyL8eog+Uhw91jE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PNmRm6p9QvKUWlxVkvVdSUhyh2809w+7j03+sCEM/ACEO5q0gO7iGd2assd/BlPpjQbMURMMhHr3KYOJTR4rscEj03bvd+tBkxFjSobqGcicvRGsYcAOQnPp+2k0pKt18fgzVKuhiMnOCUext1qdgmYND69cEUGhylouEJelRow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=AJuYWDNd; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1763255612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w6bXBbcoVoyWKUZamRu37JTHuPgnt26R7z8laRfJ1tE=;
	b=AJuYWDNdOFJnBy/w9c9ZYiw/ioZMVRXq8L1Mqp3JSMGUVn2LhgkB+9Kz5batLKhzUSfpGs
	mGtHFMzY373gCxfRBDbCqYpvQqpbBcmf3xu9MAN/0yKagkkGqtw+L62MbmbvNC70AfYu4x
	lhIGnGALdSgKyAQPp7SIkVr2po/nShhQs5VMTTOa/ZsnOhBSbKvAtEaBfN/JhQoL5WgGVq
	X+hWMVNGlcEuVVVcCe6RF9ODPjcaJXR2/gSMxubI8I7UN2YUdVBi7b2cpHGHbPdxx6YwTc
	f1ohfQCaXUXTNy1TVZ5KFoELWnjSwgZbAXhdSa8KW+Hzl4V78cdyUZzSeGWvfQ==
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
Date: Sun, 16 Nov 2025 04:12:35 +0300
Subject: [PATCH v2 3/3] arm64: dts: qcom: sdm630: Add missing MDSS reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251116-sdm660-mdss-reset-v2-3-6219bec0a97f@postmarketos.org>
References: <20251116-sdm660-mdss-reset-v2-0-6219bec0a97f@postmarketos.org>
In-Reply-To: <20251116-sdm660-mdss-reset-v2-0-6219bec0a97f@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Alexey Minnekhanov <alexeymin@postmarketos.org>
X-Migadu-Flow: FLOW_OUT

If the OS does not support recovering the state left by the
bootloader it needs a way to reset display hardware, so that it can
start from a clean state. Add a reference to the relevant reset.

It fixes display init issue appeared in Linux v6.17: without reset
device boots into black screen and you need to turn display off/on
to "fix" it. Also sometimes it can boot into solid blue color
with these messages in kernel log:

  hw recovery is not complete for ctl:2
  [drm:dpu_encoder_phys_vid_prepare_for_kickoff:569] [dpu error]enc33
      intf1 ctl 2 reset failure: -22
  [drm:dpu_encoder_frame_done_timeout:2727] [dpu error]enc33 frame
      done timeout

Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
Cc: <stable@vger.kernel.org> # 6.17
Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 8b1a45a4e56e..fedff18a5721 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1563,6 +1563,7 @@ mdss: display-subsystem@c900000 {
 			reg-names = "mdss_phys", "vbif_phys";
 
 			power-domains = <&mmcc MDSS_GDSC>;
+			resets = <&mmcc MDSS_BCR>;
 
 			clocks = <&mmcc MDSS_AHB_CLK>,
 				 <&mmcc MDSS_AXI_CLK>,

-- 
2.51.0


