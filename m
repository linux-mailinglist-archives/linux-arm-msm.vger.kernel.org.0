Return-Path: <linux-arm-msm+bounces-67940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CB1B1CAB7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 19:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6791C723316
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 17:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE0029E0E1;
	Wed,  6 Aug 2025 17:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qj22OZV1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E17229E0EA
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 17:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754501167; cv=none; b=C0jj8AaQMJlAJs7r+Tm0bzyBhBrlLXhgKKtOOcfOZg3Noc/V21lY/Ocf0xZOXURviF14cK8cTL8ezFDqO6pj8dSzk52w3m636MoiTS8NRucGRiv2yqipAsomSLZFNjmoW8BA9uUU4URHUw7jVH+C5VFKdyFgRfNtm8YdKiX+GmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754501167; c=relaxed/simple;
	bh=ZO93DmorJCrICjGa2WYZwa7Dr2unYuK5orXsLdI/EXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EqNYQ2y2iVqqAOedp5yjxsILxv61DGxAwG3SwyKB8FCzhMrRafUlPU3aZf9ComtSidQFBUTCb00OWCEGrBHvw1tHSk87O73BC0ePw69OxrSQY4oAkDY+VbTXi+dSn1G+qZeKld7mFAB0RzTwCZArXWpm9RBzhef9aTWJfLKHcUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qj22OZV1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576E8m8J010375
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 17:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=a2nLA9lQVj2
	kz9XUdrWfpoRam7BqcN0+aOZG4RexWvY=; b=Qj22OZV1ckWTmAiK4v0BfOcLzdK
	wEmkeiNfeHMVfOHV7L9IcoB0d/GfDhes/gNOeCK8OWSfV4V+x7ttd81qCVN4+f3b
	hFwdhMI8NK58aJFrk5tV1JXKvAd5g83D8U/rYn0fi0gIctcgDcZLYIXuW7N8R9Iy
	IYPKaVzOMc8ewXiVDyvmKTSgWFuyYOWMi7XBO9vhTZ77d87Prd5Opt9IG4a62eLT
	bORrr13fKvQNWI8aAAmeCM5mKsZCLAYQ6yZIc8fTbX1rddt/ZVtxGYzbUJhJ85MD
	vBKQVIDgJKqeOgYBOaFJZEgmLXzaNAoc3buRcmiIaRvhCNMz0V7T4wrhLIw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy7uk4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 17:26:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76bfb082331so162923b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 10:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754501163; x=1755105963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a2nLA9lQVj2kz9XUdrWfpoRam7BqcN0+aOZG4RexWvY=;
        b=nwsaQ4voktPSGz0GIEyeJDpnhmnmvnT1OX0wYaHufXjrb5fkv833iVwLFfeH43/Q/T
         VnMONwUy+/cCDojg7G8gAviKeGfNRDkTT7ryYNuUogORhG2Qf0Gco7qxgwn0IJFwu7ZH
         fA9EJs2rIqCbGuMPsc+dEzeJNFSfaALkjBPbpV8h6X8c65Omb/rVQSbtWw0E3S451dLb
         fMlFkTIeAnsA72xPrMoliDa26uncDlypqmzzLe5PuAHMNtIxrmusOaanOkJ86CesRXkP
         NF45S9v/oLsBhHI2y4ZXv1EtLG9hIshJbvS7lBhCyrr4iSIGx+BBPJVDiHEtpglIuKr6
         GHAA==
X-Forwarded-Encrypted: i=1; AJvYcCVk5DpuM5Ye0OjvI0O1Ps8YNMGa0ZWunJ4VHFlwryyLFLTmHftb+1Bfy+15+Grgi2R3c2Wvfbsjd94LpptK@vger.kernel.org
X-Gm-Message-State: AOJu0YxMpuPaVEv1tIps3ftzGuKY/gyGw71gD3LsA2KmTsJRe8/HOxkk
	sFkOFS+wgpcsFc+PojXwpktWo+NGAiKT+EFCB8/QgJc28Mrlg8z0niYamNjUlF6cDlnrgeU15RF
	y96PldyNzicpYwMjok5bIBXErKgAhU7sPC3Rak3VTScvWdK3A9PUE5pIWNEiA1OuGiobx
X-Gm-Gg: ASbGncs8sAFNxxsRU0o8DsabFmqdN5BDjX4aICAoAUFbj/mUk9VefWSpoZhTrRcKhCJ
	aCQ2e9l8NcUo3KNMfImlT0eoWtGj0j5pfSqEp7pUiwt5l9xGehvfmJbn/2KTMQMC8NewIcAuzYr
	0RWpRjW8geS/SctvUCtVfRYCw6ScKrLRSL9pEqFUUaZbVw6PHOwp+MuaAXy8lQ4O6hYzzmOCOdL
	o4nEntCasciVrBKfCGTsWsOYfIbyhQG+Kc1bcV0eGzR/o1Ilht3xvOpLfWVIBHN9Rg9oI+TAyPW
	QOcZwPM70ig4CMG880yImtaA42NZqi7y0gWwB3NKbflQI6pFtfR2W3nJq2iMFBlv6S4=
X-Received: by 2002:a05:6a00:1916:b0:736:54c9:df2c with SMTP id d2e1a72fcca58-76c2a81ddd9mr4509567b3a.15.1754501163344;
        Wed, 06 Aug 2025 10:26:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGV4H02pbHydqJ6/iNLS7z5YUQ/NCi194v0TPITRvqzx9kg2EFriRJw8sUmEqDtQaoxOhNfAg==
X-Received: by 2002:a05:6a00:1916:b0:736:54c9:df2c with SMTP id d2e1a72fcca58-76c2a81ddd9mr4509523b3a.15.1754501162795;
        Wed, 06 Aug 2025 10:26:02 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8f417sm15866210b3a.44.2025.08.06.10.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 10:26:02 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 3/4] soc: qcom: mdt_loader: Remove pas id parameter
Date: Wed,  6 Aug 2025 22:55:30 +0530
Message-ID: <20250806172531.1865088-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
References: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Mftsu4/f c=1 sm=1 tr=0 ts=6893902c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=8m4FMoEBHb0BRpTWb9cA:9 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: BpyOzx4hDMUpW0f6xg-Qu6Mx5nFcDVy8
X-Proofpoint-GUID: BpyOzx4hDMUpW0f6xg-Qu6Mx5nFcDVy8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX64zpw9f0i7uV
 xlT/usOiZ+IdU3HUhOpn/jdPM1AeyUSS5OIG5FGoWWRmKiiQ0oeGP6CYH9RjY8gh9eYjYYaH+zr
 uCUiZblckyysn90yVjTAmHvGwqOL2JROEz9DAAdYU5NcaGdA/1lUleYhJYd6RhJiy7OxxGWkxAE
 kO012t0/n6AyqbwJvgYKIjeqVN7Jmxr215LVEUyXwT8d8qiQ03CcEtMQGjvnqvDb5cnoXXc69eP
 zBLMlatIfURxv3NTzD7icpNhGCQKoO/OrTUg5Z3JyXA0Thtf0jsMcC7eo3PfGpi034S8b11TrMN
 KF4VZBS51tsEu8oXipsFTWcwQCVW4OnsGSXMnZqGHjBCHRuRH1Lw0nRKFBoCdhV+26Z6bJOTfGR
 xxjgTd42
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

pas id is not used in qcom_mdt_load_no_init() and it should not
be used as it is non-PAS specific function and has no relation
to PAS specific mechanism.

Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Acked-by: Jeff Johnson <jjohnson@kernel.org> # drivers/net/wireless/ath/ath12k/ahb.c
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
 -  Added Acked-b and R-b tag and its order in the series.

 drivers/media/platform/qcom/venus/firmware.c |  4 ++--
 drivers/net/wireless/ath/ath12k/ahb.c        |  2 +-
 drivers/remoteproc/qcom_q6v5_adsp.c          |  2 +-
 drivers/remoteproc/qcom_q6v5_pas.c           |  7 +++----
 drivers/remoteproc/qcom_q6v5_wcss.c          |  2 +-
 drivers/soc/qcom/mdt_loader.c                | 12 +++++-------
 include/linux/soc/qcom/mdt_loader.h          |  7 +++----
 7 files changed, 16 insertions(+), 20 deletions(-)

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
index 63af3e97c93b..145bd1374f07 100644
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
@@ -353,7 +353,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	if (!mdt_header_valid(fw))
 		return -EINVAL;
 
-	is_split = qcom_mdt_bins_are_split(fw, fw_name);
+	is_split = qcom_mdt_bins_are_split(fw);
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
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


