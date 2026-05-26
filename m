Return-Path: <linux-arm-msm+bounces-109883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAkWCC2/FWrYZgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:41:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B227B5D8EDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5E56F30EBB66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070543148A8;
	Tue, 26 May 2026 15:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DLhTsRoc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB551358399
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 15:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779809165; cv=none; b=Tyum0arzDjyX1Q7BRwQ7LB7LnquOKv2K/ohCnOQmwTUvCo+M54xZH8gjJNKUwZzn2nWxkxgyB+wlrcKadpduMEUzIa7eKFhadho2SGO+uW1pZhvpo4kH5igLt7ArTa373P/b5f+HyPkE1VB4F9pG3SQBemzuiUEDHjuJEXVcv5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779809165; c=relaxed/simple;
	bh=ep6Fb8P4mvHUe5BtT3gJbMwyR8heCZQ2G/xsx7B1g3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ia52dqNdI/q5wl09K052c41sb0JZ2HAfK4MYNZTVc7X0OJNo263RGe0PHOu8MPwhw+L+Z9iMiEf+l2MXz1/H+a/uskpb0ULBSnfrWs/E/ZHa6c2viMFAoz3z5xQAUtpy7bZRGzsOZSuFvWOlXJTTMoX56FnGoWOE3LQYkyRpPtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DLhTsRoc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6417C1F000E9;
	Tue, 26 May 2026 15:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779809164;
	bh=uxU73nF8gsoP+9GE3Bs4snys6NdnKXB0MX+R9iiSiT0=;
	h=From:To:Cc:Subject:Date;
	b=DLhTsRocxrCum8Nohtv0dzZzjlCL5fL5viYcrhzXekCng/Sif+JtLN+m2qi1Zqwd2
	 H7WaswjdMFgGdEI1hR4+sS23STWN+o0xpdqv/tj17d1Sfxgx1YXHfDShiPXu2dt0M7
	 NHTX6mbB4cwGCxTOVHaJR+FsV3ZOGYbJmL9q9hESquqSgcKifArqq6fE3eov99cY5A
	 8PpnMqAcbPTJnXtJUx3hVfBi13pzXPYqkAcE0l+o2zbVSjrY51RtjtKa3g94U9cRMe
	 aJI11g+kFUJKkqMydcECCTiHQImybTFeyZxLyTT84NZcB3Zq11tkTayKdzV6LI5Yw/
	 ACMh6Wo4Jo1yw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Praveen Talari <praveen.talari@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Alexander Koskovich <akoskovich@pm.me>,
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Dan Carpenter <error27@gmail.com>,
	Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
	Harrison Vanderbyl <harrison.vanderbyl@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Raj Aryan <raryan@qti.qualcomm.com>,
	Rosen Penev <rosenp@gmail.com>,
	Tony Truong <tony.truong@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm driver updates for v7.2
Date: Tue, 26 May 2026 10:26:00 -0500
Message-ID: <20260526152600.5555-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arndb.de,oss.qualcomm.com,pm.me,gmail.com,qti.qualcomm.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-109883-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: B227B5D8EDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-7.2

for you to fetch changes up to 23cee0d07a412f1fadb236358e0d834fabf0efcc:

  Merge branch '20260227061544.1785978-1-praveen.talari@oss.qualcomm.com' into drivers-for-7.2 (2026-05-21 22:00:31 -0500)

----------------------------------------------------------------
Qualcomm driver updates for v7.2

Enable QSEECOM and with that access to UEFI variables on the Surface Pro
12in laptop.

Refactor the Geni Serial-Engine helper code to allow the serial engine
drivers (such as I2C) to operate on targets where power and performance
is controlled through an SCMI server instead of individual resources in
Linux.

Extend the LLCC driver to support reading its data from a System Cache
Table (SCT) in memory instead of being hard coded per platform in the
driver. Also add support for the Eliza platform.

Add support for the Hawi platform to pd-mapper.

Switch the SMEM driver to track partitions using xarray to handle the
ever growing number of hosts better.

Extend the socinfo driver with knowledge about the Nord, SM7750,
IPQ9650, and Shikra SoCs, as well as PMAU0102, PMC1020H, PMIV0102, and
PMIV0104 PMICs.

Define UBWC 3.1 and add a couple of convenient helpers in the UBWC
library for MDSS and Adreno.

Fix a memory leak in the WCNSS firmware download mechanism.

----------------------------------------------------------------
Abel Vesa (4):
      dt-bindings: soc: qcom: qcom,pmic-glink: Document Eliza compatible
      dt-bindings: soc: qcom,aoss-qmp: Document the Eliza Always-On Subsystem side channel
      dt-bindings: cache: qcom,llcc: Document Eliza LLCC block
      soc: qcom: llcc-qcom: Add support for Eliza

Alexander Koskovich (3):
      soc: qcom: socinfo: Add PMIV0102 & PMIV0104 PMICs
      dt-bindings: arm: qcom,ids: Add SoC ID for SM7750
      soc: qcom: socinfo: Add SoC ID for SM7750

Bjorn Andersson (2):
      Merge branch '20260507-ubwc-rework-v4-4-c19593d20c1d@oss.qualcomm.com' into drivers-for-7.2
      Merge branch '20260227061544.1785978-1-praveen.talari@oss.qualcomm.com' into drivers-for-7.2

Dan Carpenter (1):
      soc: qcom: llcc-qcom: Fix NULL vs IS_ERR() bug in qcom_llcc_get_fw_config()

Deepti Jaggi (3):
      dt-bindings: qcom: geni-se-qup: Add compatible for SA8797P SoC
      dt-bindings: arm: qcom,ids: Add SoC ID for Nord SA8797P
      soc: qcom: socinfo: Add SoC ID for Nord SA8797P

Dmitry Baryshkov (3):
      soc: qcom: ubwc: define UBWC 3.1
      soc: qcom: ubwc: define helper for MDSS and Adreno drivers
      soc: qcom: ubwc: add helper controlling AMSBC enablement

Fenglin Wu (1):
      dt-bindings: soc: qcom: qcom,pmic-glink: Add Hawi compatible string

Francisco Munoz Ruiz (3):
      dt-bindings: cache: qcom,llcc: Document Hawi SoC
      soc: qcom: llcc-qcom: get SCT descriptors from fw-populated memory
      soc: qcom: llcc-qcom: Capitalize LLCC/EDAC in comments and diagnostics

Harrison Vanderbyl (1):
      firmware: qcom: scm: Allow QSEECOM on Surface Pro 12in

Kathiravan Thirumoorthy (2):
      dt-bindings: arm: qcom,ids: add SOC IDs for IPQ9650 family
      soc: qcom: socinfo: add SoC ID for IPQ9650 family

Komal Bajaj (3):
      dt-bindings: cache: qcom,llcc: Document Shikra LLCC
      dt-bindings: arm: qcom,ids: Add SoC ID for Shikra IoT variants
      soc: qcom: socinfo: Add SoC ID for Shikra IoT variants

Konrad Dybcio (1):
      soc: qcom: socinfo: Add PMICs that ship with Glymur

Mukesh Ojha (3):
      dt-bindings: firmware: qcom,scm: Document SCM on Hawi SoC
      dt-bindings: soc: qcom,aoss-qmp: Document the Hawi AOSS side channel
      soc: qcom: pd-mapper: Add support for Hawi SoC

Praveen Talari (7):
      soc: qcom: geni-se: Refactor geni_icc_get() and make qup-memory ICC path optional
      soc: qcom: geni-se: Add geni_icc_set_bw_ab() function
      soc: qcom: geni-se: Introduce helper API for resource initialization
      soc: qcom: geni-se: Handle core clk in geni_se_clks_off() and geni_se_clks_on()
      soc: qcom: geni-se: Add resources activation/deactivation helpers
      soc: qcom: geni-se: Introduce helper API for attaching power domains
      soc: qcom: geni-se: Introduce helper APIs for performance control

Raj Aryan (1):
      soc: qcom: spmi-pmic: add SUBTYPEs for Glymur/Kaanapali/SM8750 PMICs

Rosen Penev (1):
      soc: qcom: wcnss: fix leak of fw

Shawn Guo (2):
      dt-bindings: firmware: qcom,scm: Document SCM for Nord SoC
      soc: qcom: socinfo: Add PMIC PMAU0102

Tony Truong (1):
      soc: qcom: smem: Switch partitions to xarray

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  43 ++
 .../devicetree/bindings/firmware/qcom,scm.yaml     |   3 +
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |   2 +
 .../bindings/soc/qcom/qcom,pmic-glink.yaml         |   6 +
 .../soc/qcom/qcom,sa8255p-geni-se-qup.yaml         |  31 +-
 drivers/firmware/qcom/qcom_scm.c                   |   1 +
 drivers/soc/qcom/llcc-qcom.c                       | 481 ++++++++++++++++++---
 drivers/soc/qcom/qcom-geni-se.c                    | 270 +++++++++++-
 drivers/soc/qcom/qcom_pd_mapper.c                  |   8 +
 drivers/soc/qcom/smem.c                            |  56 +--
 drivers/soc/qcom/socinfo.c                         |  23 +
 drivers/soc/qcom/wcnss_ctrl.c                      |  11 +-
 include/dt-bindings/arm/qcom,ids.h                 |  11 +
 include/linux/soc/qcom/geni-se.h                   |  19 +
 include/linux/soc/qcom/llcc-qcom.h                 |  44 +-
 include/linux/soc/qcom/ubwc.h                      |  22 +
 include/soc/qcom/qcom-spmi-pmic.h                  |  15 +-
 17 files changed, 920 insertions(+), 126 deletions(-)

