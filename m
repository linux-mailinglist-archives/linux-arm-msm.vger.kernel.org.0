Return-Path: <linux-arm-msm+bounces-87435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 52249CF3D58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 14:33:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C16D13012CC9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 13:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6839633B6D7;
	Mon,  5 Jan 2026 13:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gN/1kI7b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F8WzVJV0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26A733ADB9
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 13:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767619410; cv=none; b=F1pTGasTLNGDHxe6WMMETuNbG7O8VqXDrOI9DT67lnr0LstyLgxwhT1OgNnCGFpvvB2WqutqEgb8Dio/i6a15bR1VxheevErcATUW9JhqiQyPH5jMZyjW6gGRIGTjDZleXWleBNQO0pSDfB0Y36XOWR1YUasFHqSOEZEiip1bqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767619410; c=relaxed/simple;
	bh=jmJLL9yy21/T5dkUfSi6xv+w7Dl4R9a76g4RjfccEf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eWShst634FkNRh+6fUzLjPQ1QWHSZ7VVeRMUBzxoxV3r8DViUhXZN7ssF+lgWm7n7ZmX9VPZOgwEwctUWZKmD/xP8ssJ+Lbcs8mNowU0U7WtrDaVvZyIfFOtEkcu3F3PwLbi5dKtDffGEz0m1B6GmVsEBjzi+BvNpjNt7wje/gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gN/1kI7b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F8WzVJV0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6059cnpA610492
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 13:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TcTaBliHVmGkKDCgkAsYs4g0RXmBZjhCOT5UQPijOLQ=; b=gN/1kI7bnnLAjm6/
	o48195kJXXBaEVdPCFZIepIOEF+dJAnBZr5HySBV5x6UZ5g+T8qJkQlyRPT6oO87
	mxKhxdMmzWa5rrlpt2KPnG/0kbgES7M/PCl0jHeNktFjywMlQ8b2JIwPuWR+rG0p
	FD4LD4cumRjQp5UaMSvfZLdsJXGbMwj43uCc3vk44qyLyBgoFvE2jhhWdOZeb7Jr
	0ekh2y3jmZJe6rHlkF0pX8viEgpREVSjMC/mTBXYGG5liaF11wUKmLUmyd4ejunM
	DQl9+VjVarW4NFEwTN7egO9RT2pLXXUXtsytDJDnFj5x78+o3YeC8jll+vnQSAlR
	VBkCcw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgaus0hj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 13:23:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b9321b9312so30792375b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 05:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767619407; x=1768224207; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TcTaBliHVmGkKDCgkAsYs4g0RXmBZjhCOT5UQPijOLQ=;
        b=F8WzVJV0bX0UHAPd7CAQ+FGgD2iUwUWPlLTr+RUAOM8/qhLQ/2MUa13n1wwDeO+vdK
         7SFnGQQBsbHxieUo2NZK99JsCqJQPqWjZltzUd4vnPcm0s75FRHj6aKo7yOarzLQsOOm
         R0XXBlLISWCM84MAv9IR4xxf1AmEy0xchOqEO0Tk7wXQf2WqgFuuQIoov6mptOpbEkca
         zgpLVoilcEfHE3th2oOYfdG/r6JDoXhGIT4HyRhE6FuObjaF3LI3Nxz8Ebd2//TcCLOe
         tPAJHZ1X3YIWyilVthkdUN19fp7XUcYPvbGK+II6Xb4WZLcDPW8OLP3Z6UKf2sZPnXLP
         Vn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767619407; x=1768224207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TcTaBliHVmGkKDCgkAsYs4g0RXmBZjhCOT5UQPijOLQ=;
        b=ZI5i6zeVeFVOYWWSI1zpOHsQf0vww7MSJ2EB3mrKpk2Y7v9B7BJijtSO2lVrtUSceb
         uy0afSs7uwjPEcdbWcz/p9KGwIPxxQ/KdbewUKvyxd+RoD5mWv7ejPHSgzPLbHzRrcfh
         cN0xuanRlH+zCZUZrYNiiP6gAdz0HYTdqy+e9dKRPjhMZcxrOU30jRZOZK+F55Rir4I1
         lQvg1cCY1sC+014PrugZceHIYycw46kimllgs4WkltJv5MlCG0Z6A2qgMzNmUQmsVj2L
         IWq8SIYJ9hJRKGBJ93S9luQ14yBi3kPMCjkzO2DaCC/TPXdC2oCdG+wdIpUeWLrqMqfX
         SLXA==
X-Gm-Message-State: AOJu0Yy23lqcApdJYMpXsArhh4Cok7vZSYhyBxIBNo5UzqncAuy1J345
	eNUNi7oOtD8LIwUP6rHl/j8IzYayoFaEByoC7CZaME3ChveQGnAk+KJpi1g8JIRCT84fhBB5wTR
	O71yLB8NXZefZRUqTAa/hLq9xWL2f8OzG91e0yyx+AVzIHfeI4VTKEksXIpZQGVWCvOSg
X-Gm-Gg: AY/fxX6QCP88jWxVFJ7cqKY3AICL3KX3F6HQXgRC4R+u3Qn5aizvXmjis5b3tWqsQJS
	+z7Oh4j45ioVrjkKkVec3OJx7qSZz4fZiFNPWe+th1m74FDHgR0RJbiZxEhr0XsMKIxJDXBY3oO
	WNTo0dH7oCtMogHyYGgFcY8gJnGijnT5TsjnGI7bxq15cSCsoIY4i5/YSoMMx4Gpy90UbqgOkce
	tpDuKYPvVb2/bJldhKIZeqaBOR38LCvgRLYxbfr/l82pxd4/9QZcHKT3PrFlUHbRNPa5e61k49X
	hhu8VIp1yHTN33zgIAi17cmnSPUMnyl8r5sXvm3z68xfO4crBFKVtVwc9qSrvO2zBnZ/kzHPHS9
	l1cEHZ2L5hLnM6QhV4vb09Gh3ajKg2FuM3mXf
X-Received: by 2002:a05:6a00:450f:b0:7b9:a3c8:8c3a with SMTP id d2e1a72fcca58-7ff650c7e8dmr45686358b3a.7.1767619406813;
        Mon, 05 Jan 2026 05:23:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtlWc8KtYhNXYtaxKI/oWeTbuW+o3yF1YRHJmezy+B67scF+917/I/6y5QEi8f/0qUQFzSpg==
X-Received: by 2002:a05:6a00:450f:b0:7b9:a3c8:8c3a with SMTP id d2e1a72fcca58-7ff650c7e8dmr45686320b3a.7.1767619406133;
        Mon, 05 Jan 2026 05:23:26 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b127b00sm48426542b3a.21.2026.01.05.05.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:23:25 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 18:52:51 +0530
Subject: [PATCH v10 03/14] firmware: qcom_scm: Rename peripheral as pas_id
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-kvmrprocv10-v10-3-022e96815380@oss.qualcomm.com>
References: <20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com>
In-Reply-To: <20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767619390; l=6116;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=jmJLL9yy21/T5dkUfSi6xv+w7Dl4R9a76g4RjfccEf0=;
 b=dujnzhr0uDU+SouoPxty+Ow+oSBFlWtpmUafpLyapHaYkfLyQHu1p+AGcBnq+B/Z0ZdJ4Oj/d
 DywWe3RnQdpBfYfb4TvBc6+2oSo861vthJ2FQyXKMWvhdaCCYPRtoJZ
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: uxBVVMUjhSqQz2VMn7Du35q6SdCMdtGD
X-Authority-Analysis: v=2.4 cv=DP6CIiNb c=1 sm=1 tr=0 ts=695bbb4f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=bcWw3dkznkfw-y6_B5AA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: uxBVVMUjhSqQz2VMn7Du35q6SdCMdtGD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNyBTYWx0ZWRfX4hN1B+URX/sJ
 vC52F8CXvF3TXQXPQNNlypSg2MJ/JKeUtAYY5MOHk/eZ4m+tcDH/VHJqWKffGl0/vacyyK6HhCV
 Y6eoPq2pM41LbDIGgS4pieiwpEI35iEEvA/+/UdR63vZQWjxuNYFwz25XuGVEW37IBoHxQP3hx5
 bd+5Zjyk++oNxA+MqxWL7J0EXZb5b1Ozd0JPFkcNCFaRq0j8Tgsloo55RPZKixiVo5HvM0yoAhM
 7PfLbpN+l2fGwOK5px1pYZiAGqwNyNtszupl/L5B/AaopG/htwZ6akcAAxteY5QUNXLVwVIZ8qz
 0ZbihXjDdcSoxU6TBkB/24+Ua/ehvbKyU8rpnSp+hQa87uyCD49gXRiPZ5myH5EN8RxQ86SjiZg
 zU479WRxFVU/et8F4uT24sj1VwfYTv8Eorzhb54KqFeuDAyeT2dKbu7Ti4AAsLdFpKDeYbXBVq5
 9Hm7AlvPmXTstxQdHmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050117

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
index b298a529c84a..0a4d5d58c177 100644
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


