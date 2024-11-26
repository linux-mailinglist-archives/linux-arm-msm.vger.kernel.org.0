Return-Path: <linux-arm-msm+bounces-39176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 566D79D93F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 10:15:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B639FB2880E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 09:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49DD18E057;
	Tue, 26 Nov 2024 09:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="0PAAs2vr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E330B16C850;
	Tue, 26 Nov 2024 09:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732612538; cv=none; b=qimWnjQ6ikIxELYMkLW7r2khiPwPvC1assAdedhUrxjEoowM9Es6M/1acFYOWq7VFHlA+QQSaVBj6M3eiUf1S30vHvWASOu/SafVE+XrvPnc5UEeEjx0wDI53HBwOiJjJO8FyyFLVMS+zCxRaYLfC62miTuTqSX4On/Co26/VVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732612538; c=relaxed/simple;
	bh=M0i9vGMKXiywkr+Q6rnTA0C7A9ME6bV2H2sThaTMAhw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dq5xy/R1fBYKUSPXT2JZbMDZ7iVe7n49pplMDCgMF0Iackdb1+gsn7CVfmEytRj3G2jeewUDtv0vsZ30qGO6L59OpY7MBW0ETPMijn2UhTWak/3fCeZFWs7r6IYarSfkBj1mgqbAGX2MZCjcsAb0L5of4pABVTfAlS0lyQkD37s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=0PAAs2vr; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ96KIe013233;
	Tue, 26 Nov 2024 10:15:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=vSTujhm+41nFZVVxdT162i
	RX0EXX7Jnr8vBVXGlgN9o=; b=0PAAs2vrk1CIEumwjtIG7XmJDGmDRPvsFpyBfh
	cwVH0l4gpwUrlWi8cZ8QUJGGy1fX9Ma2bn1cGtHYTFtd3ujPjn2HJCuYznNYiXVa
	ZT7Sgi8OwP9kT6Rvox3/11HTDKivabIBkvE9yRmWQnKzsf5KRG9mhsgRXIik7WPk
	i6ujuLYcsLRXW18S+eUtLWJxQADjPbFgJqLUMeX/Z2D85Hr76LGC5Gh02s7sTyeK
	xsoZ2XH4farv1WmobIIjzPCvmUO3s2IO7oWvxWF0Z9doMpFM8AKExNJfOkJDIGE1
	/UanvByBGvZemldS7BaMffe2dN99d/G4XP5jjd4O3Hf/9HYg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43352942gg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 10:15:15 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 746A540047;
	Tue, 26 Nov 2024 10:13:21 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CB0D326B647;
	Tue, 26 Nov 2024 10:11:06 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 26 Nov
 2024 10:11:06 +0100
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 26 Nov
 2024 10:11:06 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer
	<s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        "Jerome
 Brunet" <jbrunet@baylibre.com>,
        Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>,
        Matthias Brugger
	<matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-amlogic@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v14 0/8] Introduction of a remoteproc tee to load signed firmware
Date: Tue, 26 Nov 2024 10:10:31 +0100
Message-ID: <20241126091042.918144-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Main updates from version V13[1]:
- Introduce new rproc_ops operation: load_fw() and release_fw(),
- Rename load() operation to load_segments() in rproc_ops structure and
  drivers.

More details are available in each patch commit message.

[1] https://lore.kernel.org/linux-arm-kernel/20241104133515.256497-1-arnaud.pouliquen@foss.st.com/T/

Tested-on: commit 42f7652d3eb5 ("Linux 6.12-rc4")
Description of the feature:
--------------------------
This series proposes the implementation of a remoteproc tee driver to
communicate with a TEE trusted application responsible for authenticating
and loading the remoteproc firmware image in an Arm secure context.

1) Principle:

The remoteproc tee driver provides services to communicate with the OP-TEE
trusted application running on the Trusted Execution Context (TEE).
The trusted application in TEE manages the remote processor lifecycle:

- authenticating and loading firmware images,
- isolating and securing the remote processor memories,
- supporting multi-firmware (e.g., TF-M + Zephyr on a Cortex-M33),
- managing the start and stop of the firmware by the TEE.

2) Format of the signed image:

Refer to:
https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/src/remoteproc_core.c#L18-L57

3) OP-TEE trusted application API:

Refer to:
https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/include/ta_remoteproc.h

4) OP-TEE signature script

Refer to:
https://github.com/OP-TEE/optee_os/blob/master/scripts/sign_rproc_fw.py

Example of usage:
sign_rproc_fw.py --in <fw1.elf> --in <fw2.elf> --out <signed_fw.sign> --key ${OP-TEE_PATH}/keys/default.pem


5) Impact on User space Application

No sysfs impact. The user only needs to provide the signed firmware image
instead of the ELF image.


For more information about the implementation, a presentation is available here
(note that the format of the signed image has evolved between the presentation
and the integration in OP-TEE).

https://resources.linaro.org/en/resource/6c5bGvZwUAjX56fvxthxds

Arnaud Pouliquen (8):
  remoteproc: core: Introduce rproc_pa_to_va helper
  remoteproc: Add TEE support
  remoteproc: Introduce load_fw and release_fw optional operation
  remoteproc: Rename load() operation to load_segments() in rproc_ops
    struct
  remoteproc: Make load_segments and load_fw ops exclusive and optional
  dt-bindings: remoteproc: Add compatibility for TEE support
  remoteproc: stm32: Create sub-functions to request shutdown and
    release
  remoteproc: stm32: Add support of an OP-TEE TA to load the firmware

 .../bindings/remoteproc/st,stm32-rproc.yaml   |  58 +-
 drivers/remoteproc/Kconfig                    |  10 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/imx_dsp_rproc.c            |   2 +-
 drivers/remoteproc/imx_rproc.c                |   2 +-
 drivers/remoteproc/meson_mx_ao_arc.c          |   2 +-
 drivers/remoteproc/mtk_scp.c                  |   2 +-
 drivers/remoteproc/qcom_q6v5_adsp.c           |   2 +-
 drivers/remoteproc/qcom_q6v5_mss.c            |   2 +-
 drivers/remoteproc/qcom_q6v5_pas.c            |   4 +-
 drivers/remoteproc/qcom_q6v5_wcss.c           |   4 +-
 drivers/remoteproc/qcom_wcnss.c               |   2 +-
 drivers/remoteproc/rcar_rproc.c               |   2 +-
 drivers/remoteproc/remoteproc_core.c          |  68 ++-
 drivers/remoteproc/remoteproc_internal.h      |  20 +-
 drivers/remoteproc/remoteproc_tee.c           | 508 ++++++++++++++++++
 drivers/remoteproc/st_remoteproc.c            |   2 +-
 drivers/remoteproc/st_slim_rproc.c            |   2 +-
 drivers/remoteproc/stm32_rproc.c              | 141 +++--
 drivers/remoteproc/xlnx_r5_remoteproc.c       |   2 +-
 include/linux/remoteproc.h                    |  20 +-
 include/linux/remoteproc_tee.h                | 105 ++++
 22 files changed, 893 insertions(+), 68 deletions(-)
 create mode 100644 drivers/remoteproc/remoteproc_tee.c
 create mode 100644 include/linux/remoteproc_tee.h


base-commit: adc218676eef25575469234709c2d87185ca223a
-- 
2.25.1


