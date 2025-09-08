Return-Path: <linux-arm-msm+bounces-72551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EB9B48A5E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 12:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6FF41B21B11
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A492FB080;
	Mon,  8 Sep 2025 10:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EZtIihRz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4265A2F90CE;
	Mon,  8 Sep 2025 10:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757328093; cv=none; b=bmxAgSViLdGEHNz5Iq+065SyjN2hbf6CSzZ5dq48VyD9zIle3XFLaJ537v/lZ94rpOIrEyW1y6rUIoe6lTVsqC3X2p2qeEZ6mHvgeVg+CiLeUn+Y6hcoFtUqbXg9vtmhQvlvwi8vMWlwvxLtjLMm1OacDNjskiWu00KB11kzrHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757328093; c=relaxed/simple;
	bh=v8eWaxnpVpapKq3qRJtlJeDU/5bKtRRJd0LjemMl1OI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S5i6ssDLQd7V8rVLIV+bfwu0TEzhKbZwQrlhgAkCKsTsBEq2m9dIs95jrP2u7iGRtC2fc4MoMCiXgq84Q6mOriNa0PtHIAeczqpNkWpzyZ3nwMdHxTwJ9xvqMRaqJsnT9KG5RqnMLKrgqeKgmxx7UDNiTVeCLxdWNsFvFy0D+2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EZtIihRz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58895MAM013584;
	Mon, 8 Sep 2025 10:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0i7c4bnBPCGVB23Go3MYH2lyL3WlYJGKYdK
	SZNNqvXI=; b=EZtIihRzmdfMxX0TW/DPwb0zWGX5AU8HaLI7Wvd3ANU/rSivkOK
	5jjlyIbb0h3SdId5KczePeHnHuzAdEOOeKlk+ov9cJbJkaLW2BalO/OZpf3NETvm
	9/7MYmejZ49zFgbzzZ458OdZ5ZvFLDNjHwqCtQSNVYbWTXBnFaJVflcWW2JCzdt6
	eK2u5Fkgl9Qmeml3zf66OUbg43XraM8VX22jpuzOq8ynJvhG5hwzt4aTBdPYupF0
	TsJPCJAcoP9xgZDSDg4je0oEjOSPTcgTruDkWMIBK7Pd3ZwOW7EE42TyiLyCptZ7
	WxvZKx82llHLK1ivS68LN7NIPjpt4gG1xng==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws4dpm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 10:41:28 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 588AfPZO011929;
	Mon, 8 Sep 2025 10:41:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 490e1kh0p2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 10:41:25 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 588AfPfE011918;
	Mon, 8 Sep 2025 10:41:25 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.147.242.251])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 588AfOtA011917
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 10:41:25 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2339771)
	id EA12D5C5; Mon,  8 Sep 2025 16:11:23 +0530 (+0530)
From: Sarthak Garg <quic_sartgarg@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sarthak Garg <quic_sartgarg@quicinc.com>
Subject: [PATCH V6 0/4] Add level shifter support for qualcomm SOC's.
Date: Mon,  8 Sep 2025 16:11:18 +0530
Message-Id: <20250908104122.2062653-1-quic_sartgarg@quicinc.com>
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
X-Proofpoint-ORIG-GUID: EfIYNRkBTGai_GXVWOPCbNGuQHqBGKhi
X-Proofpoint-GUID: EfIYNRkBTGai_GXVWOPCbNGuQHqBGKhi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfXxfboL/XoTlk0
 /Pj5DIFSD8Zb5RywwEFrcWJ+/UnlM1U67BjGamlgvrb0pNbdm6kHSFMnIMGXjyG296+l2JMiz6g
 4PH5p0Swzv3eCCbozm08pnWRvw3U4XahCMkB7QnGnevqqb5jhuQEhUei+8a65qT75KX9IGzX+O/
 EJ8DuCfHRq9rlgOlSyGZB7bY9heM/WEFYpK60c1MiLxslKlsux/RsJ9xXlUKPq6i/kCLyPbLxVH
 TEQRjNKBNi8pw5UQ/2+4RhIy341QP6AOMqjG6U3O9Wnaz+LCvLNe7jjlRV/reGpkGogu3J370Sz
 CTcajrZw7tS1OMkeWRaHf4brl457RbWVsHrxIRoAKp7P+9YvvIuls3qpEmUWasnSlcR99UH85Ji
 avjBNVR5
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68beb2d8 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=6QmveexZUsv2IF3pRboA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_04,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

Add level shifter support for qualcomm SOC's.

- Changed from v5
    - As suggested by Krzysztof Kozlowski reintroduced minimum/maximum
    in dt bindings and avoid repeating constraints in free form
    text.
    - As suggested by Krzysztof Kozlowski/Konrad Dybcio update commit
    message reflecting discussions and previous disagreements.

- Changed from v4
    - As suggested by Krzysztof Kozlowski Renamed the property from
    `max-sd-hs-frequency` to `max-sd-hs-hz` for clarity.
    - As suggested by Krzysztof Kozlowski remove min/max constraints
    and add default: 50000000 in dt-bindings.
    - As suggested by Konrad Dybcio moved max-sd-hs-hz property in the
    SoC dtsi.
    - Retained sdhci-caps-mask in sm8550.dtsi for now and will revisit
    its removal for future targets after thorough validation and testing
    from the beginning.

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
  dt-bindings: mmc: controller: Add max-sd-hs-hz property
  mmc: core: Introduce a new flag max-sd-hs-hz
  arm64: dts: qcom: sm8550: Limit max SD HS mode frequency by default

 .../bindings/mmc/mmc-controller-common.yaml       |  8 ++++++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi              |  1 +
 drivers/mmc/core/host.c                           |  2 ++
 drivers/mmc/core/sd.c                             |  2 +-
 drivers/mmc/host/sdhci-msm.c                      | 15 +++++++++++++++
 include/linux/mmc/host.h                          |  1 +
 6 files changed, 28 insertions(+), 1 deletion(-)

-- 
2.34.1


