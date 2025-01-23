Return-Path: <linux-arm-msm+bounces-45919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8261DA1A0C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 10:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73A95188F4F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 09:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EB9620D4F2;
	Thu, 23 Jan 2025 09:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YscE2dOt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E12720D4E9;
	Thu, 23 Jan 2025 09:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737624031; cv=none; b=HzmDNmqkifvcyQD3R6AeyQYcVQQxd8/UT8ldG4NoXJhQh2TY+Jf6k3bg01FWLpKg/qC+7eF7mGSwsh73bgccAftvG+8W/BktwPh3scOe5uWy+1PCIKbSWG3W0jMAWuyIv3JK4bZYE+PHQBmqHmkBPvmxXx+EkCK+uyRElVqTWI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737624031; c=relaxed/simple;
	bh=R8A7ndQgYBYiJoWtw3AqHJifaWCFBs2m7lik/jMQgnk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WTAg0/RKtCO40kzeDKvxAZw6cAukT4GvNjrKWiuB2SG7g19XQLg3a2qUMFnkxd33ON7qCROOPGIrfq+tvcm4TulxGCYZiNShuBdmZaNKEkfQngcNXn/o972tM9IbhzccX+LJahIJOlaJv2AAoyHxTUQEppv/14jiddvf1dwC5qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YscE2dOt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N3x3hr017362;
	Thu, 23 Jan 2025 09:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xi0JKMi62CSM2AVJp2Y84RJ2jCwYmE/PrPQNwlfdRXQ=; b=YscE2dOtsvUqmQQO
	sgseDpUR0a++en31hqCqvEclCxiLALFa/ubq12975ChVxoYIx6TPejM7AXih26Yr
	8WVsNmQGJW8UTdr3vBBKDlsRWUS6FSrFsuMxTfS0HWDwUb01bdU+WbhJbc0hKVll
	GAsr6Q3AiqWpLDo9uas9PbGnKi08FntxX3Zlx2ZKXeRsWHJgxPHjycyzWJLuOxGI
	8WDgymbw5FL2OM6/myHnNAl7H64/ULWN5Nc4ugxenOgd9zZzucW6DmeYqbrf/Erx
	gdmItk46Jf0iVL9E2Aqzoxzy7VmSsTWh2L+W3glEokQfLnCSGUHmeQtCpjqX99RZ
	XLqpIA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bebbgn5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 09:20:26 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50N9KPiG011734
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 09:20:25 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 Jan 2025 01:20:19 -0800
From: Ling Xu <quic_lxu5@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <quic_kuiw@quicinc.com>, <quic_ekangupt@quicinc.com>,
        <quic_kartsana@quicinc.com>, <kernel@quicinc.com>,
        <quic_lxu5@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@kernel.org>
Subject: [PATCH v2 2/2] arm64: dts: qcom: sa8775p: Remove cdsp compute-cb@10
Date: Thu, 23 Jan 2025 14:49:28 +0530
Message-ID: <45e0882efe080d882fa083c16c51f613f70e52aa.1737615222.git.quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1737615222.git.quic_lxu5@quicinc.com>
References: <cover.1737615222.git.quic_lxu5@quicinc.com>
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
X-Proofpoint-GUID: N_9vLrAbSOkLxP_lFTEkWsT9MsydyDc7
X-Proofpoint-ORIG-GUID: N_9vLrAbSOkLxP_lFTEkWsT9MsydyDc7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=556 clxscore=1015 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230070

Need to remove the context bank compute-cb@10 because secure cdsp
uses the s2-only stream.

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


