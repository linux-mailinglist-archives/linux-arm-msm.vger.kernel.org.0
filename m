Return-Path: <linux-arm-msm+bounces-58924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CBEABF736
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 16:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1725116BF8B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 14:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C761922EE;
	Wed, 21 May 2025 14:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IKit6WtK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9413418BC1D;
	Wed, 21 May 2025 14:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836502; cv=none; b=EEr1PRGYqOKp6U30PFX7thEV+wVUaYAmUFy90tdAzxz6tFgDSSFC8C6az4lHNObgocOwPW+0ZIfrsgxAVNpsgCHBqaTM/oSAuDz6EdDUY4HaDKfMjDt7P4RZSlZEl8U6bDmB2QZYSOoY9VonR3JnAc4uMWmHdWdxAV8ooUJTaAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836502; c=relaxed/simple;
	bh=IlwChhmhnVnArBXXCz+PVtUJxHZNoO8Om+O0dmOM3G0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MiMeEvrRUPEHE6IV+szdhKvxfF8aBBO5RCAwSRsgbwnal80t2QxuauQD0h/qk6K4oHHArPqyroNwuZD4qLMEyZv4jp4uSIf5tUUdBJm85dzhqAxR5W4e5jcCOXivPh3ZFU69ENlPhE9rh0zIzvSa6abEoY+FNqUAlTXle6VXERI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IKit6WtK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XMrV011357;
	Wed, 21 May 2025 14:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bV0GZrbvCZf
	BMnm9NfulY5ST74ZJcNZFIczEyanYta4=; b=IKit6WtKA5jpRy2525xzVF21qps
	LBNZ8XulfUu7Wp1/J51+NZV2zKN+pqmWz35ixIajK/EhjuGuHrgH+M+2yaIJqJwB
	yQX6l1UT/qPo5Eur+rwhzXwAVUx2NbQVL9G6lYEf/1efdswyCZ181UNaNcpTByn4
	ZmW6cHgGzbgN0T59+jq3lSFW0UFnEvTejRHZ5CSYaltqGqY1Bi8gkc5iuJ0hY/Ub
	Vc3I2NG1CiWNn5MbnUYjRS7t5+IbqXLecUZveTHhhRWtCTLiS9MZk3KcNiOw9zo7
	vINVrosNP9MIYO+sNYZkDaLqVe9m607eIPItGAM5cKe4yYfruE8pbGEfaRg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb35cx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 14:08:16 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54LE8Csf005953;
	Wed, 21 May 2025 14:08:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46pkhmjbb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 14:08:12 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54LE8Cr6005942;
	Wed, 21 May 2025 14:08:12 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 54LE8CrP005932
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 14:08:12 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 1CFCC5C9; Wed, 21 May 2025 19:38:10 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        kernel@oss.qualcomm.com, Sayali Lokhande <quic_sayalil@quicinc.com>,
        Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v7 6/6] arm64: dts: qcom: Add UFS support for qcs9075 IQ-9075-EVK
Date: Wed, 21 May 2025 19:38:05 +0530
Message-ID: <20250521140807.3837019-7-quic_wasimn@quicinc.com>
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
X-Proofpoint-ORIG-GUID: bTBBswIgwCosDZCxS7yCYMwjF6ZKlIHF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEzNyBTYWx0ZWRfX69RMe+5Ht6Rv
 fa4LSadkACbNzTUVFZptDxElMRXdtpzQrgku6eEXiVTgvkec5wrhoUMpKifYW3AvZm1MT4eq7Uq
 mL8K/zk9YQ8nes6lZComLNe+kjpr7sQ8ChXXQSh0VYdLeMfmrmKVMOUUmjDGP2Q6jGITF5k21YC
 WSxqSvHktDqkp13JPanwuUcqgVNjp1aIxLvqMXJdKYkHarxucgeNCFRha+StCVo5FIew9aAqGKt
 8Oq0jDnZwr15WuUwAOFPwotIEe/y3JYOgGrDkC9iSolbl9RsO30MO1Pqu4b+ykimMKFvjI0YUwP
 +1lSgyd3RO1shc9eJPA5rfbGjstnnMQcS9K/gC6C0/hWl72vUHvvGwYRo6/mojjojPtOlCweV2X
 n42etvJU6+D7Unh8wQXlFFXGpvo+mebenGeNY8/u+LV3gopi1pOSUzRXIXKCZKdojkfF81DH
X-Proofpoint-GUID: bTBBswIgwCosDZCxS7yCYMwjF6ZKlIHF
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682dde50 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=7MGQwjJPvtapW6ep8QoA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210137

From: Sayali Lokhande <quic_sayalil@quicinc.com>

Add UFS support for qcs9075 IQ-9075-EVK board.

Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 .../arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
index 30a36ffa40be..ba8a359d8fee 100644
--- a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
@@ -276,3 +276,20 @@ &uart10 {
 &xo_board_clk {
 	clock-frequency = <38400000>;
 };
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l8a>;
+	vcc-max-microamp = <1100000>;
+	vccq-supply = <&vreg_l4c>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l4a>;
+	vdda-pll-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
--
2.49.0


