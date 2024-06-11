Return-Path: <linux-arm-msm+bounces-22305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A8D903BFD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 14:34:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3627E281F91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 12:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660C6176FC6;
	Tue, 11 Jun 2024 12:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NPBCWEVl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74E8176223;
	Tue, 11 Jun 2024 12:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718109255; cv=none; b=EWDJFG2Z5mJwI5ZlmG2YpcjGxA1FVJgDmhJgwxjDVRD4ZwL0LhluWpQCxacPnz8Sg4wfCpaqZVKcIjJvie44oApjSrngg0rtj07PNSu7S4J7KvxS6jYp17MXs0WQdTztXLBulgd1VtUNoCb4jnyfHG4rRLoSf+gxCYksHdnsoEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718109255; c=relaxed/simple;
	bh=2X6sgAVaM6K9KD9K+U22vV+9fOseg6Wi79FUfjt5tbU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OqcIIUJEZJvLHIV9WKLD8oJSMpisAb8sAZAjLtrKtaUsbrl0+PBNLTvLiIp3Q93xyIiieEzb6L+DsNVooJ1qADpbOl9oPLPVjOKr0ftFxMxzq1Jl6uwKCVXMYCMAhY48RX6upwL2QR/lrbabmqIXtHwIdneZ8Ksvn0b9QbWozTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NPBCWEVl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B9gabo018706;
	Tue, 11 Jun 2024 12:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v4FmfgaGVVFrlhAqtmBA2D
	XcvLCviVKZSAPxmccyeIQ=; b=NPBCWEVlJVxV552gmRzn1Vya6k8XHRkNJx9mjI
	YoXjCHHuEULFxKrpQw1Vc2AZSPZlZ5cEBABhZ1CzjP0UD/SoeCujSHi/XXDW2Uuz
	vK/jeITEjPkq/nrkGHkCPyE/o812CKeOCo2gFLYaUF7MBYCh5z33UH5EUdZ50cF3
	LlR9iHljHiO7St8tXGyseGMjYb2NyvhRtQNWfNDqYz1No5XD5GLsosys8U8dFBtx
	oyz5idryhBFqC2x2NZKv0G6Lqud1W5NWc3dRFvpY6nuxYdItLx138TrBfgUc76Dg
	9ff70YZmFu0O3dZyf9XKS58T99BqU1XMUZfOm8Ny83m/chkw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypm6b8dbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 12:34:09 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45BCY8XB004633
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 12:34:08 GMT
Received: from hu-sudeepgo-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Jun 2024 05:34:05 -0700
From: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
To: <quic_bjorande@quicinc.com>, <andersson@kernel.org>,
        <quic_clew@quicinc.com>, <mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <quic_deesin@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
Subject: [PATCH V2 0/2] Add tracepoint support and remote name mapping to smp2p
Date: Tue, 11 Jun 2024 18:03:49 +0530
Message-ID: <20240611123351.3813190-1-quic_sudeepgo@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UT4s6Qsx33_ywbSSuXsNZflSmhjSIZCv
X-Proofpoint-GUID: UT4s6Qsx33_ywbSSuXsNZflSmhjSIZCv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_07,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 mlxlogscore=846 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110093

This commit introduces tracepoint support to smp2p module, enabling logging of communication
events between local and remote processors. The tracepoints capture essential details
such as remote processor ID, subsystem names, negotiation specifics, supported features,
bit changes, and subsystem restart (SSR) activity.
These tracepoints enhance debugging capabilities for inter-subsystem issues.

Addressing feedback from v1 to map remote PID (Process ID) along with the remote name
in tracepoints added new patch in V2 1/2, adding support to include the remote name
in the smp2p irq devname which fetches remote name from respective smp2p dtsi node,
which also makes the wakeup source distinguishable in irq wakeup prints.

Changes in v2:
- Added support to include the remote name in the smp2p IRQ devname, allowing for remote PID-name mapping
- Mapped the remote PID (Process ID) along with the remote name in tracepoints, as suggested by Chris
- Modified to capture all `out->features` instead of just the `ssr_ack`, following Chris's recommendation
- Expanded the commit description to provide additional context
- Link to v1: https://lore.kernel.org/all/20240429075528.1723133-1-quic_sudeepgo@quicinc.com

Sudeepgoud Patil (2):
  soc: qcom: smp2p: Add remote name into smp2p irq devname
  soc: qcom: smp2p: Introduce tracepoint support

 drivers/soc/qcom/Makefile      |   1 +
 drivers/soc/qcom/smp2p.c       |  26 +++++++-
 drivers/soc/qcom/trace-smp2p.h | 116 +++++++++++++++++++++++++++++++++
 3 files changed, 142 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/qcom/trace-smp2p.h

-- 


