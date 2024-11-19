Return-Path: <linux-arm-msm+bounces-38300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC6F9D2387
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 11:27:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B29A1F21E08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 10:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B0A1C8FBD;
	Tue, 19 Nov 2024 10:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J5uIlLiE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCED41C2457;
	Tue, 19 Nov 2024 10:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732011835; cv=none; b=jxFnDxIq1zWkU6fjAOJlc8rlvuf/abj4o0THa8DM3tKwB78TWzfZma2xWQ2zxdTkVV9cL4hBZFXHQHw77xAg3c/kCnkRh0DAnT7BLpCWxl2IsdgO14ejGssOOpT+KkpFgoiyWzaYBcpIlbwSZ9HPUALYZXsabhg/NGlYqTE1VMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732011835; c=relaxed/simple;
	bh=rreYe+2m0JMYnottDxobxDieusEcDpSrdSOT5M0qneM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IwIqvGThNTZQ+oIpAZVYIw15BVgGkiiM6D19o97iEI4pnrfQUxED0THlG0hdCcY2TQ7JqkW3CNE3YvQi/EKBhS5gDX+gMVih4czn3KATbfpvEHAtcMHY1edbEMuTihPTWf3iWLHmyAGkfY0X3QoTxXghFDUHDNftjCs0pRA4ONU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J5uIlLiE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJ885ck030154;
	Tue, 19 Nov 2024 10:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IqsOTWhPLDK3vJwMM89L34lXVFYUhLjmIKrGPO2XgME=; b=J5uIlLiEM3bEH2f1
	hCmlhZ2KZcwI02fPh3zT1elwJ8sKNgzKzGsXIyqQjz1kCoQ6zDGv5XDZ9d/b8fVf
	/hhLIZEB5riAfWwOK+NsPhy8/Zbqj5UnEjkAzOO9QmalcZqvizO1zPfz819f30Wl
	BqgO7z7HyDx0P3DKaIqHHGmUfXL6KHZilXvaPyYLm9kI9V9UozQshagJRbJpZnp9
	TsnIg++hUdi6K/EH0+zfxFrTCYJJ5l3MfnQiiLiWi9seGxAO8tu1PEbGq/Eh95wb
	xY0lv++xjCtW+9SKYXsxJ9BmtwzeoD3d/pj5Jk079U5XL6Wih3tHObzUFUHBuyuL
	WBMSVw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y6a7jg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 10:23:51 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJANorb019203
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 10:23:50 GMT
Received: from liuxin-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 19 Nov 2024 02:23:44 -0800
From: Xin Liu <quic_liuxin@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_jiegan@quicinc.com>, <quic_aiquny@quicinc.com>,
        <quic_tingweiz@quicinc.com>
Subject: [PATCH v2 2/3] arm64: dts: qcom: qcs8300: Add watchdog node
Date: Tue, 19 Nov 2024 18:23:14 +0800
Message-ID: <20241119102315.3167607-3-quic_liuxin@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241119102315.3167607-1-quic_liuxin@quicinc.com>
References: <20241119102315.3167607-1-quic_liuxin@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: f6iLmXyB3v82mPi1uItk4nHEqoaxK1zs
X-Proofpoint-GUID: f6iLmXyB3v82mPi1uItk4nHEqoaxK1zs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=611 suspectscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190073

Add the watchdog node for QCS8300 SoC.

Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 2c35f96c3f28..13321b1a8af6 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -1122,6 +1122,12 @@ intc: interrupt-controller@17a00000 {
 			redistributor-stride = <0x0 0x20000>;
 		};
 
+		watchdog: watchdog@17c10000 {
+			compatible = "qcom,apss-wdt-qcs8300", "qcom,kpss-wdt";
+			reg = <0x0 0x17c10000 0x0 0x1000>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
+		};
+
 		memtimer: timer@17c20000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0x0 0x17c20000 0x0 0x1000>;
-- 
2.34.1


