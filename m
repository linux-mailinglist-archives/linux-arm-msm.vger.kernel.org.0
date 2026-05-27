Return-Path: <linux-arm-msm+bounces-109929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFCUGFSDFmo+nAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 07:38:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F17575DF80E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 07:38:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26B4E304CA64
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 05:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17DB30DD1D;
	Wed, 27 May 2026 05:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pC+m3AqK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AJMHSCli"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2167230C14F
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 05:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779860243; cv=none; b=cEvAMlNWu2Ky/P5JPdjCK6P7eqYPF4xIiY5TaApVCd++rUMDUyR+HmLg7lXAODX28CN9tvOfkSFAH65BzKSl67PuqJFJA8oUd4iApPZK2dLRHW3X5iQhxVaRPTS/8vBSzB5rtp8AX1+X7IiyVQ4ssG4MaMzuYmBZjZD6S6ucUTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779860243; c=relaxed/simple;
	bh=dMLwqR1crQi+4CdMwYL+C6nmcS074NTfuxIqhzbU6rI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FJJuxQpJSLsPSRKgM0vasrAuqyy3iWJ2pYMjr7U92DqWhCR63ZFOOuGv2Dv7F5luTTHQqld6erlp3oF6wHKUlU0Ir/wrHTKsNt1ZMeJtrJ2z/jEqJAfANY0/ua0R25kOqoh/fnHowuoQFgVujLfxVO/0tI7ooSYYMxY8grelJzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pC+m3AqK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AJMHSCli; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R2WgoZ327125
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 05:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U/BfpPPa6tLkYdFoTNDCcKAqwX8p0KQApAnuVt6hWic=; b=pC+m3AqKIPRfqehx
	dTwXuVZ17ZIvPlzJG+YmZPLdfMPLQJqZ2Ra4jjfHzZXkVA94hsqRdWc4sChiluDs
	6yvx3z06pB5YHPoAFyksHFz5Jyc64u+pmqNuhGWCOuigIUFbtUsHIGSy2JddiVqX
	XhCbbGiZn7kV4OgbWfQaKTY+UZBhdpfUsvOhCvqMhCtlGtVSCKUYppaL1TwgP9aQ
	5eBfkGg6imYrQaZcG+4EJyNsWGyKV78xN4Wk1+ZS0K19RHpCJRzyQE23BJji9hFM
	hj+jM7gIcZDHnaKqcYaJZ/QAYq7LSx+a7QzsLOg5VOSaTmXCoAzPRNX7eM8DBmfg
	deHK1A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edndngyky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 05:37:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba86e35aa1so180906085ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 22:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779860240; x=1780465040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/BfpPPa6tLkYdFoTNDCcKAqwX8p0KQApAnuVt6hWic=;
        b=AJMHSCliTb5WNHxPMlycpL2Lpf10Aok04Q2zDwrz0JhkZtkzXB32IkOZ0uPe8Di5U6
         NmdD7QNeTTQ59n2C6NUkTuFnd5YzkTEtRBdQlAtf7nAFeFStNp18rc5foL72XkYY0OKR
         eYGhmLmHtP6TdLNI5jPS+kwSn2EvlG6sHFz15tSaUUI47oIcljVG05MB1/qCvwkZ+tKw
         KyMwMxMbMIZ4izqQX1hl9ZGZaHgmMk3jQCkDilu/c3XlEvepv2D/Mk9uvAE/l/d0aa3Q
         0YF7HxcYSH4ZZUiHeT+s3Q8XAUzxuma/8iv767V6a50MjzqmrYEUj+pNgVnrsiwNgkiI
         ddHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779860240; x=1780465040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U/BfpPPa6tLkYdFoTNDCcKAqwX8p0KQApAnuVt6hWic=;
        b=soAecdOL0O+wGk19DgcTa+r803WXIpFG+IfByRKCQulYI7gfIfDyDvBKBDotqyLaa2
         URMd00v8jH2xSnfN33i6KYTI9d8fv3kyZSLv6/Dj84ya7lMgLHfIMMR5f7kNNs3ys6lU
         X5sEzML7m6IZOaLUztQ8q5VcqFrpaPmX4AIe2gxO9AHaglN3bJoDrkyv9kDuLNxK94RX
         PgC2DCv4A0GQH2gCKZIC+LGA4c92Ymv2X+dl9eE+8aFsjtcz92iqL3lNNDzCCJcPor69
         Slf/EZEipVOdGPYyg3r3acJDlcZtxrRdErqvgQEtKPYAJKrOBe5MsxlHkidTQ85fBbDs
         WfdA==
X-Gm-Message-State: AOJu0Yy7OkCfN66CM2P+dtTnc8ZjJgomtUI+yCv/aIRJ7n+C+nlXahGc
	r5UdhkKbT04nmrj1LHb9XJ+iWIbhmws7ZrfML8LmBD0AlEpV86uQsYxnC2vHQ3LK1RRKal2QQSQ
	DJ71oTgX8tQ5W/+Ow/aUuwNZnEIyqsO+i8Y3qoiuKVk5DNZJNZ8bH5JtjQAvoiwUEdbob
X-Gm-Gg: Acq92OF79Hq5jLvdCUikc4eKpMajdXOax9Ljuyz9zpLFcZVoJ6woiKSZtXi+MG0FBXc
	CPEgSqlS3dW6q364czjzBobCFxYsxAIEzcT3/TSWaKGmjQTuYcRfQO5S7NNOA8yUVUQwxrrR3Cd
	Cc5F2l07g4ZC1tZKPDedyQnXdeQ6zBQmB+KQk5Z3NqPy9aQp8dPsaInN0JevSDUq2cLTBPtIRZP
	N+PZRZb7M+Cf8kj+evzjNUdvgZBZNz5W7JG726iutlDZnYaeeY3p2IjQpzdf4xChpgYn2+PZeiY
	lXtYqRDFNa5hbyiDYvm4cMIdDLcDUEba0Dj3SaBeOhE8ELgMMR800ZCN2Q68+VKFYxb74Tm29u0
	8ONER7gw7ZfYX0up5JGYlLsdWO2jbYA5uMdvj1coL1hCu
X-Received: by 2002:a17:903:46c5:b0:2b4:656b:aeb0 with SMTP id d9443c01a7336-2beb065e2bemr269819335ad.35.1779860239938;
        Tue, 26 May 2026 22:37:19 -0700 (PDT)
X-Received: by 2002:a17:903:46c5:b0:2b4:656b:aeb0 with SMTP id d9443c01a7336-2beb065e2bemr269818955ad.35.1779860239326;
        Tue, 26 May 2026 22:37:19 -0700 (PDT)
Received: from [169.254.0.3] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb569592dsm136338585ad.16.2026.05.26.22.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 22:37:18 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Wed, 27 May 2026 05:37:09 +0000
Subject: [PATCH v2 1/3] dt-bindings: interconnect: qcom,x1e80100-rpmh: add
 clocks property to enable QoS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-x1e80100_qos-v2-1-305c6539e6d2@oss.qualcomm.com>
References: <20260527-x1e80100_qos-v2-0-305c6539e6d2@oss.qualcomm.com>
In-Reply-To: <20260527-x1e80100_qos-v2-0-305c6539e6d2@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=PpSjqQM3 c=1 sm=1 tr=0 ts=6a168311 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=NnUtUk1SRsyLyR8-XE8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 125oKmDvfE7YiQWht5nPaqFT4l2B__wc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA1MSBTYWx0ZWRfX+8DxSQT6GBAV
 KclYOMV71c/TBDaLoC0AE4lJQGmqQdLOTRwmFcYe7n/ra3/6LfIEtjQu6t+Z81ELVy20CUpWLl1
 Obxx1qPYXOVRpTuLyXDCj1eQilHakKE3bcnBPC1aJv2L1VGU1s/V7KbCqWdfcd3krF+ivFu0bwI
 m9qvzSjHCn3xCFJDFwvEGrrCtcC7PhYSoTU0a2YFyfz0z5E3j4ezvZQ1z2VtHdyGLYobrmDcIyt
 tJAyx6Ig5NuFnB1HWkf0jxDjtt+aXH3iB64w+AUjoiYYfDlgCDA+zR+OxKAEkiCUFJ9O/V0I9QT
 /+ukJl70+Us9e/DvWHJj+8N0Dv0xgKyZVRZouPcBXqPOfSnLYjBqkpswMwgO4bZ/scCUQSQ76JP
 9BJEtLHHBRHHHXcZaLrPOQII4qy3KOapuf2BAnfdDTTvaxikhvi3umo8dkUxA2KWGua/4ihbryY
 jWRFPjTzlqOIXbx8Hfw==
X-Proofpoint-GUID: 125oKmDvfE7YiQWht5nPaqFT4l2B__wc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270051
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109929-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F17575DF80E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some interconnect nodes on X1E80100 have QoS registers located inside
a block whose interface is clock-gated. For those nodes, driver
must enable the corresponding clock(s) before accessing the
registers. Add the 'clocks' property so the driver can obtain
and enable the required clock(s).

Only interconnects that have clock-gated QoS register interface
use this property; it is not applicable to all interconnect nodes.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,x1e80100-rpmh.yaml  | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,x1e80100-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,x1e80100-rpmh.yaml
index 0840b0ec6e27..d863cddb21ac 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,x1e80100-rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,x1e80100-rpmh.yaml
@@ -46,6 +46,10 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    minItems: 1
+    maxItems: 6
+
 required:
   - compatible
 
@@ -65,6 +69,73 @@ allOf:
       required:
         - reg
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,x1e80100-aggre1-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre UFS PHY AXI clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,x1e80100-usb-north-anoc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre USB2 PRIM AXI clock
+            - description: aggre USB3 MP AXI clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,x1e80100-usb-south-anoc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre USB3 PRIM AXI clock
+            - description: aggre USB3 SEC AXI clock
+            - description: aggre USB3 TERT AXI clock
+            - description: aggre USB4_0 AXI clock
+            - description: aggre USB4_1 AXI clock
+            - description: aggre USB4_2 AXI clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,x1e80100-aggre2-noc
+              - qcom,x1e80100-clk-virt
+              - qcom,x1e80100-cnoc-cfg
+              - qcom,x1e80100-cnoc-main
+              - qcom,x1e80100-gem-noc
+              - qcom,x1e80100-lpass-ag-noc
+              - qcom,x1e80100-lpass-lpiaon-noc
+              - qcom,x1e80100-lpass-lpicx-noc
+              - qcom,x1e80100-mc-virt
+              - qcom,x1e80100-mmss-noc
+              - qcom,x1e80100-nsp-noc
+              - qcom,x1e80100-pcie-center-anoc
+              - qcom,x1e80100-pcie-north-anoc
+              - qcom,x1e80100-pcie-south-anoc
+              - qcom,x1e80100-system-noc
+              - qcom,x1e80100-usb-center-anoc
+    then:
+      properties:
+        clocks: false
+
 unevaluatedProperties: false
 
 examples:
@@ -80,4 +151,5 @@ examples:
       reg = <0x016e0000 0x14400>;
       #interconnect-cells = <2>;
       qcom,bcm-voters = <&apps_bcm_voter>;
+      clocks = <&gcc_aggre_ufs_phy_axi_clk>;
     };

-- 
2.43.0


