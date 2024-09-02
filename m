Return-Path: <linux-arm-msm+bounces-30392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE52996850B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 12:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ACA4280D0D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 10:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A7B15FD13;
	Mon,  2 Sep 2024 10:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hOa92Dx9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD80913B2A8;
	Mon,  2 Sep 2024 10:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725273805; cv=none; b=kYLufEtVZUeuDlGZVB++5Anz7QZhxFXqIF5nmSA7oYwAplDF98I5mhkaZFVlu7GkoXdiYy5yxy5nKLTBMU3NrDAvrA/trfpGZqGROUlRligmdGMNA1MfOQJOMmIusYzJrr2LnTT3t3wf8R1uLIqGYMe4xB/1MZC8EQjz0mGA/i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725273805; c=relaxed/simple;
	bh=q5lfXAaNbvzzQSeMLC+CUltjU/oMV1zUF3qQtgKTbUc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BfsbpCSMSZKeOfjd4TSUxapB+q42MrPbqkLuR1GmUbWvgp6+BNSSKZaAKP6VisC90uG+yPdcEKRsApF1XmiIQgL2wpZiuE+7je8ZOxabL3+9tyoLsJNHViJfv6ZpJvkqmd/AdCKbYO+a1a9wNgWLS9aW92Z4jv5/XR/wt4EVR7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hOa92Dx9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 481NZmdx020414;
	Mon, 2 Sep 2024 10:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2nxOabKfuJEVJc2f7fFTLr6hxJkwXtxN9U5
	bfEmmFcM=; b=hOa92Dx9qIFUQyF/sYutRGxgEVsfSnm/gP5ZCd9UCbWVxGRFzax
	1pIdSi+GPC8WYZnWrhZPTCXR7MJo2pKP45JWa7a6FxCh+I5BAi2UiTge3kBpvA+o
	o+PhC4QPwfHy9KjHy+UMRUJx/Cbxt8JtXJdpXmejK1kMRWzf2W58VJw6eX29OIBx
	QJpPSk+TL9Yi2INxe6cUowWosNs/SKVNFfQfZaOlk+BOj/V6Wmmj3smdI0TCvGC3
	P9t7SfEJ+eBgZMh1EjE8oxA0dRmT9hVUb/7ywRYGXm9K3yS2j8Ecs1Fw4QFDvLfA
	EU8J2pgIksqKT+KiN9SMkoe/bWlHEEmKykw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41buj6va9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Sep 2024 10:43:19 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 482AhGXs004926;
	Mon, 2 Sep 2024 10:43:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 41bv8k9qah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Sep 2024 10:43:16 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 482AhGeM004920;
	Mon, 2 Sep 2024 10:43:16 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (cse-cd02-lnx.qualcomm.com [10.64.75.246])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 482AhFEv004912
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Sep 2024 10:43:16 +0000
Received: by cse-cd02-lnx.ap.qualcomm.com (Postfix, from userid 2370279)
	id 456C8BA2; Mon,  2 Sep 2024 18:43:14 +0800 (CST)
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        quic_kotarake@quicinc.com, quic_kamalw@quicinc.com,
        quic_skakitap@quicinc.com, quic_fenglinw@quicinc.com,
        Tingguo Cheng <quic_tingguoc@quicinc.com>
Subject: [PATCH] arm64: dts: qcom: sa8775p: pmic: enable rtc
Date: Mon,  2 Sep 2024 18:43:02 +0800
Message-Id: <20240902104302.3959670-1-quic_tingguoc@quicinc.com>
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
X-Proofpoint-ORIG-GUID: qSgAXK4NWHFfXReHEFsax6fiX4FKEYpv
X-Proofpoint-GUID: qSgAXK4NWHFfXReHEFsax6fiX4FKEYpv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-09-02_02,2024-09-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 mlxlogscore=542 impostorscore=0 suspectscore=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2409020087

Add RTC node, the RTC is controlled by PMIC device via spmi bus.

Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
index 1369c3d43f86..47d05b897d5a 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
@@ -132,6 +132,14 @@ pmm8654au_0_pon_resin: resin {
 			};
 		};
 
+		pmm8654au_0_rtc: rtc@6100 {
+			compatible = "qcom,pmk8350-rtc";
+			reg = <0x6100>, <0x6200>;
+			reg-names = "rtc", "alarm";
+			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
+			allow-set-time;
+		};
+
 		pmm8654au_0_gpios: gpio@8800 {
 			compatible = "qcom,pmm8654au-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
-- 
2.34.1


