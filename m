Return-Path: <linux-arm-msm+bounces-85228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E32CBDB8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 13:11:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D11353008FA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 12:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A9A32D0E1;
	Mon, 15 Dec 2025 12:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hYdenIh/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B070328B69;
	Mon, 15 Dec 2025 12:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765800029; cv=none; b=QOY/oVY9kaVquTpzii+gX8vNH/cFS1E2YgXWjIQTV2m87sqevq+F4EofNuQ0vyCRqNMhgrxLctL1n6FAAKL0X91ZpKMSQPaI/uq1bVaBYAvmrriZEl+qe/E2TPeQ3std25AFr1pKcVoak+7sKK9NbmF90co1Fnsq73ZfzL4tNW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765800029; c=relaxed/simple;
	bh=NZqDXQNAGh+ZTKsjM1AQXCXvMCaUjZQX6R3y5J6YkM0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ggjqYX/x4F9OUXkYJOScdIP/C4SeOmyfcsNhmCXlIWWHtXYW1GXPQ7PREyQYm2yb13jB+WStG/JawbvZSeEpPF242kDV5vDhvr6od/iJ292qkt7+Pj2vpnty8aVqlxelxkUgCRaYdE6kLyZQ+QABXoXXleDz0CqYBogSRnp5sDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hYdenIh/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFANtJ5291223;
	Mon, 15 Dec 2025 12:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XltOpTHTpyqi8HSY2T53DiJtYHbO59j+jp+
	xDVU5pl0=; b=hYdenIh/PKE1Zk04t5a8pgfvTnu6rMbdqmgFq+J1LtrDNIpeE/a
	aWKuLJPzkO0d42+xXnqGR3eoMdtySsOTYdKxno+cfEUQJQVHwn4xc5XnzXO3kyqm
	qe20pLCLwRIZc1ES/UMKxrYls0Nr5U9bXvyngeCg6zw1fplvtXzBf/mZVC5MHomb
	10frf9r04cRTKsmvbM0VmmShw4TdTLpbXdbQ5NRH9vfLG+u3KFoLDJtF4IAOXnKB
	5XcYh+h8804sIJG3ex8EV2f+lLkcLzEpFlxzkNrSwqhpUofBro2iCw9zuk7Os5YX
	ZuWxM1/xmtD3L2+fR5T6+MG9QdPdPZ/1dSA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b119u4ff6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 12:00:20 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BFC0FhE029028;
	Mon, 15 Dec 2025 12:00:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4b117kxe1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 12:00:15 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BFC0F4C029022;
	Mon, 15 Dec 2025 12:00:15 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-rampraka-hyd.qualcomm.com [10.147.247.88])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5BFC0FMk029014
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 12:00:15 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2305851)
	id 2F8675CE; Mon, 15 Dec 2025 17:30:14 +0530 (+0530)
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com
Subject: [PATCH v6 0/5] mmc: sdhci-msm: Rectify DLL programming sequence
Date: Mon, 15 Dec 2025 17:30:04 +0530
Message-Id: <20251215120009.3877889-1-quic_rampraka@quicinc.com>
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
X-Proofpoint-GUID: cPxk_Dl3HAtlI4XUZ3Cv18wUk-mBuXlS
X-Proofpoint-ORIG-GUID: cPxk_Dl3HAtlI4XUZ3Cv18wUk-mBuXlS
X-Authority-Analysis: v=2.4 cv=Ddsaa/tW c=1 sm=1 tr=0 ts=693ff854 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=wlp7FQNLwHqLWPUUYAUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEwNCBTYWx0ZWRfX/dh6VEwsEkDB
 T7qJMTOfoNsibDPlTOmGJe7RfKFG00IyAXtdu6SHuf3IoQTdDbTqOzOvf6gSQBiQk6ss2/b3Acr
 TzxuM1icIWktSpCHuuIAetfcg6Oruds42xXbRFVFchWD024xTWb/5z06egwJ3JnYq0MVdxV2EeV
 LmCCYQWH/KbSTAD9uzMLGJ7SvQ5L0Gpgzcms6uA2xjla/9OlU5btmXAgg7GJSY1zTo8ITR8+U3+
 ELtnNffJBaPLQVYXRBilEIs2LyT2uM5ZvB6thdEjXcc+QAxzDRnUSrzsHTzUZJbrbhyil2u53Dm
 Pw0usV/MNHYgEDJzEhe0SiAmBjoXDVPohZO1rNkWEHqZJsQYAfOSz6S8/DXNquua1FdJsCCKfej
 QKFVd7MszQcnWaRfRIez8mGdmLYdMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_02,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150104

With the current DLL sequence stability issues are seen in
HS400 and HS200 mode for data transfers.

Rectify the DLL programming sequence as per latest hardware
programming guide and also incorporate support for HS200 and
HS400 DLL settings using the device tree.

Changes from v5:
1. Addressed Adrian Hunter's comments:
   a. SDHCI_HS400_TUNING flag handling
   b. Use of readl_relaxed_poll_timeout api instead of loop.
   c. Reording of variables.
2. Krzysztof's request for DTS user.

Changes from v4:
1. Addressed Rob Herrirng & Konrad Dybcio comments:
   a. Regarding naming of dt entry.
2. Addressed Adrian Hunter comments:
   a. Regarding parsing of dt and storing variable in driver.
3. Additional change:
   a. Changes in patch 4/4 according to parsing change.

Changes from v3:
1. Addressed Dmitry Baryshkov comments:
   a. Regarding clk division by in V2 patchset
2. Addressed Konrad Dybcio comments:
   a. Renaming of parameters
   b. Memory allocation
   c. couldn't address __free, as didn't fit here
3. Addressed Krzysztof Kozlowsk comment:
   a. Regarding the dt binding
   b. commit message to reflect the need of dt
4. Additional change:
   a. DT parsing logic
   b. Maintain backward compatibility

Changes from v2:
1. Addressed Dmitry Baryshkov comments:
   a. Regarding TCXO frequency.
   b. Regarding clock rate.
   c. regarding checkpatch.

Changes from v1:
1. Addressed Tengfei Fan comment, added missing semicolocon
   in sdhci_msm_host structure.

Ram Prakash Gupta (1):
  arm64: dts: qcom: Add sdhc dll-presets

Sachin Gupta (4):
  dt-bindings: mmc: Add dll-presets values for HS400 and HS200 modes
  mmc: sdhci-msm: Add core_major, minor to msm_host structure
  mmc: sdhci-msm: Add Device tree parsing logic for DLL settings
  mmc: sdhci-msm: Rectify DLL programming sequence for SDCC

 .../devicetree/bindings/mmc/sdhci-msm.yaml    |   5 +
 arch/arm64/boot/dts/qcom/qdu1000.dtsi         |   4 +-
 drivers/mmc/host/sdhci-msm.c                  | 324 +++++++++++++++++-
 3 files changed, 314 insertions(+), 19 deletions(-)

-- 
2.34.1


