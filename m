Return-Path: <linux-arm-msm+bounces-40710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4C59E67DB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 08:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C36CD167942
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 07:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA451DC74A;
	Fri,  6 Dec 2024 07:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oeY7pmot"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192EC1D63D1;
	Fri,  6 Dec 2024 07:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733469685; cv=none; b=FH+dHMPcg3NQbo2pD6GEuQFT89u38qtXZQyim0AScLyGGfxThFcgG4k6N+wVASjH60JOgvBadktkzuSkl9dDUoAypjjmcOzN0aFgxXo5akvrY9N00FMMacitjKqblKcP0hcZ3KMX1jrZ1fpMvfr28hIcFrGu3TGltxhp+iOSnPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733469685; c=relaxed/simple;
	bh=fSMQrkDhw/vJNd3gk7utt1OzEWZncjqgervqQUWhj0A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eA5N2M9QhUM0B7yF+5oCQwOlm279OgnBO65rVZLYYj5DLy9hsTp2asQlvOqblYvyPsQkscEXq8Z5R+Rs95KoD9KlHWTingt7CMSLkPJoYcR20NlXAYrXvkmWZEWuGK6UsKasrS/3Qk1mX7SwinN523ZY2tow2SUpNWnawF0gJMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oeY7pmot; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5Jhk0n018703;
	Fri, 6 Dec 2024 07:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tuHmPsMX3lyuBRRfBtaLZ7
	VzR+a1yDyK7qzLVUwpMH4=; b=oeY7pmotCoFvlklAdASQsacM+VmodNdzzqQtJN
	X154JYx/fUK5tWVkjPYRIHOYtROBNim+W/glwBXKzmeFd/VRp0mpLAqt/TeyXl4w
	1Ly0bOjKfLUPXxAy8RmLONQnM5FaXGQyo4HTkGvisfYMGw9SqS97L83/ZynRlx3/
	TlpRIBcLqMZE90mi2/cXc81X/ply/gD5r4HG8nSoLdKapLNhEjxZB1UBk24MZg6z
	q/NkjpR4bvlTQ2nyCtRMy6eZK5Q3UFixZus6w3pLXcDhzieUuspqthiRIS18BZBu
	mZMrgLdBB2sMOsYc/9QY3dZwNUJhlVQ6P6b7GVFpzzz3tF+A==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bjk8sff9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 07:21:20 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B67LH5B005909
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 07:21:17 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 23:21:13 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <quic_mdalam@quicinc.com>
Subject: [PATCH 0/3] Enable TRNG support
Date: Fri, 6 Dec 2024 12:50:54 +0530
Message-ID: <20241206072057.1508459-1-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nthfc_akHYdEpAb3CSGcZT_mTbHyjk1G
X-Proofpoint-GUID: nthfc_akHYdEpAb3CSGcZT_mTbHyjk1G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 mlxlogscore=441
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412060051

This patch series enables support for Truly Random Number
Generators (TRNG) across various targets, including IPQ95xx,
IPQ32xx, and IPQ54xx.

Md Sadre Alam (3):
  arm64: dts: qcom: ipq5424: Add TRNG node
  arm64: dts: qcom: ipq9574: Enable TRNG instead PRNG
  arm64: dts: qcom: ipq5332: Enable TRNG instead of PRNG

 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 2 +-
 3 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.34.1


