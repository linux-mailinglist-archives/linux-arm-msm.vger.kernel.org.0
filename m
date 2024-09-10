Return-Path: <linux-arm-msm+bounces-31433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 689C9973F26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 19:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 104C51F216A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 17:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E3B1BAEC3;
	Tue, 10 Sep 2024 17:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dflEaJGF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F271BA86F;
	Tue, 10 Sep 2024 17:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725988561; cv=none; b=Xdr0uQKIwsqeGcgpbvMaudqf0PJkVp3AbYKRe88EBDJoIHin9ddVl+JOoo/4K4gaYaEdHrhVZ2h8EjJgeggL9KRalOlQCP3EGnbJ1w9b25XS0ukxFf6CSgcb9JZkTBFa22AZ0G/ul+OsoBLxv7xHVKTX8WAJi4BDG+XjqDOWvp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725988561; c=relaxed/simple;
	bh=lQbhBqzJrpbQeuZr5KFK5lqvmeYMeJD/wl3OmKcWbbQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iHddLVc0bSXNpmTrqI/ek1Yg82r+t3p8sxaj8PSicJFIAXH2qNUxsxC4aibzDLMWy2WzbhU5PqcmUIH8kotq/XdlL1U7ygoK9U7HgE1f1RloH8FGuDXbXeyn917uUEPxtYJpJaVEG5Z1JCCUgxf9hRCfc/r0zBNtwQYEBJUxS4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dflEaJGF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48AEHRYZ024930;
	Tue, 10 Sep 2024 17:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4TQ/vxlC7PBywN8i6bt9nEHId2Z42EXHeP4UJLJ94FY=; b=dflEaJGFyy96M5AT
	OxxkbgM32yv9EkD4e80WrCLLTkqtDcDOmotuOxDCpklcH2qJ62LRhasJNkByNSGk
	lFZLaV9B5CGyOwIwnFSCFftsXuwv44w2SoAl5Bkh2wtEnA3bpTOk61X0r+j1PfKf
	B+QO7jowGgBa0LymLy+U5AmWDOYQd9j8MF1R5gpxmkyZCigg8zI1lMG3wCU9QcAt
	FAQ6pO0iLqPVuoCzRurupt7nvPxcWIgjbZK2rlfQR6Txd1yEO1eExhDI6+IvwcS4
	RKU9/fLof6FvSVfRAdOAgGsMW1EGrLez8RYXb77fuKXL73HQxrX5ZgPjD3r27zyt
	hP7LSg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy72xvfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 17:15:51 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48AHFou4022030
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 17:15:50 GMT
Received: from hu-nkela-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Sep 2024 10:15:47 -0700
From: Nikunj Kela <quic_nkela@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_psodagud@quicinc.com>, Nikunj Kela <quic_nkela@quicinc.com>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 2/3] soc: qcom: socinfo: add support for SA8255P
Date: Tue, 10 Sep 2024 10:15:33 -0700
Message-ID: <20240910171534.2412263-3-quic_nkela@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910171534.2412263-1-quic_nkela@quicinc.com>
References: <20240910171534.2412263-1-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wWSg7YOwZ26rgt9kQpEqA3sohTBVJzTC
X-Proofpoint-GUID: wWSg7YOwZ26rgt9kQpEqA3sohTBVJzTC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 mlxlogscore=981 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409100127

Add SocInfo support for SA8255P.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 24c3971f2ef1..5c3bd59eaa69 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -424,6 +424,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QRB2210) },
 	{ qcom_board_id(SM8475) },
 	{ qcom_board_id(SM8475P) },
+	{ qcom_board_id(SA8255P) },
 	{ qcom_board_id(SA8775P) },
 	{ qcom_board_id(QRU1000) },
 	{ qcom_board_id(SM8475_2) },
-- 
2.34.1


