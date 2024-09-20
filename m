Return-Path: <linux-arm-msm+bounces-32113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0271197D953
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 19:47:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26F851C22561
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 17:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0D31802A8;
	Fri, 20 Sep 2024 17:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="awTceDyS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4BDD530;
	Fri, 20 Sep 2024 17:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726854447; cv=none; b=EQ0T4Dvnc0aUyR1X+LX/QE3rAmscJbx+PGfiy/8pdyuY142zf3FwHokjcm0A8zsvyKlybzdSGSDZl0v9ONa1EnQcsInNceerpc2SZLssDYH8NuYCb5UTmOASgTstMA6+3L5hgtOLW2uuWpHxx4Zb1WU3oRJYfVOZcRzvcuJ8NG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726854447; c=relaxed/simple;
	bh=mGCg4J/5BGD3gJKaTmQFi2kBsoo2r0rrbKe3dG75q5Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=r9XTRIuZqmHdqITldcf0b1ldSV6ORYpvJIOQSqga3oV7VSKYALje9I+E0icB8gmFiMe2AAgMu6g4tN7NV5/clofTFjoVNO+vQguOcEvuIytfURBjaZmvs7PRu74lPrEMnTlLJIVmjT+NDVUrbChvTmjaMdLqWXMiAkaIjP4D5cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=awTceDyS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5DB2C4CEC3;
	Fri, 20 Sep 2024 17:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726854446;
	bh=mGCg4J/5BGD3gJKaTmQFi2kBsoo2r0rrbKe3dG75q5Y=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=awTceDySO39iBg9QIXkPBBXIABSDmu3PQ6Y22jfYI3HsxOriZwDtmeN7VTH0oSl/x
	 4ZJwmrSZA+LfaoLYvfhuKC/Ky0aRAo8cwV/temHoSgrltmsFGi3cSXQvjNx+TIXaF6
	 0E/nCH71geQewafwjI/CmMlpRiiKJWyKRwICdQx9jnwTlUpmZx+v8am3Eqdy0BoS0Y
	 /16BNY44hSXgm7nQTaidPajCkeSmI4Opz0g7Qf61vVQtHS1yPz6ErfXFC6J/MZDB/m
	 3WXCrGxsLmVBk1UgXdvJ7mx+qWMU7+dE31stuTHe8NEbaPfcBx3RKVeIbAvSpmbKX5
	 gui7XjoZl3iyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE36CF9C60;
	Fri, 20 Sep 2024 17:47:26 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH v2 0/2] arm64: dts: qcom: sc8280xp-wdk2023: dt definition
 for WDK2023
Date: Fri, 20 Sep 2024 19:47:23 +0200
Message-Id: <20240920-jg-blackrock-for-upstream-v2-0-9bf2f1b2191c@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACu17WYC/x2OQQ6CMBREr2K69ptSWgFX3sOw+JRfqFRKWiAq4
 e5Wlm+SeTMbixQsRXY7bSzQaqP1YwJxPjHd49gR2DYxE1xIXgkOzw4ah3oIXg9gfIBlinMgfEG
 hC9QoOJW5YKk/BTL2fbgfdeLextmHzzG1Zv+UKaNkWVAGJFUJEnMENFyAVoIU15hVV3n3ro269
 95F75Y5/YuXxn5Zve/7D8LzOfG/AAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Merck Hung <merckhung@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726854445; l=1811;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=mGCg4J/5BGD3gJKaTmQFi2kBsoo2r0rrbKe3dG75q5Y=;
 b=fzGBZ1P3km1ktZaT8Bh01lhwQQDgrWbDqJTMI0GAC2A8ZxvaWR2qVT0Hm/Vdr8lTP/WcCmQec
 L6vzhAa+xaNBVnjDvS7KOQsgpQfDFSPrJDsaLdF599bE7mqeD6lO5Qo
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

"Microsoft Windows Dev Kit 2023" aka "Blackrock" aka "Project Volterra"

Device tree for the Windows Dev Kit 2023. This work
is based on the initial work of Merck Hung <merckhung@gmail.com>.

Supported features:
- USB type-c and type-a ports
- minidp connector
- built-in r8152 Ethernet adapter
- PCIe devices 
- nvme 
- ath11k WiFi (WCN6855)
- WCN6855 Bluetooth
- A690 GPU
- Venus codec
- ADSP and CDSP
- GPIO keys
- Audio definition (works via USB)

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Signed-off-by: Merck Hung <merckhung@gmail.com>

Original work: https://github.com/merckhung/linux_ms_dev_kit/blob/ms-dev-kit-2023-v6.3.0/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-dev-kit-2023.dts

This dt is more or less deducted from the Thinkpad X13s.
It contains a lot of guesswork, and also a lot of research on
what works with the Windows Dev Kit.

It is in use and under development since May 2023, pretty stable now.

---
Changes in v2:
- removed whitespaces and breaks
- added compatibility binding
- added feature list
- reformatted Signed-off list
- Link to v1: https://lore.kernel.org/r/5f5487e1-e458-4a3a-af02-c52e50ca1964@oldschoolsolutions.biz

---
Jens Glathe (2):
      arm64: dts: qcom: sc8280xp-wdk2023: dt definition for WDK2023
      dt-bindings: arm: qcom: Add Microsoft Windows Dev Kit 2023

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 1332 ++++++++++++++++++++
 3 files changed, 1334 insertions(+)
---
base-commit: 98f7e32f20d28ec452afb208f9cffc08448a2652
change-id: 20240920-jg-blackrock-for-upstream-7c7aca20e832

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



