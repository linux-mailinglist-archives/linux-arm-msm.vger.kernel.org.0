Return-Path: <linux-arm-msm+bounces-52682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3D9A73DDB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 19:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 886693B3028
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 18:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC02218EB3;
	Thu, 27 Mar 2025 18:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VPylJq5T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110B4F4F1;
	Thu, 27 Mar 2025 18:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743099495; cv=none; b=IwFD/nPVLUwycFK+4qdob5j1BDPZ2Bb/5myHCxei2ZLgBBaz/FB/tcKxBted4vtGGwOWEKe5dWsdmnFqjTCT3BrJeE9ziGOFSBFKDZhFvPclnMT9GhMzJKg5k7fKv8yqCvYXoqm8jVYqYuemocl/pa8EAW+hNyuL12OTRY0SdRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743099495; c=relaxed/simple;
	bh=8JxaSWuthSaViqbX0fDFNTw3ryDMiF9+V70gp0o3VSk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bexGXtEFnvbMOc8ILmM6KOWPuzTq1KbupozrixQDftUvgfmDjT91lvSU1FJUokbqJGy5f0nRAPZ2quNf35wRgC76CueUJLz3OLRSSea2wEc0giWfoK5FRcQ5yIbm3yRxbf5LI4W8TZVMB3mOzYoto/JjJBEEcGFpJ7j3FR3an1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VPylJq5T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52REvWfL013783;
	Thu, 27 Mar 2025 18:18:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ba5a6yDtKCMqnVyaSqmH1R
	WgQM/kBX+jQhoqYjWLYrA=; b=VPylJq5T4nG5SeQUmdEOYDI8Bt83GRbxHqS7zN
	BIfDEsmmHMkWcfDLi0+fzLofRIA0vVvMj1wKDpiOIplC2YC49AsEeAsolKtd5ygh
	cp8lGnYFRkpxprSLoh5SLHmUM8kOtlzyYElMIHdiegC/483nwm7cApD4j2DRH/FJ
	9FCJ1t96w/lamWGkvmcZ5GChVqx37sW+fpMkSi9vnUqKB0hUebkqUDhER6QKnKc+
	tUgAfDsVypwUHU29bzavXWhbLjKNJMII0sWMiWcQA+1WvfBKmveIVwTFUt+0jpWC
	SiNnIGj1tX9nZmw/tGbefxOGMNsheXPLMV3db0lxI3BGFynQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mffcmx39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 18:18:08 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52RII7oU001723
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 18:18:07 GMT
Received: from hu-srichara-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 27 Mar 2025 11:18:04 -0700
From: Sricharan R <quic_srichara@quicinc.com>
To: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <manivannan.sadhasivam@linaro.org>, <dmitry.baryshkov@linaro.org>,
        <quic_srichara@quicinc.com>
Subject: [PATCH V4 0/2] mailbox: tmel-qmp: Introduce QCOM TMEL QMP mailbox driver
Date: Thu, 27 Mar 2025 23:47:48 +0530
Message-ID: <20250327181750.3733881-1-quic_srichara@quicinc.com>
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
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CdgI5Krl c=1 sm=1 tr=0 ts=67e59660 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=5MEtDE70NAJr5NbrjzMA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: iOoRtSf4JhTeQ1edWKCRafYxbePItd6H
X-Proofpoint-ORIG-GUID: iOoRtSf4JhTeQ1edWKCRafYxbePItd6H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_03,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270125

From: Sricharan Ramabadhran <quic_srichara@quicinc.com>

The QMP mailbox is the primary means of communication between TMEL
(Trust Management Engine Lite) SS and other subsystem on the SoC.
A dedicated pair of inbound and outbound mailboxes is implemented for
each subsystem/external execution environment which needs to communicate
with TMEL for security services. The inbound mailboxes are used to send
IPC requests to TME-L, which are then processed by TME-L firmware and
accordingly the responses are sent to the requestor via outbound
mailboxes.

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

TME-L SS provides different kinds of services like secureboot,
remote image authentication, key management, crypto, OEM provisioning etc.
This patch adds support for remote image authentication.
Support for rest of the services can be added.

Remote proc driver subscribes to this mailbox and uses the
mbox_send_message to use TME-L to securely authenticate/teardown the
images.

Since clients like same rproc driver use SCM/TMEL across socs, the goal
here was to abstract the TMEL-QMP SS functionality, so that clients should
be able to connect and send messages with a common API.

[V4]

        Fixed TME-L naming in all places and expanded it.
        Folded tmel_work in tmel.
        Added more kernel doc as relevant.
        Removed __packed in all places, as not required.
        Renamed all functions to have tmel_ prefixes.
        Used readl/writel in all places.
	Added Inline for all required functions.
        Removed redundant type conversions.
        Removed redundant 'goto's
        Added __free macro
        Fixed Linux std errno in tmel_sec_boot_auth/teardown
        Added spinlock in qmp_startup
        Used of_mbox_index_xlate and dropped the tmel_qmp_mbox_xlate
        Updated header file to have only mbox consumer required and moved rest to .c file
        Fixed the TMEL_MSG macros to use standard GENMASK
        Moved the irq registration to end of probe

    Following tests were done and no issues.

       *)  Checkpatch
       *)  Codespell
       *)  Sparse
       *)  kerneldoc check
       *)  Kernel lock debugging
       *)  dt_binding_check and dtbs_check

[V3]

        Fixed wrong code/comments wrappings.
        Fixed Kconfig and Makefile entries to right place.
        Removed unused headers inclusion.
        Fixed locking, removed the mutexes and having only tx spinlock.
        Removed the use of global ptr for tmel, made it as device specific.
        Replaced pr_err/pr_debug with dev_err/dev_dbg in all places.
        Fixed usage of dev_err_probe.
        Fixed xlate callback as per comments.
        Used devm equivalents and kcalloc version as per comments.
        Removed all un-nessecary wrapper macros for register access, inlined it
        as per comments.
        Re-organised the function layout as per comments and make it more readable.
        Removed the pictures in headers files as per comments.
        Used Field_prep/get as per comments.
        Fixed Kernel test reported issues.
        Fixed all other comments as well.

    Following tests were done and no issues.

       *)  Checkpatch
       *)  Codespell
       *)  Sparse
       *)  kerneldoc check
       *)  Kernel lock debugging
       *)  dt_binding_check and dtbs_check

[v2]
     Added HW description in the bindings patch.
     Fixed review comments for bindings from Krzysztof and Dmitry
     Changed patch#2 driver to add work for mailbox tx processing
     Cleaned up patch#2 for some checkpatch warnings.
     There are some checkpatch [CHECK] like below, which looks like false positive.

	CHECK: Macro argument 'm' may be better as '(m)' to avoid precedence issues
	#1072: FILE: include/linux/mailbox/tmelcom-qmp.h:40:
	+#define TMEL_MSG_UID_CREATE(m, a)      ((u32)(((m & 0xff) << 8) | (a & 0xff)))

[v1]
      RFC Post

Sricharan Ramabadhran (2):
  dt-bindings: mailbox: Document qcom,ipq5424-tmel
  mailbox: tmelite-qmp: Introduce TMEL QMP mailbox driver

 .../bindings/mailbox/qcom,ipq5424-tmel.yaml   |  60 ++
 drivers/mailbox/Kconfig                       |  10 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/qcom-tmel-qmp.c               | 947 ++++++++++++++++++
 include/linux/mailbox/tmelcom-qmp.h           |  65 ++
 5 files changed, 1084 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/qcom,ipq5424-tmel.yaml
 create mode 100644 drivers/mailbox/qcom-tmel-qmp.c
 create mode 100644 include/linux/mailbox/tmelcom-qmp.h

-- 
2.34.1


