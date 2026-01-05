Return-Path: <linux-arm-msm+bounces-87439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1893DCF3DC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 14:39:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27CDC313B499
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 13:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5B933D4FB;
	Mon,  5 Jan 2026 13:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+EtdG+q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xu6+4JwC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE86B33D4E6
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 13:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767619426; cv=none; b=k0j/kkyNnxEvHheSL/3/zUOliF99/0pAii2Rnqjv5pNqG3WQMJlBYUmWpBqd82FBgF7JN03sfZgZP3lUnc5A3bWudWZa/DyySbpsYOfNr1kQ/Th+kzqQHH8Oa5xnBuaY0KK25IvFvtVOPb9LaKfV9PUwnimfiwwNS2UtnZGhkAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767619426; c=relaxed/simple;
	bh=L0f1qWRMFAeXFyR0rIUg5ggvHEBiDcRfJhIUkFhR0Vc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HAVHYGOReYNHuFYiKvGHvayFnGmA8SWt0rbIu5au6DFKNVRBiRbfjRrFmqI3zX9F2FTuo4H/70vcPPLk6ylcjTWFEb5sm5pxU9Br3pbBmZ6INuSxxaaImDP4bqVrxBdFUznB78gciSsrfyPsuKSqKhTdfLV+8R05eXxXjA2pFQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+EtdG+q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xu6+4JwC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058K0gQ3895225
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 13:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gVFFkdNsP5gHrb05VtnrWWMCJqLpes7QIYPNx6a0/HE=; b=E+EtdG+qWT69sJUa
	tOB1TWR9vkJbKZKVgrQQ2YUNdnGdX4ORL44C+eGHCi2b0tPiHGhnYp7/uJfsQXm7
	c0PwBPbfLaYlIp2ixD1m3iw1iJfDvKwa3qu4lDHsBCy+ZC1XspayCrzX9/3Cqv5T
	Dsd68i7Zd15RftScTaE2vyeQrImZtLJ98sJunoAEMV5jmwlT9xZDZV/e2LxdThnF
	0Fy8ze54TaZT/sbhQftGAhO/M1uiwA1U61LD+4TXlX4Fen+vZ8g6VwXQ1PWx8r9p
	qrDDv8OK52Rl9KU0i9Y4wOHq4HFV2x63ohKwATi57+EGBEzUj/foU/ffKoUh5kkH
	6KER1w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beuvd4jd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 13:23:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0e9e0fd49so19406095ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 05:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767619423; x=1768224223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gVFFkdNsP5gHrb05VtnrWWMCJqLpes7QIYPNx6a0/HE=;
        b=Xu6+4JwCT3xTRaKM+t6Goiji1NvkPqYUws3IWuMD09wS1m6TyhXO++8T0Hptdz5RkL
         +o6RzjbnB0yvkOefvZCcOjjzb62nxE7g66OZYq9YKEl/yeDJZ89+msMEL2cbm/hKbO6R
         xg94mbKQzvkfaQcyF51voXliahpOHVdeCMWSO/lKSoZJgVuo36/hMSQmwzv8iF/zyGXY
         63+/Z6PMV6sAFVlebnaDSDInyN1mBGvwzq5GuJjMuz540nrmaopcc5Q25/erJm/FpYF6
         4W7ztF82LCXlRNn0BiTxPGgYGs4okzL+d7gXQ6zrFyqIzTUuM97vFQvPUEA8kX9OH16b
         vLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767619423; x=1768224223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gVFFkdNsP5gHrb05VtnrWWMCJqLpes7QIYPNx6a0/HE=;
        b=NV8GEcxxAWSA0u36ynTvwfVtcWypTkuCijZ/w8Z8SzVKvqcuYDz564xkcZNPiBfJGD
         hIWRNAH8MqHMD19WT29eLv/y9/8p5jZq9K7yd+9GZbfQ+ZHITJMApWW/wevx1ukq5J11
         GkY3mfz5gRkrr/wb7UGI64HejCAfIUXPuEvWE6g1Vp/VNWxOdX/jnGpFXhKCv+LBOcRa
         pjEDaZaomy+Mn/3Rj/ykovjwzucLrNwgcIbfgRO/KM4lONinEpK0AbE4tGUf6JoIqIF/
         wUnKbt/8bHl1XHkLLLplttB7KMYlbJi1cbfivGkC1ZaIRzlTaE1AzA/G4lf/GsbCsxTy
         +hDw==
X-Gm-Message-State: AOJu0Ywk+KdXRf9yVYNLWZIK+1RVn+zkt4fAGLRKkMjaxM9ENLUiZtYN
	stRFQtGqnoVoRbSGGdTZEjnyeZ9aP2b9fyiY7mcyhWiO+ltRojccezHC2hJ+clUnrXleta916wJ
	8xgBwkde3d79K8feEPWy0QBqj6C3jw8RMZLGIYMm571OAU4q9aBgadbNEsTQDJa0GWhCn
X-Gm-Gg: AY/fxX4835SgPZYhZf+EKRtSVo8+jTtuHw5cvay9a6c4LcAUfrlg1Qq5/GFy4RAHN7n
	L/253g516el7F5u3T4K20/BBK2Zo72V5U6VPGGM97IiBkKrp+VABPSilxDPGd9RMUtBW4GnTP0L
	NxypgNrKPiZfW2u8Lx/5DBuhv9cgXJhc6P3roXeX2gpNNVUrmVsECr9nl9W2ElPFdrKM9K7fLO7
	vQMVVhEbsDjHD950S+mR1Ph67giNyZ0jN5ekiV+gQUWz5urkj6rS2i7ogwRNZtutdDAy46T0t8b
	5QNPaBG7u4vPjrNx/2sROSumJxe9fQzZx8eia1iICNt0JvTyei1pWBSh21tNygimF0y5kJOsPgJ
	CEuayKRXqqQqKtPwYWWQ0rwNnfKHJkv1SRB8+
X-Received: by 2002:a17:902:d54c:b0:2a1:3769:1d02 with SMTP id d9443c01a7336-2a3c097b89emr75230645ad.12.1767619423353;
        Mon, 05 Jan 2026 05:23:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESxIUEbWDZCgLHhKsCl+niSuEBPAq/eJ0HXAs0HRi98Y74GnLxyBSNkVetg60DtIYkzvYk1A==
X-Received: by 2002:a17:902:d54c:b0:2a1:3769:1d02 with SMTP id d9443c01a7336-2a3c097b89emr75230335ad.12.1767619422728;
        Mon, 05 Jan 2026 05:23:42 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b127b00sm48426542b3a.21.2026.01.05.05.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:23:42 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 18:52:55 +0530
Subject: [PATCH v10 07/14] soc: qcom: mdtloader: Remove qcom_mdt_pas_init()
 from exported symbols
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-kvmrprocv10-v10-7-022e96815380@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767619390; l=4020;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=L0f1qWRMFAeXFyR0rIUg5ggvHEBiDcRfJhIUkFhR0Vc=;
 b=UWtwg1PkJV8qhyhGt8CHS53ydxNgM2IbTvUJaSWNggjthqxVIRhHX9u/Y6Jk9EHbwqaYu7g7a
 iCnMsubFrLsCkdd22Ihfj7J0IsjtJIex4XljP9x9rQ0NtbvaBuwp0b9
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: Nd_G-sHAQrbOijU2HVC6pUjpUxA_XrZL
X-Proofpoint-GUID: Nd_G-sHAQrbOijU2HVC6pUjpUxA_XrZL
X-Authority-Analysis: v=2.4 cv=OuhCCi/t c=1 sm=1 tr=0 ts=695bbb60 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Z4Sw7GGoVt5sTUwIiKwA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNyBTYWx0ZWRfXwOeA0eleRo/S
 ZnC8E+/nzyhK+PbDeePPRa+gqjWSb41caF0ZxzAQMwZChOMc/spuGMGy9pRulO6mT02EZKwrXIJ
 d1PVgC6PyooS3mWKCk44mFcWAsw5T2HOlF1mTAhWmHfFRm4JqnBXA0nzoE/XefPW92oUM3qom3e
 SrPSJro/6b9cErl6pDyw479czvlNGvusc0KK3v0MIv3l9oRW3gcT2BuGKzoVul2uo3feIoD1sMg
 HqIegxLIgfuYzaKmpu0hCvH/QyEdV8G4jlBnHrv5JXOikkG8Myhp2PLSZ2CMZUZVB7ne9D09UGZ
 DC34/A1/oeowjOC4/3aLNxGxytrwt2rISCn0C5yJK149bNpch9kqQjgKQIIOaxiZ9sAM8ePOXV2
 ZBAfzhrneLPVtJ0KOpr2MkQ8OnLjtsshCFvRcFjTOHhYPcAhOuFolQvMALWZcRyRabng78kGlfn
 iQnbiqlV3+mVu5zXApQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050117

qcom_mdt_pas_init() was previously used only by the remoteproc driver
(drivers/remoteproc/qcom_q6v5_pas.c). Since that driver has now
transitioned to using PAS context-based qcom_mdt_pas_load() function,
making qcom_mdt_pas_init() obsolete for external use.

Removes qcom_mdt_pas_init() from the list of exported symbols and make
it static to limit its scope to internal use within mdtloader.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c       | 22 +++++-----------------
 include/linux/soc/qcom/mdt_loader.h | 10 ----------
 2 files changed, 5 insertions(+), 27 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 50c6a3c6b2a3..c004d444d698 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -227,20 +227,9 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len,
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_read_metadata);
 
-/**
- * qcom_mdt_pas_init() - initialize PAS region for firmware loading
- * @dev:	device handle to associate resources with
- * @fw:		firmware object for the mdt file
- * @fw_name:	name of the firmware, for construction of segment file names
- * @pas_id:	PAS identifier
- * @mem_phys:	physical address of allocated memory region
- * @ctx:	PAS context, ctx->metadata to be released by caller
- *
- * Returns 0 on success, negative errno otherwise.
- */
-int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
-		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
-		      struct qcom_scm_pas_context *ctx)
+static int __qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
+			       const char *fw_name, int pas_id, phys_addr_t mem_phys,
+			       struct qcom_scm_pas_context *ctx)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
@@ -302,7 +291,6 @@ int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 out:
 	return ret;
 }
-EXPORT_SYMBOL_GPL(qcom_mdt_pas_init);
 
 static bool qcom_mdt_bins_are_split(const struct firmware *fw)
 {
@@ -469,7 +457,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 {
 	int ret;
 
-	ret = qcom_mdt_pas_init(dev, fw, fw_name, pas_id, mem_phys, NULL);
+	ret = __qcom_mdt_pas_init(dev, fw, fw_name, pas_id, mem_phys, NULL);
 	if (ret)
 		return ret;
 
@@ -500,7 +488,7 @@ int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *f
 {
 	int ret;
 
-	ret = qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys, ctx);
+	ret = __qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys, ctx);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 7d57746fbbfa..82372e0db0a1 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -15,9 +15,6 @@ struct qcom_scm_pas_context;
 #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
 
 ssize_t qcom_mdt_get_size(const struct firmware *fw);
-int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
-		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
-		      struct qcom_scm_pas_context *pas_ctx);
 int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  const char *fw_name, int pas_id, void *mem_region,
 		  phys_addr_t mem_phys, size_t mem_size,
@@ -40,13 +37,6 @@ static inline ssize_t qcom_mdt_get_size(const struct firmware *fw)
 	return -ENODEV;
 }
 
-static inline int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
-				    const char *fw_name, int pas_id, phys_addr_t mem_phys,
-				    struct qcom_scm_pas_context *pas_ctx)
-{
-	return -ENODEV;
-}
-
 static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 				const char *fw_name, int pas_id,
 				void *mem_region, phys_addr_t mem_phys,

-- 
2.50.1


