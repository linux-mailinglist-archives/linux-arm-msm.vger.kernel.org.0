Return-Path: <linux-arm-msm+bounces-26366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6ED932F3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 19:39:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBFAD1F24B7C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 17:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B698F1A00ED;
	Tue, 16 Jul 2024 17:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oyzjwryS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FD219DF87;
	Tue, 16 Jul 2024 17:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721151553; cv=none; b=m2D+orIehZckphwzDx0glUSZHfRby8zrfFCt8bG35eLJjy+ZPmVW+UbKncK2t0fZjlnNtsdiT8hNdpGDZF5+IRFuNyHwEEWX9ghQ9lOMTLqv+VlloD2wz3x/B5aN683b4YfaU/Tw2+qqgv/XDdIQNwdHmAzK+PEMQOJUPc9qvx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721151553; c=relaxed/simple;
	bh=ptPQoviYeuoCyCRh9sk/706l0W2UIM27QYoqdrL2+HE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cLG7JmXA+ZNtBGYD2r8oCA8idlek0H09JnhVuTdF53mLSmdflLBzdYR75gu1/3Cq96CEgYJcBU2myKOgufVdceKOip3DCxeSnGjW/YSuZlXP0PkZ39+b8U5ABgLlXBpnk9iwBL6wUPeMkpZDSxxsqNdX5kDs/6/sCY7p/4L1HqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oyzjwryS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46GCKn03000353;
	Tue, 16 Jul 2024 17:39:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Anm5nKUQ0gI7WICNuposJM
	v3TpHOMnZfitjMqtucSlo=; b=oyzjwrySAJzaikxwQd0Pcu7LUt8rLjPU2mbbuH
	X5od97YzOOvhrpRJb4QHRRDbIJz2OlIHE1FD30GLhX92Js9/7bOXRPh9log7Ol3d
	3IGnRmjcL7XGvIx+yQ+YjTyh1uuPmRwC892ngbo4KSRl78zwbhzD/N73SAU3p0je
	QJYI//KdEXs7SzX3equA6N+2WWOavPGA/Im7jOxPj2s6z7VHmDF0pNFIWevc/gD7
	XYaiYPFDreLKR9sCZ31zeZfKrgVFyf5knooVwcLl2Ga5+dTLrb58oCcEId9TKqyV
	u41OaGaErr6Lu1/93hF+x6+GiNQ6ZixCbXhNUc+sfNYEuU6Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40bhnuqrnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 17:39:01 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46GHd04H031450
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 17:39:00 GMT
Received: from hu-vishsant-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 16 Jul 2024 10:38:57 -0700
From: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
To: <quic_bjorande@quicinc.com>, <andersson@kernel.org>,
        <quic_clew@quicinc.com>, <mathieu.poirier@linaro.org>,
        <quic_deesin@quicinc.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <quic_sudeepgo@quicinc.com>
Subject: [PATCH v4 0/2] Use of devname for interrupt descriptions and tracepoint support for smp2p
Date: Tue, 16 Jul 2024 23:08:32 +0530
Message-ID: <20240716173835.997259-1-quic_sudeepgo@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: b4BOu9eggdrvpOC_TJ8DgM4huy19Dz3Q
X-Proofpoint-GUID: b4BOu9eggdrvpOC_TJ8DgM4huy19Dz3Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_19,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407160128

This commit enhances the smp2p driver by adding support for using the device
name in interrupt descriptions and introducing tracepoint functionality.
These improvements facilitate more effective debugging of smp2p-related issues.

The devname patch, along with the callback to print the irq chip name as the
device name and the removal of the ‘smp2p’ string from the irq request,
results in a unique interrupt description.

Tracepoint functionality captures essential details such as subsystem name,
negotiation specifics, supported features, bit changes, and subsystem restart
activity. These enhancements significantly improve debugging capabilities
for inter-subsystem issues.

Changes in v4:
- Add sign-off for "Use devname for interrupt descriptions" patch
- Update commit message in imperative mood for tracepoint patch
- Remove second argument of __assign_str() as per the commit 2c92ca8 ("tracing/treewide: Remove second parameter of __assign_str()") 
- Link to v3: https://lore.kernel.org/all/20240627104831.4176799-1-quic_sudeepgo@quicinc.com 

Changes in v3:
- Update patch to use devname for interrupt descriptions with a different approach
- Modify tracepoint patch by removing remote_pid field from all tracepoints
- Use SMP2P_FEATURE_SSR_ACK definition from smp2p.c instead of redefiniton
- Link to v2: https://lore.kernel.org/all/20240611123351.3813190-1-quic_sudeepgo@quicinc.com

Changes in v2:
- Add support to include the remote name in the smp2p IRQ devname, allowing for remote PID-name mapping
- Map the remote PID (Process ID) along with the remote name in tracepoints, as suggested by Chris
- Modify to capture all `out->features` instead of just the `ssr_ack`, following Chris's recommendation
- Expand the commit description to provide additional context
- Link to v1: https://lore.kernel.org/all/20240429075528.1723133-1-quic_sudeepgo@quicinc.com

Chris Lew (1):
  soc: qcom: smp2p: Use devname for interrupt descriptions

Sudeepgoud Patil (1):
  soc: qcom: smp2p: Introduce tracepoint support

 drivers/soc/qcom/Makefile      |  1 +
 drivers/soc/qcom/smp2p.c       | 20 ++++++-
 drivers/soc/qcom/trace-smp2p.h | 98 ++++++++++++++++++++++++++++++++++
 3 files changed, 118 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/qcom/trace-smp2p.h


base-commit: d67978318827d06f1c0fa4c31343a279e9df6fde
-- 

