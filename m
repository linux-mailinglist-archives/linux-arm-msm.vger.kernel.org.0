Return-Path: <linux-arm-msm+bounces-35537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9F39ABEA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 08:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFEB2B23114
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 06:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4694314B942;
	Wed, 23 Oct 2024 06:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JGJrhLrz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EC4148827;
	Wed, 23 Oct 2024 06:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729664672; cv=none; b=H5P+H4YqKqUdi4sQy5WQTmzPZcAbp42nLcR/Af1cvjy0LbRLzCoSWZHamIuaD1jkv2yg8rs402EJz/hG4UG+Q+zao10gbeK/peSRDO/70qmxlbbv375Ai1OBVZ/ikI79W69rDh7+v9KAxCahKaJA615AXIv3ZpsnIr56uVRONNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729664672; c=relaxed/simple;
	bh=xez6NaqdM0i1Zwm3iBVvcxB4uor6KaeTdG5uHG0VOL4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kzAnQ7ICGgDD5vjqUbV1lofPiJH+zB8x2VwH8sZEYqcyW3DFv2g3U7dKd0ViPzW1hor6gjZj7JWx/LnH6iQJGHYDA7iEdOMe/sfn7xMFrfATwBIkamTd82ehss7X1X2fwY4nBpNbSWqW9Pxo+Hcha6Ork6+PmVJME0JqRIlNwfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JGJrhLrz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MLaFSM016699;
	Wed, 23 Oct 2024 06:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZGbbW9U/0+e/xtmFA2qnVUdpwYcnPSgvZEHNSNJ4sb0=; b=JGJrhLrzKzOgNtYn
	+2bUHkMkGdmoBy+aXwRkYydsNlHMRXdZexzxHwJskmQdXjinGctTV7cT2M95VQhx
	jtf3XcJbg16wqIcINxWHT4Cr/r3+K27f730paSGovUXRHCWNSjWS6o5mUIA8qQl5
	uG/ZNvQ7bg8lvXBcRRTcf1Og8dw0CKFE6GS5o0EnQGjmozdWa3gFpv0zNVvDUxHf
	ifid1hbgO/fcray7P7scy/re6KYlgjaznKPafc2v/s8uiwbhlF0KhB6P9AzmW295
	97pY1+2wLtWumNm5WY8d3UhSySR0pZp01/7hsXxTGmPN7Bb3YVt3UDz3wdjRJP+K
	hwCaFQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3xh32s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 06:24:18 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49N6OHDk027476
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 06:24:17 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Oct 2024 23:24:10 -0700
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
Subject: [RESEND v2 1/4] ASoC: dt-bindings: wcd937x-sdw: Add static channel mapping support
Date: Wed, 23 Oct 2024 11:53:28 +0530
Message-ID: <20241023062331.3872883-2-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241023062331.3872883-1-quic_mohs@quicinc.com>
References: <20241023062331.3872883-1-quic_mohs@quicinc.com>
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
X-Proofpoint-GUID: Hr9BX4W0TTFSr8f0K9UaAAeCbHF9Wnj0
X-Proofpoint-ORIG-GUID: Hr9BX4W0TTFSr8f0K9UaAAeCbHF9Wnj0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230037

Add static channel mapping between master and slave rx/tx ports for
Qualcomm wcd937x soundwire codec.

Currently, the channel mask for each soundwire port is hardcoded in the
wcd937x-sdw driver, and the same channel mask value is configured in the
soundwire master.

The Qualcomm boards like the QCM6490-IDP require different channel mask settings
for the soundwire master and slave ports.

With the introduction of the following channel mapping properties, it is now possible
to configure the master channel mask directly from the device tree.

The qcom,tx-channel-mapping property specifies the static channel mapping between the slave
and master tx ports in the order of slave port channels which is adc1, adc2, adc3, adc4,
dmic0, dmic1, mbhc, dmic2, dmic3, dmci4, dmic5, dmic6, dmic7.

The qcom,rx-channel-mapping property specifies static channel mapping between the slave
and master rx ports in the order of slave port channels which is hph_l, hph_r, clsh,
comp_l, comp_r, lo, dsd_r, dsd_l.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
---
 .../bindings/sound/qcom,wcd937x-sdw.yaml      | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
index d3cf8f59cb23..a6bc9b391db0 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
@@ -58,6 +58,38 @@ properties:
     items:
       enum: [1, 2, 3, 4, 5]
 
+  qcom,tx-channel-mapping:
+    description: |
+      Specifies static channel mapping between slave and master tx port
+      channels.
+      In the order of slave port channels which is adc1, adc2, adc3, adc4,
+      dmic0, dmic1, mbhc, dmic2, dmic3, dmci4, dmic5, dmic6, dmic7.
+      ch_mask1 ==> bit mask value 1
+      ch_mask2 ==> bit mask value 2
+      ch_mask3 ==> bit mask value 4
+      ch_mask4 ==> bit mask value 8
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minItems: 8
+    maxItems: 13
+    items:
+      enum: [1, 2, 4, 8]
+
+  qcom,rx-channel-mapping:
+    description: |
+      Specifies static channels mapping between slave and master rx port
+      channels.
+      In the order of slave port channels, which is
+      hph_l, hph_r, clsh, comp_l, comp_r, lo, dsd_r, dsd_l.
+      ch_mask1 ==> bit mask value 1
+      ch_mask2 ==> bit mask value 2
+      ch_mask3 ==> bit mask value 4
+      ch_mask4 ==> bit mask value 8
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minItems: 8
+    maxItems: 8
+    items:
+      enum: [1, 2, 4, 8]
+
 required:
   - compatible
   - reg
@@ -74,6 +106,8 @@ examples:
             compatible = "sdw20217010a00";
             reg = <0 4>;
             qcom,rx-port-mapping = <1 2 3 4 5>;
+            qcom,rx-channel-mapping =  /bits/ 8 <0x01 0x02 0x01 0x01 0x02
+                                                 0x01 0x01 0x02>;
         };
     };
 
@@ -85,6 +119,8 @@ examples:
             compatible = "sdw20217010a00";
             reg = <0 3>;
             qcom,tx-port-mapping = <2 2 3 4>;
+            qcom,tx-channel-mapping = /bits/ 8 <0x01 0x02 0x01 0x01 0x02 0x04
+                                                0x04 0x08 0x01 0x02 0x04 0x8>;
         };
     };
 
-- 
2.25.1


