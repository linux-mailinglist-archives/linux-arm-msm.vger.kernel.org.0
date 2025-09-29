Return-Path: <linux-arm-msm+bounces-75501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D05BA9099
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 13:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 566413ACE5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 11:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D48573002AF;
	Mon, 29 Sep 2025 11:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pIk/U9Dt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4659980604;
	Mon, 29 Sep 2025 11:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759145754; cv=none; b=uUs4z3IPb0hvCtrrxcrKf6sDxDjtFAHRldDwqSAFRQl+bZKf3U1lQvJbQQyrvZzaNVij4tolxBTbVFK2h8tR1MD5kJzrf2NsPzwblhyftBkjddUdGSe+ZJHNgyXyUKr8aYVNv0lSTKPqByepIPQ/kIzSLcsVX8O0UdPHh/AlTpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759145754; c=relaxed/simple;
	bh=q9Mb7pcNcXXEalYS3yT1Q4mQpZ2Lm19scwoND5Vp+BA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l1q1hRJ8Zs92Cs7HasPqtUmhnWVpUJyVfzU8jTQHA9eKu6il7+xwUuFN+u7T5jGA32tNJLRi3GI9INOAUUmaFwnaVrNuICNJYmqtrmrBHOCJKlBcYfvs6P+TShWlwhlomWi8XQqvBTWGDJ1NRUygOUrrgdVSN46qgGosOhNB8vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pIk/U9Dt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58TAKTDC023427;
	Mon, 29 Sep 2025 11:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ekzUPFNQTmH1ZQ8P7rtQUH5e2D89ywMvxSC
	/bs775+s=; b=pIk/U9Dt2wnBPNV7+dZjJvr1m1HUXXFsNXAApsdWnpWSSlmFo0/
	Bet2upts/BlPnEzj9Ovj9hQOaCulPola2YPcuD28kirjGutf1TBzQW89A8HxN9/U
	8Cx6t3O0K8TF8dHC1BTpp7hi0wCWKfMnqkt8sMws2xJAJ5CTR/A3q03VQZrZRO4m
	SowpOVwt5xKSLhD1bhjzTR053bxX9LFJiVDSDgY3cdD6FRzW20rO4s5VEhPytwzi
	UM03H+CScLmISjE18syMeuKzk/AiSL35uspMSoDkmCfumlA3QDe4vpOvqTISdDpj
	A2kiZpYJTbbPJW0zLAps/tKvMNy3se5cAAg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdcs47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 11:35:49 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 58TBZjuf008883;
	Mon, 29 Sep 2025 11:35:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 49e90kvy5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 11:35:45 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 58TBZjnC008878;
	Mon, 29 Sep 2025 11:35:45 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-rampraka-hyd.qualcomm.com [10.147.247.88])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 58TBZjRP008874
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 11:35:45 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2305851)
	id 2BD1D5C6; Mon, 29 Sep 2025 17:05:44 +0530 (+0530)
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Ram Prakash Gupta <rampraka@qti.qualcomm.com>
Subject: [PATCH v4 0/4] mmc: sdhci-msm: Rectify DLL programming sequence for SDCC 
Date: Mon, 29 Sep 2025 17:05:11 +0530
Message-Id: <20250929113515.26752-1-quic_rampraka@quicinc.com>
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
X-Proofpoint-GUID: 2AawOdqoEEpN915Tdon9zQxKi9feyi85
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68da6f15 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=LKI8_1zPV-ZnuddBkK4A:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 2AawOdqoEEpN915Tdon9zQxKi9feyi85
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfXz0CDStnaE+ID
 PRoQx1yXtz2VyBXn+Vi9GyBEiaPDXFAtPJpKSqTSPHmM9SGTOOaxJj7+3ehRXLiOOD8m3QYpPo2
 msE6jqQrlZOdTIcAXjKdkbAhN68SwXKi5qOdopoz/WiSeXRYl+beA8PMBKH/xwtBwdDEMajUcSv
 4dJQGXrnqsH8NInhAxx3u0lZbLwefSFGT9lP4j4MYcxIVz6+sfaus8QN/RKQmEJWLQYvEOstR3j
 rssxalkfpkJMoy726Ufm2A1m4DaAXGI4WsJOJt9e89HQKMDEkMUkX5pzXkIVUr9om/jnxRC/ysB
 aeEF6guHkZLbBm/NPv3NlwBq3hIyRBomHFiGfn2Xgy6n0qhaYb0arirWwQM/i6NuQnHyccX1KVT
 i11vf90ty7SNcQyADVgWh1HIVj51Sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_04,2025-09-29_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036

From: Ram Prakash Gupta <rampraka@qti.qualcomm.com>

With the current DLL sequence stability issues are seen in
HS400 and HS200 mode for data transfers.

Rectify the DLL programming sequence as per latest hardware
programming guide and also incorporate support for HS200 and
HS400 DLL settings using the device tree.

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


Sachin Gupta (4):
  dt-bindings: mmc: Add dll-hsr-list for HS400 and HS200 modes
  mmc: sdhci-msm: Add core_major, minor to msm_host structure
  mmc: sdhci-msm: Add Device tree parsing logic for DLL settings
  mmc: sdhci-msm: Rectify DLL programming sequence for SDCC

 .../devicetree/bindings/mmc/sdhci-msm.yaml    |   5 +
 drivers/mmc/host/sdhci-msm.c                  | 368 +++++++++++++++++-
 2 files changed, 354 insertions(+), 19 deletions(-)

-- 
2.34.1


