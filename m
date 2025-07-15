Return-Path: <linux-arm-msm+bounces-65095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA6DB067F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 22:48:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5069160F6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 20:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE78F2C0323;
	Tue, 15 Jul 2025 20:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o+zgH/7f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E9A26FA50
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 20:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752612483; cv=none; b=ZHh29aDGSuLIMnV5M7Z+bEgJCFU5oFBvUUp3C5jH1PzGE6bzphhllINN6meGxN1zCfzbPb/h7U1zw7Uj8GF6rUS7WPalqVdL2vEQawR+4M4ipkHDjHkE8+2RyTvUMTC2UddaPi+znPX3c5l/LNfKqqLWTia+Q5k/0nPQ5vClmyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752612483; c=relaxed/simple;
	bh=JLxRVXQhon6gxubKoqqTIwexA1gN3xO3FmETcqxOKgc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ely2EMkVRTZdEjYb4C4W8xrHGrghzE8YEMCI2f9Zb3rjAh3vMfU3B2RaeKBkBV+4rUHJLiJwvXhhrH4/1tJauUBScs7WxBFALIXONp9hJOY2jGmWFQpVYI6jvvAaVhx98KPRCVtQgEgVjClnJST5mxEYSxExRY6NnPeW7F1kOQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o+zgH/7f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGD9RX022700
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 20:48:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xqIJdlz4cKk
	IgtCaMYekqr5WxjgSE1e16/qhi8p04Sw=; b=o+zgH/7fycK1TVAMJXWmkfNwBy0
	h69KVQRJBljc18REs+OJPqGYzcODG36GRBHWehfc5v/BNsFFaO89i0BC1IReJPhF
	QzojPvXA3jrJnuYs+PP783ieM+Q9XO+/FXzGg4sotcJvScajfMBH548KuLt1zXGb
	B7rOQsBgdMEmD0uosc57JziQK5KO7a63ouuazVe6DxFG0dy8EUtQhZb1KuUiU4zY
	V3zp48386+zU9VeU+GdzsdY9llxUKBOqAqphbDW5XEDc9e0FeS197PzrTjzyYSdb
	Vo5UIRLytzGHfTxpM5k9nFeOXACisBj/qZe4+c1NmgB/FUwGjNMSydOrv0g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wkruj7tn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 20:48:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e278d83457so418692585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 13:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752612479; x=1753217279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xqIJdlz4cKkIgtCaMYekqr5WxjgSE1e16/qhi8p04Sw=;
        b=cBa21DK+fhIokqicZkbwU3zuWY4sIM/vakCfSWGq9gmuZgiOFNrHKkZWq+Fi5KNUY2
         3wn2vD5X+zvC1DELD2XWFWkypasWiRN85h1HMismk1U+VZZQmO0OpANDpEu2iX5Uh68c
         bXbnv5gh8azIEFsSzq/F7ShvDr6fEn9GEGsxi0QKkLwPz0oEhvzDkZOqojvo/AsCpHv5
         pjdHSkW2TwztiWOEoNSH5Pe8HhIMLbanItr21WQC2iyXj33d2KGvAgIwGeTtd6qp9Ufj
         us8zuXTB94pzIbHQ5t0ptvvtNivi1Cvsu/uj5mbKdjDKMhzFjGTId5MGRQ/xrenyktvU
         F47A==
X-Forwarded-Encrypted: i=1; AJvYcCXteY6zYhZr1lYWy2mARyD7MPHtwFkgfw1zedErxBdpTsjgRbGuehoeFH3favbzSrKowCjFKkUJGGGnqFNs@vger.kernel.org
X-Gm-Message-State: AOJu0YwhSTTJvBGlLi96E9lCOt86Iuw2rUCTgZChagdf95VeNlxqqyTC
	hYA9RJJ+IikTtvA7f0gdo+fOrIl8zQpkM3afipZc5ob33fEAttgNu6HshKvAqGz63xpszbrJMBE
	uAei4VF5+/QF/DlxXrQ/byWwm0otmai9NR0cGXLYkrEOOTSHYjLEsgu68o4FfCIhIL3B3
X-Gm-Gg: ASbGnctlnUcoNFrcGL7cbAT13gzEFd1TzMji2CoJbG6c9edp6YEKqTXoYUO0CY3D9Nw
	vheRb2XxikcPed17WlJ+xoirSXhEZvZYkVEUO+OcN8IMg3gHgxaIAHVMwb+BBKZI+qePRMhdg7g
	QICTG9CySzHh/PNFQVfFQDPIftsQZPm8+qaxyR+vZWLKzI7DGY3ZNWaWUrU6D/9JbZ0hlpA1E0x
	656t2rI4f/5zZbUcBOP8cU0fQ85imcriJUfCqTvCFTogIHTLOhIn82iIEiqoRZN6oSUYmYeXTXz
	tkdk2NaC8Y2/0YsSlieVCe5Y1Z1SIeygAv0vKaX1zhSrzyBHM88zWqAO9dxnmmClSkAvvvgKPXf
	6xLi4MCXRcpdVWe0cKg==
X-Received: by 2002:a05:620a:1b9b:b0:7e0:cb93:6fb1 with SMTP id af79cd13be357-7e3433511a5mr45660785a.9.1752612479327;
        Tue, 15 Jul 2025 13:47:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3uztf4eAZmDM24bnWWjsOEqyZP7OJqBLki+Bu0uvZ5eYMZGFNWgaXX9r3S8S4GW0aowWycQ==
X-Received: by 2002:a05:620a:1b9b:b0:7e0:cb93:6fb1 with SMTP id af79cd13be357-7e3433511a5mr45658385a.9.1752612478892;
        Tue, 15 Jul 2025 13:47:58 -0700 (PDT)
Received: from trex.. (153.red-79-144-197.dynamicip.rima-tde.net. [79.144.197.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc2464sm16331877f8f.38.2025.07.15.13.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:47:58 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, konradybcio@kernel.org, mchehab@kernel.org,
        andersson@kernel.org, conor+dt@kernel.org,
        amit.kucheria@oss.qualcomm.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/7] media: venus: Conditionally register codec nodes based on firmware version
Date: Tue, 15 Jul 2025 22:47:44 +0200
Message-Id: <20250715204749.2189875-3-jorge.ramirez@oss.qualcomm.com>
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
X-Proofpoint-GUID: wImFjtKyA9xUrEgpV8wgYYhLRerxyeRj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE5MSBTYWx0ZWRfX1oXuPl8/5wsS
 O6QuWj4U4G/ICMShlvX7dxjCMkW/RG62qRJrCa/honH+Vr9kv8tQgn5Q5xzm7r+4HIILwKI/RS1
 l5hvvG7mcw1mvbxjfEUGmJVbAMkiBz7rJnVZtsBq/+3amlxUEZ9oceq0P43Og+DHc1AGi+xVD1s
 gxTzazbkv3bLWIn7XzFRQR986zwfLuFCD/Xi5UrbNpfMpOuiZq/AfpDqCxzM3TkEIFEpHbyw2iG
 LthNkB2GGqfbmHNwegYnDFfQiL8IXLl6bjFf9AtFY/J87OKX+GmQtnJRQbq+4VIbNH3nfwcrKDN
 DlRItlorjGLx7utepBZnKVG4p+k4vEC4BvGFQFKIbU6I2tbTgODNz0SZDre/FFt7gV6H40RAfhi
 x+weabixLhUyZtDOReElWr1uZpbJPuVTB7/fH13+4zgHFkQd3WjgRM8WRbeAMks9VzPdyKlr
X-Authority-Analysis: v=2.4 cv=WqUrMcfv c=1 sm=1 tr=0 ts=6876be80 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Ki5fnJvzvo7yLsyA0quaxQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=b6RcsaAH2Bz4aJime2YA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: wImFjtKyA9xUrEgpV8wgYYhLRerxyeRj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_05,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150191

The encoding and decoding capabilities of a VPU can vary depending on the
firmware version in use.

This commit adds support for platforms with OF_DYNAMIC enabled to
conditionally skip the creation of codec device nodes at runtime if the
loaded firmware does not support the corresponding functionality.

Note that the driver becomes aware of the firmware version only after the
HFI layer has been initialized.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 76 +++++++++++++++---------
 drivers/media/platform/qcom/venus/core.h |  8 +++
 2 files changed, 57 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 4c049c694d9c..b7d6745b6124 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -28,6 +28,15 @@
 #include "pm_helpers.h"
 #include "hfi_venus_io.h"
 
+static inline bool venus_fw_supports_codec(struct venus_core *core,
+					   const struct venus_min_fw *ver)
+{
+	if (!ver)
+		return true;
+
+	return is_fw_rev_or_newer(core, ver->major, ver->minor, ver->rev);
+}
+
 static void venus_coredump(struct venus_core *core)
 {
 	struct device *dev;
@@ -103,7 +112,9 @@ static void venus_sys_error_handler(struct work_struct *work)
 	core->state = CORE_UNINIT;
 
 	for (i = 0; i < max_attempts; i++) {
-		if (!pm_runtime_active(core->dev_dec) && !pm_runtime_active(core->dev_enc))
+		/* Not both nodes might be available */
+		if ((!core->dev_dec || !pm_runtime_active(core->dev_dec)) &&
+		    (!core->dev_enc || !pm_runtime_active(core->dev_enc)))
 			break;
 		msleep(10);
 	}
@@ -202,7 +213,8 @@ static u32 to_v4l2_codec_type(u32 codec)
 	}
 }
 
-static int venus_enumerate_codecs(struct venus_core *core, u32 type)
+static int venus_enumerate_codecs(struct venus_core *core, u32 type,
+				  const struct venus_min_fw *ver)
 {
 	const struct hfi_inst_ops dummy_ops = {};
 	struct venus_inst *inst;
@@ -213,6 +225,9 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type)
 	if (core->res->hfi_version != HFI_VERSION_1XX)
 		return 0;
 
+	if (!venus_fw_supports_codec(core, ver))
+		return 0;
+
 	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
 	if (!inst)
 		return -ENOMEM;
@@ -288,14 +303,14 @@ static irqreturn_t venus_isr_thread(int irq, void *dev_id)
 
 #if defined(CONFIG_OF_DYNAMIC)
 static int venus_add_video_core(struct venus_core *core, const char *node_name,
-				const char *compat)
+				const char *compat, const struct venus_min_fw *ver)
 {
 	struct of_changeset *ocs = core->ocs;
 	struct device *dev = core->dev;
 	struct device_node *np, *enp;
 	int ret;
 
-	if (!node_name)
+	if (!node_name || !venus_fw_supports_codec(core, ver))
 		return 0;
 
 	enp = of_find_node_by_name(dev->of_node, node_name);
@@ -330,11 +345,13 @@ static int venus_add_dynamic_nodes(struct venus_core *core)
 
 	of_changeset_init(core->ocs);
 
-	ret = venus_add_video_core(core, core->res->dec_nodename, "venus-decoder");
+	ret = venus_add_video_core(core, core->res->dec_nodename, "venus-decoder",
+				   core->res->dec_minfw);
 	if (ret)
 		goto err;
 
-	ret = venus_add_video_core(core, core->res->enc_nodename, "venus-encoder");
+	ret = venus_add_video_core(core, core->res->enc_nodename, "venus-encoder",
+				   core->res->enc_minfw);
 	if (ret)
 		goto err;
 
@@ -363,6 +380,9 @@ static void venus_remove_dynamic_nodes(struct venus_core *core)
 #else
 static int venus_add_dynamic_nodes(struct venus_core *core)
 {
+	WARN_ONCE(core->res->enc_minfw || core->res->dec_minfw,
+		  "Feature not supported");
+
 	return 0;
 }
 
@@ -432,7 +452,7 @@ static int venus_probe(struct platform_device *pdev)
 					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
 					"venus", core);
 	if (ret)
-		goto err_core_put;
+		goto err_hfi_destroy;
 
 	venus_assign_register_offsets(core);
 
@@ -448,19 +468,9 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_runtime_disable;
 
-	if (core->res->dec_nodename || core->res->enc_nodename) {
-		ret = venus_add_dynamic_nodes(core);
-		if (ret)
-			goto err_runtime_disable;
-	}
-
-	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
-	if (ret)
-		goto err_remove_dynamic_nodes;
-
 	ret = venus_firmware_init(core);
 	if (ret)
-		goto err_of_depopulate;
+		goto err_runtime_disable;
 
 	ret = venus_boot(core);
 	if (ret)
@@ -474,34 +484,46 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_venus_shutdown;
 
-	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_DEC);
+	if (core->res->dec_nodename || core->res->enc_nodename) {
+		ret = venus_add_dynamic_nodes(core);
+		if (ret)
+			goto err_core_deinit;
+	}
+
+	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
 	if (ret)
-		goto err_core_deinit;
+		goto err_remove_dynamic_nodes;
+
+	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_DEC,
+				     core->res->dec_minfw);
+	if (ret)
+		goto err_of_depopulate;
 
-	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_ENC);
+	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_ENC,
+				     core->res->enc_minfw);
 	if (ret)
-		goto err_core_deinit;
+		goto err_of_depopulate;
 
 	ret = pm_runtime_put_sync(dev);
 	if (ret) {
 		pm_runtime_get_noresume(dev);
-		goto err_core_deinit;
+		goto err_of_depopulate;
 	}
 
 	venus_dbgfs_init(core);
 
 	return 0;
 
+err_of_depopulate:
+	of_platform_depopulate(dev);
+err_remove_dynamic_nodes:
+	venus_remove_dynamic_nodes(core);
 err_core_deinit:
 	hfi_core_deinit(core, false);
 err_venus_shutdown:
 	venus_shutdown(core);
 err_firmware_deinit:
 	venus_firmware_deinit(core);
-err_of_depopulate:
-	of_platform_depopulate(dev);
-err_remove_dynamic_nodes:
-	venus_remove_dynamic_nodes(core);
 err_runtime_disable:
 	pm_runtime_put_noidle(dev);
 	pm_runtime_disable(dev);
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 5b1ba1c69adb..3af8386b78be 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -50,6 +50,12 @@ struct bw_tbl {
 	u32 peak_10bit;
 };
 
+struct venus_min_fw {
+	u32 major;
+	u32 minor;
+	u32 rev;
+};
+
 enum vpu_version {
 	VPU_VERSION_AR50,
 	VPU_VERSION_AR50_LITE,
@@ -92,6 +98,8 @@ struct venus_resources {
 	u32 cp_nonpixel_start;
 	u32 cp_nonpixel_size;
 	const char *fwname;
+	const struct venus_min_fw *enc_minfw;
+	const struct venus_min_fw *dec_minfw;
 	const char *enc_nodename;
 	const char *dec_nodename;
 };
-- 
2.34.1


