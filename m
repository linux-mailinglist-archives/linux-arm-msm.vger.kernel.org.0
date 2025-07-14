Return-Path: <linux-arm-msm+bounces-64745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95336B03625
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 07:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1FEB1703E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 05:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE932046BA;
	Mon, 14 Jul 2025 05:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n8uZwMTY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B1E1F9F7A;
	Mon, 14 Jul 2025 05:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752471725; cv=none; b=nphvzyfEQj/1FLq6MQa720ER4+o/ZVG0GzbZDeRQWWfrLz00T9ufuYF9K47XS05YktGlEBDrcGWR+VhQe9gMW2ccyO1Jc0BX2I4ORwB1yeMNeTJiHrxgoDPaTAE6sT7JVcwvmvI+SuG0niJ7+HICsWhsDaNPUDaANT9vUHwhsCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752471725; c=relaxed/simple;
	bh=ieBWG8mt8kU/Wejm/cdPqKm/aSVLdXwPC6j3ZcMLxrs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kHayedrihSpnvXsfVOUi65/QuwxukJR12OGC9uHXHUi07Z8DXIlATH+zUopG/57w1sKiRkWnR23qSDgn09V9tOv0DS72/nkonT5coZBFiFL/NqD1Bk6YyO4pJBet6dZVz+eY0qgg98NUF9NDlAc/7qaQ7PQ5GICl+Ywnek8MfRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n8uZwMTY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DNKcVS018281;
	Mon, 14 Jul 2025 05:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q2oESWDSL/f/D+rHOnIH1Y
	oWvsdaZQhswqRwcCW3X0A=; b=n8uZwMTYrgROZKuxHa9NUUdLnH9v3D2dozqJNS
	FLaUpdbFjCWYzf1T+0WyR08By6D2mloQ3/YxEG8AdJDPCpuapKiDqcVSVCcNf6Uh
	syCQSZIAzJhnCDr6ym5R0IUOx/jCYUNx6ux6ftzgr+e80W4Zz/ccpN9t5liFu8Bw
	cad5PyxL6UN7TUOjLVhytKiwU1fCggzSTsRhH7WmJsZ7AFSn0/SNUsMnJ9Qq7Ayf
	v/tsHXbW6DO43lqkfFIr423600bItNRQj0kns58UJRaETybqPmZNvz0IeZ+j9Moy
	PHxzvxzSSrBKFFiKnLawuh3qwHgp/jLXPRz0BGikEERt84sg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47uftmbcd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Jul 2025 05:41:55 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56E5fsj1017526
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Jul 2025 05:41:55 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sun, 13 Jul 2025 22:41:51 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Ling Xu
	<quic_lxu5@quicinc.com>
Subject: [PATCH v7 0/4] Add support for gdsp remoteproc on sa8775p
Date: Mon, 14 Jul 2025 11:11:29 +0530
Message-ID: <20250714054133.3769967-1-quic_lxu5@quicinc.com>
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
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=AI4FyeZ1 c=1 sm=1 tr=0 ts=687498a4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=qgJfyGv91k1fQCYRv54A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 1uYcMGwCpCOlHB7q24UcZRF1LZeGLj7k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAzMSBTYWx0ZWRfXzU58alWoEa+O
 QNdhONvKzGQTZpUXyTdZn+B0/JSzAwTwWV+X6HgcKvvAUhp3wbQSEcjXy1pT1M/FOGo0nhwOX8C
 eEV27f3iXHk1ePhbQUqjehCSFW9KVfxMzngF0avlhYdU3teU5vmdrLUABDuoLp7fu0Jr1jRFOMy
 wgz0LPDFDnPn5ge4X7AJqS0LQLa0FVsHGCvHid7xwp1KAlgXqmR6N4OIb7uU2KLFXawibRpmqik
 KTmQX4tmltIObpHL8em46lTuv6ltPBlhKnGS5E4v0kV6jDM729M8pP3DF4q18aYEfgdK4p2buCo
 4uxZh4VdRP/vvkKOr0bkFMU/SeKaVhUkt+xd2OxcvgfPuED3GVyP4qD0d3pa0xNGAXrHFH97hKy
 MwjywHfZRYKK66XK3QcoVdmuPZ52AM7RDTVjmCsyxU1xK1Sw6uux/QSLovGl8a8+LL2j4jEB
X-Proofpoint-GUID: 1uYcMGwCpCOlHB7q24UcZRF1LZeGLj7k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=611 phishscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140031

The fastrpc driver has support for 5 types of remoteprocs. There are
some products which support GDSP remoteprocs. GDSP is General Purpose
DSP where tasks can be offloaded. Add fastrpc nodes and task offload
support for GDSP. Also strict domain IDs for domain.
Patch [v6]: https://lore.kernel.org/linux-arm-msm/20250709054728.1272480-1-quic_lxu5@quicinc.com/

Changes in v7:
  - Edit commit message.
Changes in v6:
  - Edit commit message.
  - Remove unused definition.
Changes in v5:
  - Edit commit message and add sapce before comment end.
  - Move domain definitions back to driver.
Changes in v4:
  - Split patch and change to common syntax.
Changes in v3:
  - Restrict domain IDs to represent a domain.
Changes in v2:
  - Add GPDSP labels in dt-bindings.

Ling Xu (4):
  dt-bindings: misc: qcom,fastrpc: Add GDSP label
  arm64: dts: qcom: sa8775p: add GDSP fastrpc-compute-cb nodes
  misc: fastrpc: Cleanup the domain names
  misc: fastrpc: add support for gdsp remoteproc

 .../bindings/misc/qcom,fastrpc.yaml           |  2 +
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 57 +++++++++++++++++++
 drivers/misc/fastrpc.c                        | 54 ++++++++----------
 include/uapi/misc/fastrpc.h                   |  2 +-
 4 files changed, 85 insertions(+), 30 deletions(-)

-- 
2.34.1


