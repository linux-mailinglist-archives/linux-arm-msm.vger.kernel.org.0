Return-Path: <linux-arm-msm+bounces-65253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA34B076F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 15:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23DAA3A2F88
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 13:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 471601C5D59;
	Wed, 16 Jul 2025 13:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oPE9QAtM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9329052F88;
	Wed, 16 Jul 2025 13:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752672562; cv=none; b=O89d2KEMEwJDxL38BR5C0gP8N+P6iqjycclwg/ueFny86gMREG2h7dpGCqbvg7PIJaIVtfTwif3ACr7Zn9ui5+Alv+wcGrypJ2Mz2d5E9YT38hK9JWKYCCeUfJtBXajwgT9zI6GrYN9TLonEVPl9yAPV5AtYECfx5CyxRxnxxqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752672562; c=relaxed/simple;
	bh=xGDQHVKVaYo4kXEePdalUf6IYhlWMbR6VoXt203HmgE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ETRcGj2FnzQVVGFRJP1ViaWn5eC3sdC4dt+zZvNlZyFzmvVCKJeqsjiTBFOz1KreLgzMdFZNFb2xPjQPp1rInpsgMF/tDYg2Bu2jKbjKSVXPREGOd9wUnZyDBxwLLkCUpgLsBgeuOJBtaZJWz/y5Rti4maeB2uokX4KCeCSHPD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oPE9QAtM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GD1ijE014502;
	Wed, 16 Jul 2025 13:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=umpelYDRPaENSzFdU/fdMi
	J120l4CwR4raHIWu0Krjc=; b=oPE9QAtMqZXFzI/kqv+OqaLDXK2+FRl6OaY0Xp
	diQ/yJhsiOL4Um5LUctzkuqDrPxsq5cjk24aVL8wtdLmWRPMYK+iWlcL38QqTnE1
	zJ8FUSyzURCvugEiGiJluVhsypimxE7YgKhdOClkY5cweqvGXJ5EEJSINpRv9hZc
	j1ZYHvb/EOhlf/cmn9n8EMl/iru0q1KFmRzECE/xDfTxvcLKE7vGA7oNzVmkBZfP
	e8CtgaoqddoN9bltTD1d2EXLyYD6kR2giar7ICC7gWTOmiEV4yDUlS0NTrVunw9z
	cvY5YY9clqF7bBpeVVfaFxG408jH5U6MOSD+7XUInqRLnkLg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dypy9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 13:29:13 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56GDTCal031009
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 13:29:12 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 16 Jul 2025 06:29:08 -0700
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
Subject: [PATCH v9 0/5] Add support for gdsp remoteproc on sa8775p
Date: Wed, 16 Jul 2025 18:58:31 +0530
Message-ID: <20250716132836.1008119-1-quic_lxu5@quicinc.com>
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
X-Proofpoint-ORIG-GUID: D2aQFu3kL5zUfEb6BCjMbrSQ0cCXB8w0
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=6877a929 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=qgJfyGv91k1fQCYRv54A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEyMSBTYWx0ZWRfXzBHRFFPgfNWY
 GPTSStnWX747/HEqJAD5OpNcOS7kQkJIJpYLv5al27K/99s3qMt3VCUlj2onAQO5z2eMf9Y291W
 SYQTMaYTT69mx4z71hRTnlva8+x5UdNdINcf3AoKduFuR1e5zDAqyXmVWxLw0mIiRuaWoSnHNZl
 zj8G1Mu7pFLx+L0TgZ6a7rww0TeIqJCTMc8IjblHz5pL8CIzOtoK1j/u7xmewS/u0Ct/r9y98Du
 cTmaKadLflZ+TanCW27gew9krm0cK82tEu9QRMN/d52dwR3tWROgZXblCV0VTC1JqRRRFIs5zdX
 MNKRaeK+yzOi4JwMr5wEjtpeqti6Kh71fkZ6Lrwmr+IMfFYIVxBLBvTJdtEhPb2t/wHtqsgpyic
 c+oN65EY/ixXo5ogbF2l9RiDSEMO4E0vbfDfvlq9fgfwHgjNmf1JfgYmFL7ikUj10vDfHXpM
X-Proofpoint-GUID: D2aQFu3kL5zUfEb6BCjMbrSQ0cCXB8w0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=637
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160121

The fastrpc driver has support for 5 types of remoteprocs. There are
some products which support GDSP remoteprocs. GDSP is General Purpose
DSP where tasks can be offloaded. Add fastrpc nodes and task offload
support for GDSP. Also strict domain IDs for domain.
Patch [v9]: https://lore.kernel.org/linux-arm-msm/20250715085227.224661-1-quic_lxu5@quicinc.com/

Changes in v9:
  - Change the patches order.
Changes in v8:
  - Split patch.
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

Ling Xu (5):
  dt-bindings: misc: qcom,fastrpc: Add GDSP label
  arm64: dts: qcom: sa8775p: add GDSP fastrpc-compute-cb nodes
  misc: fastrpc: Remove kernel-side domain checks from capability ioctl
  misc: fastrpc: Cleanup the domain names
  misc: fastrpc: add support for gdsp remoteproc

 .../bindings/misc/qcom,fastrpc.yaml           |  2 +
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 57 +++++++++++++++++++
 drivers/misc/fastrpc.c                        | 54 ++++++++----------
 include/uapi/misc/fastrpc.h                   |  2 +-
 4 files changed, 85 insertions(+), 30 deletions(-)

-- 
2.34.1


