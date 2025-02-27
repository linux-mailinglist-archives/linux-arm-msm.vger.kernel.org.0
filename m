Return-Path: <linux-arm-msm+bounces-49760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6501DA4899D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 21:16:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12F91188B289
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 20:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F16026A0FD;
	Thu, 27 Feb 2025 20:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Xq4l3YRf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C303F1C07E6;
	Thu, 27 Feb 2025 20:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740687407; cv=none; b=s0T2SngFtn/M3ZH4EWjul92/DG2Oqe+hMsbVsQoLeUBspwpmyaz08w/oF9kBzJjycQg1y3YABzBz2c/Tar+MWkdjdTRKdpx4oehMok3oF7Qky+FVOxD0U5lDa6D4W4sBetSWBZhwOd3HoFd3al51mpQfWcg7EjOYFpmtHjnLE4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740687407; c=relaxed/simple;
	bh=MxcjkzDPIHcg3KNj0lmIWncZ3FmlSU1NI7T34ONrkGI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=JSGNcXhEhcgH/7aAZwAB4vdcf+8dfH7mcXh4RNSiUSxsrD7cxCe5SAGda9rE8P449Wo6vCW+C9pFHPUPlwIyUATcLozOP81e41KmsEDTWc+XupEYJ9KgWy1mDQ+KTYilt7cn8Z5AMXG0+6lcmztJdpU8FSkiFSPcS5k7qyiIdIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Xq4l3YRf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RHRcvo000916;
	Thu, 27 Feb 2025 20:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gVxDPMjtgXGvK9HK5aQoDB
	lcDQ1gOnuA/pbSsHiXW4s=; b=Xq4l3YRf9uwU8b1thtuKv59mwm/r2+XOPY9iYX
	SnIt+KukofHt8yz786k6uJP/vtXcjG+rJ1R+XbrQ4lepAq8LrXoFVTFcgiv6uUKz
	3YLrt+vksM6ijm4JeeSZx2xNwrV/vu6ZYwNtlJD6Rdb0DDnskunmpEDN3j/FYSkL
	nBja3r2ThB8rUN0vIu5pmfTopmx6UU1ZVPcqebfdCi1wETD1+giShJrSznOvTGa7
	p645xPsh4kqgHuRDN3y1xhRaiE/TvlFP7G9Hz2ngJy3+JGqrGdb25L+VkXj4SIQD
	qB1KDe6ybVd9Sx9f+QvIqMn76erc4L+wmbqzByzmlBcimdFQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451pu9f28a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 20:16:39 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51RKGcIf013462
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 20:16:38 GMT
Received: from hu-arakshit-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 27 Feb 2025 12:16:34 -0800
From: Abhinaba Rakshit <quic_arakshit@quicinc.com>
Subject: [PATCH v2 0/2] Enable TRNG for QCS615 Platform
Date: Fri, 28 Feb 2025 01:45:53 +0530
Message-ID: <20250228-enable-trng-for-qcs615-v2-0-017aa858576e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPnHwGcC/3WNywrCMBBFf6XM2pE8+gBX/od0kU6n7YAmNqlFK
 f13o+DS5Tlwz90gcRROcCo2iLxKkuAzmEMBNDk/MkqfGYwylTLGInvXXRmX6EccQsSZUq0rbFR
 NRNrqzjWQx/fIgzy/4UubeZK0hPj6/qz6Y3/J8l9y1ajQmtJy1/S2rNx5fgiJpyOFG7T7vr8BO
 /w9rb4AAAA=
X-Change-ID: 20250223-enable-trng-for-qcs615-706ccc131ba7
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller"
	<davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul
	<vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Abhinaba
 Rakshit" <quic_arakshit@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 04CD-ma_JhHqTPZZJSobxqNZIvPf_IMl
X-Proofpoint-ORIG-GUID: 04CD-ma_JhHqTPZZJSobxqNZIvPf_IMl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_07,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=682 malwarescore=0 suspectscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270150

Add device-tree nodes to enable TRNG for QCS615

This patch series depends on the below patch series:
https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/ - Reviewed

Signed-off-by: Abhinaba Rakshit <quic_arakshit@quicinc.com>
---
Changes in v2:
- Sort device node address-wise and document qcs615-trng alphabetically.
- Link to v1: https://lore.kernel.org/r/20250224-enable-trng-for-qcs615-v1-0-3243eb7d345a@quicinc.com

---
Abhinaba Rakshit (2):
      dt-bindings: crypto: qcom,prng: document QCS615
      arm64: dts: qcom: qcs615: add TRNG node

 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 arch/arm64/boot/dts/qcom/qcs615.dtsi                    | 5 +++++
 2 files changed, 6 insertions(+)
---
base-commit: 50a0c754714aa3ea0b0e62f3765eb666a1579f24
change-id: 20250223-enable-trng-for-qcs615-706ccc131ba7

Best regards,
-- 
Abhinaba Rakshit <quic_arakshit@quicinc.com>


