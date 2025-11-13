Return-Path: <linux-arm-msm+bounces-81582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E434C56E59
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 11:38:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F51E3BC510
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 10:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E5E333444;
	Thu, 13 Nov 2025 10:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oEzeGaTP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BDgrNk+3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A3B332EDE
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 10:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763030184; cv=none; b=IwRdjCR+npC2o+Hkw1OwFvudyX/lq4s1/OFPh4JQeNxFaJY+HRbfdpHHJTl2QBx7GaNsNeWTzvubzGEC1g0+MZKg7BRKihxf0yYY91vej5dN8OIxtiJoidWrwiJ0bbbc6IM0WXwxfKXEozvwlp9asr5ZI5oDjBUIgaywj2OA4M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763030184; c=relaxed/simple;
	bh=KUuA5AXV3d7PwlEmiR2ZurS0DdJb3IamebuV5ckZzmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RKQIR7HxzGBDqezhX0ioLfj7NjCSem2HdmMu9QegWHOGxJX0almL0a00dgypfVqmejbVyzkorCkAeWG0WVDxuRFHuJaRxaZhC3YudeD7G6wVmQ6AYZS8+6vrChkqpmmPbIBdeDXN2kXD/sl8tDfGIaCrAr/FgNvMHUTkST14lcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oEzeGaTP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BDgrNk+3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD97MEX2962633
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 10:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iEVZCcztr9EOYMu31Bx8peC82HjT/I+z2RQHL73/z+w=; b=oEzeGaTPcLXbdd0b
	+BxNL8yur2kVgJUH6kSIi0v9Z3BC5PTFzFu2ndJkLSVHWDFBlxg0l5NKA28wIZwS
	yp++D94Ljq67DKq2L1CLc+QtZugWbgDfB7qo/ZlecifVihqPoQ9txfq5vtvckwJZ
	DyP/1kGLu+EAZvXKfwMbhi+wZFpgvgBLP9+as0iOK2/3LBiZS6R8DEr75113CuN4
	QAI/5gJumM11VAOuC4ZiRQT2PslABmsSaW56gZx4+IKpS3YdloiTOwsJ2mmBDi1l
	XaM7Wr6u3DV9PPW53+JL5k+Ufq6EK93BtuUqmpMBZgX1LfRnb4BZW3sfwddhURW2
	02Xw7A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acwbpu7a7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 10:36:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3438744f11bso934312a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 02:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763030180; x=1763634980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iEVZCcztr9EOYMu31Bx8peC82HjT/I+z2RQHL73/z+w=;
        b=BDgrNk+3kAVYE/RRx/AUcm25ae8io+rHHNhSw0PsvBmXH6bxMy5zj/rG3SSdLKZsRY
         lYxRbSw0xuu2nb8ZwFDty5C+lZYrEtFJvsNhq5LdQDWYhERcwLBcEyyAsjQ82hbkaGDp
         hgYGXhUdoiSuUXcACBd7WzvXDZB/5vP8gkh8aeNLXVJyGKuSsljz4WncydYUMflqQg5/
         aROvVhyKUSV/+x1DS/Ifp9ex9quc25XWLAEgnLG7+8qkJjMCIH17R3bRjYyzPAJxifKo
         moOBzSvjcCHVwXmSGDXrdRcmcObDPf0JsO1PWlb4aDtjKv5t3QVjSs7Vd2wt2T+76qBC
         34Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763030180; x=1763634980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iEVZCcztr9EOYMu31Bx8peC82HjT/I+z2RQHL73/z+w=;
        b=ODBcW3lS68tKfsTh6HMB9edL/TeN8gEP7Ylt+pl4XNEMOaZfepgLY130SI2gkOuvTZ
         ZIDuZ3ROzho143rLhc1jnrfL3800cDbt63nSjE0txPmdd2WdB8vvx47umQrjZfFMmNw7
         IIsgIONMop56ZPifFpE0YSs+u+SO8ZFtlNLyOJbeSDpOUQhJwRh9WtsGi08v1E+YAVl1
         cQDCh8BIoKyApIzgSqqIxmv1kax8XsAnwLYtVc3NDdnCZ7mlGfwam7oWhDoC0fUcYwbS
         IPp78vnnPuaA+RnujxxeSvms9BoWDxkz8Ka9hNm3uiHhigVOWbnHZwkpUDG2PjwgA9HA
         yq+g==
X-Gm-Message-State: AOJu0YwTlkmokUqK1YTPfo9T1xLHskmnefpEgxLknYAZ1KFvS2PK/5Nq
	8mub1YHgtVOKRkAxHjzE9lTrCKzESCX4VexhlPbHzXuvQx01jzGVcQkZCc+Hzi7bH9B1widi5K4
	QgvP2QpZNz47Q/fOZZzBTVdiaOMc4LvJU386J3kpNU3L8yP2rXrgKBwTb9jh4B3DPURJv
X-Gm-Gg: ASbGnctOJrHNBpQrwA0owi89F0t9Tb4VPZ2mcjMu9ccUl4S2jiJhKcKFepT5HZGtw2d
	D85mzgtKWizVWgMf/udHIMjb2+9lJLXvpRvkEB/0nL2D2+74D5tcbmqSX6WDdYDw330giM0cFVx
	WBjGuHpU43fOqSNdk2bkZDlH7VrYknFC/fMYAf6ezYtTfX0cOXe7sH3W07KcPEcDypXZ6lW3wDh
	sPVk2ptAVLLK4WtF6xE8m1SgVJeWL6OERVbWM9s9YGoSe1taNWnsuikQRVzM/3azlVflSFs/PIY
	QJyujPYDextQ5/EaqADAAuRlSwr+qkfM6a5p0D57K7PTn+EtKixxyh4H5aDmHF5wAUMSa1KHQo3
	zY4rs6vlswJp43mG+lFwqMXAXRA==
X-Received: by 2002:a17:90a:e183:b0:340:b912:536 with SMTP id 98e67ed59e1d1-343ddee978amr7486680a91.31.1763030180296;
        Thu, 13 Nov 2025 02:36:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8UmCTjeTUjhTTxUciQIXJWRRu9xo+X+SKD4RSpBnnRCMZwQfw0qhhEkDdcvGeBMHTkvMpWg==
X-Received: by 2002:a17:90a:e183:b0:340:b912:536 with SMTP id 98e67ed59e1d1-343ddee978amr7486623a91.31.1763030179631;
        Thu, 13 Nov 2025 02:36:19 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250d2d16sm1886922b3a.22.2025.11.13.02.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 02:36:19 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 16:05:53 +0530
Subject: [PATCH v7 03/14] firmware: qcom_scm: Rename peripheral as pas_id
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-kvm-rproc-v7-v7-3-df4910b7c20a@oss.qualcomm.com>
References: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
In-Reply-To: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763030164; l=6116;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=KUuA5AXV3d7PwlEmiR2ZurS0DdJb3IamebuV5ckZzmM=;
 b=J8ybH+HJ2/Bn6GKHF4ZbJkQuofWMoXbmGQ1NVkQaZfJr63kLsJkb30sa3TyPQH+nC53FbEtLo
 d7aBjmCFhePAWwh61FKgClhKSmOIJLj0RqKsLxlxS7xakXDxwXAXg4r
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=NvjcssdJ c=1 sm=1 tr=0 ts=6915b4a5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=bcWw3dkznkfw-y6_B5AA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: k1SiuRQGmzudRCg8zpoPPRRe6yxkH7sz
X-Proofpoint-ORIG-GUID: k1SiuRQGmzudRCg8zpoPPRRe6yxkH7sz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA3OCBTYWx0ZWRfXzSojxNE1kcVm
 rTSFGvQjA+HPwC3m4HilIzZVXpopuk8nhmlGUUE21HFhlWDp6Bc+4EbqJ7MarBsU1fOhMhnTDeA
 u3BA8zqF9XGw/MXqSGOPpWiDsxrQ4xYXkcpc8Gk0TL9M/w7pYWfEgQ8B6cjdD1KHGTHu3pyjPBT
 Uj1pIokLqDvSYxRlywM6i5PFGCXVzXXV4ZhOE0rAnA4MC/8NQP38SKGCqehc7jGi/pNam088dhX
 M3AkPmghJPITstmQmwVsYxoUYIVpj/xefVQtbNF7xRihCcBqaktB3WlZl5+mURT0qCZ6AFTobXu
 CXZ8S0qCJ+kcsI5MLFlTp54XxuaHGRYPcMc8uHk/hv8YO3CQx+9+NDhK0lmZwOvLK3VJuZxpcP0
 ayUuKDRnfB87SmAbDm4QCR0fxzhdjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130078

Peripheral and pas_id refers to unique id for a subsystem and used only
when peripheral authentication service from secure world is utilized.

Lets rename peripheral to pas_id to reflect closer to its meaning.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 30 +++++++++++++++---------------
 include/linux/firmware/qcom/qcom_scm.h | 10 +++++-----
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 26969bcd763c..0a0c48fca7cf 100644
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
@@ -656,20 +656,20 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
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
@@ -697,18 +697,18 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_mem_setup);
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
@@ -733,18 +733,18 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
 
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
@@ -770,18 +770,18 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_shutdown);
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


