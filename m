Return-Path: <linux-arm-msm+bounces-65096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DE3B067F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 22:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F057B1AA7C1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 20:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B933B2C15B8;
	Tue, 15 Jul 2025 20:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CLKlHh+E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D747A29B8E4
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 20:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752612486; cv=none; b=deN/ZyvpaDHD6a2eZcHS3IhZo094dxXKdUUusl30GZQ6OW0st0vWdiOxjU6v2qVbwGKk0quXFSyAI3pul+Puyo5y3KpDYiI+N4yXZsPMmVIH3DejQKNWsx+qP9OwBs21IQ81wY2KWPR4NcgEnHq9w/OkTI/590Ss9K7eujZ4S0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752612486; c=relaxed/simple;
	bh=FTM+53bRRVOHtoe28id393M3/rMRlzMvNdgdygu1FsM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JzF437wr0m34cs07qfUstJAQ2AZeEQ52TQvg9tCNsFSqqI2KEPrZmcMZwOv6oEMEBBUiVAylXBkpjrj4TGs9uVuAduOTpCdcYlfGEGprUQrX82x2RIeynWQN7kCJg6wAb3emJs2Lvwo57Xz50v7a9BlJI5ii4m9cS7lkQkGDk3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CLKlHh+E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDDMa007286
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 20:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OaMMPHPi/zp
	Bc19zLi9ig6YpA2t1zrIdsPiqN861Zlw=; b=CLKlHh+EB6rwfnPZWIDBoiMaQzR
	yncmSl6ZBGrAzTHhG809eVE6ITimjoJxh0vLu6QMtWEK+ldWfJJ3N0e5mkvcvhD6
	qLWX1rBS+Jo2J1yYl0cygik0lS/aVA2UxnKkBxPWW3MPm+nigUrUokaos1DV0Kam
	2r3jTEEDzn0PeX0diawFh0V7w+zP4a7ueOGCzzc0NUVHkuwt9WD6QTVyslG3mMpM
	XFYmAhMNkcxxm6dweFgcoc+kZu/BpyU3/CTNpcbF6J54RwzwAMhRJ+jVFskQUpRF
	gzH6BdZScCSuLdWGkwjtXQXTbwx7qM/LfcSrLQh6PbUxycQA8MLCUrOjCtw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh5srfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 20:48:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e34399a08fso10698485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 13:48:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752612481; x=1753217281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OaMMPHPi/zpBc19zLi9ig6YpA2t1zrIdsPiqN861Zlw=;
        b=NYrzmMQaWFpw0RYfsWOYBv6jFziq/E/uCrZcCG4pXZz4dTOM0mEETRzjkEEXEhltwA
         sySI/tFaGNfRlYiI9tk+qyb2LYVhczWPMUSxQaFZL6QCxbW0aSl7kL9rafLNgQ4kc0Yv
         Ukgbx5pId4iHVPochgxEY7KcvmKlcqJg7lOzEK2IQPgYlXcwfMnVc+yW97wc2JchbSPH
         E3alaEupH2S5O5tCXodCN/5HWvGRDketf/XrFYDSFmMwPmkyppP4dU/YcOeQV+pydkie
         vAQrm15HjYLnB1vnDEB9/BcSpZDdFBT/4iI9qE/oWQbRUn4zSZXiGHvoBhl+goZr2PB7
         OGmg==
X-Forwarded-Encrypted: i=1; AJvYcCXv53gNJkNRpXSKHa+3PwDGNijQfAmHUbHG+Eqpa+adyRGuMEz2kcy2S8TgaVowfVUV8kRekIeINtsGxiyW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/SIbvYzjLyAFSHo4TwPHood3KOt4EwX3K7mosDUvX5rsHh30h
	h/5s+qNaElg6lH3wJUODrywLLvMLaUMqsTcctdQ171Pe5mSi4pk+K7DkDZs1wsJyypnx1D7kNLW
	Y2OvKW8zMgvDC91jIc7Lhi9PwAA3t1+5ppiOuv3c5ANjRoob9WU4bzb62Y8YfqgX2WTze
X-Gm-Gg: ASbGncsIvPLL5N32UnXcRqmwz83bV8N1X1x/zRA1TY59knNP92jLQkmuzwB9YKF0LWo
	dw7EZd1WM576WR0rOd8YZXCjwOWfK2Piw6avj7D5Nlt3FIPTjRRBgo+hjM1pNny2Rh/WTs9XdkW
	nK3ONzVbONFDvxXlkTP5u0Xmpbhbfw2wXsoo8AFlDUDDM0rI6QgBsmEp0HdrEVI+bAVa5VwZ17H
	2fFzZeieQB2hWmgIDbSKzkgi7PGiPm9sjzoHQZerwLoMc5S/MuWT4xDb+wvuq3hgZXP3ZHyq9Tj
	3+jCTiEoIrZyl5uCCfAznbadBUjr5SVM1O/StGSJ3FMKzVaZ69ED8oyDoZ80YTd+VwGO5eBxGEu
	oRx/8mjVMFp7usGhMgg==
X-Received: by 2002:a05:620a:8390:b0:7e3:28f3:893 with SMTP id af79cd13be357-7e3435ea1ffmr45800485a.35.1752612481034;
        Tue, 15 Jul 2025 13:48:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBLFxJa9jSwaBUo5QAp9PxCrGHJ6gmYYTz22qRCxD7RWkcjeXREbTUK+MG7ac/OvQT1814mQ==
X-Received: by 2002:a05:620a:8390:b0:7e3:28f3:893 with SMTP id af79cd13be357-7e3435ea1ffmr45795785a.35.1752612480472;
        Tue, 15 Jul 2025 13:48:00 -0700 (PDT)
Received: from trex.. (153.red-79-144-197.dynamicip.rima-tde.net. [79.144.197.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc2464sm16331877f8f.38.2025.07.15.13.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:47:59 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, konradybcio@kernel.org, mchehab@kernel.org,
        andersson@kernel.org, conor+dt@kernel.org,
        amit.kucheria@oss.qualcomm.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/7] media: venus: Add support for AR50_LITE video core
Date: Tue, 15 Jul 2025 22:47:45 +0200
Message-Id: <20250715204749.2189875-4-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=6876be82 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Ki5fnJvzvo7yLsyA0quaxQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=bko80PZImhyAhWnkyZcA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 3hIctRTHcE54Gt_1OdE82Tma05rbPXD7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE5MSBTYWx0ZWRfX94QwluulG8qt
 4IFEb5Vt5RIBIBWNaBpt4iHVZ+/J11Q1togFBIsy3xHXRbpM50opYr4aGCYdTXtnQZlmSIgM/0f
 NJtv5l5ITfazN94KLoEk8rspCEEamJxQ15l0hbqPWXVdOzFaS930fxiw0zSKTOS48vc7zYREWCP
 7gwl29f3sdUJtElaN1p0b+cxWD56hGomVmtqBNK9nMk0LziSmcnRlfYM7EQsbHbEn6DlgqLZBlE
 JBsl7A6TLAQjyUVrYa6nigFya9n2l/RgxxocMp2GO124bVVRsUlv+IOBys9YHBTgam/JGVmB6Ok
 7Le/4WNYItY6ELLx51WS30lkR4DeUBpi2opZYtnqvD7c8Mc1yf+zYMTcYn10jPiK4jMgEH0zK+I
 xOWqvfMynVJ3EVPS/RvM7xyvxo2QQkAJ59hYNkaPhVtFANyJfPaRIjZw4eQOgCkFrioj80n3
X-Proofpoint-ORIG-GUID: 3hIctRTHcE54Gt_1OdE82Tma05rbPXD7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_05,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150191

The AR50_LITE is a simplified variant of the AR50 video core, designed for
power and cost-efficient platforms.

It supports hardware-accelerated decoding of H.264, HEVC, and VP9 formats,
and provides encoding support for H.264 and HEVC.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c      | 15 +++++++--
 drivers/media/platform/qcom/venus/core.h      |  5 +++
 drivers/media/platform/qcom/venus/firmware.c  | 10 ++++++
 drivers/media/platform/qcom/venus/firmware.h  |  1 +
 drivers/media/platform/qcom/venus/helpers.c   | 30 +++++++++++++++--
 drivers/media/platform/qcom/venus/helpers.h   |  2 ++
 .../media/platform/qcom/venus/hfi_parser.c    |  5 +--
 .../media/platform/qcom/venus/hfi_platform.c  | 20 +++++++-----
 .../media/platform/qcom/venus/hfi_platform.h  | 25 ++++++++-------
 .../platform/qcom/venus/hfi_platform_v4.c     | 31 ++++++++++++------
 .../platform/qcom/venus/hfi_platform_v6.c     | 32 +++++++++++++------
 drivers/media/platform/qcom/venus/hfi_venus.c | 25 +++++++++++----
 .../media/platform/qcom/venus/hfi_venus_io.h  |  4 +++
 .../media/platform/qcom/venus/pm_helpers.c    |  2 +-
 drivers/media/platform/qcom/venus/vdec.c      |  7 +---
 15 files changed, 154 insertions(+), 60 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index b7d6745b6124..bad49f0b4a77 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -269,14 +269,19 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type,
 
 static void venus_assign_register_offsets(struct venus_core *core)
 {
-	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
-		core->vbif_base = core->base + VBIF_BASE;
+	if (IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
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
@@ -476,6 +481,10 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_firmware_deinit;
 
+	ret = venus_firmware_cfg(core);
+	if (ret)
+		goto err_venus_shutdown;
+
 	ret = hfi_core_resume(core, true);
 	if (ret)
 		goto err_venus_shutdown;
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 3af8386b78be..f5b59e81e3c2 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -538,6 +538,11 @@ struct venus_inst {
 #define IS_IRIS2(core)		((core)->res->vpu_version == VPU_VERSION_IRIS2)
 #define IS_IRIS2_1(core)	((core)->res->vpu_version == VPU_VERSION_IRIS2_1)
 
+static inline bool is_lite(struct venus_core *core)
+{
+	return IS_AR50_LITE(core);
+}
+
 #define ctrl_to_inst(ctrl)	\
 	container_of((ctrl)->handler, struct venus_inst, ctrl_handler)
 
diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 66a18830e66d..c74988fd5ce2 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -207,6 +207,16 @@ static int venus_shutdown_no_tz(struct venus_core *core)
 	return 0;
 }
 
+int venus_firmware_cfg(struct venus_core *core)
+{
+	void __iomem *cpu_cs_base = core->cpu_cs_base;
+
+	if (IS_AR50_LITE(core))
+		writel(CPU_CS_VCICMD_ARP_OFF, cpu_cs_base + CPU_CS_VCICMD);
+
+	return 0;
+}
+
 int venus_boot(struct venus_core *core)
 {
 	struct device *dev = core->dev;
diff --git a/drivers/media/platform/qcom/venus/firmware.h b/drivers/media/platform/qcom/venus/firmware.h
index aaccd847fa30..3fea4ab63bf7 100644
--- a/drivers/media/platform/qcom/venus/firmware.h
+++ b/drivers/media/platform/qcom/venus/firmware.h
@@ -9,6 +9,7 @@ struct device;
 
 int venus_firmware_init(struct venus_core *core);
 void venus_firmware_deinit(struct venus_core *core);
+int venus_firmware_cfg(struct venus_core *core);
 int venus_boot(struct venus_core *core);
 int venus_shutdown(struct venus_core *core);
 int venus_set_hw_state(struct venus_core *core, bool suspend);
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 8295542e1a7c..438ed1abd8e8 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -230,6 +230,24 @@ int venus_helper_alloc_dpb_bufs(struct venus_inst *inst)
 }
 EXPORT_SYMBOL_GPL(venus_helper_alloc_dpb_bufs);
 
+void venus_helper_prepare_eos_data(struct venus_inst *inst,
+				   struct hfi_frame_data *data)
+{
+	struct venus_core *core = inst->core;
+
+	data->buffer_type = HFI_BUFFER_INPUT;
+	data->flags = HFI_BUFFERFLAG_EOS;
+
+	if (IS_V6(core) && is_fw_rev_or_older(core, 1, 0, 87))
+		return;
+
+	if (IS_V4(core) && is_lite(core) && is_fw_rev_or_older(core, 6, 0, 53))
+		data->alloc_len = 1;
+
+	data->device_addr = 0xdeadb000;
+}
+EXPORT_SYMBOL_GPL(venus_helper_prepare_eos_data);
+
 static int intbufs_set_buffer(struct venus_inst *inst, u32 type)
 {
 	struct venus_core *core = inst->core;
@@ -1715,11 +1733,17 @@ int venus_helper_session_init(struct venus_inst *inst)
 	if (ret)
 		return ret;
 
-	inst->clk_data.vpp_freq = hfi_platform_get_codec_vpp_freq(version, codec,
+	inst->clk_data.vpp_freq = hfi_platform_get_codec_vpp_freq(version,
+								  is_lite(inst->core),
+								  codec,
 								  session_type);
-	inst->clk_data.vsp_freq = hfi_platform_get_codec_vsp_freq(version, codec,
+	inst->clk_data.vsp_freq = hfi_platform_get_codec_vsp_freq(version,
+								  is_lite(inst->core),
+								  codec,
 								  session_type);
-	inst->clk_data.low_power_freq = hfi_platform_get_codec_lp_freq(version, codec,
+	inst->clk_data.low_power_freq = hfi_platform_get_codec_lp_freq(version,
+								       is_lite(inst->core),
+								       codec,
 								       session_type);
 
 	return 0;
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index 358e4f39c9c0..62a734c1da1d 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -58,6 +58,8 @@ int venus_helper_get_out_fmts(struct venus_inst *inst, u32 fmt, u32 *out_fmt,
 bool venus_helper_check_format(struct venus_inst *inst, u32 v4l2_pixfmt);
 int venus_helper_alloc_dpb_bufs(struct venus_inst *inst);
 int venus_helper_free_dpb_bufs(struct venus_inst *inst);
+void venus_helper_prepare_eos_data(struct venus_inst *inst,
+				   struct hfi_frame_data *data);
 int venus_helper_intbufs_alloc(struct venus_inst *inst);
 int venus_helper_intbufs_free(struct venus_inst *inst);
 int venus_helper_intbufs_realloc(struct venus_inst *inst);
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 1b3db2caa99f..55cee1c786a0 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -277,12 +277,13 @@ static int hfi_platform_parser(struct venus_core *core, struct venus_inst *inst)
 	if (inst)
 		return 0;
 
-	ret = hfi_platform_get_codecs(core, &enc_codecs, &dec_codecs, &count);
+	ret = hfi_platform_get_codecs(core, &enc_codecs, &dec_codecs, &count,
+				      is_lite(core));
 	if (ret)
 		return ret;
 
 	if (plat->capabilities)
-		caps = plat->capabilities(&entries);
+		caps = plat->capabilities(&entries, is_lite(core));
 
 	if (!caps || !entries || !count)
 		return -EINVAL;
diff --git a/drivers/media/platform/qcom/venus/hfi_platform.c b/drivers/media/platform/qcom/venus/hfi_platform.c
index 643e5aa138f5..c6c248561793 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform.c
@@ -21,7 +21,8 @@ const struct hfi_platform *hfi_platform_get(enum hfi_version version)
 }
 
 unsigned long
-hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec, u32 session_type)
+hfi_platform_get_codec_vpp_freq(enum hfi_version version, bool lite, u32 codec,
+				u32 session_type)
 {
 	const struct hfi_platform *plat;
 	unsigned long freq = 0;
@@ -31,13 +32,14 @@ hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec, u32 session
 		return 0;
 
 	if (plat->codec_vpp_freq)
-		freq = plat->codec_vpp_freq(session_type, codec);
+		freq = plat->codec_vpp_freq(session_type, codec, lite);
 
 	return freq;
 }
 
 unsigned long
-hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 codec, u32 session_type)
+hfi_platform_get_codec_vsp_freq(enum hfi_version version, bool lite, u32 codec,
+				u32 session_type)
 {
 	const struct hfi_platform *plat;
 	unsigned long freq = 0;
@@ -47,13 +49,14 @@ hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 codec, u32 session
 		return 0;
 
 	if (plat->codec_vpp_freq)
-		freq = plat->codec_vsp_freq(session_type, codec);
+		freq = plat->codec_vsp_freq(session_type, codec, lite);
 
 	return freq;
 }
 
 unsigned long
-hfi_platform_get_codec_lp_freq(enum hfi_version version, u32 codec, u32 session_type)
+hfi_platform_get_codec_lp_freq(enum hfi_version version, bool lite, u32 codec,
+			       u32 session_type)
 {
 	const struct hfi_platform *plat;
 	unsigned long freq = 0;
@@ -63,13 +66,14 @@ hfi_platform_get_codec_lp_freq(enum hfi_version version, u32 codec, u32 session_
 		return 0;
 
 	if (plat->codec_lp_freq)
-		freq = plat->codec_lp_freq(session_type, codec);
+		freq = plat->codec_lp_freq(session_type, codec, lite);
 
 	return freq;
 }
 
 int
-hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs, u32 *dec_codecs, u32 *count)
+hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs, u32 *dec_codecs, u32 *count,
+			bool lite)
 {
 	const struct hfi_platform *plat;
 
@@ -78,7 +82,7 @@ hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs, u32 *dec_codec
 		return -EINVAL;
 
 	if (plat->codecs)
-		plat->codecs(enc_codecs, dec_codecs, count);
+		plat->codecs(enc_codecs, dec_codecs, count, lite);
 
 	if (IS_IRIS2_1(core)) {
 		*enc_codecs &= ~HFI_VIDEO_CODEC_VP8;
diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
index ec89a90a8129..a9f1ead18084 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform.h
+++ b/drivers/media/platform/qcom/venus/hfi_platform.h
@@ -47,11 +47,12 @@ struct hfi_platform_codec_freq_data {
 };
 
 struct hfi_platform {
-	unsigned long (*codec_vpp_freq)(u32 session_type, u32 codec);
-	unsigned long (*codec_vsp_freq)(u32 session_type, u32 codec);
-	unsigned long (*codec_lp_freq)(u32 session_type, u32 codec);
-	void (*codecs)(u32 *enc_codecs, u32 *dec_codecs, u32 *count);
-	const struct hfi_plat_caps *(*capabilities)(unsigned int *entries);
+	unsigned long (*codec_vpp_freq)(u32 session_type, u32 codec, bool lite);
+	unsigned long (*codec_vsp_freq)(u32 session_type, u32 codec, bool lite);
+	unsigned long (*codec_lp_freq)(u32 session_type, u32 codec, bool lite);
+	void (*codecs)(u32 *enc_codecs, u32 *dec_codecs, u32 *count, bool lite);
+	const struct hfi_plat_caps *(*capabilities)(unsigned int *entries,
+						    bool lite);
 	int (*bufreq)(struct hfi_plat_buffers_params *params, u32 session_type,
 		      u32 buftype, struct hfi_buffer_requirements *bufreq);
 };
@@ -60,12 +61,12 @@ extern const struct hfi_platform hfi_plat_v4;
 extern const struct hfi_platform hfi_plat_v6;
 
 const struct hfi_platform *hfi_platform_get(enum hfi_version version);
-unsigned long hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec,
-					      u32 session_type);
-unsigned long hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 codec,
-					      u32 session_type);
-unsigned long hfi_platform_get_codec_lp_freq(enum hfi_version version, u32 codec,
-					     u32 session_type);
+unsigned long hfi_platform_get_codec_vpp_freq(enum hfi_version version, bool lite,
+					      u32 codec, u32 session_type);
+unsigned long hfi_platform_get_codec_vsp_freq(enum hfi_version version, bool lite,
+					      u32 codec, u32 session_type);
+unsigned long hfi_platform_get_codec_lp_freq(enum hfi_version version, bool lite,
+					     u32 codec, u32 session_type);
 int hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs, u32 *dec_codecs,
-			    u32 *count);
+			    u32 *count, bool lite);
 #endif
diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v4.c b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
index e3f0a90a567b..4ae7ed476c48 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform_v4.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
@@ -245,14 +245,19 @@ static const struct hfi_plat_caps caps[] = {
 	.num_fmts = 4,
 } };
 
-static const struct hfi_plat_caps *get_capabilities(unsigned int *entries)
+static const struct hfi_plat_caps *get_capabilities(unsigned int *entries,
+						    bool lite)
 {
+	WARN_ON(lite);
+
 	*entries = ARRAY_SIZE(caps);
 	return caps;
 }
 
-static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count)
+static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count, bool lite)
 {
+	WARN_ON(lite);
+
 	*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
 		      HFI_VIDEO_CODEC_VP8;
 	*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
@@ -273,12 +278,14 @@ static const struct hfi_platform_codec_freq_data codec_freq_data[] =  {
 };
 
 static const struct hfi_platform_codec_freq_data *
-get_codec_freq_data(u32 session_type, u32 pixfmt)
+get_codec_freq_data(u32 session_type, u32 pixfmt, bool lite)
 {
 	const struct hfi_platform_codec_freq_data *data = codec_freq_data;
 	unsigned int i, data_size = ARRAY_SIZE(codec_freq_data);
 	const struct hfi_platform_codec_freq_data *found = NULL;
 
+	WARN_ON(lite);
+
 	for (i = 0; i < data_size; i++) {
 		if (data[i].pixfmt == pixfmt && data[i].session_type == session_type) {
 			found = &data[i];
@@ -289,33 +296,39 @@ get_codec_freq_data(u32 session_type, u32 pixfmt)
 	return found;
 }
 
-static unsigned long codec_vpp_freq(u32 session_type, u32 codec)
+static unsigned long codec_vpp_freq(u32 session_type, u32 codec, bool lite)
 {
 	const struct hfi_platform_codec_freq_data *data;
 
-	data = get_codec_freq_data(session_type, codec);
+	WARN_ON(lite);
+
+	data = get_codec_freq_data(session_type, codec, lite);
 	if (data)
 		return data->vpp_freq;
 
 	return 0;
 }
 
-static unsigned long codec_vsp_freq(u32 session_type, u32 codec)
+static unsigned long codec_vsp_freq(u32 session_type, u32 codec, bool lite)
 {
 	const struct hfi_platform_codec_freq_data *data;
 
-	data = get_codec_freq_data(session_type, codec);
+	WARN_ON(lite);
+
+	data = get_codec_freq_data(session_type, codec, lite);
 	if (data)
 		return data->vsp_freq;
 
 	return 0;
 }
 
-static unsigned long codec_lp_freq(u32 session_type, u32 codec)
+static unsigned long codec_lp_freq(u32 session_type, u32 codec, bool lite)
 {
 	const struct hfi_platform_codec_freq_data *data;
 
-	data = get_codec_freq_data(session_type, codec);
+	WARN_ON(lite);
+
+	data = get_codec_freq_data(session_type, codec, lite);
 	if (data)
 		return data->low_power_freq;
 
diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v6.c b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
index 4e8af645f8b9..ad08d26cd7ba 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform_v6.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
@@ -245,14 +245,20 @@ static const struct hfi_plat_caps caps[] = {
 	.num_fmts = 4,
 } };
 
-static const struct hfi_plat_caps *get_capabilities(unsigned int *entries)
+static const struct hfi_plat_caps *get_capabilities(unsigned int *entries,
+						    bool lite)
 {
+	WARN_ON(lite);
+
 	*entries = ARRAY_SIZE(caps);
 	return caps;
 }
 
-static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count)
+static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count,
+		       bool lite)
 {
+	WARN_ON(lite);
+
 	*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
 		      HFI_VIDEO_CODEC_VP8;
 	*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
@@ -273,12 +279,14 @@ static const struct hfi_platform_codec_freq_data codec_freq_data[] = {
 };
 
 static const struct hfi_platform_codec_freq_data *
-get_codec_freq_data(u32 session_type, u32 pixfmt)
+get_codec_freq_data(u32 session_type, u32 pixfmt, bool lite)
 {
 	const struct hfi_platform_codec_freq_data *data = codec_freq_data;
 	unsigned int i, data_size = ARRAY_SIZE(codec_freq_data);
 	const struct hfi_platform_codec_freq_data *found = NULL;
 
+	WARN_ON(lite);
+
 	for (i = 0; i < data_size; i++) {
 		if (data[i].pixfmt == pixfmt && data[i].session_type == session_type) {
 			found = &data[i];
@@ -289,33 +297,39 @@ get_codec_freq_data(u32 session_type, u32 pixfmt)
 	return found;
 }
 
-static unsigned long codec_vpp_freq(u32 session_type, u32 codec)
+static unsigned long codec_vpp_freq(u32 session_type, u32 codec, bool lite)
 {
 	const struct hfi_platform_codec_freq_data *data;
 
-	data = get_codec_freq_data(session_type, codec);
+	WARN_ON(lite);
+
+	data = get_codec_freq_data(session_type, codec, lite);
 	if (data)
 		return data->vpp_freq;
 
 	return 0;
 }
 
-static unsigned long codec_vsp_freq(u32 session_type, u32 codec)
+static unsigned long codec_vsp_freq(u32 session_type, u32 codec, bool lite)
 {
 	const struct hfi_platform_codec_freq_data *data;
 
-	data = get_codec_freq_data(session_type, codec);
+	WARN_ON(lite);
+
+	data = get_codec_freq_data(session_type, codec, lite);
 	if (data)
 		return data->vsp_freq;
 
 	return 0;
 }
 
-static unsigned long codec_lp_freq(u32 session_type, u32 codec)
+static unsigned long codec_lp_freq(u32 session_type, u32 codec, bool lite)
 {
 	const struct hfi_platform_codec_freq_data *data;
 
-	data = get_codec_freq_data(session_type, codec);
+	WARN_ON(lite);
+
+	data = get_codec_freq_data(session_type, codec, lite);
 	if (data)
 		return data->low_power_freq;
 
diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index cec7f5964d3d..d3da35f67fd5 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -380,7 +380,7 @@ static void venus_soft_int(struct venus_hfi_device *hdev)
 	void __iomem *cpu_ic_base = hdev->core->cpu_ic_base;
 	u32 clear_bit;
 
-	if (IS_V6(hdev->core))
+	if (IS_V6(hdev->core) || (IS_V4(hdev->core) && is_lite(hdev->core)))
 		clear_bit = BIT(CPU_IC_SOFTINT_H2A_SHIFT_V6);
 	else
 		clear_bit = BIT(CPU_IC_SOFTINT_H2A_SHIFT);
@@ -501,9 +501,11 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
 	if (count >= max_tries)
 		ret = -ETIMEDOUT;
 
-	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core)) {
+	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core)) {
 		writel(0x1, cpu_cs_base + CPU_CS_H2XSOFTINTEN_V6);
-		writel(0x0, cpu_cs_base + CPU_CS_X2RPMH_V6);
+
+		if (!IS_AR50_LITE(hdev->core))
+			writel(0x0, cpu_cs_base + CPU_CS_X2RPMH_V6);
 	}
 
 	return ret;
@@ -569,6 +571,9 @@ static int venus_halt_axi(struct venus_hfi_device *hdev)
 	u32 mask_val;
 	int ret;
 
+	if (IS_AR50_LITE(hdev->core))
+		return 0;
+
 	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core)) {
 		writel(0x3, cpu_cs_base + CPU_CS_X2RPMH_V6);
 
@@ -1138,7 +1143,13 @@ static irqreturn_t venus_isr(struct venus_core *core)
 	wrapper_base = hdev->core->wrapper_base;
 
 	status = readl(wrapper_base + WRAPPER_INTR_STATUS);
-	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
+
+	if (IS_AR50_LITE(core)) {
+		if (status & WRAPPER_INTR_STATUS_A2H_MASK ||
+		    status & WRAPPER_INTR_STATUS_A2HWD_MASK_V4_LITE ||
+		    status & CPU_CS_SCIACMDARG0_INIT_IDLE_MSG_MASK)
+			hdev->irq_status = status;
+	} else if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
 		if (status & WRAPPER_INTR_STATUS_A2H_MASK ||
 		    status & WRAPPER_INTR_STATUS_A2HWD_MASK_V6 ||
 		    status & CPU_CS_SCIACMDARG0_INIT_IDLE_MSG_MASK)
@@ -1150,7 +1161,7 @@ static irqreturn_t venus_isr(struct venus_core *core)
 			hdev->irq_status = status;
 	}
 	writel(1, cpu_cs_base + CPU_CS_A2HSOFTINTCLR);
-	if (!(IS_IRIS2(core) || IS_IRIS2_1(core)))
+	if (!(IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)))
 		writel(status, wrapper_base + WRAPPER_INTR_CLEAR);
 
 	return IRQ_WAKE_THREAD;
@@ -1535,7 +1546,7 @@ static bool venus_cpu_and_video_core_idle(struct venus_hfi_device *hdev)
 	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
 	u32 ctrl_status, cpu_status;
 
-	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core))
+	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core))
 		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
 	else
 		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
@@ -1555,7 +1566,7 @@ static bool venus_cpu_idle_and_pc_ready(struct venus_hfi_device *hdev)
 	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
 	u32 ctrl_status, cpu_status;
 
-	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core))
+	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core))
 		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
 	else
 		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
diff --git a/drivers/media/platform/qcom/venus/hfi_venus_io.h b/drivers/media/platform/qcom/venus/hfi_venus_io.h
index 9735a246ce36..f2c3064c44ae 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus_io.h
+++ b/drivers/media/platform/qcom/venus/hfi_venus_io.h
@@ -51,6 +51,9 @@
 /* Venus cpu */
 #define CPU_CS_SCIACMDARG3			0x58
 
+#define CPU_CS_VCICMD				0x20
+#define CPU_CS_VCICMD_ARP_OFF			BIT(0)
+
 #define SFR_ADDR				0x5c
 #define MMAP_ADDR				0x60
 #define UC_REGION_ADDR				0x64
@@ -100,6 +103,7 @@
 #define WRAPPER_INTR_MASK_A2HCPU_MASK		0x4
 #define WRAPPER_INTR_MASK_A2HCPU_SHIFT		0x2
 
+#define WRAPPER_INTR_STATUS_A2HWD_MASK_V4_LITE	0x10
 #define WRAPPER_INTR_STATUS_A2HWD_MASK_V6	0x8
 #define WRAPPER_INTR_MASK_A2HWD_BASK_V6		0x8
 
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 8dd5a9b0d060..e09b0d9ae610 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -51,7 +51,7 @@ static int core_clks_enable(struct venus_core *core)
 	dev_pm_opp_put(opp);
 
 	for (i = 0; i < res->clks_num; i++) {
-		if (IS_V6(core)) {
+		if (IS_V6(core) || (IS_V4(core) && is_lite(core))) {
 			ret = clk_set_rate(core->clks[i], freq);
 			if (ret)
 				goto err;
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 29b0d6a5303d..ac3d2760b2e0 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -565,12 +565,7 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
 		if (!(inst->streamon_out && inst->streamon_cap))
 			goto unlock;
 
-		fdata.buffer_type = HFI_BUFFER_INPUT;
-		fdata.flags |= HFI_BUFFERFLAG_EOS;
-		if (IS_V6(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87))
-			fdata.device_addr = 0;
-		else
-			fdata.device_addr = 0xdeadb000;
+		venus_helper_prepare_eos_data(inst, &fdata);
 
 		ret = hfi_session_process_buf(inst, &fdata);
 
-- 
2.34.1


