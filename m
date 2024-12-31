Return-Path: <linux-arm-msm+bounces-43702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A73D9FECFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 06:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FE7F3A2A5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 05:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560C915B10D;
	Tue, 31 Dec 2024 05:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P0CqNOFD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C12136327;
	Tue, 31 Dec 2024 05:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735624166; cv=none; b=sjptC+88jPXsa168jMEef7cywjdFfEvREeMueKTUH2iLv2egR7qHUxePgDmSWKdXk8Zvsc2MUg2n7Bl/sSdLSE9BrYaBLt8GxveMRnxuPUv4yOMnq2s9vTvOk364h62vFZcMzhTA3Bhl1LThxbtY3D/w9OxZDakztzXcTAD5uJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735624166; c=relaxed/simple;
	bh=Te8pAKjxAluQ109U4rfj9dpse11dM8XNuczYpcL2pic=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mZOHRNzzGJgaab1ujKZeOmIaXDgBdjW9cYxjQaaSvCYv6KhOds05DEs+iLGNMy7EB7wyy+B6eSyMfKwCzrpcpimmGo/3dT3WdztAnbkaDrrN9w6EcRqawzIZXo4VxfnFY4qdOeCGrF61KI/RxMjI//WYtFE7wn3tcTayb0t5IiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P0CqNOFD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BV4qX2v019024;
	Tue, 31 Dec 2024 05:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=52h4Nja+hW8tr8O4ByGebt
	H8xIOLbCUOIQUesRhWA2A=; b=P0CqNOFDP1CX5iwcqnp5F0V96HtMUbvmNZYdCb
	kx7/xSrTMY1WN7BsJfaicHdBrEOV0TaJ7Qi0SdKyP+Glt0PBBaUiNFrnU9/zctMd
	gBGjm/XK10cnkaC4+o87YBauylyH9ZiFeIVBZhB2e15+7+Ps7urE2CZijvw4lwQZ
	oIIuvvZ0/ayU91COroJpSGzupzG3qhq1O21Evz7/GAiQebVIRy2wKn+/bjL1qeDX
	fWt5j8fw2LuHyGvwgJRNiRm2h2H2E5kewDdvAqTzV1lbmJYnEzKDZM8eXLbzuRZI
	7T9rfh+2H1/pxpLNCMkjb1CdXyyJJy8rlpLMo2qTJTkTxvXA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43v9yk83nx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 05:49:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BV5nHPK028765
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 05:49:17 GMT
Received: from hu-srichara-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 30 Dec 2024 21:49:13 -0800
From: Sricharan R <quic_srichara@quicinc.com>
To: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <manivannan.sadhasivam@linaro.org>, <dmitry.baryshkov@linaro.org>,
        <quic_srichara@quicinc.com>
Subject: [PATCH V2 0/2] mailbox: tmel-qmp: Introduce QCOM TMEL QMP mailbox driver
Date: Tue, 31 Dec 2024 11:18:58 +0530
Message-ID: <20241231054900.2144961-1-quic_srichara@quicinc.com>
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
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -fH1fLwOpqeVN_jLjCLC8G1uKds0Yv2q
X-Proofpoint-GUID: -fH1fLwOpqeVN_jLjCLC8G1uKds0Yv2q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1011 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412310047

From: Sricharan Ramabadhran <quic_srichara@quicinc.com>

The QMP mailbox is the primary means of communication between TME-L SS
and other subsystem on the SoC. A dedicated pair of inbound and outbound
mailboxes is implemented for each subsystem/external execution environment
which needs to communicate with TME-L for security services. The inbound
mailboxes are used to send IPC requests to TME-L, which are then processed
by TME-L firmware and accordingly the responses are sent to the requestor
via outbound mailboxes.

It is an IPC transport protocol which is light weight and supports
a subset of API's. It handles link initialization, negotiation,
establishment and communication across client(APPSS/BTSS/AUDIOSS)
and server(TME-L SS).

   -----------------------------------------------       ---------------------------------------------------
  |                                              |       |                                                 |
  |                 SOC  CLIENT                  | SOC   |                TME-L  SS                        |
  |                                              | AHB   |                                                 |
  |     ----------    ---------   ---------      |       | ------    -------     --------    ------------  |
  |     |        |    |       |   |       |      | WO    | |     | R |     |     |      |    |SERVICES   | |
  |     | APPS   |<-->| TMEL  |<->|       |------------->| | IN  |-->|     |     | TMEL |    |--------   | |
  |     |        |    | COM   |   | QMP   |      | RO    | |     | W | QMP |<--->| COM  |<-->| a) ATTEST | |
  |     |        |    |       |   |       |<-------------| | OUT |<--|     |     |      |    | b) CRYPTO | |
  |     |        |    |       |   |       |      |       | |     |   |     |     |      |    | .. more   | |
  |     ---------     ---------   ---------      |       | ------    -------     -------     ------------  |
  |                                              |       |                                                 |
   -----------------------------------------------       --------------------------------------------------

TME-L SS provides different kinds of services like secureboot, remote image authentication,
key management, crypto, OEM provisioning etc. This patch adds support for remote image
authentication. Support for rest of the services can be added.

Remote proc driver subscribes to this mailbox and uses the mbox_send_message to use
TME-L to securely authenticate/teardown the images.

Since clients like same rproc driver use SCM/TMEL across socs, the goal here was to abstract the
TMEL-QMP SS functionality, so that clients should be able to connect and send messages with
a common API.

[v1] RFC Post

[v2]
     Added HW description in the bindings patch.
     Fixed review comments for bindings from Krzysztof and Dmitry
     Changed patch#2 driver to add work for mailbox tx processing    
     Cleaned up patch#2 for some checkpatch warnings.
     There are some checkpatch [CHECK] like below, which looks like false positive.

	CHECK: Macro argument 'm' may be better as '(m)' to avoid precedence issues
	#1072: FILE: include/linux/mailbox/tmelcom-qmp.h:40:
	+#define TMEL_MSG_UID_CREATE(m, a)      ((u32)(((m & 0xff) << 8) | (a & 0xff)))


Sricharan Ramabadhran (2):
  dt-bindings: mailbox: Document qcom,tmel-qmp
  mailbox: tmelite-qmp: Introduce TMEL QMP mailbox driver

 .../bindings/mailbox/qcom,tmelite-qmp.yaml    |  65 ++
 drivers/mailbox/Kconfig                       |   7 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/qcom-tmel-qmp.c               | 969 ++++++++++++++++++
 include/linux/mailbox/tmelcom-qmp.h           | 157 +++
 5 files changed, 1200 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/qcom,tmelite-qmp.yaml
 create mode 100644 drivers/mailbox/qcom-tmel-qmp.c
 create mode 100644 include/linux/mailbox/tmelcom-qmp.h

-- 
2.34.1


