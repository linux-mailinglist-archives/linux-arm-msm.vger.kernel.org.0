Return-Path: <linux-arm-msm+bounces-42924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 604C49F8CF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 08:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FEC7167AE2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 07:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ECC61442F2;
	Fri, 20 Dec 2024 07:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="msYb4enr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0782594B4;
	Fri, 20 Dec 2024 07:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734678073; cv=none; b=aWqJitlMhE+ZYhF/nLImAjrMwnwxJG0Vfy34tAi0YJk7PYL/GtEKAqMFrQ08ecHMjh4bl79RntuU6sdAV313qaeOYQGDbPqWL50bteqNJfqPgZaHkhyLdgxMAEpluwh1v7yYHB6bFrgN3FmPmZo2XVaOc6ZoxbKsIOJ3/gshgFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734678073; c=relaxed/simple;
	bh=jKxTp5osuBAwL9zWD5bf1pX7CyTWZ8EHA4hKH28FnHA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ro0HEOLkByHLfl9NtOV/zO2dxBlq8W16OBzHPYfOPxYez993wyd4oAx/cQkSCKIZlifBMk5a0lSBZTYM0oD/rhCnuLiSANoMVbhr2+vhLAL3zaocBy9N2LSKGrsvTehzziuSbfD8b0G3U5k2EQCAWrnnGpaBMV94p4MKEVjNPLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=msYb4enr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK4PZWf024611;
	Fri, 20 Dec 2024 07:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=695TpZBtTtcyA9EAimn1qE
	z9CVVrGJDNTlqx0hMFTmo=; b=msYb4enrTKi3tmqweQTQA1bqDN8QgBOEEtJKK9
	hv1ufZXQKah8OXsSHxtnqzL+iD7Z4L+RV/pISQubld30GVl1Ep0ZICMleyVz89BK
	6YhDzZISp5y76/3WA4tUFe82fglB/xubCu2nzQY7BGXykKVkI5nPAu+N4wAh7qHq
	xmH1bbGgwX1c61CEHi/lK/0lzfaJDJTjlr+lQgq6ww72SbQmZNUWZs06QIUq1bUS
	19fcQuMJoXOI463/sGR3ykm1+xDkDvU568fITYzbkhLIQH23iSbx5JljPTuCcc45
	M0MbOOgS/SrQB1Z9mjfq/oDcOKKfSgTewQ7WEDFJbh+xVDRw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n1hx0awe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 07:01:04 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BK714Rr021531
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 07:01:04 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Dec 2024 23:00:59 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_mmanikan@quicinc.com>, <quic_srichara@quicinc.com>,
        <quic_varada@quicinc.com>, <quic_mdalam@quicinc.com>
Subject: [PATCH v2 0/4] Enable TRNG support
Date: Fri, 20 Dec 2024 12:30:32 +0530
Message-ID: <20241220070036.3434658-1-quic_mdalam@quicinc.com>
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
X-Proofpoint-GUID: ZkHIBFffL3XJaz1EnFCXPuYOKxuKTPy9
X-Proofpoint-ORIG-GUID: ZkHIBFffL3XJaz1EnFCXPuYOKxuKTPy9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=755 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200056

This patch series enables support for Truly Random Number
Generators (TRNG) across various targets, including IPQ95xx,
IPQ53xx, and IPQ54xx.

v2:
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


