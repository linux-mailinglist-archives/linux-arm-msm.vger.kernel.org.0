Return-Path: <linux-arm-msm+bounces-64968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E494BB05570
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 10:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C7E81891A81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 08:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9A627702D;
	Tue, 15 Jul 2025 08:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WzS+1AZU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96331917F0;
	Tue, 15 Jul 2025 08:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752569585; cv=none; b=lMreSWChHHM9X8Z4d/HvLcWo5srk+pGOB/176jYSa4oOTkF5PZ4IXdhC7Sg9ApcST115Um7djqdkJe5qC09yplNZo4TI5mGDLTVTIlp52Rg3njhWQHGSSLd/SspNtTTg1nVxlsCht7VKyxfG4XV42Ygjl0fDrd0u5ePbQlyWhy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752569585; c=relaxed/simple;
	bh=KmAry4CSdzPdx/Tu3BX0MEqrvWM3YHGxVWi+1QSyT2Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LrbOdgrlxOCrvZAz1380ZPFkTFW5RW13FAoPdI5FmzOUSAIiBsPWvra1gCviNtP6arWqpN13ogdjawfZPK7AKRVpRvS9V6DXvAqDiOV+ekWvBW/bDP8i2Hl7CoT4HrHP5H1+f0wwBh5CQkhKkfTb4HQpUjKyMTjdzVANdD/pshs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WzS+1AZU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F7TqCa027348;
	Tue, 15 Jul 2025 08:52:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QpdPCQ/XE46ygp0N+SiJtr
	IAznAakRxbWwVqYLrlpQ4=; b=WzS+1AZU4eXoz+I4PvmbXYlmPDlASQltlyf4Hp
	FdFZxd9YmoYQXC2u8R6P/VhkfCZD8sgQh2MD3FTkCu9jUAMcoiShbang3ncALakr
	UhIHCK3wuPC44DWfQ4sxtyvF1et/8NBtiqY6T8oMyjofipNYeVFo2DbDrq/MA6em
	n/WE9PXNQ5lIU/MLhOjHCC1Qkq433pHSDAEgnP6zvlu+RqQdkwQmTFywbfUaCawi
	JxqMSG0gPD/jDlGQRCTOPF+0b5EVDTBxvkwQocH/vdMkvA4JjYhY/ZXdXx2oZFhW
	rQTaf+nmNN0ws3H27kLl9Dn6Yo3ZsqFlzli++KhbuqboncWw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug37ymka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 08:52:56 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56F8qtrO031113
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 08:52:55 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 15 Jul 2025 01:52:52 -0700
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
Subject: [PATCH v8 0/5] Add support for gdsp remoteproc on sa8775p
Date: Tue, 15 Jul 2025 14:22:22 +0530
Message-ID: <20250715085227.224661-1-quic_lxu5@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA3OSBTYWx0ZWRfX+O76VQcs+B4D
 wisftXoXEsYRTJobfPBj457b83div0sPNH8uYYshubEtnuXMStQTptIf1LqcSdU1njWFlji/EcU
 Y4IdQOYIvCg5ldxZGO1GsXNWNGWuyPtuUb/7r/fNPkjOTbhpyCHw9T69OrHKPQUcJc5NIDjngdR
 nLbq/BUfzjNyvQnOFiCM0nZxi7daZyyDcXqLrduHVPw0wFo+qSio5QRAySVXZC2Zhjhe+Db8VVP
 P8AhSEIuZ6NxNTAyhwb/ai31hZoR/lWEUqPTVrjtjXtAm2eNu3xFBLIAuorcDwZJbdIPkMeabOj
 xz3YlHtk+CFSsLenE9y9SGTovl4IwS+xEgfyw94JCyl0TZ6j1qm6AbHm1kw9mxQab2CYXIlaH1y
 nJiPeuc+QKPZlDpvBND6UkMZ3dmrqs5OKq97Iv5BhClyt9xZWnksd45+VAQPr0fUiHDREz/b
X-Proofpoint-GUID: ndAc7ZNun4lqAjJ5xjPAxwgkMATtuxx7
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=687616e8 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=qgJfyGv91k1fQCYRv54A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ndAc7ZNun4lqAjJ5xjPAxwgkMATtuxx7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=573 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150079

The fastrpc driver has support for 5 types of remoteprocs. There are
some products which support GDSP remoteprocs. GDSP is General Purpose
DSP where tasks can be offloaded. Add fastrpc nodes and task offload
support for GDSP. Also strict domain IDs for domain.
Patch [v8]: https://lore.kernel.org/linux-arm-msm/20250714054133.3769967-1-quic_lxu5@quicinc.com/

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
  misc: fastrpc: Cleanup the domain names
  misc: fastrpc: Remove kernel-side domain checks from capability ioctl
  misc: fastrpc: add support for gdsp remoteproc

 .../bindings/misc/qcom,fastrpc.yaml           |  2 +
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 57 +++++++++++++++++++
 drivers/misc/fastrpc.c                        | 54 ++++++++----------
 include/uapi/misc/fastrpc.h                   |  2 +-
 4 files changed, 85 insertions(+), 30 deletions(-)

-- 
2.34.1


