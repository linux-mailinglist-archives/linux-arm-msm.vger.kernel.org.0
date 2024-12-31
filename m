Return-Path: <linux-arm-msm+bounces-43726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FC19FEDD1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 09:14:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12B083A2AA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 08:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA56194C6A;
	Tue, 31 Dec 2024 08:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fsyRAcJm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC70195962;
	Tue, 31 Dec 2024 08:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735632751; cv=none; b=QsDCagf7Rtky4+/iblN+EqG680OPasuJ2x7s8Y59efpdIiaydcmI+WzHw1RR/xe+uO4Uftw59LOaaL9VrbJfTRWfojMyi9VmNeunVgn+pD36+qK5cwf3HyTOyc+rfYewjb+2ew7ndHR0WP7mb5Rg+6NaaKyRtcBNMaMpZFSIRYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735632751; c=relaxed/simple;
	bh=SsFNDUQK3rf9whZUJypaamDXORWwtIu7HnpgJyyb+Qw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SZ5tREyNp2ug+okjIuSEDZNU/VoFubg8bX0qyhuA8VIRKKONAF/iC1+O/XkfShRD7OID0reIwvu3n4Q84upU5PPQVTOJG4LZPgy+kNPfYFMvp3L2rPmxIcKEjXCWC1vwknDI42x6BF3O0AUZR2R/ly/x/1zJcjsyBkfEyxXMZYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fsyRAcJm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BV2kiew032233;
	Tue, 31 Dec 2024 08:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CdVLY+YR2L9wUiS5wOSi8gIeY/xKNwquWv4xkMrMjqY=; b=fsyRAcJmS+rlr7KD
	vy/2rJgsXTs7So8edHy9KkYwqoPiXlT32JmoHe3OpTjCqNPcJLUd41ZUhFaF3OrU
	9aYtEpKOsWrE0wBo2qNi2wHR+Tl8+kY4yLAq+RmPUq5aQA2rcNXEnBCtI928WjsL
	ljM8j4hfkUn1JKSseS+tC6YxCKt9MyXkVPPa12jULQf4UZ6UPes8zcr4hmK2OYkN
	8D8U3iuoo9I9kDPU4Ejl7noPA90KMBnFTf5+CdRbDAhnr0l71qYk2ks00DlMH0+I
	o9DN8iyndMby5TN5vciQ8kq9u0kKfXL45y+pxK1pItPSAzqxR2FMmhaKsW8YVP0D
	ptWW9Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43v84jgmcd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 08:12:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BV8CO2Q012690
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 08:12:24 GMT
Received: from hu-prashk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 31 Dec 2024 00:12:20 -0800
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
Subject: [PATCH v4 13/17] arm64: dts: qcom: sc7180: Disable USB U1/U2 entry
Date: Tue, 31 Dec 2024 13:41:11 +0530
Message-ID: <20241231081115.3149850-14-quic_prashk@quicinc.com>
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
X-Proofpoint-GUID: pj4D0X4irwSRWEGfOJet-yW2OyVIM_YK
X-Proofpoint-ORIG-GUID: pj4D0X4irwSRWEGfOJet-yW2OyVIM_YK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=388 bulkscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412310068

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

2. On QCS6490-Rb3Gen2 Vision kit, ADB connection is heavily unstable
when U1/U2 is enabled. Often when link enters U2, there is a re-
enumeration seen and device is unusable for many use cases.

3. On QCS8300/QCS9100, it is observed that when Link enters U2, when
the cable is disconnected and reconnected to host PC in HS, there
is no link status change interrupt seen and the plug-in in HS doesn't
show up a bus reset and enumeration failure happens.

Disabling these intermittent power states enhances device stability
without affecting power usage.

Signed-off-by: Prashanth K <quic_prashk@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 76fe314d2ad5..3daff0ca152f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3064,6 +3064,8 @@ usb_1_dwc3: usb@a600000 {
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
 				snps,parkmode-disable-ss-quirk;
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
 				maximum-speed = "super-speed";
-- 
2.25.1


