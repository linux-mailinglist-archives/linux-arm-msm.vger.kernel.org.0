Return-Path: <linux-arm-msm+bounces-24418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DDE91A446
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 12:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 006E6284074
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 10:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D95145341;
	Thu, 27 Jun 2024 10:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U+3UxsUN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EAD13D281;
	Thu, 27 Jun 2024 10:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719485345; cv=none; b=aqa5iufrFl0O2kH7u0bEAWzYvKc1IJeGsJp4QI2Fi1k/vhk0/3e5KedSXX2lpIe4ZZvS/5cnBLTuRLXGJXcdefKzG9f5hATcstQQh7Hil0oIjbDVhc/5bpR67yu+NOPZW73oxi+kioIch3SPdXCC2T5WL9Uvw7KgAlWtHhNupA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719485345; c=relaxed/simple;
	bh=Z5RiEuFD5dZgb7gBpg4wx36c4M95eK7byLmxwTne7Qg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nxxLyXWGjv0CVy0JmEahpEzElxr2pvrpffchsZMdqphIq1Mu+wCx/AoY4P+sF5VZVvjYLVnKTe9zdfc/VomFH6b2NQ6XusOXFsWczD6BCSrFt2Q7t2pUrV9m+75PmffYMY2jYiWImzCf6bO+e4ybvF6mC23vOj1jVpOtiYkZxUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U+3UxsUN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45RAUfwH018909;
	Thu, 27 Jun 2024 10:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GsgZT5Z4g2kvk33R5eXDAg
	V0SK4udKH/IBaEqPmFv/s=; b=U+3UxsUNKw5fC2iv2MM8xFtpDD5gJ4O2Y+keNt
	aa2m45z+gTTGM2Gig+4O+hYC/UES8cJ4n2Szd2i444rK4ZDOeUtzjhXS3cEzcGXg
	I50+anJq0CW9kqqbEOM7uFPFjGtPB179cDUH8darpp5jN0BzWpRhO6pS3f6pjnfn
	2agBY4QRCPAPGtXiwM4zUbOy4OPcTWIbEi1blyIGuBz3B4j+9ircNDjvhSp14r5b
	7bQKI45Jwc7TfMKSrLtHnZSdgvc/5Q8Ev/ww4fKaUMTRQbA7nRAkk0L7tuIW/jLh
	Bt4IQbcahCJEcld2F800QT5UpP261LmXsbQNV3QDOQNgZeuQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400f90kax4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 10:48:56 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45RAms21002016
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 10:48:54 GMT
Received: from hu-sudeepgo-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 27 Jun 2024 03:48:51 -0700
From: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
To: <quic_bjorande@quicinc.com>, <andersson@kernel.org>,
        <quic_clew@quicinc.com>, <mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <quic_deesin@quicinc.com>,
        <quic_sudeepgo@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>
Subject: [PATCH V3 0/2] Use of devname for interrupt descriptions and tracepoint support for smp2p
Date: Thu, 27 Jun 2024 16:18:29 +0530
Message-ID: <20240627104831.4176799-1-quic_sudeepgo@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: P0xvFQMqfF8gFxU2JBBb9tpu3rF0S8zc
X-Proofpoint-GUID: P0xvFQMqfF8gFxU2JBBb9tpu3rF0S8zc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_06,2024-06-27_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406270081

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

Changes in v3:
- Updated patch to use devname for interrupt descriptions with a different approach.
- Modified tracepoint patch by removing remote_pid field from all tracepoints.
- Using SMP2P_FEATURE_SSR_ACK definition from smp2p.c instead of redefiniton. 
- Link to v2: https://lore.kernel.org/all/20240611123351.3813190-1-quic_sudeepgo@quicinc.com

Changes in v2:
- Added support to include the remote name in the smp2p IRQ devname, allowing for remote PID-name mapping
- Mapped the remote PID (Process ID) along with the remote name in tracepoints, as suggested by Chris
- Modified to capture all `out->features` instead of just the `ssr_ack`, following Chris's recommendation
- Expanded the commit description to provide additional context
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

-- 


