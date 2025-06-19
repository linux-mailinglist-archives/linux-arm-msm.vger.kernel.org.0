Return-Path: <linux-arm-msm+bounces-61812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 846EAAE0889
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 16:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF7041BC459A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 14:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B259A21A43D;
	Thu, 19 Jun 2025 14:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E8dnElxB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB751221FA6
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 14:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750342826; cv=none; b=cqS8BLhgsT9UVpYuampJqqmse1HAwc+yiNR07B/B+YR0vKOSuROWsf1qc64npktvbpGJBF1n3yWOR1TbnNxOn5gPdczzNF/eOE1Ub9RT//WsbkBDAX4raSp6G4dVeOPDn7NhbudmZq3X+qOgX1M+FkuXfnjQ/rqeJuXlFv9PSSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750342826; c=relaxed/simple;
	bh=6DJRRc3e1Pb4NyqnUm+AWViDFSZApbxZx5X7rvO88Nw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eSFfteM7c5SnQhf5uBOY4vG1iM3vNmsQ9RW6a/M+EKBMW/mpMQAz/Az7W+xX9EQSzk2M+wonwx0yw3NGJaYgqqBgnfmB2e1/lmXaoasbp04OMBE8Us7QagpmkWjG5Ta74gHUFaSrLu2+DFaCb5vzgHEe95bzj8roRYQdk3ztysk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E8dnElxB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JDJGCM018584
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 14:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0uD6qgra8tw
	GyYJTVpt2fASyFnOJEg7LbGdUbBgYEuo=; b=E8dnElxBp/WInDmJcCsAd3YQNoL
	QphJDGvitw31Op8Jwl8OLNEohRV/tPk61WvtPYlmJHd6X0ZcFrLermKudfy+t7/u
	ggti/bkS0N49FyLvaPfb4c9NIhVc6nvIdwI3X1xcYTfKK3jOWkoPpPOyQNeFFyrP
	qoXVww9ZBXTUM2uYBrBEKfQrjQ6QxJYHFlKaFY9OAAHe2iNW8BJU6ilZ5XiNUeQW
	+s3UYpPxMSMfhF3clvNRIWlUuKMK/ozaxFxypWBh2yo3nn4tsXEzIcxngbZk/FE1
	mpMokzTlbyR51/HxuRXHBzHH8YrGLbSIMRGY2WOPiNN1Qwxrld6XnZwAmog==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h9g6qr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 14:20:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a57fea76beso16298101cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 07:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750342823; x=1750947623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0uD6qgra8twGyYJTVpt2fASyFnOJEg7LbGdUbBgYEuo=;
        b=OmevvaDz0JqMUSGN5I6lqR18zj+nFbz4ptcfgsdvXPUHbDQtl1IZ5kMnDL2SX2g4tI
         fZ7KKTjsTafo8tKG/oIt6VIT87d3cnEnseWonMgwLkNm3n5BOL1UbzhadOc2UvZzgEYs
         8A2hIZxxiMXsBlUOPkWNhWrwX4DIl7TzvaohZqA8ZlIxdQj+r2fB5aqH3pw2qRBrYOyW
         /trkYURYZosqLfx8h+Zyr0Cs31m1g9j1hKX83mKEJ4yBYYsiFeNAyLBAszq+bQRmoh4T
         KfsJKd/IOjnPU3EODA0mCaJdOAVs31nIpZbV7/lXhTITx1jjR/A9jUq3bLuK+aD+K1+z
         Lz4Q==
X-Gm-Message-State: AOJu0YzXzlO1xLX0fp1XOEHzrxL9hm2Audpb7TklA885rpEIcMo5U0to
	AI6dKE2boR1fVaG6/O/Dxn22k4hgNo2udvv4ceXhycDeyePXmfKSXcnAH6i+JO2z5CvXLvB2NfE
	9u3u5hKV9DXyU0sXSKmv1flcyVerrcmLoZWZ458Or28yZFXdLasUj2zNFiaA8K3V0r1Qd
X-Gm-Gg: ASbGncu03KOsHm/qQhyM8k3Dh56FYUlx+TbnsCvqx6ju/CNXP9Xd2ZrwfpTfdeZOlvl
	ncXotXxFtJXKcaInEmwRz6QVQdSKO9Gdwa2HR0QrnClmzrnGQck5v6qJ6CU5r6t2OO+bN48OIlH
	BD3HcUo7mUGiLP3Pc42VpV6AXKeeWnB/S5ojxTcvuE0NP9acawSygOpQEn2XOV3K3xNjmplx3W+
	1TEnkXLVS5Xmy5NHVszq85EiDWg0HJSHL4f8xeCmDZynFDOAM1u7f4tnGnGp5d72BfmpefVZPZg
	xPpUUwHZYOKyw1S8BXXtLAJjjtxwbBVq115B/JDXSt5z/R2FQ9dm6oDfBSA9oLTS0HKxGGG9lxs
	a
X-Received: by 2002:ac8:7fcb:0:b0:472:1d98:c6df with SMTP id d75a77b69052e-4a73c5c3447mr350547891cf.52.1750342822536;
        Thu, 19 Jun 2025 07:20:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQeJCtqbsLr9ksxhF+C0MLqdUERBmgaLCEkrj0K5TbplfjV8aSOc3f8esB/NrUkQ23xOvGpA==
X-Received: by 2002:ac8:7fcb:0:b0:472:1d98:c6df with SMTP id d75a77b69052e-4a73c5c3447mr350547191cf.52.1750342821939;
        Thu, 19 Jun 2025 07:20:21 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a58963561csm7254312f8f.47.2025.06.19.07.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:20:21 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        stanimir.k.varbanov@gmail.com
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 4/7] media: venus: vdec: AR50_LITE video core support
Date: Thu, 19 Jun 2025 16:20:09 +0200
Message-Id: <20250619142012.1768981-5-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250619142012.1768981-1-jorge.ramirez@oss.qualcomm.com>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250619142012.1768981-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nQWtbYMauY-5yg0NbSsOqbYz3x6nNktz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDExOSBTYWx0ZWRfX5dUkOe6LlxrJ
 20DVidKLl1Q61wlCjqyPJ6R5KYvpyvtxijvV0kSlYUrcyITgJUe/puRg/XkyORJD4O1kXK3cZtI
 bAc6jHRJjwNZkgURqMy7m1J3GNjkNHPlL/ufw00c/aCbJdmyxrOy3piKOSB/OwsCjtyxxM7nXLw
 kWfK8x1+BizDqceYMC0DSVD99fankdRk1PBdG9Xa7owtg8DRUj34QSbyqsLccV4vlfzBc7DHFLy
 PCMnTz0KSYcgVqFLA6XGWykw5LOXW1w02iN6w4oTA3+fGWwxAu6+W4ThQ4mLGwwszSm443/2koP
 vhcO3YdQ8vGNXhzBhaIpcIVDDH17aeKIMmU5GIsHWqa8knl22PzXSqtTG2pkCXcr9ZD2Ijewj8i
 +oG30ekKPFBvMjKcRhwJSm8UbNulY4UMp6jmWL6PWFh3drk66Ksfko3YaTR3EL2Pr+jnZEeC
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=68541ca7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=JddlqT8qWGs7_F7EYHsA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: nQWtbYMauY-5yg0NbSsOqbYz3x6nNktz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506190119

The AR50_LITE is a streamlined variant of the AR50 video core, designed
for power and cost-efficient platforms.

It supports hardware-accelerated decoding of H.264, HEVC, and VP9
formats.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---

 v2: use IS_VPU macro to simplify conditionals
     added Loic Poulain as co-developer (should be on v1)

 drivers/media/platform/qcom/venus/core.c      | 11 ++-
 drivers/media/platform/qcom/venus/core.h      |  5 +-
 drivers/media/platform/qcom/venus/firmware.c  |  8 +-
 drivers/media/platform/qcom/venus/helpers.c   | 81 +++++++++++++++++++
 drivers/media/platform/qcom/venus/helpers.h   |  2 +
 .../media/platform/qcom/venus/hfi_helper.h    | 10 ++-
 drivers/media/platform/qcom/venus/hfi_venus.c | 17 ++--
 .../media/platform/qcom/venus/pm_helpers.c    |  1 +
 drivers/media/platform/qcom/venus/vdec.c      | 15 ++--
 9 files changed, 125 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index d305d74bb152..8613013f5c28 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -254,14 +254,19 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type)
 
 static void venus_assign_register_offsets(struct venus_core *core)
 {
-	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
-		core->vbif_base = core->base + VBIF_BASE;
+	if (IS_VPU(core, IRIS2, IRIS2_1, AR50_LITE)) {
 		core->cpu_base = core->base + CPU_BASE_V6;
 		core->cpu_cs_base = core->base + CPU_CS_BASE_V6;
 		core->cpu_ic_base = core->base + CPU_IC_BASE_V6;
 		core->wrapper_base = core->base + WRAPPER_BASE_V6;
 		core->wrapper_tz_base = core->base + WRAPPER_TZ_BASE_V6;
-		core->aon_base = core->base + AON_BASE_V6;
+		if (IS_AR50_LITE(core)) {
+			core->vbif_base = NULL;
+			core->aon_base = NULL;
+		} else {
+			core->vbif_base = core->base + VBIF_BASE;
+			core->aon_base = core->base + AON_BASE_V6;
+		}
 	} else {
 		core->vbif_base = core->base + VBIF_BASE;
 		core->cpu_base = core->base + CPU_BASE;
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index b9de27dc3493..3c2c63522561 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -382,6 +382,7 @@ enum venus_inst_modes {
  * @lock:	instance lock
  * @core:	a reference to the core struct
  * @clk_data:	clock data per core ID
+ * @eosbufs:	a lit of EOS buffers
  * @dpbbufs:	a list of decoded picture buffers
  * @internalbufs:	a list of internal bufferes
  * @registeredbufs:	a list of registered capture bufferes
@@ -450,6 +451,7 @@ struct venus_inst {
 	struct mutex lock;
 	struct venus_core *core;
 	struct clock_data clk_data;
+	struct list_head eosbufs;
 	struct list_head dpbbufs;
 	struct list_head internalbufs;
 	struct list_head registeredbufs;
@@ -520,7 +522,8 @@ struct venus_inst {
 #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
 #define IS_V3(core)	((core)->res->hfi_version == HFI_VERSION_3XX)
 #define IS_V4(core)	((core)->res->hfi_version == HFI_VERSION_4XX)
-#define IS_V6(core)	((core)->res->hfi_version == HFI_VERSION_6XX)
+#define IS_V6(core)     (((core)->res->hfi_version == HFI_VERSION_6XX) || \
+			 ((core)->res->hfi_version == HFI_VERSION_6XX_LITE))
 
 #define IS_AR50(core)		((core)->res->vpu_version == VPU_VERSION_AR50)
 #define IS_AR50_LITE(core)	((core)->res->vpu_version == VPU_VERSION_AR50_LITE)
diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 66a18830e66d..3dad00662d0f 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -30,7 +30,7 @@ static void venus_reset_cpu(struct venus_core *core)
 	u32 fw_size = core->fw.mapped_mem_size;
 	void __iomem *wrapper_base;
 
-	if (IS_IRIS2_1(core))
+	if (IS_VPU(core, IRIS2_1, AR50_LITE))
 		wrapper_base = core->wrapper_tz_base;
 	else
 		wrapper_base = core->wrapper_base;
@@ -42,7 +42,7 @@ static void venus_reset_cpu(struct venus_core *core)
 	writel(fw_size, wrapper_base + WRAPPER_NONPIX_START_ADDR);
 	writel(fw_size, wrapper_base + WRAPPER_NONPIX_END_ADDR);
 
-	if (IS_IRIS2_1(core)) {
+	if (IS_VPU(core, IRIS2_1, AR50_LITE)) {
 		/* Bring XTSS out of reset */
 		writel(0, wrapper_base + WRAPPER_TZ_XTSS_SW_RESET);
 	} else {
@@ -68,7 +68,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
 	if (resume) {
 		venus_reset_cpu(core);
 	} else {
-		if (IS_IRIS2_1(core))
+		if (IS_VPU(core, IRIS2_1, AR50_LITE))
 			writel(WRAPPER_XTSS_SW_RESET_BIT,
 			       core->wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
 		else
@@ -181,7 +181,7 @@ static int venus_shutdown_no_tz(struct venus_core *core)
 	void __iomem *wrapper_base = core->wrapper_base;
 	void __iomem *wrapper_tz_base = core->wrapper_tz_base;
 
-	if (IS_IRIS2_1(core)) {
+	if (IS_VPU(core, IRIS2_1, AR50_LITE)) {
 		/* Assert the reset to XTSS */
 		reg = readl(wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
 		reg |= WRAPPER_XTSS_SW_RESET_BIT;
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 8295542e1a7c..ae89369c6a07 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -230,6 +230,80 @@ int venus_helper_alloc_dpb_bufs(struct venus_inst *inst)
 }
 EXPORT_SYMBOL_GPL(venus_helper_alloc_dpb_bufs);
 
+static void free_eos_buf(struct venus_inst *inst, struct intbuf *buf)
+{
+	list_del_init(&buf->list);
+	dma_free_attrs(inst->core->dev, buf->size, buf->va, buf->da,
+		       buf->attrs);
+	kfree(buf);
+}
+
+int venus_helper_free_eos_bufs(struct venus_inst *inst)
+{
+	struct intbuf *buf, *n;
+
+	list_for_each_entry_safe(buf, n, &inst->eosbufs, list) {
+		free_eos_buf(inst, buf);
+	}
+
+	if (list_empty(&inst->eosbufs))
+		INIT_LIST_HEAD(&inst->eosbufs);
+
+	return 0;
+
+}
+EXPORT_SYMBOL_GPL(venus_helper_free_eos_bufs);
+
+int venus_helper_alloc_eos_buf(struct venus_inst *inst,
+			       struct hfi_frame_data *data)
+{
+	struct venus_core *core = inst->core;
+	struct device *dev = core->dev;
+	struct intbuf *buf;
+	int ret = 0;
+
+	memset(data, 0, sizeof(*data));
+
+	data->buffer_type = HFI_BUFFER_INPUT;
+	data->flags = HFI_BUFFERFLAG_EOS;
+
+	if (IS_AR50_LITE(inst->core)) {
+		/* We must send valid sizes and addresses */
+		buf = kzalloc(sizeof(*buf), GFP_KERNEL);
+		if (!buf) {
+			ret = -ENOMEM;
+			goto fail;
+		}
+
+		buf->type = HFI_BUFFER_INPUT;
+		buf->size = SZ_4K;
+		buf->attrs = DMA_ATTR_NO_KERNEL_MAPPING;
+		buf->va = dma_alloc_attrs(dev, buf->size, &buf->da, GFP_KERNEL,
+					  buf->attrs);
+		if (!buf->va) {
+			ret = -ENOMEM;
+			goto fail;
+		}
+
+		list_add_tail(&buf->list, &inst->eosbufs);
+
+		data->alloc_len = buf->size;
+		data->device_addr = buf->da;
+
+	} else if (IS_V6(inst->core) &&
+		   is_fw_rev_or_older(inst->core, 1, 0, 87)) {
+		data->device_addr = 0;
+	} else {
+		data->device_addr = 0xdeadb000;
+	}
+
+	return 0;
+fail:
+	kfree(buf);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(venus_helper_alloc_eos_buf);
+
 static int intbufs_set_buffer(struct venus_inst *inst, u32 type)
 {
 	struct venus_core *core = inst->core;
@@ -630,6 +704,13 @@ static int platform_get_bufreq(struct venus_inst *inst, u32 buftype,
 	if (!hfi_plat || !hfi_plat->bufreq)
 		return -EINVAL;
 
+	/* Firmware buffer requirements for internal buffers only */
+	if (IS_AR50_LITE(inst->core))
+		if ((buftype != HFI_BUFFER_INPUT) &&
+		    (buftype != HFI_BUFFER_OUTPUT) &&
+		    (buftype != HFI_BUFFER_OUTPUT2))
+			return -EINVAL;
+
 	params.version = version;
 	params.num_vpp_pipes = inst->core->res->num_vpp_pipes;
 
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index 358e4f39c9c0..bf55fe3b8747 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -58,6 +58,8 @@ int venus_helper_get_out_fmts(struct venus_inst *inst, u32 fmt, u32 *out_fmt,
 bool venus_helper_check_format(struct venus_inst *inst, u32 v4l2_pixfmt);
 int venus_helper_alloc_dpb_bufs(struct venus_inst *inst);
 int venus_helper_free_dpb_bufs(struct venus_inst *inst);
+int venus_helper_alloc_eos_buf(struct venus_inst *inst, struct hfi_frame_data *data);
+int venus_helper_free_eos_bufs(struct venus_inst *inst);
 int venus_helper_intbufs_alloc(struct venus_inst *inst);
 int venus_helper_intbufs_free(struct venus_inst *inst);
 int venus_helper_intbufs_realloc(struct venus_inst *inst);
diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index f44059f19505..128ddf8e3cd5 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -397,13 +397,16 @@
 #define HFI_BUFFER_INTERNAL_PERSIST_1		0x5
 #define HFI_BUFFER_INTERNAL_SCRATCH(ver)	\
 	(((ver) == HFI_VERSION_4XX ||		\
-	(ver) == HFI_VERSION_6XX) ? 0x6 : 0x1000001)
+	(ver) == HFI_VERSION_6XX || (ver) == HFI_VERSION_6XX_LITE) \
+	? 0x6 : 0x1000001)
 #define HFI_BUFFER_INTERNAL_SCRATCH_1(ver)	\
 	(((ver) == HFI_VERSION_4XX ||		\
-	(ver) == HFI_VERSION_6XX) ? 0x7 : 0x1000005)
+	(ver) == HFI_VERSION_6XX || (ver) == HFI_VERSION_6XX_LITE) \
+	? 0x7 : 0x1000005)
 #define HFI_BUFFER_INTERNAL_SCRATCH_2(ver)	\
 	(((ver) == HFI_VERSION_4XX ||		\
-	(ver) == HFI_VERSION_6XX) ? 0x8 : 0x1000006)
+	(ver) == HFI_VERSION_6XX || (ver) == HFI_VERSION_6XX_LITE) \
+	? 0x8 : 0x1000006)
 #define HFI_BUFFER_EXTRADATA_INPUT(ver)		\
 	(((ver) == HFI_VERSION_4XX) ? 0xc : 0x1000002)
 #define HFI_BUFFER_EXTRADATA_OUTPUT(ver)	\
@@ -561,6 +564,7 @@ enum hfi_version {
 	HFI_VERSION_3XX,
 	HFI_VERSION_4XX,
 	HFI_VERSION_6XX,
+	HFI_VERSION_6XX_LITE,
 };
 
 struct hfi_buffer_info {
diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 5fab68d530e0..2d19259a58af 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -469,7 +469,7 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
 	void __iomem *wrapper_base = hdev->core->wrapper_base;
 	int ret = 0;
 
-	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core)) {
+	if (IS_VPU(hdev->core, IRIS2, IRIS2_1)) {
 		mask_val = readl(wrapper_base + WRAPPER_INTR_MASK);
 		mask_val &= ~(WRAPPER_INTR_MASK_A2HWD_BASK_V6 |
 			      WRAPPER_INTR_MASK_A2HCPU_MASK);
@@ -497,7 +497,7 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
 	if (count >= max_tries)
 		ret = -ETIMEDOUT;
 
-	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core)) {
+	if (IS_VPU(hdev->core, IRIS2, IRIS2_1, AR50_LITE)) {
 		writel(0x1, cpu_cs_base + CPU_CS_H2XSOFTINTEN_V6);
 		writel(0x0, cpu_cs_base + CPU_CS_X2RPMH_V6);
 	}
@@ -565,6 +565,9 @@ static int venus_halt_axi(struct venus_hfi_device *hdev)
 	u32 mask_val;
 	int ret;
 
+	if (IS_AR50_LITE(hdev->core))
+		return 0;
+
 	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core)) {
 		writel(0x3, cpu_cs_base + CPU_CS_X2RPMH_V6);
 
@@ -1134,7 +1137,8 @@ static irqreturn_t venus_isr(struct venus_core *core)
 	wrapper_base = hdev->core->wrapper_base;
 
 	status = readl(wrapper_base + WRAPPER_INTR_STATUS);
-	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
+
+	if (IS_VPU(core, IRIS2, IRIS2_1, AR50_LITE)) {
 		if (status & WRAPPER_INTR_STATUS_A2H_MASK ||
 		    status & WRAPPER_INTR_STATUS_A2HWD_MASK_V6 ||
 		    status & CPU_CS_SCIACMDARG0_INIT_IDLE_MSG_MASK)
@@ -1146,7 +1150,8 @@ static irqreturn_t venus_isr(struct venus_core *core)
 			hdev->irq_status = status;
 	}
 	writel(1, cpu_cs_base + CPU_CS_A2HSOFTINTCLR);
-	if (!(IS_IRIS2(core) || IS_IRIS2_1(core)))
+
+	if (!IS_VPU(core, IRIS2, IRIS2_1, AR50_LITE))
 		writel(status, wrapper_base + WRAPPER_INTR_CLEAR);
 
 	return IRQ_WAKE_THREAD;
@@ -1531,7 +1536,7 @@ static bool venus_cpu_and_video_core_idle(struct venus_hfi_device *hdev)
 	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
 	u32 ctrl_status, cpu_status;
 
-	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core))
+	if (IS_VPU(hdev->core, IRIS2, IRIS2_1, AR50_LITE))
 		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
 	else
 		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
@@ -1551,7 +1556,7 @@ static bool venus_cpu_idle_and_pc_ready(struct venus_hfi_device *hdev)
 	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
 	u32 ctrl_status, cpu_status;
 
-	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core))
+	if (IS_VPU(hdev->core, IRIS2, IRIS2_1, AR50_LITE))
 		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
 	else
 		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 409aa9bd0b5d..5d9dfe3fd043 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -1168,6 +1168,7 @@ const struct venus_pm_ops *venus_pm_get(enum hfi_version version)
 		return &pm_ops_v3;
 	case HFI_VERSION_4XX:
 	case HFI_VERSION_6XX:
+	case HFI_VERSION_6XX_LITE:
 		return &pm_ops_v4;
 	}
 
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 7e4c17f3aa84..0d9685f56781 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -550,7 +550,7 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
 {
 	struct venus_inst *inst = to_inst(file);
 	struct vb2_queue *dst_vq;
-	struct hfi_frame_data fdata = {0};
+	struct hfi_frame_data fdata;
 	int ret;
 
 	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, fh, cmd);
@@ -561,18 +561,15 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
 
 	if (cmd->cmd == V4L2_DEC_CMD_STOP) {
 		/*
-		 * Implement V4L2_DEC_CMD_STOP by enqueue an empty buffer on
+		 * Implement V4L2_DEC_CMD_STOP by enqueue a buffer on
 		 * decoder input to signal EOS.
 		 */
 		if (!(inst->streamon_out && inst->streamon_cap))
 			goto unlock;
 
-		fdata.buffer_type = HFI_BUFFER_INPUT;
-		fdata.flags |= HFI_BUFFERFLAG_EOS;
-		if (IS_V6(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87))
-			fdata.device_addr = 0;
-		else
-			fdata.device_addr = 0xdeadb000;
+		ret = venus_helper_alloc_eos_buf(inst, &fdata);
+		if (ret)
+			goto unlock;
 
 		ret = hfi_session_process_buf(inst, &fdata);
 
@@ -1332,6 +1329,7 @@ static void vdec_session_release(struct venus_inst *inst)
 		hfi_session_abort(inst);
 
 	venus_helper_free_dpb_bufs(inst);
+	venus_helper_free_eos_bufs(inst);
 	venus_pm_load_scale(inst);
 	INIT_LIST_HEAD(&inst->registeredbufs);
 	mutex_unlock(&inst->lock);
@@ -1682,6 +1680,7 @@ static int vdec_open(struct file *file)
 	if (!inst)
 		return -ENOMEM;
 
+	INIT_LIST_HEAD(&inst->eosbufs);
 	INIT_LIST_HEAD(&inst->dpbbufs);
 	INIT_LIST_HEAD(&inst->registeredbufs);
 	INIT_LIST_HEAD(&inst->internalbufs);
-- 
2.34.1


