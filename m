Return-Path: <linux-arm-msm+bounces-101173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODfcCe1BzGm+RgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 23:51:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A9C372332
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 23:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A331301494F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4E9451076;
	Tue, 31 Mar 2026 21:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cN61ost4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC753B47F0
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 21:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774993670; cv=none; b=UVVgoyrfUH4Jgw+bMTHBHdzhXyxfF34b6TzeV2lq78LbRol7TxUvLsCLPpnWV0hmR+XaA3OlkjKg9RCO2VFd5Zd6OCt7jxF8awl+LplL192GW9kNLEtLfF0h3k6khRzbYxaa5NJi/yszlkTi64OzfK9N+ZhiPU7oTi77hQUI3i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774993670; c=relaxed/simple;
	bh=iIuOOa8rW5wOieE9MmvxQaXBkwiQTbC9srYJ3whd+Ug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IykRBS8yJgadD/JZoZAMKVhhwyk94eBFCPOPXbReqmnTwQMEYUrUxeYI5SvItpwYlBMZ9w/gkzo1ZHi1c/LI4ItYO8IOq0pIoXtFHVzzqtoQw60Z0q6wI04TH476T+5gSWtejgRf9YH/ugMZhKGRu+KMSVA5FkghDxqjNPegwwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cN61ost4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0799BC19423;
	Tue, 31 Mar 2026 21:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774993669;
	bh=iIuOOa8rW5wOieE9MmvxQaXBkwiQTbC9srYJ3whd+Ug=;
	h=From:To:Cc:Subject:Date:From;
	b=cN61ost4Z56nOhE6zwTn/RY9SSyxE2L5qtpjqfMvOTr0n0nF74Tmd3ATUOP1xrvmL
	 dzfXbpR1n7aSusTfQVmhf9HX6+wJMlkGiLitKRhwLRYHexRnKgkUSLDczDItaDs2HM
	 HPk632IOz1Tgzs3CSIe8s9ifLdNl6ITZNV75RqkrBALTi+TnspSNjCYCQe5y8bKfCE
	 OqbfcnDHVIbnFunY0rn9QhL9M4Q32tSX15bwn2K18euc5jAp3JJCcR4x09tjtlBiBD
	 qdm82ARe6lgzu3VX+SrJL5CFx5cbWFz83/IHlbx7zCUHDUGJzw2Gbh49Y1L/kjUCM9
	 ZITNnqZFyBU4A==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Aelin Reidel <aelin@mainlining.org>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Chris Lew <chris.lew@oss.qualcomm.com>,
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
	Lei wang <quic_leiwan@quicinc.com>,
	Richard Acayan <mailingradian@gmail.com>,
	Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
	Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Le Qi <le.qi@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Rosen Penev <rosenp@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Val Packett <val@packett.cool>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Yijie Yang <yijie.yang@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm driver updates for v7.1
Date: Tue, 31 Mar 2026 16:47:41 -0500
Message-ID: <20260331214741.966509-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arndb.de,oss.qualcomm.com,mainlining.org,oracle.com,quicinc.com,gmail.com,oldschoolsolutions.biz,fairphone.com,packett.cool,linaro.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-101173-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 78A9C372332
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-7.1

for you to fetch changes up to d6e766e391ef0b2be62682e007223fc72ba7764f:

  Merge branch '20260125-iris-ubwc-v4-1-1ff30644ac81@oss.qualcomm.com' into drivers-for-7.1 (2026-03-30 12:46:14 -0500)

----------------------------------------------------------------
Qualcomm driver updates for v7.1

Add ECS LIVA QC710, Glymur CRD, Mahua CRD, Purwa IoT EVK, and Asus
Vivobook to the QSEECOM allow-list, to enable UEFI variable access
through uefisecapp.

Register the Gunyah watchdog device if the SCM driver finds itself
running under Gunyah. Clean up some locking using guards.

Handle possible cases where AOSS cooling state is given a non-boolean
state.

Replace LLCC per-slice activation bitmap with reference counting. Also
add SDM670 support.

Improve probe deferral handling in the OCMEM driver.

Add Milos, QCS615, Eliza, Glymur, and Mahua support to the pd-mapper.

Add support for SoCCP-based pmic-glink, as found in Glymur and
Kaanapali.

Add common QMI service ids to the main qmi headerfile, to avoid
spreading these constants in various drivers.

Add support for version 2 of SMP2P and implement the irqchip state
reading support.

Add CQ7790, SA8650P, SM7450, SM7450P, and IPQ5210 SoC and the PM7550BA
PMIC identifiers to the socinfo driver.

Add Eliza and Mahua support to the UBWC driver, introduce helpers for
drivers to read out min_acc length and other programmable values, and
disable bank swizzling for Glymur.

Simplify the logic related to allocation of NV download request in the
WCNSS control driver.

----------------------------------------------------------------
Abel Vesa (3):
      soc: qcom: socinfo: Add PM7550BA PMIC
      dt-bindings: firmware: qcom,scm: document Eliza SCM Firmware Interface
      soc: qcom: pd-mapper: Add support for Eliza

Aelin Reidel (2):
      dt-bindings: arm: qcom,ids: Add SoC IDs for SM7450 and SM7450P
      soc: qcom: socinfo: Add SoC IDs for SM7450 and SM7450P

Alok Tiwari (2):
      soc: qcom: llcc: fix v1 SB syndrome register offset
      soc: qcom: aoss: compare against normalized cooling state

Anjelique Melendez (3):
      dt-bindings: soc: qcom: qcom,pmic-glink: Add Glymur and Kaanapali compatibles
      soc: qcom: pmic_glink: Add charger PDR service information to client data
      soc: qcom: pmic_glink: Add support for Glymur and Kaanapali

Bjorn Andersson (2):
      Merge branch '20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com' into drivers-for-7.1
      Merge branch '20260125-iris-ubwc-v4-1-1ff30644ac81@oss.qualcomm.com' into drivers-for-7.1

Chris Lew (2):
      soc: qcom: smp2p: Add irqchip state support
      soc: qcom: smp2p: Add support for smp2p v2

Daniel Lezcano (3):
      soc: qcom: qmi: Enumerate the service IDs of QMI
      soc: qcom: pdr: Use the unified QMI service ID instead of defining it locally
      samples: qmi: Use the unified QMI service ID instead of defining it locally

Dmitry Baryshkov (6):
      soc: qcom: ubwc: disable bank swizzling for Glymur platform
      soc: qcom: ocmem: make the core clock optional
      soc: qcom: ocmem: register reasons for probe deferrals
      soc: qcom: ocmem: return -EPROBE_DEFER is ocmem is not available
      soc: qcom: ubwc: add helper to get min_acc length
      soc: qcom: ubwc: add helpers to get programmable values

Gopikrishna Garmidi (2):
      soc: qcom: ubwc: Add support for Mahua
      firmware: qcom: scm: Allow QSEECOM on Mahua CRD

Hrishabh Rajput (1):
      firmware: qcom: scm: Register gunyah watchdog device

Jens Glathe (1):
      firmware: qcom: scm: allow QSEECOM on ASUS Vivobook X1P42100 variant

Kathiravan Thirumoorthy (4):
      dt-bindings: arm: qcom,ids: add SOC IDs for IPQ5210 family
      soc: qcom: socinfo: add SoC ID for IPQ5210 family
      dt-bindings: firmware: qcom,scm: Document ipq5210 SCM
      dt-bindings: firmware: qcom,scm: Document ipq9650 SCM

Krzysztof Kozlowski (7):
      dt-bindings: arm: qcom,ids: Add SoC ID for CQ7790
      soc: qcom: socinfo: Add SoC ID for CQ7790
      firmware: qcom: uefisecapp: Simplify mutex with guard
      firmware: qcom: uefisecapp: Annotate acquiring locks for context tracking
      firmware: qcom: scom: Simplify mutex with guard
      soc: qcom: ubwc: Remove redundant x1e80100_data
      soc: qcom: ubwc: Add configuration Eliza SoC

Le Qi (1):
      soc: qcom: pd-mapper: Add QCS615 power domain mappings

Lei wang (2):
      dt-bindings: arm: qcom,ids: Add SoC ID for SA8650P
      soc: qcom: socinfo: Add SoC ID for SA8650P

Luca Weiss (1):
      soc: qcom: pd-mapper: Add Milos compatible

Mukesh Ojha (1):
      firmware: qcom_scm: don't opencode kmemdup

Pankaj Patil (1):
      firmware: qcom: scm: Allow QSEECOM on Glymur CRD

Richard Acayan (2):
      dt-bindings: cache: qcom,llcc: Add SDM670 compatible
      soc: qcom: llcc: Add configuration data for SDM670

Rosen Penev (1):
      soc: qcom: wcnss: simplify allocation of req

Srinivas Kandagatla (1):
      soc: qcom: pd-mapper: Add support for Glymur and Mahua

Unnathi Chalicheemala (2):
      soc: qcom: llcc: Add per-slice counter and common llcc slice descriptor
      soc: qcom: llcc: Use guards for mutex handling

Val Packett (1):
      firmware: qcom: scm: Allow QSEECOM on ECS LIVA QC710

Vladimir Zapolskiy (1):
      soc: qcom: pd-mapper: Simplify code using of_root to get root device tree node

Yijie Yang (1):
      firmware: qcom: scm: Allow QSEECOM on PURWA-IOT-EVK

 .../devicetree/bindings/cache/qcom,llcc.yaml       |   2 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |   4 +
 .../bindings/soc/qcom/qcom,pmic-glink.yaml         |   2 +
 drivers/firmware/qcom/qcom_qseecom_uefisecapp.c    |   9 +-
 drivers/firmware/qcom/qcom_scm.c                   |  70 +++++++-
 drivers/soc/qcom/llcc-qcom.c                       | 188 +++++++++++++++------
 drivers/soc/qcom/ocmem.c                           |  17 +-
 drivers/soc/qcom/pdr_interface.c                   |   4 +-
 drivers/soc/qcom/pdr_internal.h                    |   3 -
 drivers/soc/qcom/pmic_glink.c                      |  66 +++++---
 drivers/soc/qcom/qcom_aoss.c                       |   2 +-
 drivers/soc/qcom/qcom_pd_mapper.c                  |  33 +++-
 drivers/soc/qcom/smp2p.c                           | 103 ++++++++++-
 drivers/soc/qcom/socinfo.c                         |  11 ++
 drivers/soc/qcom/ubwc_config.c                     |  31 ++--
 drivers/soc/qcom/wcnss_ctrl.c                      |  17 +-
 include/dt-bindings/arm/qcom,ids.h                 |  10 ++
 include/linux/soc/qcom/llcc-qcom.h                 |   8 +-
 include/linux/soc/qcom/qmi.h                       |  12 ++
 include/linux/soc/qcom/ubwc.h                      |  25 +++
 samples/qmi/qmi_sample_client.c                    |   2 +-
 21 files changed, 480 insertions(+), 139 deletions(-)

