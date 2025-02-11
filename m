Return-Path: <linux-arm-msm+bounces-47522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F3AA30576
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 09:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93B7918870E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 08:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DCAC1EF0BB;
	Tue, 11 Feb 2025 08:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EG8Iv4k9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84181EF0B4;
	Tue, 11 Feb 2025 08:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739261689; cv=none; b=QWa3cnuXOm3l8YZ4clpBZNyOh4T4iC1Mw8z7Zz7pKc6xdM9fDXYCnrd9SzlhpCOv+ErZSMM6wfISzW3BNDARpGwwNUKncOneNd0ReCJSU7mcWRZ9u16g2CWBlN9i48Uqumzfrd2l+J/AcLhEIypbQmS0W2ppdSWsVZ9E+dlEL7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739261689; c=relaxed/simple;
	bh=qk0fLR4Il2BJiKJ4HgBh5BYwjFWVFeUDKtskwx3GxnY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D6f1BLb1MEtlhMSpqnX7pF3SSxlmDBYv0LFfspVvQbZno8jM2C9f49W1Mmvn3W/RRhEYEYLja7IZw3sACyL9YQi1u05Ua3zFsD8mUAYyg7M2dVxuA41y2f71GTzquOJ9mfZbDoB7BBMshzIyC9DIhHq5v1kXveBD0YHnLd64+2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EG8Iv4k9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51ANcAf7031923;
	Tue, 11 Feb 2025 08:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4IQzsZfZkYg2hQh12RkaSkNGvDsR9dJKDmQi215tL7w=; b=EG8Iv4k96eGf2i4m
	6zBTwY7z9CydSz1cb+F3S70NIkk4yAtjPByHu0ALmIyIh6qjhTfQZMUhJtZeUHu9
	rwMuVOs/fKWptM+y6geQZQA1d6aE1rrYdPFSkby7OPvrr5yu9/EnxUK+0plW4Xco
	i2zL+1uL9a00xpiLffFju2G2TycfJ022hNa37PBPg7mxJl5ceKv1I44NZ+qrvAJL
	xhryUaBW/UfaY10oKHbpR87/45r99g8EhIOgA9bmX2jtNd6D4YhGgW1rehAELN4i
	yPtATAJSJvlqPmhsxO4It1IsibV9gy42ABJfvp/2Ttg5UVYQLgxWws4mrS/QWn6X
	6yuk+A==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qgtk2ujy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 08:14:45 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51B8Eivm014863
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 08:14:44 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Feb 2025 00:14:38 -0800
From: Ling Xu <quic_lxu5@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <quic_kuiw@quicinc.com>, <quic_ekangupt@quicinc.com>,
        <quic_kartsana@quicinc.com>, <kernel@quicinc.com>,
        <quic_lxu5@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@kernel.org>
Subject: [PATCH v3 2/2] arm64: dts: qcom: sa8775p: Remove cdsp compute-cb@10
Date: Tue, 11 Feb 2025 13:44:15 +0530
Message-ID: <4c9de858fda7848b77ea8c528c9b9d53600ad21a.1739260973.git.quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1739260973.git.quic_lxu5@quicinc.com>
References: <cover.1739260973.git.quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QfYm0jTZ30ysn1SYmfl82Cg_L_lNAeBH
X-Proofpoint-ORIG-GUID: QfYm0jTZ30ysn1SYmfl82Cg_L_lNAeBH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_03,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=653 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502110049

From: Karthik Sanagavarapu <quic_kartsana@quicinc.com>

Remove the context bank compute-cb@10 because these SMMU ids are S2-only
which is not used for S1 transaction.

Fixes: f7b01bfb4b47 ("arm64: qcom: sa8775p: Add ADSP and CDSP0 fastrpc nodes")
Cc: stable@kernel.org
Signed-off-by: Karthik Sanagavarapu <quic_kartsana@quicinc.com>
Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 0aa27db21f3d..81b2fba94841 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -4585,14 +4585,6 @@ compute-cb@9 {
 						dma-coherent;
 					};
 
-					compute-cb@10 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <10>;
-						iommus = <&apps_smmu 0x214a 0x04a0>,
-							 <&apps_smmu 0x218a 0x0400>;
-						dma-coherent;
-					};
-
 					compute-cb@11 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <11>;
-- 
2.34.1


