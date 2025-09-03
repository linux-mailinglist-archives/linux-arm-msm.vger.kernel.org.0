Return-Path: <linux-arm-msm+bounces-71750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3679B417C9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 10:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46E2E7C3DAA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 08:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642E82E92A6;
	Wed,  3 Sep 2025 08:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JKeV1l81"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCF32E7BC9;
	Wed,  3 Sep 2025 08:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756886666; cv=none; b=TGadPocjxD5dsAJKGhFZkaJc8aIVRGX+CQ1ZQVnUs1aDEdVLUe5wMNUOGIShvMuNDFYhnzvR5kUp2n/x9gduHs5btpcy8n92bv2hYZymMnS+g2Y5WhruIV4TMNr9t2UY4IQtbue+1NYAk55S+n4w/PLEIXtOtFiePQuTqE9vVwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756886666; c=relaxed/simple;
	bh=9EvTWyqdXl4dZ4JO59oCSc+uHvtFSs8LF2Lk+iP3C2k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TKGG4b+DhYCSBjR00ocIyZ2QT22yMlyHFw7agH3kEAQ7kMf/VlJxXGv3CboZOlGg/1ro+dm2N8fymSfGQSUq03f75d+WyV4TrL6FImXTBXe0f7cGbr5e3LNDjzSuLKJGh4NiDR7KoEVcdW1+4oOVcgHP0RmoaVcZ06rqy64H2+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JKeV1l81; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832M5Ph018242;
	Wed, 3 Sep 2025 08:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+JoCm/VDAdv
	WfkngJd6WsSR/BeVdMNl7FsaHZEdFJ80=; b=JKeV1l81PUj4GKnSApKEchSK+kb
	IeboSLCh1RZE0tYtjMcVIWKHay8uX+aKxqhD0n4l2uXfgsHBS+wUjILLv4VWKbtS
	35yVPzSZ2cBiiAvEtqIanfANsuBIVVnnaNHd4vubYIeTssfI1mX0g7XNpezcEiCs
	Rrks0pdtq6gg5u/kVO3u6852nmcbDLrA+IsftulCYTRdFXkIIcAbuHWHRDXJMpBj
	PYb1a1ngbMEUXQ5jBkj1iRpumFiRC3O84SB7HVpmoinAkeIVMjvenL3JD+2cD98a
	ECGGj7ZiARPW8KQL8y0wT1POb2W52XgQbZjCBRxrioL5DecUnaZrkHwu0Jg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48wqvwcf43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 08:04:21 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 58384Hve011568;
	Wed, 3 Sep 2025 08:04:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 48utcm1wch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 08:04:17 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 58384HTc011550;
	Wed, 3 Sep 2025 08:04:17 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.147.242.251])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 58384F09011512
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 08:04:17 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2339771)
	id 2D3205CD; Wed,  3 Sep 2025 13:34:15 +0530 (+0530)
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
Subject: [PATCH V5 4/4] arm64: dts: qcom: sm8550: Add max-sd-hs-hz property
Date: Wed,  3 Sep 2025 13:34:04 +0530
Message-Id: <20250903080404.3260135-5-quic_sartgarg@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903080404.3260135-1-quic_sartgarg@quicinc.com>
References: <20250903080404.3260135-1-quic_sartgarg@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDAyNCBTYWx0ZWRfX6gjHgI/uhNIh
 wwspbmNQLvrvQ4AE1dVBzeioskBtJOVoGzc5zQeaI6unghbyFLRydgWG5fRqAb53RqCoOzcHbfl
 lQAOrvTsAsMty4CO7ArsFSH+WdOzvXduL3eJSU70fLCL2QK6WR0Fh2YPr7jpsd6jJEVXAcstygP
 RL95Slcp3XitS4Vbr40xU8QTl2bY0pK6S0NVyceqBIEccngmx9lfvqBYN0pp6eJeJYkk+RMQMbQ
 24mgdeDuvC3x6QO2np213FnDU6QFqJkTGW14pdGLtuanB9elyxVksvzv7r9xtCp4jf6e8a7woK9
 T+5igb4dCeI1vDQICZFSxqj4x0678lAwMEf1F0huM48Ouv+9hkoIMswpcBBfD8JEdb6s0HJI3Nu
 QnWiIk9x
X-Authority-Analysis: v=2.4 cv=WKh/XmsR c=1 sm=1 tr=0 ts=68b7f685 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=1rLooUvu2jBaxAzt8oUA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6McarRju3jBQbH0CvX8ieBSFIZW-8776
X-Proofpoint-ORIG-GUID: 6McarRju3jBQbH0CvX8ieBSFIZW-8776
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020024

Due to board-specific hardware constraints particularly related
to level shifter in this case the maximum frequency for SD High-Speed
(HS) mode must be limited to 37.5 MHz to ensure reliable operation of SD
card in HS mode.

This is achieved by introducing the `max-sd-hs-hz` property in the
device tree, allowing the controller to operate within safe frequency
limits for HS mode.

Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 82cabf777cd2..3692a3a49634 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3189,6 +3189,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
 			interconnect-names = "sdhc-ddr", "cpu-sdhc";
 			bus-width = <4>;
+			max-sd-hs-hz = <37500000>;
 			dma-coherent;
 
 			/* Forbid SDR104/SDR50 - broken hw! */
-- 
2.34.1


