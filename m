Return-Path: <linux-arm-msm+bounces-36792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C529B976D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 19:26:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E3F21F21F8A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 18:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD391CEAB0;
	Fri,  1 Nov 2024 18:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bxoI/Odb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E21F1CDFAE;
	Fri,  1 Nov 2024 18:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730485564; cv=none; b=ghijEnztAYRLWLu3CW4gbwuiTiFkD9szQZG8vEzTcHBNfEGDZ6joGjNrOPf9bgfRqbHDpPZeNq6hSfJ76q1L9EwY/tMGoO35uL1dw7cTliabQuNnuS+R6BAWwWjKtF0bbANT4i9FRbfAHEBOPfmgQuR5DVCoaRngggDakP3H5eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730485564; c=relaxed/simple;
	bh=5kBH6+2r4C8QbxO+hFiEt6sBvYfxzBlWkAB5Bf8ASmg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZkGu6vRW2ls1KG4XqsBbC73Vpjq/GQeWMeKB1y0gQS6aeRw6G6lIpU12hFZzFatFf/qwJLPNezp8hlvX19UleH6v8LejeruYOOSEKebZuwHbRBynRafRIKenBDR1Rrz4qBNle/DmGriwSFtTQI1DrIRumXys1rMmzHUx8mL/mEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bxoI/Odb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF4EDC4CECD;
	Fri,  1 Nov 2024 18:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730485563;
	bh=5kBH6+2r4C8QbxO+hFiEt6sBvYfxzBlWkAB5Bf8ASmg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=bxoI/Odbg9Fl/AArqRJqSUEVX+dLIW2rXigJXVSYlI+/fS9u+XZdesT8vKXoDgUd9
	 zKjKYdynafDWmTsNpGYc0W1MScNweuJWfzOJuSQzLnHFgvNSOnzdIFHPJ5RlV4HpnA
	 vtpo+/Pmjd1URaC0/7fkJyAhLFIhLP8LV6JcULyt4thq8ojOhq0jvD0XxzJq1EP549
	 11UT2a5IhThGstIpo1Amvctv6OJApGzEtWv+EkkViMA1JDiDsY7CMYw1WdjQr1YqNE
	 iSGlJOkBU/ONK2yJbLyroxEnMEl9Lo/2yxBKmpmEWfKnKVAhWT/VbtyPCC0crsSlST
	 yawP/S77G3YnQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1015E6F068;
	Fri,  1 Nov 2024 18:26:03 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH v7 0/3] arm64: dts: qcom: sc8280xp-blackrock: dt definition
 for Windows Dev Kit 2023
Date: Fri, 01 Nov 2024 19:26:00 +0100
Message-Id: <20241101-jg-blackrock-for-upstream-v7-0-8295e9f545d9@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADgdJWcC/43QTW7DIBAF4KtErDsVDBCgq96j6gLzk9C4IQLHa
 hv57sVeVNkUZflGmm+e5kZqKClU8rK7kRLmVFM+t6CedsQd7fkQIPmWCVIU1CCFjwMMo3Wnkt0
 JYi5wvdSpBPsJyinrLNKgOZK2fykhpq/Nfntv+ZjqlMv3dmpm65TIKIVWgUEQUoOw3IKNFMFJD
 JI6y8xevObRV3fMeax5vE6tX30e0g9ZyRk35oFyMwIFM0SMbEBmmOuy/I9llPEeyxurufFcaG5
 1UF1W3LGoeqxorKJ8QCmiMzJ2WXnH8u4T5NaWOsO14Mr6Lrt/mN2vbZ1XUXntjfr/t8uy/AKJs
 CxNcgIAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Merck Hung <merckhung@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730485562; l=5799;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=5kBH6+2r4C8QbxO+hFiEt6sBvYfxzBlWkAB5Bf8ASmg=;
 b=j+ZNKWkg5+V6TqeYGxaKYFPc6tfEGPR50pqO9DAy0Wt/ps6c/ELO8rgvvcPnMB8O5XwsSplgc
 93PHkJrE1JdCytI0XcR5uKfsItR0chyDYjPaFgbV61vjCSwRB+XY5Mm
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

The WiFi definition references qcom,ath11k-calibration-variant = "MS_Volterra"
which is unfortunately not yet in the linux-firmware. The ath11k driver finds
the default one for 
"bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2|18,qmi-board-id=255"
when the entry with the variant is not found which is quite sub-optimal. I 
have placed a pr on github/qca-swiss-army-knife:
https://github.com/qca/qca-swiss-army-knife/pull/9 that provides an amended 
board-2.bin and a board-2.json to generate it. 

pcie2 (nvme) is intentionally specified as max-link-speed = <4>. The 
interface is capable of it, most current nvme ssds are capable of it, 
but the physical slot isn't. This leads to a silent downgrade to <3> instead 
of the "device is limited by bus, capable of..." message.

It is in use and under development since May 2023, pretty stable now.

---
Changes in v7:
- re-checked and amended the usb_2_dwc3 definition as pointed out by Krishna. 
  The SoC definition already has most of it, reduced to enable node and pinctrl
- re-worked the sound definition - this box has no mics or speakers or jacks 
  for them AFAIK. There needs to be something done regarding Soundwire on DP, 
  but this isn't working yet.(Konrad)
- rebased the patch onto <20241018-sc8280xp-pwrseq-v6-0-8da8310d9564@linaro.org>
  and updated wcn-6855-pmu accordingly. (Konrad)
- re-sorted the pmc8280_1_gpios (Konrad)
- removed the gpio-reserved-ranges since I don't know what they are for. Best I 
  could do is refer to the X13s dt, but it's not the same hardware. (Konrad)
- ath11k: opened a bug https://bugzilla.kernel.org/show_bug.cgi?id=219454 
  to add the board id with variant to board-2.bin
- Link to v6: https://lore.kernel.org/r/20241030-jg-blackrock-for-upstream-v6-0-7cd7f7d8d97c@oldschoolsolutions.biz

Changes in v6:
- added missing acked-by tag from Krzysztof
- removed aspm-no-l0s from the PCIe ports as suggested by Johan
- corrected max-link-speed to <4> on PCIe2 as suggested by Johan
- changed WLAN variant description to "MS_Volterra", added Kalle Valo 
  for approval / guidance
- trimmed the supply statements on hsphy and other pcie ports for what 
  is known and defined on the Thinkpad X13s
- Link to v5: https://lore.kernel.org/r/20241030-jg-blackrock-for-upstream-v5-0-830c938437ad@oldschoolsolutions.biz

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
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 1353 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 4 files changed, 1356 insertions(+)
---
base-commit: bddda360b78a17a18002320bf2fc467f6b89f019
change-id: 20240920-jg-blackrock-for-upstream-7c7aca20e832

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



