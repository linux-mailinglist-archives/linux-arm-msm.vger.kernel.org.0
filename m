Return-Path: <linux-arm-msm+bounces-49315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC310A4413A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 14:46:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A46A3B4E82
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 13:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A084269AED;
	Tue, 25 Feb 2025 13:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B7OsNhP+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478C4269837;
	Tue, 25 Feb 2025 13:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740491097; cv=none; b=keNZGQnRCfo+Nh3V3SsVlt/2y4gHBBRErvjEVtLNjLyZF2kkL/xkn5ZUCVigs13dugXCBuxCU/PLJiEX0dhkHXntaIVxA1WK2a1OIaHF4bdp0XxBOciQfMVjMF/MF6pv8mdYfvYBxDuhu4JQWwg9rIN/sj7AVGyQ5Crzl2mkbro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740491097; c=relaxed/simple;
	bh=tQxxNhP0OfWotZT1IcwA3V9l4RF3ybbDn/u2XIekXIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WmaDwTdyWvXJn50EGXjGTx7GcXeeoMUE+684VHgp43s+iANGNFdYWJSghIIgpZxeY8DtkWnesmqhPHU0J+i52Tpi5wtHdS7R16RsAmudI4Q334R4Np5cLx0Pp63/jGa9pGV3tULSS6saMJJselE/QJcydnqFYWPffZLNGfKwLuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B7OsNhP+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 321FBC4CEDD;
	Tue, 25 Feb 2025 13:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740491096;
	bh=tQxxNhP0OfWotZT1IcwA3V9l4RF3ybbDn/u2XIekXIg=;
	h=From:Date:Subject:To:Cc:From;
	b=B7OsNhP+NByPVR4NPYkgEHO9JwE1BnxOWHTHqtbxr8sqDQYZ0nQavQ4oJH+0j1fSR
	 auXWAePYXLyV+hsC6jaWr8P1HhCdjhEhwlq5gdvGygCJDt/5JacVj3QrVNt9bZ2D0l
	 wK+Y/usaQHV5Gp2FK8Spr8eXvdBf89uPeYB0J3CYj1wMWK+MIu7XNszgLxSAl/CZ5D
	 jf5YN9AcyXH5eNGzrfEWQYKNbrKHvsm4xlv7ezfiZRzjJ0ToZdAEJW0rNRse+f/1vi
	 5OVGnEHvJZVORxCop1PROSmvtvSSEPiLNuERZOAGDQX+GTnDOnSMNA6fSdnfiqHbXs
	 2LXvN9fGk/SRQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 25 Feb 2025 14:44:40 +0100
Subject: [PATCH] Revert "arm64: dts: qcom: sdm845: Affirm IDR0.CCTW on
 apps_smmu"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-topic-845_smmu_not_coherent-v1-1-98ca9d17471c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEfJvWcC/x3MQQqDMBAF0KvIrBuIg6HGq5QS2virszCRJIog3
 t3Q5du8kzKSINPQnJSwS5YYKtpHQ37+hAlKxmpizUYzG1XiKl71nXF5WTYXYnE+zkgIRXHX69Z
 +rcUTVIc14SfHf3+9r+sG2pmZhm0AAAA=
X-Change-ID: 20250225-topic-845_smmu_not_coherent-248019b99e7e
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <quic_kdybcio@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740491092; l=1758;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=Q6ia7djtQcGwHainUEDpfNTadDgNTryVhujY1qBqmZ8=;
 b=77IIjgl5vmI0C0HaWtWNgLd8nhyplbUvobG4g7/xRU0+FrkfNujHjFBa9EOls635ftfyN8O5X
 /W92ZifcghfCET7M8cgFGTtA1YSMaGhN91F3sJLJnyuhUKvpI5P68rS
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

There are reports that the pagetable walker cache coherency is not a
given across the spectrum of SDM845/850 devices, leading to lock-ups
and resets. It works fine on some devices (like the Dragonboard 845c,
but not so much on the Lenovo Yoga C630).

This unfortunately looks like a fluke in firmware development, where
likely somewhere in the vast hypervisor stack, a change to accommodate
for this was only introduced after the initial software release (which
often serves as a baseline for products).

Revert the change to avoid additional guesswork around crashes.

This reverts commit 6b31a9744b8726c69bb0af290f8475a368a4b805.

Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Closes: https://lore.kernel.org/linux-arm-msm/20250215-yoga-dma-coherent-v1-1-2419ee184a81@linaro.org/
Fixes: 6b31a9744b87 ("arm64: dts: qcom: sdm845: Affirm IDR0.CCTW on apps_smmu")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index e0ce804bb1a35047b092d4745988170738a3cd03..d0314cdf0b92fd282915e7184f88b52bf309b2c2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -5163,7 +5163,6 @@ apps_smmu: iommu@15000000 {
 				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>;
-			dma-coherent;
 		};
 
 		anoc_1_tbu: tbu@150c5000 {

---
base-commit: 0226d0ce98a477937ed295fb7df4cc30b46fc304
change-id: 20250225-topic-845_smmu_not_coherent-248019b99e7e

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


