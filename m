Return-Path: <linux-arm-msm+bounces-70357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88796B31575
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:33:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2956E17FDC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4E72F547E;
	Fri, 22 Aug 2025 10:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="boOos+9C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074972F531C
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755858624; cv=none; b=bfmRZL2MjbxkmQQDuTEe6Bog6AE2freoGYpCgBLv5NKx66GmVgqONwQsYmDF1pJi7l2YLrrFw3maEvcKKP52qsMZKOpZTTjIRVMQxVSiAL7gX1bMoHnJglu5iFHFDhK8xDCInwKoTomO6LsKw/zjyE499HIn0Yk5VBCpf3lWFEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755858624; c=relaxed/simple;
	bh=lupYMam9LLXLp3lz2yHeBjn375m15PN8RsLr1il2qz4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VsO8l8DLbmEfLAcaW0HJ779QE6qCGbuLRYb2eB27E3QFs8Oriy3DSGDPpog3VrS1kh+BI5H6jLCJr7rqu0ZiF9vzPHWSX9dUR7eS62Ivs59kVlc5RS1FBScLht26OTE00NiQVd44W8Ce/FyJeuzHV/iEbDn4Sg8S7CkOjMLGBt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=boOos+9C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UJT8017910
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gCwy3dvuIrM
	dK1MGJRfo/KSQbLvNU+8cRJsdk8nhlss=; b=boOos+9CSb0d7q0j2KpZIC3i8sx
	Om9eaEQEiOdoPPDmEtMO3Ym65g96W4d/O3nxB4YM/6EYKea06xwiEUEPt1kS/Vch
	0O2G0NOXDP4CvevG3gWcMQU2Mo/7BThNNVIUKCo5ozl49Vrt4sh/qm58Jgpslfya
	iZZFQlecBZxjDvagnLXjsmRPhRHLVdI7mWjCsnUg/1ZKVmBMo9wtVfR9lbVlIMDv
	ukBQqy2VnGxC62Q1gF2bLMo0k57yWfc9VbxwfT25RhC/34GlTeia1g2zrcK40HqV
	EWanCILbUrPVpjajBnk6p4jz2tpId6YXhFetdsC3UJC+xQvPwzxvjGiMjow==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52b0rd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:30:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b474d5ff588so1627711a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 03:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755858620; x=1756463420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCwy3dvuIrMdK1MGJRfo/KSQbLvNU+8cRJsdk8nhlss=;
        b=p4CIDttrvGDsn12Q63vldi2yDKO9k6dbd3gIBLW3ja2qr7f2QltoBgjXVXGI4vMY+s
         zyUZA3pYQrWh+RW1fPFIAw9Rq9+7DRw5nI9aOqHei2UET58oQj3B3YT+lemcg80W8mrK
         yuz1gISrl9FBqj7gIfQuNOHLEczN7PYpnBa91sNOO+S/l/g0GKLXhqLSlPNGPC9NrIbp
         r5zmk7CKwj+y1kgcqv+gPEeZJ+WfogKBJ5CO13CKXaDw6t32d/0fDr0iutjp0SM0EB7z
         phgeZwPyAHLLCYaojwdBuJ2mi4Tq65CKNgsb/SQ5mZfajsTgSdU1IL7g/slm3PjpQexj
         FrCQ==
X-Gm-Message-State: AOJu0YwpLAlFg+NqHPrqt3Cl9qDzbWFz0WDUhMiYmFTo5PkBbVwPWwRU
	rW2tqhk7nUsad+b5RzHJoUjwCFpDjaC6orJBdF0akUPxAE6t18op0XKiJYWfWllURKXfZE4MOLW
	pMpMaT4NbiWwrZ38ZMS7iO2oznpqoY78dPB0wrr/YUGpF264LhTSs+CyTxe7Mkk7fSxKJ
X-Gm-Gg: ASbGnct55tN55W1aVNM2rZ3hoOmfO7GvGtQW4W/haqMe/4jK+vqNXqPlZJ1hMHuDucx
	CyTSuEnRL4k1TmsWNwAjPY0V2Z1F9XcssIcumMgUrOjZ9Gtw5S5cgtXh0XUGj5XSfg1jMq3UCb+
	mwleZTtMicvolI9y8hayD5IKrK6Qe4EJxd6Ld23bSe6zFJ5mW6BET6YX6t5LgFwlPhZbAR07KT2
	UsE5l7N9n9ZOvY4W0dsb0Six8N9c5UuzLoZwaoUHp66QADjE027oQdXAqXqptiYipGsmm+kAGEO
	sDwAmXGAFOy2OZuF1/5bGwWTBMhAbTm1zU0qfdCxSF7yZoPnutYvys7OW8msIXBfve/yeUMJvS/
	fyUFqWk/1FJ4IwMmGz2Gm
X-Received: by 2002:a05:6a20:7d9e:b0:243:78a:82c2 with SMTP id adf61e73a8af0-24340dafb84mr3496892637.60.1755858620423;
        Fri, 22 Aug 2025 03:30:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9UES8ED+cVPXc5NWnC+wayYDGQg0OQaM2qTYYN4XoyrxVTdh+n1/tYchJ9/zAVN44IosS4w==
X-Received: by 2002:a05:6a20:7d9e:b0:243:78a:82c2 with SMTP id adf61e73a8af0-24340dafb84mr3496841637.60.1755858619984;
        Fri, 22 Aug 2025 03:30:19 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fec0e9sm6825196a12.24.2025.08.22.03.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:30:19 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlmao.mao@oss.qualcomm.com>,
        Tao Zhang <quic_taozha@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindings: arm: document the static TPDM compatible
Date: Fri, 22 Aug 2025 18:30:06 +0800
Message-Id: <20250822103008.1029-2-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822103008.1029-1-jie.gan@oss.qualcomm.com>
References: <20250822103008.1029-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX4wJxalegIDCv
 8nlpe0otJR+qsoct/2NloimDu4nHBbxtW4G62xRiV8CoRMP0HfJF0Kch8ayAhaF4JlrIBgIKrB3
 Tre+8izbKjnQtHhvskdhSSZxQIbpTuO24AOr+T60f5wz7sIAesvtFc64B9YmmRGEW7gei66QiLm
 l0mKYpQf2FSRixD3ds5ZGa19+KtHZUJXvdrT3FQQmxukuad5BGQ/p8EdJuVtm9hTlamA+eJRBHp
 CtHYucmk5nSUGN3H2hOibgvplKwsjDlTR5keOlhC3FArfk5X1DUdRz3LkrdOnBcR+YXrEpViQ2i
 zgCrpb74S3ldVhuKpRGFM7bfztOPyfT30Eenrny8Xzdz8PHIPaQ+3LP1ARUrg+4hxlIkp4pQjJd
 CjzTWIA9Conmr0rpOlUaATKywVeqXg==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a846bd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=5Z_N_GBq0btHVWfAyk4A:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: F_6A-ISSZQ0rYQ48KSyTS3qL4aAfsL2s
X-Proofpoint-GUID: F_6A-ISSZQ0rYQ48KSyTS3qL4aAfsL2s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

The static TPDM device is intended for sources that do not require MMIO
mapping. Its compatible string should be documented clearly, along with
an example illustrating how to define a static TPDM node in the DT.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../bindings/arm/qcom,coresight-tpdm.yaml     | 23 ++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
index 07d21a3617f5..7c0acc1f25c5 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
@@ -36,9 +36,12 @@ properties:
   $nodename:
     pattern: "^tpdm(@[0-9a-f]+)$"
   compatible:
-    items:
-      - const: qcom,coresight-tpdm
-      - const: arm,primecell
+    oneOf:
+      - items:
+          - const: qcom,coresight-static-tpdm
+      - items:
+          - const: qcom,coresight-tpdm
+          - const: arm,primecell
 
   reg:
     maxItems: 1
@@ -143,4 +146,18 @@ examples:
         };
       };
     };
+
+    turing-llm-tpdm {
+      compatible = "qcom,coresight-static-tpdm";
+
+      qcom,cmb-element-bits = <32>;
+
+      out-ports {
+        port {
+         turing_llm_tpdm_out: endpoint {
+           remote-endpoint = <&turing0_funnel_in1>;
+         };
+        };
+      };
+    };
 ...
-- 
2.34.1


