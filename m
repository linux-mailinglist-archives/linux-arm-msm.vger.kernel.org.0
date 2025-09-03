Return-Path: <linux-arm-msm+bounces-71749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB76B417BB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 10:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A4FF24E4A36
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 08:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED842DAFAF;
	Wed,  3 Sep 2025 08:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MNRdnWVV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F66B2AD2F;
	Wed,  3 Sep 2025 08:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756886662; cv=none; b=edVkYBDCTu5Wk6C6KpPCgZfnN+AWA+IHjcF9O2Q3Q6x3y3++bcQepYYYmG7QkO1hmkKyteEV8kVYFybZARSkJJdlGFlqzZ9cY+W1u3n+N3e7wXzFj/KKe0DilrTlr3f3j3QLygEvgSWKSgq869vdYljS3us5e96Cwut4Wjmui8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756886662; c=relaxed/simple;
	bh=aR0TDSpNtuEfLnWLa+9zSda71tP1I3+TM0+GotbDAAk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nHPozTUAO6r7KbAxslE10T/sMON3nzQWNphH8ebYtkMFJ/27Q95xlTt7H7ndjOXdP+/ruPUqFR1j4OmrPKHv3YNuNrgNQoeluHMfGofUR0iXuszsJGAaXmkODxY6ujLsf+TY9lXUo+qFZOvdIUuVJDo34t53HQ/0xguXqI2FE9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MNRdnWVV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583226pq010160;
	Wed, 3 Sep 2025 08:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HKIvBLFtLHO8GRk8z1Qm4ReHYEtRmCf+BZX
	zNiJPLoE=; b=MNRdnWVV1NG6Vgd2BFcKR96IEatdTzKYlN5yZFZjsbVlR7UHBkM
	aTqkq/eGubGvon/XQAYPa6/YPMEk21atJt9DrXKa3Ruulv593i2fKdNqWQ7WD6rI
	JR4Hi39HqZL5aBGfpnTq0Trk4Mc2PsHWXuSBkL+q3ylJvoIZCyExCaHE2lXPCJ3y
	ToGmmo5ChC97/USx3i1AMT12LlLUL73Pah21GGOHfwj3jRHSpfvO7WVD0Hdu/575
	gwTa87HGQrBf3yK0JXeO1mdvniVjSxamJSD321a0nF84vrz9XxnFiZtW3ohrSUGh
	p3qghCNZ+as5hOGBnhRgrVEd2nkLl+73snw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0ejv2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 08:04:16 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 58384DD6011477;
	Wed, 3 Sep 2025 08:04:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 48utcm1wbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 08:04:13 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 58384CON011471;
	Wed, 3 Sep 2025 08:04:12 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.147.242.251])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 58384BFb011468
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 08:04:12 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2339771)
	id 2B3A55C5; Wed,  3 Sep 2025 13:34:10 +0530 (+0530)
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
Subject: [PATCH V5 0/4] Add level shifter support for qualcomm SOC's
Date: Wed,  3 Sep 2025 13:34:00 +0530
Message-Id: <20250903080404.3260135-1-quic_sartgarg@quicinc.com>
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
X-Proofpoint-GUID: AJnqSLgNke9OjRRp-lsSFBrC4_itiUiI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX7BZlyLnAHFN+
 egzi+OCQRtX/dR9ncLbpoBwOA7ueZWUChDhBm86bxjN0/YTCZz8GbkdIgAmnaGTiHm2yq7ft0JS
 xWp6VjkSs9xLc4/46TVLsDISJrJccbXNQU7u28Ldum1t7uE5NFuwkuOcClCEtfSZBK6AfWOXXq5
 eKicE+nhZ5nkjDwopSJZ1XTvawPUIjpd4PrVzdVORLoMNz5iXN9E6a6AXPN5fIO8buDbIh3MXxh
 Slh+lpYeBPcjcBNMlnFyDXaDWsDnyiKIlegl/KVrbN3g0AVv6bH/KWa7W6IF8+d+pzenLrwurTY
 JSFCR4VoISGYVA7irJBpvJ6Ol7zOoCQTSncC7G4HRy8gu1oe70xaDQJ7hIKD8hka1rW70M8Xz1q
 NAdCa5aZ
X-Proofpoint-ORIG-GUID: AJnqSLgNke9OjRRp-lsSFBrC4_itiUiI
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b7f680 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=VSAuVPaz4pV-Ll8h3lQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

Add level shifter support for qualcomm SOC's.

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
  dt-bindings: mmc: controller: Add max-sd-hs-frequency property
  mmc: core: Introduce a new flag max-sd-hs-hz
  arm64: dts: qcom: sm8550: Add max-sd-hs-hz property

 .../bindings/mmc/mmc-controller-common.yaml       |  8 ++++++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi              |  1 +
 drivers/mmc/core/host.c                           |  2 ++
 drivers/mmc/core/sd.c                             |  2 +-
 drivers/mmc/host/sdhci-msm.c                      | 15 +++++++++++++++
 include/linux/mmc/host.h                          |  1 +
 6 files changed, 28 insertions(+), 1 deletion(-)

-- 
2.34.1


