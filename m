Return-Path: <linux-arm-msm+bounces-43717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2579FEDB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 09:12:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23B431882C02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 08:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2831990C4;
	Tue, 31 Dec 2024 08:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NRL4Bng7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C52D192D83;
	Tue, 31 Dec 2024 08:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735632711; cv=none; b=HOeQxrHWPinPF+WqHNc+rNvrP5gsgU4bLZbBFrtGueS59UL39i3DMYgVIR4zB3Ki/YDcNMSSRwe7O6Hyp5wp4zj/Zw7aO76t8Kpo9ZhUwNhrUadjiOn4qfQKcmpMP6P6nwYdWpn21jQB+GDPlu/lgB3UBhHhGne+vniw2gYoTCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735632711; c=relaxed/simple;
	bh=Gd2MCqLAu42L4IyPd7CyVs1iesz1Wj77k9m8YeSbjD4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IhvkhifWhA/yLlh2QG31Nqd5e9LtytoPohdy+FmmeWgAf/PXPB0EWYy3VAx2FN27eafWRLAVY1fLkqCkylxecxgPuhFaP40yIDrx4W80jna7ktTrcBoXIWiiF0ujRuYCbiedUqxaLqT9nE8l8rk+uh5lLGXu7T08MupBCGtjfVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NRL4Bng7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BV5n0PP010145;
	Tue, 31 Dec 2024 08:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iKJ5H1h0H9uRQYFkk1DEJWuI+RA9ysNrHRRIdw2peMs=; b=NRL4Bng74hAKtr/y
	tj0rWQ2erXJigsmHhJM5fytY5cZiPdbTz470Dm0j0jh4WHRaO7AsCXWzNrkcL+ee
	w7AdeFrFM8sBZdyeGsBwUR9SU75gjnDF59ErOhP6rcXrLEuI7htZImHaZmsGEdCr
	gaizFesPbXxORDCWik4ZDrzZ/GoCsHCq5dQVyuhAGJPabZ+36fso3/pJEYRrFfsG
	rvxOG0BpeRbWFWGk9pGBIVya4WfIsFKvhve/x/VF80lOGlhnpQhx2a1/JOLjD0SF
	0DxThUBBRU3FZCyqVBlmk88HELM3QrZTFp9vupfqANhn5i5R8ro7vs3NdYBi2pYJ
	qOqcBQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43vasy89kd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 08:11:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BV8Bj7U032386
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 08:11:45 GMT
Received: from hu-prashk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 31 Dec 2024 00:11:41 -0800
From: Prashanth K <quic_prashk@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Kurapati
	<krishna.kurapati@oss.qualcomm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <cros-qcom-dts-watchers@chromium.org>,
        Prashanth K <quic_prashk@quicinc.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 04/17] arm64: dts: qcom: sm6125: Disable USB U1/U2 entry
Date: Tue, 31 Dec 2024 13:41:02 +0530
Message-ID: <20241231081115.3149850-5-quic_prashk@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241231081115.3149850-1-quic_prashk@quicinc.com>
References: <20241231081115.3149850-1-quic_prashk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _PSy1tNSdWg3ovyyGu_Z76cUwwG7MJv-
X-Proofpoint-GUID: _PSy1tNSdWg3ovyyGu_Z76cUwwG7MJv-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=370
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412310068

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Disable U1 and U2 power-saving states to improve stability of USB.
These low-power link states, designed to reduce power consumption
during idle periods, can cause issues in latency-sensitive or high
throughput use cases. Over the years, some of the issues seen are
as follows:

1. In device mode of operation, when UVC is active, enabling U1/U2
is sometimes causing packets drops due to delay in entry/exit of
intermittent these low power states. These packet drops are often
reflected as missed isochronous transfers, as the controller wasn't
able to send packet in that microframe interval and hence glitches
are seen on the final transmitted video output.

2. On older targets like SM8150/SM8250/SM8350, there have been
throughput issues seen during tethering use cases.

Disabling these intermittent power states enhances device stability
without affecting power usage.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Prashanth K <quic_prashk@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 17d528d63934..2da6466b2029 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -1209,6 +1209,8 @@ usb3_dwc3: usb@4e00000 {
 				phy-names = "usb2-phy";
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
 				maximum-speed = "high-speed";
 				dr_mode = "peripheral";
 			};
-- 
2.25.1


