Return-Path: <linux-arm-msm+bounces-58926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC050ABF743
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 16:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3618F170E5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 14:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F91D19F12D;
	Wed, 21 May 2025 14:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Zn6E5m9x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B7318CBFB;
	Wed, 21 May 2025 14:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836503; cv=none; b=ITdsJYYMhoOzhEUnfznf4PAxy4rllnBnAl4h0SgjKjwbyfJL3tr7rnLKwIxzvfijIZEjweFaGGsZ6DKpRrFkM3dcI+Pz7z8YcT9JkfLdn/d+ln2h39/Y7H1djeS2gG1Eea3K1C8V9iXzPNnBCeCJWtwMwT5TcBHv7I5UfMq644I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836503; c=relaxed/simple;
	bh=SnpVa7I426a7+tDo9ZDH4Qa/C0XkGmiVoXDvxpI+gHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TocnX5+VoZvrvAUQx8qT7p2ozlDW1tuHj9n+bxtW4XT6j1CAw/vYuQ+QM7H3bJohQM/lPk8TBeHSTCo+e0n1IG/SsfjIJZ2WiMZ2kHJod8oueK8Rg4n6kKO42FuZzdu3Ns+zY7MmJHkW5dwdZbNK4wYPWtvzIdARIDoIrSdz6xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Zn6E5m9x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XLbL020602;
	Wed, 21 May 2025 14:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SnpVa7I426a
	7+tDo9ZDH4Qa/C0XkGmiVoXDvxpI+gHM=; b=Zn6E5m9x2AnEw4VSdreERsGZPcQ
	fSenCLm9hDTJdyrxj5YOCgSgyYNxP05YBcYS1j+sixDHP+UMt30HIKp2uO2q1nMI
	P8tY3VMx1lemNcnaiQ9kXPhD4bqPi91jGcikBRmrvhdyGfjMwD7mizr6K1pUekpm
	VJfsjaRrhxFkgZo0JxHtBfESND+RkAuPD+RJVu8lF/xCI8eEhtYbQf+0Z/K15kwu
	omf1luYytqL/58j2RIj4GEqY6+2EXQzYGiccWC7GvVCzdjSXf4OQp/pGfqJGFfbV
	yrvLeRnAHe7QJg/k0g7g+WKKRI73bi1sPMt1cOMmeDE/ap0oSzk0ZB+t+Iw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s9pb1e6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 14:08:14 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54LE8BUo005921;
	Wed, 21 May 2025 14:08:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46pkhmjbae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 14:08:11 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54LE8BhZ005893;
	Wed, 21 May 2025 14:08:11 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 54LE8Apq005890
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 14:08:11 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 1201D5C6; Wed, 21 May 2025 19:38:10 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        kernel@oss.qualcomm.com, Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v7 3/6] arm64: dts: qcom: qcs9075: Introduce QCS9075 SOM
Date: Wed, 21 May 2025 19:38:02 +0530
Message-ID: <20250521140807.3837019-4-quic_wasimn@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=WJl/XmsR c=1 sm=1 tr=0 ts=682dde4e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=wRu9zdmjipw6Plw-N58A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: d-p6_M0QHo7XKoRiIO4o52N7PdXNQKBM
X-Proofpoint-GUID: d-p6_M0QHo7XKoRiIO4o52N7PdXNQKBM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEzNyBTYWx0ZWRfX4kyf+RJKlzwn
 RJAdJ9mV6VlM2mi3YYnVclgaV1vabR2JFBZt7HMXsvVNcUchH4jaG3RLnWeSdI/H1CEq8NhHFBV
 srVmJkgoga/IlKHt3Ku1/MRn9EtrGwPKreqhzmvCflHPiuPaberpWGWDqr+Vhz6YLIF2syhtawk
 HJ8cCffHhzE1W2qrAmNAQbTpkCAWylLQwAk9Fa8CcshKiTAODVqgEcC3Pcis2uKq0vApwJuVPBk
 LuoXKHmYqKGiiioJwBNKhgZx3q3MOEF6KYTF5rF2Terb0hOuTDOlRZ8TPP2ddhsZvY59zzjAtbT
 /vLv2HVyddxuWdd7iMhmSvMUwI7JZHhlueIPtab7Y2z8D6wlYHo5WMuKrGXEJ4q/iPqhlZAXWXl
 M7cY3Sujy67yk8l+DyZ1hm4HGbEI1hXcr0pUozUrqrspKxu2fRSqM1Cu+1KxvVTLiBllqBaT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=1 phishscore=0
 mlxlogscore=794 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210137

QCS9075 is an IoT variant of SA8775P SOC, most notably without
safety monitoring feature of Safety Island(SAIL) subsystem.
Add qcs9075-som.dtsi to specifies QCS9075 based SOM having SOC,
PMICs, Memory-map updates.
Use this SOM for qcs9075-iq-9075-evk board.

Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs9075-som.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-som.dtsi

diff --git a/arch/arm64/boot/dts/qcom/qcs9075-som.dtsi b/arch/arm64/boot/dts/qcom/qcs9075-som.dtsi
new file mode 100644
index 000000000000..552e40c95e06
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs9075-som.dtsi
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "sa8775p.dtsi"
+#include "iq9-reserved-memory.dtsi"
+#include "sa8775p-pmics.dtsi"
--
2.49.0


