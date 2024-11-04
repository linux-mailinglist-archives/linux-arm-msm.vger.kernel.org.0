Return-Path: <linux-arm-msm+bounces-36972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E12A59BBCBB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 19:01:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79B0C2832C6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 18:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45EAE1C3301;
	Mon,  4 Nov 2024 18:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i53BPegV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B12D18EB1;
	Mon,  4 Nov 2024 18:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730743307; cv=none; b=LsFoNVU3alXPuO/IYpRFTIARiE5y3M1eRCa9clTsJ2ra/NdlogftXflcTbQBfRng6zhPGX/JB5DRfy7LpjmkHhGn/7K38BWYo4RRWTTfYfYE+Pbit3tGOcPFfPaNt/42doBp0XfUFIqwlB2njaBOOhGxbM7eEOI4co0/7UKpoYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730743307; c=relaxed/simple;
	bh=5K7mGOZxEWaFSFmUonhcPFVfaFlUPCS3X8e1iNKThPE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P1oG2JOV2Xe5bcSAgwjl97cEeEkkkDPcP9kdDWI42CQGsLu572+AlqaXV20a3cqbCQYwNg/95n60tmUv4IIhpUOSnokTGZVV4Ja/eyMTTUvwE0by7EFXXzJgmIFSsY15E+670gYUiYNzWDPubbgzY8NvwiJUSOAvpQIP5vzKbco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i53BPegV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4BjYuB026440;
	Mon, 4 Nov 2024 18:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gm3MUyV6fkc8pcvTTZH6isy6lqi+4/DY/ud
	icJQQZ+U=; b=i53BPegVjs78ZOu9Nhuv//FtCATn/QlXOzHNU8y+1kPLZhDNL77
	5n0gUody93K9wDDdE+sH/dojLVSkNLuHWBIVfsAwrq1Pz0x1JzxG3w4MgHO13j8M
	Dz/qSSAxzgc23JBWW4bnZ0IIWzReKizbkcPzfXtCmfi72XoAy2R07I6E5ik5APDZ
	wC8/HK4qRhsVWvnolX6HFd+hoD/1p+AY93IVKyGbREU0TUecVE9lKceeiOaCq7fP
	HB8sJdP+xjdGaPZ+vCo0fZGhVi1kwPfdTgcHWx5cflnWslw5AnhVOCpt/aEtAg+X
	QsXuXrKcTj/XB/la/3sG3gpT9AXhTAmhG0w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd1fn460-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 18:01:41 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4I1ed6014655;
	Mon, 4 Nov 2024 18:01:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 42nd5m3gge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 18:01:40 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4A4I1eYR014648;
	Mon, 4 Nov 2024 18:01:40 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-uchalich-lv.qualcomm.com [10.81.89.1])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 4A4I1eWq014647
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 18:01:40 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4184210)
	id E3F95641; Mon,  4 Nov 2024 10:01:39 -0800 (PST)
From: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Unnathi Chalicheemala <quic_uchalich@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com
Subject: [PATCH v4 0/2] SCM: Support latest version of waitq-aware firmware
Date: Mon,  4 Nov 2024 10:01:36 -0800
Message-Id: <cover.1730742637.git.quic_uchalich@quicinc.com>
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
X-Proofpoint-GUID: fsWeqQkeRxxZMV6fFYy0iuvS5fyM1_uB
X-Proofpoint-ORIG-GUID: fsWeqQkeRxxZMV6fFYy0iuvS5fyM1_uB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=940 spamscore=0 phishscore=0
 malwarescore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040149

This series adds support for the latest improvements made in SCM
firmware that allow for multiple wait-queues in firmware.

To support multi VM synchronization when VMs make SMC calls on same CPU,
waitqueue mechanism is added in firmware which runs at EL2 & EL3 exception
levels.

P.S. While at Qualcomm, Guru Das Srinagesh authored the initial version of
these patches.
Thanks Guru!

---
Changes in v4:
- Moving back to redefining GIC_IRQ_TYPE_SPI and GIC_IRQ_TYPE_ESPI macros
in qcom_scm as seeing compilation issues in linux/irq.h when including
arm-gic header. Will send a fixes patch and move to dt-bindings in next patchset. 
- Fixed a few compilation errors.
- Link to v3: https://lore.kernel.org/all/cover.1730735881.git.quic_uchalich@quicinc.com/

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

 drivers/firmware/qcom/qcom_scm.c | 122 ++++++++++++++++++++++++++-----
 drivers/firmware/qcom/qcom_scm.h |   1 +
 2 files changed, 104 insertions(+), 19 deletions(-)

-- 
2.34.1


