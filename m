Return-Path: <linux-arm-msm+bounces-38271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFFD9D1F8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 06:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACB2DB20B9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 05:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17546148FE8;
	Tue, 19 Nov 2024 05:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O6WbYXdr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A102563;
	Tue, 19 Nov 2024 05:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731994154; cv=none; b=p9R2W6dV179oWVHqytkQmiqG6QxjfjGUqt/ywtHzdX1TY2MN4DqGrwYrufYBCpzTr8yz37Yqxj8klLO9pNrxuYTk8jkurG7yatQQqbW/sxFoVOk+8sTalgvjJStUilto9rBkN1OMmNpzxClsi7hJ0Q6JHxgqawRYAS02ZjjIax8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731994154; c=relaxed/simple;
	bh=ipLm/dDNSsILvQL+s4+sbhQz3jWxqqLRHuaUGewpqgo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AX8Uvw4tQZUCAXpSG5+e7Nvs8xHvEw3mOpjPn37KtDoAeVHQX3/OoNskTpqeXSiHzTPt7jRuOnNF4C5aBbG8BXN90fRDDYUkhxKVal/LTv8At+iBlfkn0hllXa0pf93aeTRzeMF//pJVbVt5kEQnKcRmSwZ9l97ZqD4jGRIxvRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O6WbYXdr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIGGd4c027503;
	Tue, 19 Nov 2024 05:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=trsXkWSic0ZLyW16ZkR3vx
	cKfXPrWVp1aIxyNwzCARM=; b=O6WbYXdr3tNiiybQsr2GoNkmiV4ptwm2buQPlY
	pdZ8eqFI1oneG/Wlc+NJapf+lPEUJMdvz8rT+QA4mWvqS3/H4QZsSsZWiG1DJGPa
	/2hlY0TwyrlsLyLopLh3neY+AOWZfS6DBZaO1lTkrKPNBGz/OhvrRVOd1YJUS5uK
	g/JImWUc2cK4jyujn6QgaYYCJhzIpS62pcIul4pbU7pGMr/GLyIMVjxyiIG5PXLQ
	zS9Yd6kJe7W61hO3DL/BoJN7tFQasoMLicksYYcLh7LJtaawUtB2GglF0fpH64D6
	HTct/YSK6ko+GIxZzIwWUCz3ccARyJHy5GfvP0Y3dC++xF4A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y6sgrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 05:29:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJ5T8LT009665
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 05:29:08 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 18 Nov 2024 21:29:04 -0800
From: Krishna Kurapati <quic_kriskura@quicinc.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>, Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [PATCH 0/2] Add DT Support for primary USB on QCS615
Date: Tue, 19 Nov 2024 10:58:52 +0530
Message-ID: <20241119052854.995691-1-quic_kriskura@quicinc.com>
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
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mrPcPWBdBxOkCzpLtoy1TH4y4QndRnbV
X-Proofpoint-GUID: mrPcPWBdBxOkCzpLtoy1TH4y4QndRnbV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0 mlxlogscore=569
 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190040

QCS615 has two USB controllers. Adding primary USB controller support
in this series. Both the HS Phys are QUSB2 ones. Although the HS PHY
is a QUSB2, it still uses DP/DM interrupts for wakeup instead of QUSB2.

The primary port has been enabled in peripheral mode as it is intended
for debugging purposes.

Link to bindings and driver changes (Reviewed):
https://lore.kernel.org/all/20241017130701.3301785-1-quic_kriskura@quicinc.com/

Dependencies:
Base DT:
https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/

APPS SMMU:
https://lore.kernel.org/all/20241105032107.9552-1-quic_qqzhou@quicinc.com/

Krishna Kurapati (2):
  arm64: dts: qcom: Add support for usb node on QCS615
  arm64: dts: qcom: Enable Primary USB controller on QCS615 Ride

 arch/arm64/boot/dts/qcom/qcs615-ride.dts |  23 +++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi     | 110 +++++++++++++++++++++++
 2 files changed, 133 insertions(+)

-- 
2.34.1


