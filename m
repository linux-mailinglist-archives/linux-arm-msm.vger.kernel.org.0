Return-Path: <linux-arm-msm+bounces-50487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7DBA549BA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 12:42:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 126193B4730
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 11:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E039420E6FF;
	Thu,  6 Mar 2025 11:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Uo43b6+M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0F320E32B;
	Thu,  6 Mar 2025 11:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741260867; cv=none; b=sTU7LZqFvLl5PyiOLTsG4Snb5w6YzKz0m6crkXAgOVueQpevIzHP3c+crikEDSsaGwfKmGmtyHgpVEzVLwRCyAp40LZ62y1rZ9tb57tZ38YfR06nbLDKLcDclZFqDbZWmasml3g3AW1QQ1C8oOHsLyxnS73l4jBNpIETc8puSk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741260867; c=relaxed/simple;
	bh=rwW+wVmO0GZtCL0AAvWT/a2oJMHmg0m4UxcUjLdVDvw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SoZ3Tg+wYQ8KBXpV9kwVy/D2t2sTzNc6sVwJ5lEWsISs6wf8vnl9NA0Gy/TVIXeOi2FhDcwRsLQhulS/eCcC7QWgJ5ZHe6ygi6S/7wewGDFkZ00p5sZaMTnpThGLkgxIi6Dy44p7VejSXBoPvKr7TtRxeWYl6ykNQAflv2QOfEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Uo43b6+M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5269VQQ8009868;
	Thu, 6 Mar 2025 11:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0e97DjrXeAEuFqYxH5w5Wx+iR6d8fIH+0eHGbB8JBo=; b=Uo43b6+M2xkSaNg8
	GD2J2lt+59gTnqpOCZFUo/7eoXRL4MjdRGKf9231hpBenAQnzNUeEwNlAZZGd2Jp
	jdliWl2HjwvgFV+VrP9SwzY+GhpBIu7O+sw5WmwDaFugTGcezhcyAHHVehhH24EU
	NLo4nDA/pFLmzLAAyc5LLZ8KU/ua0kGvy4FARK2V6aRMSQl4WxVj/ktHE7uYU6gj
	Hg4aFAEJH6ugBgJDM0tTOvrff1EOQQYKAzvkyczz95IX0RR2GhMEM/6EH497mEye
	30BPh4O2UYoRB/M2ao2Dvrm5bq6N3U9yY/rjNrSj2NQYEjdCLLghlzu7nu8BOKCp
	1oqG6A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6trucg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 11:34:23 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 526BYMgu021296
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 11:34:22 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Mar 2025 03:34:19 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/3] arm64: dts: qcom: ipq9574: Remove eMMC node
Date: Thu, 6 Mar 2025 17:03:57 +0530
Message-ID: <20250306113357.126602-4-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306113357.126602-1-quic_mdalam@quicinc.com>
References: <20250306113357.126602-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=HZbuTjE8 c=1 sm=1 tr=0 ts=67c9883f cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=3crLPPiErI15JQRwp_kA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: sVErtzt5rj6WNVTLLH5L1yBndQzVj66D
X-Proofpoint-ORIG-GUID: sVErtzt5rj6WNVTLLH5L1yBndQzVj66D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=643 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060087

Remove eMMC node for rdp433, since rdp433
default boot mode is norplusnand

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
Change in [v2]

* No change

Change in [v1]

* Added 'Reviewed-by: Konrad Dybcio'
* For full change log see - https://lore.kernel.org/linux-arm-msm/20241120091507.1404368-9-quic_mdalam@quicinc.com/

 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
index 165ebbb59511..fa7bb521e786 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
@@ -55,18 +55,6 @@ &pcie3 {
 	status = "okay";
 };
 
-&sdhc_1 {
-	pinctrl-0 = <&sdc_default_state>;
-	pinctrl-names = "default";
-	mmc-ddr-1_8v;
-	mmc-hs200-1_8v;
-	mmc-hs400-1_8v;
-	mmc-hs400-enhanced-strobe;
-	max-frequency = <384000000>;
-	bus-width = <8>;
-	status = "okay";
-};
-
 &tlmm {
 
 	pcie1_default: pcie1-default-state {
-- 
2.34.1


