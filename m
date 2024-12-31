Return-Path: <linux-arm-msm+bounces-43721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A10509FEDC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 09:13:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27FFB7A17FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 08:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156951917CD;
	Tue, 31 Dec 2024 08:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QkBUJ1xi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7415319DF44;
	Tue, 31 Dec 2024 08:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735632729; cv=none; b=NrIH6ak2rsn7Tni/LPRVRmgqBgDBBb+WZVSPwlLei/914IUwzPWlxzAEiu7ItX+cBPUIpaktp0R/UPewDg5gwfAr3ZCJ/mbzK+bcSdFoYzh+lurXjOmiDFRJsO84e7Rj5xjNJHQepkMBj8X5iQX5BqYGD9tkNGjPc8si4BdGnpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735632729; c=relaxed/simple;
	bh=Q4WPzdroPvaY0coseUDypYdIVBo+f72E+TiQ33Sfn60=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rz4hi8j7M/IG4SbPpGP5pZto2LWzhNRKoD8rFDeWYR9l4W4/aNwtPhLia8O7KaiX/72asug5pQGwSztuodYPQJaetWUUvhyrafw+ow4RlNA0ycRQnYG5F6Poj3SeuBYT338YMGd1YyUFrLpqwc59QdUq6XAqBoevPkKtSUGGsIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QkBUJ1xi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BV5n50h010219;
	Tue, 31 Dec 2024 08:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eqZKcIKsw6etvsTS3JRPy88jPNe2gAA8bDCiZoWNv50=; b=QkBUJ1xiA3nI9yDb
	AU3yRAEvwL0/3tQmYpdPK/6tdKEHFc94B3KUMNPQZtEPKQxeZIxYwwtg8mZMAzug
	dTE5x8yLN+Df3o7nHr3U64iYCQGhosI3Srl7fE4hbrGthrokBb9dGsMRnI5tGzVi
	doLLr9KOcj+4434dM3Ypm1YhWV5TJQrvlNZ5vjeIwCoPnn7tqKeRW/dmRmVQatMD
	AqKoXDjbqKdswxm9hqp0iu4WB9KsEaAvKOomYQqZH1nQv45ctzxE10gozNObTs6J
	BSy5nniyTgck8kPSQq1Yk5eu404TiGiMYVm4d38FiGczb/zXw1Sw2lSfc6DQAI7F
	xYap8A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43vasy89m8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 08:12:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BV8C3Ju001462
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 08:12:03 GMT
Received: from hu-prashk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 31 Dec 2024 00:11:59 -0800
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
        "Konrad
 Dybcio" <konrad.dybcio@oss.qualcomm.com>,
        Prashanth K
	<quic_prashk@quicinc.com>
Subject: [PATCH v4 08/17] arm64: dts: qcom: sa8775p: Disable USB U1/U2 entry
Date: Tue, 31 Dec 2024 13:41:06 +0530
Message-ID: <20241231081115.3149850-9-quic_prashk@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 0ZD2pWs0Rq2A3pNlzWDQd9s2MoLskB_F
X-Proofpoint-GUID: 0ZD2pWs0Rq2A3pNlzWDQd9s2MoLskB_F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=525
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

2. On QCS6490-Rb3Gen2 Vision kit, ADB connection is heavily unstable
when U1/U2 is enabled. Often when link enters U2, there is a re-
enumeration seen and device is unusable for many use cases.

3. On QCS8300/QCS9100, it is observed that when Link enters U2, when
the cable is disconnected and reconnected to host PC in HS, there
is no link status change interrupt seen and the plug-in in HS doesn't
show up a bus reset and enumeration failure happens.

Disabling these intermittent power states enhances device stability
without affecting power usage.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Prashanth K <quic_prashk@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 9f315a51a7c1..530fea25af55 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -3411,6 +3411,8 @@ usb_0_dwc3: usb@a600000 {
 				iommus = <&apps_smmu 0x080 0x0>;
 				phys = <&usb_0_hsphy>, <&usb_0_qmpphy>;
 				phy-names = "usb2-phy", "usb3-phy";
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
 			};
 		};
 
@@ -3500,6 +3502,8 @@ usb_1_dwc3: usb@a800000 {
 				iommus = <&apps_smmu 0x0a0 0x0>;
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy>;
 				phy-names = "usb2-phy", "usb3-phy";
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
 			};
 		};
 
@@ -3563,6 +3567,8 @@ usb_2_dwc3: usb@a400000 {
 				iommus = <&apps_smmu 0x020 0x0>;
 				phys = <&usb_2_hsphy>;
 				phy-names = "usb2-phy";
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
 			};
 		};
 
-- 
2.25.1


