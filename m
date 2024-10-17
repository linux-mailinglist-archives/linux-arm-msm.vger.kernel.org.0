Return-Path: <linux-arm-msm+bounces-34725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4DC9A1FF2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 12:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3722B21D2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 10:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8654C1DC04D;
	Thu, 17 Oct 2024 10:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kElxpw21"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDBF1DB940;
	Thu, 17 Oct 2024 10:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729160883; cv=none; b=pje3OIMHAbliSMSDc7QBcW9EkPeT1pkJsR0hFJg6c0ovKcAYryS9DbMRPSJOrl8TF1QQqyH/A/kEy2Mst0LZKk8K2Xc1jBAddrZ7Nj4/01G2NUez+I+0Sil0tTX1SLGqwPiJl2u+1jgyJvx2mkqHH0Id+VLmjFll4X3ROSwHSu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729160883; c=relaxed/simple;
	bh=vHxOPdb7E+AmmVdo6npuKzs2hcgBYcF6BG7HiCbCLCg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IcPZZlo07ATtcOdOxdKBD1mlq1iuJY4iibF1aRK2iNRINJJE38p6TwVGkFglDjwFYaVZtpqxRJIn3OE8ZiJ6pvg8hSRhRmepxQlTPBKXB9RGVLgTdLbBhWeHDth84mm6GXllm8CnGhhq+XgwLpJdi4+Z+ngDU4DmFo9REzOrnL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kElxpw21; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HAMfAD019911;
	Thu, 17 Oct 2024 10:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wTCH1XG8cJWfXcNjT1fyem
	Cv6FwsrZJWCjKcm5NJ3w4=; b=kElxpw21fWNu2YZ+M9M5RjNZH6lPulQdIvalCA
	9fsuAco+KFh3wj8w1q6xV6VF4oSguz+pDhnTlTYKKARiWCjnJGTReVzeShZJETYx
	jaVo95DXiSbK57JuAtSu9Ze6PSzBPEfJQiWWueIVYXAkx/eyU8MXl6tVT5U7LxMl
	hLrunfwuq/skJyx0juNM4ZqObIq2aNraJI6WDgdc5jAsLOhkad0PSlPADXAecpim
	3r0VIAbL4RmL9MmXe/aVuIxt7z4ySFLdzG4a3EUp31bpzgqlX5k1PBXs720NA+XU
	pbSuusVixeNzgeD2cbsUo7Gpx1eP6prMjpzZosOPBhQKEmIA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42b0rx00f9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 10:27:42 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49HARfca007402
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 10:27:41 GMT
Received: from yijiyang-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Oct 2024 03:27:37 -0700
From: YijieYang <quic_yijiyang@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran
	<richardcochran@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        Yijie Yang
	<quic_yijiyang@quicinc.com>
Subject: [PATCH v2 0/5] Enable ethernet for qcs8300
Date: Thu, 17 Oct 2024 18:27:23 +0800
Message-ID: <20241017102728.2844274-1-quic_yijiyang@quicinc.com>
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
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: X4Wb4XEFg3bRkg6WGgIr_pvyrZG4mG-Y
X-Proofpoint-ORIG-GUID: X4Wb4XEFg3bRkg6WGgIr_pvyrZG4mG-Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=877 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170071

From: Yijie Yang <quic_yijiyang@quicinc.com>

Add dts nodes to enable ethernet interface on qcs8300-ride and
Rev 2 platforms.
The EMAC, SerDes and EPHY version are the same as those in sa8775p.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
This patch series depends on below patch series:
https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/
https://lore.kernel.org/all/20241010-schema-v1-0-98b2d0a2f7a2@quicinc.com/

Changes in v2:
- Detect rename and rewrite of changes, and break down changes for easier understanding
- Document the difference between qcs8300 ride and revision 2 in commit message
- Link to v1: https://lore.kernel.org/r/20241010-dts_qcs8300-v1-0-bf5acf05830b@quicinc.com

Yijie Yang (5):
  dt-bindings: arm: qcom: add qcs8300-ride Rev 2
  arm64: dts: qcom: qcs8300: add the first 1Gb ethernet
  arm64: dts: qcom: qcs8300-ride: enable ethernet0
  arm64: dts: qcom: move common parts for qcs8300-ride variants into a
    .dtsi
  arm64: dts: qcom: qcs8300-ride-r2: add new board file

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/qcs8300-ride-r2.dts  |  33 ++
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts     | 299 ++----------------
 .../{qcs8300-ride.dts => qcs8300-ride.dtsi}   | 107 ++++++-
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         |  43 +++
 6 files changed, 212 insertions(+), 272 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8300-ride-r2.dts
 rewrite arch/arm64/boot/dts/qcom/qcs8300-ride.dts (95%)
 copy arch/arm64/boot/dts/qcom/{qcs8300-ride.dts => qcs8300-ride.dtsi} (78%)


base-commit: cea5425829f77e476b03702426f6b3701299b925
-- 
2.34.1


