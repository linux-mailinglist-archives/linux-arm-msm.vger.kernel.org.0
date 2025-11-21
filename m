Return-Path: <linux-arm-msm+bounces-82813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 60566C78A25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:03:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 55F1335DD1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 11:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46FB234B1AF;
	Fri, 21 Nov 2025 11:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ncTj/dlm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B04U2B+m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EDA346E46
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763722915; cv=none; b=Dc+trZ+cGc+RPfIGafswJmB5ZaEuppQ1tGGKmj31sqFLMyqMdFHKHIhRmz4F0BRxdaIZUaNwrSAekS3tDYP9+LBoQ+E4n7pCSq5tlmCsczsz2aQxPgWBI+gpQ2lb1SNGcQ6Ia7ExwhbclBFtt67EHuFKswFHKz2tlrzx57UOT/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763722915; c=relaxed/simple;
	bh=FAxVohbaSqYOeL1tiCXnhoUqP1k3h7eieaHb5VvFGf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yzu3Fwoi4FYs39ER0q4tLOabfX2+t+6V608bs48hFezGAJDpR7IJ6Hu4q7ah0lX3FNQN6QZyaLNAHrEFzbtUghK8aI5n5v1oMShxK17DoY7ltgPDhSMATgoj6VWrnLsSguUPOuJ2Aty9qfjblyY1vBtZ/WftUozXW38dMafBdzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ncTj/dlm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B04U2B+m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL5SCCJ2757226
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YGBJ3wXs+b7+nyeDhGQJtyljMMb0eEpcnD47PuoXhNo=; b=ncTj/dlmObrK0p+8
	cvvqwHE0/gzKBHz8vYC1AHvPTEy0wbN//utHbS51fU9EX+ZUsA1P773iCTQnexDJ
	yHWS8vacT/ORfn8LRWvlHGWioSRcD4wo2vIj23SNymH7Nbq693ehimRffoB8CPAM
	Ek79jnHYZdZFdP1Db480IvmaQI5wITF/6gR5v8xRDYBWmulIuOqZ/HwvVr+qNQ+L
	J2a7zI3OMdK1wXrMUpdk5eOc61kk1/cqQ0MNBUbGz2c+u1/quAocB5U+SEdzPCf9
	5wwZbNPS43ucmUqul4BO0In6R+FAlEp4Qu0YTGofWsyw2f8hmBORy/J7bwIdgQIG
	6b4eYA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhy615ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:01:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-343823be748so2098084a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 03:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763722912; x=1764327712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGBJ3wXs+b7+nyeDhGQJtyljMMb0eEpcnD47PuoXhNo=;
        b=B04U2B+mWyT9hKzcjohGdMFO0tA5T8MByfTYj5gIMfCg8pJ//iDij+CJhfp7fp5WDv
         eJXHIBKwoDuGDj2U0D5FeIBvNeariF7gKdmq6YbIh0iUlKsXdMMZKO5wfwOPhSfKWy8C
         y4aVgZZsfFPeLVvicYCKwktQBHMd5WucjhB55JKn26mHkwMaJ4aNYzqtetPNrQjaUjRM
         VhqiO6ckpF/ZVb2RzwABlf9CoA8tLXymdHHH9arcnkJXiS8vyp0zx4BZ1hPBc8T3zNpr
         HmI8E72UZ/GHnwyadEdoYpOY+J/8Gj7QIHY6/ieXvKqGVaUSuMyqfeLzMtw6AqnXKU5w
         /g4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763722912; x=1764327712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YGBJ3wXs+b7+nyeDhGQJtyljMMb0eEpcnD47PuoXhNo=;
        b=iHjZmZvG4QuXrXRNqyBFt6N88eZnYtUAC/lC06OMkk3kGkht4DKINTMS/SdICSTLa6
         ugM8O4ckjCbFDXa5PZzyI79NLHDGZbK/KlPte5OZiE2eIGfI5yOtdIMb0He/GwxtZpW2
         cR9WuED/Rrx1/9Wt+5Z7xZlKkgChV6UiXGniQfWsi0p7ROYpwclkhcfjXVmOMDx5CAeY
         jTfQ6gLkUAm9AMKp/viXKMdO2i86gklPTxlcA1lOShG68Jdy/yvJh/PVP279d8EezHS9
         CTUHGDJadVgV2PFQOl/MViKD+sQutVvKblyJFuTwuCWILbDhP8DwXCLYmYlJUaGcHZUh
         FM6Q==
X-Gm-Message-State: AOJu0YyC93f14ehC93WkJFInKCyOX5hG+idEwFs+FqL8cPmSbWZnbO3k
	BIgylcRGdYf3Wydc7VirJf4ZWE/BqQfFI/whU0mOZ8rchoZkXLLYAXkd314s7HaUnzoXALo30NZ
	sjHNe7WNYnTtAeR3tLbci9zfF1mxQ14YsEnJ+lW3kquTE2W9nDoumRoUIr7fod3AJmy3A
X-Gm-Gg: ASbGncvpgwjIZYwv3M97S2082TUQsXUJfM8iXapgNcr4e/Hsf6qi1jfyQMjXCEBLvTc
	pM/2vpi/BKgY/Kx/uRYsPaVesS3Y1Nhl57WiFVhb8fn1DrFP/6knlmCUg3rh3G/3XuMR69lMA9p
	zhS8BxmZ3vqN2yIDCKmeqvbl+kBWsy6VuSnUKEorvvmQOWhW0oc27x/umj7j5Mvq9kpWhqfWBHc
	F6DhTbUAoqirqdtBsHk7XGoXWALvwvihfx1Dj/FuOP4U3nKO7736/f2K2qCXlz7s0MC6NaOa4Tq
	gk/fe0B0WXuXRIwY9XqNE+6n7nVLyukCzMf8nsBgU5N9d+GHn0Sb0OV4RzutDlqKirMJPg+un+C
	kBchlMdJXTD/xNPvyGZzJhUMGrl8oXtfsRGvX
X-Received: by 2002:a17:90b:5704:b0:340:dd2c:a3da with SMTP id 98e67ed59e1d1-34733e436damr1982575a91.8.1763722911780;
        Fri, 21 Nov 2025 03:01:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEk1A2HPA/oFoQ9xE267MbaxkEtZX82lk4pzDIT9YA07/l+tPpYZrbqWfVIeHkg6PSW6SUVxg==
X-Received: by 2002:a17:90b:5704:b0:340:dd2c:a3da with SMTP id 98e67ed59e1d1-34733e436damr1982500a91.8.1763722910936;
        Fri, 21 Nov 2025 03:01:50 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727d5208csm5191165a91.15.2025.11.21.03.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:01:50 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 16:31:09 +0530
Subject: [PATCH v8 07/14] soc: qcom: mdtloader: Remove qcom_mdt_pas_init()
 from exported symbols
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-kvm_rproc_v8-v8-7-8e8e9fb0eca0@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763722879; l=3524;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=FAxVohbaSqYOeL1tiCXnhoUqP1k3h7eieaHb5VvFGf8=;
 b=D8IXEP3G83yrpTXwxQTSIbCzTYbZPzJocEZHS8XSfXdbAi6lTiJEL1D40T+5xj21S+iCzHYJ2
 3G2+hkSSmOPD90I+fTAsFLbBA9q6GxeNk2s8MLNxl+O3A25WGeipGmH
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=Lb0xKzfi c=1 sm=1 tr=0 ts=692046a0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Z4Sw7GGoVt5sTUwIiKwA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: BBzLSNAJdkfzbL08eAg8j1guaD4n4y2C
X-Proofpoint-GUID: BBzLSNAJdkfzbL08eAg8j1guaD4n4y2C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA4NCBTYWx0ZWRfX2/94rQjp+XmY
 mpfgMF2f+UAzXjeTGKZHteeTvckJYivHaQ+sjrGS8Q4uSQfHP72ddRXBe7+FEUERaZs7eLQiHs9
 Vcek6sfI5bw1wbwy86Q51TyAM868HEl0wqAVcc4PfnWxCTLR+HkPGmKphv+7QamMDnZGMPsw6KV
 xLtoodAkqKVt+ppCykWAmiiffieZ3TmJ6icrDzxxQWkwN6ekCOHI/YALTdps7NCa/rnOD7+SuCX
 1BMB4fSWK7+Y1/AB3lYH6RMP0DDXmUzH8OSO6u5qyTwAN3aTomiP3s8IgSIdEtt4794i4g/tJn4
 pCpXHVCP4/VC2PSsAZcCpvQWxjOENfgcFtt+Zc3MVp4Bz8hSwlrMXfTE0oihU9XBIK+nsb39b82
 su5YnnZm8cdvxVsGBk738Wx3QcTwHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210084

qcom_mdt_pas_init() was previously used only by the remoteproc driver
(drivers/remoteproc/qcom_q6v5_pas.c). Since that driver has now
transitioned to using PAS context-based qcom_mdt_pas_load() function,
making qcom_mdt_pas_init() obsolete for external use.

Removes qcom_mdt_pas_init() from the list of exported symbols and make
it static to limit its scope to internal use within mdtloader.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c       | 11 +++++------
 include/linux/soc/qcom/mdt_loader.h | 10 ----------
 2 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 50c6a3c6b2a3..054abc81e76d 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -238,9 +238,9 @@ EXPORT_SYMBOL_GPL(qcom_mdt_read_metadata);
  *
  * Returns 0 on success, negative errno otherwise.
  */
-int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
-		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
-		      struct qcom_scm_pas_context *ctx)
+static int __qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
+			       const char *fw_name, int pas_id, phys_addr_t mem_phys,
+			       struct qcom_scm_pas_context *ctx)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
@@ -302,7 +302,6 @@ int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 out:
 	return ret;
 }
-EXPORT_SYMBOL_GPL(qcom_mdt_pas_init);
 
 static bool qcom_mdt_bins_are_split(const struct firmware *fw)
 {
@@ -469,7 +468,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 {
 	int ret;
 
-	ret = qcom_mdt_pas_init(dev, fw, fw_name, pas_id, mem_phys, NULL);
+	ret = __qcom_mdt_pas_init(dev, fw, fw_name, pas_id, mem_phys, NULL);
 	if (ret)
 		return ret;
 
@@ -500,7 +499,7 @@ int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *f
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


