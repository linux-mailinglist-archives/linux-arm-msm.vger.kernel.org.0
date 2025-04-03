Return-Path: <linux-arm-msm+bounces-53091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA8DA7A25B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 14:03:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC53C1891480
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 12:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B684A18DB10;
	Thu,  3 Apr 2025 12:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gw9Udd70"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417B724C07B
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Apr 2025 12:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743681809; cv=none; b=goLeiRhamMQp/zlgcx3kEbPG0U1VGFKBzd6KyXDyEhWuoB4E/BfKXPVIuaj5xZSGF2B0b/pzNBzgAdzWCEHaH14S0vFoXxlkeZblrmofE6qrG6wU7nGhpWB8k6fOvBEaC7sQECMo8frLTQ0rykKA4rInWL2yTPdsufPDfxKB47k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743681809; c=relaxed/simple;
	bh=owknYrn5kMtHFkC6QNZGZoZzWBdCkF5rL4zai9qL6NQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O6K/K5sZBXrBchmBOKJ+P2c7mA1U9oeRCOOLziaP6B0djAXLgmB5LHPOdMQPK+1tymGwLrWo5J9xqn0Cc19CxMNnLBuUxQvTMdQwOBFhCHutpRABSO6+rDyMptTu0q6UCDbIAn9HP2BptZNz4w5+9LTb6amfMGFDFRoP3WDLWUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gw9Udd70; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5339rw0s028884
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Apr 2025 12:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jOVth+c0TTQ
	p6vNf/NNY5JhDW1xfzGmToIMJCs6K5sQ=; b=gw9Udd70L2pS23llaG5LM0O0VKC
	HImhhmr7Hg+MQPSh5WnFulJfCieUAWv/kDlN7f4fq2gSoy5cNAP6r5EzCqvsypvL
	noIxHw/hrthGjzak61CaM0c2rNonWllo5Q7sVu0ZKbA70AOHlFvlGqZdcI6aa3q8
	8eZOpJAktpAvEhfO+7E8roQnu6rWEIUYTGft1GygMP92yljcce7Et/wDTuL3OPP7
	GNLMm5fkHhXTLZfe6BIhaV6MpK38kcJr+TdXUVtmgvjbPdwG1M6mgUvFci2Uyw6L
	IUrn2vvJKieK9gRIpsXCXAjIHDmDjkT5rmF+qko04mKAtJlhuOgNTpWPxUA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rbpyypcs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 12:03:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff78bd3026so798051a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 05:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743681806; x=1744286606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jOVth+c0TTQp6vNf/NNY5JhDW1xfzGmToIMJCs6K5sQ=;
        b=FGe4Af9Z4Z0x4FV+TZxT6ZHCJEQpzwPJMj5aL1wEfMyEpNbZIrmEyiE/YWylUzZM8l
         htNuMvb8SkLcLWW5keQT80rYVXPvassh8qK+8FM2gyZHZz+YOWHBNF7Rf1CF+qvWgp79
         ifQgGQPDrACrZrIv5+jH4bZ4Tv0dW3aAj/Zg355aVEqn05gq8RXvKwinEWl+ofK4SWZp
         /Ye3RWrXqWclatMtSN5GZFi7tHAJnwmAyKg3tBLFWlBpZAG4gyOYB3VPGWYLN6QLkKpZ
         PN1cUS+01nXI+Ac7moAbrlEm8QSDDkJ1tMYmp6cUEK7/U2ulCXTC+R9Ou3tqixoxZc7U
         rfLg==
X-Forwarded-Encrypted: i=1; AJvYcCWTxM+i97ad3ADsl1kYTCNds5PogBIjRAjUQH5b1QA03Hd8QkiFgE56wGGrI45Y6XQShyHy62uKAbZS/L6W@vger.kernel.org
X-Gm-Message-State: AOJu0YzeGgUY+XNirmBJvQvLqEQavz5B7zuW7co47jWTpyIrLAQToXwX
	m0R8UDycCgc0tTg2RnzXcPhgRnUy3n2wory0/ttfriKC63PuZf3e2euWl6iJlY5h2ISrhQ56Nlc
	ON/z2i5Edk8jFbT1e8JrcdvtMRgYONeBAr24SnES/ZqdHP1Wg7Vg0hy05j316lqoI
X-Gm-Gg: ASbGnctkT4svU9GO9PC2W6PC703d2S3pQwiQsRZsNqD6iIeKeLySEqDrjEF8daIvcy4
	hNlIRT+mwdgxupZB0WE+t1kCZwuNF4VGTQuvy0JYEb56tOrBXFrX+EbUVyFQ+nutoN3ELXDO33o
	nAtYCKROt3fLaclSANguwVjgCXTa9mzb6J+BLfIqjH+UL/B2st1TGyu7XW5v3aR8NyQixfBy/db
	et1KQz83fRRY4NhCkeY7aU4lDenOhnD1Lgh8gE3X4Q5SQJHwWq7YRFf8cw4p4WVUbyB/ljHlVKw
	z2VOzafJGzfbCuw0ufEG5Cpt99KkpAG6F/PBOh4kr3pIZ21SEvW4NNKa8tyeWsSY0qqyHHPRf8z
	n25QjsqZtRBIScTrEW3uxb7Iq/5a6jgZTPe87TQM=
X-Received: by 2002:a17:90b:6c7:b0:2f9:bcd8:da33 with SMTP id 98e67ed59e1d1-3056ee4af69mr7789541a91.21.1743681806298;
        Thu, 03 Apr 2025 05:03:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkLrqGo+IUXOUz9rUpMKiT0WsYO7+TM09kUiTAxkthWBIS6A95ebADbgMGXqTz+YQwsqDOPQ==
X-Received: by 2002:a17:90b:6c7:b0:2f9:bcd8:da33 with SMTP id 98e67ed59e1d1-3056ee4af69mr7789492a91.21.1743681805891;
        Thu, 03 Apr 2025 05:03:25 -0700 (PDT)
Received: from hu-gokulsri-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305827d710csm1285799a91.10.2025.04.03.05.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:03:25 -0700 (PDT)
From: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com,
        gokul.sriram.p@oss.qualcomm.com
Subject: [PATCH V4 4/8] soc: qcom: smem: introduce qcom_smem_get_machid()
Date: Thu,  3 Apr 2025 17:33:00 +0530
Message-Id: <20250403120304.2345677-5-gokul.sriram.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403120304.2345677-1-gokul.sriram.p@oss.qualcomm.com>
References: <20250403120304.2345677-1-gokul.sriram.p@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5EINZXteLqNIn9jVVZ-egRTJ2mKTL2qv
X-Proofpoint-ORIG-GUID: 5EINZXteLqNIn9jVVZ-egRTJ2mKTL2qv
X-Authority-Analysis: v=2.4 cv=ZNLXmW7b c=1 sm=1 tr=0 ts=67ee790f cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=jILyneK2vBiVKV3vpI8A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_05,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 clxscore=1011 mlxscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030050

Introduce a helper to return the machid which is used to identify the
specific board variant derived from the same SoC.

Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
---
 drivers/soc/qcom/smem.c       | 26 ++++++++++++++++++++++++++
 include/linux/soc/qcom/smem.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 592819701809..327f7358191d 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -827,6 +827,32 @@ int qcom_smem_get_soc_id(u32 *id)
 }
 EXPORT_SYMBOL_GPL(qcom_smem_get_soc_id);
 
+/**
+ * qcom_smem_get_machid() - return the machid
+ * @id:	On success, we return the machid here.
+ *
+ * generate machid from HW/SW build ID and return it.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+
+int qcom_smem_get_machid(u32 *id)
+{
+	struct socinfo *info;
+
+	info = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_HW_SW_BUILD_ID, NULL);
+	if (IS_ERR(info))
+		return PTR_ERR(info);
+
+	*id = ((info->hw_plat << 24) |
+	      (((info->plat_ver & 0xffff0000) >> 16) << 16) |
+	      ((info->plat_ver & 0x0000ffff) << 8) |
+	      (info->hw_plat_subtype));
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_smem_get_machid);
+
 /**
  * qcom_smem_get_feature_code() - return the feature code
  * @code: On success, return the feature code here.
diff --git a/include/linux/soc/qcom/smem.h b/include/linux/soc/qcom/smem.h
index f946e3beca21..82f2e6df7853 100644
--- a/include/linux/soc/qcom/smem.h
+++ b/include/linux/soc/qcom/smem.h
@@ -13,6 +13,7 @@ int qcom_smem_get_free_space(unsigned host);
 phys_addr_t qcom_smem_virt_to_phys(void *p);
 
 int qcom_smem_get_soc_id(u32 *id);
+int qcom_smem_get_machid(u32 *id);
 int qcom_smem_get_feature_code(u32 *code);
 
 int qcom_smem_bust_hwspin_lock_by_host(unsigned int host);
-- 
2.34.1


