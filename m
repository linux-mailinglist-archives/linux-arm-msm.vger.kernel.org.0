Return-Path: <linux-arm-msm+bounces-82809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A98E8C789FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:02:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 796F235D3A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 11:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF9A348898;
	Fri, 21 Nov 2025 11:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OIyLLDxc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GBC+J33X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E6B346FDF
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763722902; cv=none; b=Wqhc9tzPrkwM85xJRhXdSjDYI7tPwbQ8CuQiqBFGd3vGIZQ8YPx+D4NII17PwJ5qIpnS6o987nDGy0jNd4xUv3VHlAt+lgjgOa1oktv74+MPwGKXimoT9cza+cXVv//Mga+rMG1sX6NCqGoQuUmp1vvbWFBMTw5INfU/eYDfl1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763722902; c=relaxed/simple;
	bh=KUuA5AXV3d7PwlEmiR2ZurS0DdJb3IamebuV5ckZzmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SiDZcaTOLRg+OSolg9n0SutLD6Mt1P9T9vcaG0JgdhmTxputEtoQvbkZRV14pu3A9mIhOE0k96phJtQcZW+DBFJnJoPvHGl8Gs8aPBM91G7yYEC3vEHEps5zZvWZVvaqFX/I8XGVwXYsc/Jmq60x6mrKcXj9NAcrljX9DXfhQb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OIyLLDxc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GBC+J33X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL53xAE2841291
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iEVZCcztr9EOYMu31Bx8peC82HjT/I+z2RQHL73/z+w=; b=OIyLLDxclXvY/TZy
	u3CG94nIb3VbZspA1nJ2ClEVFgTFc/b7gYC5l4XrVWRzc8/nwyk0IbsFx6tgVf/k
	3JN+XA1279ESKyQ6Y55oWKQBijSEjrYyJCgmj1Y2lirnosDYZpvJmjafQUxma1mH
	elCTW0ga3jwCuiMSn61G26WP0q696jq0U70kO13zxyln3A1ddUZ9CBABiK9Y5P08
	I8C5hCAdigijJd6PQ78sHdQJb1QlRtGmcXiodvVr203MbQtGBJrBEYgwFt4eepEx
	/17LauUkGTHKrlD9Cod1LqdRvVQkLPCLUVZ3SO0jNTJVZdBEHqEol6aQiQ5GCCg+
	lOj9RA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhkvh63c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:01:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-341616a6fb7so2297745a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 03:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763722898; x=1764327698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iEVZCcztr9EOYMu31Bx8peC82HjT/I+z2RQHL73/z+w=;
        b=GBC+J33X/qlsodmSoFHleWts+gAtQgf5zUMPp+l5l5VRm+N9B4ie1sFyv2w/KD6Z4/
         raGDywJEcCYKQuv1rTHd/hQqpsaagfhKUYpdujGV210HA8DEmyWPrdVid4m7aswMJSC+
         wz92hrAFrBDtfow+PcS5NQ4witC+ZH3kxoN+P221H9SzWisaJGCbUed8Sgd1EZcVnsR0
         9Mg0dZa1CE9SAUnBsZUnGBe9l0Zk3H+WdqcdP9Un89TP4wYUigRBMECCgui1THK1HQvJ
         pYQVtf2rJOkqDbad3Ws4wwoGiZ8/MHACElPsimv6lxdX3s9fdBh5vNepqnwF7/pKAwm5
         2qqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763722898; x=1764327698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iEVZCcztr9EOYMu31Bx8peC82HjT/I+z2RQHL73/z+w=;
        b=J5VShbM0/ZkUyK53uFYdF3NWG8C7zRF0ssEvmP16BXFq7LRIFCjkKQCr6LqvKMPVf8
         fxBt9N1kRKSA3a3kCxwQH4JlCNndBnYdRqF9ugiyM2lbRb21ek+0pvnTMZ6WPDaDgH8r
         91lVGwwSRytW5+Wph+s1jfN3GMsUHxjJUwd34r+nlrG2HX37NJdJZZDkmZkUPscWBNTv
         DdlNfVtZ2X5SBSBr+pdIjmmSn02YlI78F/W2JA/yJ2ShdNcCHwENFj5iZ5Lv2ax0Xc9p
         NC1iiHzMYCfFwDwwrQ3lDbk41OVK3HAWEgLt4x0dDk3g04nJobJqEnO0zffgM2kfvacT
         GRSQ==
X-Gm-Message-State: AOJu0Yyr9p9hTDC8osD3x2nbQh9bLMT3kH/y7/M4X+lMjEd0dgcXTuJf
	ZoDfYyoZ/S1p91IUcK0PeJp28xwsDsDlavYBbK0bGh4hUijDwlVQEF2z2skKiWZ1bUq8ulri2QL
	gjbJZFtGnvVxVJwZoqi6yru8Kezuitx4/+GGU8djq2qxFhsdK9rfbPXteDlr4Zf8CPTDs
X-Gm-Gg: ASbGnctRWBN4npzJCRFZ6fDWChqcQ9KT3DlKkgQ77YpWmQtHpvz7WluX7x+mwRqalsz
	o5xqLDvRd4NJJdLHnp0ffRTBJmoYfNVnAMhN90uizBMAygmRb1jbehZRYjAVC22h/tl25hJrma7
	YBFET8+F9K4vZkyid3u8kq9wyHIhUe0oBbbiF5ZEv5/7fbQxrpEzL26A6vbcG5ay1eiCd0EzMdx
	Xr7bBTZ3SLo+MzhsJLxfRRj2PuaFRvYfctqwxzdFywm/YitFTd8csZ5kbqCtJ7Mp3ibFIYKgbt1
	agvL7ETy1/ObeGh3HAHVb6xGXw8AYkJmavh/1M0kmuAyB0nYfJoJOj6Ot9LpfNU/9OcuRnm9n89
	FTMIYMYFMOxZOHEQYwg+0qskA4tXanf/c3bsV
X-Received: by 2002:a17:90b:5544:b0:32e:2059:ee83 with SMTP id 98e67ed59e1d1-34733e4c8efmr2697506a91.7.1763722895945;
        Fri, 21 Nov 2025 03:01:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrc8AZ2Iq3QEg/QC+qwSygGiOivK/qGNgE0h1CyEBx7hyw8ywZHo3+0ygzvW80e7rQOniRAQ==
X-Received: by 2002:a17:90b:5544:b0:32e:2059:ee83 with SMTP id 98e67ed59e1d1-34733e4c8efmr2697422a91.7.1763722895243;
        Fri, 21 Nov 2025 03:01:35 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727d5208csm5191165a91.15.2025.11.21.03.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:01:34 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 16:31:05 +0530
Subject: [PATCH v8 03/14] firmware: qcom_scm: Rename peripheral as pas_id
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-kvm_rproc_v8-v8-3-8e8e9fb0eca0@oss.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
In-Reply-To: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763722879; l=6116;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=KUuA5AXV3d7PwlEmiR2ZurS0DdJb3IamebuV5ckZzmM=;
 b=S1fUJVjdmIXkcbBArv2lf+kkveJc/DfSR0SLuYtk9rZManJlUISfhrs3hoi7eCop83xv06Htb
 Tjr/UK2sDUTDpiuEE0mdt6awOLPkJCMkr0UAhvM0aRCCfAJ527G4blo
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: y6JkMq1Isyp9G4ZF1c5q3p3X0uA_xl_U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA4NCBTYWx0ZWRfX2FUxIvscy/li
 gAVFhXz1cq0MC9NvCDNT2c/wXX12G5LIkWirKA/1TxVecTeI7jx4/WOi60QhGdwGCOAVkg4N5MB
 ABb0RvDsKNxqSmYSb28sgw+bHwwqAw1FZMGGDq5a3XNuXjMpz61XGkanCp3RKxw+DOxEeYsLveS
 E1whiM7LXBuIKZpUdEqama1T/MOcgguPrRWBpUh11qF+JHvlX0uJ0AIEvd4AtKfWZit6DQBxWaK
 wgwlHHL/lu8XDWEky63T6EuR+TrlrvUdsISTFJXlJDnsQM/w+N3VN6J4GyEr0at4RrajSB41Zkg
 D+Bl0JTGqcCr3r8Yf0kj+AvD7geYhE4bAHQfEtiTQooPDEp0UAlJKtGjJHjJ6Rlf8HnErBCIAbx
 vnpSyvxU9wNsGTQdlKNxZNvJusjICQ==
X-Authority-Analysis: v=2.4 cv=bpdBxUai c=1 sm=1 tr=0 ts=69204692 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=bcWw3dkznkfw-y6_B5AA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: y6JkMq1Isyp9G4ZF1c5q3p3X0uA_xl_U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210084

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


