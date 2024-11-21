Return-Path: <linux-arm-msm+bounces-38636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F82B9D49B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 10:14:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFEEF1F2198B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 09:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002D41CD1E3;
	Thu, 21 Nov 2024 09:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Xqna+81N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494631B0F0C;
	Thu, 21 Nov 2024 09:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732180452; cv=none; b=h6/V2JG7GnLilYohZPqnNQpF2Z2dewrIVM++7Knhb+azSSTquFf/fUuF+0UHCucI7IxmYVlsTmE19IcuwypO+wdGHvDl/x1/p7S/uxiUn4xUU4y4JSi1mOH+OP1vU8Bz4OqzpMYVM2FSfmSs5dglxt0ktaKWF5DiiMux46EnwXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732180452; c=relaxed/simple;
	bh=9kEt+ExNSjNi98hf7dvaY5nShW1gzL5PDCspsBAKWj0=;
	h=From:To:Cc:Subject:Date:Message-Id; b=H3qPh19HwPuAlN1WaJHqTGsUkSl3cASnt0BVJiX1cI8aO3970focwERc8cX2vKDXzGhQQchuL5CxUgqxNfKtljeuI66bIF7BvfiwYYCWrN7mFa12ryFmGheL0rXclq+copsM45+mj6zjI3XCEcubW0xFxJ9CR02Lui1JLNfkCYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Xqna+81N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKLNBuT003945;
	Thu, 21 Nov 2024 09:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=aSU+2Y5UG9Tx
	Y+vkKjYT/j6qnMk2MYh1O3SeutER2Sc=; b=Xqna+81NL3z2RdGnKNtaOAjPZVpF
	oMk3A/D+OsGo/0WqJToUV/965NvHUZ4K4BdMdIWUoH2Sxq2vSMuyAWnn3341Bi7w
	2BzwcJJQAyKjUgiTSjs2t+SOiQg3ohsaBwmdxbECmhmlU98LF9/ZhbL6NKzWp+l8
	dMWtV5fN/TC0WrCqI8YsEfEUb8z5CZKL4Ha052ttZhWXZY2pWRvDuw2qg97qpSAB
	Gq1d5r9/SaTXnFZysqSz4dWu3zdjeT+uyfef4ANfmuhM1ys6EquDFwL0azIr4iDX
	xxmMyyj17H6OHXadgWrYxLv1wPO5bXm3/HKDdWzBl4e+/ksMpekODDorhA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ce3bgfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 09:14:07 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL99vax018496;
	Thu, 21 Nov 2024 09:14:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 42xmfmn76g-1;
	Thu, 21 Nov 2024 09:14:04 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AL9E457024137;
	Thu, 21 Nov 2024 09:14:04 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-mukhopad-hyd.qualcomm.com [10.147.244.250])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 4AL9E3vu024131;
	Thu, 21 Nov 2024 09:14:04 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 3978529)
	id 0766E5001A8; Thu, 21 Nov 2024 14:44:03 +0530 (+0530)
From: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_riteshk@quicinc.com,
        quic_vproddut@quicinc.com, quic_abhinavk@quicinc.com
Subject: [PATCH v5 0/2] Enable Display Port for Qualcomm SA8775P-ride platform
Date: Thu, 21 Nov 2024 14:43:59 +0530
Message-Id: <20241121091401.20584-1-quic_mukhopad@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GtqDbVX1e2JIxDfhI-_WEj0S9mIfXjIt
X-Proofpoint-ORIG-GUID: GtqDbVX1e2JIxDfhI-_WEj0S9mIfXjIt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=971
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411210071
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

This series adds the DPTX0 and DPTX1 nodes, as a part of mdss0
on Qualcomm SA8775P SoC. It also enables Display Port on Qualcomm
SA8775P-ride platform.

---
This patch depends on following series:
https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/
https://lore.kernel.org/all/20241019-patchv3_1-v5-0-d2fb72c9a845@quicinc.com/
https://lore.kernel.org/all/20241018070706.28980-1-quic_mukhopad@quicinc.com/

v5: Fixed review comments from Dmitry
	- Updated the labels of DP connectors 0 and 1 to edp0 and edp1
	  respectively.[Dmitry]
	- Update the commit message for patchset 2 mentioning about the
	  enablement and validation DP controllers of mdss0.[Dmitry]

v4: Fixed review comments from Dmitry
	- Added p1 region to the register set of both mdss_dp0 and mdss_dp1.[Dmitry]
	- Validated devicetree against DT schema.[Dmitry]

v3: Fixed review comments from Dmitry and other minor changes to prevent warnings and maintain alignment
	- Added specific DP connector node for each DP port validated in patchset 2.[Dmitry]
	- Updated the reg value to 1 for port 1 under mdss_mdp in patchset 1.
	- Fixed the register address space for mdss0_dp1 and mdss0_dp1_phy in alignment to the 
	  register address space for mdss0_dp0 and mdss0_dp0_phy, in patchset 1.

v2: Fixed review comments from Dmitry, Konrad and Bjorn
	- Added a new patchset to separate out the soc and board parts.[Konrad]
	- Patchset 1 now comprises of the soc parts and patchset 2 includes board specific changes.[Bjorn]
	- Patchset 2 enables all the DP ports validated on the sa8775p-ride platform.[Bjorn]
	- Fixed indentation errors in the dtsi file containing the soc information.[Dmitry][Konrad]
	- Updated clocks to be used by respective PHYs.[Dmitry]
	- Added mdss0_dp1 device node.[Dmitry]
	- Updated the names of PHYs using label prefix "mdssM_dpN" for clarity.[Bjorn]
	- Avoided use of referring any label in the board(dts) file in the dtsi(platform) file.[Bjorn]

Soutrik Mukhopadhyay (2):
  arm64: dts: qcom: sa8775p: add DisplayPort device nodes
  arm64: dts: qcom: sa8775p-ride: Enable Display Port

 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi |  80 ++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi      | 218 ++++++++++++++++++++-
 2 files changed, 297 insertions(+), 1 deletion(-)

-- 
2.17.1


