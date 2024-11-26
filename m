Return-Path: <linux-arm-msm+bounces-39218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C584D9D9BB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 17:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53EE1160F53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 16:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB2361DA113;
	Tue, 26 Nov 2024 16:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I7tJfT75"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348531D8E16;
	Tue, 26 Nov 2024 16:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732639502; cv=none; b=Y2AqzncgzeBDao4fS7A/v6Xpv1Ugo6QpYMKKoAxt+S85PoTlMelvKsYXqmR6Uso0MO/hFefA8h6piikrLbmSpQ8W3HnwCDuPtGX8RZDZ4X4z84Crc1sbgDLZi5mB78M3Oqo4wbOSPwacoqTfTZ0PR2T5mKYAe6fSm3l8xWGOk9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732639502; c=relaxed/simple;
	bh=ArvzV5XrFXZSwjUaVyXbuWR86XhWcfmbbvukIEhNofY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HBGUL21IRinxcDhtBXfv+jVYR83n2DH+0cY3DGdLN8QmuapBZXaIxC7g1gnfd0cMfR9sZiO4jXt525q3z8z2ZNwm8s1dhPz6+iVM4alkN6GyJk0unAXPtvaEg21W5t+7LKVcgBy/8MXk4dboAZMggPOkUXkTkg0FA6GYFtDttew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I7tJfT75; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ99qHN028964;
	Tue, 26 Nov 2024 16:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wlvUV5zZsPDjQimoOhzSljo/S63ZXaxegUXl2iCWMyo=; b=I7tJfT75+CaJqs+E
	QZef74+3IBwb+zAz+suK/nA8O8/LDiSGmUc0tb7SmGMa5q66su4tlXF6S0cNF862
	4q2YACdUSgczRk1uKARBF14DJbhZmenWYQ+hrIZcmQ/S6s7Tu8tu8cXkbb5NtR9Q
	slZw3eFLZ39R7XgQcONUIYSqYYfBk5wFT/REKT6EN4G1OOxMivbo4J8KOgHR9L27
	lO8ma+qhNh5ZWaKt1B7mlW9MIi+B57/7nwFHRJ7RASd+Ru1PPemE5eQUIS7jsO+t
	SbWuOiIZfDQ8kOl7g85TaIQCdPa55XhvcP8TcQ55hbAzwbbooy2QGNPKCvv+vSnE
	eTBWKw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 435bf5h760-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 16:44:39 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AQGicFF023869
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 16:44:38 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 26 Nov 2024 08:44:31 -0800
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Sanyog Kale
	<sanyog.r.kale@intel.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_rohkumar@quicinc.com>, <kernel@quicinc.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v3 1/5] ASoC: dt-bindings: Add bindings for wcd937x static channel mapping
Date: Tue, 26 Nov 2024 22:12:56 +0530
Message-ID: <20241126164300.3305903-2-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241126164300.3305903-1-quic_mohs@quicinc.com>
References: <20241126164300.3305903-1-quic_mohs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9hQwXFatRDiYxyuH6qN7qU2zj99iHrAr
X-Proofpoint-GUID: 9hQwXFatRDiYxyuH6qN7qU2zj99iHrAr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411260134

Add wcd937x static channel mapping values to avoid
having to use unclear number indices in device trees.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
---
 include/dt-bindings/sound/qcom,wcd93xx.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 include/dt-bindings/sound/qcom,wcd93xx.h

diff --git a/include/dt-bindings/sound/qcom,wcd93xx.h b/include/dt-bindings/sound/qcom,wcd93xx.h
new file mode 100644
index 000000000000..45bcc30d0393
--- /dev/null
+++ b/include/dt-bindings/sound/qcom,wcd93xx.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __DT_SOUND_QCOM_WCD93xx_H
+#define __DT_SOUND_QCOM_WCD93xx_H
+
+#define SWRM_CH1 1
+#define SWRM_CH2 2
+#define SWRM_CH3 4
+#define SWRM_CH4 8
+
+#endif
-- 
2.25.1


