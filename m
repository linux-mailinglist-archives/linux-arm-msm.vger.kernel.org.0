Return-Path: <linux-arm-msm+bounces-85188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B11BECBCA19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 07:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3246B30093AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 06:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08863093A8;
	Mon, 15 Dec 2025 06:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXnZqHyb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A371E7C23;
	Mon, 15 Dec 2025 06:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765780528; cv=none; b=VoaztAeeZxPF0L1sLmpMBGl5dT8kxzsdClm929Nl3TfH9NZnzilWxONRI9G5hbBkm1TMYFFoxhCCu3QCZuzIKHgI5dF22yfQMHT+VQLQ3Ogs5CbhIX+uBS4SFZJwmD00IS0hpcw6oRR5+jMIkAFZkMEY3VtOflmaPcp+FMWxvnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765780528; c=relaxed/simple;
	bh=I/DrIItUY1f60SVPSokuPociVzfS9l2xltxUN7iXhuk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WbfcQp8EZPuoB0kxZ8nyRXO1gqIWXye8t9q+YX/0+cH+GZwE+0FD5I81f5MFUgCfKMZcH7YslT5PA2RIDKjk2g+rV7RxggUJU5gClHRgGhgtvLRjDJkjcIxTKx9GDBZ9TVXI9Fl4AenBhSI/8ugBc3T9rVIEC2ICldLpKuQekMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXnZqHyb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40352C4CEF5;
	Mon, 15 Dec 2025 06:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765780528;
	bh=I/DrIItUY1f60SVPSokuPociVzfS9l2xltxUN7iXhuk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=UXnZqHybUZtyKbn1M+/0VPSoxshTDawe4dK0pRnvfVamcv/pZ9lwL1cL3AbInW9ML
	 5u8P42kYsoCrykVKdwMEcs2eD7p4Y6sVRD1Q9kGsmezqYw0DLePJTYSrcdnMrAJU3Y
	 fudF9UEmgCPQgFcVSK/UJXE02vQ+vlBimy7/amGCdBSXLZkKhgbc1UbOm8+V/fGAa7
	 86xu6rU9w7mKT8OAO9+WMpiew7oAYp9/qcr91XM5Mhkab2zJksrz9eVn2IHo/3ulZ8
	 usUMy8A6EheblDSUgnoxIPUX3q6QatmrQRdqS+G9yevDXtDKg9qWIkpI/ecqFRDDWt
	 5GmZsFsXYdTSA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA57D5B16C;
	Mon, 15 Dec 2025 06:35:28 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Subject: [PATCH v7 0/8] Add new driver for WCSS secure PIL loading
Date: Mon, 15 Dec 2025 10:35:05 +0400
Message-Id: <20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABmsP2kC/1WOS47CMBAFr4K8nrbannxZcQ/EwiRt0iKhg51kQ
 Ch3x2SkkWbzpFq8Ur1UpMAU1X73UoEWjiy3BOXXTjWdu10IuE2sLNrcoDXA4z1HU8EPewZLVJM
 71761pUqXMZDnx6Y7nhL7IANMXSD3J8HMlFgYm+U6q8sKv8HARa5zr2Pg4AY9HiRGfZ9d38gw6
 DQfc8dxkvDcOpfi4/9Nslj9T1oKQGixIetd41zuDzJPvch1M53WdX0DSvjYEvQAAAA=
X-Change-ID: 20251021-ipq5018-wifi-2ee9eab9fd27
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>, 
 Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>, 
 Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>, 
 George Moussalem <george.moussalem@outlook.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765780526; l=6284;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=I/DrIItUY1f60SVPSokuPociVzfS9l2xltxUN7iXhuk=;
 b=RqcqILi2JtX51rTrIYw+jV+4tTe2+usurf//LibTAYs0V0DY7lh1+34X+yKs0zz1Gy6+1MvXP
 11eztdkFAc3AeG64wPY1soA9gklAbgLo/VOy/bF2DufYIpP5mUJnDDu
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

Imported from f20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com
I've resumed Gokul's work as the last submission dates back April 2025.

This series depends on Sricharan's tmel-qmp mailbox driver series v4 [1].

- Secure PIL is signed, split firmware images which only TrustZone (TZ)
  can authenticate and load. Linux kernel will send a request to TZ to
  authenticate and load the PIL images.

- When secure PIL support was added to the existing wcss PIL driver
  earlier in [2], Bjorn suggested not to overload the existing WCSS
  rproc driver, instead post a new driver for PAS based IPQ WCSS driver.
  This series adds a new secure PIL driver for the same.

- Also adds changes to scm to pass metadata size as required for IPQ5332,
  reposted from [3].

[1]
https://patchwork.kernel.org/project/linux-arm-msm/cover/20250327181750.3733881-1-quic_srichara@quicinc.com/

[2]
https://patchwork.kernel.org/project/linux-arm-msm/patch/1611984013-10201-3-git-send-email-gokulsri@codeaurora.org/

[3]
https://patchwork.kernel.org/project/linux-arm-msm/patch/20240820055618.267554-6-quic_gokulsri@quicinc.com/

Changes in v7:
	- correctly sorted QCOM_SCM_PIL_PAS_INIT_IMAGE_V2 by command ID
	- correctly sorted smp2p-wcss nodes in dtsi files
	- Link to v6: https://lore.kernel.org/r/20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com

Changes in v6:
	- added patch to fix IPC register offset for ipq5424
	- changed phandle description for mboxes property in dt-bindings
	- updated bindings to define the right clocks per SoC based on
	  compatible. Ran make dt_binding_check for validation of all
	  SoCs
	- use of more descriptive match data property (use_tmelcom) and
	  added a condition in wcss_start to not error out if tmelcom
	  isn't used
	- mitigated potential off-by-one
	- adopted use of of_reserved_mem_region_to_resource to acquire
	  memory-region resource
	- added driver support for ipq5018 SoC
	- corrected size of reg properties as per Konrad's comments
	- added patch to bring up Q6 in ipq5018 dtsi
	- Link to v5: https://lore.kernel.org/r/20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com

Changes in v5:
	- retained all the patches as in v3 and addressed comments in
	  v3.
	- reverted changes to dt-bindings done in v4 and retained as in
	  v3 and fixed firmware format from .mdt to .mbn and retained
	  reviewed-by.
	- dropped 2 patches in v4 that adds support for q6 dtb loading.
	  Will post them as a new series.

	Following tests were done:
	- checkpatch
	- dt_binding_check and dtbs_check
	- Link to v4: https://lore.kernel.org/r/20250327181750.3733881-1-quic_srichara@quicinc.com

Changes in v4:
        - changed q6 firmware image format from .mdt to .mbn
        - corrected arrangement of variable assignemnts as per comments
          in qcom_scm.c
        - added scm call to get board machid
        - added support for q6 dtb loading with support for additional
          reserved memory for q6 dtb in .mbn format
        - updated dt-bindings to include new dts entry qcom,q6-dtb-info
          and additional item in memory-region for q6 dtb region.
        - removed unnecessary dependency for QCOM_Q6V5_WCSS_SEC in
          Kconfig
        - removed unwanted header files in qcom_q6v5_wcss_sec.c
        - removed repeated dtb parsing during runtime in qcom_q6v5_wcss_sec.c
        - added required check for using tmelcom, if available. Enabled
          fallback to scm based authentication, if tmelcom is unavailable.
        - added necessary padding for 8digt hex address in dts
	- Link to v3: https://lore.kernel.org/r/20250107101320.2078139-1-quic_gokulsri@quicinc.com

	Following tests were done:
	- checkpatch
	- kernel-doc
	- dt_binding_check and dtbs_check

Changes in v3:
        - fixed copyright years and markings based on Jeff's comments.
        - replaced devm_ioremap_wc() with ioremap_wc() in
          wcss_sec_copy_segment().
        - replaced rproc_alloc() and rproc_add() with their devres
          counterparts.
        - added mailbox call to tmelcom for secure image authentication
          as required for IPQ5424. Added ipq5424 APCS comatible required.
        - added changes to scm call to pass metadata size as required for
          IPQ5332.
	- Link to v2: https://lore.kernel.org/r/20240829134021.1452711-1-quic_gokulsri@quicinc.com

Changes in v2:
        - Removed dependency of this series to q6 clock removal series
          as recommended by Krzysztof
	- Link to v1: https://lore.kernel.org/r/20240820085517.435566-1-quic_gokulsri@quicinc.com
--
2.34.1

---
George Moussalem (2):
      mailbox: qcom: fix IPC register offset for IPQ5424
      arm64: dts: qcom: ipq5018: add nodes to bring up q6

Gokul Sriram Palanisamy (1):
      arm64: dts: qcom: ipq5424: add nodes to bring up q6

Manikanta Mylavarapu (4):
      firmware: qcom_scm: ipq5332: add support to pass metadata size
      dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
      arm64: dts: qcom: ipq5332: add nodes to bring up q6
      arm64: dts: qcom: ipq9574: add nodes to bring up q6

Vignesh Viswanathan (1):
      remoteproc: qcom: add hexagon based WCSS secure PIL driver

 .../bindings/remoteproc/qcom,wcss-sec-pil.yaml     | 176 +++++++++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |  64 ++++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              |  64 +++-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              |  68 ++++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |  60 +++-
 drivers/firmware/qcom/qcom_scm.c                   |  17 +-
 drivers/firmware/qcom/qcom_scm.h                   |   1 +
 drivers/mailbox/qcom-apcs-ipc-mailbox.c            |   2 +-
 drivers/remoteproc/Kconfig                         |  19 +
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/qcom_q6v5_wcss_sec.c            | 397 +++++++++++++++++++++
 include/linux/remoteproc.h                         |   2 +
 12 files changed, 864 insertions(+), 7 deletions(-)
---
base-commit: 4482611a10931e3cf305e0d23194bbb0ff8829db
change-id: 20251021-ipq5018-wifi-2ee9eab9fd27

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>



