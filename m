Return-Path: <linux-arm-msm+bounces-29693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C14961BAF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 04:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C977B1F23C4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 02:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F4B433A0;
	Wed, 28 Aug 2024 02:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CpnFqn3Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075281B960;
	Wed, 28 Aug 2024 02:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724810572; cv=none; b=uvBiaXUlRJEz1hhIozxKa1+SaYIQ0QswfTIu898YEK9CnE3jFftTqLMWa1emZPiEUeAlvEn+Vfbotbe46VcdsExHBE+sV52ys8yysSVFqNAV08SVcb+gL+2Xc5jmJ5ujyDyjuvw19jg6u8TMwTobhr4zVNu2HFG9ryaCi2vnO7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724810572; c=relaxed/simple;
	bh=oxoUQPiARXJue9Ub2ptISu21lYdpC0tiy/6GcjfTPp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Nd4rja+FEtyZdan92t7GT3Rw7lW+EJA20kCWBVFFY5OQnEweF3mXdPNtieFCwsCq8PWmDmkgqHk5VsohSDNY7YVzX2FNPAzi8C8c05qwt870k/JIS+TK67nOxTRDV6jd1Rg3XWEl0WZqvZYDTCHzSdsOVzrq8JEAkr/qY3v9aXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CpnFqn3Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RLbGHA006806;
	Wed, 28 Aug 2024 02:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OsFSt63WC+Ng41HmkIAe2AUNgBtDqtNy3xluFWn6l1U=; b=CpnFqn3ZEE2FzygJ
	azcPZH2/4FuR2MCh/BROSNqfReTf35jFk9RB2u+K7/G38s/QwQooQ6jpkP8i8HVX
	ybP0zzzMasOjo2KDEWadngqlIld/2MJLiOfAYuRdvITZ0/sCW3VaObQrDRu4MnpU
	cOotH2uYnI75RhbA2jtei/VCdM1wpDLTD8JZHt+3E1/P53CNDOeXWjDPNOboGeE9
	3/g2mpojw9SpCzc+AFyXpS4D/cBxbvFOPz4khIKgVDznKSoWhyVnNTftxQp1cqUz
	PMQl3Ru35nvEWwa3pJBI82J2xmVMI4qAb1eNJvHfa+UB9dbFsdXuokjMK6ocYAA5
	jbDINg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puugd48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 02:02:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47S22hgl024664
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 02:02:44 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 27 Aug 2024 19:02:38 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Wed, 28 Aug 2024 10:02:13 +0800
Subject: [PATCH 3/6] dt-bindings: arm: qcom,ids: add SoC ID for QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240828-add_initial_support_for_qcs615-v1-3-5599869ea10f@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724810550; l=641;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=oxoUQPiARXJue9Ub2ptISu21lYdpC0tiy/6GcjfTPp0=;
 b=2dpwtjFpyBa1P9oPymNAJQ98tjYoUyFVmdCZC226vSnKp3tW3VBhIy8R+0C+tIZAANrtFg44c
 b9VG3vmNePkDRgj9aOU2OBQJzWw38+ZIKfd6TtM2vckoh4XWaBium5h
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WlhG97WNI23dus4c5VcGU-gEPVFzgk4v
X-Proofpoint-GUID: WlhG97WNI23dus4c5VcGU-gEPVFzgk4v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_01,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=638
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280013

Add the ID for the Qualcomm QCS615 SoC.

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 8332f8d82f96..73a69fc535f6 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -278,6 +278,7 @@
 #define QCOM_ID_IPQ5321			650
 #define QCOM_ID_QCS8300			674
 #define QCOM_ID_QCS8275			675
+#define QCOM_ID_QCS615			680
 
 /*
  * The board type and revision information, used by Qualcomm bootloaders and

-- 
2.46.0


