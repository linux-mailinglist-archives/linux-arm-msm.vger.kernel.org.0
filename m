Return-Path: <linux-arm-msm+bounces-69788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB685B2CA2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 18:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18B365A2EF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 16:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855F32D24AD;
	Tue, 19 Aug 2025 16:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VE1Qs8+X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7C93043B5
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 16:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755622561; cv=none; b=Vn7kSgTXzqB5BGZG+E7kY9v1CBvABqT4N6eMjnAvhrUx83BSr0xgEVY4XrRhwRfkCIG0T60fvHYWP1CFXBeb0ePW+loRXTSouotgD0F+Er4g2XIkOWNSiHQdjYETeYgB/R9hzEo9DE/nbtnxaaygMzxg8E3Nkgacv4e/vjBCw4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755622561; c=relaxed/simple;
	bh=B3HXZFYsID/A0xupa0b1H+gHN5gYfsep6vwGMULf79o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jTA7SjsdE45uENW1BeWti/ffzTobXv7rD2Vxj6WJlGDJ9+XOi2nG78EVyEFi+Cu1PZlYyoJ6PXZ3uIgLYqjTNhn8YYnnFiwSpUi3l7b+5qoL8yVmNXMPh1juBr5GNKx1kX0pHXJi4HWu5Zsw4j10o2uGI6CBJeKvoak1pc1UG18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VE1Qs8+X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JFKtsd005503
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 16:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dxpDpl+fh+T
	OdTRIITvI5AH6/tTOz6Po0lG2zRNlW+U=; b=VE1Qs8+X6VdZ602twN1edfphoHF
	haA+PyWGPORACpVbxXU69rFil2mZ8MNpl7UIBhNviKgm5zu8oM9LSoj0hBH2ioPS
	9C68ox/fJMQY8biIEzbGF3SW3QCF5hVNMW2DumjIHXG/OcSoNiR6ZxNRTdSyLvXh
	GCAciD1l90t4Cjsvl9YlVX8AkqOzr2XVb63KodVa/Aebca//MVoqUenalu43P1Sa
	Bu2TWgNz+AN7ciiDNUWJm0h1d1YFokgGUlpk4Vhob03NO4EQEcPrx3BNhvex+dK8
	c2ySD1NX8QSwZNpS4/gIdVnrVtPTo9Yotb8eeXVTL4aQmse7KLz3hZXWxdQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48muu0ga3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 16:55:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24457f59889so58911465ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755622558; x=1756227358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxpDpl+fh+TOdTRIITvI5AH6/tTOz6Po0lG2zRNlW+U=;
        b=As1pNuGpawAQf+PAqcHq8u7OHIgWZzauXM3DIS4PgGNxnnsNESRqEzM+e/uqcGxK2d
         wTsaNJOn6H3a/y16uG4X7UNjgdSEHnJgCVT0xkf/+fXQA34Po0Ul8fR11Kf6Lj3x92e4
         79EyURIUUCDtxhciWTU5UBZkMTj76ugZUIMEhyWO5K9pzevAOoOxasT+LR7KNAE4i2uf
         pD9ieHg8YnBeBTjvRVdRfAi0IvKAWyC+XtB8CdLL8Tcush5W4TWbo2MvRzurvqEVFNxL
         Pv0W5ve169NgmoPWSIZqKT9eo1pqw7Of+/iWAvdUfxziMhuyUz7kOIdityDDXsdsocmd
         kyBg==
X-Forwarded-Encrypted: i=1; AJvYcCUEpurp206AcWvn7aZudgaXBourW2QdrHQqvE0laVjiqWKCb8anZTiv/PPcUN47NK9sOawYuqVQSlnt/TIR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4h9+rD3XoikbAcDuRWBR1NPP7IxCEgKBIrh3HINFtpIIX1fnZ
	3ZznI9YkYDL6JTVM9avcMHEW22UPM8LYKis0bOgPfZno7NxCwEh96oO6+9zQZ3ubSDs9P+eOmvN
	njSPh6DPEAjTj0dfA+JUl6Sb0MMUEQO+4HNA69YvGJOpcBiKb20og6pzwcxp4L8lNdsK2
X-Gm-Gg: ASbGncunfwU1MtpUtBjqTtqKilDdfzws3W9PJqaCAgDe3eHZIKaCC8wH/78fIrBTUBF
	S1Fw5caKh0B9SM50EsmfnIInx8yrCSXPruJ0BwmBBxi4HAmRu614Mdw/vFWSC7Zv8QEI4IIwNmd
	yiDHBc3BWaf+IUUQlH978Tw1+WsKN9p9ugH4jSZ/wGnqXL2pxsERr88nVIkDHJSxaexwnEvXlpI
	DP2kL8mYt2Oc4p468bzI7LqOx8vVxjHtccYSGTasZ8O/rPMzASgTgfwQCi0FMkN2sRcwrRqzOMf
	4PRgGJ1LJNMW9zlJ1bvETf6TCb2B4t685Xb7j1lekW8CdW6aqXMPOB58nbaJ9SQjxW8=
X-Received: by 2002:a17:903:298d:b0:23f:f065:f2be with SMTP id d9443c01a7336-245e0484ab0mr38524295ad.26.1755622558382;
        Tue, 19 Aug 2025 09:55:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeiSCkw7ouQ0AQ0r5FwfI9TjfvBzcDTXckjTR+IZ8Q5OuI924lLyvlvwXZh5sjHkfU7/illQ==
X-Received: by 2002:a17:903:298d:b0:23f:f065:f2be with SMTP id d9443c01a7336-245e0484ab0mr38523985ad.26.1755622557923;
        Tue, 19 Aug 2025 09:55:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33aa3esm2273885ad.24.2025.08.19.09.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 09:55:57 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 09/11] remoteproc: pas: Extend parse_fw callback to parse resource table
Date: Tue, 19 Aug 2025 22:24:44 +0530
Message-ID: <20250819165447.4149674-10-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YJNOI8PoabYnIJ8jKrUhsX_cec21AfAL
X-Authority-Analysis: v=2.4 cv=YtYPR5YX c=1 sm=1 tr=0 ts=68a4ac9f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=PrD8l-S5Z6VY88wQs4gA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE0MyBTYWx0ZWRfX+Ai36O8O8sEr
 11Fj7ffVmVf/LCfZHk5FagGplWpj/x3MdKYHF78SIVJatx1kgfaDyqKzC+F5wuPd+8Do67D9vBs
 ObEVlcRRCESUms+/83yYMZ38WedEcrOm1JDe9TrInFI1dsf0POwzSR5k9yeACIs71JQs6ndod4S
 CpWiiW40aBYLGg95D5npbck5g5rwhlaOvltUcLcqHbzJIrgTNPiJvtrY4S+YxTrUWwCTR9sanBT
 Iww1bt3bLx/e2jbVwkP8bbuM/4E6A7EVdUR3qM9wmmPRvQbFLs1nKTeqDYe6EcZVVJY380pxHuR
 fmVfFARNhUumjKHp76ZNWUeXooEG0pjB37sOfhaNbyGqs6shHe3YZ/uU38ngaavav9s2emZ0zP5
 YXitSuYA
X-Proofpoint-ORIG-GUID: YJNOI8PoabYnIJ8jKrUhsX_cec21AfAL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508190143

Extend parse_fw callback to include SMC call to get resource
table from TrustZone to leverage resource table parse and
mapping and unmapping code reuse from the framework.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c  | 33 +++++++++++++++++++++++++++--
 drivers/soc/qcom/mdt_loader.c       |  1 -
 include/linux/soc/qcom/mdt_loader.h |  2 ++
 3 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 09cada92dfd5..1e0f09bf1ef2 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -408,6 +408,35 @@ static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is
 	return pas->mem_region + offset;
 }
 
+static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *fw)
+{
+	struct qcom_pas *pas = rproc->priv;
+	size_t output_rt_size = MAX_RSCTABLE_SIZE;
+	void *output_rt;
+	int ret;
+
+	ret = qcom_register_dump_segments(rproc, fw);
+	if (ret) {
+		dev_err(pas->dev, "Error in registering dump segments\n");
+		return ret;
+	}
+
+	if (!rproc->has_iommu)
+		return ret;
+
+	ret = qcom_scm_pas_get_rsc_table(pas->pas_id, NULL, 0, &output_rt, &output_rt_size);
+	if (ret) {
+		dev_err(pas->dev, "error %d getting resource_table\n", ret);
+		return ret;
+	}
+
+	rproc->cached_table = output_rt;
+	rproc->table_ptr = rproc->cached_table;
+	rproc->table_sz = output_rt_size;
+
+	return ret;
+}
+
 static unsigned long qcom_pas_panic(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
@@ -420,7 +449,7 @@ static const struct rproc_ops qcom_pas_ops = {
 	.start = qcom_pas_start,
 	.stop = qcom_pas_stop,
 	.da_to_va = qcom_pas_da_to_va,
-	.parse_fw = qcom_register_dump_segments,
+	.parse_fw = qcom_pas_parse_firmware,
 	.load = qcom_pas_load,
 	.panic = qcom_pas_panic,
 };
@@ -430,7 +459,7 @@ static const struct rproc_ops qcom_pas_minidump_ops = {
 	.start = qcom_pas_start,
 	.stop = qcom_pas_stop,
 	.da_to_va = qcom_pas_da_to_va,
-	.parse_fw = qcom_register_dump_segments,
+	.parse_fw = qcom_pas_parse_firmware,
 	.load = qcom_pas_load,
 	.panic = qcom_pas_panic,
 	.coredump = qcom_pas_minidump,
diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index ea7034c4b996..8456cca3f3e0 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -22,7 +22,6 @@
 #include <linux/slab.h>
 #include <linux/soc/qcom/mdt_loader.h>
 
-#define MAX_RSCTABLE_SIZE	SZ_16K;
 #define RSC_TABLE_HASH_BITS	     5  // 32 buckets
 
 DEFINE_HASHTABLE(qcom_pas_rsc_table_map, RSC_TABLE_HASH_BITS);
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 62f239f64dfb..92ad862e733e 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -8,6 +8,8 @@
 #define QCOM_MDT_TYPE_HASH	(2 << 24)
 #define QCOM_MDT_RELOCATABLE	BIT(27)
 
+#define MAX_RSCTABLE_SIZE	SZ_16K
+
 struct device;
 struct firmware;
 struct qcom_scm_pas_ctx;
-- 
2.50.1


