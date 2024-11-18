Return-Path: <linux-arm-msm+bounces-38191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ACC9D0B1C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 09:42:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2281C1F2219F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 08:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA0D1922F9;
	Mon, 18 Nov 2024 08:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YmmbyvQT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EF2158DAC;
	Mon, 18 Nov 2024 08:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731919279; cv=none; b=l5gw8ZiS0u/BsVKnzk122FffBpRwCAAO0nm16K6STKvaN7kvc307nZ2tGCbw95HwB3PDKRKSKrsoIJAvv9TiLuHZnheRUH2HJbNOV/qs7yvPBVUGa3dt/Tqkm8dUstnPniuYv3Cg3baGOfTzK39yInvt2hYwAOrx4EbYYmzXldw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731919279; c=relaxed/simple;
	bh=sx3fK/qBKEtjeLYINEtHCWONg70OjqjT5CjXRLOx/Gc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WPQf2kGkLP2hPn+/K/29UMsgTeu+4y7N6X1iuwa3ioXH9yIh/kkYZCRsh976HxQC2QtIn30O8oRtxCliarr7ie5X1SDVlA90YloEVQxQ7n0ZQnQHTpOhImHIshd7afhmS4yMxfN21QGaDC8fAIYgSMtNa6rGQDUkGepZEJu/Hpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YmmbyvQT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI5SFmi020604;
	Mon, 18 Nov 2024 08:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=D/ecP6hf5e7oCT4ilNkdMX
	VyoZZdR+8QDoAbAQq9LPI=; b=YmmbyvQTNrcuj5UBT/24cwt+GWgA9Hcxq9j8CL
	8LYlXqWJfurKzbo2bLKnwZYHIkZ4UVkNHlsq4NG1qJoppF8rxpz6Myl1/08hyARD
	4Qij6UqYmEVpPbC/LW6bTe75cc7r5q6BOnTVTsKS3sqkI22cAQOzlRsT6chnBZyQ
	JakToNqb5vMLKpmfylxfjrH4AAoxGzTI/qYXFPWCaOQkQrQ8wxmcLnHphmGGs08Z
	yvHA5LtLOAwaA/1BYCtvkDYXZKw1+TBZZwsakvJcwUBLRysTrVfQhgVORNMTLvOl
	9/mowZuTyZpGmX9pVgwBPpik7juyjv7Xx16iMXELJrq2+J8g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xkqs3yy3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 08:41:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AI8evcZ022160
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 08:40:57 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 18 Nov 2024 00:40:54 -0800
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v1 0/4] Add debugfs support for fastrpc driver
Date: Mon, 18 Nov 2024 14:10:42 +0530
Message-ID: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
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
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dN2USy7Hd5NGGEyZDHp-TpsOEyhgnzVw
X-Proofpoint-GUID: dN2USy7Hd5NGGEyZDHp-TpsOEyhgnzVw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=895
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411180071

Following changes are getting added as part of this patch series:
  - Move fastrpc driver to /misc/driver/ to enable maintainance of new
    files to support additional features.
  - Move macro and structure definitions to a new header file. These
    date are consumed by features to be added in new files.
  - Add support for debugfs for fastrpc driver. Most of the fastrpc
    user and channel context information are getting capture as part of
    patch.

Ekansh Gupta (4):
  misc: fastrpc: Move fastrpc driver to misc/fastrpc/
  misc: fastrpc: Rename fastrpc.c to fastrpc_main.c
  misc: fastrpc: Introduce fastrpc_shared.h header
  misc: fastrpc: Add debugfs support for fastrpc

 MAINTAINERS                                   |   2 +-
 drivers/misc/Kconfig                          |  13 +-
 drivers/misc/Makefile                         |   2 +-
 drivers/misc/fastrpc/Kconfig                  |  16 ++
 drivers/misc/fastrpc/Makefile                 |   4 +
 drivers/misc/fastrpc/fastrpc_debug.c          | 156 ++++++++++++++++++
 drivers/misc/fastrpc/fastrpc_debug.h          |  31 ++++
 .../{fastrpc.c => fastrpc/fastrpc_main.c}     | 154 ++---------------
 drivers/misc/fastrpc/fastrpc_shared.h         | 155 +++++++++++++++++
 9 files changed, 382 insertions(+), 151 deletions(-)
 create mode 100644 drivers/misc/fastrpc/Kconfig
 create mode 100644 drivers/misc/fastrpc/Makefile
 create mode 100644 drivers/misc/fastrpc/fastrpc_debug.c
 create mode 100644 drivers/misc/fastrpc/fastrpc_debug.h
 rename drivers/misc/{fastrpc.c => fastrpc/fastrpc_main.c} (94%)
 create mode 100644 drivers/misc/fastrpc/fastrpc_shared.h

-- 
2.34.1


