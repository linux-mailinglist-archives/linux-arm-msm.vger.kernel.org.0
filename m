Return-Path: <linux-arm-msm+bounces-63161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 761BEAEF1BF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 10:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52E0B3B4B55
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 08:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352AB2571BA;
	Tue,  1 Jul 2025 08:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FRRzH9SP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B11223327;
	Tue,  1 Jul 2025 08:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359773; cv=none; b=MVUj+i/3pTpGKA6CIfgnzerW+jKchUBu4lH6JV5lrSII3hnE4l4oRfa4ZqzBRQPCi4u4R9DcLgF07qS6NrWIgBRFNfrO+3M00XoB8ZuSy1GZTntJRyYXeaW/I1F81QLwTw2ds8goZL5hsetFYafHIparSUaZI3YmBGcfu5dQOwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359773; c=relaxed/simple;
	bh=gRTf4kcPVb09tcRj8ksQ2dvnka5DMq0Gpkh+Sy8Ta1E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GPssJQQm/I3fSbGESxHFeZZWWvCKmatHKXCxCmqzOw9tIrr7yjw4PixMZ23RWOBlN/qZ9PFu7FEZTfPaG7/dPNsZOusyY07HbN/U34AHveLbM01wH1qet73VC6qo8LKnr2EmuR6BEJUFASOA0aVrpXBcwTS+buUKpVXUSu2+5vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FRRzH9SP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5613TGXM008152;
	Tue, 1 Jul 2025 08:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4BSfFFApLLZWn/uZP6d+ak
	Ui8u6uMgYxZzUMig4Dn18=; b=FRRzH9SPJmRhA98wx8Sj8FToagwZrh/4V5jVuh
	UdMo1eI71OJIrFZedUFfftJtttfVhLdN4Zc4OxLnS6kB4NCftxc0KcvcqrtUUbe5
	l1QcsqZez6O2YJw9L3M0srlNkD7CFnsA3cBpW4uL8JSXZE7Yhtut4tpYGOJnKEni
	TarMYIQrH5gZjP6ZjiqzGRX6rz5z6lVUQ2jBPGkW/dffENm7PVNQXUCXT7eUpGve
	vrwYw4RGUd6gxWEEPRbU/7phOOQnXM+/aDoqWWc8V7egvXxLKfo0gBMp3q87QZmw
	BWZzX6kKU7H+xRsC3rlVq4/PBFewIq1PtxeHgXhKPCnoUC6g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kkfmvk8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 08:49:27 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5618nQS5029733
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Jul 2025 08:49:26 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 1 Jul 2025 01:49:23 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <cros-qcom-dts-watchers@chromium.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ling Xu <quic_lxu5@quicinc.com>
Subject: [PATCH v4 0/2] arm64: dts: qcom: sc7280: Add property for sc7280
Date: Tue, 1 Jul 2025 14:19:03 +0530
Message-ID: <20250701084905.872519-1-quic_lxu5@quicinc.com>
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
X-Proofpoint-ORIG-GUID: pfOzB5QwiUhaam9mqERqJipOQUXB7XVm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA1MSBTYWx0ZWRfXwJxnSA3R+aHf
 Wpct3N2blS/tUquekWsWg6F+84LHAuskkmPAYgPJt+RqiI5d45vHC0HGv+HsvIXkl3jATaLReB3
 u3vH0VwKZETpVx5hjY49oi+T44PbO6+jF//swqNkWZJ9+ZaMnqd9e2MY/lY8vTB2lnNTAZzN5rY
 FF3T5UyobgJJskzMjgx710MszD2pILyQUeyh5g697ZHZzDEEIqRK3yctbcrXQywq8mDFavoAEt1
 ZZ4iyOGYdentSDyuoozskX1KQr4crMK9QemamJLutCnDTcCvNr51tiUr3MGjwAbX2mCb/kwqkc4
 8Qoss78kW5TsGT+UBxCE0WYautAzeKufQOUqL7jLkA3+yF2Yma9wwCBxAoaxCwBRoU9BRYTPTu+
 ndydZfHftPy9bdfUBCJ3QWiE72+lpYHNNCBTm5vBYh5KmRaa22JnRUkwfbAEw8c6GHOXUXAL
X-Authority-Analysis: v=2.4 cv=L9sdQ/T8 c=1 sm=1 tr=0 ts=6863a117 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=nP9DjPefQNtmf87SolwA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: pfOzB5QwiUhaam9mqERqJipOQUXB7XVm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=364
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010051

This patch series add memory region, nsessions and dma-coherent property
for sc7280.
Patch [v3]: https://lore.kernel.org/linux-arm-msm/20250626092952.847393-1-quic_lxu5@quicinc.com/

Changes in v4:
  - update commit message.
Changes in v3:
  - Dropped dma-coherent change.
  - Modified indentation.
Changes in v2:
  - Added compatible.

Ling Xu (2):
  arm64: dts: qcom: sc7280: Add memory region for audiopd
  arm64: dts: qcom: sc7280: Add nsessions property for adsp

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
2.34.1


