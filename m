Return-Path: <linux-arm-msm+bounces-74723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4092CB9C825
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 566F818877E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 301662D0C85;
	Wed, 24 Sep 2025 23:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bXlfemCm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E4329D26B
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758755890; cv=none; b=h/wES8Nz5Rb/Ifadve4z5Z/i8WqFO9KlhP9IZrr1VdX5dR4Ur3DpjbrGpzAruFWgz6yvptp64GnqPw5Vmte1M1JpVLn/JYLdw8RTmyuVGKCR5O18baf0xA+BJKhiltJCvbrYCC/tOqZzOohyQ0s7xn8FjYq8EOlpL3DW7sD8QMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758755890; c=relaxed/simple;
	bh=ZEV7aGV8kcTDQaybr4hw0p9WmY5zSMtxQK7hwQf80Dw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NE6qWFc0TKb+pdEA2eSTGzGZJorOnpJmCvsnnKaOsK+myBWE+fDk24MW44PNXWgCrtAyYVw65XhxgID6SwI53Z8Giwjxr3a6+5bvV0b+pJKvipw3SN31fWr5f00CNcnCw/02zPORJUm2uPvYGNAloNcERHH2Rfr5eZL6eLTZ/QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bXlfemCm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD0Nfr025105
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CMpKhbxvVWoQ8TSL+vf5qR5STP8Ly5l8MGKkJsWdz7g=; b=bXlfemCmJFyxDs1p
	Ej4cEEvHjnWVmvMNxU611PRef5xJnfgFRRA+BSe1Vt7UqQ+XLLG49J8hB2M1QU6m
	e6JAiR8t59I3k+giSLwEepv5Ah0gPfPMcAOs41Nbx/GnslNsTd6YBr4s1SsRyjii
	5iMygr809f4KqKEDo/CGYPlPSLYgjloih5xgTCo5XPf/LDrsGmJSxpKEUv5WfPWp
	KUJRtkGAj49SsKrSTPaQZDars0vvwyxKK25WWKj5m9WaR1M3wzdv1uRwXX3gyA31
	wRNjlsotznFYxPzO4C7KQPjaE+1g7eTvx+4w8tFPpEHrFCwHJM5T0/GwfpuUi2jD
	WcdQNQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv161f5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:18:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-27eca7298d9so6444705ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758755886; x=1759360686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CMpKhbxvVWoQ8TSL+vf5qR5STP8Ly5l8MGKkJsWdz7g=;
        b=Zn+NuqjdTiWzh36jxSaK8FbcROR8KDrPcNcipRd4XltJyQi/AlQsYhmCCwdwe54zhw
         lNBDn6vNwCwEMFX6tucHyivcq3FhLZcgketqJivAYRjKwe9vPm7NG8MOKdV3DKVbRB4A
         wf55hsEpfrC/Zn6ZjtwkNvpVMjM2Ruw8v7itKIPqHatD0zkvAKmYjK9AI7BkKfFKEoBe
         wHp4rXDphao87mTU/W1Uiw/bnwrsM6WfZ3ve94/CT1TJq/y+AD8ostCJO2G18vGwEGzD
         1rc80HAgTpV3H6o89VB6fXqBAXwHmOWHb7d9ncLGvzRGqalqNbQ4R/DDVYrNub0z1dvv
         OQPw==
X-Gm-Message-State: AOJu0YwK5FKTOgydHCIEvEQbkRA+5Dje1IGav+54EVvkRe4ETnlHOorN
	9YJsaf7QYgx6PpOjPqgTM2yytbNPp4Td0pcgXde1+d6+uTjmrnHxZ7eRTP9i/ZC/BtwmdHFZ2NE
	sdVOioU7WDwE0I3zgzXfOqpoB6rr63IGt1bfcuNo2Jy+WMNqyWbwY5a8LZE0HtC9rxMq7
X-Gm-Gg: ASbGnctnKnvnl23k0Xd5rhjKd6W8NPF1/wWALeBGAxik9dPSVQ95WlyZncPD7odEOo7
	YZe9O55GO+pJEbtnaDYWfoPxADFfFSDsRYCHpwdndS30y9dEvVvefXYtVApkgdqnr/1jw+gtnWH
	lIvDMti3Li3340shAqbyvnp1tbXZ6bTXPYtvH9bMghAMc7+99ik/dYDRDoP+/Hwr5EEjAiNV/ud
	mZnNzsfOFCe6sIgfz+iV95XSv69JvfAKDUfBJzK2zfC5mTEK3hb5CuYll6FdkIinUywxUiALiBJ
	W61XydN6ZPmhY2QmX0vjr4EUIBndVpYlxYdyjz4l5Oibq+JruVBH55rsaePvw7G1GOi9scSm+Zl
	7HbPCDgNn8nUsyu4=
X-Received: by 2002:a17:903:19cf:b0:269:7427:fe37 with SMTP id d9443c01a7336-27ed4a30e5cmr15294395ad.29.1758755886481;
        Wed, 24 Sep 2025 16:18:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/ebc2nsMmiv2HiRq+pX9LoY8aL3IaOeMJamEwP6YOIDPpr1NOVTR9Kz3Lld5O8UMyUW1n5A==
X-Received: by 2002:a17:903:19cf:b0:269:7427:fe37 with SMTP id d9443c01a7336-27ed4a30e5cmr15294185ad.29.1758755886088;
        Wed, 24 Sep 2025 16:18:06 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66cda43sm4321385ad.25.2025.09.24.16.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:18:05 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:17:47 -0700
Subject: [PATCH 2/2] soc: qcom: socinfo: add SM8850 SoC ID
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-socid-v1-2-fad059c60e71@oss.qualcomm.com>
References: <20250924-knp-socid-v1-0-fad059c60e71@oss.qualcomm.com>
In-Reply-To: <20250924-knp-socid-v1-0-fad059c60e71@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758755882; l=640;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=ZEV7aGV8kcTDQaybr4hw0p9WmY5zSMtxQK7hwQf80Dw=;
 b=zth5W42Al/7f1Okdmuxog3S3+pBB1bVznskBCvO0ksH8KHnsqnyTkBRv71HYL5DcipSv5Tryn
 AgndvSTEu4KBlY2EGBfC1/oooKqQ88QBlNu6amlRhyNw+//g+krP3pI
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: foryzlqvjTI7hmLitYHz9yF87nyKqTqP
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d47c2f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=SCjz2f6kJreciZqEAHEA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfXzeNQRaCGexSv
 NYEokQudaLpDmVEr48XlXpEK8s1v5xRihcG/fzzDy+jTRVDfsTE+YQRqtYFRNBDGUI2Sbq0Z4SP
 oN2ePM+RYXRw98UDFJDyfXD4RkRg2czWKKW6gCOKiyRvJeyPGk8VnRxC1xQGSI9Z7mX468Yu9j0
 1x3oMoPyjfpn/42Ppct8Anw/bvo6NAhqij5n4tslPsN0UdPJMeak0e/i5pdfJnZiYzzHiJ750BT
 CXl9gXJgl2pxyLmUCoxDBS71HuJ5X9sz/wThrwxYzQD+gzmREb3riPyzwhWBmYzc9sYwP6WtWJS
 g4QDAcVBg/fYz/m1NkoYQ+kR8hV7XPKWjKJgq79Xg21Na2y3lLdkUmZdvRa0iIOvPaSYLhro7ez
 O4fRZv41
X-Proofpoint-ORIG-GUID: foryzlqvjTI7hmLitYHz9yF87nyKqTqP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

Add SoC ID for Qualcomm SM8850.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 963772f45489..a2e2e15b840c 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -461,6 +461,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ5424) },
 	{ qcom_board_id(QCM6690) },
 	{ qcom_board_id(QCS6690) },
+	{ qcom_board_id(SM8850) },
 	{ qcom_board_id(IPQ5404) },
 	{ qcom_board_id(QCS9100) },
 	{ qcom_board_id(QCS8300) },

-- 
2.25.1


