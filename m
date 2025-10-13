Return-Path: <linux-arm-msm+bounces-76930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E562BD1855
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 07:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BA83E4EB058
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 05:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CFA12E22BA;
	Mon, 13 Oct 2025 05:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q3tKhg0Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACEC2E1F10
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 05:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760334609; cv=none; b=RZ1cLykfcxAyFMwXUyYqxhWPs4UwZrE0rZOlCIppp07asi4eYTDQlkTsqNZMhhVM7u3cwmnsmwBKh51tVOYReGluCiOKKKWfCpTuXcRvCeXNPWFmQa5KuJcx7R6vAMFsUx/FA56s2OT99CGKrHeGrXv5QOXReRTQWpKGgE8Od1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760334609; c=relaxed/simple;
	bh=CPQNjReZzEuthWP4R2lJNdjHauXO/hHJqKsK5LCwEHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bMRO1ADV8A6NdeO6vMXylMj+/VJjwkjgB/ub1zsgD2WOReblD70a/i94K9uV/Ihqhv/2vy0V/m6kfyWIBGeDPksdhN0RYCXr4rG5j2VxteV+pCTRyCmqb6yklhBTQ2pT7KApm344Fk5wDy0ceh9ZhpwWAlRhib3cUdXoEIMHxb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q3tKhg0Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2nEVO022354
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 05:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RsycQsQDunAKAjG18m7RQFoGc863uQg22TnoWmsfuDs=; b=Q3tKhg0Qt6P5ntJF
	cOWwJnxBdef2kw45mKEa5vFAy6gxCnYYwjVnThfK8YxWpbq3bpxd6QwXhHhsetnX
	GzGldlya7rEkoFbxaKxpCuX0DvZzQ3jQPYTyg503j7kSscGFP85+WFuV4iCDUGzJ
	OJmDQ7xeu37aXwEct9Z62zxDy97je7SV+I95HsSkRm6iAaT2/UmaXqfsUEOsK5PM
	TpqOezjnFbusexdWPCAGiQNES+wwM+KYh78Kqut+FNRVmRjBsV/pw+iOFf/+bfM3
	uPQSDoZ6dD1MDxUHd1065x37Yu7zgk0sKDLu3JetBvSCLCeoXpGYR2GIpeloiZGg
	NVz73A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdfu9xb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 05:50:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-78427dae77eso6737106b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 22:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760334607; x=1760939407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RsycQsQDunAKAjG18m7RQFoGc863uQg22TnoWmsfuDs=;
        b=NmL4z/LXlfrCID+eAx42Sa94V3YNC8YuVLhwLn8cFW9q3CXw6EqvO/b1i4jsgzRMK5
         fFW6hM+oSJHYZ6zxUJ1vu0lPKrNmI4JWv/bzKLnYUKKpAFcpruUH6B4BgzRMyy9A2++B
         Iod2/DJyNjchENs9nAjO1FplReDapeM7cwxflsrDa31UkarWegOKQcW5YZj9PSrFgCof
         TlavCQEFpuai5tS97oZE0fMoYr1RgZsgwVDov1knbxR+/fvnUyOV9w26fBWcrJI5I5uI
         JShdSO1Dipj8q3yX0avZELIIE7ujPqDZvIlo+/R3cM8Xc+7Fa2BcRTtmdRWvfZXgGDsH
         S5bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM/3VGU1YE0NP7HuCgH3kj3taDH7Nex71hB5HgaTWll9tTtuQ06EiIZT9BvL9Gahx0uOJ87HEzAWpoHL+l@vger.kernel.org
X-Gm-Message-State: AOJu0YyqJwcqbRdWdvHKm3gwYLXGVgW1TXkXb/SZxs/njGhlresZtkEs
	BayMvT3A7lF0s09R8ozu/wrTYLXaAzsfQhlKmC/XL9YYBu0kv1+yawBmJXJT4UVMTwO3JdwJwZu
	XDk01/pa+jRr9jMwJk+h3ImbnU9Ab1EiIriOHfAp1I8bfP/g061HBzRF0c6sMdoHyR1U4
X-Gm-Gg: ASbGnctFP+PYeBCMA5yeqMT7d7CZwQ7YHDUPoxgTZ3Y2Aylm+YeMVxcPqS1Q1u9dCcm
	GzTnpzH6OfB1hdbXYbaLaCrfAaQrsto6LEv+qc1AMVQdfaEhkFEI3iyXISOmor8v8JhwiyvcKfD
	9HiCuGzRK+tctwaak3rjQdRH4rY5H6ZfErvTZ+ft+Ux1iixObkJz84d/tGOCRcCAYikpx7FKIvj
	v3voiDMJjAEswvJ2qZvAxhNtFccTlrWhvqoDPW2WHb4Nd6VbuHEy87P9/pSuLfhZoR3GEZQHG+7
	1dTp4+z6JEFQ374q5VRenPX80VHr6gYWeM80TNEfInnmYP1rB1feRZS8l1ibj6UqyVlpSCt0kit
	ZqunVzRfiZRM39VrMDjRIxtONS4w=
X-Received: by 2002:a05:6a00:886:b0:77f:449f:66b0 with SMTP id d2e1a72fcca58-793883dad54mr24936545b3a.32.1760334606563;
        Sun, 12 Oct 2025 22:50:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAWCgGwUZgm58CiKTOQW8YpRQefy9Oj0tMsYK5hjcqfo9P/GDSHFU6aimLp46L1AlwnBdA4Q==
X-Received: by 2002:a05:6a00:886:b0:77f:449f:66b0 with SMTP id d2e1a72fcca58-793883dad54mr24936514b3a.32.1760334606099;
        Sun, 12 Oct 2025 22:50:06 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e1336sm10129898b3a.59.2025.10.12.22.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 22:50:05 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 13:49:15 +0800
Subject: [PATCH v7 6/9] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-enable-byte-cntr-for-ctcu-v7-6-e1e8f41e15dd@oss.qualcomm.com>
References: <20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com>
In-Reply-To: <20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760334568; l=1810;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=CPQNjReZzEuthWP4R2lJNdjHauXO/hHJqKsK5LCwEHw=;
 b=E7D4erC9cNnqmN3+hV4stIfeW2COgvL6aUFQ3zZqFMBAx/RfATnpgwV3/QmCnzco2wauJocyy
 CRu6J+UQWwXD/eqErWvs55GM6UbPa9O498wfkhVWGT4UGRBOMuVkKRC
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX0dkqOL+aP5SE
 Sb1qsIg+km7qdH9JXK2FK9O6YfWBxQ+b/hkmZEvZgffSPQlD+qN3g3yykqL/sowbgZmUpFfSJTT
 45SJzv/8qz2UJYGx68t1BEI1wln0a8CxI1sN9xjozBASLpESv2yoFm5DpxCuG/pee6BnMInxjkb
 e6wtfDJWoLVEAH/jN4SsPTd+HM76+DqqMUNkTVVVSpP8Q+DRc8p8kbHo2Mf04CZ998n2O+DZNeu
 phr1dneBJdL4RZxrLAv+aP28SKHljieITCRwDdPyWIWHiiuHMLHsKISbIKcK7sw6EqLaE6iLNdk
 9wwlsBKYZ4BOZ60jyI4i5I8vCAtikxqWBL5likpPBc48Wbzysdang9Mp08ASbA9Y+tcFIfxVpfd
 0oPoDASHaLCGk5cH/uaQ4obnrS9/lg==
X-Proofpoint-GUID: ePlZG9cjVGG5Z4vgDz5hNILflohXXTAr
X-Proofpoint-ORIG-GUID: ePlZG9cjVGG5Z4vgDz5hNILflohXXTAr
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ec930f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index c969c16c21ef..02797e5f3b58 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -39,6 +39,16 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Byte cntr interrupt for etr0
+      - description: Byte cntr interrupt for etr1
+
+  interrupt-names:
+    items:
+      - const: etr0
+      - const: etr1
+
   label:
     description:
       Description of a coresight device.
@@ -60,6 +70,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -67,6 +79,11 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "etr0",
+                          "etr1";
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1


