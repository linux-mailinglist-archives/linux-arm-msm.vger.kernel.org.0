Return-Path: <linux-arm-msm+bounces-90677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HmONj9/eGkFqQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:02:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F77C91703
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:02:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D670305237D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D8C5333420;
	Tue, 27 Jan 2026 09:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ltZ9Es4A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h/adpnTU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3F5333440
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769504519; cv=none; b=PYlJ33RgT1IZsbQ8abeK57PKtOX9k9XEzL9NHEEk3b26Gp8fIctZI6kx8tTCfFUHm5q+ov3WQALl7T+RR13HKbFkRVoQTzV4uglDBUDHz16T1jcFf4n8wjaC9XYp0wy73sU1SynoAKz+/QUhk5iZhaEIh6gwp5ucD/QsKvbgcSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769504519; c=relaxed/simple;
	bh=Oik/qwTKsOA6npTm0TkNDx86wTm/52/PPO9Xasj6gTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gyv92Yz3/wIzaAlLT1wa1PapagnWc94b+S9bGsh231y0GRr98h+lqY1bc8YPmT2fJmO8N17G6yhkspfPGn9eHQxOxkjwaKMrtfjQh6uKYeXiPOABV2/DPeOUu0TxtHNINtU2s9leiFNFceFKFWnANcGFoTUiMG20mkoPqqwkwnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ltZ9Es4A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h/adpnTU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4U7Md786852
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ITz6w/Q2w67Ducysc+bZG/olR38WeARfEZrkn5j4QzM=; b=ltZ9Es4AGHOwn0Dx
	BKzhQMERsyzO8iV+NG6a1o3O8h7UyMG+PsMJGaDo8Vkg2PenXk03Z6WsI05owVX1
	Fasvclv3l6qyd30iwLWubjv8hC9jZxU4zY0lqrx19VXEJ1lqWUiQ/pOHiCPY5WOO
	4WCuedSVtNiIVMjEEBakhbTQwr/D9Afmxb+Ort4ZLlbgaV5cydHjol2ksww3oZTx
	mvcXe/J3tbW6A4dCcZsj6z7MFq6OMT108WpKlH1062WOP4/kNMGawgCT4plK+TKI
	X+n+JMx//adIDq7tuX0o9p9oNa4J4DgZ1TXWAvymu859m1FjmR2UkP34mDY1NZcW
	oBlMyQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxg93hwnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:01:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81efa628efbso4932057b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 01:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769504510; x=1770109310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITz6w/Q2w67Ducysc+bZG/olR38WeARfEZrkn5j4QzM=;
        b=h/adpnTUUKY5cXD6CtlUbLu+3fDh9AfSvT4EsflaSTBsnrAsM7cdvfgfmELfzpxblD
         grl9NIpdzWIG2XZ85Eno0G/nyUIN2i0wQqcmn5I1WDwm1jBLX77eWwjIcb0pwklgJk0t
         6NnnLZPAUUR+bmU1VbK8WgX92vS/wKKv8sba2aFXLt+ly7aXHii0n9WLwpHt5Lp76BR5
         JXu4fADR2xXTseoaVLR3jh5+zI/eOO5XbzqrLFNGuaU1uNK8P6zERbwB+XFIiCasvN7m
         y1z3YZi9B56MRnlAGSoAm6yRFaGP/ABw/74Ls1qY/PKXiYk+gxRTiaKXpEZi0RZYLujk
         TWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769504510; x=1770109310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ITz6w/Q2w67Ducysc+bZG/olR38WeARfEZrkn5j4QzM=;
        b=GwSsHmdoeLHS6MXpl8FF8BYyIwVtQ69rSlY7/jjRUMjxVGJ0twhKuSSAODuP/RzwdL
         EwjSmn2oOyMICrBdsDxOQt9UYIARNv6ZvkxOrPdppSBcqYRrAfgiJ3LRfb3nWlvX6rgJ
         L4xtLtuvRUcN4zYmR2eQzydjMDTf2vAp2BncXKNHkMzCVPS9kH+Qm0igvhImTtjKoPwM
         VlF2d5Piv3ncpVf5rTpcsxpZQJ5b97lRKGQPPFyaE5Kmheap6mdjQQ3V2tPwMSiOKve8
         1mFnSReVk8lfrz1PgNMJgfhxCqSLlAnAJnTyGWK7fOAMwcW5awATXc+cSjIu4MOfUgow
         TTcA==
X-Forwarded-Encrypted: i=1; AJvYcCXQsbS4G38d0jEVVTEHzMtI9NlTIRVwtSvzvhEJsIZuhm+sEVoQWCE/iqSHxq4A8/E7nsQmtjbT6xpV5Zem@vger.kernel.org
X-Gm-Message-State: AOJu0YxqaY5910GMPDHqEALj1jytWtEb3fttYF/IgTOQL59SU0olVM9c
	ctwn/4Y4D4LKW/m24u8W/B/RsjbXm1+MGU2MPGGp+H/KU10OWsItTTEOt/zkL9kloFESAEEh89v
	6hEsB0gZ8OsSCtbxATgWmStv503juzCXSh52LF5Z/4iyXysdAtai6G6VnUKqNthaV0JwF
X-Gm-Gg: AZuq6aJSzZYiOgA4U2kRIwdkuRfa6NydU3Ub3qUogl4LbyHK+1yY9AEpDyY64j+yE2s
	Gar8mazb++udfehCwXjB1XKji0VOguSKEbOYV9WPQvKJFyuCDOo6gNAsqZWYGTti9Ewx4pI2c3S
	QplQeX4akwuv6yK5GhGdiHg7vpxUmMXSDbEc/q2EYcJuLVQjIzSRbIKk3BazVFdQcuXHKWz7S7u
	63E5eNdvhgmt3DdiPbIf+MV/9boNBT9jYE6+c52dVFkCtRICGmMNwIwHTH4s0an7ZCxMB/bNe0/
	bp8y4mkpNsH/OAI53vKp/bkXPGUD3I7dWu8tV52rDcvlB6RDvgQPd3fb150aiN/9GpnG8G0gtNQ
	KGN2LN+i60sJcv42NmG1LkRmjfdMRy4Jd1XwZQoIKnzo=
X-Received: by 2002:a05:6a00:1a17:b0:81b:c2b5:31a with SMTP id d2e1a72fcca58-823692bf878mr1087402b3a.53.1769504509691;
        Tue, 27 Jan 2026 01:01:49 -0800 (PST)
X-Received: by 2002:a05:6a00:1a17:b0:81b:c2b5:31a with SMTP id d2e1a72fcca58-823692bf878mr1087369b3a.53.1769504509180;
        Tue, 27 Jan 2026 01:01:49 -0800 (PST)
Received: from hu-okukatla-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231873bf53sm11579228b3a.45.2026.01.27.01.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 01:01:48 -0800 (PST)
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: interconnect: qcom,qcs8300-rpmh: add clocks property to enable QoS
Date: Tue, 27 Jan 2026 14:31:14 +0530
Message-ID: <20260127090116.1438780-2-odelu.kukatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127090116.1438780-1-odelu.kukatla@oss.qualcomm.com>
References: <20260127090116.1438780-1-odelu.kukatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA3MyBTYWx0ZWRfX1iKE1kckycuL
 JuDSbR9D82fH+CBTMVTVx8bYkp8YA1zoEEOpf3+zB2JNvtY6gvF6CxVW9qB/mzao/7G9Xix8JCR
 25p1Pz+tPkSQnz7wd/0B7rmmN57bU8uSgCT74OI+ei1mOzgdU/aMBrr/NIMBZI2oOSoOvMyZqwK
 D9GomoylZ87N7Kaul9GJeveW21tkQcrzpp/QvpfGXHBuaBXE53t5LNQ2RjYOxTjf1TxpizA75gQ
 mdAB35gif/pJhOWKM0rlgj9M59T1YCfxP9zNt4gNKjxnFtE6OI3++GPpuDZGeQ9fawitRGLu7G0
 0UJkzYzZT/ZngnVjSmBV0jAcKQ7w3JSqPbBWw5uQ/z90/4ofMJlo6DxHHabp2YLCEh506USIJWC
 wrHnTwirVuwrn0pu4jiyrnmkSZJUxWan7WhGL98Dc+oke+7uUhvLXSJHRogSC+zZi1Cj/wenYhh
 x0fitgXGfvKGOgPy3Sg==
X-Authority-Analysis: v=2.4 cv=Uc1ciaSN c=1 sm=1 tr=0 ts=69787efe cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OrdcpLHLpR68xOABugYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: EMWnjlqchWFkU0BRL48H1mqg9pYAR0BM
X-Proofpoint-GUID: EMWnjlqchWFkU0BRL48H1mqg9pYAR0BM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270073
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90677-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[odelu.kukatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9F77C91703
X-Rspamd-Action: no action

Some QCS8300 interconnect nodes have QoS registers located inside
a block whose interface is clock-gated. For those nodes, driver
must enable the corresponding clock(s) before accessing the
registers. Add the 'clocks' property so the driver can obtain
and enable the required clock(s).

Only interconnects that have clock‑gated QoS register interface
use this property; it is not applicable to all interconnect nodes.

Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
---
 .../interconnect/qcom,qcs8300-rpmh.yaml       | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,qcs8300-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,qcs8300-rpmh.yaml
index e9f528d6d9a8..88fe17277110 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,qcs8300-rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,qcs8300-rpmh.yaml
@@ -35,6 +35,10 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    minItems: 1
+    maxItems: 4
+
 required:
   - compatible
 
@@ -54,6 +58,64 @@ allOf:
       required:
         - reg
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcs8300-aggre1-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre UFS PHY AXI clock
+            - description: aggre QUP PRIM AXI clock
+            - description: aggre USB2 PRIM AXI clock
+            - description: aggre USB3 PRIM AXI clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcs8300-aggre2-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: RPMH CC IPA clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcs8300-gem-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: GCC DDRSS GPU AXI clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcs8300-clk-virt
+              - qcom,qcs8300-config-noc
+              - qcom,qcs8300-dc-noc
+              - qcom,qcs8300-gpdsp-anoc
+              - qcom,qcs8300-lpass-ag-noc
+              - qcom,qcs8300-mc-virt
+              - qcom,qcs8300-mmss-noc
+              - qcom,qcs8300-nspa-noc
+              - qcom,qcs8300-pcie-anoc
+              - qcom,qcs8300-system-noc
+    then:
+      properties:
+        clocks: false
+
 unevaluatedProperties: false
 
 examples:
@@ -63,6 +125,7 @@ examples:
         reg = <0x9100000 0xf7080>;
         #interconnect-cells = <2>;
         qcom,bcm-voters = <&apps_bcm_voter>;
+        clocks = <&gcc_ddrss_gpu_axi_clk>;
     };
 
     clk_virt: interconnect-0 {
-- 
2.43.0


