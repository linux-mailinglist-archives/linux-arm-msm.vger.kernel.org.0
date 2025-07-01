Return-Path: <linux-arm-msm+bounces-63163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D3BAEF1CA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 10:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D88073A9E84
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 08:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33655264F87;
	Tue,  1 Jul 2025 08:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C1CQEB0i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C34267AFC;
	Tue,  1 Jul 2025 08:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359782; cv=none; b=B4DLIM5r1SDTKoF/8KppLxsdcDzumGbDWj7N7hTfeao3tICQVlDp2JKJIfRxnexsIZZrq9DZxXC8H+4hOPNQMSr4iOJFWpZELvR0sKVk/ITwjwgVQzIjZ9po033WfMbqRFcfJWie26TNU0CLmVRSxIa9H+/IqVkAqLN7cM74Hws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359782; c=relaxed/simple;
	bh=eMRQSOwBJSR82Bn9woDhCptzGRUJdasTIRLPWckVYMw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vBbhTek1y6SjX+B3df06cI8N+UofcE0InnnW4Jrk89MPlW1U2HGA82jTMeefqfiKFsKb9ZhTLx9pcfZDsMkFiFi3HBX6tlrbbZy6yPdH9AwhIpgNPe/RntbU/ccvYrDe9aX0U1B3OPqcGP5z1gMZVPjGhKtpWJE1ZKnHePDCgE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C1CQEB0i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5612jZLI029412;
	Tue, 1 Jul 2025 08:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	40WY7jpG9kl1Fvt/9xKnfx7jbI6krkjRgpk84dBOt14=; b=C1CQEB0iD1mcVS/n
	148RNgFDr0X1yaVA6QLczHveZXtvJGI7xdzOt7NwsR1Te7UmaD8a0W06mSAtTq00
	5a7+16T9UJz8+aKjHJiH46Huphb17hzLc/OzjIuYhjNj6gAh4rNk5MO5Bl4cfV0K
	YDn29AYobUvMJWG/NwXGhfnD0bE2cWfuX126grlGKnliIiiqYfyUsCXoPD3SmyPn
	37MHlds2iXjOXQF9FdAe9RercpUG6Icye7tX9XQwz0yYo0IHJMtooGjphBj122oC
	00vi9Vkp58J/V/dsswj/CA9AijHRoH0u3OIP1uE4XQbYO44+pLteplyC/Vd3+cFZ
	tWHHSw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95hys6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 08:49:34 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5618nY3G031480
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Jul 2025 08:49:34 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 1 Jul 2025 01:49:31 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <cros-qcom-dts-watchers@chromium.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ling Xu <quic_lxu5@quicinc.com>
Subject: [PATCH v4 2/2] arm64: dts: qcom: sc7280: Add nsessions property for adsp
Date: Tue, 1 Jul 2025 14:19:05 +0530
Message-ID: <20250701084905.872519-3-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701084905.872519-1-quic_lxu5@quicinc.com>
References: <20250701084905.872519-1-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA1MSBTYWx0ZWRfXxGBnhvygBcJl
 pbJtU8zxty6D8BrrjVzZgObVpWesvxqUgciB3Xs5/ncP5lIYvoHuKeKFHGCz2AjdQse7XWaExXh
 dMkD79JkmsWyz3nWXPRL1FKh48bzEqymv+nIlW2nQykmiIskZvD63v/eCdGTO21Z8U4A9k5Ri+J
 ax4ypGEfdOaAyPuiB5eMO69ozOdXaKhU2+pTBefirfK7gze6IaHKmgJTOGdiP7Uhj2p2EpCzLu8
 eiAWWNpPwWO10Z3o6HZGwj6OVLhjqcdjuYCOFE8yvF4iDnw2oInGO1Z3BVFSoKw9+VOLTlh8YmE
 E4+Dm/SNGPPnt0iGmNZspC1toW6XQ4zmcYUreTbiQCffyWiKb187dgbxt0uzwc4WqvWSjESU+xd
 OqFse4BzV2eqXS59BxBhjGPDzIQ6B86hPk8B8jZjllemBVfaYd8+oaZv8FD63Y6tG+wvN4DM
X-Proofpoint-ORIG-GUID: ArZIZNeymzrYWIZy_fPNHuVIvZ5OPBHm
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=6863a11e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=92LHXw4WN0ZY75pjLU0A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ArZIZNeymzrYWIZy_fPNHuVIvZ5OPBHm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=669 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010051

Add nsessions property for adsp context bank to make sessions
available for ADSP offload.

Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index b1def5611764..5a1eacb6685e 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3939,6 +3939,7 @@ compute-cb@5 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <5>;
 						iommus = <&apps_smmu 0x1805 0x0>;
+						qcom,nsessions = <5>;
 						dma-coherent;
 					};
 				};
-- 
2.34.1


