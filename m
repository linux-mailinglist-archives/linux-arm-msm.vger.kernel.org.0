Return-Path: <linux-arm-msm+bounces-55694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B60A9CFA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5323F3BA167
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 17:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B37720D506;
	Fri, 25 Apr 2025 17:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YUUvUQIt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36B220C487
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602384; cv=none; b=Cbme0E/8dUn8aNUalUwPR1gAYh5VJFdKwg58V+rWoOK0Bu0vEol91ZYD9iQRxazVuqmbtirIsUYoKnJGo3lIpwBr71FJEq2q9FcmllGfjU7AfxJ89WM2Nh/4tx0jDGTcukCQ4XdB4ST8oaJjSG0WllNoCSbqbTJDwNEc8HPta0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602384; c=relaxed/simple;
	bh=s82RPoTrcqpCKAVupa84Ebn+nOzLCt9yBn96isEvWLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jXSiGX+G9mKIwkTjr65NyTk3RZ2QQ8xCzZSfFhgtHyk3rYxO/NI9eGXg8qCJKww+uD6ZoKFTdNQwMXG1D/6lE3FxcZ9/r0xqGmQ/34fcIDzhZOxS0yQMt4ftaDNj+GRISDa5cOqYIAc0g6m2LccJymSrKGfk6wIsp7wib4pG2LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YUUvUQIt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJwZO032069
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6sGq2bqrpVdUmVV6oWyIHv
	/C1NNIq++EYsZcwhO9Fb8=; b=YUUvUQItjDYNI2g2bUohicBeESdaELlVf74oM9
	97r40UQ7Q93m10FLPo0w7sZJxfXocAJgnHgG+Duk7Lfq8PcueXnBbA9wLnFY6L1A
	PGcvpDksMy0VxV/nDQ3Zyd2xwiHRMeyGjuZ1SwZsatB3AvSb9P7cFNPP4NsslGp+
	Y6VBG5xpBTmlUvNJhzDNpHVk/xK9YkDtOaXRq9UNJjaRSyWAZqTjAqHHWzc99aY7
	8i5Uk+hmpND8Luxfoi1HCU97jkn3M0tnEibcNeTPJuorwWlwsCFIHOvnfZ2a6826
	XQhpOc5d27351zr6JYoGpSA06tlchEKY9PoIBl39lxuZH1lQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh19q54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:33:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2254bdd4982so38898625ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602380; x=1746207180;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sGq2bqrpVdUmVV6oWyIHv/C1NNIq++EYsZcwhO9Fb8=;
        b=Zi4yhEO5ZvGwIMcF8Bnh9UZQ0FktG6eRkvPaVttD17IFYMh+Jm/S+v7p5VIF5+fwDu
         sOFOVj9PahjHrbTmoWUMUxrJa36QfaPuOV0LirsHgwn2VYYVTYGSQ3WlwufboPf5jnLA
         8g3KBFLtWMBCNWjPjg8jfIVrQFM6ULMeHUagdaarAUlehXL+2lMFN25W7ytUWSCPtVTb
         tRjdMbvErOOszRleWsUIlGUtxfivld3pn74cBxtBdRT60g4OpUcBIVeLPROfw7Xqsusy
         SVYJTyTpiPZTR4TNQK5VaZ/Q3AZKduUQcNlkhKWsT3LeuzXyajvyB+2qFuzSlWugfxQA
         QgAg==
X-Gm-Message-State: AOJu0YwLwdDvzulgHr5HPYZAoh4+1uOOb0EAqePaUYVY+V8HPK2zSeUw
	zQiOMGoaqBHhHC/HDDSGmjYV+verrLomJVexK+RAzons19efdiFVQqFSkIcPvJ/ugqus7omJbl8
	N3HYXxiZ4fm4E49byG86DWfw069xUFPpuIE7e1SeBm3I803+GrJ0L4exrBKAuYZ3FqYwMm+UP
X-Gm-Gg: ASbGnctb+lQk/o6Lp38VKDiTkmZ2JMngR+Buo4bi3cB9voBptHQRZAswY2uhy2A9iht
	jcMm3GcqdcTmfFtavpS+bWUSdauyfi4yTPxw7dcPVNTrUBwG4hIJk3HsiKZ9KhlPXL31w4cpPh3
	LPbN/SNkvfR3A5uqxhZFJFeZWlCfw9cXIy0Jzrn16JGnGdp9VinxVMHFFtu1gnflol1xsvT4+iN
	7aA455Zz6xzGeBxvv8fR6IOp05J8zwDTzLYYklM7uC9ZyRBui+X0m6toKjPETbGZhQhS5K44qGr
	ye+enLxaolTsRyUoKg6qHm01I6Lm1Jv2eRovm3+HkZ6XqHXP+eXllhKSGYKXtT48XWgObiWKIt8
	0AT0=
X-Received: by 2002:a17:903:228f:b0:220:ff3f:6cba with SMTP id d9443c01a7336-22dbf622591mr48693905ad.38.1745602379704;
        Fri, 25 Apr 2025 10:32:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3u0PCc8dYsIdVZKuNT3tbaTRQ5xq2KZbapLcy66FMGOogDa85hUh4UcZ3C65no7QFNNhyFA==
X-Received: by 2002:a17:903:228f:b0:220:ff3f:6cba with SMTP id d9443c01a7336-22dbf622591mr48693445ad.38.1745602379246;
        Fri, 25 Apr 2025 10:32:59 -0700 (PDT)
Received: from hu-uchalich-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f85972d7sm3161182a12.38.2025.04.25.10.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:32:58 -0700 (PDT)
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 10:32:40 -0700
Subject: [PATCH v2] docs: firmware: qcom_scm: Fix kernel-doc warnings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fix_scm_doc_warn-v2-1-05a4f81de691@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADfHC2gC/x2MQQqAIBAAvxJ7ThAzsr4SIaZr7SENhQrCvycdB
 2bmhYyJMMPUvJDwokwxVBBtA3Y3YUNGrjIILnouhWSeHp3toV20+jYpsFF51Xce10FaqNmZsDr
 /cl5K+QC2252rYgAAAA==
X-Change-ID: 20250424-fix_scm_doc_warn-98f853feb74c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745602377; l=7740;
 i=unnathi.chalicheemala@oss.qualcomm.com; s=20240514;
 h=from:subject:message-id; bh=s82RPoTrcqpCKAVupa84Ebn+nOzLCt9yBn96isEvWLc=;
 b=gTZl+O5KrxoJkgKD2oigRA228ZInPVdcZSGt2qXLPqDOejkcUVql/wx2yciv82DCawFocmV6L
 ghy0BqVMwVqBCRpgryuP8aS6h9WZLcwhx8d7ixYC4GXRG2FqWPnEjKG
X-Developer-Key: i=unnathi.chalicheemala@oss.qualcomm.com; a=ed25519;
 pk=o+hVng49r5k2Gc/f9xiwzvR3y1q4kwLOASwo+cFowXI=
X-Proofpoint-GUID: pWT9F_NECqhka1G7VuUqo7tjLmF6y6Kd
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680bc74d cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eraXtWYwf80GF9Eon8wA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: pWT9F_NECqhka1G7VuUqo7tjLmF6y6Kd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNCBTYWx0ZWRfX+c33YU6Z7lgf xsdmUQVVNOGMOhRpmGDwEGQhs7juh6Y1CCOSFGUIs3omskTREkNYZPwFDvfsVl/iBMCZLtmEqds O5ezQfNd9ArZz4UlvUnv2dtiOuAuu2BoVPUaSyPVtHkUiAtblvTDKa4pG+bIQcHuFahxt5WopO6
 +h+7pffBzBxLHiU+upUxkwJla76yKWS7viU5vIZWg159ikZQsxWr7dIwqT3p44tRWT7bffZfRTl VbKgWBAeLUX5nw6Tw9NL8aye0HB1cD7ZgAiL2frx5VixsZL1a7Tdsci5HLxo98y/pqaLR6CR97E G2nAWTJomYHfHqdErxjGLJYpIauzdUtdDkyLSXdDpjK/4V3Ib6ZwQAYqSL5yujeRfZ0YedY2BzO
 OdJaICz8J88cEKommiqNoYS/DhFWALvDATOAceziZkFS3Y7/A1kr5MVPT9+3tWtDE72vYQyB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250124

Add description for return values and other arguments of a few
functions to fix kernel-doc warnings.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
---
Changes in v2:
- Added Konrad's R-b tag.
- Fixed some more warnings generated with -Wall -Werror for scm driver
  and related files.
- Updated commit message to include additional warning fixes.
- Link to v1: https://lore.kernel.org/r/20250403-fix_scm_doc_warn-v1-1-9cd36345db77@oss.qualcomm.com
---
 drivers/firmware/qcom/qcom_scm-smc.c |  2 +-
 drivers/firmware/qcom/qcom_scm.c     | 32 +++++++++++++++++++++++++-------
 drivers/firmware/qcom/qcom_scm.h     |  3 +++
 3 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qcom/qcom_scm-smc.c
index 574930729ddd72d98013770da97cc018a52554ff..98693be78ea91a599e01eefe6aee72ecbe922eac 100644
--- a/drivers/firmware/qcom/qcom_scm-smc.c
+++ b/drivers/firmware/qcom/qcom_scm-smc.c
@@ -17,7 +17,7 @@
 #include "qcom_scm.h"
 
 /**
- * struct arm_smccc_args
+ * struct arm_smccc_args - Arguments for the ARM SMC instruction
  * @args:	The array of values used in registers in smc instruction
  */
 struct arm_smccc_args {
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index fc4d67e4c4a67efc77e0135c06db47bc14d0aeaa..59c5704a4c00d095fa71326474e156c1a3c46c7c 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -298,6 +298,8 @@ static enum qcom_scm_convention __get_convention(void)
  *
  * Sends a command to the SCM and waits for the command to finish processing.
  * This should *only* be called in pre-emptible context.
+ *
+ * Return: Result of scm_smc_call or scm_legacy_call, negative errno on failure.
  */
 static int qcom_scm_call(struct device *dev, const struct qcom_scm_desc *desc,
 			 struct qcom_scm_res *res)
@@ -323,6 +325,8 @@ static int qcom_scm_call(struct device *dev, const struct qcom_scm_desc *desc,
  *
  * Sends a command to the SCM and waits for the command to finish processing.
  * This can be called in atomic context.
+ *
+ * Return: Result of scm_smc_call or scm_legacy_call, negative errno on failure.
  */
 static int qcom_scm_call_atomic(struct device *dev,
 				const struct qcom_scm_desc *desc,
@@ -422,6 +426,8 @@ static int qcom_scm_set_boot_addr_mc(void *entry, unsigned int flags)
  *
  * Set the Linux entry point for the SCM to transfer control to when coming
  * out of a power down. CPU power down may be executed on cpuidle or hotplug.
+ *
+ * Return: 0 on success, negative errno on failure.
  */
 int qcom_scm_set_warm_boot_addr(void *entry)
 {
@@ -435,6 +441,8 @@ EXPORT_SYMBOL_GPL(qcom_scm_set_warm_boot_addr);
 /**
  * qcom_scm_set_cold_boot_addr() - Set the cold boot address for all cpus
  * @entry: Entry point function for the cpus
+ *
+ * Return: 0 on success, negative errno on failure.
  */
 int qcom_scm_set_cold_boot_addr(void *entry)
 {
@@ -662,7 +670,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
  * @addr:	start address of memory area to prepare
  * @size:	size of the memory area to prepare
  *
- * Returns 0 on success.
+ * Return: 0 on success, negative errno on failure.
  */
 int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr, phys_addr_t size)
 {
@@ -701,7 +709,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_mem_setup);
  *				   and reset the remote processor
  * @peripheral:	peripheral id
  *
- * Return 0 on success.
+ * Return: 0 on success negative errno on failure.
  */
 int qcom_scm_pas_auth_and_reset(u32 peripheral)
 {
@@ -737,7 +745,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
  * qcom_scm_pas_shutdown() - Shut down the remote processor
  * @peripheral: peripheral id
  *
- * Returns 0 on success.
+ * Returns: 0 on success, negative errno on failure.
  */
 int qcom_scm_pas_shutdown(u32 peripheral)
 {
@@ -774,7 +782,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_shutdown);
  *			      available for the given peripherial
  * @peripheral:	peripheral id
  *
- * Returns true if PAS is supported for this peripheral, otherwise false.
+ * Return: true if PAS is supported for this peripheral, otherwise false.
  */
 bool qcom_scm_pas_supported(u32 peripheral)
 {
@@ -879,7 +887,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_io_writel);
  * qcom_scm_restore_sec_cfg_available() - Check if secure environment
  * supports restore security config interface.
  *
- * Return true if restore-cfg interface is supported, false if not.
+ * Return: true if restore-cfg interface is supported, false if not.
  */
 bool qcom_scm_restore_sec_cfg_available(void)
 {
@@ -1054,7 +1062,7 @@ static int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
  *            flags
  * @dest_cnt: number of owners in next set.
  *
- * Return negative errno on failure or 0 on success with @srcvm updated.
+ * Return: Negative errno on failure or 0 on success with @srcvm updated.
  */
 int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 			u64 *srcvm,
@@ -1129,6 +1137,8 @@ EXPORT_SYMBOL_GPL(qcom_scm_assign_mem);
 
 /**
  * qcom_scm_ocmem_lock_available() - is OCMEM lock/unlock interface available
+ *
+ * Return: true if the OCMEM lock/unlock interface is available, false otherwise.
  */
 bool qcom_scm_ocmem_lock_available(void)
 {
@@ -1145,6 +1155,8 @@ EXPORT_SYMBOL_GPL(qcom_scm_ocmem_lock_available);
  * @offset: OCMEM offset
  * @size:   OCMEM size
  * @mode:   access mode (WIDE/NARROW)
+ *
+ * Return: 0 on success, negative errno on failure.
  */
 int qcom_scm_ocmem_lock(enum qcom_scm_ocmem_client id, u32 offset, u32 size,
 			u32 mode)
@@ -1170,6 +1182,8 @@ EXPORT_SYMBOL_GPL(qcom_scm_ocmem_lock);
  * @id:     tz initiator id
  * @offset: OCMEM offset
  * @size:   OCMEM size
+ *
+ * Return: 0 on success, negative errno on failure.
  */
 int qcom_scm_ocmem_unlock(enum qcom_scm_ocmem_client id, u32 offset, u32 size)
 {
@@ -1499,7 +1513,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_import_ice_key);
 /**
  * qcom_scm_hdcp_available() - Check if secure environment supports HDCP.
  *
- * Return true if HDCP is supported, false if not.
+ * Return: true if HDCP is supported, false if not.
  */
 bool qcom_scm_hdcp_available(void)
 {
@@ -1525,6 +1539,8 @@ EXPORT_SYMBOL_GPL(qcom_scm_hdcp_available);
  * @resp: response buffer passed to SCM
  *
  * Write HDCP register(s) through SCM.
+ *
+ * Return: 0 on success, negative errno on failure.
  */
 int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt, u32 *resp)
 {
@@ -2086,6 +2102,8 @@ static int qcom_scm_qseecom_init(struct qcom_scm *scm)
 
 /**
  * qcom_scm_is_available() - Checks if SCM is available
+ *
+ * Return: true if SCM is available, false otherwise.
  */
 bool qcom_scm_is_available(void)
 {
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index 097369d38b84efbce5d672c4f36cc87373aac24b..3133d826f5fae8d135a8f03758173903a87e718b 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -44,8 +44,11 @@ enum qcom_scm_arg_types {
 
 /**
  * struct qcom_scm_desc
+ * @svc: Service identifier
+ * @cmd: Command identifier
  * @arginfo:	Metadata describing the arguments in args[]
  * @args:	The array of arguments for the secure syscall
+ * @owner: Owner identifier
  */
 struct qcom_scm_desc {
 	u32 svc;

---
base-commit: 02ddfb981de88a2c15621115dd7be2431252c568
change-id: 20250424-fix_scm_doc_warn-98f853feb74c

Best regards,
-- 
Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>


