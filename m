Return-Path: <linux-arm-msm+bounces-67743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F85B1AE8E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 08:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84DFC7A55D4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 06:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBCFF221FAE;
	Tue,  5 Aug 2025 06:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hx7BlMNY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2DF21FF24
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 06:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754376282; cv=none; b=lzqlTUwJFNH9OhtxPUYDbJksbLEM4EbJYReROvP2c1a4sOSn7Dqnn2TWC65cbSVZ5Di577w16oLkUJrKtIeLxF2qCvrDkMKnjt7NM8ltH6MD7wN4/+/VXSeuOZJj9E0lfr4mWd7DJJ5IT8R/qyh3Z4w7fR99qg6s81JYFEsrSTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754376282; c=relaxed/simple;
	bh=6+303X4Ep8cmFcfNKnWfxGOcPTh1WCdwVwYp+MJvE20=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i5ZgVDj+/6EVIatMubuvUJuJwlgKLsNjT6qIR2zbhC1HzpNlXZur6HWoDA019MmbjMDA43ATj22QqlJMtH0cydN7AZGSf5CxAcll0zkDeUxYnJdbNaiAZQQusDYNItQ7Xnd0slCR17/yLjHMg5/IN2A25TKwvR1SAYiYFpT6o0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hx7BlMNY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5755O9m8005010
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 Aug 2025 06:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZPY1WEYK4lS
	822krdN/O4tqWe64sfx1iUL5xvi/g4CQ=; b=hx7BlMNY5BI0hDokNS+bGMdSuec
	QWMAVulS7Rn1H/GFiPA47Zmv8Gf6MlLvT/bDkx/JyLb/VjVh+EnM48bs7ToZh2YB
	nrLd0J0YKezTivX0XT7Yar3XcKHJ+WxSyVzNWGFBURARJ8ImLyc/42tUxQ3HwdgN
	M5r+Lux4iLC4D7P+fwE9T+4hDS+y04SwBDWWa4dAJDuGzwxbQZxJY0lmtPzLx9br
	nP8bJeB/iyOvp8HFsCkGQVCHccDuy4/2qGLZ8R4ubCQ9V2K0OzHAf21Co4I11q/i
	4UTqtTNhay3zonShRdlDDL5BR9iyPkjURlGPvMiapGDz1hWvUe0GsU/AuSQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489buqqfa5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 06:44:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7074bad0561so121872536d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 23:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754376279; x=1754981079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZPY1WEYK4lS822krdN/O4tqWe64sfx1iUL5xvi/g4CQ=;
        b=apprux6kljVMbnbufqh1WHm+CLx3CIgm+YPoXtJv9FkydTUY7mCBOsLKv856ILIezF
         Y0oDJjdk4gviW0zO18N3o77xTIsfhQjmxGoTp3rLcGmtFFtNgLQM0+K+SrBNi9zdQBMm
         fN+S+W2+OWKX3sFDkF+vbtJsUNSNmdGcFwGwSSRJhjhMmOE4tKAXUZwHO3DxXa7WsXCt
         lZhgmgbfA6MbQwMPw89WHyy+YPsgT8cRMVSdGcS3e0cKwvetLNkM9FEdhKeZivKfj59f
         kv0/MFoAm2U3GhOBEbbhTbfifG2upEMzVAxtKeVfjHF6fFRJdYWIXY9pZzSRXQx6MAUF
         a66g==
X-Forwarded-Encrypted: i=1; AJvYcCWF9iYWb9s+iaEiCzQp7lqe9utf9DWwec0xp69V1f6Pm9n03vZH8PhAmOpnPKSJGUVBoGchmU+iD2KWsynp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1Rd44UFfFJtG0xkryQPxZPNxSkqsf9L5ogwn/jKuuDVt2wEJR
	sl20HJFGApSZya9YyCftqHaWxrfruBzJvl6XvEF5ed1dMZCopfFf9HQUox/aQL6S0JBMQmXlfHy
	7lknZ3fb6X42jRiHcSeoCRXACpSHaVlNcJHe+7qer77C25SxuA09tjyIqD+LZdXgFIEuxjveW+F
	QuIzI=
X-Gm-Gg: ASbGncuCLMo0zlG43avVIB0o8LLxcuEdE2Kngult2K0VuZ1SGN6n2XgHzZuf/xG8sZL
	K1YI9QHckpNwww7wy7Uf2DwnPmGxSlCop2g09/i7u0YvsN0FvFXncotRERVXP+VnkpWUtaHcT8F
	C0EPzS7CKNd3JmV95VsbbnlOeWQNsFrFBfQnAd0jvWf5wQhlC+9s+cP4RHRYl9pQJN7CM0AH6Re
	gUAmZRUHtWk7VGogf2/8QU41Gm0GCTSFYGmLP7Rycu6KYPv4ni0OUHlpPCv5JzzP+tqZQgnuBv0
	OqK/DocPGJvR/bgZawZcjoxyALB2+IdsG2yIDwmH59m+LFV69A6VKloxyPiPyIKHEtSUPaWVOF1
	A3+j0xdJlTetq
X-Received: by 2002:ad4:5763:0:b0:707:5df5:c719 with SMTP id 6a1803df08f44-70936538f21mr180121556d6.17.1754376278820;
        Mon, 04 Aug 2025 23:44:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCvZdqCyVh/hOL+ZsjgDFfhbHOkr5CANvqsJ6Ik/kbRThuJULN7VgZPXE4ttb9N9Ity/Behg==
X-Received: by 2002:ad4:5763:0:b0:707:5df5:c719 with SMTP id 6a1803df08f44-70936538f21mr180121366d6.17.1754376278381;
        Mon, 04 Aug 2025 23:44:38 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee57922sm194015815e9.22.2025.08.04.23.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 23:44:37 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, bryan.odonoghue@linaro.org,
        quic_dikshita@quicinc.com, quic_vgarodia@quicinc.com,
        konradybcio@kernel.org, krzk+dt@kernel.org
Cc: mchehab@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 2/7] media: venus: Define minimum valid firmware version
Date: Tue,  5 Aug 2025 08:44:25 +0200
Message-Id: <20250805064430.782201-3-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: P33dLfL9wMEHnV0VeJn-gNRYYGrirp_A
X-Authority-Analysis: v=2.4 cv=VZT3PEp9 c=1 sm=1 tr=0 ts=6891a858 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=yael46xrl2bLLysLp-AA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA0NiBTYWx0ZWRfXw+PkBMZ5UblT
 zglURjuInI+h1mRZgi9+ZgjPaOqygIZOMAEaTeobTpnFTDiKDmdvotUszfSDyj62jM8rY10kuJ1
 sl4gT3N80f1NZBm/gGRANvzcQaq8ODJRF8UR4REA6g86JWSJ5QTPmS0/drZciMHwB7wpdD5VE7t
 OGxNgKc850mzdg+oSt0La/ry8abRw9EzqPEk5R6GO9VLZJnftqjkvWLG3nvtO/2MRLZrJQxCQRK
 KXhdd2tgJti5zGVjCKyVWuY7bGcycwkWfouglMHTL0Wnzx9IJMk+dtjA4DdxrKrnm3sGCDWyoiV
 SBabjg02JJvVUAx1q48tkuGntxI1pGV292vk64nJdg6xi8bq0WBX3YVaDaQVd5eQ4EJXdywccTm
 sqFPvsuuE505XJXRb5d+sFx0YpdBRGNxuTQwhCWtt37CGZPKS6B83584BORGHTdTu9n3uHyY
X-Proofpoint-ORIG-GUID: P33dLfL9wMEHnV0VeJn-gNRYYGrirp_A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508050046

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
 drivers/media/platform/qcom/venus/core.h     |  7 ++++
 drivers/media/platform/qcom/venus/firmware.c | 13 +++++++
 drivers/media/platform/qcom/venus/firmware.h |  1 +
 4 files changed, 43 insertions(+), 18 deletions(-)

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
index 5b1ba1c69adb..2d3cf920198f 100644
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
diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 66a18830e66d..503dd270a14a 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -280,6 +280,19 @@ int venus_shutdown(struct venus_core *core)
 	return ret;
 }
 
+int venus_firmware_check(struct venus_core *core)
+{
+	const struct firmware_version *ver = core->res->min_fw;
+
+	if (!ver)
+		return 0;
+
+	if (!is_fw_rev_or_newer(core, ver->major, ver->minor, ver->rev))
+		return -EINVAL;
+
+	return 0;
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


