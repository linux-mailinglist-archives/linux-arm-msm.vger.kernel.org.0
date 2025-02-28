Return-Path: <linux-arm-msm+bounces-49798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA98A4909E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 05:55:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4AB4F7A889C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 04:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA91E1B415A;
	Fri, 28 Feb 2025 04:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Mz9vsIn2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC501ADC8C;
	Fri, 28 Feb 2025 04:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740718471; cv=none; b=kw2yZ4W0eot1VSc/2DbCCkuSymK4eDGdm+KehYx7gWFcTk87f0gpn42c0fAP5zfJB1b6p9Y0IRJ0j9a2OPg4JTf4rnn0clNEMaeo9fC0JBQ3+N7g//KptCSNIVW3EgNxbB2BtQLZ32XmsnbkkRp9M6yoUujo7eDm+yqslTc7/Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740718471; c=relaxed/simple;
	bh=yHSIeOJUETG0EEY7pbf+x/nnCyav8TYXtrP7Y8Cj6m0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mkPnT3eQZtU85v4VccS8+4/N7NJc7OmQvQLnB84tNigWvA3WmbeoOeo26hI1gg1I637x7dhspALr+W5xmGwVX118J2bpBE2b/vm+u4LN+867cLmgJNi+G7qvhxlQ0/xxjfaAXkcASQTimiQLg8evPkV1U9Ann5soUF+WCGR/wfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Mz9vsIn2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RN8pPO000630;
	Fri, 28 Feb 2025 04:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vPGnT+WVbb2puZMHMbw9Tu
	e64f+s3+QUmvR5B1TiTkU=; b=Mz9vsIn2L7m2NyAxxvFWTutn8a6wq/CFf0mAIG
	obgSspTDtfUugGusSFZne9zhSebRiB2vZ1nqqPPI7uonanKjEsfX1ze07Rmk4Y1U
	iDKdbLmDlCcC4KUuXatyN/3WM7Jr/V29GHGwO5ojtCMBAP3L2pHd+tsKUys/Ii5T
	giJb7kcHFiw1tVwiEGgd6zWJeps8Eq7LY4L7/0/iF+HbUkWlGo/zBKP1p1Es6gsD
	FaYj7tomZiyV3x6/xNM4EFzNQqh3ynIwWuU3ql7ESJI6J6Qn+7BkMX28u9c6EW3i
	Psb3d52KCRbwV1MpvHn6NMEljEYYdmCarvmj5OPuUpxke1rQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4522skx46j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 04:54:13 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51S4sBnX026359
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 04:54:11 GMT
Received: from hu-srichara-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 27 Feb 2025 20:54:08 -0800
From: Sricharan R <quic_srichara@quicinc.com>
To: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <manivannan.sadhasivam@linaro.org>, <dmitry.baryshkov@linaro.org>,
        <quic_srichara@quicinc.com>
Subject: [PATCH V3  0/2] mailbox: tmel-qmp: Introduce QCOM TMEL QMP mailbox driver
Date: Fri, 28 Feb 2025 10:23:54 +0530
Message-ID: <20250228045356.3527662-1-quic_srichara@quicinc.com>
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
X-Proofpoint-GUID: cvsKK6V-3GsVY7JZps4NAwwEjuFZySji
X-Proofpoint-ORIG-GUID: cvsKK6V-3GsVY7JZps4NAwwEjuFZySji
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_08,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502280032

From: Sricharan Ramabadhran <quic_srichara@quicinc.com>

The QMP mailbox is the primary means of communication between TME-L SS
and other subsystem on the SoC. A dedicated pair of inbound and outbound
mailboxes is implemented for each subsystem/external execution environment
which needs to communicate with TMEL for security services. The inbound
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

[v3]
     Patch #1
     -------
        Fixed wrappings.
        Made mailbox-cells as a required property and changed value to '1'.
        Fixed to use compatible as filename.
        Renamed compatible as per Krzystof's comments.
        Dropped unused label.


     Patch #2
     --------
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
        Fixed all other comments as well.

    Testing:
    --------
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

[v1] RFC Post

Sricharan Ramabadhran (2):
  dt-bindings: mailbox: Document qcom,tmel-qmp
  mailbox: tmelite-qmp: Introduce TMEL QMP mailbox driver

 .../bindings/mailbox/qcom,ipq5424-tmel.yaml   |  62 ++
 drivers/mailbox/Kconfig                       |  10 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/qcom-tmel-qmp.c               | 836 ++++++++++++++++++
 include/linux/mailbox/tmelcom-qmp.h           | 122 +++
 5 files changed, 1032 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/qcom,ipq5424-tmel.yaml
 create mode 100644 drivers/mailbox/qcom-tmel-qmp.c
 create mode 100644 include/linux/mailbox/tmelcom-qmp.h

-- 
2.34.1


