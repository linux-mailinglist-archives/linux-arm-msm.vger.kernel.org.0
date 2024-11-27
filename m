Return-Path: <linux-arm-msm+bounces-39279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6389DA4D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 10:32:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFF49160346
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 09:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8507192B70;
	Wed, 27 Nov 2024 09:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P4y2TCd0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E53192B79;
	Wed, 27 Nov 2024 09:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732699965; cv=none; b=NzjUO5TeW5XWlF3Fwdr2Dnj8MgCohpbQEMGzfMaaHOrdUdgJVveYutJzeOZngyxQBU428VsPvBIDkHTTrpMHH04uVznnBh0WFzoe15KLihprT4iUpZGJWfwtL/Jqz30h7/PjboZgRZJ6RnUkrPH4jPbIv4a0MUvs5ZaexbE5gJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732699965; c=relaxed/simple;
	bh=FBw9HVozgfVKZtFYcBQA4Su42LkaqncDAcZ8xBi6Rpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=ljSQFdM+oxvc/71B1Z1uAe023sEyE23F8hFMOb97WRevDyO0MBfrsQTgayE2fL60VjyLsg8H/UsrGzCIWNVWqIxnLp4sbw1kcbEmQvhUgz0s9dmOlTOWCNXLwoaNR70tW8n2Fza3tCXsP2+CdWUeGMzEHsvEf8RMFwjAP3SEBT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P4y2TCd0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AR96xFw023533;
	Wed, 27 Nov 2024 09:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lopIUVwDrKphG6QaSe4vO1
	jusRE8iqpppJ0DQUcGOio=; b=P4y2TCd0lY3VFppO8bvdPi4d4SSpjYpiAzYyHt
	YELOcSZvnYvf4TMhkQRxeHt8LCC5Jt6CXV4DjTFCoWG++gI92A7/tUT22WCskzWi
	HtRN0aaJtGgPiXmRNv2cbxjePZBZ1mofShZpxmgNJfLuwDhv3voBBVKWr3GmUoG+
	Jc1OUeNxD34RSBK+R1aDaAfGmEpwAsJQRiPtuSNlQzgp6PBDZ9X7hIYEyXfTRsJ2
	JsyMBd8apLfOFWLxBMnN3IX4qMjotIPbHXiDbeO3dE012XuZ8ySPsiHMhhnlwmdw
	5XHxRkVvPJasl8rjtSgkfBT971UkZB8MQOQK0TvEpvpokzww==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 435bf5kmd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 09:32:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AR9Wdjl003524
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 09:32:39 GMT
Received: from congzhan2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 27 Nov 2024 01:32:33 -0800
From: Cong Zhang <quic_congzhan@quicinc.com>
Date: Wed, 27 Nov 2024 17:32:20 +0800
Subject: [PATCH] arm64: dts: qcom: Correct IRQ number of EL2 non-secure
 physical timer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241127-correct_timer_irq-v1-1-ce4309b655bd@quicinc.com>
X-B4-Tracking: v=1; b=H4sIACTnRmcC/33PwWrDMAwG4FcJOk/DVtx0KWPsPUYJnqqsgiZZZ
 C9slLz73PSy0y6CX6BP0hWSmEqCQ3UFk0WTTmMJ/qECPsfxQ1BPJQM5Ct5TgzyZCecu6yDWqc3
 o61pcLGXfEpS5T5Nevzfz7XjPJvNXofO9CYOkFDf6UD3fZNfSDmdOT7VznY6aNV66U06KC6HD0
 AYOro8UA70WiXXkR56GF7j5Z015sp/thcVvC/65dvHosfE7x3t67xuu/4JwXNf1FzrYG+YUAQA
 A
X-Change-ID: 20241126-correct_timer_irq-133e0a33e792
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <quic_pkondeti@quicinc.com>, <quic_aiquny@quicinc.com>,
        <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Cong Zhang
	<quic_congzhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732699953; l=2699;
 i=quic_congzhan@quicinc.com; s=20241126; h=from:subject:message-id;
 bh=FBw9HVozgfVKZtFYcBQA4Su42LkaqncDAcZ8xBi6Rpw=;
 b=54RdeYrUbZufBarzWgQ/QTteprPVZ2ILSpmePxXtsh3hlJL9siovTfoImGnesdzgm+jLyfPN1
 1dGKROEcw4qAO6oc7TuR7vMgA/1IrRuoNjbC6vrTf/oNg8pUWY1DG8P
X-Developer-Key: i=quic_congzhan@quicinc.com; a=ed25519;
 pk=EAdxxOpkixn8jyG0MRQXsIFtZX7PytBUry7L44VBHIo=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ATfu0gELOnXjeCqOwE7sooaYV3EI4okO
X-Proofpoint-GUID: ATfu0gELOnXjeCqOwE7sooaYV3EI4okO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 suspectscore=0 clxscore=1011 mlxlogscore=481 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411270079

The INTID of EL2 non-secure physical timer is 26. In linux, the IRQ
number has a fixed 16 offset for PPIs. Therefore, the linux IRQ number
of EL2 non-secure physical timer should be 10 (26 - 16).

Signed-off-by: Cong Zhang <quic_congzhan@quicinc.com>
---
The EL2 non-secure physical timer is utilized during kernel bootup in
EL2 mode with KVM enabled. This patch has been verified on the QCS8300
platform with KVM enabled. Given that the dependency patch has already
been reviewed, I am uncertain whether it is preferable to submit this
fix as a new patch or to combine it with the dependency patch. I would
appreciate your suggestions on this patch.
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sdx75.dtsi   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 2c35f96c3f289d5e2e57e0e30ef5e17cd1286188..de6c368efb3a5efeaf628babdb7e91f8cbbf9d5f 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -1370,6 +1370,6 @@ arch_timer: timer {
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 5f7e59ecf1ca6298cb252ee0654bc7eaeefbd303..b0775173278f3eed0f301b40dfba0f2680d7b0d0 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -1548,6 +1548,6 @@ timer {
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 };

---
base-commit: 6ad9d5070ae9de51803b16ffc384c23d62466c7d
change-id: 20241126-correct_timer_irq-133e0a33e792
prerequisite-message-id: <20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com>
prerequisite-patch-id: 73c78f31fa1d504124d4a82b578a6a14126cccd8
prerequisite-patch-id: 5a01283c8654ae7c696d9c69cb21505b71c5ca27
prerequisite-patch-id: dc633d5aaac790776a8a213ea2faa4890a3f665d
prerequisite-patch-id: 9ecf4cb8b5842ac64e51d6baa0e6c1fbe449ee66

Best regards,
-- 
Cong Zhang <quic_congzhan@quicinc.com>


