Return-Path: <linux-arm-msm+bounces-52060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2D6A6A24F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 10:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEE9E427C03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 09:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BF432206A7;
	Thu, 20 Mar 2025 09:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ofcXfjG7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748A8221F03;
	Thu, 20 Mar 2025 09:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742462116; cv=none; b=GOw9ZqYBGMtcXFYFlDh8tTbINriGF2WkOAnR9U/bhy7iv7Qu3biymJQTc1zLCxAMfPUCs1CfUUkZrvyYQW3qvYEekG/UUMQDklsFeAHIgKlp7GA8oKHyhwXtJe2IMizh4prPOb++f2BXbBZr9HmFdpcv1ZSOI+psh7Sv54d9UIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742462116; c=relaxed/simple;
	bh=CRpBvJD3bd8E6TTulPATV/6grgnqeVKJw7mnxiB6weU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PV/gN+2C4W2mITY46r0kvLlZnEToViSks7gTEKvzkqITy7E+VrgpBP3PIpRlPq65vQTDTH5H8Y8zjXqWqH+MeiP6vQRgWRzf45SHEsnMojAeGSyybirxREh8S8j71p1N3cc79th14dzLgPlrRJaFjnJB/KihfB9lGV6BuxR4N/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ofcXfjG7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K6YuFX004912;
	Thu, 20 Mar 2025 09:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EHuR2s0HntACm/a6lI2yEX
	QONouLca54q5cFKrGrdwg=; b=ofcXfjG7p5RZHNkabQt+CMskaeG6lJP4H/aCYQ
	7sQfEwfdszJ8IzEHAL1fQTGaS5g8V7UYncu24PQSBlnSqZYFVRuTw44LmO7SQH2D
	AixNZqD/GNUNLzZzR2ZEN7FrSi4AHfNfLePJ8Bj5GwDk4tTdNLRQwZGN9GU5orWF
	Q7Mb1i24GROEhwlegTLXsfwFW6jQBOgrDnm93mueBwhPSMlPOSvP4wlAGXVInCOv
	ZKDq54HyR/GpqrDG6IGTvkS6v67JSHRCuPFvo/mpesw30JhyXYK1bfAIUe634+ha
	0xklIF/w/CDa97GYHcWy42LTNDi/YquzPIWw3AEg/v4qHq6A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gcd18myf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 09:15:03 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52K9F1eG020305
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 09:15:01 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Mar 2025 02:14:57 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <amahesh@qti.qualcomm.com>,
        <arnd@arndb.de>, <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <quic_ekangupt@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        Ling Xu
	<quic_lxu5@quicinc.com>
Subject: [PATCH v2 0/3] Add support for gpdsp remoteproc on sa8775p
Date: Thu, 20 Mar 2025 14:44:43 +0530
Message-ID: <20250320091446.3647918-1-quic_lxu5@quicinc.com>
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
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=bfFrUPPB c=1 sm=1 tr=0 ts=67dbdc97 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=mVQdYIaDE-e1hwXU0PQA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: uwh-G20-QTZH51FtrEmNzrC0mG2qq-qA
X-Proofpoint-ORIG-GUID: uwh-G20-QTZH51FtrEmNzrC0mG2qq-qA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=769
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 adultscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200055

The fastrpc driver has support for 5 types of remoteprocs. There are
some products which support GPDSP remoteprocs. GPDSPs are General
Purpose DSPs where tasks can be offloaded. Add changes to support GPDSP
remoteprocs and also add GPDSP fastrpc nodes.
Patch [v1]: https://lore.kernel.org/all/20250320051645.2254904-1-quic_lxu5@quicinc.com/

Changes in v2:
  - Add GPDSP labels in dt-bindings.

Ling Xu (3):
  arm64: dts: qcom: sa8775p: add GPDSP fastrpc-compute-cb nodes
  misc: fastrpc: add support for gpdsp remoteproc
  dt-bindings: misc: qcom,fastrpc: Add GPDSPs label

 .../bindings/misc/qcom,fastrpc.yaml           |  2 +
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 58 +++++++++++++++++++
 drivers/misc/fastrpc.c                        | 10 +++-
 3 files changed, 68 insertions(+), 2 deletions(-)

-- 
2.34.1


