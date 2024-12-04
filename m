Return-Path: <linux-arm-msm+bounces-40238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A559E39E5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 13:28:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A3BC286081
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 12:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78611CDA16;
	Wed,  4 Dec 2024 12:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lykWTuxI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5301CD1E0;
	Wed,  4 Dec 2024 12:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733315236; cv=none; b=aLTy/i24E/T5/jmOCOx8WxhmS4Sm8dQLYlggzGY33sbRfGyGWqlY46llAOMihRRk4uX8STov95x0FesURQFEX7d8NGqpVkBv0PpSbuak+rzY4S0dLCaoJXmnLlD+mGFDDJn3qqqx9uuyiqBvi9pCRB6GvafAqd9STXA7Et3cO80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733315236; c=relaxed/simple;
	bh=8kJH1aCPRzLi27KAgWkroEiNcQgrobWypSWXyYNueFs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cesblzR4M4uD6uDsK2eOZFbTH80bALvqlTGAYq0Ak7mfSxxqNJJkjYH632sItcp9RIrMcEV61cTwQ4mDxIQ+ed2Ou8w2eS9l3E7BToQD9+hmGZ80wRM+DZ67vJL5Try+pUSaRY9EPAn2Xq6dPiXZATX/j5z+UshoBanERpGmeBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lykWTuxI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2DA7EC4CED1;
	Wed,  4 Dec 2024 12:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733315236;
	bh=8kJH1aCPRzLi27KAgWkroEiNcQgrobWypSWXyYNueFs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=lykWTuxIaxvoRSuw39sMaoz+9f2uF9IE4JrYG6dQKAC54NGynW3m8qwsxdPdpT5Ff
	 unB+zc62PgEQbyPs9h9huqKnbhz3uBpFKoZL41Ho8f2kvBB1fnZojtcEvjB5u8N9wt
	 2oiAPSW6Lxf+gNO9JNGDRwdWQxCCBeAAP34nK6cAHvr0q3G/bF/hqn/ejJhekbClHU
	 bAav/UbnkLlLC2BxXGWOYVOBFrc691i4z6etppWwxGhLefp0wKubl+OC5UmugP9oPF
	 xPx7pYTt+HzyWn+qWqq2aJBAm5S0C7RRrnywgAIXj/MglD5mscBCjSB9zfSCcKcqqx
	 3s02wP5O1kFJQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E568E7716E;
	Wed,  4 Dec 2024 12:27:16 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Subject: [PATCH v6 0/3] Asus vivobook s15 improvements
Date: Wed, 04 Dec 2024 13:26:36 +0100
Message-Id: <20241204-asus_qcom_display-v6-0-91079cd8234e@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHxKUGcC/4XQ24rCQAwG4FeRud5Zksyh1ivfYxFJ25ntgFrtu
 EWRvvtGEXRpYW8Cf8h8IXNTOfQpZLVa3FQfhpRTd5DgPxaqbvnwHXRqJCsCsojoNeefvD3V3X7
 bpHzc8VXXwcVYUGmMBSXvjn2I6fIwvzaS25TPXX99rBjw3n1qZGa0ATXopeMyxpIsMK/b7rznt
 PuUKXX3BvrXIDEYqhiXrvAyNzXMu2HnDCMGAFUFmQpLgqlh3w03Z1gxPLJtGL0c46eGexlS5gw
 nRoDGFI7kmzH+NcZx/AUMDKlwxAEAAA==
X-Change-ID: 20241116-asus_qcom_display-ce5ff7293340
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Maud Spierings <maud_spierings@hotmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733315235; l=2711;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=8kJH1aCPRzLi27KAgWkroEiNcQgrobWypSWXyYNueFs=;
 b=U4kuwkINKUwXE0oYU7Wjb8/6ZPzy7nW045W7R+OL4f20Rqy5N2mz8IAZBCOBGlXZ9qcjTH73M
 7d7Nt7TmS6lC/kU27qv5tTz9HkcJ+YH0mbYWvTr2XME4TW+rNx39wQl
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

Improves several parts of the devicetree:
1. The eDP panel bindings
2. Add a lid switch
3. Add bluetooth and describe wlan (depends on [1])

A big part of the bluetooth/wifi patch was copied from [1] as it is
mostly boiler plate regulator definitions
[1]: https://lore.kernel.org/all/20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org/

---
I seem to get a warning that the pci17cb vendor is undocumented (wlan)
I can find this compatible in
Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
But pci17cb doesn't really seem like a vendor name to me, I have ignored
this warning for now.

Changes in v6:
- Use the proper define for the pmic-gpio drive-strength in the panel
  driver patch
- Add a comment about the voltage to the pmic-gpio power-source in the
  panel driver patch
- Remove the alias for the not (yet) existing debug uart in the bt/wifi
  patch
- Remove output-low from the bt_en gpio in the bt/wifi patch
- Add wcn- prefix to the bt-en and wlan-en gpio node names in the
  bt/wifi patch
- Link to v5: https://lore.kernel.org/r/20241202-asus_qcom_display-v5-0-e0d3752ff71f@hotmail.com

Changes in v5:
- Fix the pinctrl-# definition in the wcn7850-pmu node in the
  bluetooth/wifi patch
- Link to v4: https://lore.kernel.org/r/20241125-asus_qcom_display-v4-0-61a4da162406@hotmail.com

Changes in v4:
- Fixed the pin parameters for the backlight enable pin
- Fixed the wcn_sw_en drive-strength, this was not in the acpi table I
  checked.
- Fixed the ordering of several nodes in the bluetooth/wifi patch
- Link to v3: https://lore.kernel.org/r/20241124-asus_qcom_display-v3-0-002b723b1920@hotmail.com

Changes in v3:
- Fixed commit message formatting (line wrapping)
- Fixed bad indentation (lid switch pinctrl)
- Fixed bluetooth addition and added wifi description
- Link to v2: https://lore.kernel.org/r/20241123-asus_qcom_display-v2-0-a0bff8576024@hotmail.com

Changes in v2:
- Add missing gpiokeys include in the lid switch patch
- Add depends on for the bluetooth patch
- Link to v1: https://lore.kernel.org/r/20241123-asus_qcom_display-v1-0-85a9ff9240aa@hotmail.com

---
Maud Spierings (3):
      arm64: dts: qcom: x1e80100-vivobook-s15: Use the samsung,atna33xc20 panel driver
      arm64: dts: qcom: x1e80100-vivobook-s15: Add lid switch
      arm64: dts: qcom: x1e80100-vivobook-s15: Add bluetooth

 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 201 ++++++++++++++++++++-
 1 file changed, 200 insertions(+), 1 deletion(-)
---
base-commit: 9115d6b2d6bdbd14c1fda449a2a1653f7ad40dce
change-id: 20241116-asus_qcom_display-ce5ff7293340

Best regards,
-- 
Maud Spierings <maud_spierings@hotmail.com>



