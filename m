Return-Path: <linux-arm-msm+bounces-81001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D811C466B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 12:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEDBD189319C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 11:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2918E30DD35;
	Mon, 10 Nov 2025 11:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LBPQ/WY2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD2330CD86;
	Mon, 10 Nov 2025 11:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762775909; cv=none; b=keRVQacXNKqAv9aEZ7TFtmrVX6QasBhpWiorPA5wouPtW4oQnj6R+JyFvactdGl7ZRYi5tJq1XDwMHldAngOa0wD8n9STYoy8+l6IbE4FLBFlIJlUKj45QM9PIdKNEBjksep9eLpwB7Nkd+x2KrHTalpcTXz0v8nM7qh8bgrBLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762775909; c=relaxed/simple;
	bh=cNPmk4fbOBXXAawj/9OMPAmd8rUA8TdGyJM5B0gYOac=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m7HY5dbrC8unuqkpmOBGBioddRaRzh9LEigeu8nhcwI42BYAbdoO72voc4sqcwqcSiV5JfBAoA9N/xrx43sfBgH1WQTXIMjMKnVnUnfH727c/r6Pi2AQ6CyW1sF9eVEvKDtc5YSVYHmkmukGZKNV7ebPjw0dLePsO1zJAgmRKVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LBPQ/WY2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA9Ej9w2992485;
	Mon, 10 Nov 2025 11:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0mk/MaewWjA6weau99q1k/xcKovNI8yIK6j/KpNcwmU=; b=LBPQ/WY2W+4esBIJ
	IRx9KYiMK2aYmeGsZSxPCtsKYgDY/VauRuoZpO8Byebruxkb1p+C6PNedI1ordXg
	SxJSNk4zhJ83c9yPvwockFIyPp9P7KU99mTRVKQ7qQIV5n0h2PAxFvxxVeBw6tIT
	KemL2IafK2R3/lZBUDz4pvpWm+6/gYd1Dx4vsPXx7q311q5yFC2n351VRfqM9+HT
	CYHTQ8eNIb9sTPUOFn8vIXtpZPJVyVMf0/aRLWxQDXRWsl32ICVx19Gifd2wTyqH
	Wsk/rkPK07CVlpHFXPib5XMd3JhMLdD5iMF90i7HtChSRHSptTWZlgVv3qnGSZWr
	Eakkkw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd88rfa3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 11:58:22 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AABwDx8023599;
	Mon, 10 Nov 2025 11:58:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4a9xxkqehw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 11:58:19 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AABwGxA023611;
	Mon, 10 Nov 2025 11:58:19 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amitsi-hyd.qualcomm.com [10.213.97.115])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5AABwJQ9023625
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 11:58:19 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4648853)
	id B65135A8; Mon, 10 Nov 2025 17:28:18 +0530 (+0530)
From: Amit Singh <quic_amitsi@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
        kishon@kernel.org, lumag@kernel.org, neil.armstrong@linaro.org,
        quic_wcheng@quicinc.com
Cc: Amit Singh <quic_amitsi@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_riteshk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
Subject: [PATCH 2/3] phy: qcom: qmp-combo: add vdda-aux regulator
Date: Mon, 10 Nov 2025 17:28:05 +0530
Message-Id: <20251110115806.2379442-3-quic_amitsi@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251110115806.2379442-1-quic_amitsi@quicinc.com>
References: <20251110115806.2379442-1-quic_amitsi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: F3unT7jHhJilxXOrSNtfv_alKrKDUZ6d
X-Authority-Analysis: v=2.4 cv=PL4COPqC c=1 sm=1 tr=0 ts=6911d35e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=vwgnlJYU5BRgRSzaXB0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEwNCBTYWx0ZWRfX3PwdBNDNY9gu
 p3TEWkynZFHc3j5rGCjsemM5E/G5JaHV33EXGSWfo6wIfplffxy2YhnHTKmiBNsOItF1kiDo5ms
 2jfT+syj3O2Hh7C8M9qE2y4eI8kXbzXY6xyfL4NAtJVOSF62xc+hotrm+3y+ksC63kuYAwn+IgU
 /CwRj90CxTHiEOhzjyslF9mtXVqATnakZ4KKW3S+otfYoJeeR4zVYcf/HeCzARWDJHbigoOdHd7
 S7MlXHIV3Fj0HyDekTRoo/5K0XAIvBOkxBxcNVs3IQLmjq2SG860NJhTksB8EP8EjQrd/M4jReK
 Q0Mylxl2ClJQzY9DDDdBhFM3/4iGLplwnPJgyMc7C4fKpMOE5qSONBinKxNOiqXmgS5uBLfFBI5
 nuzGGgZDxx/jpq8DbZ/ysBSmxA/k3w==
X-Proofpoint-ORIG-GUID: F3unT7jHhJilxXOrSNtfv_alKrKDUZ6d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100104

Add "vdda-aux" to the QMP PHY regulator list with an enable_load of
36000 µA, allowing the driver to manage the auxiliary supply when
present in device trees.

This aligns power sequencing with existing "vdda-phy" and
"vdda-pll" rails, and is required for platforms that depend on
the auxiliary 3.0 V rail for stable QMP operation. Platforms that
do not define "vdda-aux" remain unaffected.

Signed-off-by: Amit Singh <quic_amitsi@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 7b5af30f1d02..1ad0f06ae262 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1649,6 +1649,7 @@ struct qmp_regulator_data {
 };
 
 static struct qmp_regulator_data qmp_phy_vreg_l[] = {
+	{ .name = "vdda-aux", .enable_load = 36000 },
 	{ .name = "vdda-phy", .enable_load = 21800 },
 	{ .name = "vdda-pll", .enable_load = 36000 },
 };
-- 
2.34.1


