Return-Path: <linux-arm-msm+bounces-76241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4AFBC227F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 18:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 701614F7526
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 16:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6082E8E06;
	Tue,  7 Oct 2025 16:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dtmCsg7f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEC02E8DEA
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 16:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759855769; cv=none; b=tqOCQPgUBi/D6ogT36pPshNHb05/L9xOuFJpPIZ7E7jEPm8o7ema8JJhYFhM+CIzEdY2SbiHQd/bQZWRELV23bB8uUjA3+jMAnxc03FbKIOiSS/qQEFVJD4A5hg3Mj1TLDAw7VYKOv5MRplyhzbss1W5mHStFuSJ1iPKsovypyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759855769; c=relaxed/simple;
	bh=rtvm3+Ddz+f+13iqQLmokYM0aY2hnbKT1DANmSnuV5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=COsOs7uDlh/+kYml8gDxPaagVYBDcJyYWpeRO56GJ9axVgenx2UyVTEvlRKKZVQv4zazCBg2rdzh50eiG/Wj0Xp0PPMwkKLSPowtBkX80ZBj/2rYbSZ9Fw0lW5YOHqA86ZuJJ8fj2QK8LTggL08HxgyLAGv4xxhm5j9KqDyrTpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dtmCsg7f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET6n1025939
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 16:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8vz/gQycZaJGjMl9k5XINZTrvGlzn+yuEewtwO6TWbs=; b=dtmCsg7fSfjFgkQd
	UXtfi1xrMZ5guMgvCplU3IKnrZArKHUsCheu613rt1qXw0UZD4GhO5LvpNOsMs0w
	R0MRuyxmp5gS2O38CBElaxCnd0rFDLzT6Aa6GRXvldm3e2G8CTPMzzC8m1avh+hR
	n98752jLo8UnmTAuQxdFBQ6FFR13Hg4OpGfoPUE95C0PH0q260CvgvCN5bXP2RIo
	XIunRjdGRCl4WxMkjmJN/+Wx9ZbVLAntN0LXzcZaT3aa4U55+11X7LB06qiY3P/2
	OEnIrxAX02Ejy/oun0qxwJ8yNZkDVjKcijlcgjYG7UWKz2T9BxFid+X+6cM0juXi
	9HSJKw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy6yx0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 16:49:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-286a252bfbfso128845395ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 09:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759855764; x=1760460564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vz/gQycZaJGjMl9k5XINZTrvGlzn+yuEewtwO6TWbs=;
        b=ZaojQgfX4kptUHeJec0xZo4N6PUI4UTdy4p1QzM1W311+XsK7QJ+7S0Wp8y6H4KnCc
         FJ9rDemRVC62xO/DQbglCF5Rv7tCJVBWEouteYizueaHrnn7j3aTRWYhiVifOJ9vaM1J
         SUaG8PBpqmGiSUlW6Ame+xo+vUXa36x+/WuPXGg6imCo3aBS92aOoQWWSoiVx2vsSIMt
         lGQG9aVk62qHuZglgvbYeliKUtC264D1zr6syEm0LHiRTU8+YyLRf8XHSvzvIBe9xDhq
         JGCvI/izZhHMYokAynpagBhHTfUAuY+M06SuepXzi/oeMUVImZ3uosH0dxstKidX3ubE
         LGQQ==
X-Gm-Message-State: AOJu0YyXjSv+9m0QYJHCMspJDvu3vzya0bPb7SDR9CrzQZ/QSMM/+sEW
	gqEHkFRE6zLjnnGXNMy5DgpdgdKU0NbE3TBTwWkPiqzV7dbrJ/V+0blpBxOuDlNXTNOJkwKFsVb
	27PbIPTTVo0lzMvKXNHkYgIKH2iwrvRYBANs697KbcxYckE53o+OQnwve0fAxLtcMcBVi
X-Gm-Gg: ASbGnct432nbONV392aruN9Ac/d5TGGjLr4V62fL/WzkJD+w1sG8kTkGDA6uEdOIP3d
	FZUH4UuoJw7cKIgbHcRmwktb/Q9mVnIXe9/oDOPoGSxSPeaZ5SvTlTePdl4wTUgDdE+aQchJ9Rp
	hPxzFXk3ZxeHFzo+PAQMBN+YoytBjWCOqKhBHwuTGcKyTXYi6AtkhmForda9VDWyiv7uoOQmYJT
	Nc9xhKoloaXwh0iw6CsPo77IUbEZVsoIDNG/fLkPTsGgEbqLPhnc7t4/YKJ7RMJAvCwaHXH4jPs
	+8qMhQdPlr/BFF0zVYMsnYt+5T8w4xrraCe+4b2nQ5tXMRE2KIR3WmPOzculXBqvF7Qb98YV
X-Received: by 2002:a17:902:e80c:b0:278:9051:8e9c with SMTP id d9443c01a7336-290272e3cf0mr6648615ad.42.1759855763359;
        Tue, 07 Oct 2025 09:49:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEe++5qn3pIgVX278WDIBcX0wBGoL4i1UDfu9v6PrUb4F29UsE5m3tnu7RYbxhCHhFZyfDpSg==
X-Received: by 2002:a17:902:e80c:b0:278:9051:8e9c with SMTP id d9443c01a7336-290272e3cf0mr6647835ad.42.1759855762443;
        Tue, 07 Oct 2025 09:49:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1261e2sm171990825ad.38.2025.10.07.09.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 09:49:22 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Tue, 07 Oct 2025 22:18:47 +0530
Subject: [PATCH v4 02/12] firmware: qcom_scm: Rename peripheral as pas_id
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-kvm_rprocv4_next-20251007-v4-2-de841623af3c@oss.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
In-Reply-To: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759855751; l=6055;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=rtvm3+Ddz+f+13iqQLmokYM0aY2hnbKT1DANmSnuV5Q=;
 b=9cqur5rxpvIdWpcbqloYpmrcwgRDwCVOS5FxJLvhusp5tTZ2qWovDEgiIL0wXOKuuGfODkCdx
 nq6poSWiT/XAtEGhI0+Ok5MhGUwmNpgALCiPDIp0Ref48ALX3E7pihW
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e54495 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=bcWw3dkznkfw-y6_B5AA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ci7vub4pU6Ln-17qXpJ6zqlYqjltaeDL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfXyfdipW25oHAx
 1/lKmoyZAMM9KuwSUNvUTIlxyzoKGZ9xpYinrrP09X/JhworhCvSzOOkgVE9sbKleeTVohBMqOZ
 raxvVvAkps70WDbxJfvjqf7O0tYWdtWk5Oz3+PqIRfLLbBoVJ4lv3sw5eJmDXt4dWp7JygFahh0
 UjzCKrkZ/yhV/JrvnWykrHb+Qrr59hBTifh2EQMlecCxDJ+n3yVMH6tk7FJb7GiVmWV9sBqDfli
 Gi81OcYEtxeLur4nwkrfp4fFWQoMOayivuyX4zjifZqpbaEE3Q9Ng2gtbrOucuqhfQP4g0Mcnng
 4ghAwfxYybUjQjNOBDMNycodZQKyDT4eeYHLk9Q6g5jtlR6vfJKaC29jd9uWlW1G+K/v9xgCgy+
 OAFpnSMcCoF1Wx15DY+ksURut9elBQ==
X-Proofpoint-ORIG-GUID: ci7vub4pU6Ln-17qXpJ6zqlYqjltaeDL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029

Peripheral and pas_id refers to unique id for a subsystem and used only
when peripheral authentication service from secure world is utilized.

Lets rename peripheral to pas_id to reflect closer to its meaning.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 30 +++++++++++++++---------------
 include/linux/firmware/qcom/qcom_scm.h | 10 +++++-----
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index e777b7cb9b12..3379607eaf94 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -562,7 +562,7 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
  *			       state machine for a given peripheral, using the
  *			       metadata
- * @peripheral: peripheral id
+ * @pas_id:	peripheral authentication service id
  * @metadata:	pointer to memory containing ELF header, program header table
  *		and optional blob of data used for authenticating the metadata
  *		and the rest of the firmware
@@ -575,7 +575,7 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
  * track the metadata allocation, this needs to be released by invoking
  * qcom_scm_pas_metadata_release() by the caller.
  */
-int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
+int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 			    struct qcom_scm_pas_metadata *ctx)
 {
 	dma_addr_t mdata_phys;
@@ -585,7 +585,7 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 		.svc = QCOM_SCM_SVC_PIL,
 		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
 		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
-		.args[0] = peripheral,
+		.args[0] = pas_id,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 	struct qcom_scm_res res;
@@ -658,20 +658,20 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
 /**
  * qcom_scm_pas_mem_setup() - Prepare the memory related to a given peripheral
  *			      for firmware loading
- * @peripheral:	peripheral id
+ * @pas_id:	peripheral authentication service id
  * @addr:	start address of memory area to prepare
  * @size:	size of the memory area to prepare
  *
  * Returns 0 on success.
  */
-int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr, phys_addr_t size)
+int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
 {
 	int ret;
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_PIL,
 		.cmd = QCOM_SCM_PIL_PAS_MEM_SETUP,
 		.arginfo = QCOM_SCM_ARGS(3),
-		.args[0] = peripheral,
+		.args[0] = pas_id,
 		.args[1] = addr,
 		.args[2] = size,
 		.owner = ARM_SMCCC_OWNER_SIP,
@@ -699,18 +699,18 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_mem_setup);
 /**
  * qcom_scm_pas_auth_and_reset() - Authenticate the given peripheral firmware
  *				   and reset the remote processor
- * @peripheral:	peripheral id
+ * @pas_id:	peripheral authentication service id
  *
  * Return 0 on success.
  */
-int qcom_scm_pas_auth_and_reset(u32 peripheral)
+int qcom_scm_pas_auth_and_reset(u32 pas_id)
 {
 	int ret;
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_PIL,
 		.cmd = QCOM_SCM_PIL_PAS_AUTH_AND_RESET,
 		.arginfo = QCOM_SCM_ARGS(1),
-		.args[0] = peripheral,
+		.args[0] = pas_id,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 	struct qcom_scm_res res;
@@ -735,18 +735,18 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
 
 /**
  * qcom_scm_pas_shutdown() - Shut down the remote processor
- * @peripheral: peripheral id
+ * @pas_id:	peripheral authentication service id
  *
  * Returns 0 on success.
  */
-int qcom_scm_pas_shutdown(u32 peripheral)
+int qcom_scm_pas_shutdown(u32 pas_id)
 {
 	int ret;
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_PIL,
 		.cmd = QCOM_SCM_PIL_PAS_SHUTDOWN,
 		.arginfo = QCOM_SCM_ARGS(1),
-		.args[0] = peripheral,
+		.args[0] = pas_id,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 	struct qcom_scm_res res;
@@ -772,18 +772,18 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_shutdown);
 /**
  * qcom_scm_pas_supported() - Check if the peripheral authentication service is
  *			      available for the given peripherial
- * @peripheral:	peripheral id
+ * @pas_id:	peripheral authentication service id
  *
  * Returns true if PAS is supported for this peripheral, otherwise false.
  */
-bool qcom_scm_pas_supported(u32 peripheral)
+bool qcom_scm_pas_supported(u32 pas_id)
 {
 	int ret;
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_PIL,
 		.cmd = QCOM_SCM_PIL_PAS_IS_SUPPORTED,
 		.arginfo = QCOM_SCM_ARGS(1),
-		.args[0] = peripheral,
+		.args[0] = pas_id,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 	struct qcom_scm_res res;
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index a55ca771286b..a13f703b16cd 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -72,13 +72,13 @@ struct qcom_scm_pas_metadata {
 	ssize_t size;
 };
 
-int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
+int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 			    struct qcom_scm_pas_metadata *ctx);
 void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);
-int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr, phys_addr_t size);
-int qcom_scm_pas_auth_and_reset(u32 peripheral);
-int qcom_scm_pas_shutdown(u32 peripheral);
-bool qcom_scm_pas_supported(u32 peripheral);
+int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
+int qcom_scm_pas_auth_and_reset(u32 pas_id);
+int qcom_scm_pas_shutdown(u32 pas_id);
+bool qcom_scm_pas_supported(u32 pas_id);
 
 int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
 int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);

-- 
2.50.1


