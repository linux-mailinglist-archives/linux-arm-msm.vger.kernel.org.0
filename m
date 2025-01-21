Return-Path: <linux-arm-msm+bounces-45665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A842A17A67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 10:43:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A5631881B56
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 09:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44F01C1735;
	Tue, 21 Jan 2025 09:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CI7XquUR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FA21C07F3;
	Tue, 21 Jan 2025 09:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737452579; cv=none; b=JxVVRa8QRWoW6fYim0aSxP07P01A8gt000KGA35JwaISZFCPe3WzYT6kJTOcX/RDXAIps5Amx7BI4Y/H7KfNxB/ZiAPbzrq5Q3/87p4saFZ8Few+wMvzP4ICK3S+H1u2VNux4Rx1F/QzuQq+zm2UAKjeJt6x3Fs4qoAVZvQzHaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737452579; c=relaxed/simple;
	bh=l4ZQ/VVVzIkGQrfg6+MxqTttbwdYw/nkXBECxcsPA38=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GQomdfp6dRHwYuoMm1VUDyisTI0A0AtEvsVH5C7xpuqw/OuK9rnsVAFWpPmx+LxWA2f12m1oLKeQB/NWhcj0QjVhPAPQJi/qffMlR6V7wNjMyJF00h4Y0WlpAohbV5QYnolFv8znPiMhH0YTcYCWch/8OPGLhehvym0GHhP9pxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CI7XquUR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L8Yl0f013673;
	Tue, 21 Jan 2025 09:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CdNyry426P/yRKRN0ZI7OzNzjFeP8lEV1wy
	BXwHGZ8w=; b=CI7XquUR/pOYoJEcSORrSb6njtF6gtuuR/r/LLBWbZmilrSBTCh
	FO7Y+Z2JRHjDJIeGF3wbXna5qSPQYbyFF0pku/3UDWbOBT3gRQ2FLUCxkBbvjSww
	Np7or8HrKvCYkjdP8Vi5ItyvAHnXrILH4gnyhpDrsMaKVJP8rQT6KlnUTvT75Idz
	Qtk/5XPhG2U3DFPPlC2YhkUEpWAKvk8iCoIqFXMWN8pQNyso7IYLfAvKWiFZVmMk
	2XEoSlryPGEXQpUSmwZJlFyVY6lar4SqUnIU+j12oo3mX00rsrtgdJUN4xsHKox6
	t2Z1+vqT3o8DtAIj7OSPT1vf8Ahnm3JuzZA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44a75e0gt6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 09:42:47 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 50L9gj2f003213;
	Tue, 21 Jan 2025 09:42:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4485ckpnj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 09:42:45 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50L9gjC3003206;
	Tue, 21 Jan 2025 09:42:45 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 50L9gikk003204
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 09:42:45 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id 9DCD740BBC; Tue, 21 Jan 2025 17:42:43 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, p.zabel@pengutronix.de,
        dmitry.baryshkov@linaro.org, abel.vesa@linaro.org,
        quic_qianyu@quicinc.com, neil.armstrong@linaro.org,
        manivannan.sadhasivam@linaro.org, quic_devipriy@quicinc.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: quic_wenbyao@quicinc.com
Subject: [PATCH 0/2] phy: qcom: qmp-pcie: Add PCIe PHY no_csr reset support
Date: Tue, 21 Jan 2025 17:41:38 +0800
Message-Id: <20250121094140.4006801-1-quic_wenbyao@quicinc.com>
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
X-Proofpoint-ORIG-GUID: va46TrQU8P5630v08xyn9jcs9A4atPxE
X-Proofpoint-GUID: va46TrQU8P5630v08xyn9jcs9A4atPxE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_05,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 adultscore=0 mlxscore=0 impostorscore=0 mlxlogscore=874
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210079

The series aims to skip phy register programming and drive PCIe PHY with
register setting programmed in bootloader by simply toggling no_csr reset,
which once togglled, PHY hardware will be reset while PHY registers are
retained.

First, determine whether PHY setting can be skipped by checking
QPHY_START_CTRL register and the existence of nocsr reset. If it is
programmed and no_csr reset is supported, do no_csr reset and skip BCR
reset which will reset entire PHY.

This series also remove has_nocsr_reset flag in qmp_phy_cfg structure and
decide whether the PHY supports nocsr reset by checking the existence of
nocsr reset in device tree.

The series are tested on X1E80100-QCP and HDK8550.

Wenbin Yao (2):
  phy: qcom: pcie: Determine has_nocsr_reset dynamically
  phy: qcom: qmp-pcie: Add PHY register retention support

 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 109 ++++++++++++++---------
 1 file changed, 65 insertions(+), 44 deletions(-)


base-commit: bcf2acd8f64b0a5783deeeb5fd70c6163ec5acd7
-- 
2.34.1


