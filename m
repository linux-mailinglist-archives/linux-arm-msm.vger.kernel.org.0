Return-Path: <linux-arm-msm+bounces-82934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B26A6C7C7A2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 06:03:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B47E63A7D09
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 05:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2211C287265;
	Sat, 22 Nov 2025 05:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hSFP6htu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fy0jiIuD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BE62C2357
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 05:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763787684; cv=none; b=PG/zIark+fLVDDiGyLDK8YGYWEvaJ+OcLcRC5sx3+k/fP7tbkEtJzTeLeBQR/S4mHalcGYplnQJ1SvynuyxCAl8sM/j1/m6X6FsefGMGcsdwlbFJXDiVYg9RIPTCmQKl+MU7u+58KA2suPiFm+PVCwL7c/Q7yNgP1EoZNW9n8lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763787684; c=relaxed/simple;
	bh=n3yNp9/TN5k/lBCC2x1FX0c9/nmTEST39ivPJlqcyk0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VMaySBA/EwWbNprSVFx9LkauPayJXw56jW3aILPErInMRLahTphveBSxS4L06P9wzG5MehaRhEsvsWD3FUQpEXyJCd6xzxpGH+ZdGsdU6DYafvHLPfEG6339dHmwHBpr4tymW+EgtbvlVQOva4/7B8To6tV2NDKfMLAJwwz4GDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hSFP6htu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fy0jiIuD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AM4WPf41632301
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 05:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sj9WA/iimEV
	DxbLoIO2V4NajunxNmR/ylXA4Htn7lIY=; b=hSFP6htugt3wod5tprWO/AqF7OH
	XWDEZcZJrAV3VLqjL5j1H6zdhygBmiP1reTAFRQLBVsl0SQp7cKNPkrOvNVKbqeW
	YCuZXx9XdC6xMjelf+yyUaiY7J8bfz4PvvI/MlVruzs3wqF50et2qIHizf1Z94Yq
	vchaJWaD6YhEaJ9FI7V6nDCgFqpI/MArF/1dRTbywEu7cU2IPTXKGuFBnQEVS+nE
	dsCzFDEEDZ6vhg8uvOEBxpHiE0coDHurqjjkCCdb95M4cODuXf182Wje7/aZmBfg
	fEuCiLVE1+DCy2P+VAGcmsyjApHYxoTfhGaQ3yoPQ/d7Inb9613DGZ/6F9g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak685r1g6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 05:01:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297dde580c8so102426905ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 21:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763787680; x=1764392480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sj9WA/iimEVDxbLoIO2V4NajunxNmR/ylXA4Htn7lIY=;
        b=Fy0jiIuDW0Ug+C5pllI8yCnsknXPi7ytS1glvP+AgGANwsyuB/clerWSYzPwVybkOl
         OFP6p+d2TZzfAmtDIqHEcPaoPtC8Yf8LGNkCR6060X9BBtFUwz/mWY1OFzPA/sLBnete
         1UhOmf0bp/SqhRORmuU5RKn6sW9dGGqbca6OhRGrT6T4pr6+W+8/OHFML0zt9s7iWhxW
         G0/rljX1fe8ysSq/yWp5jpJ34ScAQhfn0uQmRrGNOK/rJugUzWPR2tmj2UNbhjFl8T+F
         1jyF7ME76GXo01DDaMsjwFzgT20VtpWmVOD2Bpws16WVZKWiabQuZr6DfnErsBARf9K8
         72Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763787680; x=1764392480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sj9WA/iimEVDxbLoIO2V4NajunxNmR/ylXA4Htn7lIY=;
        b=YSN95Y/LRQHRYqzaj+irHcjsuQBPOxwgwb01KyO3kjcJkjnZXp+rMY4SU1vD3ekstK
         V/SOV8lQmTNGlL7zIdIbNKLNPiuRXnu1VBehQVyfep1RCBq5uXLy3B3vmBwyCEB0InDV
         f8qDyq5TtFjXYqZpkc/HgLhOOZw6vt0jFEpojeaj4cKc/kiVDzzMkRPjvSahzxfhjIN0
         /CjH7V5GBg0+6fLJ/lPJS6Al2p15OROEXdmJv5w+joI+ecwonH4FGfYWt3FEvYfUYDnS
         B1wQQP+DSZXHdextkLVAIdJ2XGbA6EID3fof6+1tWJ8Z4cpZ9ne4d4KDB3qRDU9WZDr6
         DeQw==
X-Forwarded-Encrypted: i=1; AJvYcCVz8+M8x2NbNV63ejKHSkTpwlwqOBJIm7omzThn+io7OguEo3Hvj98YnJEFsTs6OMSC3WNCAzzIUdH1LElT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz24LBO1T6zaajYAW/PsYGRsWlVdsztUXzlJMPQ2FTiYJqIxAZ4
	T3lrzP2lPFqyoAS/2Ip9HSmRjW8qBl8/HoJeDc4/3WT90e+Y1hLyIkslgkDB8kqjrnpgrXQGALa
	loRXwGnthrH/DwIdqda0FHWJoFE0iKlyDrjpupP7N04ItGRNtNdWwfGSF0qyXUmFNpGv2
X-Gm-Gg: ASbGnctEiSunMcxKgLpGkA14OO2mMfPCOMfJEQA+IfvOPLNlQfVOwBrwLQDVPtxJfkS
	CisgfM4SvJsznN+Hxa0131PH9oHdd0wrW4roE8wL1pL8KhKck0Mp07LaBTM+jkB9zCEr4c3pwbp
	caZzP692Ie8I46T8Z/josvPCV7p7eQ/Y/gQUi1UKCCU2ERa9ZcPiYY42+xDU+WrJ+upIseoY92Q
	QuP/xb1BlzF3GWHoi8tZNhMW9nDdr+/fAG+uTklvMwzHTP2TEHIRZuCPeh+CEfMyfovWjjrs7/q
	jy0O+jIO8P963WUGhRpAYTfP1ET+1ZtXX5gog1tGxgFCpNFziq7SD69KEysBja6bwFM2fyTt/H+
	66Uz9qc8Ua5gzHhlItIcuphf+wBDmk93770G2m5iv/tM=
X-Received: by 2002:a17:903:1a08:b0:299:bda7:ae3c with SMTP id d9443c01a7336-29b6be9a6e1mr65810185ad.14.1763787679770;
        Fri, 21 Nov 2025 21:01:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKdFyJavBDZAv3fh5sXONsSBFogNHJxKYQjCuYxvNv/dMJB4Q2p24Pq5feZ14FV/VaFkF/GQ==
X-Received: by 2002:a17:903:1a08:b0:299:bda7:ae3c with SMTP id d9443c01a7336-29b6be9a6e1mr65809585ad.14.1763787679224;
        Fri, 21 Nov 2025 21:01:19 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138c08sm70688725ad.25.2025.11.21.21.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 21:01:18 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, Nikunj Kela <quic_nkela@quicinc.com>
Subject: [PATCH v1 07/12] dt-bindings: i2c: Describe SA8255p
Date: Sat, 22 Nov 2025 10:30:13 +0530
Message-Id: <20251122050018.283669-8-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
References: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Woom8Nfv c=1 sm=1 tr=0 ts=692143a0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=apMzWF-kzHp83YoYYzAA:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: IUtVLfbAzxqQvld3QIti_PaRqoRxZIJT
X-Proofpoint-ORIG-GUID: IUtVLfbAzxqQvld3QIti_PaRqoRxZIJT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAzNyBTYWx0ZWRfX3iznwVF3nREG
 tuRbCH9HEEseRszmIllAOYk6o3DRuYVETOKP/NJBWJh57ib3jJNIqtPpt97PEAz4uew3ze3fP5g
 n9on56Aiy+uZl+L9zlnaS8Ekd/diNYeUyydF9eY6BGtx8w5WQcqLHAMiLEsXFTEIkaO3QsQZGTs
 Urbtwrb43HIeCMJmq/sdYgsHs1K/EaILUmtKfhtyi/hcN1antjS/bjSfdqsZQiMvkTp7zGginex
 TN91Bv8i42BdFUEvSwx0v8TRVdgOJ0Zb3U7Dvr7hHCyjZ9ZxTwMtvvXV/slG/uDNgGOWsFLRdsb
 H1bTDFccVPrDKd5QWhhxot0Bis3tgP0x0g0QNMzguNbFmL1ijELLFEzZ3yOGjW/64Mgu3b2mRSB
 pzwueEjhSrOl1ni2FaJ6CCP0T+hHaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_01,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220037

Add DT bindings for the QUP GENI I2C controller on sa8255p platforms.

SA8255p platform abstracts resources such as clocks, interconnect and
GPIO pins configuration in Firmware. SCMI power and perf protocol
are utilized to request resource configurations.

Co-developed-by: Nikunj Kela <quic_nkela@quicinc.com>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 .../bindings/i2c/qcom,sa8255p-geni-i2c.yaml   | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml b/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
new file mode 100644
index 000000000000..3ce0e0ba365b
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/qcom,sa8255p-geni-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SA8255p QUP GENI I2C Controller
+
+maintainers:
+  - Praveen Talari <praveen.talari@oss.qualcomm.com>
+
+properties:
+  compatible:
+    const: qcom,sa8255p-geni-i2c
+
+  reg:
+    maxItems: 1
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    minItems: 2
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: power
+      - const: perf
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i2c@a90000 {
+        compatible = "qcom,sa8255p-geni-i2c";
+        reg = <0xa90000 0x4000>;
+        interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+        power-domains = <&scmi0_pd 0>, <&scmi0_dvfs 0>;
+        power-domain-names = "power", "perf";
+    };
+...
-- 
2.34.1


