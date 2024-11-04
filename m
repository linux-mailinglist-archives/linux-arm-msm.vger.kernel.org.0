Return-Path: <linux-arm-msm+bounces-36968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC1A9BBA39
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 17:22:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F081284396
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 16:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66031C6F55;
	Mon,  4 Nov 2024 16:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jaLwVajY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D091C4A35;
	Mon,  4 Nov 2024 16:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730737268; cv=none; b=gKz+ftv4LVRjrwpn+Ip9aQX8OgQGN6T16ML+blBw5FuzTuqff/9LUUW/bpWsiJlaVHM/T/KoP34DNiqxo1u2lb5zzlFN4HDSeIHH/fybpY1xOTD7RfhjMtQRKrEqOMskyVL/Zqiho38WqzD0xs4xB78nYrL9+HcFeTALOt3W12U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730737268; c=relaxed/simple;
	bh=/rY99infGJ+H/netdv98laVs4A6BLj5FBFs4g6iuUvk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tngGPWgNQeF724tAWqepRTZdlcVOTJ2kov7qPsBSgUgxGoy6QpBzn+E1p5klhCF6vsn2G90+F1Tlwx6UxBAj1WyXpCb1Fa0uRjrqS/bpeVFebNTwgfdTPO/IhklX1aPaVn+KQjUc+J2f30WX3UQOLmHxomq6Zdg2oBydeLGCy10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jaLwVajY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4BjmXp005230;
	Mon, 4 Nov 2024 16:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=brcjFgx157OJCFE/xBut+WYGxOLegJLpLCL
	guWkC06w=; b=jaLwVajYsWC2gb0dIbXxvkiImdYeYk0LtAwsRVGEEnie6VqKUVZ
	bRpNR+haqhv5BCGx9fYTshz2ESHRQNfl325gbqJ52aCrt6jY/6Z+2OzZK93Hx4RZ
	kfD6/NhbiRiFj/s+cIumP8MGBoBxyo7t0eDbk87kvKhmRfMcwZFpI2gpPF/or/vF
	l9yih0hZF8Cuxn5osO3eaCCmMt0VzxDZdL4etj1g2va+brMk6ZDHBYs8Xm/inzyN
	tqzsOA/mCMinp0egCDou3vud2UwmxgMQIsIY7/V17a0e3iuMspF3HQBlhHyumtrL
	K82o9GAMkOHA6x3Nwl35ogILgTGDBqSRN7A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd2s4u5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 16:20:59 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4GGdpk005592;
	Mon, 4 Nov 2024 16:20:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 42nd5mtstf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 16:20:58 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4A4GKwng011000;
	Mon, 4 Nov 2024 16:20:58 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-uchalich-lv.qualcomm.com [10.81.89.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 4A4GKwKV010999
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 16:20:58 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4184210)
	id E6998641; Mon,  4 Nov 2024 08:20:57 -0800 (PST)
From: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Unnathi Chalicheemala <quic_uchalich@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com
Subject: [PATCH v3 0/2] SCM: Support latest version of waitq-aware firmware
Date: Mon,  4 Nov 2024 08:20:54 -0800
Message-Id: <cover.1730735881.git.quic_uchalich@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PaGmidreEpcr-rov4bYZa3jOQAMezb5Z
X-Proofpoint-GUID: PaGmidreEpcr-rov4bYZa3jOQAMezb5Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1011 suspectscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411040138

This series adds support for the latest improvements made in SCM
firmware that allow for multiple wait-queues in firmware.

To support multi VM synchronization when VMs make SMC calls on same CPU,
waitqueue mechanism is added in firmware which runs at EL2 & EL3 exception
levels.

P.S. While at Qualcomm, Guru Das Srinagesh authored the initial version of
these patches.
Thanks Guru!

---
Changes in v3:
- Use GIC_SPI and GIC_ESPI macros from dt-bindings instead of redefining
- Prettified qcom_scm_fill_irq_fwspec_params()
- Moved waitq initialization before smp_store_release()
- There is no Gunyah hypercall API that can be used to fetch IRQ information hence
introducing new SCM call.
- Link to v2: https://lore.kernel.org/all/cover.1724968351.git.quic_uchalich@quicinc.com/

Changes in v2:
- Dropped "Initialize waitq before setting global __scm" as it was merged here:
https://lore.kernel.org/r/1711034642-22860-4-git-send-email-quic_mojha@quicinc.com
- Decoupled "Remove QCOM_SMC_WAITQ_FLAG_WAKE_ALL" from series
- Converted xarray to a statically sized array
- Initialize waitq array in probe function
- Remove reinit of waitq completion struct in scm_get_completion()
- Introduced new APIs to get no. of waitqueue contexts and waitqueue IRQ no.
directly from firmware.
- Link to v1: https://lore.kernel.org/all/20240228-multi_waitq-v1-0-ccb096419af0@quicinc.com/

Unnathi Chalicheemala (2):
  firmware: qcom_scm: Add API to get waitqueue IRQ info
  firmware: qcom_scm: Support multiple waitq contexts

 drivers/firmware/qcom/qcom_scm.c | 119 ++++++++++++++++++++++++++-----
 drivers/firmware/qcom/qcom_scm.h |   1 +
 2 files changed, 101 insertions(+), 19 deletions(-)

-- 
2.34.1


