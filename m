Return-Path: <linux-arm-msm+bounces-46687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B3EA25152
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 03:45:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C4B31883D0F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 02:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0768778F49;
	Mon,  3 Feb 2025 02:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GGMTDLbE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB0628E0F;
	Mon,  3 Feb 2025 02:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738550683; cv=none; b=AcAKr98M0ZmH7Bkv5nc8qBEpiWF3nOX7z/0/jLCaZzhMJ3XiQGpR28kjZEKDqAL5Jk6zAextgF8wkneQTC3xsKMm8uJqQo9T9Kk72C96F0g9F2QC8BIO/T7tWGoH6A2Rt57bnXYs05GWHUmbX93a4hzIVw+2ZQEefrOLRTmZNYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738550683; c=relaxed/simple;
	bh=3KdEjtOzh+lLUqLNfDFbydmxQRR/Fl5o39s+waEHouE=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Z9Kfzto1lmMqXvNU7T7MC3cEoQDH3otbe0OKJi9anjvG/9gweBYR9rwOBGeH0LFyenkGIn38kMZOSV4lmXuEienIW1LwWZT0mE73GKK+57fG501v4ye5UoXzShlJoYUWTHqWCOLnBNX3HaMj5a/aN6v7xsfzh8LLFNdKuMr6Ack=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GGMTDLbE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 512Muh1M002400;
	Mon, 3 Feb 2025 02:44:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1h1FB6CRuoAiUEGLsv0Qye
	bIyyCG8GPjdBJJBhB2S98=; b=GGMTDLbER2frWuPX0nW+00PcPWOxLiO4qOjbj4
	sYjugr5P98ziH8BI6ifvUgTNvM4yIwnkxj8a0DFWFZLwbnqPe0O9uTlY8DzziYFy
	nxI6XU4BDypLxenvhX4uWjrAfmMi9uJFg8Jr/mPFBlz+OSCqtubypZoIV3q8gU1E
	zdPEi0jQCodO0q2geFje8mmAJ5dbP9r7uvFQJuKOxS1DF11jzX+KL81dWdzGND53
	nC0NfjL6AovY3bCBTN1dOtsqN8PM0DJirCLdxlqKv1uz0GtBDXyLf8QOB+0QDU17
	/0youapJCKAAzKwmmg1mgINkYJrLbwNFW+Eor7K0EneddG0Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jd428fxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 02:44:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5132iMdD020266
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Feb 2025 02:44:22 GMT
Received: from hu-azarrabi-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 2 Feb 2025 18:44:21 -0800
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Subject: [PATCH v2 0/8] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
Date: Sun, 2 Feb 2025 18:43:28 -0800
Message-ID: <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-0-297eacd0d34f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFAtoGcC/5WNQQ6CMBBFr0Jm7Zi2QE1ceQ/CQusAY0IrnYIaw
 t2t3MDN5L+f/HkrCEUmgXOxQqSFhYPPYA4FuOHqe0K+ZwajTKXzwcmFERMRzsK+35MIvjgNYU4
 40ojh9sDSGmdtWananCD/ekbq+L17mjbzwJJC/OzaRf/afw2LRoVdrQx1SpPS9jLN7Ni7Y55Du
 23bF+WDbRTcAAAA
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
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pcHqi7qESdTQ91i6oOc-GO4E-G45WtHE
X-Proofpoint-ORIG-GUID: pcHqi7qESdTQ91i6oOc-GO4E-G45WtHE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-02_11,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030021

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

You can run basic tests with following steps:
git clone https://github.com/quic/quic-teec.git
cd quic-teec
mkdir build
cmake .. -DCMAKE_TOOLCHAIN_FILE=CMakeToolchain.txt -DBUILD_UNITTEST=ON

https://github.com/quic/quic-teec/blob/main/README.md lists dependancies
needed to build the above.

This series has been tested for basic QTEE object invocations and
callback requests, including loading a TA and requesting services form
the TA.

[1] https://www.kernel.org/doc/Documentation/tee.txt

Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
---
Changes in v2:
- Clean up commit messages and comments.
- Use better names such as ubuf instead of membuf or QCOMTEE prefix
  instead of QCOM_TEE, or names that are more consistent with other
  TEE-backend drivers such as qcomtee_context_data instead of
  qcom_tee_context.
- Drop the DTS patch and instantiate the device from the scm driver.
- Use a single structure for all driver's internal states.
- Drop srcu primitives and use the existing mutex for synchronization
  between the supplicant and QTEE.
- Directly use tee_context to track the lifetime of qcomtee_context_data.
- Add close_context() to be called when the user closes the tee_context.
- Link to v1: https://lore.kernel.org/r/20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com

Changes in v1:
- It is a complete rewrite to utilize the TEE subsystem.
- Link to RFC: https://lore.kernel.org/all/20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com

---
Amirreza Zarrabi (8):
      tee: allow a driver to allocate a tee_device without a pool
      tee: add close_context to TEE driver operation
      tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
      tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
      firmware: qcom: scm: add support for object invocation
      tee: add Qualcomm TEE driver
      qcomtee: add primordial object
      Documentation: tee: Add Qualcomm TEE driver

 Documentation/tee/index.rst            |   1 +
 Documentation/tee/qtee.rst             | 150 ++++++
 drivers/firmware/qcom/qcom_scm.c       | 128 ++++++
 drivers/firmware/qcom/qcom_scm.h       |   7 +
 drivers/tee/Kconfig                    |   1 +
 drivers/tee/Makefile                   |   1 +
 drivers/tee/qcomtee/Kconfig            |  10 +
 drivers/tee/qcomtee/Makefile           |  10 +
 drivers/tee/qcomtee/async.c            | 160 +++++++
 drivers/tee/qcomtee/call.c             | 741 ++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/core.c             | 810 +++++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/primordial_obj.c   |  65 +++
 drivers/tee/qcomtee/qcom_scm.c         |  36 ++
 drivers/tee/qcomtee/qcomtee_msg.h      | 234 ++++++++++
 drivers/tee/qcomtee/qcomtee_private.h  | 226 +++++++++
 drivers/tee/qcomtee/release.c          |  59 +++
 drivers/tee/qcomtee/shm.c              | 102 +++++
 drivers/tee/qcomtee/user_obj.c         | 712 +++++++++++++++++++++++++++++
 drivers/tee/tee_core.c                 | 121 ++++-
 drivers/tee/tee_private.h              |   6 -
 include/linux/firmware/qcom/qcom_scm.h |  27 ++
 include/linux/firmware/qcom/qcom_tee.h | 286 ++++++++++++
 include/linux/tee_core.h               |  15 +-
 include/linux/tee_drv.h                |  18 +
 include/uapi/linux/tee.h               |  54 ++-
 25 files changed, 3964 insertions(+), 16 deletions(-)
---
base-commit: dab2734f8e9ecba609d66d1dd087a392a7774c04
change-id: 20241202-qcom-tee-using-tee-ss-without-mem-obj-362c66340527

Best regards,
-- 
Amirreza Zarrabi <quic_azarrabi@quicinc.com>


