Return-Path: <linux-arm-msm+bounces-42632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E42299F62EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 11:29:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4246189273E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 10:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C724619E826;
	Wed, 18 Dec 2024 10:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n9BKgOfz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADBF19DF62;
	Wed, 18 Dec 2024 10:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734517678; cv=none; b=bq80CTITAsuAmAtkd5Kk7tAHw9g9rcHzX7tMHbn1jwaK4tWrJU+AYt7s1vOIkh4asa9pJoEBuEtN5fwAyG++CdZlrJonsZHL3v7tjwXFMJLxr0nAF13/F41kUDmUJnwK9oiCuM+I1KX4Kf7ylkafAw6mBLxcw9e8/sg4pTx0OgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734517678; c=relaxed/simple;
	bh=U6CQUSyogKoUDhkWEP3+3ErBqWVBRxEc5mlu801S62w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u0HgAjjYDMW7as/7lGuGE9mvA1/gNbHb3fGj0ozhWzagez9Pjgo55pdIaMSPkW67zIHEg5mSFOWGEeYml4s2rV0khvXCuVk7roSQhh3MDj2yPr7da604v+KCn8H/I3uRzI4a8FsQnVfOKmJSIj4dY+xPBVblpksfSdbvc950D7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n9BKgOfz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI6Vfp5024955;
	Wed, 18 Dec 2024 10:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IkLVGNOBiQZeKLXP7UfVNDFl2RU1pgxdMn0hN6sbQ7A=; b=n9BKgOfzRoisjm36
	tfKwCzoid8Z0zcR9CASLPD0yHJ+a+gHPM7O+8vjE0bT7Ku5e9fPVQ+R8cNsO6NkH
	Sbuuw3Ac+LXZipYYVYYJ/P/zzteD79Y4+dyvKG3BzWGK/zmRgn3ap1Ms0tXziN80
	T8zFqsUf6aJPD7eJUPH+KI+neaGSeYhbx2Brg/ekJ68XWmHoAPMo4ilFc73n4nr+
	VmziX8c2Sd4M0nMgvRjVngVIyClqcxtkfq2h3BoALR8dsQGH2zImv2YBfLz1Bdb1
	75KtkgghK7r4BW4u4CkV3CFkEJulIog3g0Ul2hHy9RHvn9QF9zv0YzlNrKosXRr9
	yYyxRQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ks6ygjde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 10:27:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BIARr17019323
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 10:27:53 GMT
Received: from hu-prashk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 18 Dec 2024 02:27:49 -0800
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
        Prashanth K <quic_prashk@quicinc.com>
Subject: [PATCH v3 04/19] arm64: dts: qcom: Disable USB U1/U2 entry for SM6125
Date: Wed, 18 Dec 2024 15:56:52 +0530
Message-ID: <20241218102707.76272-5-quic_prashk@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218102707.76272-1-quic_prashk@quicinc.com>
References: <20241218102707.76272-1-quic_prashk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PR28a6QWrnS28lY1LNurNH6bMZgSCp0E
X-Proofpoint-GUID: PR28a6QWrnS28lY1LNurNH6bMZgSCp0E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=284 mlxscore=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180084

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


