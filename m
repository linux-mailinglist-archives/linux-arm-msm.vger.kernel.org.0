Return-Path: <linux-arm-msm+bounces-36367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFCB9B5C4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 08:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBD91B21C9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 07:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86C561DD9A8;
	Wed, 30 Oct 2024 07:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OnB+r6u5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574E61D1309;
	Wed, 30 Oct 2024 07:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730272176; cv=none; b=nGPAlKqi8dFqZ2+Q4z9Tql9U9TfCikZpgYrX6eQY8I1tn72tbfNJvFZfZ3MbbhsRcxC+kocajtllwCyhF0fIk4ujkQCosECb3WmW1oCmTgeNxkvqDtn1RXb3pThjz0C2GeoDZGtzAxems6HKwjTKUgdFYn8JPcPHiw4jd9Pg0TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730272176; c=relaxed/simple;
	bh=FMi9v9rfyShs+0KRXyfefZqFxm7p06wxhQoe9oN6UtQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UYNr/NVfGxjrSjw7fbmEf5TBapCn7V6K8D8JHjspVWyT40mu6FoYYngBgqLwRLRAvMNvpk8OqGdmuP42u9g/NsyGJCGQnVxw1zqKZyVshYplmC/GvchamzFxktUtXz1td7kd74lS2GW/WdgMwG6LBUS7UmPk8BrpyXS5QiZbKy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OnB+r6u5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA2D2C4CEE6;
	Wed, 30 Oct 2024 07:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730272175;
	bh=FMi9v9rfyShs+0KRXyfefZqFxm7p06wxhQoe9oN6UtQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=OnB+r6u5gh9fQlKmWj6f4bnG2P0ur7LJCKBCnYk7pumIXl7Hx4bwW+X76zEY0uRvf
	 4rS+UyizIeiejyN94PHD7yqL0+h0dGFKmbGHlBfpN61yUusgXdyNrJ+7lXEtDACDlA
	 0CLv/OkLs45+c4ryNcz4FLBFxlNv2ySq7veJQ60Ka4gJOgwc92rHMK/t4I60gv9w/Y
	 DCeffFYME8tnoY6fCR+Rk4DkLT1J1AEkKZmsK8Jq02UTJGzF78ltiAsqN+9emE5iyF
	 fyUNGRqYJDvlKFbdHxUj9rClXssG0nk+dUpkj7tECaottLycrSvWBsd508s61vFFim
	 qlOZleDSYccKg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C700CD7495E;
	Wed, 30 Oct 2024 07:09:35 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH v5 0/3] arm64: dts: qcom: sc8280xp-blackrock: dt definition
 for Windows Dev Kit 2023
Date: Wed, 30 Oct 2024 08:09:18 +0100
Message-Id: <20241030-jg-blackrock-for-upstream-v5-0-830c938437ad@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ7bIWcC/43OQW7DIBAF0KtErDsVDFCgq96j6gLjIaZxQgSOl
 TTy3Uu8qLqp1eUfad7/d1apJKrsdXdnheZUUz61oJ92LAz+tCdIfcsMOSrukMPnHrrRh0PJ4QA
 xF7ic61TIH8EE44NHTlYia//nQjFdV/v9o+Uh1SmX21o1i8eV6aiVNSSAlLagvPTgI0cIGknz4
 IV7UW957GsYch5rHi9T21efu/TFHuSMK/OPcTMCB9dFjKJD4UTYZOUPK7iQW6xsrJWul8pKb8l
 ssuoXi2aLVY01XHaoVQxOxz/ZZVm+AdmkxIHEAQAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Merck Hung <merckhung@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730272174; l=4293;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=FMi9v9rfyShs+0KRXyfefZqFxm7p06wxhQoe9oN6UtQ=;
 b=Ajqw19rSXIkd1RBiABcxiW8b01Bc5t0jFpuKL2AYPGWSGhAnAHIQKbKUJwFM2ooQIaRNYP2Ao
 5gcNAzG2JqrAAOn/iEILZ57/5PJRpBcPbxDvyjahcQHVtepBVA+xE8K
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

"Microsoft Windows Dev Kit 2023" aka "Blackrock" aka "Project Volterra"

Device tree for the Microsoft Windows Dev Kit 2023. This work
is based on the initial work of Merck Hung <merckhung@gmail.com>.

The Windows Dev Kit 2023 is a nice little desktop based on sc8280xp.
Link: https://learn.microsoft.com/en-us/windows/arm/dev-kit/

Supported features:
- USB type-c and type-a ports
- minidp connector
- built-in r8152 Ethernet adapter
- PCIe devices
- nvme
- ath11k WiFi (WCN6855)
- WCN6855 Bluetooth
- A690 GPU
- ADSP and CDSP
- GPIO keys
- Audio definition (works via USB)

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Original work: https://github.com/merckhung/linux_ms_dev_kit/blob/ms-dev-kit-2023-v6.3.0/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-dev-kit-2023.dts

This dt is more or less deducted from the Thinkpad X13s.
It contains a lot of guesswork, and also a lot of research on
what works with the Windows Dev Kit.

The WiFi definition references qcom,ath11k-calibration-variant = "volterra"
which is unfortunately not yet in the linux-firmware. You can leave it out,
and the ath11k driver finds the default one for 
"bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2|18,qmi-board-id=255"
which is quite sub-optimal. I have placed a pr on github/qca-swiss-army-knife:
https://github.com/qca/qca-swiss-army-knife/pull/9 that provides an amended 
board-2.bin and a board-2.json to generate it. 

pcie2 (nvme) is intentionally specified as max-link-speed = <16>. The 
interface is capable of it, most current nvme ssds are capable of it, 
but the physical slot isn't. This leads to a silent downgrade to <8> instead 
of the "device is limited by bus, capable of..." message.

It is in use and under development since May 2023, pretty stable now.

---
Changes in v5:
- removed s-o-b from Merck Hung as suggested by Bjorn Andersson. The credits
  for the original work are in the cover letter and in the dts commit
- removed Venus codec from the list of supported features. It is, but that
  part is not in this patch set.
- Link to v4: https://lore.kernel.org/r/20241027-jg-blackrock-for-upstream-v4-0-703b254fc95f@oldschoolsolutions.biz

Changes in v4:
- removed the redundant regulator definitions
- changed the pinctrl property order
- use microsoft instead of MICROSOFT as subdirectory and device name component
- amend spacing in audio nodes
- change external connector dp1 for mini-dp to DP-3 for consistency
- Link to v3: https://lore.kernel.org/r/20241013-jg-blackrock-for-upstream-v3-0-839d3483a8e7@oldschoolsolutions.biz

Changes in v3:
- tried to heed all advice and comments given - thank you
- re-ordered patches to definition before use
- added "microsoft,blackrock" as compatible in QSEECOM driver
- removed the qseecom node
- ordered nodes alphabetically {address, node name, label}
- amended indentation
- consistently used blackrock as identifier / directory name
- sorted identifiers by the same order for multiple instances
- added some explanation re WiFi
- added definition for PMU on the WCN6855
- added some explanation for pcie2 max-link-speed
- Link to v2: https://lore.kernel.org/r/20240920-jg-blackrock-for-upstream-v2-0-9bf2f1b2191c@oldschoolsolutions.biz

Changes in v2:
- removed whitespaces and breaks
- added compatibility binding
- added feature list
- reformatted Signed-off list
- Link to v1: https://lore.kernel.org/r/5f5487e1-e458-4a3a-af02-c52e50ca1964@oldschoolsolutions.biz

---
Jens Glathe (3):
      dt-bindings: arm: qcom: Add Microsoft Windows Dev Kit 2023
      firmware: qcom: scm: Allow QSEECOM for Windows Dev Kit 2023
      arm64: dts: qcom: sc8280xp-blackrock: dt definition for WDK2023

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 1383 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 4 files changed, 1386 insertions(+)
---
base-commit: 6fb2fa9805c501d9ade047fc511961f3273cdcb5
change-id: 20240920-jg-blackrock-for-upstream-7c7aca20e832

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



