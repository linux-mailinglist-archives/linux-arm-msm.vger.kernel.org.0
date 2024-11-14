Return-Path: <linux-arm-msm+bounces-37895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD4D9C869B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 10:57:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96C5E1F243C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 09:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CEA21F76D2;
	Thu, 14 Nov 2024 09:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B/QrGWml"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097E81EE021;
	Thu, 14 Nov 2024 09:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731578111; cv=none; b=Css5S/CbkMFSgnVsWcqxc5uchN6oPbYLZLVWGKySAjchlmISbn1TXtXsDY0poq27eR5Y4LJquyQXHl8zt6oKbFvW2O320JxXdRJJIWaKtkuOAwrGONjyqqnkFcM3UxfbDyYF18dfLnlRO2ypvUOoSUMWBDN7E10sI3I0qpR5Kyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731578111; c=relaxed/simple;
	bh=77bSERO3rOpNtWI3JaZqE4R4Mj+YUxlYUW1GCy9QUV4=;
	h=From:To:Cc:Subject:Date:Message-Id; b=HAAzP4YBptVW9Lb1m6/LHMCQcJXR5SuxxNVSZinelz7sIEX6TJKpPJEhKKcte1cyc4BCAl81cuP4DgPY1I4QxD49sJuQvvFYGXJug4gb3hShAVAlzMJMM7BBuS45bvtiLa0Hhh2tT3sRdyeaUpNwUiLVt7lCQeStk9uot/X4sco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B/QrGWml; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE6CktR026131;
	Thu, 14 Nov 2024 09:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=cHL3YJv4Fyri
	xPVtiTa2lodSPGyIAwWXekmgO91PBxY=; b=B/QrGWmlf6IBKrAbhnXZ0PNlS4yX
	qeTEnDB8tFQBSzLCDHZsgpkWdHLwvo7CnJn2qRNRxobpK7dh4yks7ERa8xk30O83
	3whjiC7LitEkHn5OH6wDj7Kr2k+ib6UMzNy7LWoNEhklU8GuDAkhVee7hh+Y+9vN
	iOLjpPci04BIMnaPqp3HaBDxjTSC8G7YRh+IWAsdsEGYlB4u9vspbn5QVtzCRJFY
	1AY9nD9bowBspGWwpymiN3FfSfQme4UNgmfLk9mxds8CF58THjsZoJqyJt1ospar
	UBSzVeMgFlEnCm9VttAmw3JA7sCdEv8ddlmRD6DzBuX6phnbu691XEG9xw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42va07f1wc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 09:55:06 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE9pZVk031814;
	Thu, 14 Nov 2024 09:55:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 42t0tm9vy0-1;
	Thu, 14 Nov 2024 09:55:03 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AE9t2WJ002263;
	Thu, 14 Nov 2024 09:55:02 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-mukhopad-hyd.qualcomm.com [10.147.244.250])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 4AE9t2Lw002253;
	Thu, 14 Nov 2024 09:55:02 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 3978529)
	id 09B785001C6; Thu, 14 Nov 2024 15:25:02 +0530 (+0530)
From: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_riteshk@quicinc.com,
        quic_vproddut@quicinc.com, quic_abhinavk@quicinc.com
Subject: [PATCH v3 0/2] Enable Display Port for Qualcomm SA8775P-ride platform
Date: Thu, 14 Nov 2024 15:24:58 +0530
Message-Id: <20241114095500.18616-1-quic_mukhopad@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nXcv6ihng5msy2zThmX5jpxsh8h9YvJa
X-Proofpoint-ORIG-GUID: nXcv6ihng5msy2zThmX5jpxsh8h9YvJa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 mlxlogscore=963 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411140076
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

v2: Fixed review comments from Dmitry, Konrad and Bjorn
	- Added a new patchset to separate out the soc and board parts.[Konrad]
	- Patchset 1 now comprises of the soc parts and patchset 2 includes board specific changes.[Bjorn]
	- Patchset 2 enables all the DP ports validated on the sa8775p-ride platform.[Bjorn]
	- Fixed indentation errors in the dtsi file containing the soc information.[Dmitry][Konrad]
	- Updated clocks to be used by respective PHYs.[Dmitry]
	- Added mdss0_dp1 device node.[Dmitry]
	- Updated the names of PHYs using label prefix "mdssM_dpN" for clarity.[Bjorn]
	- Avoided use of referring any label in the board(dts) file in the dtsi(platform) file.[Bjorn]

v3: Fixed review comments from Dmitry and other minor changes to prevent warnings and maintain alignment
	- Added specific DP connector node for each DP port validated in patchset 2.[Dmitry]
	- Updated the reg value to 1 for port 1 under mdss_mdp in patchset 1.
	- Fixed the register address space for mdss0_dp1 and mdss0_dp1_phy in alignment to the 
	  register address space for mdss0_dp0 and mdss0_dp0_phy, in patchset 1.
 
---

Soutrik Mukhopadhyay (2):
  arm64: dts: qcom: sa8775p: add DisplayPort device nodes
  arm64: dts: qcom: sa8775p-ride: Enable Display Port

 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi |  80 ++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi      | 216 ++++++++++++++++++++-
 2 files changed, 295 insertions(+), 1 deletion(-)

-- 
2.17.1


