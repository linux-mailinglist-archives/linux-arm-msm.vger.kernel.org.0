Return-Path: <linux-arm-msm+bounces-40000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6689E1248
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 05:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64921163E37
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 04:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEEEE188A0E;
	Tue,  3 Dec 2024 04:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LWiN0Pp0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1A6156C7B;
	Tue,  3 Dec 2024 04:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733199626; cv=none; b=ID7tRqRgwsXRa5nCXD47l6WWxq0cb9c7iBZbA6+4hauUPLMVN189q7fN8noACY0zIW6zHUXd4DxcWI1MOWvGgAyBS2/iq/ofrZF742AtN+OJvObp+SsfzxwdsaDCABMbcUHo3KIJ72iMbUbfkS0olciQbAjH8v1wCAjHyAO1eBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733199626; c=relaxed/simple;
	bh=FwrlA6HAL3zirBvGit1o+MRHwId1dF2xUMVaNcA/GLI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=AG15ZJOnVhtfhVxMsgd4Zm1MPZzMe8Jj1kOtKeM4jOKhCcmJid5S5dquPTv3jsw1sqbwO0ph3NSZBZbeOvLaJfZ8jMJMUAhI80VWgXq2BwSGRnJP+vySfaGrMccqGJ5G7UTDxSYXx67SuNSR7T7h+3fpCZ2RDGbuKDagHTYoYrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LWiN0Pp0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2LSPjl026608;
	Tue, 3 Dec 2024 04:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=G38OIG68H/J7MRorQm9kkd
	0RmIMKzVchCat3bVtB6dg=; b=LWiN0Pp0xsE2aFgQy56LCjGZ1tWtfZF96pxTQ+
	uJYmIxN6Uxd2TFlrd6Tulox2VSLXvITdM5QUBUy0eKyZKP7ZqeH0P40KKI1H3PWr
	4B7jNL+oJcUre+2J1q19sXErzGFNakF7Ah7WKWG43A8thJTVn3xrTzTOjBGD8cwI
	rDWLj3RoeQVnhjSOs/U6LAcFb+m6Dm+pYNbeGdDy0zA4Zd9n6Oy9Dz7rZJ1J8kNm
	f5huQnJHto5ehdAl4iRZ72Sh8hDUG6id1ipJfZHt+piQ+4TWly4Tfd2F6JVZYeP5
	nDaIoxwXyJ1n1O9q0uTz1kYxc32jmsiNBnEjlD3GJG6NSFpQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437ufe6p2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 04:20:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B34K5ns004308
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 04:20:05 GMT
Received: from hu-azarrabi-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Dec 2024 20:20:04 -0800
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Subject: [PATCH 00/10] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
Date: Mon, 2 Dec 2024 20:19:16 -0800
Message-ID: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMWGTmcC/x2NQQqDMBBFryKzdkCjptCrFBc2jskUkrSZWAXx7
 gY3j/82/x0glJgEntUBif4sHEORtq7AuClYQp6Lg2pU3xbgz0SPmQhX4WDvJYIbZxfXjJ48xvc
 HO62M1l3fDOoB5eubaOH97rzG87wAgRacnHcAAAA=
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg
	<sumit.garg@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <op-tee@lists.trustedfirmware.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>,
        Amirreza Zarrabi <quic_azarrabi@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nws3N-e5_fsF5AVIk-DPXOeSbjxOk-s0
X-Proofpoint-GUID: nws3N-e5_fsF5AVIk-DPXOeSbjxOk-s0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1011 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030034

This patch series introduces a Trusted Execution Environment (TEE)
driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
and services to run securely. It uses an object-based interface, where
each service is an object with sets of operations. Clients can invoke
these operations on objects, which can generate results, including other
objects. For example, an object can load a TA and return another object
that represents the loaded TA, allowing access to its services.

Kernel and userspace services are also available to QTEE through a
similar approach. QTEE makes callback requests that are converted into
object invocations. These objects can represent services within the
kernel or userspace process.

Note: This patch series focuses on QTEE objects and userspace services.

Linux already provides a TEE subsystem, which is described in [1]. The
tee subsystem provides a generic ioctl interface, TEE_IOC_INVOKE, which
can be used by userspace to talk to a TEE backend driver. We extend the
Linux TEE subsystem to understand object parameters and an ioctl call so
client can invoke objects in QTEE:

  - TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_*
  - TEE_IOC_OBJECT_INVOKE

The existing ioctl calls TEE_IOC_SUPPL_RECV and TEE_IOC_SUPPL_SEND are
used for invoking services in the userspace process by QTEE.

The TEE backend driver uses the QTEE Transport Message to communicate
with QTEE. Interactions through the object INVOKE interface are
translated into QTEE messages. Likewise, object invocations from QTEE
for userspace objects are converted into SEND/RECV ioctl calls to
supplicants.

The details of QTEE Transport Message to communicate with QTEE is
available in [PATCH 10/10] Documentation: tee: Add Qualcomm TEE driver.

This patch series has been tested for basic QTEE object invocations and
callback requests, including loading a TA and requesting services form
the TA. However, the test platform is currently being prepared for
upstream availability and will soon be accessible to the community for
further validation. I will share updates as the platform become
available.

[1] https://www.kernel.org/doc/Documentation/tee.txt

Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
---
Amirreza Zarrabi (10):
      tee: allow a driver to allocate a tee_device without a pool
      tee: add TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF
      tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
      firmware: qcom: scm: add support for object invocation
      qcomtee: implement object invoke support
      qcomtee: add primordial object
      dt-bindings: arm: qcomtee: add QTEE driver devicetree binding for TEE subsystem
      tee: add Qualcomm TEE driver
      arm64: dts: qcom: sm8650: add support for QTEE
      Documentation: tee: Add Qualcomm TEE driver

 .../devicetree/bindings/arm/firmware/qcom,tee.yaml |  34 +
 Documentation/tee/index.rst                        |   1 +
 Documentation/tee/qtee.rst                         | 143 ++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |   4 +
 drivers/firmware/qcom/qcom_scm.c                   |  60 ++
 drivers/firmware/qcom/qcom_scm.h                   |   7 +
 drivers/tee/Kconfig                                |   1 +
 drivers/tee/Makefile                               |   1 +
 drivers/tee/qcomtee/Kconfig                        |  10 +
 drivers/tee/qcomtee/Makefile                       |   9 +
 drivers/tee/qcomtee/async.c                        | 153 ++++
 drivers/tee/qcomtee/call.c                         | 707 ++++++++++++++++
 drivers/tee/qcomtee/core.c                         | 942 +++++++++++++++++++++
 drivers/tee/qcomtee/primordial_obj.c               |  63 ++
 drivers/tee/qcomtee/qcom_scm.c                     |  36 +
 drivers/tee/qcomtee/qcomtee_msg.h                  | 217 +++++
 drivers/tee/qcomtee/qcomtee_private.h              | 218 +++++
 drivers/tee/qcomtee/release.c                      |  66 ++
 drivers/tee/qcomtee/user_obj.c                     | 625 ++++++++++++++
 drivers/tee/tee_core.c                             | 113 ++-
 include/linux/firmware/qcom/qcom_scm.h             |   9 +
 include/linux/firmware/qcom/qcom_tee.h             | 284 +++++++
 include/linux/tee_core.h                           |   4 +
 include/linux/tee_drv.h                            |  12 +
 include/uapi/linux/tee.h                           |  54 +-
 25 files changed, 3765 insertions(+), 8 deletions(-)
---
base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
change-id: 20241202-qcom-tee-using-tee-ss-without-mem-obj-362c66340527

Best regards,
-- 
Amirreza Zarrabi <quic_azarrabi@quicinc.com>


