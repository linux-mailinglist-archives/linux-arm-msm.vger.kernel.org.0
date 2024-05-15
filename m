Return-Path: <linux-arm-msm+bounces-19879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 006848C661F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 14:10:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DDBC283706
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 12:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E73475808;
	Wed, 15 May 2024 12:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="la1AVEWR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE291745D6;
	Wed, 15 May 2024 12:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715775040; cv=none; b=nvh4tL+VKGGwlv8qZLk414Vnm6WXUR/hcDMX5DjK8QsCktZrWviRhCBqE/KYPSQ/lasMAPBROx8H7RCudCzeSAuVLf6sgy8pvgZpyX8afXM+44g9ryJvha/8XxuFwkMbxvTKAJxApjstgTEmWvQ0mrLPRBJisz7O5pWLaW5BdT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715775040; c=relaxed/simple;
	bh=yS2PU23pXmQPqFE4VDurztJhG/NvaNEsMT1SxfmCbn0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iBiqsbO6GVndWFKQSqlPDuuP/10rRypnU1xtWapZGP5N7aMEXIjXjmeyUCP33dS02xXUSannQVofJnSf1J41t7kd2levlBl4wANMHPvYRXauGSUJK+Bcs6GOvRmfDqsM9e69KLihvkErTO7orA5JIbC6hal9QcB3uLnQYao427c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=la1AVEWR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44F9165w011041;
	Wed, 15 May 2024 12:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=ZfestWt94fmc/kUfm+t+
	YdjZBbdJa5ANHwmQTdtlc6Y=; b=la1AVEWRGrkX7Q9IRkkQlTMUkaOXgy/xgvKV
	95qPcZ9X9lMKzPrPRtrgNW5masg0BbpwcUpDgdm/1Pv2HjcOM9yniRkSJAbrOeA7
	G49iTfC28HRvnzokn9H5r7gV7HulyHZKz3oXm+KRVvB3ZInDqOyBjimDyqcqkGx3
	mT/45OTyVfTC5KCOIGI/uve1oIllu2kc5scLO+asG4d0O2tNlVV1fDhh71cNbBG3
	nnHsPHDKAWo7HLcR+eacAj+pl/JNpQ1oT8wB558IZn7fbVJbcHa2HV3VIFxTop47
	bqUijb6TNem2RolmB7VJWk9Eyr4BC48nOjsNn8cbGQsAnlSgzg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y3x51kw9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 12:10:29 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44FCASQb027651
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 12:10:28 GMT
Received: from hyd-e160-a01-3-01.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 15 May 2024 05:10:25 -0700
From: Naina Mehta <quic_nainmeht@quicinc.com>
To: <ulf.hansson@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <bhupesh.sharma@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Naina Mehta
	<quic_nainmeht@quicinc.com>
Subject: [PATCH 1/3] dt-bindings: mmc: sdhci-msm: Document the SDX75 compatible
Date: Wed, 15 May 2024 17:39:56 +0530
Message-ID: <20240515120958.32032-2-quic_nainmeht@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240515120958.32032-1-quic_nainmeht@quicinc.com>
References: <20240515120958.32032-1-quic_nainmeht@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IBB-Rchfj8w199cVExAoro9w8LO87v_V
X-Proofpoint-ORIG-GUID: IBB-Rchfj8w199cVExAoro9w8LO87v_V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_06,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 mlxscore=0 impostorscore=0 adultscore=0 clxscore=1015 mlxlogscore=996
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405150084

Document the compatible for SDHCI on SDX75 SoC.

Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index c24c537f62b1..11979b026d21 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -51,6 +51,7 @@ properties:
               - qcom,sdm845-sdhci
               - qcom,sdx55-sdhci
               - qcom,sdx65-sdhci
+              - qcom,sdx75-sdhci
               - qcom,sm6115-sdhci
               - qcom,sm6125-sdhci
               - qcom,sm6350-sdhci
--
2.17.1


