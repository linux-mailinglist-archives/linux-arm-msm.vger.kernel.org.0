Return-Path: <linux-arm-msm+bounces-29695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CECD4961BB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 04:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 795E8281861
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 02:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93CA34965C;
	Wed, 28 Aug 2024 02:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="msgfVwa7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C08374F1;
	Wed, 28 Aug 2024 02:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724810573; cv=none; b=QdEud1YLls44nMT0vLovEpbO3VU4WQKTh40I0rCB2v85TDgL8rhjHaJd5FhMV714Df2Se9OEZT+q8Fx8oWOxtM9rIip1aBuT4SDLPwW8w2fr8eajIckWbAsMUX0DSN/+D4RL90E1j7mTLZ+91QF6NLJTPhdv/kelAxhZHK0Ud+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724810573; c=relaxed/simple;
	bh=Y9mv2YbvjIJDj7wPnNvwgcW2yN1AumUCmO35Rln741E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=SBtvoaAvYBXZouiTz+JDn6WAj5JXktv1iskFTlzNvR/syjisoiNLqIO8fDl0zbRp6eg813PynlTHStw8UCfFXwuYXv/G3Ez8UjkGasqQZUBkZdw41kbpKxgYqN7d9uZX8+bSFdxdQccQxMoAX8UqOB6zjFi3PAIO16hLAC1ItOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=msgfVwa7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RLaQBv003164;
	Wed, 28 Aug 2024 02:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JecYbB77d5G5cJ+MupBwqYCcX3jxoHgq0/N5hlHfL/k=; b=msgfVwa7oV2VTFDf
	NNUxaRgUKo7XXKK8hovVNhtf9D4O9NE35fHtbMW6E3PdRvXq0cZlqjsyKo1QsPvS
	sVmqspUk9NTCMJLHOK6YOrQoHztnTXzx4RwL92uWJtZZxrzcpam1oBzjw8inx5Zd
	eVjHACEtmOVhFCxGGFg/xeV3Ouq7GpKlPkYK2s5R2jBQz6IkuXmBrbW0zDGYuMVP
	zuG0JzROqFeEdU4mYjldhq6PrjfS/N/1sIWuEvdUqr+epU0gZW/yvQW8/FZjO9Fl
	6z0otXki2W4Y9oMCpGgIecA2quu6N8ucFfnV/SO0qK+OKBkIYFjK4fjyX06uV6dO
	SVpFdg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puu8ddd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 02:02:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47S22kJ9017635
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 02:02:46 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 27 Aug 2024 19:02:41 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Wed, 28 Aug 2024 10:02:14 +0800
Subject: [PATCH 4/6] soc: qcom: socinfo: Add QCS615 SoC ID table entry
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240828-add_initial_support_for_qcs615-v1-4-5599869ea10f@quicinc.com>
References: <20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com>
In-Reply-To: <20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Lijuan Gao
	<quic_lijuang@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724810550; l=638;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=Y9mv2YbvjIJDj7wPnNvwgcW2yN1AumUCmO35Rln741E=;
 b=NnJ/ynPARmQSBMlKh1699DNlI463YeWZMBfPsdbNmUk9/hcEDyorHkyP38Sg/54J0YIQZDFnC
 S0ycD9HBefxBylydhaeA1FUVe9JBK6xZC4gnrpURiqV4RrXH4UzITF/
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7SSN5LWQzd9cXQYlOw96JliYFC1GjV9P
X-Proofpoint-ORIG-GUID: 7SSN5LWQzd9cXQYlOw96JliYFC1GjV9P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_01,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280013

Add SoC Info support for the QCS615 platform.

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


