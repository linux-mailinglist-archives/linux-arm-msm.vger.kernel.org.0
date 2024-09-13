Return-Path: <linux-arm-msm+bounces-31707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7D3977F06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 13:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0FF16B24A7C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 11:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081611DA11F;
	Fri, 13 Sep 2024 11:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DJn1LS4p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807751D9353;
	Fri, 13 Sep 2024 11:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726228567; cv=none; b=euW7UA0mTy3eul7dqhaGykuqJvfwsVJKCtK7B6dbk/ab6FBfLISgPRhwYT3UoY7EwAs2CI7igEwLIh0v5gWCxzfXqORXzlRCZtFxvnRGJRENX1PPzC2f+cG/YSHGg4K+XYQJW5HrvRCb7kjzBO5O4lqC4HqPGyEvL/S3cVYwYpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726228567; c=relaxed/simple;
	bh=+E3/689TwEgY7ix6TLXHltPSLY7R7Acumow2lUJcdto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NHilsQnGbpUNQ2vK20AWNdz6nZwZZMZdKOJmCA+3ovNQ/QwuG+Kw9r7pLqDhKNDCLEjbYk/QYlpCbNX9oGnAabIYs0lieX/ob7UwGg73fevHpFgXmpN+MqibLSCGSFyiW9PSxch2fjbCdTnkV/WQanen4d2sVzzqFv3k1l5zCZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DJn1LS4p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48DAS4FB020341;
	Fri, 13 Sep 2024 11:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9XrGdMl6JyAxrI7nfjlW1YxjHF1XB4CjpzdoNqBPCmw=; b=DJn1LS4pCBKKbwjK
	XznEgR+csdwh/TDgdoGCPfmYATDEnmewPriVI4r9mej9AU4ZsqF9J67QUEZXoLLZ
	BC1KEvhsQHguRJiqdx/9sbcEBw5Mm1ptY0+bM0bUD9OcL++kNQEKbFZh31sJHp+N
	VoW6qr91aC4eSyNuO1TGs1okkbxC+YdOL7+m44xNRLhCR21Vn12Q59ZXWTHcERbI
	GO4yYt0GDNR4kzigMFCviB0B57fpBGWOO9yDLngrMSfvazzUsglwgahzkTlouZpO
	asY5fTTSo2lx9n32pTZRarUQHgIZv0fl6uPJQjBfH2r7MgJwKepLGFLSdxlSYTMb
	69CC5w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy5p0rmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 11:55:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48DBtqd3008335
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 11:55:52 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Sep 2024 04:55:47 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Fri, 13 Sep 2024 19:55:26 +0800
Subject: [PATCH v2 4/6] soc: qcom: socinfo: Add QCS615 SoC ID table entry
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240913-add_initial_support_for_qcs615-v2-4-9236223e7dab@quicinc.com>
References: <20240913-add_initial_support_for_qcs615-v2-0-9236223e7dab@quicinc.com>
In-Reply-To: <20240913-add_initial_support_for_qcs615-v2-0-9236223e7dab@quicinc.com>
To: <kernel@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Thomas
 Gleixner" <tglx@linutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Lijuan Gao <quic_lijuang@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726228536; l=705;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=+E3/689TwEgY7ix6TLXHltPSLY7R7Acumow2lUJcdto=;
 b=dh5fxGBkMtiMk25u9PnvmZweBGBSUPZVKMyDpZE7hzQcJoPeJaHIO/sub/3cp+8svIEmkI2ro
 a6WS/x+egiADpq7o9UlCrXl8Cwzy9s79ls2/Xudy1QKqKIQoGa3tuAH
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vz3rIvGMdSTqa__IT1VMQPDZqyvu2tz1
X-Proofpoint-ORIG-GUID: vz3rIvGMdSTqa__IT1VMQPDZqyvu2tz1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=962 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409130083

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


