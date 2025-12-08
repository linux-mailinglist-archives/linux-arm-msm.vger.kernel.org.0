Return-Path: <linux-arm-msm+bounces-84657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 28300CAD1D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 13:26:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4A13301CD3B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 12:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C6F2F9D85;
	Mon,  8 Dec 2025 12:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="djbVJc8r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34552DEA86;
	Mon,  8 Dec 2025 12:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765196775; cv=none; b=NqvLSi2VISuiV+QU8btatUpzUu3P+zA1u38pMphTzZT+zkjiW4n5cbpvHavSEzR39Qzb3KYZNhsbLGNm+wfV5oGXVV2hLXKtdUfWnPyNKxLaC4XLv9aQahLJiszRoTjx4EffPbfDEAAEuA1ZGYphbb2064AME95RPN3AS+4M38c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765196775; c=relaxed/simple;
	bh=9wKYefdnIBM7zpnERUFdSpv1Qo6rUFMb0+UKFQY7Pz0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DlwaiRoxErj1+uyKTSBocE1EHbLmkfcyMXf225xfqPdzoQP/k+SbG2MHSsrc/Yawmh8rVe5AF4HL5ZjPc9MyTnDNM5If1s/jh7EGFQ7x1tX61WER+Z0cqKcINax+UUmZwGIWNBrOfEEz1pzIDIiiM4k5eEcMW/+vpJyTg2E9H9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=djbVJc8r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52CB9C4CEF1;
	Mon,  8 Dec 2025 12:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765196775;
	bh=9wKYefdnIBM7zpnERUFdSpv1Qo6rUFMb0+UKFQY7Pz0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=djbVJc8r7X1agZWLQDDtDnxTFP8fZItRUsl5cJ+5QzRxleOf/ON45fCbOpmoqGkzl
	 b+EgF8FtZyLacUooUdqcehyebU93eT0jvRcdgxM5HbLzPpYyMt6BwoEKtFR1hAhqz3
	 GLV6W/XNEj4YzHc++Hlylz084RT1/P7HouXIe5uqy9MDfBEy53IrZuI3bAIn2rJlIJ
	 zRgwnr/a4Xzgf3IkrPn7YBDdG8mbOTw+SnOo4Fjq1eyzce8la19P3aB6nE3DoREVAb
	 wVoUwbqG5m+uWurPajppw5xXi4iFDTn4FP10LcvoP34gNw410pkblbLGsVbMGHJnE+
	 pXkNbR6CKqolw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BDE2D3B7E1;
	Mon,  8 Dec 2025 12:26:15 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Subject: [PATCH v6 0/8] Add new driver for WCSS secure PIL loading
Date: Mon, 08 Dec 2025 16:25:32 +0400
Message-Id: <20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL3DNmkC/z3Myw6CMBCF4Vchs7ZNW7mvfA/josIUJlIKU1ETw
 rvbuHBzkm9x/h0iMmGENtuB8UWRwpxQnjLoRjsPKKhPBqNMoZXRgpa1ULoWb3IkDGKD9t643lS
 QLgujo88vd70lOw5ePEdG+4+oXFeq1CYvZN5UtToLLYbw2CYZmdh6uVxCjHLd7NQF72UaOI4v3
 OSxt6gAAAA=
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
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765196772; l=5585;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=9wKYefdnIBM7zpnERUFdSpv1Qo6rUFMb0+UKFQY7Pz0=;
 b=3nN5xIbdZU2oWB9kE38RZ/F0kifHPXDGLwpJ/7Z3lljXb71F76ZJN42DRe4fT5WGvnbzVCHJ8
 7ZzxYSdoF0wD2Ign2B7g+P4lyqOKEHJSsHaECvFPgY277EfgE0HL1KG
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

changes in v6:
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

changes in v5:
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

changes in v4:
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

	Following tests were done:
	- checkpatch
	- kernel-doc
	- dt_binding_check and dtbs_check

changes in v3:
        - fixed copyright years and markings based on Jeff's comments.
        - replaced devm_ioremap_wc() with ioremap_wc() in
          wcss_sec_copy_segment().
        - replaced rproc_alloc() and rproc_add() with their devres
          counterparts.
        - added mailbox call to tmelcom for secure image authentication
          as required for IPQ5424. Added ipq5424 APCS comatible required.
        - added changes to scm call to pass metadata size as required for
          IPQ5332.

changes in v2:
        - Removed dependency of this series to q6 clock removal series
          as recommended by Krzysztof
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



