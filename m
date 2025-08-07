Return-Path: <linux-arm-msm+bounces-67970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB870B1D397
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 09:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D540316FFD5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 07:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A02824728E;
	Thu,  7 Aug 2025 07:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ky4Im7bc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5306724679B
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 07:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754552614; cv=none; b=tqFYozt2RodaboZmejHa31kPpTtfrfvv37BEoBSnd1/b0moIxX6COapcne5rhaM+R3syK/B8YeIHpz6Jhi9dzekU/AjG7Ijp0qtnzwoG9fvEofguTrMOfEwzj7FU4m55/FyCKR3KmUTvxj1jyjQzs+TBF1TRB1sKQJ3dmnasm1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754552614; c=relaxed/simple;
	bh=A3O1xl8RUBsoa7LYTvI0IwWA+Bo0PVRRbpnvD214+oA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MQM/+32szhRVIf5uYYGp9n5H4a4ROoMTVXAEb1n/cEziPo+neuaDDjHb1h8Tf7mH4nxE88HECe/15K3UsJP907hJ8NVtAuA5mNukI36TpVwnkMs9YGsw+/5CeFWpxnDvwB21ShxkIWiKEFVXx94rp5xCNLxbTlGYVp1q/INUxjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ky4Im7bc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5771dRvT031590
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 Aug 2025 07:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WT+CIeVJn2Q
	FhT2o5F/6uWjOiW3WFLRnB3CG6MAoQBs=; b=Ky4Im7bcAHZKRPWHasfRsg9EbTP
	3BopkN9ED/RlBjrMlH98/qhwL2+BIKESnKmvc9zaSFViETARS50dviyroQ4m5aZF
	mShEAsGNki4b8aof8Qp3lGleKILeH63rTZdsWStljsaJfiapPPwU8SnBBj9whGHT
	88PhG814YfNxS23NNA4nBAK7phVISqMgaqVjI+fOvjCWcU2Hn7MvJVsQ7Fx75NUG
	HtTK7BuG5XE+BVm0jZPsGFt4ehxOBPCZR8ue6ZVPPee9BL3iwlwtB/H9EhqWhG9i
	2Vy2alWZUvxParTbG3uxEE2J761MQA36QD4eq4fw7DpsVzUnk9DHyTeEdfw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpybdmv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 07:43:31 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b115fb801bcso967845a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 00:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754552610; x=1755157410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WT+CIeVJn2QFhT2o5F/6uWjOiW3WFLRnB3CG6MAoQBs=;
        b=H4rZdMWLpom6jE3cCWKZovjI2hb9NBX4tdMSsL1eJ4kLLQtAqQKPMSY3OkcNY+pEjQ
         0IM7K/FGdJAP3wAF3amwj3dEXa0YRZ5a2ywCm9M8bTbKj18GhqOU9AJM9L8TCka7evFR
         fNlXDTmPSyomoMuQJ/5pQmMIueVmARkTdOImsdfClbQMggPcZcRezVjfOEvG5mY+GQo1
         pFx9yzuKLgrTqPmZXi5ekD9fkbYmwBxz8gTQJR2VC3VEg/51efdHf46DaPWKSUeMfwYz
         QGxVBla7xy8XlKbBntUQJNta0cT5boxcvCw0lrpb3l3tHX0KtCshK8YJWReiL7i7kB/N
         bMbA==
X-Forwarded-Encrypted: i=1; AJvYcCWQPR9KK2HTyjvkRzuwfZj/QbRtdf0NR0fwcI0hPmL16DMtybdRsbctMIGJi41ou3oNECPDCfsMFRNp33tj@vger.kernel.org
X-Gm-Message-State: AOJu0YyHZoaguhOC6oNR+EF1rfvq7vUonf/CFSJQtiNfIy1s7RVA8vyA
	fcf/PypAgvyDI52dDLS7SQb8+3mKCWr4bwMFSItA11YGuPJvwXcgngYMOqGkI4d6RI4vzP9RtAM
	NiF7E1G3uT9SDDLms6LWn0g4XHvtRe657BtyiN67phdMkmDuRc8WEj0//mrhtjQHo337j
X-Gm-Gg: ASbGncuvw6HPHkEHDwA2w7EMO4rF53Y26vAJFOnTu0gVp9LbnYWKB80pUxnczORg1so
	IJ9wE0dfTnrw2GtnAs+Pyros91+nIzFGCgKQ5sX7Q4Q0Ob7/wECnMqD4ioUyStpaIhHB9VNQQhY
	3HhoVS3SvIhyks6vRQh0S9ghNW4S3+v/Mtpduw81BRogHt0Bovn0pvMAzx2e5Uo1cdHvOIqWZQy
	M2SzdsOoAKYV4KS4taq7x80zbslvcx3LvItW3y4c+J9Pq5tuVvDo0Kt9XLLML7QGRR3a97hN49i
	LYHXeQ46r9wQQS2I2hndTh0g5nMcWVhn35Ap9D9UNNHu2z2zPjgGnKn4E8N0KoCF1z4=
X-Received: by 2002:a17:903:1a10:b0:235:ed01:18cd with SMTP id d9443c01a7336-2429f577b53mr78378195ad.44.1754552609728;
        Thu, 07 Aug 2025 00:43:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGx6K1rPHdZzRDwso1fe5RcL4zn/OIDD1dI/Ux46JXvnhXFWnqsvJ6TnWvFgdc/zt3A/9Vvg==
X-Received: by 2002:a17:903:1a10:b0:235:ed01:18cd with SMTP id d9443c01a7336-2429f577b53mr78377695ad.44.1754552609259;
        Thu, 07 Aug 2025 00:43:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef678dsm178166395ad.39.2025.08.07.00.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 00:43:28 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [Patch v3 2/3] soc: qcom: mdt_loader: Remove pas id parameter
Date: Thu,  7 Aug 2025 13:13:10 +0530
Message-ID: <20250807074311.2381713-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250807074311.2381713-1-mukesh.ojha@oss.qualcomm.com>
References: <20250807074311.2381713-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX1caA0hE/3/sG
 C6/61bcRu0JMb4Jkt0v+Wwe1JaDBoSGI8GhqVlmRm+F5DfVQF96WWqcJXt/5ewpsfFztpIrv4LF
 9L4oLgwbScX+9LP3RltkapvcP6/HpQIn5omhLcitCq7ggc/LoSuXQhvn7pUzZWD73hoScK+RS84
 hWwYfaZpffivEH8UGm0X6Vxv7nF282Qw5/AV4KFwAyRYWtMRJrwvfkHKG0cLIK79pBbCDeMfRhB
 xFnVlJoymvf6d5vSKdxkjVGO2LHeNiDiPTeLBgOsHalki30bZJQPO5hVAXb6MSI3TqpNNzMF2l/
 RBtuiidEFx3KSqeZJaf+YYRVkkod1GZ9QlBxZYhJhQ4pnBEUeAhBIBTNK16rTHy0jOQnvwZN7sb
 XUWmD3K0
X-Proofpoint-GUID: wcivOkv4pMHzXGnTtceNCWVp9jj2YgX7
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=68945923 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=8m4FMoEBHb0BRpTWb9cA:9 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: wcivOkv4pMHzXGnTtceNCWVp9jj2YgX7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

pas id is not used in qcom_mdt_load_no_init() and it should not
be used as it is non-PAS specific function and has no relation
to PAS specific mechanism.

Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Acked-by: Jeff Johnson <jjohnson@kernel.org> # drivers/net/wireless/ath/ath12k/ahb.c
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v3: https://lore.kernel.org/lkml/20250806172531.1865088-3-mukesh.ojha@oss.qualcomm.com/
 - Some left over removed from this patch and moved to 3/3
 - patch order changes due to drop of one patch from earlier version.

Changes in v2:
 -  Added Acked-b and R-b tag and its order in the series.

 drivers/media/platform/qcom/venus/firmware.c |  4 ++--
 drivers/net/wireless/ath/ath12k/ahb.c        |  2 +-
 drivers/remoteproc/qcom_q6v5_adsp.c          |  2 +-
 drivers/remoteproc/qcom_q6v5_pas.c           |  7 +++----
 drivers/remoteproc/qcom_q6v5_wcss.c          |  2 +-
 drivers/soc/qcom/mdt_loader.c                | 10 ++++------
 include/linux/soc/qcom/mdt_loader.h          |  7 +++----
 7 files changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 66a18830e66d..862d0718f694 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -136,8 +136,8 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
 		ret = qcom_mdt_load(dev, mdt, fwname, VENUS_PAS_ID,
 				    mem_va, *mem_phys, *mem_size, NULL);
 	else
-		ret = qcom_mdt_load_no_init(dev, mdt, fwname, VENUS_PAS_ID,
-					    mem_va, *mem_phys, *mem_size, NULL);
+		ret = qcom_mdt_load_no_init(dev, mdt, fwname, mem_va,
+					    *mem_phys, *mem_size, NULL);
 
 	memunmap(mem_va);
 err_release_fw:
diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 3b983f4e3268..b30527c402f6 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -414,7 +414,7 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 		goto err_fw2;
 	}
 
-	ret = qcom_mdt_load_no_init(dev, fw2, fw2_name, pasid, mem_region, mem_phys,
+	ret = qcom_mdt_load_no_init(dev, fw2, fw2_name, mem_region, mem_phys,
 				    mem_size, &mem_phys);
 	if (ret) {
 		ath12k_err(ab, "Failed to load MDT segments: %d\n", ret);
diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 94af77baa7a1..e98b7e03162c 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -317,7 +317,7 @@ static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 	struct qcom_adsp *adsp = rproc->priv;
 	int ret;
 
-	ret = qcom_mdt_load_no_init(adsp->dev, fw, rproc->firmware, 0,
+	ret = qcom_mdt_load_no_init(adsp->dev, fw, rproc->firmware,
 				    adsp->mem_region, adsp->mem_phys,
 				    adsp->mem_size, &adsp->mem_reloc);
 	if (ret)
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 02e29171cbbe..55a7da801183 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -242,9 +242,8 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 			goto release_dtb_firmware;
 
 		ret = qcom_mdt_load_no_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
-					    pas->dtb_pas_id, pas->dtb_mem_region,
-					    pas->dtb_mem_phys, pas->dtb_mem_size,
-					    &pas->dtb_mem_reloc);
+					    pas->dtb_mem_region, pas->dtb_mem_phys,
+					    pas->dtb_mem_size, &pas->dtb_mem_reloc);
 		if (ret)
 			goto release_dtb_metadata;
 	}
@@ -307,7 +306,7 @@ static int qcom_pas_start(struct rproc *rproc)
 	if (ret)
 		goto disable_px_supply;
 
-	ret = qcom_mdt_load_no_init(pas->dev, pas->firmware, rproc->firmware, pas->pas_id,
+	ret = qcom_mdt_load_no_init(pas->dev, pas->firmware, rproc->firmware,
 				    pas->mem_region, pas->mem_phys, pas->mem_size,
 				    &pas->mem_reloc);
 	if (ret)
diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 93648734a2f2..07c88623f597 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -757,7 +757,7 @@ static int q6v5_wcss_load(struct rproc *rproc, const struct firmware *fw)
 	int ret;
 
 	ret = qcom_mdt_load_no_init(wcss->dev, fw, rproc->firmware,
-				    0, wcss->mem_region, wcss->mem_phys,
+				    wcss->mem_region, wcss->mem_phys,
 				    wcss->mem_size, &wcss->mem_reloc);
 	if (ret)
 		return ret;
diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index dfd15d189087..74c415774657 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -331,7 +331,7 @@ static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_na
 }
 
 static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
-			   const char *fw_name, int pas_id, void *mem_region,
+			   const char *fw_name, void *mem_region,
 			   phys_addr_t mem_phys, size_t mem_size,
 			   phys_addr_t *reloc_base)
 {
@@ -458,7 +458,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	if (ret)
 		return ret;
 
-	return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region, mem_phys,
+	return __qcom_mdt_load(dev, fw, firmware, mem_region, mem_phys,
 			       mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load);
@@ -468,7 +468,6 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
  * @dev:	device handle to associate resources with
  * @fw:		firmware object for the mdt file
  * @firmware:	name of the firmware, for construction of segment file names
- * @pas_id:	PAS identifier
  * @mem_region:	allocated memory region to load firmware into
  * @mem_phys:	physical address of allocated memory region
  * @mem_size:	size of the allocated memory region
@@ -477,11 +476,10 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
  * Returns 0 on success, negative errno otherwise.
  */
 int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
-			  const char *firmware, int pas_id,
-			  void *mem_region, phys_addr_t mem_phys,
+			  const char *firmware, void *mem_region, phys_addr_t mem_phys,
 			  size_t mem_size, phys_addr_t *reloc_base)
 {
-	return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region, mem_phys,
+	return __qcom_mdt_load(dev, fw, firmware, mem_region, mem_phys,
 			       mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 9e8e60421192..8ea8230579a2 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -24,7 +24,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  phys_addr_t *reloc_base);
 
 int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
-			  const char *fw_name, int pas_id, void *mem_region,
+			  const char *fw_name, void *mem_region,
 			  phys_addr_t mem_phys, size_t mem_size,
 			  phys_addr_t *reloc_base);
 void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len,
@@ -54,9 +54,8 @@ static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 
 static inline int qcom_mdt_load_no_init(struct device *dev,
 					const struct firmware *fw,
-					const char *fw_name, int pas_id,
-					void *mem_region, phys_addr_t mem_phys,
-					size_t mem_size,
+					const char *fw_name, void *mem_region,
+					phys_addr_t mem_phys, size_t mem_size,
 					phys_addr_t *reloc_base)
 {
 	return -ENODEV;
-- 
2.50.1


