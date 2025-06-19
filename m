Return-Path: <linux-arm-msm+bounces-61788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18621ADFE46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 09:02:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BDE0188E0A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 07:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A208D242D9F;
	Thu, 19 Jun 2025 07:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bCDHMHYU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0266B24167E;
	Thu, 19 Jun 2025 07:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750316573; cv=none; b=WqoGkPBhvrRXjEFkRKVVTQBUqzA/YqTphGxOvsRz/kX9SyzfKnAoSYxFY2syOnerXTsvkfKpdhs713HtmxlR+OXBFLzE3bfsdG0lsoY20D9RzZ4dCZK2RiL4RPIgGfpHLJRp40ocBrBp2TAYcTo541KU/dr5VEDTd5yPbHoOLrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750316573; c=relaxed/simple;
	bh=Aiv6sCZ/fmMVPkItCwPVs8JmA+7DNDSDrgAmzaW16NM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NKp4To3sdDM1oSO9Wfx5NlB2LTut61WE51NfnmTmOxBFs6gtJhLMXfMfQMOY/XjxGP+g6fqbmHtu/o2EJaDz/fiILpNxrqwX6ZzX9nej4lahifSvCpr6xkjyMUsDZ4ArqaIjoJxsQhCm479Khkgmftz90Zyg8ecG6t5mec16j/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bCDHMHYU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J4fjn0005657;
	Thu, 19 Jun 2025 07:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=1xqjmkKshB5BdZBTzmxvIga0qHDG2eCUpCOLSiBsvAc=; b=bC
	DHMHYUYN+wcdQFW8QzpfGQEe5+veMCuQTH0KTSA7Tyivx38c+4XWKhNxxtGhcXYg
	rPp/pS9vvEZbSs3tbw2lxcj+kNUuKDIFfZrWGIkhQmMwVLtdHMTnYPQu3QEChDx4
	tYEHM6jFKGqte2IsA4BSSFrBt9V36x5QWe8Jzzhv7NN8U3XHe1DtW4k4TDXHU7Pn
	M8S+lc77YIVntivGmFHtA+sRgdwrhmAytYPQ8CqOwpYfVCfQYxsDN0RbmqoOXpTr
	BnZy+6bD0DqqCZEHUoYT1aWjc3C3GdsLPHBiJP3oeKWTaLqTkdC5jyMpX8nJIiyL
	fCcBhJqaOsey1UzrjQHQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47c0rvj3mq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jun 2025 07:02:48 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55J72lpv011402
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jun 2025 07:02:47 GMT
Received: from hu-sayalil-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Jun 2025 00:02:44 -0700
From: Sayali Lokhande <quic_sayalil@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 0/2] Add eMMC support for qcs8300
Date: Thu, 19 Jun 2025 12:32:22 +0530
Message-ID: <20250619070224.23428-1-quic_sayalil@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDA1OCBTYWx0ZWRfX6mnjYz1+q6Jz
 pgz7C5X/pYdmbKTN6rZ9DWoDUph7ZLavP3U2PXVRcsSpoh9J+si6DH5D5pWyTBYNGwPGCtWx8dK
 +eGGxtkxmeqqMOzLEeb4npEA27OydHwU+xbFSC4IS7RQV+rXosxmlKOCeE+ojl2KDzU1fRJl1N9
 QXd149+CrFDMBdcbv542Q72gTE4JBWyR2uepliJDULc0T1d+BsjuMVK9BhAYFK787Br6k14iU34
 uCQiqL+d6dk21hB8EYBUQH0gzbyNbyhPEqNTgtCw1zewgmj9xW1SorFuW4FrhHKXC71lQPURi20
 VCcUo9ta3J85HZhjs0QyqSi622uUbpcz9E2Qz/hKz7TX9bt38fOR7Cho1lD/HpvVCasw07/G/g4
 qcLwvEkEnVcqWcYuetKXxEllH5ZL+9a541IIm8H6dv9KqQL4YYvfAdrMCdZ3jpbKaSS8z+IS
X-Proofpoint-GUID: 4-7kSJtnNT61L7KbNjbGaw25UvoC5vxK
X-Authority-Analysis: v=2.4 cv=btJMBFai c=1 sm=1 tr=0 ts=6853b618 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=s9HvSjK2G09CRz63pcIA:9
X-Proofpoint-ORIG-GUID: 4-7kSJtnNT61L7KbNjbGaw25UvoC5vxK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0 mlxlogscore=817
 bulkscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506190058

Add eMMC support for qcs8300 board.

- Changed from v1
 -added SoC-specific compatible and a corresponding dt-bindings.
  used QCOM_ICC_TAG_ALWAYS for interconnects.
  fixed sdc pin nodes.
  corrected msm to qcom.

Sayali Lokhande (2):
  arm64: dts: qcom: Add eMMC support for qcs8300
  dt-bindings: mmc: Add sdhci compatible for qcs8300

 .../devicetree/bindings/mmc/sdhci-msm.yaml    |   1 +
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts     |  21 ++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 113 ++++++++++++++++++
 3 files changed, 135 insertions(+)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


