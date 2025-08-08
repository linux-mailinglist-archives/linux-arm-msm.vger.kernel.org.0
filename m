Return-Path: <linux-arm-msm+bounces-68084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8A4B1E4B2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 10:49:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFD7B7A80DF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 08:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1B1E267B92;
	Fri,  8 Aug 2025 08:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bE6qbnvH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F06223337
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Aug 2025 08:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754642975; cv=none; b=uWpYSBoarf/kI7Nsrklo06/dQPc17m6Av3h6sRy9vrGWTSwOMQBqyx8wffwXNu4xtlOrZ4eHxd1pKHDzF4utyWEjE68cXHZCXpssGgvUAQfPbF7ef8H94QgZpK1zG3qKLzmHWkY+CWKPdY2F+F2xgRt83fO3dbWrrxsbQr8aRaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754642975; c=relaxed/simple;
	bh=86PLTqk8gjY11xMPb1ytqtbNlgq74lMq8dDdY25h1Es=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uo1+O8ww0Dp3Bxf9Y0rHMLjHyHGsiEEHszukmI1v6CnjKBe4F1L4wo4DPjCCl06zi9Wh7o+xx2GjbJFaI/KWaWw6CXDTMNTl2YuZFyRFiufrjVnErPqTjk9M4HJWUGduoWPCK+jqSIP82C4iVFQIU6prtsx9EOjFTB+4JrKbSSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bE6qbnvH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578724jY022646
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 Aug 2025 08:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LWjsBg1VVIO
	yEmDu+biLKzIOgFeO6f57DCN9nQYGCOQ=; b=bE6qbnvHgIiv3MDD6g/4XexqKuw
	6UqnD2fKMngjehHx8Yh60kgEVCB2gAKuICAd2rpMxEFDrhQJ/pANNJjRWs1kzZFA
	mpX05wfGjcr39vHGcFeNgxnuGCs9/qsAPwM1d3U6lw8ybi5b8Zf2rHhwMShT/lWh
	hbvCkmYy8PVZStK5htde1UBE129eKsKOhFuFHAYc4CrvsvH1Tjpvh2r/EpbNM6dp
	HlD4GzQdYzUvfrm+olpD3uednFnq+Ama0tfoWKxdcq0hKYFxTPJ/F9NYsjtllv9p
	4ZHgbQpiqkaKmbaE/gnJcIDUziSiMpvixli07PJVLsKFvL4xJpGV5m0sngQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48cs5nbnec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 08:49:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b08a2b3e83so52077681cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 01:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754642972; x=1755247772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWjsBg1VVIOyEmDu+biLKzIOgFeO6f57DCN9nQYGCOQ=;
        b=kw0AfriecV4EmLCAiyec2JVjulEhbqxRdPJLA2xhiFjhLehdioMo+0o+xBtULoDsy7
         Voo051bVABqjAeAXNmwxpoJZa0fY/dtrk73wY2B88lsVj0QVMsjPCq/UqqWvbGOZvq/W
         hDh9Yw+DCI2AlKep8CjmdQLaFvGt3cTDAZyf6TMp8KNI8HpA+NGGfoNiSlvt/zQW8Y4M
         oVXHvWGu0wPj13FNc+SaXIcUUMzsV14Ej5VfpCF1m8m+lm4vDDu0DrXeICn3thj3gBvL
         9KUzBENhRMStAxvfCFmrtRIspSg5bxu/dcU8/jSP/1b6B8U/BQpp3yFaQEhdAT+II4yh
         9Dkg==
X-Gm-Message-State: AOJu0Yx/JYDISOFVPRTebPMqBcwqljoDv5cKKg1rajxetivC1H+l/pu7
	v2cVTc6tymfKmZb4HS6hmiuiYsHHWGY0S2N3EijnG5hbXt2QO9kx5WGlx0GKtT2m5PKaRqB9gW3
	CTRX4eZ1YZRJGF0eEAfh5W7ppTFTZNG2ZZm+heDzmT4S/5v5kbij2mmmclPFgYf/BzKLrKVUkR1
	wCVmE=
X-Gm-Gg: ASbGncvyzsX/4qi5hhT45fJhrujVIPaYqbpHdmNOFiCbVfQCZQrm/p6OukquXk7CYJC
	lIVGOtatp+khksJ208gbjS9C/ymvaOSm3f+KhGF94wyd7RY3Iob9t6Wgfy54LAW/T/VEVdiMumB
	Zo4e2VCmBxZaqr7RrCk56LPj/G8EIFSIAOP3yI8fVeSagrmK8wK+9XNgmqf2GxnhKrAT5rk42e7
	F545yy5LrFGAr9LWTcgK2ZWzyLrpi0hYfVyUd7NwS4taVKnS8WrxAajqmi6MXo2nRa02/2yluZl
	5q1/e+u1CUfs03MDQu3H/vwARFEyQGmlLiqEmUFG1dRALTMZITiBxWuNGN39FV8o3I9zuZCAPJ7
	Alxf3LgiRUNoO
X-Received: by 2002:ac8:58c5:0:b0:4b0:8773:9b0f with SMTP id d75a77b69052e-4b0aed0f079mr31522131cf.10.1754642971758;
        Fri, 08 Aug 2025 01:49:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEleTrWlsG0anHArp6k+mQlnVM4K5gb1a/fa4NSmTcJysP5EfMDPCkm8nMA1E9waB8F2IsMYQ==
X-Received: by 2002:ac8:58c5:0:b0:4b0:8773:9b0f with SMTP id d75a77b69052e-4b0aed0f079mr31521901cf.10.1754642971257;
        Fri, 08 Aug 2025 01:49:31 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e58400f5sm122904295e9.2.2025.08.08.01.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:49:30 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, konradybcio@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 2/8] media: venus: Define minimum valid firmware version
Date: Fri,  8 Aug 2025 10:49:17 +0200
Message-Id: <20250808084923.1402617-3-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808084923.1402617-1-jorge.ramirez@oss.qualcomm.com>
References: <20250808084923.1402617-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Q+XS452a c=1 sm=1 tr=0 ts=6895ba1d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=-5R0vqtSU2Fw_BP-RAMA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: tWDpNY_5lJ7QWJYO8GKFmuDbKAROS_km
X-Proofpoint-ORIG-GUID: tWDpNY_5lJ7QWJYO8GKFmuDbKAROS_km
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA2OSBTYWx0ZWRfX6UYSq5qk16HF
 sdLkzGaopcjqLqaUtfZS/NVB2AD+HI018PLoOR3sbEq+0u39bB+7qybhyypmql/o3ec+xJ0eCIF
 l79gBAWoxSFFYNluPkq159vr6UDgBYXIWjlc+9Tih6M94eb9Yjkz3IRu2hpfpMM8yMYaCAB7Pl9
 7Eu14rvPg7Kb/oFv+IYL5AG3zY8CHVFpJjLzSeu9bFXJFfSPJWhrb6VnihYc2WEzgX8lEHhYZzj
 QNFxIVbpy5ipQQZkbMp1ssZmB5Ry4WtWPq4YJCmy8XLFkOTGaHr4YufexpYKEGh7Sj+8Np4oO4w
 mQZgqiMGCkp3AMLQDN/0EznZtQNYgNvWHVvLhHZPxYNaei9RwBZ0s4wv3/yq17YZD476AI94fcF
 c8S6SxoP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508070069

Add support for specifying the minimum firmware version required for
correct operation.

When set, the driver compares this value against the version reported by
the firmware: if the firmware is older than required, driver
initialization will fail.

The version check is performed before creating dynamic device tree
nodes, to avoid the need for reverting nodes on failure.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c     | 40 +++++++++++---------
 drivers/media/platform/qcom/venus/core.h     | 13 ++++---
 drivers/media/platform/qcom/venus/firmware.c | 20 ++++++++++
 drivers/media/platform/qcom/venus/firmware.h |  1 +
 4 files changed, 51 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 4c049c694d9c..f45715c9b222 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -448,19 +448,9 @@ static int venus_probe(struct platform_device *pdev)
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
@@ -474,34 +464,48 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_venus_shutdown;
 
-	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_DEC);
+	ret = venus_firmware_check(core);
 	if (ret)
 		goto err_core_deinit;
 
+	if (core->res->dec_nodename || core->res->enc_nodename) {
+		ret = venus_add_dynamic_nodes(core);
+		if (ret)
+			goto err_core_deinit;
+	}
+
+	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
+	if (ret)
+		goto err_remove_dynamic_nodes;
+
+	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_DEC);
+	if (ret)
+		goto err_of_depopulate;
+
 	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_ENC);
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
index 5b1ba1c69adb..d1f0e9979ba4 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -58,6 +58,12 @@ enum vpu_version {
 	VPU_VERSION_IRIS2_1,
 };
 
+struct firmware_version {
+	u32 major;
+	u32 minor;
+	u32 rev;
+};
+
 struct venus_resources {
 	u64 dma_mask;
 	const struct freq_tbl *freq_tbl;
@@ -94,6 +100,7 @@ struct venus_resources {
 	const char *fwname;
 	const char *enc_nodename;
 	const char *dec_nodename;
+	const struct firmware_version *min_fw;
 };
 
 enum venus_fmt {
@@ -231,11 +238,7 @@ struct venus_core {
 	unsigned int core0_usage_count;
 	unsigned int core1_usage_count;
 	struct dentry *root;
-	struct venus_img_version {
-		u32 major;
-		u32 minor;
-		u32 rev;
-	} venus_ver;
+	struct firmware_version venus_ver;
 	unsigned long dump_core;
 	struct of_changeset *ocs;
 	bool hwmode_dev;
diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 66a18830e66d..3666675ae298 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -280,6 +280,26 @@ int venus_shutdown(struct venus_core *core)
 	return ret;
 }
 
+int venus_firmware_check(struct venus_core *core)
+{
+	const struct firmware_version *req = core->res->min_fw;
+	const struct firmware_version *run = &core->venus_ver;
+
+	if (!req)
+		return 0;
+
+	if (!is_fw_rev_or_newer(core, req->major, req->minor, req->rev))
+		goto error;
+
+	return 0;
+error:
+	dev_err(core->dev, "Firmware v%d.%d.%d < v%d.%d.%d\n",
+		run->major, run->minor, run->rev,
+		req->major, req->minor, req->rev);
+
+	return -EINVAL;
+}
+
 int venus_firmware_init(struct venus_core *core)
 {
 	struct platform_device_info info;
diff --git a/drivers/media/platform/qcom/venus/firmware.h b/drivers/media/platform/qcom/venus/firmware.h
index aaccd847fa30..ead39e3797f0 100644
--- a/drivers/media/platform/qcom/venus/firmware.h
+++ b/drivers/media/platform/qcom/venus/firmware.h
@@ -9,6 +9,7 @@ struct device;
 
 int venus_firmware_init(struct venus_core *core);
 void venus_firmware_deinit(struct venus_core *core);
+int venus_firmware_check(struct venus_core *core);
 int venus_boot(struct venus_core *core);
 int venus_shutdown(struct venus_core *core);
 int venus_set_hw_state(struct venus_core *core, bool suspend);
-- 
2.34.1


