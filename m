Return-Path: <linux-arm-msm+bounces-14881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F049887262
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 18:59:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8282B243BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 17:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E0360EC8;
	Fri, 22 Mar 2024 17:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C1BJYibu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF9B612F2
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 17:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711130291; cv=none; b=Ac5T7ms9GcneWtKaU6j0SZN9w8QlDMHA7bPqbmDsy/xu4ZQdjlLjJd7coYYohwfietJCYvWZZKzatE+qVMXyA5OyzRwsVXCsS/rriI6h+tbkf7Qnxao+aTdyp7Y8S62DYLCSR2qoxZf0+XPnygT7BSEFSwyW57CJy5clvvFvqGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711130291; c=relaxed/simple;
	bh=OuMt0znDI07GjFRFcifJLgKh5gYcRxiw7lOySUF9bcU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K30wVEZpd6QQvT3Ak9Cu1WX4MiK3O1dXzSkv57yDa/Ftqh36MCaKt04pirzgKmviKBEflMu0oW1sNJ9Ter99SCxLUd/pVRR6DKxNCN+YszNNJ/othSOTldiMKHJtIk48Tx/P+5bb2eP+O+jjZWu/OY3pURPq2VaRtSavtilK1WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C1BJYibu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42MDuPjN018369;
	Fri, 22 Mar 2024 17:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=UwVByEh
	BAXgyyJJ9ZwdRXIQAGviL8lWg+XhXFsFdASU=; b=C1BJYibuukpmOj4YtuCfr66
	09Vd7pmm91GzcQ9DALCCPiu3sjfdYlrFcR5Stgb3k26n9jFQO+UHlIj3cwE5vx8I
	qHbmQdEY/288v/H3y+dyo3yuVGi83DqwP5AQLF38/6K7FaTlIGWIHJu2qqJiYTf7
	4rVG0G86sGorAMsWSdV97yCsymfnipRlOU0UP+CMBMqU1vBvR7iIJD+glTCY93c9
	3gH9gSN6iVybFQDipcT5v6YcVCliSVAzU68tBTD6hqhqxZXiZ/b6+iAvWkdNH7a/
	bYttkx7nzUGikvebmZAqQ1t0/Y9HHWt8BNqpP6KqL8TiHgCjq9IFJW5pQ3zuizg=
	=
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x1ajartwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Mar 2024 17:57:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42MHvque017307
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Mar 2024 17:57:52 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 22 Mar 2024 10:57:51 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
        <stanislaw.gruszka@linux.intel.com>,
        <jacek.lawrynowicz@linux.intel.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH v2 0/3] accel/qaic: Add debugfs entries
Date: Fri, 22 Mar 2024 11:57:27 -0600
Message-ID: <20240322175730.3855440-1-quic_jhugo@quicinc.com>
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
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XEPMwfmUz9-F_jJr8L6IQPXEJSGmyLY_
X-Proofpoint-GUID: XEPMwfmUz9-F_jJr8L6IQPXEJSGmyLY_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-22_10,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0
 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=722 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403220129

Add 3 debugfs entries that can be useful in debugging a variety of
issues.

bootlog - output the device bootloader log

fifo_size - output the configured dbc fifo size

queued - output how many requests are queued in the dbc fifo

Bootlog is unique to the device, where as fifo_size/queued is per-dbc.

v2:
-Use size_add() for bounds check
-Move locking into reset_bootlog()
-Clamp num dbcs supported to 256 to address a sprintf warning

Jeffrey Hugo (3):
  accel/qaic: Add bootlog debugfs
  accel/qaic: Add fifo size debugfs
  accel/qaic: Add fifo queued debugfs

 drivers/accel/qaic/Makefile       |   2 +
 drivers/accel/qaic/qaic.h         |   9 +
 drivers/accel/qaic/qaic_data.c    |   9 +
 drivers/accel/qaic/qaic_debugfs.c | 338 ++++++++++++++++++++++++++++++
 drivers/accel/qaic/qaic_debugfs.h |  20 ++
 drivers/accel/qaic/qaic_drv.c     |  16 +-
 6 files changed, 393 insertions(+), 1 deletion(-)
 create mode 100644 drivers/accel/qaic/qaic_debugfs.c
 create mode 100644 drivers/accel/qaic/qaic_debugfs.h

-- 
2.34.1


