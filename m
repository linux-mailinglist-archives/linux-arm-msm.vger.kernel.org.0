Return-Path: <linux-arm-msm+bounces-59210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35351AC219D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 12:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 275297A5EA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 10:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E8222A7F9;
	Fri, 23 May 2025 10:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="brV84Ids"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92590223DD0;
	Fri, 23 May 2025 10:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747997879; cv=none; b=at1BkOThxfmG9/pCV1pX/FNFJAmWKuYu0HIatJZxNmefy/PHBfqeAW5bHiac+TGB29esqhOpnlBiCnu/8aACFFuo7iIvZftzg4u/cF6c0mRcad0QjHWu2FcmbMGOfDLt3Dp34PiU6tQW4N8uHlF9pfuQA2hK4PZRjYKvT4rzl1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747997879; c=relaxed/simple;
	bh=3m9qZGs0/XGx2T6ilud0+WYsHz+ELiOEiiRaVZdVzYs=;
	h=From:To:Cc:Subject:Date:Message-Id; b=X3SGznGo58QRqUbHF9uGxteaC5hxtFW9Af3eGeSYgqjZlriwif+l7AxjnLGL5P47ENGlAgrlS0wCJDMY9mUB5fIs8Q8OnRuZnt6zHZcVRI10Sbi/RuEMu0pOjWhNG0MwMSUGAGZeLE4WDhnSU+59zelIHVGS2ivA2ANgt6mblzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=brV84Ids; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NACJjc013417;
	Fri, 23 May 2025 10:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=h1uKF2ahr36O
	KQvqCB+048QOjzG8ukHKkNOssQlG2Ac=; b=brV84Idsf+veg1sqZ/C7XL6KQrH4
	J0NrrayeCpmb4SvjGILFoXYPJS9Uidkkmghzw0RnSj/UvnXEcavrWO7hy1I5KPv2
	IJd0uFaXVJoAWRprbUSoIkq60lifcXoW7GFqnTuPDBvLgJhgPR6l+OH8XdK8lYpU
	HCYpGo0M+J+pHCffqeZjfM5JRjtbBrqpqKBbD/Gc1rxTUaE/wTG/L0OgGl0A/4qG
	XfbcL+V/0nPrx22QI02oMZCeE1zHyj2B71zo7XBaT29JyGT31I+Zb6u87Tkl+mrt
	1TA3A0Qkj9lVhjU425j8MzyQnJcJK0ljZ4qSkjQ8lrMged4bvDXPSFgTJg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5hy4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 10:57:52 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54NAvmxw027494;
	Fri, 23 May 2025 10:57:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 46syn0udn0-1;
	Fri, 23 May 2025 10:57:48 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54NAvmvD027488;
	Fri, 23 May 2025 10:57:48 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.213.105.147])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 54NAvl76027486;
	Fri, 23 May 2025 10:57:48 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2339771)
	id 4C7A4608B7B; Fri, 23 May 2025 16:27:47 +0530 (+0530)
From: Sarthak Garg <quic_sartgarg@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, Sarthak Garg <quic_sartgarg@quicinc.com>
Subject: [PATCH V2 0/3] Add level shifter support for qualcomm SOC's
Date: Fri, 23 May 2025 16:27:42 +0530
Message-Id: <20250523105745.6210-1-quic_sartgarg@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA5NiBTYWx0ZWRfXwkOKdj8mg+de
 CnybNhJI8TH6tGDVLDozJldmk74oTJCjTOSvoiw7lGsnmECxq6LfSMhE6TgwKHBOGsvY0GkeTWh
 bITcTwOqA3ew4UKmi4gRtka8Ti2vRoDEx1tYcexgqBuGXL1um4Aue4WRz61OHRlgn/Pp61dMfkM
 9ih8aYtqTqKiAzyoQoJ7DvXm6zNUQYdLa83JNIL5ojdSRvQ/U/1WC6WJKvmor7eXwH3sTLE4YdY
 OJW+K4Ko+qeGowMwo1WN0JHzYBy5eLrwSmPNLM8u2hUvRkZ58ano8ctYEFuMacqsL3g/no2VsEN
 e4uOrygJHQoeg6CvE58WU+yd5EqdNGtT+nXJ7Iu263W5YUCF8DMlGiyRmlpUnHDh2w5NR8qSFzd
 bL0y+0v7coIqeCKw3zPM78hJppezKAq+KSPOtIqlJoFKtEuFfEcjrPUuqSr/uBLuQyqMQi/Z
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=683054b0 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=sREu7M-93A9GbA9S1IAA:9 a=zgiPjhLxNE0A:10
X-Proofpoint-GUID: KwBTpqDiSn-3Ld9LmqaVyLiQw3qq0xHX
X-Proofpoint-ORIG-GUID: KwBTpqDiSn-3Ld9LmqaVyLiQw3qq0xHX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230096
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Add level shifter support for qualcomm SOC's.

- Changed from v1
    - As suggested by Krzysztof Kozlowski redesigned logic to use
    compatible property for adding this level shifter support.
    - Addressed Adrian Hunter comments on V1 with resepect to
      checkpatch.
    - Cleared the bits first and then set bits in
      sdhci_msm_execute_tuning as suggested by Adrian Hunter.
    - Upated the if condition logic in msm_set_clock_rate_for_bus_mode
      as suggested by Adrian Hunter.

Sarthak Garg (3):
  mmc: sdhci-msm: Enable tuning for SDR50 mode for SD card
  mmc: sdhci-msm: Limit HS mode frequency to 37.5MHz
  arm64: dts: qcom: sm8550: Remove SDR104/SDR50 broken caps

 arch/arm64/boot/dts/qcom/sm8550.dtsi |  3 ---
 drivers/mmc/host/sdhci-msm.c         | 34 ++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 3 deletions(-)

-- 
2.17.1


