Return-Path: <linux-arm-msm+bounces-106286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BmtfE11I/GmBNwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:07:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFB84E47EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:07:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 305E230074CF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 08:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 624EC339705;
	Thu,  7 May 2026 08:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KLTIG/vv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eFnKFh3f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF0E332EC5
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 08:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778141262; cv=none; b=HuiP5Ksn0hM3NIUaffOobu8dvWXjYlFhoXLCHszS6GOQTwdc6NVMKpj3/S+PlqzDCcfmfgNIGdKjjkemYVhpvZ8FZZpU+YtqkP9T7xM2B6bkP6woyFlyLxdqwUAujTZgR7mRE8OnuYVJWbJXa6jWH3dRF8JHOad9Hc8+CdtUboA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778141262; c=relaxed/simple;
	bh=9Qh4fmkenOmKXsyIaxgv8V7EpyQ/2U8vJ9aklo1RGnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e92ePzAN6SCg8skY1yEtwYmv6xh38jwoFAd8fKj8DyB/BBerAvBoQY86NvRoufVVnkEc8H7cvxY58AvvjGI5gMBZo52wcM43Sj3z1H5g6SYxNx6UG4ygchKV5+1rTvxzoW8xjyaaTaRYpHrga6Q3+SNhxgCao/8UbVKNcl2BrNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KLTIG/vv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eFnKFh3f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6472LgfC3464902
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 08:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V65FA4kfYsJ9drVF7u1hWLUsFI2aVhl4lTM4wTfUbW4=; b=KLTIG/vvRLYNDWx3
	Yqm2ujYBjObiBozcKRL5YnQgBw83MxvSZAnp2tXXccgxyFGyjud9z/kt1dXdfMmY
	N59Rwd69rbwyhTFIUH5TpSvygePJTu8d6CNwIx0dHf98uJvkZElaGaSR52fGyJwX
	M5k2o6LSov65RKwhxY2VxEN2V7eSj8OlemrONjyrO9i9WyUa+Mu/E8ut/zJX4LD/
	rR8gpij6H7hbvLbPmKjmPoPWGKdgMVpYayknVOPv4RbhvfeihX14rLcKoHQQS13X
	3lS/WOI0YD/5CYlEwVjR9w15wMPsF/kSqXDxFduMo/z659CX6eDS5RNva9zzqoHN
	vO5Cpw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hvn13un-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 08:07:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365290bc580so376206a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 01:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778141260; x=1778746060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V65FA4kfYsJ9drVF7u1hWLUsFI2aVhl4lTM4wTfUbW4=;
        b=eFnKFh3fPBpcQDuTenuDGRRlqYOpsCKx8Izv2zjG6PuDhi+GYF16ZWG3wvYDGVISv0
         zlo5y7kVN1gPV3XElwQv61kQMDM/p0/9veYTR/irFkUHE9c+tkMz0+9jiSuj7K6yLu6m
         8aCGWrWzgYqjaWOYouU7dcUW9DZ3BVrn1bxXwd61rK+is1SFCrsZxTFZE3h0CtOMO9Ae
         +bBNhxzpApNZ7LHEeSRDWdR6KiV2MJj98S/UIiyjDWTTe7SLNAPSjK0rKWGurri3ZAEi
         jjmaYaml8SOYgs1maipQxdYmtAWU+j11/IfFM09O+O9CZZF0WJwSmr21TqPE2Kwk3Cv9
         L5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778141260; x=1778746060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V65FA4kfYsJ9drVF7u1hWLUsFI2aVhl4lTM4wTfUbW4=;
        b=bgpAmN2rXREb9cRp9LqZ2Ek+J2bDV82TXcbd+vdC6+NV2d3fBSmaivbi5R/Hi2uFDs
         RRLd+iHu0XRn877qCGBEtTvmGIlt3nyBcmyNL2BxktMU81T0k7HDt3FpXz8CxS550gN+
         K2vNEyRgDfHob9Gxq4ZyOOFoorccl4XysPUNJy3+JqQ2J5VaMdB1XY2eXwQPSH9Dimr8
         GznRj2/TUoqx1Lu7rtumpBLuRSAjo08FMtqODbs12UUltdQBV5BFWzHochA3zqepArP9
         fdFD2XipZnFQW6iPhHIBHY7SS7JEJf0y9nUgnizKX3usBk3EewbQO+ESiONjvGw4IAZS
         l20Q==
X-Gm-Message-State: AOJu0YzzdayJtAW0xiWCSjq3Q2SGvM2qAsZtFrvVZNVuAinCm4PGpzzB
	+dy7PdJkKqzEu59wVyt4GnC1ouT507Zr8XmlCvy4U6aUUXzTrc5fVy3YU3Wih4RP37w1K6014Em
	MhLltU+RgeMbD6mjmn3YVOSvrc8fXm80I4xDG/wfONam6/E0pstmz4dUxf6KcKBmoxNHB
X-Gm-Gg: AeBDies6GXe4i7OoNv3E+g8ZkDkbO5p675Riqs3e27CCse6OrS08DEvle79DCRSBp+R
	WXz4LPqIARs13v4vohi4jokxgRcZnzqV3AYeM48d80InBFvA4oIk4WTmCpAmh0O9bHk0jrEkAWj
	9CK8W/GzVMrElDbcousmOUigno7mhPIjj9P8B+Ao0dyTDH0FRzA9RpqZb9KWu9sV8UsSRK2NLap
	a1yfLeAHE40welE5zd5nxVAxlHuP8o2gsQNdmZSRgtXOSkCejzSJEC/U1EQbV+k8kxtbl58yqqR
	v+2Sbvnq6rDoPevqxq0jy7lOqj3nJxQTlX0wNVkmwwVK5/Ht8HFdhA6Iqm3CHckVyZTZYHTJ/uU
	ptWPhaM3vPfLWi1yPlOkw88v06izjbCRmJLFQYOqe/i7jHfQVTNPJt5Siu5E=
X-Received: by 2002:a17:90b:2248:b0:35e:3103:d4d8 with SMTP id 98e67ed59e1d1-365ab9b8c31mr6669197a91.6.1778141259398;
        Thu, 07 May 2026 01:07:39 -0700 (PDT)
X-Received: by 2002:a17:90b:2248:b0:35e:3103:d4d8 with SMTP id 98e67ed59e1d1-365ab9b8c31mr6669167a91.6.1778141258861;
        Thu, 07 May 2026 01:07:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b0560fa8sm1986094a91.1.2026.05.07.01.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:07:38 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH 1/4] dt-bindings: firmware: qcom,scm: Add minidump SRAM property
Date: Thu,  7 May 2026 13:37:17 +0530
Message-ID: <20260507080727.3227367-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA3OSBTYWx0ZWRfXwGxwLNTV92sF
 FuJ9G79MIzLYbccRzna/Zh0mvfunlclRhVBCksCNHTHM3SRvcMiA2b89WGK+GXi+uHUgTqOpVR2
 QAS/7aPQHBE4EiEVyvjC31+/1P4kIGK73+h7DdArWfIkJa6uQGnzyrw0zqJRDOd6l9iMc3o4SJK
 /vUtK/CpiWfXAqMrSyN2Q0jDaJ95N+9s9tyhgrN6hnuzAWcbzLONG0Zjarmajkbc5RXmtFgEiCU
 jM2MszumE+nMbDfDn2J3vdmvE1czl95jdvKmfUqawp+MBPbBu3teARZmJzySsGzx+00TY6YXCde
 snmFntufm3dfH4HxXNqEMghvDzNymGUXT74dGt/UJbEW5dEJ7wOIu2x/96JI4YK65e2LBgAbhH2
 0IpdLt539GCurteidywitUksGinqNaST5ERG36x0rlqPF5B0ICW2svDDW/d+S+a2JRJ8EZCDWcn
 j5oFVgXBER1BHS4ke3w==
X-Proofpoint-ORIG-GUID: 5ZqjZEkG-0u38dWYL5NpZlYF_L4fXODy
X-Proofpoint-GUID: 5ZqjZEkG-0u38dWYL5NpZlYF_L4fXODy
X-Authority-Analysis: v=2.4 cv=ZZ4t8MVA c=1 sm=1 tr=0 ts=69fc484c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=fNLuE_qgFUpq_f4Vv_MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070079
X-Rspamd-Queue-Id: 3CFB84E47EE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106286-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On most Qualcomm SoCs where minidump is supported, a word in always-on
SRAM is shared between the kernel and boot firmware. Before DDR is
initialised on the warm reset following a crash, firmware reads this
word to decide if minidump is enabled and collect a minidump and where
 to deliver it (USB upload to a host, or save to local storage).

Add 'sram' and 'sram-names' properties to the SCM binding to describe
a region in always-on SRAM where the minidump download destination
value could be written. Boot firmware reads it before DDR is initialised
on a warm reset to decide where to store the minidump either to host
PC or to on device storage.

Most of the Qualcomm SoC supporting minidump supports this, added the
kaanapali SoC for now.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../bindings/firmware/qcom,scm.yaml           | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 7918d31f58b4..6813081fd74a 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -127,6 +127,22 @@ properties:
           - description: offset of the download mode control register
     description: TCSR hardware block
 
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      Phandle to a region in always-on SRAM used to store the download
+      mode value for boot firmware to read before DDR is initialised on
+      the next warm reset.
+    maxItems: 1
+
+  sram-names:
+    items:
+      - const: minidump
+
+dependencies:
+  sram: [ sram-names ]
+  sram-names: [ sram ]
+
 allOf:
   # Clocks
   - if:
@@ -229,6 +245,18 @@ allOf:
       properties:
         memory-region: false
 
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,scm-kaanapali
+    then:
+      properties:
+        sram: false
+        sram-names: false
+
 required:
   - compatible
 
@@ -247,3 +275,32 @@ examples:
             clock-names = "core", "bus", "iface";
         };
     };
+
+  - |
+    /* kaanapali — minidump SRAM */
+    / {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        sram@14680000 {
+            compatible = "qcom,kaanapali-imem", "mmio-sram";
+            reg = <0x0 0x14680000 0x0 0x1000>;
+            ranges = <0x0 0x0 0x14680000 0x1000>;
+            no-memory-wc;
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            minidump_config: minidump-config@1c {
+                reg = <0x1c 0x4>;
+            };
+        };
+
+        firmware {
+            scm {
+                compatible = "qcom,scm-kaanapali", "qcom,scm";
+                sram = <&minidump_config>;
+                sram-names = "minidump";
+                #reset-cells = <1>;
+            };
+        };
+    };
-- 
2.53.0


