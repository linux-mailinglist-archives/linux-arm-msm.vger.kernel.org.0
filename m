Return-Path: <linux-arm-msm+bounces-89763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD60D3BFF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 08:05:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5812C3E3FE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 06:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C578387592;
	Tue, 20 Jan 2026 06:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MGl1KK65";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RUvnAUF5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AAF1DFD96
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 06:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768892258; cv=none; b=LPJ5Kl+9cGOn4JQlgCixo2TnCm9oY4tAbKA8Ap5UMPIEr6Stz8YoqGt3rxYKq+yPFA23rBnbcSe9r6dwAOPgyduj4oByxwSbNzdHtcGegZ/mJTXW8ZQ9nNkPpU8MXHx41/A+Yyow3FfLEE8vmK9uGatV+NVeALR73AqVxfNCiEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768892258; c=relaxed/simple;
	bh=p3fr1oDNbdGtpVqjNhUvk9E/mgO3enqitnj03LauKPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CVgl1mv8ZouJ1mzjNhf6K4D4FwmL6ai75oM7hMsf7AXl3sbwxlqwUizAFm8b+ckbe8Yr7rvAfL3ZBMh6gduKDWejPEGCRQ4bKndomMfUfqqa5rsXAa0vWZTDoJw8cCkmwfl2fWo95FaUh0mRtDENIXhjbdPbAQSyoKthhFRyD74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MGl1KK65; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RUvnAUF5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JMDJO62411745
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 06:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UIc8faSQx67p/PhT91e5eY
	b0RsJe960uHzsVQtxCElE=; b=MGl1KK659AbjAMJYYhDmF3JxfpPFmRmSoh/21O
	eeF6zef4t3MrubLp7LjScNPzUjw3BupNVnVCVRlvChcdU4Q1Urq3ePz17+WvYWF+
	itk2Duyv/sJzWxknPbGoFdCUK3PWFvYQb8OSQLYrmjQbSZZghdXJKMSNVUy5Qx22
	XMB6Yx0R/sj2KRVkueEyY/koU1idqJ8N7e96Bh+ft3jWxiYj1NyNtOCzbKQtvcCN
	CXrKw1+pHtG0bM5AteKVNbmbL4oLs0spgQpNUPJKhVjg7GD/bo1p1FionAPpKk9s
	YyjzquBU4ltFjVoxlIvbrD84UtP6Nm5gq3CeF5OxD7G2B3kg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsnpdj832-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 06:57:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f29ae883bso33279075ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 22:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768892248; x=1769497048; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UIc8faSQx67p/PhT91e5eYb0RsJe960uHzsVQtxCElE=;
        b=RUvnAUF5P1iPK2/I4vVFVCYidyerQH5sGqEy/cTCa/tnzH6CGjrFQtVqpoa/V24U1r
         PqyQKvmSbFcdtQl/njcgkEyZQEBnh1AEEF6Xzn3duN750jZRuc3OzhAmX6leq7EFlwob
         oV/ZkfKyG5jcMeYjwk7ySYsP0mkfoekdGuFcwzaJPsvF+pDu+m2qpTkT+ZEXZmUuwpeM
         f6dFz+YrMNspu2dL/nsiZ9bWRR0MTOp5Nc1qt9IPNRHRVsV+gLll/qI8Bw9xEdnKoDV4
         eSTZvKQTAKiMp2Q5nsuXX+Wzvi2YUlqjvfKVfVn0kIzPagmyd85YDwvx+IItYpgmdDKZ
         JohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768892248; x=1769497048;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIc8faSQx67p/PhT91e5eYb0RsJe960uHzsVQtxCElE=;
        b=DYdm3LDVECVwlDn9wet1a16cHkwgGUJA6a34a6Zn+RLr5b8nwtFvs6eA9HSnAvJsKe
         oNbu1dWrBcTwZyzcKN6YI7tS/JQUAFSn4J9HR/p1QY9ktCkxxYP1SBuN1QqP+EhPjBuw
         h4iqvfb7a3x3yO2/Nxm2T+RCW/+UDO4eDXS1ucB0O16udQ7M2X3HpEOzsT1GOtsyvMd9
         /9miOwNwBehXnDTAMjX0dRTsCLkrmqaSnlx+OxI8FeJE3bFchbeOyxjGHfY+Ohf/w41O
         wk4WIfgI2a78KiMcR/bTu9eFOr+f3GTfKK3E+SQwNVlZSBemAI4/d/+APf0eaFwvmOCz
         uqnQ==
X-Gm-Message-State: AOJu0YyembX5E8XGiWERlBgIE22v/c/3/wu/ZwrGcqBsZNG8pcopssWw
	9fxrTWegwEg5uyNdoCaYdhEI9KbOjpfpz9sbSUID4kx5UkOZdL1YBb4PRp6dxLTwfU3UjaXxOkW
	nFbGHQTnzS11zUlIhFgD+83c5GjHIH9iVzc6nOZkIrHprcdIBHdWhUQy5PzPZhPE+qoL4
X-Gm-Gg: AZuq6aISliqGqOcupamgXwE7clhn1cZsSA7mu3RvIxXmM03MOHABYM0GaXkp22ehRmr
	ZcDghAOEs0TZ6emcI/rHx6wgQQ2OypapCMG3SwYxflLPMiHKdFgWljPWGp4bKlvzeBGcVd0Iu4+
	JCvTtDLNHkHpAJwcOGl/4GpOtlI535r7hC7vTSJGeEwBT9isSYEanKBrX6iX0mbUrjSX29FCrtc
	AIhsG9eBGIOqDfyeTmeQhKm3+Mppv+qQ50omo9aRuM6occyekdukqdMX1/Fb52pVnSylUyJwO0K
	vk5w4AA8eDXfsM8pbMlJbxD18X0Phx4tFoqbvGCFeye3S5j/Eub3RDODIu9BQOw69+ubxwXIEZC
	b/4jUvBxAszpThXXI/Q5C8xyOHmHruXmM
X-Received: by 2002:a17:903:2351:b0:298:485d:556e with SMTP id d9443c01a7336-2a7175170e0mr128139685ad.11.1768892247537;
        Mon, 19 Jan 2026 22:57:27 -0800 (PST)
X-Received: by 2002:a17:903:2351:b0:298:485d:556e with SMTP id d9443c01a7336-2a7175170e0mr128139515ad.11.1768892246990;
        Mon, 19 Jan 2026 22:57:26 -0800 (PST)
Received: from [169.254.0.6] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a76d75fc4dsm7036785ad.15.2026.01.19.22.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:57:26 -0800 (PST)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 06:57:14 +0000
Subject: [PATCH v2] interconnect: qcom: qcs8300: fix the num_links for nsp
 icc node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-monaco_num_links_fix_nsp_ebi_path-v2-1-2933c1b35147@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEknb2kC/42NQQ6CMBREr2K6tqQtWtGV9zCk+dYiP9IW+4FoC
 He3Eg/gZpI3mbyZGbmEjthpM7PkJiSMIYPabphtIdwdx1tmpoTSQsoj9zGAjSaM3nQYHmQafJl
 AvXFXND0MLQe9r5qqsVKIhmVPn1zerB+XOnOLNMT0Xi8n+W1/diX+sE+SS74DUForXR6gPEei4
 jlCZ6P3RQ5WL8vyAYfawk3ZAAAA
X-Change-ID: 20260119-monaco_num_links_fix_nsp_ebi_path-a658f8fc100f
To: Georgi Djakov <djakov@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=NtncssdJ c=1 sm=1 tr=0 ts=696f2758 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=DMoFkxY2krY643WBwVkA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: k9kgWS01VLd33dfrg3a4TroxLhQjZQH3
X-Proofpoint-ORIG-GUID: k9kgWS01VLd33dfrg3a4TroxLhQjZQH3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA1NiBTYWx0ZWRfX7NNHF7xabwGX
 OmYX8e/LNsRntt8SyDmE9qj2HMVJBMWhZ69bjPjiDWB82X5uV9S2p+GubE8Z4kzcwV0g+d3Re27
 6NrN+ztlHNjTFPog9XCUi5UlIMupkY3gyx2MPp1Pol0l33oKxcDHCPOwei2XgjAuOKHXJ7ulfcR
 VW8JB7Z1M+1HGWeF+Llkii+ZaCPuqQM/rvPnTxGbnl1bzRzRoyPcwmpeN5qIZDijjSiK9W3Kc5h
 kYD6XhVXrKDhPRcuKwvfpe8fklqVVwnCbfTA/PjFqJ7IhYihC5IKYHKPSqLoOA3UQlEtdTPIaD8
 1ZOEYz8zbqbqSoDeFIf/hrhosGjSIyV5bpPOLzAdn3K35lsv4XztmYm6aDldRj6hFrIWgAMcQYw
 m/lAMeYWJDaQ5UEC9wGt0D4jmUQYkXDT6bmYIPWOmXqZAa2Szl/ijF7+m2c/d7N/+ldx2L1cQxk
 lDJMLdl/Jff8mCtbksw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_01,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200056

Update the num_links to 2 for qxm_nsp node, this will help the clients
to get the required path handle to vote on qxm_nsp->ebi path.

Fixes: 874be3339c85 ("interconnect: qcom: qcs8300: convert to dynamic IDs")
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
Changes in v2:
- Corrected the commit ID mentioned in Fixes tag.
- Link to v1: https://lore.kernel.org/r/20260120-monaco_num_links_fix_nsp_ebi_path-v1-1-4aa2662637a3@oss.qualcomm.com
---
 drivers/interconnect/qcom/qcs8300.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/qcs8300.c b/drivers/interconnect/qcom/qcs8300.c
index 70a377bbcf2930a4bdddcf6c3d98e95e4ad92561..bc403a9bf68c65c5e5b312505933f58c5bbeaaf7 100644
--- a/drivers/interconnect/qcom/qcs8300.c
+++ b/drivers/interconnect/qcom/qcs8300.c
@@ -629,7 +629,7 @@ static struct qcom_icc_node qxm_nsp = {
 	.name = "qxm_nsp",
 	.channels = 2,
 	.buswidth = 32,
-	.num_links = 1,
+	.num_links = 2,
 	.link_nodes = { &qns_hcp, &qns_nsp_gemnoc },
 };
 

---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20260119-monaco_num_links_fix_nsp_ebi_path-a658f8fc100f

Best regards,
-- 
Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>


