Return-Path: <linux-arm-msm+bounces-40647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 256739E6446
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 03:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76B2F18854DE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 02:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E00118A6C6;
	Fri,  6 Dec 2024 02:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XjhytC7j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EB013BAC3;
	Fri,  6 Dec 2024 02:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733452677; cv=none; b=RyoFnATLg4uri4PK6XGbmU2BqNGFr2wAzpfDUcz/JMkz1A5/t9r4865Q0dk2AFI4ecupWlaJFQ8IobieRKalSPmpPeoeM5hLfB2TAGlcPcCwzVH0+Ye8lqnUkYOPXpn+82fI/acG30b6LLjt0nK5C+PgfKXE9dhqOvt6q+dQjXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733452677; c=relaxed/simple;
	bh=yQZoZlrfGVQBaBiyH1peINAGyYt6ZaXG9HYYV0YOIQc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Xc+E4TGY9puboDmg0jRZYmd1K2nusz5Bdl5+A6FmRG9FGM6oeDZaDyvtlBFasYU0/j6cqrEqVlg6R23qGHk3Ler4COU474gVz/D0KpmouxGr4he9FvCSMTCm/zgqFASu97uMbdMnU9Wn3F5Y66rsnEIiixjD6rvwH3jln/VYNf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XjhytC7j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5Jhhje018614;
	Fri, 6 Dec 2024 02:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=aeqPs91xuOB5ovXRkxruLfI+ecNWNRwng/E
	/4CuEqKE=; b=XjhytC7jUl2NQzUZ3mmCi3zkTQAzXf531WKwbyMsy0c3foKkzcI
	+qwc7R5OQzbYcYJ/L+Pzv7pSPhuyYzM6JUO67kj7SkkTiHxdUbEpG+UE7dSCPHiC
	gk+VYEEnByswVh7fekwTFTVziLOn4MImq3irk8uWoUW434v6Go/6px2UoP86fsfm
	Jy7y2+Qs1d+8sjnKbPRGg07TMu/Qp2q10wqh7nYiMVVw4d9tFW/ZDtEspdR33hiN
	CXr/fSvwZuKXcMVXq6Yyi7nXgg4Pjj1HyOojZqU3FKTrAhFUJRiB7jPWx7DYCnAg
	VHwWYlgKszk3nINUpXmCeR1JpUAuH668VBw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bjk8rrrv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 02:37:50 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B62bltI011445;
	Fri, 6 Dec 2024 02:37:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 437uskw213-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 02:37:47 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4B62bkbC011435;
	Fri, 6 Dec 2024 02:37:47 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (cse-cd02-lnx.qualcomm.com [10.64.75.246])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4B62bkTw011431
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 02:37:46 +0000
Received: by cse-cd02-lnx.ap.qualcomm.com (Postfix, from userid 4571896)
	id 1B92A1A2A; Fri,  6 Dec 2024 10:37:45 +0800 (CST)
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: ulf.hansson@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, bhupesh.sharma@linaro.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_tingweiz@quicinc.com, quic_yuanjiey@quicinc.com
Subject: [PATCH v4 0/2] Enable SDHC1 and SDHC2 on QCS615
Date: Fri,  6 Dec 2024 10:37:09 +0800
Message-Id: <20241206023711.2541716-1-quic_yuanjiey@quicinc.com>
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
X-Proofpoint-ORIG-GUID: RBqYAKruyQ7E2OoduPaPJ8KuxgFNMh-E
X-Proofpoint-GUID: RBqYAKruyQ7E2OoduPaPJ8KuxgFNMh-E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412060018

Add SDHC1 and SDHC2 support to the QCS615 Ride platform. The
SDHC1 and SDHC2 of QCS615 are derived from SM6115. Include
the configuration of SDHC1-related and SDHC2-related opp,
power, and interconnect settings in the device tree.

Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
---
This patch series depends on below patch series:
https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/
https://lore.kernel.org/all/20241105032107.9552-1-quic_qqzhou@quicinc.com/

Changes in v4:
- Move properties which are not properties of the SoC to board DTS
- Add ice region to SDHC1 Node reg
- Add 50Mhz 200Mhz to SDHC1 opp table, add 50Mhz to SDHC2 opp table 
- fix SDHC2 Node compatible space
- Link to v3: https://lore.kernel.org/all/20241122065101.1918470-1-quic_yuanjiey@quicinc.com/

Changes in v3:
- Improve the commit messages and cover letter
- Link to v2: https://lore.kernel.org/all/20241106072343.2070933-1-quic_yuanjiey@quicinc.com/

Changes in v2:
- Improve the commit messages and cover letter
- Remove applied patches 1
- Pad sdhc_1 node and sdhc_2 node register addresses to 8 hex digits
- Adjust sdhc_1 node and sdhc_2 node register addresses to hexadecimal
- Modify sdhc_2 vqmmc-supply incorrect power configuration
- Link to v1: https://lore.kernel.org/all/20241023092708.604195-1-quic_yuanjiey@quicinc.com/

---
Yuanjie Yang (2):
  arm64: dts: qcom: qcs615: add SDHC1 and SDHC2
  arm64: dts: qcom: qcs615-ride: enable SDHC1 and SDHC2

 arch/arm64/boot/dts/qcom/qcs615-ride.dts |  37 ++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi     | 209 +++++++++++++++++++++++
 2 files changed, 246 insertions(+)

-- 
2.34.1


