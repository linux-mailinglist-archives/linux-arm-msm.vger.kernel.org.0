Return-Path: <linux-arm-msm+bounces-39081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E0B9D8573
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 13:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1AF6B288EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 10:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B07D192D9D;
	Mon, 25 Nov 2024 10:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DpN/O14Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26191925A6;
	Mon, 25 Nov 2024 10:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732532279; cv=none; b=GI80YTXq60NScUxQ00QHkKB8Lvf5Id6nQ1Ljs7W5l59KyUUfVZsRDmKT1GavtWxKX+NtivqqYKMkm28voLRI7AroTvh1azBSMW1YeYFsnZIrm16N14n3DHYWyfrdXbIflQRF9GEcG9OlFFKCXPPJ+/eLSK0RoytJM7gIyl+hOtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732532279; c=relaxed/simple;
	bh=N1L5SqSGI3l/01htDqabkNzop1zQOpYFHPJk5y8R4oQ=;
	h=From:To:Cc:Subject:Date:Message-Id; b=kGRZhed8t4kmaQE0yl6FfJWfuohe7N4H31bWUF5QfzvtODaILZ9UggWoT9brpqT4dHNYkSogDcKfgW48iJY9d6T6M42rYa2UopCZ1P6TXzbLQ8lYQ60fYJTfJQpIZi9Mt0qGUfg2OZOFQpOiu+dAtOXD0DQbSFB5IvapHLozycg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DpN/O14Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APArt7L020204;
	Mon, 25 Nov 2024 10:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=O79W14f0nFtA
	v9voEbFDMFieyWHopqdkzROh5D5K+DQ=; b=DpN/O14ZlPHtpqAt2RoC9aj1oJoo
	DK3NnxTtS67KTsicaAN81HLA5J/tfSzGOBzcBlmUAn8aspFjFt/RVr8Foy8bscXa
	cbxFgzmOmW2gh08gvH6ydlaZ0CA6bWga6GxR4us/5NQgIDA3YemlSy1YTpG71KFH
	39FLGfPbbTfTDIt5R8Cj6/a+GxKTB81pBsSlRY4g19QvS/N6XKL8iFU4+YeRFBVC
	bLSWWPAROqqyVESuxwm7renvF3lLLoOTwkEki+pjtHdpLK//5Yh8X2eeaTIuqZkv
	cm9HS/HH2limX0eHX7EJlI9v8oFMi11wnWsxavJVPOC38WtY+uVRvHFqtQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43387jc8a7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 10:57:54 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4APAvoOA031184;
	Mon, 25 Nov 2024 10:57:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 43384m236j-1;
	Mon, 25 Nov 2024 10:57:50 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4APAvnmV031170;
	Mon, 25 Nov 2024 10:57:50 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-mukhopad-hyd.qualcomm.com [10.147.244.250])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 4APAvnnT031167;
	Mon, 25 Nov 2024 10:57:49 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 3978529)
	id E632C5009E0; Mon, 25 Nov 2024 16:27:48 +0530 (+0530)
From: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_riteshk@quicinc.com,
        quic_vproddut@quicinc.com, quic_abhinavk@quicinc.com
Subject: [PATCH v6 0/2] Enable Display Port for Qualcomm SA8775P-ride platform
Date: Mon, 25 Nov 2024 16:27:45 +0530
Message-Id: <20241125105747.6595-1-quic_mukhopad@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Q7HMfCjSXaTu0ZobC8FBoU6h-r0_ZpUG
X-Proofpoint-GUID: Q7HMfCjSXaTu0ZobC8FBoU6h-r0_ZpUG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 impostorscore=0 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411250093
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

v6: Fixed review comments from Konrad
	- Fixed indentation errors in patchset 1.[Konrad]
	- Updated the register addresses to 8 hex digits comprising of leading zeroes,
	  in patchset 1.[Konrad]
	- Shifted the 'status' property of nodes to the end at each node definitions
	  in patchset 2.[Konrad]

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
 arch/arm64/boot/dts/qcom/sa8775p.dtsi      | 220 ++++++++++++++++++++-
 2 files changed, 299 insertions(+), 1 deletion(-)

-- 
2.17.1


