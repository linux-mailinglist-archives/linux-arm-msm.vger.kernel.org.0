Return-Path: <linux-arm-msm+bounces-40447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 368F89E4F52
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 09:09:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB33E288D98
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 08:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 422DD1CEEB6;
	Thu,  5 Dec 2024 08:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TDhedJ8/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBC019645D;
	Thu,  5 Dec 2024 08:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733386146; cv=none; b=SL0krDqxeZiSX+17ScIB3idMlIMs8y3aLnFgG98zDS1WZv4cm6IwWVhO8e/+IOju5HBduh6MwTuEvPKeDOxvwF2SYTypjXATbIVPGrWV5y8hZ/DIeumtuCdXyvpD2ICdFaO2MUOaPzWlI1N7xewGYoXSO094Zv04SfG3gAah/KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733386146; c=relaxed/simple;
	bh=E2DPPDrozpHY47AxlkFNWZK9SxaiUJUycGszhHpiLPw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uBeg2vbuQHfN7NnyeSZ9peMnLTvZgYl5XIboXcztYM+6B/StQVy2NtjHlSQxoFFjKOpkMmG4Nq48qxxQiAj2N0Yt2OHvcdNlCLdakR86OfIpTDL8m0nZWij0rmBJ1Oq4UMaa/MrV3Lur/jjET9KTMSZ409ur59lCKuhL/Zre0zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TDhedJ8/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4IHiob006044;
	Thu, 5 Dec 2024 08:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ClRyCtM4xsoMOqrIRziruN
	oAjL70NCW2OP4A8oMVBAU=; b=TDhedJ8/ySq/V57stlK6eUhm8Ba6Ita9p6EzZS
	7BMUCjOhIPVZ3ScUxKhfeJlZlqEtoINZ3/g4bavtBuoc2wHmf4FIYZFBEiRYSdqh
	gZCDEJ6AwinEMUWwFQOtToPLAVMoNiZrPbjSkT4qtqQ8QoepEwu2OuL+U0hYlZZ1
	O2a4TAjDG2lNYLXU68x0EKDz7t1U2hptBHbkXDQiMwqQ/mO7YCBrsxn4/xqVRJzb
	lIH/I/EfsB7YRlSoC2nsP+2dAM7adDR6BUqdHAFc5Z37/iaJ1NB+OwOVGoJgA3rx
	rq0oY4/FeQwW/incqgfqbjIN42TX5UrUCVK0IXKPvineLjgA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439w3ept71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 08:08:57 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B588u0r030451
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 08:08:56 GMT
Received: from hu-srichara-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 00:08:53 -0800
From: Sricharan R <quic_srichara@quicinc.com>
To: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_srichara@quicinc.com>
Subject: [PATCH RFC 0/2] mailbox: tmelite-qmp: Introduce QCOM TMEL QMP mailbox driver
Date: Thu, 5 Dec 2024 13:36:31 +0530
Message-ID: <20241205080633.2623142-1-quic_srichara@quicinc.com>
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
X-Proofpoint-GUID: yNg_Z6qigzbVHuiVw-y3WHvBLktjXMYO
X-Proofpoint-ORIG-GUID: yNg_Z6qigzbVHuiVw-y3WHvBLktjXMYO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 bulkscore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412050059

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

The intention of posting this is to get the design reviewed/corrected since there are also
other possible ways of having this SS support like:

a) Make TMEL QMP as a 'rpmsg' driver and clients can connect using rmpsg_send

b) Keep TMEL APIs seperately in drivers/firmware which would export APIs
   and QMP mailbox seperately.
   Clients can then call the exported APIS.

c) Combine both TMEL and QMP as mailbox (this is the approach used here)

Since clients like same rproc driver use SCM/TMEL across socs, the goal here was to abstract the
TMEL-QMP SS functionality, so that clients should be able to connect and send messages with
a common API.

Based on the feedback can explore any other options as well.

Sricharan Ramabadhran (2):
  dt-bindings: mailbox: Document qcom,tmelite-qmp
  mailbox: tmelite-qmp: Introduce TMEL QMP mailbox driver

 .../bindings/mailbox/qcom,tmelite-qmp.yaml    |  70 ++
 drivers/mailbox/Kconfig                       |   7 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/qcom-tmelite-qmp.c            | 949 ++++++++++++++++++
 include/linux/mailbox/tmelcom-qmp.h           | 157 +++
 5 files changed, 1185 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/qcom,tmelite-qmp.yaml
 create mode 100644 drivers/mailbox/qcom-tmelite-qmp.c
 create mode 100644 include/linux/mailbox/tmelcom-qmp.h

-- 
2.34.1


