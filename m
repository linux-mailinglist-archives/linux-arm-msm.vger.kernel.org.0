Return-Path: <linux-arm-msm+bounces-29874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 978C89633E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 23:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 412D71F229FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 21:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65CE91AB528;
	Wed, 28 Aug 2024 21:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O6A3qyIt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D441AD416;
	Wed, 28 Aug 2024 21:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724880728; cv=none; b=QIVegJlDtcsXiZnZ+lVK3oakW6g5rs4GxpvCNouBrj6la3DylW1Prf6DH3ASS2MHOllx4tXJQB0xAHpu3uwaAlTDLtCSBYk57Tm93bWiRxl1QikP5GAjNot3oUXb+2DzzurcD61WsfTfYMK+Z2Um7frfWI5B9KjW+7kqPCAaU2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724880728; c=relaxed/simple;
	bh=tvvsM7RC7K+AS3pR//hz5+6DDeoWHDT2NRglbiOrZU4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sSGw/CG7DWsVtYxei805oj2HG4epKyyJvee26j7yj5S+sua4kH/ccWag2NDmEp0KrbptRoM+ja9C3DI/I/go6XfYXRD+T9ND7I7cP2KudX4RefBDPQ9BxlT9iLGMDPIrtawSjUDrech/ShAnHIX8kaimNXoJRHM4g0WH/MkB6MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O6A3qyIt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8708DC4CEC4;
	Wed, 28 Aug 2024 21:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724880727;
	bh=tvvsM7RC7K+AS3pR//hz5+6DDeoWHDT2NRglbiOrZU4=;
	h=From:Subject:Date:To:Cc:From;
	b=O6A3qyIt2IMZX47N89uoca7T2Mtlc3YXAypRBe7WeJxFd7ZU1mjuQq09WHxizWpap
	 1xjaA2aUPzZTsNtIY5Glqh+AZnDB6w6EgJ8a6kMGdXG+y+S4Bu7kARQczAdh6Pifn8
	 Kb0TlY5M5EQEPz3ODLL7tchSMhyIP+RBWdlcyDK99S2YOmUvcL4zApnKTHHZ4k8LYJ
	 PhPBUbY6bai5t7paNVI1bSC38xdgU2Ad3aT4I+H0EfQ+AaBGqEhF5u+OmrC8dyaEfu
	 EMp24AgSwqE6pAqAxFkrEpBMeALflqOTmkDSBSgnsFS+NjyvYV9AZ1/fLjAwLw7fhK
	 rl49xYs4MmDaw==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 0/2] ThinkPad T14s Gen 6 support
Date: Wed, 28 Aug 2024 23:31:59 +0200
Message-Id: <20240828-topic-t14s_upstream-v2-0-49faea18de84@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE+Xz2YC/32NQQ6CMBBFr0JmbU1bMYgr7mGIKe0UJlFKppVoS
 O9u5QAu30v++xtEZMII12oDxpUihbmAPlRgJzOPKMgVBi11LRvVihQWsiKpOt5fS0yM5inwfPL
 WSWudNlCWC6On91699YUniinwZz9Z1c/+761KSOEa1zbe4TDoS/eg2XA4Bh6hzzl/AWt2Wiu3A
 AAA
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724880724; l=1119;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=tvvsM7RC7K+AS3pR//hz5+6DDeoWHDT2NRglbiOrZU4=;
 b=TLekHTXo+uZF/UaTguepotezwSHmHSjooJB5NvHVyJL23luOkkhJ0RyAoLrNv6Nt9fH9Q3PYn
 rE5ZJUWmuuyAZ6bjOpOKfW/BZ9ck9FHUn9On/bRh57r9mcULtCgn1nx
X-Developer-Key: i=quic_kdybcio@quicinc.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

As good as the other X1 laptops

See this page for more hw info:

https://www.lenovo.com/us/en/p/laptops/thinkpad/thinkpadt/lenovo-thinkpad-t14s-gen-6-(14-inch-snapdragon)/len101t0099

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- kick UART
- add PCIe4 pinctrl
- fix PCIe4 PHY supplies
- disable bias on PERST#
- remote regulator-always-on on EDP vreg
- explain what X1E78100 is
- add missing chassis-type
- Link to v1: https://lore.kernel.org/r/20240719-topic-t14s_upstream-v1-0-d7d97fdebb28@linaro.org

---
Konrad Dybcio (2):
      dt-bindings: arm: qcom: Add Lenovo ThinkPad T14s Gen 6
      arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6

 Documentation/devicetree/bindings/arm/qcom.yaml    |   6 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     | 807 +++++++++++++++++++++
 3 files changed, 814 insertions(+)
---
base-commit: 1210438f69a0b58ad5f8a46816da90e245b2e17e
change-id: 20240719-topic-t14s_upstream-e53fcd0ccd2a

Best regards,
-- 
Konrad Dybcio <quic_kdybcio@quicinc.com>


