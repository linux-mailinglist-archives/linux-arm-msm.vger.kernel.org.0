Return-Path: <linux-arm-msm+bounces-43361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7219FCAA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 12:45:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 290EA161DE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 11:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587D21C07C0;
	Thu, 26 Dec 2024 11:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o9Rdj8e8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC81528371;
	Thu, 26 Dec 2024 11:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735213530; cv=none; b=s0oM4Pxin8B6CSsoIqV9POUS2ixtnErrEOJazc2YwnDh/8vn0EPl/0egmeP2fkXDgYpkwbN+ZquvdXlTRHJw5HPYqymlZAgUDB7k91qq1vq8cBvMuFTIO5Feex96U2yxf1tS6ZtUIqF+QtyAWMBOchw7KySqUdSf+VBa4I5lB0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735213530; c=relaxed/simple;
	bh=kiPblnWu4zqmwNldRY+ITjIXzFzf1ZV3FzsLwOf+dFM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=acjWq/K67XA8jkd4g8b3NrFn6EK7B38hVUnwDn3EPRoSKpWCL89Sz/GpgPXo/CP+/01D2hv33P680Lhlu01VYw1kKZbfq7Mt6r+mv3TSulSRDqabbs3q0yT03R/JApsg4zMqtqn8IDzdXG8SpU9gE/pjRArqyNjqdgl8Z6Y+3aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o9Rdj8e8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQAEkpm031827;
	Thu, 26 Dec 2024 11:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PaJCdrgMB60gVYGoVzbE3w
	pcEJ0EqwzEtpZA0kK5tlY=; b=o9Rdj8e8AewYjFhO6Rt3eivTo86iOTkubJ7aNo
	Rbv1cfz01/uSwrdVBxgMZoCXCnQmqUMIW0A1g2yAMfa+vhwQa7/3fVZblKgbanDF
	Yhehxdpfo46ddVXG5kDn40ZN/5pq0BvP2JusMyoZLU3IYll6pshWivXV5+LQi4IW
	M+B3dXkA5sW8USrFiYWU+BREso+xXSQ1mQYSzSqiEy9R6TNJz0nltt2t849JhXp/
	lpQkV54RbnwwgvDggxJKa6jlrg04AGXQbr2lOWdi5peIVpcgN9af4Q9H/rhhPNqW
	C3OjMqxPygK1XtKb4Yzr1TOphb9YcRXl7OInqmzlNOGRfcyg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43s5730m7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 11:45:20 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BQBjKEB013423
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 11:45:20 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Dec 2024 03:45:15 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <vkoul@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <quic_mdalam@quicinc.com>, <quic_mmanikan@quicinc.com>
Subject: [PATCH v3 0/4] Enable TRNG support
Date: Thu, 26 Dec 2024 17:14:56 +0530
Message-ID: <20241226114500.2623804-1-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TVd05BqOXDEZGAH30iardt-yqEFDjvWw
X-Proofpoint-ORIG-GUID: TVd05BqOXDEZGAH30iardt-yqEFDjvWw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0
 mlxscore=0 mlxlogscore=879 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260104

This patch series enables support for Truly Random Number
Generators (TRNG) across various targets, including IPQ95xx,
IPQ53xx, and IPQ54xx.

v3:
 * Organized the device tree binding changes in sorted order
 * Added Reviewed-by tag

v2:
 * https://lore.kernel.org/linux-arm-msm/20241220070036.3434658-1-quic_mdalam@quicinc.com/
 * Revised the commit message.
 * Updated the cover letter to change IPQ32xx to IPQ53xx
 * Changed IPQ95xx to IPQ9574 in the commit message
 * Updated commit heading from "Add TRNG node" to "add TRNG node".
 * Changed "add TRNG" to "Add TRNG" in the commit message
 * Added changes to the device tree binding
 * Updated compatible string 

v1:
 * https://lore.kernel.org/linux-arm-msm/20241206072057.1508459-1-quic_mdalam@quicinc.com/
 * Submitted initial patches to activate TRNG


Md Sadre Alam (4):
  dt-bindings: crypto: qcom,prng: document ipq9574, ipq5424 and ipq5322
  arm64: dts: qcom: ipq5424: add TRNG node
  arm64: dts: qcom: ipq9574: update TRNG compatible
  arm64: dts: qcom: ipq5332: update TRNG compatible

 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 3 +++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi                   | 2 +-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi                   | 7 +++++++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi                   | 2 +-
 4 files changed, 12 insertions(+), 2 deletions(-)

-- 
2.34.1


