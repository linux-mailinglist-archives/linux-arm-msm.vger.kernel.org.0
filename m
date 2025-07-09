Return-Path: <linux-arm-msm+bounces-64116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9AFAFDF7E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 07:47:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69D981C26DD5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 05:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C559C1DED49;
	Wed,  9 Jul 2025 05:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VRWy+G5E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454023C1F;
	Wed,  9 Jul 2025 05:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752040071; cv=none; b=Bpj74hoGJ/PnX5rd903Wvh8ajnmFP1avgtbNLnfCsqla3rge32HWi595Zr3e/SX2HF4SRbokiDogJLYEXpXTp8Ard8pMU2cdMUxd6z5HOaQ75GJYikoyoNlPjd7Kf0Lp40vOwVF1bNo5GTN1F6GbNFcXzLjM5ZLAVtBJ1iMpDt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752040071; c=relaxed/simple;
	bh=U9kmBfYKwdAZZB2cV9sC6/+HBIK1/NBS6CuxjBv1OIU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rxwtWpr9lV4/TFuCbm0OM8Y4R69OqTQmA80Brn0n9HFbP1Vf3lwijrec72grU5DuB3LPQRw/XDm49sLLMHO0yvjMvMveZ3jK4RGej7oTrtOv23BjoWTuPNpet9ufRUGtkT3Hw7CXi3eem1DYF7sBIMGsTTCUIqL8Cet99IkHqyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VRWy+G5E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568I5YVg027587;
	Wed, 9 Jul 2025 05:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yZcSV9X2Ruy1ATU2ZuJnzw
	AVFrN/W5nm9mn0ydygTVI=; b=VRWy+G5El24hRDOuB6ZeuFldQZ06FQL+MwsY56
	bws+vvaSNd8AQNJtGkC01BI+dJ5WqtlxSPrqUafCOaW7GFUQVp/JQbmUjb8wIXG+
	Terc5NcXvPe7zVy8RBMo9ZG/KKbdWzi6+BKwlm5lG2AcSFCDc+wzYDg1ADIgCFZI
	59hsjSVj5WVNxWFOnXrxulppYjMa27ICrS7wZKO+BspPTWTYJtMliBcSBJVcQiG6
	Z385k1hoBxf5vf6PNpqZZvGgL5FyzWs4jPNhyN0pFb6X0zUl4hy04V62ZuYMgmqx
	RmlEA6ypCv70vBUnMUDe+SJuTUF4rmhBdFctNr4R7YOzP6sw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv4y3gjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 05:47:43 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5695lgHY009744
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Jul 2025 05:47:42 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 8 Jul 2025 22:47:39 -0700
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
Subject: [PATCH v6 0/4] Add support for gdsp remoteproc on sa8775p
Date: Wed, 9 Jul 2025 11:17:24 +0530
Message-ID: <20250709054728.1272480-1-quic_lxu5@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA0OSBTYWx0ZWRfX/wS6nTLRKRzT
 8M1Cqle77AaUjxC44Qs0MK1K13BLsJKmy6XwmLQyIN2jkUchFvxSZTVZ4AzwNWxmd3VoBxGv2UZ
 J+rBBSlbMBwfaJkwFXZuekJTVOuBOVaqmbJBmZhXkVYpV8lXDd5zUcLXaA8lOmxOyGgcP6tPGHM
 klzEbc39mvrtn2SdFGPJ1Xm9iUx6OoADbxRyXWCBBeDpMiPsg0NwK4C+IiMeEaYhpO/9f+EM9gj
 2q2q4qAdcSZtKhAjH/duCi04V1b984kKXMVjp5iU2tfHaDsILRPcVSQEczMmoHvGe0MkXBFpjGp
 UN35PE55d5FUG/me29zKEwcQWAQk9BZf4OhhWcFWl5B/okCxbCCuzVEEJ4TtjURsUgOi+FfRr16
 1AO7rlv2kbKuQN4pl4wACYRkJKo7wS1V+nK2sIOUS7wYyzIXFihylUIhvloyZAAmdw++u6Ld
X-Proofpoint-ORIG-GUID: qcOk-9ndvwF4eKPsXUWJHR7fB-3p_W0o
X-Authority-Analysis: v=2.4 cv=DNCP4zNb c=1 sm=1 tr=0 ts=686e027f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=qgJfyGv91k1fQCYRv54A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qcOk-9ndvwF4eKPsXUWJHR7fB-3p_W0o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_01,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 mlxlogscore=610 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090049

The fastrpc driver has support for 5 types of remoteprocs. There are
some products which support GDSP remoteprocs. GDSP is General Purpose
DSP where tasks can be offloaded. Add fastrpc nodes and task offload
support for GDSP. Also strict domain IDs for domain.
Patch [v5]: https://lore.kernel.org/linux-arm-msm/20250702025341.1473332-1-quic_lxu5@quicinc.com/

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


