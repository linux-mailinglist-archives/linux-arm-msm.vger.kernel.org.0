Return-Path: <linux-arm-msm+bounces-37424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 300BD9C32E7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 15:54:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAB372815DE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 14:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237317F477;
	Sun, 10 Nov 2024 14:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K2bTKKNt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0851C28E;
	Sun, 10 Nov 2024 14:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731250432; cv=none; b=RYMIkSDi+EL1DbnA87cI61RYIxQSF6FblniZqa4L6iuww6HtBll65gM3/mpezraVHKAj1iqkywBE17vzrUaE3IwrJ4OcTX9jNPsEY9WwAtwbGZ3N0qFTZsmY8sK6+jQDRBQfmVN+0ti9TBgRTJr1JVu7OzI6t+Hcm+V0+l96wSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731250432; c=relaxed/simple;
	bh=QNirK9BVaIawJkb7a0rK/FNCf1zv/A+TsCk/3KC88jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o5mdxmh6WMEvjunacS3pCjKDZ/GPF80zBQL22Og5iYbItgq3uP/vbYaX9WG4tP89Kg2xhT37x1fhmWuAILSkQlJplsJZRfJ68bylFvjsNY5VsT5OyEdSL5aFGQ/PbmDo/LyccyodbZEwGNsJMiK2yy1Fbq7J+k0vpOsw8q0+q44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K2bTKKNt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AABf3Da021153;
	Sun, 10 Nov 2024 14:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xsRGJEl5EvM
	GHKKp+CH8E+h1LKG6eBNmaGJQor7r64g=; b=K2bTKKNtF3mEGzVsAyXTcAbAPuR
	ou/FunBemn/o/rEHBvcu2BcO3hqBg1qjYbf7DWnB803PDHuj7OBOcjesdc2ShYwi
	JemkL4STkIXV35LJA6aT6j+IVNP9BOMZ+eOFt7M3iFTaYutDQ3BB6N1h9xuCXfJD
	/ri3oliyRwK9fPDNrD2uMhA8d1Xb7PX+Z0f81ZpRiQdfN7JZeyXOl88ltIQ4gkRU
	yCztXqAcYYpcMEr4WU0O7/gvgP+YdUhtM/zthpQvKsAUW3KKTsBEIFZmjVyVCsW0
	StqzasqLqIjH45VhNLGF3YliD/q9X9La3+Foa7kinEOzz4l/teFJ2CqwXeQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sxpqaabx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 10 Nov 2024 14:53:46 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AAErhkP019251;
	Sun, 10 Nov 2024 14:53:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 42t0tkewh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 10 Nov 2024 14:53:43 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AAErhs3019225;
	Sun, 10 Nov 2024 14:53:43 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4AAErhBC019222
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 10 Nov 2024 14:53:43 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 3E6445A1; Sun, 10 Nov 2024 20:23:42 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH 2/5] soc: qcom: socinfo: add QCS9075 SoC ID
Date: Sun, 10 Nov 2024 20:23:36 +0530
Message-ID: <20241110145339.3635437-3-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241110145339.3635437-1-quic_wasimn@quicinc.com>
References: <20241110145339.3635437-1-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: e2DQaZGQMQiW_mYou6E6BPjtHbWLLnW-
X-Proofpoint-ORIG-GUID: e2DQaZGQMQiW_mYou6E6BPjtHbWLLnW-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxlogscore=905 phishscore=0
 suspectscore=0 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411100133

Update soc_id table for the Qualcomm QCS9075 SoC
to represent qcs9075 machine.

Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 805dc3c4de40..a473d85bc033 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -451,6 +451,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCS9100) },
 	{ qcom_board_id(QCS8300) },
 	{ qcom_board_id(QCS8275) },
+	{ qcom_board_id(QCS9075) },
 	{ qcom_board_id(QCS615) },
 };

--
2.47.0


