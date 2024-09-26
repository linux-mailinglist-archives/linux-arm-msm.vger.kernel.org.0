Return-Path: <linux-arm-msm+bounces-32539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4EA986CFD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 08:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D77C28621D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 06:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AABF31925B5;
	Thu, 26 Sep 2024 06:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cq63EdLP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF7E189539;
	Thu, 26 Sep 2024 06:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727333738; cv=none; b=Pwhqo5++wzVSLpRmxLN9qWdlVp10nnGJxE8yHGMHw+8Cv9bq4ErMrdbGVVNjFUJ22MEBkQSXk0x+eJxQ2Z7j2q8KOQJl6S6gywUQHIhqjckmm5eoJOp3SrMtQ5rLlKh/CBnha+2NiVc5SBCty60blD+vKlSoZmXgAfUolMxV2q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727333738; c=relaxed/simple;
	bh=+E3/689TwEgY7ix6TLXHltPSLY7R7Acumow2lUJcdto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Rnh1On9LfgmkMIpTFenby0zwZs0qbABKpzLb2jTIcz7Br6Qa+Bn5/iZxPz956BroGhAf+QJ6iIu6HP7aYNE0yWTpBd87w/upXtxz2yjEEPN31+YeUZUtmq5Wm/K57lqxh+2xunQZEnSdJTBm5gy7doZU8a55VRdIuZ2cv11fAP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cq63EdLP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48PH5Oh6010596;
	Thu, 26 Sep 2024 06:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9XrGdMl6JyAxrI7nfjlW1YxjHF1XB4CjpzdoNqBPCmw=; b=cq63EdLPPESoAYj5
	2YqvCl6Fn6r74BhODTNgqZ4xOdntjg9lIKOeWyd8ea0m4KhhWJ9cpKj2tjvPwARh
	13A3/mi0F0RpHZf5p7c/vVXioeU04USHleTmSNOt/KD5UjcTsWUE5O+2Kwd0ODw5
	nKCZxa/BG0RxJJa12BtaiSx9jUkFxTGnwRswRkstFlj0vBtRY3cddpeM7ILe1lmI
	yt2RC7p2AINp7PKrHHGiX6C33zz68/c6s4Vkkl7OcWc5atiBvyjaUdmLDEQgVd/C
	nTOVh8Z8tRYQJhNyBwFwUAfHo4/7vTlPDGrbaB9CQyLIA/JEfvUCRcHh6deaetbY
	0jei/A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sph6xrqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 06:55:25 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48Q6tNLA031871
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 06:55:24 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Sep 2024 23:55:17 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Thu, 26 Sep 2024 14:54:44 +0800
Subject: [PATCH v3 4/7] soc: qcom: socinfo: Add QCS615 SoC ID table entry
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240926-add_initial_support_for_qcs615-v3-4-e37617e91c62@quicinc.com>
References: <20240926-add_initial_support_for_qcs615-v3-0-e37617e91c62@quicinc.com>
In-Reply-To: <20240926-add_initial_support_for_qcs615-v3-0-e37617e91c62@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Gleixner
	<tglx@linutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <kernel@quicinc.com>, Lijuan Gao <quic_lijuang@quicinc.com>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727333702; l=705;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=+E3/689TwEgY7ix6TLXHltPSLY7R7Acumow2lUJcdto=;
 b=ay1/snPaq50JWr7aI9Tzd5Z8TE3ZzPYjEu/kjTETd87G6EI5mvnOgzYP1wrP2tjt2dXag/TCf
 c8G/ViUKLN/DJmQz4uKfwreDw453hh9dFwSckObZajh4M/Ow8sLbQwh
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9lKVu8J477tprwpaAMslbJQwAs3Dzq61
X-Proofpoint-ORIG-GUID: 9lKVu8J477tprwpaAMslbJQwAs3Dzq61
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxlogscore=999
 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409260044

Add SoC Info support for the QCS615 platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 24c3971f2ef1..aed430f10eec 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -445,6 +445,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ5321) },
 	{ qcom_board_id(QCS8300) },
 	{ qcom_board_id(QCS8275) },
+	{ qcom_board_id(QCS615) },
 };
 
 static const char *socinfo_machine(struct device *dev, unsigned int id)

-- 
2.46.0


