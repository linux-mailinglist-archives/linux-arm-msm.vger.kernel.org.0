Return-Path: <linux-arm-msm+bounces-51918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E31A688BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 10:52:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C35D717AD2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 09:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1DD25522A;
	Wed, 19 Mar 2025 09:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I0RmNpwr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F058253F12;
	Wed, 19 Mar 2025 09:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742377568; cv=none; b=Hja726Nc5A61abPYN0UvEbLalIz/dhnjafqUhOB2HMNwGjg9EMmGDo2YZRMR2UfzR8LKZ7sRSLspirwv7w6eqKns05qFjwcNRWTXxLQ/mgovV6gNHLMmPUER60Wdsn2zWmRVrpFwNBA2eTYmZyeegv4CmeC2Xtm3AAmZ+KwvQTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742377568; c=relaxed/simple;
	bh=CrT4aCpC+ooRxmqP5nspSJRJYrNf3n0W5Jknw3EEaow=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qakkt64uMrVZZHOwxT0L/F/v5zE5bLnYhAEUgw76N7dNeVlzt8ctUSsxZpcZjpor0hTz+lHzAxHy0Mu7/ESKPQ9LErXdMVO7bSezbxNO9QwRAVZ/xERygCny8H4sStwqtAYz91ahyYLRplYBs0L1/ToEn6IdIUOdonbzjHFv3oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I0RmNpwr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4m0Wt016560;
	Wed, 19 Mar 2025 09:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TEc3yUOpCOi44ra36ZHjdQxhXbtB2IO+K71
	vtg2pfoY=; b=I0RmNpwrKyvkipranbvto7gspCR3taxzk8A1Tq/lX9AYngwaqnO
	yhu7nqmmb6nnR4lF/f/ZvSUWjFgq655IatDLq3m06u1z4Eu233W5CWjQMwQqz6g5
	tW6g6Kl8k4EIbqYFQzsVJ/b3MYS+L3EtM7qXfQeCG+NDsc/uLWN6s26ScuRgftc6
	M4DWThiJVcIdYMwVhV5mRHF7hTeiAkbX8rXUbv9iiHrDjYhpbl7fyvuB3TDLKbzc
	UnmuNkhjPJ6RcpEV7xkilteLgBNGdXATyPGhpAIC+ce5QJuvumoJNRWg0vNB5mzk
	HFMqZyF448a/vRMaLCfZ0lqnZWtD5VRiRgQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fd1dj4cj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 09:45:53 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52J9jon3009806;
	Wed, 19 Mar 2025 09:45:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 45dk522xks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 09:45:50 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52J9jnom009797;
	Wed, 19 Mar 2025 09:45:49 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 52J9jn5M009796
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 09:45:49 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id 403DE410A5; Wed, 19 Mar 2025 17:45:48 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, p.zabel@pengutronix.de,
        dmitry.baryshkov@linaro.org, abel.vesa@linaro.org,
        quic_qianyu@quicinc.com, neil.armstrong@linaro.org,
        manivannan.sadhasivam@linaro.org, quic_devipriy@quicinc.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: quic_wenbyao@quicinc.com
Subject: [PATCH v6 0/2] phy: qcom: qmp-pcie: Add PCIe PHY no_csr reset support
Date: Wed, 19 Mar 2025 17:45:42 +0800
Message-Id: <20250319094544.3980357-1-quic_wenbyao@quicinc.com>
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
X-Proofpoint-ORIG-GUID: vU1kfpHD6hAvTDM2BBznxCSwBnaFnr8e
X-Proofpoint-GUID: vU1kfpHD6hAvTDM2BBznxCSwBnaFnr8e
X-Authority-Analysis: v=2.4 cv=T52MT+KQ c=1 sm=1 tr=0 ts=67da9251 cx=c_pps a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KSWhaOQsIW5CwuxG1jYA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_03,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=995 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190067

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

The commit messages of this patchset have been modified based on comments
and suggestions.

Changes in v6:
- Return -ENODATA instead of -EINVAL when init sequence is not available.
- Link to v5: https://lore.kernel.org/all/20250226103600.1923047-1-quic_wenbyao@quicinc.com/

Changes in v5:
- Add a check whether the init sequences are exist if the PHY needs to be
  initialized to Patch 2/2.
- Link to v4: https://lore.kernel.org/all/20250220102253.755116-1-quic_wenbyao@quicinc.com/

Changes in v4:
- Add Philipp's Reviewed-by tag to Patch 1/2.
- Use PHY instead of phy in comments in Patch 2/2.
- Use "if (qmp->nocsr_reset)" instead of "if (!qmp->nocsr_reset)" in
  function qmp_pcie_exit for readability in Patch 2/2.
- Use goto statements in function qmp_pcie_power_on and qmp_pcie_power_off
  for readability in Patch 2/2.
- Refine the comment of why not checking qmp->skip_init when reset PHY in
  function qmp_pcie_power_off in Patch 2/2.
- Link to v3: https://lore.kernel.org/all/20250214104539.281846-1-quic_wenbyao@quicinc.com/

Changes in v3:
- Replace devm_reset_control_get_exclusive with
  devm_reset_control_get_optional_exclusive when get phy_nocsr reset
  control in Patch 1/2.
- Do not ignore -EINVAL when get phy_nocsr reset control in Patch 1/2.
- Replace phy_initialized with skip_init in struct qmp_pcie in Patch 2/2.
- Add a comment to why not check qmp->skip_init in function
  qmp_pcie_power_off in Patch 2/2.
- Link to v2: https://lore.kernel.org/all/20250211094231.1813558-1-quic_wenbyao@quicinc.com/

Changes in v2:
- Add Abel's and Manivannan's Reviewed-by tag to Patch 1/2.
- Refine commit msg of Patch 2/2.
- Link to v1: https://lore.kernel.org/all/20250121094140.4006801-1-quic_wenbyao@quicinc.com/

Konrad Dybcio (1):
  phy: qcom: pcie: Determine has_nocsr_reset dynamically

Qiang Yu (1):
  phy: qcom: qmp-pcie: Add PHY register retention support

 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 86 +++++++++++++++++-------
 1 file changed, 63 insertions(+), 23 deletions(-)


base-commit: b18ac9a805efdbc2e2720dded42b1ed26acadb24
-- 
2.34.1


