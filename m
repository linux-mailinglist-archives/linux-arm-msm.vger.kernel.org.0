Return-Path: <linux-arm-msm+bounces-61682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB82ADE47D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 09:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F1393B148E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 07:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8B725B1DD;
	Wed, 18 Jun 2025 07:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YsBwstYz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1BC1C5496;
	Wed, 18 Jun 2025 07:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750231712; cv=none; b=JeS7RYxizl7bcHvPBTtz+K8eyHVxgbly++HIqNYHCsl+EQCIdI9NI2DJO0ikmcKiNNffy1xUxNwcJPGSpjOuc994KsFcn9UDZ1tjSUI1ruYOgaQjAxtV6LNvs9IJJ7y2QezU+f5VLgMfhwONZFuOWGQTI1LnaAKOO7i2lZMLpLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750231712; c=relaxed/simple;
	bh=wlnzKww1XZK3zyt+h02rRcrQykUtfQcTZfoxxMdiYCw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iikDSsAE2ZHHIpe0LQEo8c0OI5yT/UwXIniDG7sbp982e3KlLnQMR/Z22n9TuM1wj0QXAPBYTX033sZT+6/txlT4/CRnS5uVt8xJoSoOYlEoCKX75E65yVUTLBlcSDlae9qsDHUBbqCXoFmd/fEfl/lN+GIciwaXCucG716UVuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YsBwstYz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I1SqAw026711;
	Wed, 18 Jun 2025 07:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=InH2M5KENizqEntM6KrxgOu5pkbAKyCcJCo
	U6Xisc4g=; b=YsBwstYzhri+Na4NZpcKh5y7ju8U+bble7CQRSNa1TJs/LaSaBJ
	jeWMZ5Apa7U6zWOD963ZHscBQP7fr5EPzNGqZl14rEx7PVLoz7SJpPGTJoJ9syPB
	syBuAdXyUeFjqI9gH3JpXmxNedn84XA9+rFwktdD/etxGTkNJ2REaoCJp/akJBWi
	EAcxpsXdEmdKKtOj3kYn5O+1rowUH3WzmKwfv+fYL3jSwmWeBnENppdeJ+7QE/Rt
	FQ+Clu9/ncExFNJIpbEFy1OP82ka07+cSfYcbKto0Tfa/dl4K44t7kI3cBffRNnm
	iUm3ywSFzdkuB2pCDWa2jLYuCLiI1NxGh+g==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mk47f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 07:28:26 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55I7SMGR024585;
	Wed, 18 Jun 2025 07:28:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 479k1gnd3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 07:28:22 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55I7SMaw024578;
	Wed, 18 Jun 2025 07:28:22 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.147.242.251])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 55I7SL37024562
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 07:28:22 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2339771)
	id EDF455C1; Wed, 18 Jun 2025 12:58:20 +0530 (+0530)
From: Sarthak Garg <quic_sartgarg@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com,
        Sarthak Garg <quic_sartgarg@quicinc.com>
Subject: [PATCH V3 0/4] Add level shifter support for qualcomm SOC's
Date: Wed, 18 Jun 2025 12:58:14 +0530
Message-Id: <20250618072818.1667097-1-quic_sartgarg@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA2MyBTYWx0ZWRfX+UuCDz/d08qv
 8ZHpOiX1sLKsxEDypL6Q3n3RwRHoQXp+FHWEyBlPg/4IVx5CfM8pnAQ/Ot3LNXVX/8FZ5nbCO5a
 1Mdg/qPEEt45Ay4yVeo9dOJsQSv24NVqZyTXBIwfqjRdOL+QeDZ7nhSzOHMN0JA/b+NqIgmBCYU
 fygEFJU6qe0PA6O+sLDLCfDn206NKhlrcRRGLp2HaflOOABryAQdqiqGwhCpyEQQt+VbuuJ81yV
 JM14b8ziMGwZYs/1j+QW5CZwlaPiTlRN1F6x1zweXvAIlDZnNo1aA7Elb/BXB45+dm3pO4vovkS
 HBI1TunFS/7p6CS0AnHEBaM5DQz6VCdBke5vHR6arBJsmm83LwMMRTd2MkD2W5Cvmq0ISKP2TcF
 J3VY282QD7i9TQ1TroOGw+lxWdrLVEr1LjtV3vrqyd+5YGpdJB2Cm5amvwp7kfx8BG24ty0v
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=68526a9a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=7dyTyeQR3BJvcbYslWQA:9
X-Proofpoint-GUID: RCtquw9aEtO0zmWGzscjHcjKZG35RZt1
X-Proofpoint-ORIG-GUID: RCtquw9aEtO0zmWGzscjHcjKZG35RZt1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180063

Add level shifter support for qualcomm SOC's.

- Changed from v2
    - As suggested by Konrad Dybcio and Ulf Hansson redesigned logic
      to introduce a new DT property max-sd-hs-frequency and override
      the hs_max_dtr accordingly in sd.c file.

- Changed from v1
    - As suggested by Krzysztof Kozlowski redesigned logic to use
    compatible property for adding this level shifter support.
    - Addressed Adrian Hunter comments on V1 with resepect to
      checkpatch.
    - Cleared the bits first and then set bits in
      sdhci_msm_execute_tuning as suggested by Adrian Hunter.
    - Upated the if condition logic in msm_set_clock_rate_for_bus_mode
      as suggested by Adrian Hunter.

Sarthak Garg (4):
  mmc: sdhci-msm: Enable tuning for SDR50 mode for SD card
  dt-bindings: mmc: controller: Add max-sd-hs-frequency property
  mmc: core: Introduce a new flag max-sd-hs-frequency
  arm64: dts: qcom: sm8550: Remove SDR104/SDR50 broken capabilities

 .../bindings/mmc/mmc-controller-common.yaml       | 10 ++++++++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi              |  4 +---
 drivers/mmc/core/host.c                           |  2 ++
 drivers/mmc/core/sd.c                             |  2 +-
 drivers/mmc/host/sdhci-msm.c                      | 15 +++++++++++++++
 include/linux/mmc/host.h                          |  1 +
 6 files changed, 30 insertions(+), 4 deletions(-)

-- 
2.34.1


