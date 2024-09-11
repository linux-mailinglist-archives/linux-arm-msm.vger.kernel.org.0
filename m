Return-Path: <linux-arm-msm+bounces-31493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D45A975086
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 13:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 609A81C22A8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 11:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0001885B1;
	Wed, 11 Sep 2024 11:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kYIG/1py"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3189188013;
	Wed, 11 Sep 2024 11:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726053083; cv=none; b=CT00tXy0emjzRAvWIso+d+VD0Vz3ECvyuiS8ps9aTVz+gLGRbcbFyhawjbnCobp3DwmYJeJN5875UzK9/pSBk1WH6dl8IdVxt4uXVRlfRUGe+bXqmgg4k7zyrWtLV5jxeBG+Dk7Y99DGvUCQ32BesOssnLH8TxhC9JpGzkdzapw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726053083; c=relaxed/simple;
	bh=4DasYp476D/sQ2lLKbOmhvjuqPG+yFlwl+Vrl4N0iGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=JdZXpMpDBeJ3nt3OrUyiCzGvCGfQdMGfbaWJq+G3Caxf1/R+Hjr5kyX2012JGXBlazPAb8//Z1qlLdaH4ulFt3qW5uvZ3ZSjBjKiq4YFhHr0GcIRtCne/HnkbIZ8Vc3fhhddQ5WpMGSRQjWq/L6WeRVnh0qBhes9n+0uRLuzTug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kYIG/1py; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B4EoBB021289;
	Wed, 11 Sep 2024 11:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BssEOkDrPp70ReB7zRhufAd9/j8oLiaBNLc8WJidBMY=; b=kYIG/1py0OD1GmdC
	l6l+Qa1+baFNOuu9lEYctFRTwJdCpDS+nz6rFFzTi9B26Y90pG46bFTKcneN6rw4
	DS+daAP80TkresIVhf7lnGtlOfmgak6dTuGmTS2QLaQFTKv4P7tFG3teCLJN/MK5
	ZVK77RQPk4WXrJUpJOsgJ349GJZXShAHJXLpR0HAUz7PbQ4k/wYgLiF+amNqZ8S1
	ywng9o8Q7WW72rafV/1G+4GJ5hKX9PWjqMcc4sblXPshplswm6iZl88Lt4wEZBVs
	kLwZrsHFOXuJ+jwAjpyXOXGufToQjGwY42xOdbC5KOeeVAvMxIOx6JOncz0ZAEWP
	7JqbFg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gybpsbcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 11:11:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48BBBH9v008784
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 11:11:17 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Sep 2024 04:11:12 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Wed, 11 Sep 2024 19:10:56 +0800
Subject: [PATCH v2 2/4] soc: qcom: socinfo: add QCS9100 ID
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240911-add_qcs9100_support-v2-2-e43a71ceb017@quicinc.com>
References: <20240911-add_qcs9100_support-v2-0-e43a71ceb017@quicinc.com>
In-Reply-To: <20240911-add_qcs9100_support-v2-0-e43a71ceb017@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726053066; l=687;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=4DasYp476D/sQ2lLKbOmhvjuqPG+yFlwl+Vrl4N0iGs=;
 b=VSQTorRrDGN+wlx1JHpuIwTG7yPx36IKn8hJLgoQCbPkmQEZxIGGF3je1Gnd13WdVFruYlQD1
 GFVtpYuoR+gARWMHfN2T860l+3kXwE29M/7ONySSE7PZ7NXxVoZ1OSu
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iqHaQ5dQfhELJCANlpARW519J1hCY7a_
X-Proofpoint-GUID: iqHaQ5dQfhELJCANlpARW519J1hCY7a_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=785 clxscore=1015 bulkscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409110082

Add the ID for the Qualcomm QCS9100 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 24c3971f2ef1..0dcf8c438cd0 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -443,6 +443,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCM8550) },
 	{ qcom_board_id(IPQ5300) },
 	{ qcom_board_id(IPQ5321) },
+	{ qcom_board_id(QCS9100) },
 	{ qcom_board_id(QCS8300) },
 	{ qcom_board_id(QCS8275) },
 };

-- 
2.25.1


