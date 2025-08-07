Return-Path: <linux-arm-msm+bounces-67969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9295B1D394
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 09:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 786213BC020
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 07:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B7B242D82;
	Thu,  7 Aug 2025 07:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nBdaCbm5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A6623CF12
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 07:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754552608; cv=none; b=EDkyP4Pa2Z9GL+wVFdameL3sAK+1ASZOX85GlwVv193vigqd3yXKai3QjrdR1eqfl0TUQRY1BhrJn+mBstWPidkacd8LQEl8ZzEZBePVjbqt9IgE1bBbCGlWZVx70E+2daoRVopibxpD7W4+T6m71rMm0yLpyXmuw0gQdpKSe68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754552608; c=relaxed/simple;
	bh=aJf8dgH4dYz4FeXdIaB9wlD7Vgy/o7rrXh0zl/XsgWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I0Qz63KVW+BY5ZccRMEyuAv6EYh4W9u201WfG+YIncrbq4Aa2WM2MDQF49gQpU26gfScG6RlNAyb4oMRVsjXDnxsK/W2pakfJxBNl4XRUStIaMasoTma0gPp8fNaSZwKbaRNTi8ZKvycNtyJ3/zadaJj8B8v/pdBV611WIueNrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nBdaCbm5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576NuYl5031585
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 Aug 2025 07:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SdrbuuxHkEeQigeY7KFKAwRwQZ1v06KXS3A
	qG305+AI=; b=nBdaCbm5x8LI4sQsiTXL6sdEItOKhtIwIR4NWJd9vFS8SIpVBAM
	N+RzVIvi2W0ZmCoak2/+cJO/0KH4qzIviQZcXra7qc69fbVc0UvuiCCKqItUzlJQ
	lvH2/THLqc1P9DInQse5YBUs7Mwn/9M+ee90lRJf0VOkfeP+F5mY47BPHZNsR1u0
	m11Eu2vVsTZN8DvVRq4qAkIz7AP3hjqbalATTEHHqiQJnU98uVpT8pTkaR359kTF
	bKnwshfhDwMFwaFbPMHaraW6/UMZYEpWB2g9JXAqKgvnJqp2UTW+JQqVG4C/HkD4
	KzwjHLWvZkAqXuwWUzb0VxGNfJcqkgaqWGQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpybdmuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 07:43:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b26e33ae9d5so1260238a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 00:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754552604; x=1755157404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdrbuuxHkEeQigeY7KFKAwRwQZ1v06KXS3AqG305+AI=;
        b=rDMTNnWFZ5jSPtwkE/3sTT0otNYuTOknXnIn79KppU50cx5jDHX/eYBfveLAZezrch
         Olem5O++1BGP33edT2ypmo2o371hYnu9PgeXNfYk1pTRPREEhpu85ApPpwQNUne1j1wM
         AoMLu6C4FGyF5CzrhmLiuiQjj81+MVBRX+CbPHFKo6RWNXUvmTL+1Tr5+fPzNCKqsDtT
         Kj+b9yJkEPzHvh4w/x4EzYM3zTNPP4Rknmmnmx9hf4Wwd6Xxu+dFdBu5Biwmv8OBO5l5
         /Iruji9u4+3Am9rWnSSkCLbsaCGTolUctE8nbdHN/rffOuU0ypc0cih9FxcfCEjdcAB3
         9Fpg==
X-Forwarded-Encrypted: i=1; AJvYcCXcUGm1KzTA6KP6Dece4iu2cS1dNeCp2L28PwKvlQJZOeoEcSFwD9+C3MaWxYZ4wXNYIa5sEvdlFRFZd1Ih@vger.kernel.org
X-Gm-Message-State: AOJu0YwtEiz1u0GjR5a3mY4nxBfEICnZYJuJCwx7QiVxzbmr5b+jACMD
	q8vYDID6GR2k3/ri546KP1qJ61QNwOJ6/v/JV9Wx37SNaQuvcZNH7UkzT+B+v4p2issnuradatJ
	YVVdgINhe3yJewYAL+KlDNxvZ5amRKwCb4hWe93VK2O5amZwmaQZ7liXssBTm0hWc7ZMd
X-Gm-Gg: ASbGncsW1ETXp/9yGlBp4mO1Ie2wwobtaVQxeHqjnlGE4UqAx/M6FKXbt/AmoDOmXqf
	aKMbX136kd3UsadgjySuLzj6/+MX54qXEQapHdisZiJnEH6oxUJO1XLZ6dugkoOO+Pi81+klDuH
	0eI4MgAXPKPEKhxBbKtLIOkCRW7xwssG3B6xUkf98lyqLs/B2aLUIkvWV/x9bbhnQ5HMTTEkPgF
	mdQ3ntUBSqZvHVB7LaHyulafS9F66n4n6JdriTx6y1YeBGxtyKVVBbGKm4ZaGzlBza/DDbbkzJq
	lWhtve3pKLOdrrwnu+1yvLTil9QMSKFsqxmeAxVdoMlqEtUTjDqTnknRRqtZybNTrmM=
X-Received: by 2002:a17:902:d2c2:b0:242:9bca:863f with SMTP id d9443c01a7336-2429f5bbc5fmr72030685ad.57.1754552604153;
        Thu, 07 Aug 2025 00:43:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHANSCJfj5IWevcX9I21BsXg/+4n+zB41jVKkCMdFHRNuqkAEqf/i9yKeqzmpgMCnYVJaYulg==
X-Received: by 2002:a17:902:d2c2:b0:242:9bca:863f with SMTP id d9443c01a7336-2429f5bbc5fmr72030435ad.57.1754552603705;
        Thu, 07 Aug 2025 00:43:23 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef678dsm178166395ad.39.2025.08.07.00.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 00:43:23 -0700 (PDT)
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
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [Patch v3 1/3] soc: qcom: mdt_loader: Remove unused parameter
Date: Thu,  7 Aug 2025 13:13:09 +0530
Message-ID: <20250807074311.2381713-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX9nOWYB8EZBT8
 1eHlgMOxhefzBLX5iKHuxy1io5KQ2TpFi56f3uMBaY6O4y4hV7Y0DluJQKXGZ44dQtBwBIXonzs
 uH0p1kS+Cq/Tm/ya7jRyC0gQqKhUp5mnvGC0d1QlmnWMNSRovb7WsSrRTRLaiO5VttZuzo91JpX
 sZXYxolSFne7AJyDHEAF8HFSucHTql9AQW2mbcqPdEZRdnoXmzNBRNKhHVOFSJFaj1+h9L4FBVg
 hlHnVYT3DW8v/mJYfUUTW4DkEN5MRVbu69ukO9R/IvCa4Wj/9Yi3QJSinqYoP8X6ApOwfMgAUGE
 nv83IxFk2+jLZEuBibIhfyraRTrDy0KFZMtXLa+GTAfbUji6DnhHI3d9xlCwou7HmVF21JWKSN+
 BooULiaR
X-Proofpoint-GUID: lVoLJARCbCIKxHOgv6ZcBLiUeoVzeeQR
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=6894591d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qLU0tmo_xPokh9XVZMUA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: lVoLJARCbCIKxHOgv6ZcBLiUeoVzeeQR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

commit f4e526ff7e38e ("soc: qcom: mdt_loader: Extract PAS
 operations") move pas specific code from __qcom_mdt_load()
to a separate function qcom_mdt_pas_init() after which the
pas_init variable became unused in __qcom_mdt_load().

Remove pas_init argument from __qcom_mdt_load().

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v3: https://lore.kernel.org/lkml/20250806172531.1865088-2-mukesh.ojha@oss.qualcomm.com/
 - Because of the drop of 1/4 in earlier version this becomes first
   patch.

- Changes in v2:
 - Added R-b tag and its order in the series.

 drivers/soc/qcom/mdt_loader.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 0ca268bdf1f8..dfd15d189087 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -333,7 +333,7 @@ static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_na
 static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 			   const char *fw_name, int pas_id, void *mem_region,
 			   phys_addr_t mem_phys, size_t mem_size,
-			   phys_addr_t *reloc_base, bool pas_init)
+			   phys_addr_t *reloc_base)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
@@ -459,7 +459,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		return ret;
 
 	return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region, mem_phys,
-			       mem_size, reloc_base, true);
+			       mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load);
 
@@ -482,7 +482,7 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 			  size_t mem_size, phys_addr_t *reloc_base)
 {
 	return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region, mem_phys,
-			       mem_size, reloc_base, false);
+			       mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
 
-- 
2.50.1


