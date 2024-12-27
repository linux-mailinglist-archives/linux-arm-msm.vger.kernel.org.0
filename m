Return-Path: <linux-arm-msm+bounces-43488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E15B9FD314
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 11:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C3701617EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 10:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0B71F12E8;
	Fri, 27 Dec 2024 10:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RdWLfyoA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD05F156F3B;
	Fri, 27 Dec 2024 10:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735296439; cv=none; b=gScPcGWrsWjI1tdSlVUTD8PBSy8kQYEuwU25hx1KA3xD7yxm+OqfR4Iiwe0gXw0CsIQbf86M4t7f3D9NQkN8dwKcyLNagbXnWKHR9Nc31rlV4owvmT+hZknRvLPf/fz2q4BeidDHhBdTEwB8ze2SEfCEQqdTxre+dkCjYsPfuk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735296439; c=relaxed/simple;
	bh=o/CaAapkbijHdcE4Y8VQ1WhAULoejMHnporwnwIqA2A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iEfMm8MlGBDG6ITPMMSds3/+4IG537pRcUOh5AwhaopzIwESj8jNNeRHw+3lZ5bQMHuymoVsUmFdrBuB8LT4tA3zE0aNLjT70ch+KoXNAyBLQW0J5CNqslwNepnQ7xop7hG/wghNJcqPF/PLL4uP1D+bHgSA9+AlqRJsBhpoqiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RdWLfyoA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BR9LjcZ026409;
	Fri, 27 Dec 2024 10:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=c3NT/ug8NdjNUQyxQ5m+EqKeH7urowEfzW95AmSaXyI=; b=Rd
	WLfyoAbaiSwD8m9BOfm3xwMVEi2oDN5mGBn7aYlxBslq+Oaocx/i5swyvCYmNeOp
	CRDRAN9QcRV5ZA1I/iRCpTpbYX0hmork/6RLzsXs7YTPmH6dVzhCBN11jUPTq0rz
	X/a0ibhQdIBB6neN/PZAlR/0q/g397nJia02wLLt/svSYXYzriJh+Y4WcckgObfy
	qTH+/DFENwF9ec6ejw62/Wj3KFebMTYcre5VOoi31DdAfqKXE4cSin9x47QzlHpT
	eauL/mCVRvoM6uApI2TLOK0uqHiaaokq7woDujV+26fRTCTxfL4zilywVQm8cWMQ
	DG19eriMADuncJNx3vIA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43sshpgc76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 10:47:15 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BRAlETK010286
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 10:47:14 GMT
Received: from hu-pbrahma-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 27 Dec 2024 02:47:11 -0800
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
To: <andersson@kernel.org>
CC: <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Pratyush Brahma
	<quic_pbrahma@quicinc.com>
Subject: [PATCH v2 0/2] Add support for GPU SMMU on QCS8300
Date: Fri, 27 Dec 2024 16:16:49 +0530
Message-ID: <20241227104651.4531-1-quic_pbrahma@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bt_QPoFhZQvJ-XlivFsjpAsxfVL5MQ4F
X-Proofpoint-ORIG-GUID: bt_QPoFhZQvJ-XlivFsjpAsxfVL5MQ4F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=633 mlxscore=0 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412270088

Enable GPU SMMU function on QCS615 platform. GPU SMMU is required
for address translation in GPU device.

device tree dependency:
https://lore.kernel.org/all/802d32f1-ff7e-4d61-83f1-f804ee1750ed@oss.qualcomm.com/

--
Changes since v1:
Updated bindings for gpu smmu for qcs8300 as per Dmitry's comment
Link to v1:
https://lore.kernel.org/all/20241224100521.7616-1-quic_pbrahma@quicinc.com/

Pratyush Brahma (2):
  dt-bindings: arm-smmu: Document QCS8300 GPU SMMU
  arm64: dts: qcom: qcs8300: Add device node for gfx_smmu

 .../devicetree/bindings/iommu/arm,smmu.yaml   |  3 +-
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 37 +++++++++++++++++++
 2 files changed, 39 insertions(+), 1 deletion(-)


base-commit: 4176cf5c5651c33769de83bb61b0287f4ec7719f
prerequisite-patch-id: 8faad5c6d8ca255935d3e4d317dcbcc32b8261ff
-- 
2.17.1


