Return-Path: <linux-arm-msm+bounces-53995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99529A85BAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 13:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94EE016A2F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 11:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E866221286;
	Fri, 11 Apr 2025 11:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CpsZVyzm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D2021421D;
	Fri, 11 Apr 2025 11:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744371099; cv=none; b=WOg4e248e/O4h4ANoUTQ/4luUUmbXRQXBo8LHIUpp3QVUx2a14sZ5z+ChQeZjXBO2YlDuFV5kx2X021N+/O0LvkBLwhekDJkv8oxgNBCqVi/5AfIbMe2WBDg7LcUbs5A1XbJ0OzXB83kLi+VzDzzoaT3Nn2hBYSls0uS1mJAPvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744371099; c=relaxed/simple;
	bh=9A/yBxFd4eEgohTQI4ceSrv6qqNll11W1Azn8BpVjz0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eTtIW7gPGL1m+2S+j68vOfQav3vX0952GirfDwuXpYMVTyN/Fr+ZWjPjrypBh2LAc0FXO0BIwoCXulyBEpY/17RaeHCL4BDELIiOKN20fg5xuO23Imuqc13zqpFanliijtozcy4pRmmtoKXq9SrE9j5MJsOv25o6/huhFeD+KDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CpsZVyzm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5jhKO028846;
	Fri, 11 Apr 2025 11:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wtAFm4/u1v1FpQAtZ/vwHWKpL/Bes+JwYXZ
	S/ta0SXI=; b=CpsZVyzmvH3BNeIdCOxaNngy9WXAYhSKIswP3f+ymGz6JtQCM+e
	TfZRqqLDZ568CziHGOR8/Sad6q6E3mH3aqrzhpehuaJ5dqM6VC5qKh4ul7MzOfIp
	S1nvtwr+WJkXcI7k+qIg8NwaNjQOCOaf7s3VUB8sO5eaGd4j8xaJ26IzMwZblduF
	DzSZUe7nb9XwAXbptoMmRIuNn7WxiqzuzUhPC8Ia4sib9XqbNnONGLYxNnWn0859
	1vVVi2y9c7h8a2NtnFOrMduQhYl2Z2CFuI7VzNg0fosOOosTXhpIXfNcUlAfsUfh
	S7ZEXhQXGnlTtViG60Ahgv4fieHbgI5j5yw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbut8m2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 11:31:27 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53BBVP55004330;
	Fri, 11 Apr 2025 11:31:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 45ue3f20tw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 11:31:25 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53BBVPXd004321;
	Fri, 11 Apr 2025 11:31:25 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 53BBVOYx004313
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 11:31:25 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id 871FE40C49; Fri, 11 Apr 2025 19:31:23 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, p.zabel@pengutronix.de,
        dmitry.baryshkov@linaro.org, abel.vesa@linaro.org,
        quic_qianyu@quicinc.com, neil.armstrong@linaro.org,
        manivannan.sadhasivam@linaro.org, quic_devipriy@quicinc.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com,
        quic_wenbyao@quicinc.com
Subject: [PATCH v7 0/2] phy: qcom: qmp-pcie: Add PCIe PHY no_csr reset support
Date: Fri, 11 Apr 2025 19:31:18 +0800
Message-Id: <20250411113120.651363-1-quic_wenbyao@quicinc.com>
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
X-Proofpoint-GUID: 0b0fRS1LSEQUiqm2R16C7HBdNhbT6oaz
X-Proofpoint-ORIG-GUID: 0b0fRS1LSEQUiqm2R16C7HBdNhbT6oaz
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f8fd8f cx=c_pps a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KSWhaOQsIW5CwuxG1jYA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504110073

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

Changes in v7:
- Rebase on linux-phy/next branch.
- Link to v6: https://lore.kernel.org/all/20250319094544.3980357-1-quic_wenbyao@quicinc.com/

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


base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
-- 
2.34.1


