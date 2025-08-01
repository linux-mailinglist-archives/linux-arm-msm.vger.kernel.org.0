Return-Path: <linux-arm-msm+bounces-67309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6462B17E72
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 10:45:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BDEB623A48
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 08:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23ACE27456;
	Fri,  1 Aug 2025 08:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mWucHn4c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F54E56A;
	Fri,  1 Aug 2025 08:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754037938; cv=none; b=ZZ3eWGq7m+IykTqzTwrESddsa0Ozi/WVR98Txx2B9cmZFik55iayiEO8yb0Zm9EgGSuzdmnrMCGzrL15B0i4EIjReon3d9rKW19jhNf34lGa+iblMKIQfDhEUcSeli7PDkZ/wHPtxpojplRmvh7nV5AVSKdjfdplSvlCOn0oJxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754037938; c=relaxed/simple;
	bh=53CXIjjipJvoRE5YjIFYA1vbsN3OX+CmaSPcp23/iww=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QItwHc0p3A+1BP9SZLouLxHw8aiY++xsI1LIPm6wIidCd/81pAFhyc3LLl0UGoDs8ty+ekaK4ogYd5b5LNRiDsJvRoTMCVG3QvmvZvxWPU99YVoC1o9/lX9aWSq1N8HZw1wlPu2Rfc7igMSTq20G8/2JBC6wMbVoNipHy0kNwJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mWucHn4c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56VNmVvg020327;
	Fri, 1 Aug 2025 08:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=q40+7nJL3GRFgrcv6retxxUNLSbQ+VR2TMo
	mWWntMqA=; b=mWucHn4ckKERrdy7oXMN1pXWHKv6Xz0jmfan2kG+DZZ18BG3LkA
	2WrkVGjDTuqO8VwHj4x4pBzqgRlyDqXrmrdHn+K13mpCQsj3CH9C9S+p7qov85RZ
	358kgH8+09682SfIiEgYp46XlFc5Diwdv2x7yQAQJ2deDISTo/6AZKld6tP/jBrZ
	DtGBaB2uQQCx8fLY8D81rb92roPo88ZWRfaIhv7XHgCjNKYBxBAt0arhHw2k/449
	bGIOCVjYNacU29PonJfK6oDtLqBH+7v2iSRjsa9EKSuKYppeES5TWTeKxV+yTEiW
	nP7kO9C67XL1T3ZGlJP5Ma/MnFca3XUi7eQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1atys6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 08:45:30 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5718jRHb016877;
	Fri, 1 Aug 2025 08:45:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4859bemgs6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 08:45:27 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5718jQX5016869;
	Fri, 1 Aug 2025 08:45:27 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.147.242.251])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5718jQpK016868
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 08:45:26 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2339771)
	id 6FC455C4; Fri,  1 Aug 2025 14:15:25 +0530 (+0530)
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
Subject: [PATCH V4 0/4] Add level shifter support for qualcomm SOC's
Date: Fri,  1 Aug 2025 14:15:14 +0530
Message-Id: <20250801084518.2259767-1-quic_sartgarg@quicinc.com>
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
X-Proofpoint-ORIG-GUID: TpKgz92ofiSmeUPeXWRFYE5n9mNrbThb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA2MCBTYWx0ZWRfX5TbJU3kbnR6L
 ZVu0TPtgME6mLiRc2Wgzl8cv6ZvEB1tMr0V/9dotIXrSFqb18miluxF4t7Y7CdyokQfNX5GgBZF
 tsKrw8fuxbSvurbNsK3SIcvbFZ5mQqMjQ0UWO9R5Wt7hXZv5w3MsPdbFfv+kGu+JT/XHA+9rh6S
 QffGXa1ltFkAxwUHwJTh6U3bOdFFqCi8Zfg4pOpYh0C/jXQVKVS228dgPhq2HblaTr1pm2ezns4
 7QTLeTckU1gU04L+nT31neFc4hRYiAUwXp56gX+Ql6ZfIPhGoXgNYq8kTo5//2fjSKza4q4znL0
 2YWBdQtJuHlG7h5l6oCqTnRjZ8cguXLhGlKppz54QS55N2Hpmh1qiOHLk4qcll7nkcdMoHMQ7bW
 6hOMd7VN+L6FOK3LvJp233sgc44VsW4whEd6T+l0aMGPPjt98hhClqnLcSZFMz2XufQ0w77F
X-Proofpoint-GUID: TpKgz92ofiSmeUPeXWRFYE5n9mNrbThb
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=688c7eaa cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=7dyTyeQR3BJvcbYslWQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_02,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010060

Add level shifter support for qualcomm SOC's.

- Changed from v3
    - As suggested by Krzysztof Kozlowski moved the property from the
    SoC-level DTS to the board-level DTS.
    - Revised the commit messages to clearly explain its board-specific.

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
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts           |  1 +
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts           |  1 +
 .../dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts   |  1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi              |  3 ---
 drivers/mmc/core/host.c                           |  2 ++
 drivers/mmc/core/sd.c                             |  2 +-
 drivers/mmc/host/sdhci-msm.c                      | 15 +++++++++++++++
 include/linux/mmc/host.h                          |  1 +
 9 files changed, 32 insertions(+), 4 deletions(-)

-- 
2.34.1


