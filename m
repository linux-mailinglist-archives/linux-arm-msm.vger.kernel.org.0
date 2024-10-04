Return-Path: <linux-arm-msm+bounces-33151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A753599114C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 23:24:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 276491F23CB8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 21:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B2F1AE002;
	Fri,  4 Oct 2024 21:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I9GFOTkn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841321448C1;
	Fri,  4 Oct 2024 21:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728077062; cv=none; b=DR100NvRXnGDk3Hqnmf8oV7vcv5ij/RKOy6rsHTstqxeRI7lZr6dYvjDObbpcNb4WJEruMbQusAksS1UsYThxL+Y8GLG9ejU0n+x8x4Y1MJhkEOQEWMEwO1Yh51DTyMbZ0CITGMylFoxUL4WzSpcAZZxE4e3j1LNNZKNjmGFVTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728077062; c=relaxed/simple;
	bh=UPMCm5/nObHAr3O0W/7izltX4pJE/zinQhH+qCjfW2s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gXST+FprGsBJRUU6e2Yqac40IV81X3ay9G6Z/8AMlcQ1ctouaApLwSJr2OcIOPtVg48QBcAE7LltL25gCMr2JLpeQsyVLGp49GplkW0pNNyDOlXT/GBjEx9QXba7dFXvO5ARpQpIBL1PnN7F5c/IAThdUpxmb3pJL7dKNy0PAe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I9GFOTkn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494BHOBu029872;
	Fri, 4 Oct 2024 21:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2VIyCbs4MZo06o5b0xKA14
	avwyYYm7KQiJNv/fQaSaw=; b=I9GFOTknZyuMsqbBeY4xxYMdw4gbWts8vOnI74
	pev1YharhkexVj8brT10zU5M0ktQJWBxBQ3sixX/7Fgg9d7RjmrWXPErQX+DlWvu
	AAZYmY6YiO0ogs9KbqmPqo6Sk2TYp1TRUK8znlSGOEb8wLNVKhurNycGr9z7Rbx1
	Uosf3jrASv/d/nr8Vuvn72ZLHHwnZgPsH+Z09PodhNTm5KbTX5jmLcRvrBss1g+1
	9TMO3EvoHxvL/OL9TNQdnuhViy6x1XgrCVSexPvFjom8A08DXN9s0GDzEe7pmMHk
	V/PDSGKHcG2B5kqpoH5AhHpbBXHdA8f4XX+DP8cQqI6x76oA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205nk8yp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 21:24:15 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494LOD8N028159
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 21:24:13 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 4 Oct 2024 14:24:09 -0700
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Mukesh Ojha
	<quic_mojha@quicinc.com>
Subject: [PATCH 0/6] Peripheral Image Loader support for Qualcomm SoCs
Date: Sat, 5 Oct 2024 02:53:53 +0530
Message-ID: <20241004212359.2263502-1-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 77EW0ClZU_1vDkGcOli7ads2nLVa1IT7
X-Proofpoint-ORIG-GUID: 77EW0ClZU_1vDkGcOli7ads2nLVa1IT7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 clxscore=1011 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410040148

Qualcomm is looking to enable remote processors on the SA8775p SoC
running KVM Linux host and is currently trying to figure out an
upstream-compatible solution for the IOMMU translation scheme problem it
is facing when SoCs running with KVM. This issue arises due to
differences in how IOMMU translation is currently handled on SoCs
running Qualcomm EL2 hypervisor(QHEE) where IOMMU translation for any
device is completely owned by it and the other issue is that remote
processors firmware does not contain resource table where these IOMMU
configuration setting will be present.

Qualcomm SoCs running with the QHEE(EL2) have been utilizing the
Peripheral Authentication Service (PAS) from its TrustZone (TZ) firmware
to securely authenticate and reset via a single SMC call
_auth_and_reset_.  This call first gets trapped to QHEE, which then
makes a call to TZ for authentication. Once it is done, the call returns
to QHEE, which sets up the IOMMU translation scheme for these remote
processors and later brings them out of reset. The design of the
Qualcomm EL2 hypervisor dictates that the Linux host OS running at EL1
is not allowed to set up IOMMU translation for remote processors,
and only a single stage is being configured for them.

To make the remote processors’ bring-up (PAS) sequence
hypervisor-independent, the auth_and_reset SMC call is now entirely
handled by TZ. However, the problem of IOMMU handling still remains with
the KVM host, which has no knowledge of the remote processors’ IOMMU
configuration.

We have looked up one approach where SoC remoteproc device tree could
contain resources like iommus for remoteproc carveout and qcom,devmem
specific binding for device memory needed for remoteproc and these
properties are optional and will only be overlaid by the firmware if it
is running with non-QHEE based hypervisor like KVM.

- Patch 1/6 adds the iommus and qcom,devmem binding for PAS common yaml.
- Patch 2/6 and 3/6 add helper function to IOMMU map and unmap carveout
  and device memory region.
- Patch 4/6 adds a function to parse individual field of qcom,devmem property.
- Patch 5/6 add helpers to create/destroy SHM bridge for remoteproc
  carveout and to get memory from tzmem SHM bridge pool for remoteproc
  firmware metadata.
- Patch 6/6 enable all the required support to enable remoteproc for
  non-QHEE hypervisor based systems like KVM host via parsing the iommus
  properties and mapping/unmapping carveout and device memory based on
  it.

Komal Bajaj (1):
  remoteproc: qcom: Add iommu map_unmap helper function

Mukesh Ojha (2):
  remoteproc: qcom: Add support of SHM bridge to enable memory
    protection
  remoteproc: qcom: Enable map/unmap and SHM bridge support

Shiraz Hashim (3):
  dt-bindings: remoteproc: qcom,pas-common: Introduce iommus and
    qcom,devmem property
  remoteproc: qcom: Add helper function to support IOMMU devmem
    translation
  remoteproc: qcom: Add support to parse qcom,devmem property

 .../bindings/remoteproc/qcom,pas-common.yaml  |  42 +++++
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml |  20 +++
 drivers/firmware/qcom/qcom_scm.c              |  29 +++-
 drivers/firmware/qcom/qcom_tzmem.c            |  14 +-
 drivers/remoteproc/qcom_common.c              | 148 ++++++++++++++++++
 drivers/remoteproc/qcom_common.h              |  38 +++++
 drivers/remoteproc/qcom_q6v5_pas.c            | 140 ++++++++++++++++-
 include/linux/firmware/qcom/qcom_scm.h        |   1 +
 include/linux/firmware/qcom/qcom_tzmem.h      |  10 ++
 9 files changed, 423 insertions(+), 19 deletions(-)

-- 
2.34.1


