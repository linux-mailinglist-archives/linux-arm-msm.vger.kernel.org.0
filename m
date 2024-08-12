Return-Path: <linux-arm-msm+bounces-28277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9038194E55F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 05:07:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 150551F220E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 03:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 897A513AD1C;
	Mon, 12 Aug 2024 03:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HTOFxaKB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4799D55C29;
	Mon, 12 Aug 2024 03:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723432059; cv=none; b=aEcDTx2x1qA4F0FL2Ko1rlyKt3Q1PV6wCGlt/6DkUvgNXFANtfDx+PV1wN4AamoCVGJ8ANvIv6NggLdYb0Kq8Z+aPv0xhvaM5NMDk2Mi8IN1VAed1+MRXTOCnHShjp8OElWdfmwIAUUNV+nj1vyEMtxCum54kfhHkWwgNcnHRQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723432059; c=relaxed/simple;
	bh=Vbyx9MnjPam0JxqPJwZ8db2HpmveiEfp1O5jxskM+eQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=toedqrCW8mCrzusCH3w/0siZRPCFxZ4SDvbtMclzhSwFRf+RRGacYlDKzPvwxmI0r18ZAaY88keGnUGVMY31JxYT3ZfaZbvp4gje3N31ql/9c17oSfH6FUtBlr0YkGnZIUbuXcK2OjDaMNd1F4F0l71jIvKMj5hgxVjQk2fFDMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HTOFxaKB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD5EC32786;
	Mon, 12 Aug 2024 03:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723432058;
	bh=Vbyx9MnjPam0JxqPJwZ8db2HpmveiEfp1O5jxskM+eQ=;
	h=From:Subject:Date:To:Cc:From;
	b=HTOFxaKBnfHQGL49cpN3wKR/niNDuwDi1fvQ835sA5hshckASERt5fzbr3dgWmKSa
	 dzj8rK0JOPjAZfEfyo4YSCBjqmcNKNZXo/vpnjwJKVjpyDbzBAo2uKCTyD4rqvSNOd
	 R2dHi2QESChJ5nwNkUdq/2+uE1PkXB20aqsKhP4e313rpgG8deRCFjDfEt77AEJddR
	 mjos8ivOu144JBtmAI+/lM9uhz+ZwAAei5plPYX1+rRwzQBstfHi84ZJ9uiFllRK0U
	 F9DFGAxW41bu1olv4dFNyRvpCWUfJuYjDgZFeHIPa+N3mGVGQCAC4m7OIGuQoLIp56
	 YXbH7D2bFjOMQ==
From: Bjorn Andersson <andersson@kernel.org>
Subject: [PATCH v2 0/7] usb: dwc3: qcom: Flatten dwc3 structure
Date: Sun, 11 Aug 2024 20:11:57 -0700
Message-Id: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH59uWYC/x2NywqDQAxFf0WybmAeINpfKS4yY6wBGUvGqiD+e
 0OX53AP94LKKlzh2VygvEuVtRiERwN5pvJmlNEYggvRO9/ieOSIyhPlbVXso+eYXEdd6sGaRJU
 xKZU8W1W+y2LyY3M5/yev4b5/L6UfRHQAAAA=
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Saravana Kannan <saravanak@google.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3517;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=Vbyx9MnjPam0JxqPJwZ8db2HpmveiEfp1O5jxskM+eQ=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmuX2Al05IcGSxyEplF7w6kJrsLwL4S8aNIq1q6
 8UOcQa6WUSJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZrl9gBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVyZA/+MmwBfszDnluPaqyzFR9SHUjyUNJ1J4XwrUP48+J
 pL9ZxZh3sOY2Uw6iBjRqfXQkiDGfyyHVnKQcpsh6SWqFxcBdpQ7F+i+1zCaJ4uVXZSM9Eu3Km4Y
 F+bpq7Bq3kpWpCzjS3SPPjGKKGWynZwXScchfqpJw8Zj8sCHgqkTuuV3tMc3MLFSllhPANg7/BL
 vI/FPtUZ487MiAI4bky0kQlHxE2hDoblbzm4NSqPGwd9F1ZRNlrd0bJA4ZmRnX6upmWy8+fMu4Q
 Sr6KK7GBDV8TTVoeg+vRdrA1Ea+khQnlXBsH8HeMhBXGwztD0Bg50ZchrLD2clfkg5LH2JUCez0
 wNZOZwHeGeiGnGE1AqVc3rfwroOkM0i5oBgnrTwr5bMGKbXSEvfsgcrfDjCcQ9UdE/rbp54ja+E
 aqmmJhDUr1S00OuOgrYhmg+Hko/XnrxYwRchl3NCNHaj9bhdw1+fDfecnjASSgYUECGUxrXCgAF
 xtUU6XQx+ninWAUKzBDlyH/o8v989H7LUW6wacs9VgZEmfZoK8WPiL2dvTxnzdmciXALj+57LNr
 Mc3ucYmj0RMQ+oFfjza2OdLyt4bNLYi8Qj1vPVgA0LaKLxbvyPD4G7A2QwPzyhZKnXW5D0L917T
 O/zRlNUpmimF9FNBP35vFPMvzdDE6HYTiYT0sL3cjgAw=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

The USB IP-block found in most Qualcomm platforms is modelled in the
Linux kernel as 3 different independent device drivers, but as shown by
the already existing layering violations in the Qualcomm glue driver
they can not be operated independently.

With the current implementation, the glue driver registers the core and
has no way to know when this is done. As a result, e.g. the suspend
callbacks needs to guard against NULL pointer dereferences when trying
to peek into the struct dwc3 found in the drvdata of the child.

Missing from the upstream Qualcomm USB support is handling of role
switching, in which the glue needs to be notified upon DRD mode changes.
Several attempts has been made through the years to register callbacks
etc, but they always fall short when it comes to handling of the core's
probe deferral on resources etc.

Furhtermore, the DeviceTree binding is a direct representation of the
Linux driver model, and doesn't necessarily describe "the USB IP-block".

This series therefor attempts to flatten the driver split, and operate
the glue and core out of the same platform_device instance. And in order
to do this, the DeviceTree representation of the IP block is flattened.

---
Changes in v2:
- Rewrite after ACPI removal, multiport support and interrupt fixes
- Completely changed strategy for DeviceTree binding, as previous idea
  of using snps,dwc3 as a generic fallback required unreasonable changes
  to that binding.
- Abandoned idea of supporting both flattened and unflattened device
  model in the one driver. As Johan pointed out, it will leave the race
  condition holes and will make the code harder to understand.
  Furthermore, the role switching logic that we intend to introduce
  following this would have depended on the user updating their
  DeviceTree blobs.
- Per above, introduced the dynamic DeviceTree rewrite
- Link to v1: https://lore.kernel.org/all/20231016-dwc3-refactor-v1-0-ab4a84165470@quicinc.com/

---
Bjorn Andersson (7):
      dt-bindings: usb: snps,dwc3: Split core description
      dt-bindings: usb: Introduce qcom,snps-dwc3
      of: dynamic: Don't discard children upon node attach
      usb: dwc3: core: Expose core driver as library
      usb: dwc3: qcom: Don't reply on drvdata during probe
      usb: dwc3: qcom: Transition to flattened model
      arm64: dts: qcom: sc8280x: Flatten the USB nodes

 .../devicetree/bindings/usb/qcom,dwc3.yaml         |  13 +-
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 608 +++++++++++++++++++++
 .../devicetree/bindings/usb/snps,dwc3-common.yaml  | 417 ++++++++++++++
 .../devicetree/bindings/usb/snps,dwc3.yaml         | 391 +------------
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts           |  12 +-
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |   5 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  12 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  11 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 138 +++--
 drivers/of/dynamic.c                               |   1 -
 drivers/usb/dwc3/core.c                            | 169 ++++--
 drivers/usb/dwc3/core.h                            |   3 +
 drivers/usb/dwc3/dwc3-qcom.c                       | 323 ++++++++---
 13 files changed, 1483 insertions(+), 620 deletions(-)
---
base-commit: 864b1099d16fc7e332c3ad7823058c65f890486c
change-id: 20231016-dwc3-refactor-931e3b08a8b9

Best regards,
-- 
Bjorn Andersson <quic_bjorande@quicinc.com>


