Return-Path: <linux-arm-msm+bounces-73250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B16B54576
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34E4F16ED3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 08:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140C02D480C;
	Fri, 12 Sep 2025 08:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bChzC7Ff"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688572D1F4E
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757665960; cv=none; b=KLrlGZLDoXcEN7Iv3h1zKNMm27Y9zwbepfIg3D4uCtguyMgEhjWN9kYXnj1ucJYo5PFrx1DVqOjQF/I3rhvICEF+d32k8yjXiRuBo3D9VdChvqlHe7XteI36agY5VDZKoHLceeY6mZrq3dA6Q1hA162llsSq3yDKhloi0d6WZ5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757665960; c=relaxed/simple;
	bh=HG+b+jRIRTWPpc1sxXtE1A4aG886oTSQcaj4r4e1v4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t93hm3rK9mEtJUVMjIWONxoSMdgvzZKx4MD8mj4jmoGc5fyXT+YmVVqK2V1QB7WUV74NgU2qBMQOxQkp3ljhlk7SXwNEjk9/HW1QUYy0gNktuhynvqs+beHJYiMsFIVLoy8Xjns9i1Mn4BTZGY4rZZwkQrsPPl81hmgPQCBWipM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bChzC7Ff; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C8DIkR025757
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XfwpEgA5iMz
	nAO8LzxBPMwKlKMUGeLCboiF0FAzcPH4=; b=bChzC7FfP150f+quUNHkzby3T/t
	L3HCAvGe/iUAxIn2Iz7wAdP3h/8H/9Ba2qZbryLkBtUYYv8VZBjXb0CuG6ljqsmc
	vZ39OGN/abduUgV+J4iEF7aXC5xbpG4qnXfxYDVi1fO6dNeqvewqKAX2IqjkZlLX
	9z6qjHtlwz1AOJcUsFi/dlzz8sjaENwzR7hBkEFTV5Zie1/k4PC7E0tu7ArBHf6M
	7sYjKY7r4Uj7c2+a92378J8FEZfAfU/ea7JpKr+soJw6cJyn24bSliY6W7ssZKP/
	IlYliYbTB20uXuWPtdTUHGl24dbXqX1k488VOyxMcvbZd2B4QyPxf//+2uQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj12sxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:32:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-768181ba081so11422946d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 01:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757665956; x=1758270756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfwpEgA5iMznAO8LzxBPMwKlKMUGeLCboiF0FAzcPH4=;
        b=Rd7weiTr7wnf3e99LDeU+fvnGRa0h3unGY7bPsiMCcfYyojoce37gVQOy+nDIPopp+
         jHScfsRDidmGu9ZVSb7P4AH4CopEkIzs5bN+P60QAtE/SL6VyD4Fhti95C5ENpZc7t0Q
         utBljAOmc5XiH+ts4MVO1mVY4JnhfMU6fbQbtjwxsgIedsLMFBAksUEtwysnikb2q/NR
         IjY9v+GwHZYiMeYnfKK4cpuXVfNnAFpC8QG/fwz4tly5bhLl0WIyRYkRxzewVrJbGjss
         9W4YJgQ751S/A6UPoURA2pd5G/+qRf8w/BO9205LQr0R6L7BvUHfvUjU+NcLEv2vL6/m
         wpaA==
X-Forwarded-Encrypted: i=1; AJvYcCW3f81YyWt4tp6wYltCzEpGhIMC52DBFKGWkNx/XN17TMAxqM9xOlVzu2pKpdNTWIqEr4Vmlc9biGUcw07Q@vger.kernel.org
X-Gm-Message-State: AOJu0YygZhhgHwCxYXrF63inKeDKOBlF3KM7x4SUF0aUjELAyPE4aKYW
	ge1dvkIbxHBLMmGBogRFLScCsAHm3OaJItuuCdqN4t8Ck85JDrNo7oXbAsZENswN+NJQjyWdWf0
	AO/Xk9iPfavzAX5bE4hNFolMAV09v3MJna6ydtaYCzG1r0LIMcQCpSwuyv4CfeccQjcY2
X-Gm-Gg: ASbGncv4yJ6dHuEg4t1JiDpZDRWUF64QlwcDnbLsB4gi++vEvkNVLiqEZSGmeS4Eyxn
	ebCeFDVCk20cciZ1ToDbrz+kUJiPUpFQFVRwD3eCZcFlT6zV8aKW7wuUctxQPQnt2wUtrqaHFl3
	6eDVpNTWlBFTveVeZrG46Hv0gQn1i2hfwK2GsWJPQMWb3ZAwczEBgYm/tLUrdCVzxk/SJjYKuXq
	d/nVDzW+HE4JhPhmAe8lhO5eX9xRvWYs0rJTyiBw75ZMgxqL2JOvdeoBA+4Uu52IBnrpZvF5aOA
	O/vwqiXvrf0tE6NZY2UQQ1qHP3rjObHOrrM3ZFZI2/vRdxNWTdD/aA==
X-Received: by 2002:ad4:4ea3:0:b0:70d:f55f:ef97 with SMTP id 6a1803df08f44-7621c32efaemr72387736d6.1.1757665956286;
        Fri, 12 Sep 2025 01:32:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYHFi7nQKEsfNo6HTdciqVCNkh4syB+/VM6ig6YPCJeUsIe4Add5fXHpY8kWwaY/XtcFL/nQ==
X-Received: by 2002:ad4:4ea3:0:b0:70d:f55f:ef97 with SMTP id 6a1803df08f44-7621c32efaemr72387486d6.1.1757665955691;
        Fri, 12 Sep 2025 01:32:35 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017c1dd3sm31247265e9.2.2025.09.12.01.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 01:32:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 3/7] dt-bindings: soundwire: qcom: deprecate qcom,din/out-ports
Date: Fri, 12 Sep 2025 09:32:21 +0100
Message-ID: <20250912083225.228778-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3K5vOX2Ez3Tt4_Ahu2vlxOxakKqJGqlg
X-Proofpoint-GUID: 3K5vOX2Ez3Tt4_Ahu2vlxOxakKqJGqlg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX73mrBbT2LCcd
 MYAeVUpKbLNntXUlVgN1fsSl4yrAAp5GmLFAgV0y3/gmgYzf7pwzFg6ajxbDNL7qfi+9q8D7X5d
 RJQn5uUTXoBj83s8wdHqpcfIHRSFwqQNBcfCmv7kxb3lVjIfRR+LNOhosiW3XZq1fGAopQe2nld
 JHcRIB+QPoBU3j20BFU4SyNVpRyuL1Ix2/I6TiEVqti1JC4+ssv1bJunjJDKqlQTlRZrnA7T7rD
 4R3CCDLVW9TYmlZ96pcStva/GBc3+26nR2qTifXh+k1PLSpChYZDE5pdgNjNcKbweEN/IwK8Te4
 txQGibGbUJZJB+N24D+NhZauIGB572gyPiC27W1dVYJOaleJ2RS6HUkjX6ZZt7fS9W0YE8HaUOL
 LxWUdcoY
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c3daa5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=9b2JUy4lzbIbXjLhPvkA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

Number of input and output ports can be dynamically read from the
controller registers, getting this value from Device Tree is redundant
and potentially lead to bugs.

Mark these two properties as deprecated in device tree bindings.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/soundwire/qcom,soundwire.yaml      | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 95d947fda6a7..7ea491f7e828 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -73,10 +73,12 @@ properties:
   qcom,din-ports:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: count of data in ports
+    deprecated: true
 
   qcom,dout-ports:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: count of data out ports
+    deprecated: true
 
   qcom,ports-word-length:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -223,8 +225,6 @@ required:
   - '#sound-dai-cells'
   - '#address-cells'
   - '#size-cells'
-  - qcom,dout-ports
-  - qcom,din-ports
   - qcom,ports-offset1
   - qcom,ports-offset2
 
@@ -257,9 +257,6 @@ examples:
         clocks = <&lpass_rx_macro>;
         clock-names = "iface";
 
-        qcom,din-ports = <0>;
-        qcom,dout-ports = <5>;
-
         resets = <&lpass_audiocc LPASS_AUDIO_SWR_RX_CGCR>;
         reset-names = "swr_audio_cgcr";
 
-- 
2.50.0


