Return-Path: <linux-arm-msm+bounces-65838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53007B0BC3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 08:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15FCA1896481
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 06:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44FAD21CC43;
	Mon, 21 Jul 2025 06:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q2AAYmG8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1986BE56A;
	Mon, 21 Jul 2025 06:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753077890; cv=none; b=bukd32Ama6jkLeKRZrwx3+T1nsPbSBPGFfQeiAVBQ/SI0a+1zIE3N1b9r4LIBCyj9/waGX1efxW5c7xWxD0aV43ScMHSDhqdHJQ/WGsGzwKIs1pkL4pPu/mrqdbOwmowprs5bESZwL4bRc6WAEjtTsP4aDt66VaHwbm9SDsVuq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753077890; c=relaxed/simple;
	bh=GJGKJkD0S9i1I48RnIhVN+NDQEpwg+vdqVOw66GHbhc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t9NnEJJ0VMSXRdCaCieSFmvhipYpzqVt3iH93Qsjt1BdD03T3h+6GbaoFY8Zy6pIBSBLlTAnSuh+fXAUN25heO3Aq9mNjWfsMKlzxiUWpPaHblHzzzXLA9w4zYsL0+Tc2PJzX0sYp4n1G2DNdhU1lHCnlR/bkY4jH69GDzcmmh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q2AAYmG8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0719C4CEF1;
	Mon, 21 Jul 2025 06:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753077889;
	bh=GJGKJkD0S9i1I48RnIhVN+NDQEpwg+vdqVOw66GHbhc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=q2AAYmG8ZwwmbbLYd4+RMHwZEV+hSoNGd6+HNPiHYESm5BbPCbbLMTazJxWOPzLh6
	 tbY8Ur7qgMAOSuRv4kCeETcKMO6m6M/YPu+Gqqu8OVraAEE1YE1ufV27NMJ1J+czj8
	 TyX2F7ixBWHZyhw1nkpmghrw5v8GIvqR4D4pA4U95IikVhulMAJqemcgzniqNNhIm4
	 wPqLFqjqvP7ZqFIdgUqZ++W97fQosn0eZ64sAncC1SlyhFvbyhow80XH20C/ALXIKv
	 b6G86J6hgPmAxUUORM0LYjOAdyIdkhHBys47ZnkkmTY+qx4IwXwNVSIq736xdy49IT
	 iJJFQ7sKSON+A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83ADFC87FC5;
	Mon, 21 Jul 2025 06:04:49 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Subject: [PATCH v5 0/2] Add CMN PLL clock controller support for IPQ5018
Date: Mon, 21 Jul 2025 10:04:34 +0400
Message-Id: <20250721-ipq5018-cmn-pll-v5-0-4cbf3479af65@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHLYfWgC/4XOwW7CMAwG4FdBOS/ITpom5cR7TDsU14VopWnTU
 m1CfXcCaBqiSJys35K/32cxcPQ8iM3qLCJPfvChTcF8rAQdynbP0lcpCwXKgAGUvuvTcJKOrey
 aRjo2aCt2VtdOpKsucu1/buLn1z1H7k8JHv+XBz+MIf7eWie8bv8K1KJgQglS2QIUIWVgcRtOY
 xPC95rCUVy1ST0K+VJQSSAoi5qIK8RsKegHAV8IOgm1drklUyqw+VLI3ghZErQrynyngQ08/TD
 P8wWuNuGpiwEAAA==
X-Change-ID: 20250501-ipq5018-cmn-pll-8e517de873f8
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753077887; l=2648;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=GJGKJkD0S9i1I48RnIhVN+NDQEpwg+vdqVOw66GHbhc=;
 b=cKuDzYsoKrIQCumB61hsrkVupRSRJ1IFEeC02V/6gpFapF6av5n4m4+ZRUXJlJB2RpN1ONsD6
 Tr9IGbuRMEpDNl5ykmXmWUBiDSklyJ1DboA0HmvIYB+osCfRP2ms/KV
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

The CMN PLL block of IPQ5018 supplies output clocks for XO at 24 MHZ,
sleep at 32KHZ, and the ethernet block at 50MHZ.

This patch series extends the CMN PLL driver to support IPQ5018. It also
adds the SoC specific header file to export the CMN PLL output clock
specifiers for IPQ5018. A new table of output clocks is added for the
CMN PLL of IPQ5018, which is acquired from the device according to the
compatible.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
Changes in v5:
- Rebased on tip of master for patches to cleanly apply
- Picked up Konrad's RB tag
- Link to v4: https://lore.kernel.org/r/20250516-ipq5018-cmn-pll-v4-0-389a6b30e504@outlook.com

Changes in v4:
- Re-add missing CMN PLL node after git pull and rebase on linux-next
- Link to v3: https://lore.kernel.org/r/20250516-ipq5018-cmn-pll-v3-0-f3867c5a2076@outlook.com

Changes in v3:
- After further testing and evaluating different solutions, reverted to
  marking the XO clock in the GCC as critical as agreed with Konrad
- Moved kernel traces out of commit message of patch 1 to under the
  diffstat separator and updated commit message accordingly
- Updated commit message of patch 3
- Link to v2: https://lore.kernel.org/r/20250506-ipq5018-cmn-pll-v2-0-c0a9fcced114@outlook.com

Changes in v2:
- Moved up commit documenting ipq5018 in qcom,tcsr bindings
- Fixed binding issues reported by Rob's bot
- Undone accidental deletion of reg property in cmn pll bindings
- Fixed register address and size based on address and size cells of 1
- Removed XO and XO_SRC clock structs from GCC and enabled them as
  always-on as suggested by Konrad
- Removed bindings for XO and XO_SRC clocks
- Removed qcom,tscr-cmn-pll-eth-enable property from bindings and will 
  move logic to ipq5018 internal phy driver as per Jie's recommendation.
- Removed addition of tcsr node and its bindings from this patch set
- Corrected spelling mistakes
- Link to v1: https://lore.kernel.org/r/20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com

---
George Moussalem (2):
      arm64: dts: ipq5018: Add CMN PLL node
      arm64: dts: qcom: Update IPQ5018 xo_board_clk to use fixed factor clock

 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts     |  3 +-
 .../dts/qcom/ipq5018-tplink-archer-ax55-v1.dts     |  3 +-
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              | 34 ++++++++++++++++++++--
 3 files changed, 36 insertions(+), 4 deletions(-)
---
base-commit: 098738b001e2e6944805f8ea53e9bc711f13d47f
change-id: 20250501-ipq5018-cmn-pll-8e517de873f8

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>



