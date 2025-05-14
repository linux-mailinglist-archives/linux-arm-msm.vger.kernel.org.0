Return-Path: <linux-arm-msm+bounces-57784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A99BAB623F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 07:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 196A47A80EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 05:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE201F4281;
	Wed, 14 May 2025 05:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IHznTGbV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8268A1F4199;
	Wed, 14 May 2025 05:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747200224; cv=none; b=D67wpxxc2UJPAkNwfNd5aIe4UL1MbzUD/idg8MXhqx6koQrjOLGid6lyL+e/dGPfdCw0aH2gvOYBPjoAwyD4ZuvxUF0LQAZpwoQV/J4Zjhp8tI/b2DSbHmVJ1deRQ1eQfk3E5BDIfjMTXzdt9Z4an4gx9zZ72EpUGc86xqIWySg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747200224; c=relaxed/simple;
	bh=CeHI+cIr6NUlwOnIvXT4LpSzTw0rK5nSGivGDK1Njvo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q3/YoVV2tq43A/+g8Cn3YvMNgxMFup+Cq49sHqmOsT4oMprlREEkUjnNJPoqDqiSsYW3leWUL3Wvf4IGW6GXjtiG2S2SAclVEuNiH3G+JlKlGxD5q6A0pYOgn5hTt6YG6mbaJTwrC0/r6KCGaANFIsseCHNJjLQ5gtE4DBWlU1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IHznTGbV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E2bvot018490;
	Wed, 14 May 2025 05:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cRVmaLRJQz/c9QbnOFcZw+
	QDA4D2ENmz4GqbrkEZaDY=; b=IHznTGbVwZPHcg55/yOQ1rXTbb8IaorB1R4tuc
	9VBv4mzqdKi/E+fju8m1C2h753wyOoUr8SIZQGpNrz7oOVZOWnrk6xBbPL1grd72
	S8meJfC+FG7HBXmwjneIpXmrZfuZVbB7QgjKpI4Y6UHEcQF1MpR0vDwokgWdJrvo
	tD/9GOyN8kScfwUDTzfbn7SnYAV2Cju+WoavOZaUbwg8fyOft0HnRbj108nE0nDR
	VM9hj/AkYinM02RSfq2S805yfy+95A9XBiMFWVT5C2DcdY0MtdZQ1Eac+5Qply08
	vEXKLAC/O8Kj2vsEcQ+MFEIQfYsfEbgNmj3tZL9bg2Lza7LQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmsfbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 05:23:38 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54E5Nc6s025997
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 05:23:38 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 13 May 2025 22:23:35 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <cros-qcom-dts-watchers@chromium.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_lxu5@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: sc7280: Add property for sc7280
Date: Wed, 14 May 2025 10:53:20 +0530
Message-ID: <20250514052323.3881600-1-quic_lxu5@quicinc.com>
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
X-Proofpoint-ORIG-GUID: ccUOGlLQU5m66DROA8BeN_NFlsK-cEvc
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=682428da cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=e1-p2UAVmv_opGtAIfoA:9
X-Proofpoint-GUID: ccUOGlLQU5m66DROA8BeN_NFlsK-cEvc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA0NSBTYWx0ZWRfX9vpUy+52bHw5
 7UZK8Na/DW9L+J7bIgNBUdVh9qM7mYD734tFRu2ryb9yKF6yGkeLY5DQJ6K2LGXPyZpDHKOxfOz
 DHCUD1qdUEESMQFe7kw8au66TMQ+Lo8tDpfMTaOPGwcBCCzkNDdxq6wf85dJHtiII3um17FisT/
 4gFtxkrKVvGY+X1IBbhr4Q3QA9SKCflRlCMOeWUlfv5HedZ54YgpMEo/IFi6YsxfIqZDLbusaNX
 wsGer2zkT31ZyiXVcd+2YPE+tB5t530fUfAWhSOG+LR7CpAhHn5RQqFYpEYC3zPgLyigCxEFoCS
 0YeGtAxtfMmpp4BIt3rXZPBNqOPczJlFbxms6lXeQm4H0Xwcad2+yEcbbZ5CrApi3pJ/vNnS9af
 VRwnj/9ZdspeC3qw42v1RckUcp2d9HrMZ40uCC7fqGDQ3qzTTHPk6dItlh41QnZJ9oOg0iSE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=424 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140045

This patch series add memory region, nsessions and dma-coherent property
for sc7280.

Ling Xu (3):
  arm64: dts: qcom: sc7280: Add memory region for audiopd
  arm64: dts: qcom: sc7280: Add nsessions property for adsp
  arm64: dts: qcom: sc7280: Add dma-coherent property for fastrpc nodes

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

-- 
2.34.1


