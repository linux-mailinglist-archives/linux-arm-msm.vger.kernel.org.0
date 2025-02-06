Return-Path: <linux-arm-msm+bounces-47023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DEBA2A760
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 12:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D872163A30
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 11:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D4322A1C2;
	Thu,  6 Feb 2025 11:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AvfSm+KA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15157227B92;
	Thu,  6 Feb 2025 11:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738841001; cv=none; b=fQG+CJ4nksq1RxeyHTLVKO0yxn1R+nmtbBhKFtSvAzvriZONz4f6EV5omPz4NI5tJBrGwjIUx/h4x1KE635X+m1fdnivKiaSAZthx5czoD9HkizkAmzwzXFde0ocPv5atqKe6nxdnLmFcRStfgyRT3u/MYtkORm/U6SEvKg/ImE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738841001; c=relaxed/simple;
	bh=gThmUsrWPDivnKwo79Nej59PouquueFxzAVx9OIjKj8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MXkdTA/rCe66tBjREHUZ+t5v8jRwWM0Qg5EwyTKqEOQTgwsbQxwFCkPxnCdO6He+P1DOuDETLXsCSRJoMOXbNej7gBpWw37ukq8gPzIhD8l+hwL4HOeqpIjTctZJFk6jk1fzI1asXEExxpjKjoefbwEWjcozDKEctiYwWBqVrHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AvfSm+KA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5168bYwn014577;
	Thu, 6 Feb 2025 11:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	opggx489NWk8qDwGyLCGZhD69yNNHEvUDXxdfwyf1UU=; b=AvfSm+KA++1G8My3
	Y6AtxYO3eTemtzqUGM2mKYn48yi3erC5n+DUvYV7X0vuCcaITE9VBHlGv+Th8WVw
	mOykDgo0+2CxYzwEZWLEUkM1yoL610gpPqdrRrtzlPCfFX4B9k2hvZQrZXql/J3l
	EzBRZzh9Y0d1CsQgrYchPKv19Aem1knEaFW6cHtSSvIb95bMMX/EgoHiJKKEOmlf
	YZYv0bQvnXDIEHFKW46D1Y3Bm6gELrBIXg0JbBa55h0C650si9I6U/J+FmpOV4Xz
	ly5IQGZ7SzJMITIpIQwlqbFjX95NNiCnpY5ID1JYYicj53Jpr9jcCNPSDsbMzDgZ
	Pxuy9g==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44msr10e5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 11:23:00 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 516BMxMi010779
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 11:22:59 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Feb 2025 03:22:54 -0800
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
        <quic_pkumpatl@quicinc.com>, <kernel@oss.qualcomm.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 1/4] ASoC: dt-bindings: wcd937x-sdw: Add static channel mapping support
Date: Thu, 6 Feb 2025 16:52:22 +0530
Message-ID: <20250206112225.3270400-2-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206112225.3270400-1-quic_mohs@quicinc.com>
References: <20250206112225.3270400-1-quic_mohs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yu8pXrTi3azJl5jdZ8DKWBXIxpaYFnDl
X-Proofpoint-GUID: yu8pXrTi3azJl5jdZ8DKWBXIxpaYFnDl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502060094

Add static channel mapping between master and slave rx/tx ports for
Qualcomm wcd937x soundwire codec.

Currently, the channel map index value for each soundwire port is
hardcoded in the wcd937x-sdw driver, and the same channel map index
value is configured in the soundwire master.

The Qualcomm board like the QCM6490-IDP require static channel map
settings for the soundwire master and slave ports.

If another boards which are using enable wcd937x, the channel mapping
index values between master and slave may be different depending on the
board hw design and requirements. If the above properties are not used
in a SoC specific device tree, the channel mapping index values are set
to default.

With the introduction of the following channel mapping properties, it is
now possible to configure the master channel mapping directly from the
device tree.

The qcom,tx-channel-mapping property specifies the static channel mapping
between the slave and master tx ports in the order of slave port channels
which is adc1, adc2, adc3, adc4, dmic0, dmic1, mbhc, dmic2, dmic3, dmci4,
dmic5, dmic6, dmic7.

The qcom,rx-channel-mapping property specifies the static channel mapping
between the slave and master rx ports in the order of slave port channels
which is hph_l, hph_r, clsh, comp_l, comp_r, lo, dsd_r, dsd_l.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,wcd937x-sdw.yaml      | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
index d3cf8f59cb23..c8543f969ebb 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
@@ -58,6 +58,40 @@ properties:
     items:
       enum: [1, 2, 3, 4, 5]
 
+  qcom,tx-channel-mapping:
+    description: |
+      Specifies static channel mapping between slave and master tx port
+      channels.
+      In the order of slave port channels which is adc1, adc2, adc3,
+      dmic0, dmic1, mbhc, dmic2, dmic3, dmci4, dmic5, dmic6, dmic7.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minItems: 12
+    maxItems: 12
+    additionalItems: false
+    items:
+      enum:
+        - 1  # WCD9370_SWRM_CH1
+        - 2  # WCD9370_SWRM_CH2
+        - 3  # WCD9370_SWRM_CH3
+        - 4  # WCD9370_SWRM_CH4
+
+  qcom,rx-channel-mapping:
+    description: |
+      Specifies static channels mapping between slave and master rx port
+      channels.
+      In the order of slave port channels, which is
+      hph_l, hph_r, clsh, comp_l, comp_r, lo, dsd_r, dsd_l.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minItems: 8
+    maxItems: 8
+    additionalItems: false
+    items:
+      enum:
+        - 1  # WCD9370_SWRM_CH1
+        - 2  # WCD9370_SWRM_CH2
+        - 3  # WCD9370_SWRM_CH3
+        - 4  # WCD9370_SWRM_CH4
+
 required:
   - compatible
   - reg
@@ -74,6 +108,7 @@ examples:
             compatible = "sdw20217010a00";
             reg = <0 4>;
             qcom,rx-port-mapping = <1 2 3 4 5>;
+            qcom,rx-channel-mapping = /bits/ 8 <1 2 1 1 2 1 1 2>;
         };
     };
 
@@ -85,6 +120,7 @@ examples:
             compatible = "sdw20217010a00";
             reg = <0 3>;
             qcom,tx-port-mapping = <2 2 3 4>;
+            qcom,tx-channel-mapping = /bits/ 8 <1 2 1 1 2 3 3 4 1 2 3 4>;
         };
     };
 
-- 
2.34.1


