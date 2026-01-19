Return-Path: <linux-arm-msm+bounces-89700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57253D3AE8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 16:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 79B0A30022F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 15:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC0438945B;
	Mon, 19 Jan 2026 15:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8taw/ST"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606CF387590;
	Mon, 19 Jan 2026 15:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768835585; cv=none; b=mjCRbZjqtfMJ1buaNSLP25NJUcmtEV1icG+gwl6k8tbTNshc5Ed0Ovhi5QDmmwXg/cz8qcYVLpdwiBkltm3hPhWKH/1CYGIxhGX1seuf/5edXEVGEHdc3DSbJiQqdPKU9V2yQAZU6qcN/q+u+8WWsXG7vNRr88Eb+cdqIknnMOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768835585; c=relaxed/simple;
	bh=Y8J3a22LxojTwtjFDIOq3Xh2Y1/v/z1bHpEomhNiyzA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LwClSJ8K6+PfWSEDZicsFhPo7kIHdl3pHEObH0XUmw3kccjhz6O1eu/DKOtHWGZ27qfVsl1FtdXAp4czlz+qfbewf9702y0BOSnr0rKxWzz3VmRUxZYbHPiupF53k923g56B63UTQRWHOCeFUtlHEYkIAGpurWiaawOHMW0w36A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8taw/ST; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 026C3C116C6;
	Mon, 19 Jan 2026 15:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768835585;
	bh=Y8J3a22LxojTwtjFDIOq3Xh2Y1/v/z1bHpEomhNiyzA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=F8taw/STlq7Z6x1qDnlDKHZvWEgXB6Azj+7WEn0JcjiGMp5dP4vxkLOtfslIHsLDh
	 5+He5tSVchSqkA1sUyW4gzUoLcTid4cbAFNpvJ/6TY4fYsqdT0vpzDnq/jJi1zFy4x
	 tyhjMaN+O6VCsG6S/rKfhUDswp0ea4RD3wcijUTpvwTUpk4+qPO20E/UGq0RLR/uHx
	 r92VOvjwBhtuG7+qZTKps8CCve1d5xw6lHKqni9Bji4SaH+Jiieu5hZCVdfvmpfuMP
	 7Hyy+mZ+htqGzVKyTbdSSrhpFQjyILLJJActHAPDZd8vxuf70nSUcgpJd5slxnWXDY
	 aZJ6A2/X2rSwA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED82FD29C32;
	Mon, 19 Jan 2026 15:13:04 +0000 (UTC)
From: Biswapriyo Nath via B4 Relay <devnull+nathbappai.gmail.com@kernel.org>
Subject: [PATCH 0/5] Fix volume up and add RTC, PRNG, UART in xiaomi-ginkgo
Date: Mon, 19 Jan 2026 15:13:02 +0000
Message-Id: <20260119-xiaomi-ginkgo-features-v1-0-3c8fae984bda@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zXMywrCMBCF4VcpszaShBKriPge0kXaTuJgm2jSG
 5S+u6HV5X/gfAtEDIQRLtkCAUeK5F0KccigfmpnkVGTGiSXigtRsJm074hZci/rmUHdDwEjU4X
 MUXCDtRSQzu+AhuYNfpR7B/wMye/3ETqMUW/+Jbv+ePXnJ2pbP7FRMs5ydc4NVideN9W90+Rac
 uTs0Qd7g3Jdv9QrS0fEAAAA
X-Change-ID: 20260118-xiaomi-ginkgo-features-6824e10fec21
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768835583; l=1701;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=Y8J3a22LxojTwtjFDIOq3Xh2Y1/v/z1bHpEomhNiyzA=;
 b=NM+djRWh0hDybZin4U0mrEc7MyDRvjJyr4UOy3vHhBJXA2rYheA/U9sXRcJ1upF5wXsk97R5b
 6iH0ILhSqhEA0H5qE7snvR1uaPnD+7cg3QQv3FjWngBVU3kiXziKcvg
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Endpoint-Received: by B4 Relay for nathbappai@gmail.com/20260118 with
 auth_id=607
X-Original-From: Biswapriyo Nath <nathbappai@gmail.com>
Reply-To: nathbappai@gmail.com

The patch series fixes an issue and adds some components.

Changes:
- Fix volume up button gpio and power source in xiaomi ginkgo.
- Enable RTC from pm6125 in xiaomi ginkgo.
- Add prng node in sm6125.
- Add debug uart node in sm6125.
- Enable debug uart in xiaomi ginkgo.

Depends on:
[1] https://lore.kernel.org/linux-arm-msm/20260116-xiaomi-willow-v2-0-4694feb70cdb@mainlining.org/

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
Biswapriyo Nath (5):
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix volume up button
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable RTC
      arm64: dts: qcom: sm6125: Add PRNG node
      arm64: dts: qcom: sm6125: Add debug UART node
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable debug UART

 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 22 ++++++++++++++++---
 arch/arm64/boot/dts/qcom/sm6125.dtsi               | 25 ++++++++++++++++++++++
 2 files changed, 44 insertions(+), 3 deletions(-)
---
base-commit: e5d16f0daba655b8c63032f7b0ae1f21881d821f
change-id: 20260118-xiaomi-ginkgo-features-6824e10fec21
prerequisite-message-id: <20260116-xiaomi-willow-v2-0-4694feb70cdb@mainlining.org>
prerequisite-patch-id: 97a500cccd7099f84f02d24b79f9632264ff0919
prerequisite-patch-id: a76649864084c6349d5bbd425c84489621e3d950
prerequisite-patch-id: 88844031b714eecc8185b968927ece52795237cd
prerequisite-patch-id: 7f01d4e3dafb4911244d6bf03db9ac03395f8609
prerequisite-patch-id: c339d93729aee842cce74ba1316f5b5c8d01d04e
prerequisite-patch-id: daad11c94235247984631a78b2c2cda74f8af5bf
prerequisite-patch-id: 816740927f2e464864884584e6af596b038074dd

Best regards,
-- 
Biswapriyo Nath <nathbappai@gmail.com>



