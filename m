Return-Path: <linux-arm-msm+bounces-58925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F7AABF739
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 16:08:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1336016FA9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 14:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582F7194C96;
	Wed, 21 May 2025 14:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ffdd3EFk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940E718BBB9;
	Wed, 21 May 2025 14:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836502; cv=none; b=kcnIIcJsAfrily1s7cSnvTWmLI/+Phn0ArlBCQ/8EaCQSFOitMjFznGT+YOVXYEdeu6QyhlHGVqLAZIBZcsJC288BAsfB5hk+A/MNVj9xZ5MrFA1XvDL9kK/qORhWWtytF8Kc5TfnuRMJex0oJ5sXVJDwaVPwxfFScvEAaFtfA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836502; c=relaxed/simple;
	bh=DV19tb30r8uNMBVBFJPWWmkl/Guy4LrYaMlqvJI2+dg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nWv9A+kWovUbWNhlVsSZ9qWtPL+Le+OVk0xvwd0oCFJHMdTv03wCr2plgRXhpl++kGlOJ4fEyKwMNl+d3OIX5efsrANSVMwztYTEn8ew8tDv9fVKndhYx1lhrDN2Dp9+8MXb+NR/QrjU5mi3JbK7y07sk3EC/bwe8YHdRIKITcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ffdd3EFk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XmpH016872;
	Wed, 21 May 2025 14:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vW52XTr2Sss
	2g7scPM2QfcEaIok3w7q7M1+Sf9X5cYY=; b=ffdd3EFkfO3ICp9HQd7QWfllySw
	MLw90luHqmF+/299qRAQhHul7Zp8qmrJv9ZKPFNcfoIbeBBw+RAbxYN87WYH9Jt3
	i6EEJojmNWrIkyM4GwWoKBERBVuK8E6LZ3MoYncilmXoOi+yqaJCNs8iXcFLgIPZ
	3av9PU+xYgUKUQ3NKQhXRD80/gsDB0dXmXvupGvJ6KiBE8tzWLBbcN2XH7k9fdSJ
	RQJDIk6RFx0ZIk0b9t9QsIyqoI6i3S9Iil78zXQgotDirshiN9z7wXqtFU25OX4e
	PsTJW212pRaOmgTKD8x22nH8ij4viczTO4GPZpb04bPL9n8ecxtZXkqJGdw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9u6tj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 14:08:16 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54LE8Cpr005952;
	Wed, 21 May 2025 14:08:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46pkhmjbb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 14:08:12 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54LE8Crw005936;
	Wed, 21 May 2025 14:08:12 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 54LE8CwZ005933
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 14:08:12 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 1934F5C8; Wed, 21 May 2025 19:38:10 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        kernel@oss.qualcomm.com, Rakesh Kota <quic_kotarake@quicinc.com>,
        Sayali Lokhande <quic_sayalil@quicinc.com>,
        Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v7 5/6] arm64: dts: qcom: Add support L4C LDO for qcs9075 IQ-9075-EVK
Date: Wed, 21 May 2025 19:38:04 +0530
Message-ID: <20250521140807.3837019-6-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250521140807.3837019-1-quic_wasimn@quicinc.com>
References: <20250521140807.3837019-1-quic_wasimn@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682dde50 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=1ItHD1LXAAYENa8i-UsA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: n0KGI92k0YJUiT-M58uUw6spn007aZBD
X-Proofpoint-GUID: n0KGI92k0YJUiT-M58uUw6spn007aZBD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEzNyBTYWx0ZWRfX+RDy7WPQ3B+E
 NwsljSDwt8PFxD40x3x5ittz6rCvcseJZIC5tZw8xDCkjWmbS/Iu8tJOuiPrYV7uNVt+w7gTvz9
 ZoYFnLNvipMVYqll9t7bh5KJ/zViW4BHewAW5vU5vEV7tcjvqxe93OBOBXMIWniShIDdoCFsuAI
 r++fwE6vCYVkiuan/OsTwhkyx4v4gabXjN8ke3lEieKk1TR5nQYJ9kTwOfcvSpcxsREgBDeGj88
 NmvzZacDymApt2ZF8RuVad0c9hmR9+J3w/xORYs60YNlSVrGgbI5hmD2RLzkxoHdsRewJ4H36+U
 jW4qoUEPzEOJgH/Go23r2zPYhATcnCc9ynNpQenORh8ztqpx2742n3IBiduUpm3OYXyO1hubfU+
 KSdwg2Cwc2GRpAebfOxgYArB5GZUmb97Dw/uRrFruZgZRAA+4FvfNemUr08cxwAIOVVZttb/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=711 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210137

From: Rakesh Kota <quic_kotarake@quicinc.com>

Add support L4C LDO for qcs9075 IQ-9075-EVK.

Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
index dbc64496759d..30a36ffa40be 100644
--- a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
@@ -143,6 +143,16 @@ vreg_l3c: ldo3 {
 						   RPMH_REGULATOR_MODE_HPM>;
 		};

+		vreg_l4c: ldo4 {
+			regulator-name = "vreg_l4c";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l5c: ldo5 {
 			regulator-name = "vreg_l5c";
 			regulator-min-microvolt = <1100000>;
--
2.49.0


