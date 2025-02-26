Return-Path: <linux-arm-msm+bounces-49469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D83A4A45BE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 11:36:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A3E81888AA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 10:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBE4238143;
	Wed, 26 Feb 2025 10:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eAHBHaUk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3A1258CED;
	Wed, 26 Feb 2025 10:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740566179; cv=none; b=AXsbfxLS2CJ/iDAbxNgDYnq/GSYNXaty4pf+i6t6jmq6NBSeLyJ67LrRR7ahfw4J5pc5yEXkbro54tqFp6FYIrCtl6tQxJLpdU5F8dfvSKlOucvjy5b9WKXCcwdk+ySJWrbygxeXRw7pVUKMgYHMB0ZAy2Sl0LYaTal3tjXg/No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740566179; c=relaxed/simple;
	bh=TcF7pBopWNv+fsMVLLhtQarsDd01uxmgIXiVYrz6yA8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CFiV0powExUI+kN9R7XiqzLtIgLJXNC/dnU5riGes3ADVFmZjQSWZnkgfVec2hNEsYtM8KXbI2FcwQHUvAH2j3CxWykuoWz1QRw2N7Cd6T7tVYayyxOJenMumB2o6cYCtb7A4EERDCJ1O9xj2F59pIXtQ7MhJICXktuRJwbim8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eAHBHaUk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q9s2eX011698;
	Wed, 26 Feb 2025 10:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gia87sU3TdGN7wwxbdDe6jcxSYNCi0evg5C
	9blwswhc=; b=eAHBHaUkG2qIiTOQSpzJZf9yYPC4RAyJMTxmMPFeQRPhfD1XG8J
	l2palYZPNPyVP1CElXtkKkyoz40g63orqYOyD/JxZ38PQKfUONyIATC2KwVcrRcA
	K1x0QPxXUzfyv/m7mWM0E5OPOk+/2n+Td1mpNHqS4aXENl8Ld0SHOKRR9Hq/ah7O
	2MAzk5nru2z2GDd/cLU3wjcApnBX6W36syDHY1p1FnFCQAOJEwlMEqoaijv5HfK4
	W7JuF8JyQ/BQqaGTETDb4JvUpPXJt813kFegl+H35B4/51Kn9hGz/kklLlyTnOMg
	NJTGi0OkVWZz1E8yr9lsLiLCERWQGXKIV/w==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prk9n7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 10:36:06 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 51QAa3xP023967;
	Wed, 26 Feb 2025 10:36:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 44y7nm1d86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 10:36:03 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51QAa3g5023958;
	Wed, 26 Feb 2025 10:36:03 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 51QAa2oI023955
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 10:36:03 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id 5027B40DA1; Wed, 26 Feb 2025 18:36:02 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, p.zabel@pengutronix.de,
        dmitry.baryshkov@linaro.org, abel.vesa@linaro.org,
        quic_qianyu@quicinc.com, neil.armstrong@linaro.org,
        manivannan.sadhasivam@linaro.org, quic_devipriy@quicinc.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: quic_wenbyao@quicinc.com
Subject: [PATCH v5 0/2] phy: qcom: qmp-pcie: Add PCIe PHY no_csr reset support
Date: Wed, 26 Feb 2025 18:35:58 +0800
Message-Id: <20250226103600.1923047-1-quic_wenbyao@quicinc.com>
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
X-Proofpoint-GUID: O85JKIw47XFGIUuU_7LTqHJVDLu4vrUS
X-Proofpoint-ORIG-GUID: O85JKIw47XFGIUuU_7LTqHJVDLu4vrUS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260084

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


base-commit: bcf2acd8f64b0a5783deeeb5fd70c6163ec5acd7
-- 
2.34.1


