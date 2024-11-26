Return-Path: <linux-arm-msm+bounces-39175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C98D29D93F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 10:15:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B709282634
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 09:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B93713774D;
	Tue, 26 Nov 2024 09:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="j2DEkQSQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEF1126C0A;
	Tue, 26 Nov 2024 09:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732612526; cv=none; b=F45NXiRgZ5HszZdW6sEh3SaGgcnQRKuYHjJXXBl9+XQNubdjQrMHHm32dNnyU//f4jxzsmFR5CsyyxME63Szfva7LpKudP9aVDDBMUa3LUxtrAFOir8Qj/ZeLVy+aD2nA1a8zpxD6LbNMS/RuLbepKywYEGxIFCvYkdfVe7r1n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732612526; c=relaxed/simple;
	bh=DIApcsRarfJuvLio7GM2KLnSvShs2N0fFv/gngSFK1E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=stCRZ/GQJsjevEEu2pIcZ0HpaLRB1D2NVvuAbsLPijndXfnDjgrK4dNbf9uJn1FyKZJSolQq8G2m4N4jFKDrEKZ77d0YdXxKA6WWyFTSLfNRGfKJUPQl3W50VUzmmGu4BP6AfTF6ukx058eR3RI+AP7cpfAtPM2TAjdAh8cyWhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=j2DEkQSQ; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ53nEO010578;
	Tue, 26 Nov 2024 10:14:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	af+pCFkEn5Uu729dokQ2oyPRG7AjK5zrbHT8BSaQwXA=; b=j2DEkQSQTe492lcG
	gS0U0q0v2UIULKggBuTovDLoFUw1C5CQz5f2bbY4ScSxyqdaUBmhqrxcCwrF/A0Q
	QFx4zcdiMGk8YvpvdHO9pmmLldStB3gaOfiu8zYQIK5lcVjTUKDO6RcEnhB1YCJZ
	GQx7SmuqaGh6Hv8pmYCTfcB46d8IASQNRDeHTTLq5mDd1tJ0RbnEZkpHyFffSPdg
	p1e2cNw/Vbw+5YfJ2jLWge/aAU/IHKqCcM+gPsEq6NouvjkHh3UEmwKwFU9wNeny
	8Zc3iGdDvz1obYOqRx3xQn5vXj9yzuos83puU8R8GnQOU3TPWV1trv8iCuJUkKvh
	9I0VkA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 433tvnhaxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 10:14:53 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 358754002D;
	Tue, 26 Nov 2024 10:13:00 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2F54426B64E;
	Tue, 26 Nov 2024 10:11:14 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 26 Nov
 2024 10:11:14 +0100
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 26 Nov
 2024 10:11:13 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
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
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        <linux-remoteproc@vger.kernel.org>, <imx@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v14 4/8] remoteproc: Rename load() operation to load_segments() in rproc_ops struct
Date: Tue, 26 Nov 2024 10:10:35 +0100
Message-ID: <20241126091042.918144-5-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241126091042.918144-1-arnaud.pouliquen@foss.st.com>
References: <20241126091042.918144-1-arnaud.pouliquen@foss.st.com>
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

With the introduction of the load_fw() operation in the rproc_ops
structure, we need to clarify the difference in the use of the load()
and load_fw() ops.

The legacy load() is dedicated to loading the ELF segments into memory.
Rename this to a more explicit name: load_segments().

Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/imx_dsp_rproc.c       | 2 +-
 drivers/remoteproc/imx_rproc.c           | 2 +-
 drivers/remoteproc/meson_mx_ao_arc.c     | 2 +-
 drivers/remoteproc/mtk_scp.c             | 2 +-
 drivers/remoteproc/qcom_q6v5_adsp.c      | 2 +-
 drivers/remoteproc/qcom_q6v5_mss.c       | 2 +-
 drivers/remoteproc/qcom_q6v5_pas.c       | 4 ++--
 drivers/remoteproc/qcom_q6v5_wcss.c      | 4 ++--
 drivers/remoteproc/qcom_wcnss.c          | 2 +-
 drivers/remoteproc/rcar_rproc.c          | 2 +-
 drivers/remoteproc/remoteproc_core.c     | 4 ++--
 drivers/remoteproc/remoteproc_internal.h | 4 ++--
 drivers/remoteproc/st_remoteproc.c       | 2 +-
 drivers/remoteproc/st_slim_rproc.c       | 2 +-
 drivers/remoteproc/stm32_rproc.c         | 2 +-
 drivers/remoteproc/xlnx_r5_remoteproc.c  | 2 +-
 include/linux/remoteproc.h               | 4 ++--
 17 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 376187ad5754..a4a85fbce907 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -934,7 +934,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
 	.start		= imx_dsp_rproc_start,
 	.stop		= imx_dsp_rproc_stop,
 	.kick		= imx_dsp_rproc_kick,
-	.load		= imx_dsp_rproc_elf_load_segments,
+	.load_segments	= imx_dsp_rproc_elf_load_segments,
 	.parse_fw	= imx_dsp_rproc_parse_fw,
 	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
 	.sanity_check	= rproc_elf_sanity_check,
diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 800015ff7ff9..f45b3207f7e9 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -681,7 +681,7 @@ static const struct rproc_ops imx_rproc_ops = {
 	.stop		= imx_rproc_stop,
 	.kick		= imx_rproc_kick,
 	.da_to_va       = imx_rproc_da_to_va,
-	.load		= rproc_elf_load_segments,
+	.load_segments	= rproc_elf_load_segments,
 	.parse_fw	= imx_rproc_parse_fw,
 	.find_loaded_rsc_table = imx_rproc_elf_find_loaded_rsc_table,
 	.get_loaded_rsc_table = imx_rproc_get_loaded_rsc_table,
diff --git a/drivers/remoteproc/meson_mx_ao_arc.c b/drivers/remoteproc/meson_mx_ao_arc.c
index f6744b538323..a1c8c0929ce3 100644
--- a/drivers/remoteproc/meson_mx_ao_arc.c
+++ b/drivers/remoteproc/meson_mx_ao_arc.c
@@ -137,7 +137,7 @@ static struct rproc_ops meson_mx_ao_arc_rproc_ops = {
 	.stop		= meson_mx_ao_arc_rproc_stop,
 	.da_to_va	= meson_mx_ao_arc_rproc_da_to_va,
 	.get_boot_addr	= rproc_elf_get_boot_addr,
-	.load		= rproc_elf_load_segments,
+	.load_segments	= rproc_elf_load_segments,
 	.sanity_check	= rproc_elf_sanity_check,
 };
 
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index e744c07507ee..4e9a8bf3bc6e 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -924,7 +924,7 @@ static int scp_stop(struct rproc *rproc)
 static const struct rproc_ops scp_ops = {
 	.start		= scp_start,
 	.stop		= scp_stop,
-	.load		= scp_load,
+	.load_segments	= scp_load,
 	.da_to_va	= scp_da_to_va,
 	.parse_fw	= scp_parse_fw,
 	.sanity_check	= rproc_elf_sanity_check,
diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 572dcb0f055b..aa9896930bcf 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -527,7 +527,7 @@ static const struct rproc_ops adsp_ops = {
 	.stop = adsp_stop,
 	.da_to_va = adsp_da_to_va,
 	.parse_fw = adsp_parse_firmware,
-	.load = adsp_load,
+	.load_segments = adsp_load,
 	.panic = adsp_panic,
 };
 
diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 2a42215ce8e0..a8beac1deabe 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1687,7 +1687,7 @@ static const struct rproc_ops q6v5_ops = {
 	.start = q6v5_start,
 	.stop = q6v5_stop,
 	.parse_fw = qcom_q6v5_register_dump_segments,
-	.load = q6v5_load,
+	.load_segments = q6v5_load,
 	.panic = q6v5_panic,
 };
 
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ef82835e98a4..9b269ce390c1 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -436,7 +436,7 @@ static const struct rproc_ops adsp_ops = {
 	.stop = adsp_stop,
 	.da_to_va = adsp_da_to_va,
 	.parse_fw = qcom_register_dump_segments,
-	.load = adsp_load,
+	.load_segments = adsp_load,
 	.panic = adsp_panic,
 };
 
@@ -446,7 +446,7 @@ static const struct rproc_ops adsp_minidump_ops = {
 	.stop = adsp_stop,
 	.da_to_va = adsp_da_to_va,
 	.parse_fw = qcom_register_dump_segments,
-	.load = adsp_load,
+	.load_segments = adsp_load,
 	.panic = adsp_panic,
 	.coredump = adsp_minidump,
 };
diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index e913dabae992..44b5736dc8b9 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -771,7 +771,7 @@ static const struct rproc_ops q6v5_wcss_ipq8074_ops = {
 	.start = q6v5_wcss_start,
 	.stop = q6v5_wcss_stop,
 	.da_to_va = q6v5_wcss_da_to_va,
-	.load = q6v5_wcss_load,
+	.load_segments = q6v5_wcss_load,
 	.get_boot_addr = rproc_elf_get_boot_addr,
 };
 
@@ -779,7 +779,7 @@ static const struct rproc_ops q6v5_wcss_qcs404_ops = {
 	.start = q6v5_qcs404_wcss_start,
 	.stop = q6v5_wcss_stop,
 	.da_to_va = q6v5_wcss_da_to_va,
-	.load = q6v5_wcss_load,
+	.load_segments = q6v5_wcss_load,
 	.get_boot_addr = rproc_elf_get_boot_addr,
 	.parse_fw = qcom_register_dump_segments,
 };
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index a7bb9da27029..42102bc4c458 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -335,7 +335,7 @@ static const struct rproc_ops wcnss_ops = {
 	.stop = wcnss_stop,
 	.da_to_va = wcnss_da_to_va,
 	.parse_fw = qcom_register_dump_segments,
-	.load = wcnss_load,
+	.load_segments = wcnss_load,
 };
 
 static irqreturn_t wcnss_wdog_interrupt(int irq, void *dev)
diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
index cc17e8421f65..e36778fec072 100644
--- a/drivers/remoteproc/rcar_rproc.c
+++ b/drivers/remoteproc/rcar_rproc.c
@@ -142,7 +142,7 @@ static struct rproc_ops rcar_rproc_ops = {
 	.prepare	= rcar_rproc_prepare,
 	.start		= rcar_rproc_start,
 	.stop		= rcar_rproc_stop,
-	.load		= rproc_elf_load_segments,
+	.load_segments	= rproc_elf_load_segments,
 	.parse_fw	= rcar_rproc_parse_fw,
 	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
 	.sanity_check	= rproc_elf_sanity_check,
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 8df4b2c59bb6..e4ad024efcda 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2485,11 +2485,11 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
 	if (!rproc->ops->coredump)
 		rproc->ops->coredump = rproc_coredump;
 
-	if (rproc->ops->load || rproc->ops->load_fw)
+	if (rproc->ops->load_segments || rproc->ops->load_fw)
 		return 0;
 
 	/* Default to ELF loader if no load function is specified */
-	rproc->ops->load = rproc_elf_load_segments;
+	rproc->ops->load_segments = rproc_elf_load_segments;
 	rproc->ops->parse_fw = rproc_elf_load_rsc_table;
 	rproc->ops->find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table;
 	rproc->ops->sanity_check = rproc_elf_sanity_check;
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 2104ca449178..b898494600cf 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -167,8 +167,8 @@ u64 rproc_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
 static inline
 int rproc_load_segments(struct rproc *rproc, const struct firmware *fw)
 {
-	if (rproc->ops->load)
-		return rproc->ops->load(rproc, fw);
+	if (rproc->ops->load_segments)
+		return rproc->ops->load_segments(rproc, fw);
 
 	return -EINVAL;
 }
diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
index 1340be9d0110..8d6b75e91531 100644
--- a/drivers/remoteproc/st_remoteproc.c
+++ b/drivers/remoteproc/st_remoteproc.c
@@ -233,7 +233,7 @@ static const struct rproc_ops st_rproc_ops = {
 	.start			= st_rproc_start,
 	.stop			= st_rproc_stop,
 	.parse_fw		= st_rproc_parse_fw,
-	.load			= rproc_elf_load_segments,
+	.load_segments		= rproc_elf_load_segments,
 	.find_loaded_rsc_table	= rproc_elf_find_loaded_rsc_table,
 	.sanity_check		= rproc_elf_sanity_check,
 	.get_boot_addr		= rproc_elf_get_boot_addr,
diff --git a/drivers/remoteproc/st_slim_rproc.c b/drivers/remoteproc/st_slim_rproc.c
index 5412beb0a692..0f91d8f1e7c7 100644
--- a/drivers/remoteproc/st_slim_rproc.c
+++ b/drivers/remoteproc/st_slim_rproc.c
@@ -201,7 +201,7 @@ static const struct rproc_ops slim_rproc_ops = {
 	.stop		= slim_rproc_stop,
 	.da_to_va       = slim_rproc_da_to_va,
 	.get_boot_addr	= rproc_elf_get_boot_addr,
-	.load		= rproc_elf_load_segments,
+	.load_segments	= rproc_elf_load_segments,
 	.sanity_check	= rproc_elf_sanity_check,
 };
 
diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 8c7f7950b80e..7e8ffd9fcc57 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -667,7 +667,7 @@ static const struct rproc_ops st_rproc_ops = {
 	.attach		= stm32_rproc_attach,
 	.detach		= stm32_rproc_detach,
 	.kick		= stm32_rproc_kick,
-	.load		= rproc_elf_load_segments,
+	.load_segments	= rproc_elf_load_segments,
 	.parse_fw	= stm32_rproc_parse_fw,
 	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
 	.get_loaded_rsc_table = stm32_rproc_get_loaded_rsc_table,
diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 5aeedeaf3c41..59cfba0a02e7 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -864,7 +864,7 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
 	.unprepare	= zynqmp_r5_rproc_unprepare,
 	.start		= zynqmp_r5_rproc_start,
 	.stop		= zynqmp_r5_rproc_stop,
-	.load		= rproc_elf_load_segments,
+	.load_segments	= rproc_elf_load_segments,
 	.parse_fw	= zynqmp_r5_parse_fw,
 	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
 	.sanity_check	= rproc_elf_sanity_check,
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index ba6fd560f7ba..55c20424a99f 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -374,7 +374,7 @@ enum rsc_handling_status {
  * @find_loaded_rsc_table: find the loaded resource table from firmware image
  * @get_loaded_rsc_table: get resource table installed in memory
  *			  by external entity
- * @load:		load firmware to memory, where the remote processor
+ * @load_segments:	load firmware ELF segment to memory, where the remote processor
  *			expects to find it
  * @sanity_check:	sanity check the fw image
  * @get_boot_addr:	get boot address to entry point specified in firmware
@@ -402,7 +402,7 @@ struct rproc_ops {
 				struct rproc *rproc, const struct firmware *fw);
 	struct resource_table *(*get_loaded_rsc_table)(
 				struct rproc *rproc, size_t *size);
-	int (*load)(struct rproc *rproc, const struct firmware *fw);
+	int (*load_segments)(struct rproc *rproc, const struct firmware *fw);
 	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
 	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
 	unsigned long (*panic)(struct rproc *rproc);
-- 
2.25.1


