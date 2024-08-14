Return-Path: <linux-arm-msm+bounces-28458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BD295158C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 09:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4D5028AC27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 07:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06AEF142651;
	Wed, 14 Aug 2024 07:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g9FBZ8Id"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8699D1411F9;
	Wed, 14 Aug 2024 07:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723620529; cv=none; b=jTiWF0ZV7/k8LNKYCP8O6lN3ROLFEgFch0pQ2dh9sevbqRopahA3QWn/IWYxZPps1P/ywvV/E3YTG/aCePUgzwjHiP1MGY7I3WmoUgiM8nnSqRPMwyugn5eKvWGpCQaRmgE5ebI4kaKZLvZLUOBO9LKJQk2cGa7kAqgKmvA/05Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723620529; c=relaxed/simple;
	bh=k7H+V99ClMNVyOSzmIwwjYTpVivhVzBGO82VCoBbG8c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d09YvgPcDX+nqqaP7aw65xco7G1zTAvTB9Trt8E5HSlxZysZJmwnAtnnr0qBz8vUlKvcI+y38CxIRmiZW286V+NJ2vtjjZNq0b/lWruX0w2JiQrPWravEBzF4i+eS/T8KhlTFV44r9epKhjjUEekQkHoDiZNMT5xqe64H7xe1BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g9FBZ8Id; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47DNFbab032035;
	Wed, 14 Aug 2024 07:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wRvCtGbXCq4qw4ucQ3hOaVXaafB9WOcxdSoagFcK+V0=; b=g9FBZ8IdwRB6OAQa
	zA0Es9y4FniKiVDNT5+pxjlsYa0scsIVDjDgVUxQlTdV9k5VXLWUnogZ5ZF1ceAT
	/DwM6pOALuhGlhteugrFqnK8oCJ6VVZCE6du1srdme1O74c7nfPA7DQ/H0T8HezN
	9lGppYveQPok8jKXy+y6gRcTrzXiGQkRTq3/KLHA+WfJ/4gdFVZDO0UQSAkwMRKz
	F2r1NAs8j1xJa4aMVnzqg4Y9sQoWt8JA0GqfSkcitRb0K+1JuEQmhqXnI7HNP3+5
	SzUinNM5X1n32EpvmqJ0/elgS+hyBDwElRSPWvAK02RE6LHj9/rCcBqtvE32QdQ3
	AN57BQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x168242s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 07:28:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47E7SdUb022235
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 07:28:39 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 14 Aug 2024 00:28:36 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
To: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        <quic_tengfan@quicinc.com>
CC: <quic_jingyw@quicinc.com>
Subject: [PATCH 3/3] soc: qcom: socinfo: add QCS8275/QCS8300 SoC ID
Date: Wed, 14 Aug 2024 15:28:06 +0800
Message-ID: <20240814072806.4107079-4-quic_jingyw@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240814072806.4107079-1-quic_jingyw@quicinc.com>
References: <20240814072806.4107079-1-quic_jingyw@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _dcS9wdbxsxsbs0TKUNTzgaN37vLLQaf
X-Proofpoint-ORIG-GUID: _dcS9wdbxsxsbs0TKUNTzgaN37vLLQaf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_04,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=789 impostorscore=0 malwarescore=0 spamscore=0
 mlxscore=0 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408140051

Add SoC ID for Qualcomm QCS8275/QCS8300.

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
 drivers/soc/qcom/socinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index d7359a235e3c..3ba29412b9ba 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -441,6 +441,8 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCM8550) },
 	{ qcom_board_id(IPQ5300) },
 	{ qcom_board_id(IPQ5321) },
+	{ qcom_board_id(QCS8300) },
+	{ qcom_board_id(QCS8275) },
 };
 
 static const char *socinfo_machine(struct device *dev, unsigned int id)
-- 
2.25.1


