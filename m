Return-Path: <linux-arm-msm+bounces-40958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C52C69E8AD5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 05:58:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81736280F3B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 04:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019991953A9;
	Mon,  9 Dec 2024 04:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SgPzWjTS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F49190685;
	Mon,  9 Dec 2024 04:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733720243; cv=none; b=bAeOF1LnQ5s/auy8EHwOL3lJOVIcTPUJ+cHMqYoC2eCsFDM+E+zRA97mM764Jin2sdzsYt9KYgI7DNzAyJlmJO+e4J1jkeB573odHjqDuPT8fVR3z3n+OQEEVVTzqMyfEAUpXp+VA0UuNzkas0lZvji05/FW92RVGhGxrv405+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733720243; c=relaxed/simple;
	bh=GV8GSyJ1Q+igxyLWYQT8zoJW6HJh3Dd1dbbOQNj7Veg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OKIqH4PGkhrXzdm5Gv4bpsJgQMOjOmigHVNQyY62OHlYTIvj2tIcFTx/FPVM6RXOqq9efiz/NyOw1I54WWBdZ4rbjXOW84sj9iwCD22SUz2iqmRaqPlYgQE2ppRnpbGP/LUzRFXunSHLaf/vKlVwpcYSauDYRq5pC88M8AJc1Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SgPzWjTS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B8NRLBH006771;
	Mon, 9 Dec 2024 04:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ttlirHfeBo5QW1AzNKYNJ8gVgL1TQObQp3CJkY+VvU=; b=SgPzWjTSYmA+3G+V
	2nfYMf/G+M/DfMbNEAFexTIaflZEIlKkDPSu+9t4R5/RR5/RIxLSdrpD2XIHeSQx
	wkkQH3Fi4YcpcpWm9s29nKOOanifbxcw7x0ZW0a2xdcQEeTk+mVJQhhPma3cPISO
	k28n62akPgkG3rOsdy55WQxHL7iWIRWSILo2Md8ZAxF0f83rgqEz7YjTHpdH+vVx
	YcYTWEvoZx6tn+5d8zaymEnD8GetcidQ2AKgKDOKym0c8+mdRH8/SVXLiN9F5RFb
	N/cVjurVvXhhrogd0+NYvi6QUlg2IxoMBat8FI/nmiJ9es+xr16Trf8MKEovOlNL
	ry+3Zg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdpgkdma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 04:57:00 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B94uxbO002047
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 04:56:59 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 8 Dec 2024 20:56:51 -0800
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
        <quic_pkumpatl@quicinc.com>, <kernel@quicinc.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v4 1/4] ASoC: dt-bindings: wcd937x-sdw: Add static channel mapping support
Date: Mon, 9 Dec 2024 10:25:48 +0530
Message-ID: <20241209045551.1404782-2-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241209045551.1404782-1-quic_mohs@quicinc.com>
References: <20241209045551.1404782-1-quic_mohs@quicinc.com>
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
X-Proofpoint-GUID: -fNT8KSJ_keURgPWshZYXc0DxdAsEfvG
X-Proofpoint-ORIG-GUID: -fNT8KSJ_keURgPWshZYXc0DxdAsEfvG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090037

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
---
 .../bindings/sound/qcom,wcd937x-sdw.yaml      | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
index d3cf8f59cb23..9209667044ba 100644
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
+        - 0  # WCD9370_SWRM_CH1
+        - 1  # WCD9370_SWRM_CH2
+        - 2  # WCD9370_SWRM_CH3
+        - 3  # WCD9370_SWRM_CH4
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
+        - 0  # WCD9370_SWRM_CH1
+        - 1  # WCD9370_SWRM_CH2
+        - 2  # WCD9370_SWRM_CH3
+        - 3  # WCD9370_SWRM_CH4
+
 required:
   - compatible
   - reg
@@ -74,6 +108,7 @@ examples:
             compatible = "sdw20217010a00";
             reg = <0 4>;
             qcom,rx-port-mapping = <1 2 3 4 5>;
+            qcom,rx-channel-mapping = /bits/ 8 <0 1 0 0 1 0 0 1>;
         };
     };
 
@@ -85,6 +120,7 @@ examples:
             compatible = "sdw20217010a00";
             reg = <0 3>;
             qcom,tx-port-mapping = <2 2 3 4>;
+            qcom,tx-channel-mapping = /bits/ 8 <0 1 0 0 1 2 2 3 0 1 2 3>;
         };
     };
 
-- 
2.34.1


