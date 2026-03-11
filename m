Return-Path: <linux-arm-msm+bounces-96951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJq3GbhIsWlCtAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 11:49:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9ED2628B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 11:49:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B61632B138E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9DFA3CF679;
	Wed, 11 Mar 2026 10:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C6Bc56+J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BuaNScj2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9F93CEBA5
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 10:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773225380; cv=none; b=cAfN0OINHA4tW1b6HLmkdjdL3QzZUYn7yO1Nrjokw++AUrKSy+MK0G3DvUXSw4M6k/X0alzo4OAqIGmsvRm2Jq1OJVLNTo0A7WIy+asQK4c174vN8A8Y0+Zrqe+9/jB0kjsTPKHXt5osmtmzPqvL21OASwmQBAtEsXg4szrrV7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773225380; c=relaxed/simple;
	bh=tGrNcd0y7CJU+ZVI9UlHtCqY+NuYNkZ+5bmlpSwapVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l8KKKl6RORFXJTQLxw/qzFVVWwtm4bIm6A+aeLB/Sf2pHkbglIbjjGC4jg52R79x2mqW8aQ6QUtXXjJ8Fyml7fj16xT5wyEc+Qq8ajHgBrdl4XJHG5LTeuPR1SQjv914NCx95nLVO0i9LA6SB8SWeOAWX/PQvjvSXtdEapcY9c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C6Bc56+J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BuaNScj2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B6ZkUb1439671
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 10:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XnF+hwK6IN3
	lQvtKkrLMTEvYuvQLMpmBOoiGY5dThRg=; b=C6Bc56+J53g9Dc1aHU2aflWeLhl
	6wqlAl8gxRxOdHeHzWQMWIKl1CKci29UowrmXV92cc2xA9Uah2gDOUOtesSLXTyn
	MjwHw+fmi6Psjq4adVe4xW3dzUoLrF5R3TBE3jTudI65xbTGkL0Wp4FiuW91GlOm
	YtiouPlw/uGWbLwSPAbNGspGvlZTf5spXXuMavjn+zD7o3G72uVZufNpZ4Cqj4bU
	XPq7091+cHdaXaRPrcPdsZamPDUI4jyQ+3lSoSOz91dGW7v7z0IJdDb5RVJSBFMG
	naCQm+kmx7IiX63F95Y0oB4p95OsSRZ7qqd4VlfbnRGUo58mtdOcsgCA96Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu38ygx4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 10:36:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aea7747aeeso17053405ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773225377; x=1773830177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnF+hwK6IN3lQvtKkrLMTEvYuvQLMpmBOoiGY5dThRg=;
        b=BuaNScj2fEkyo7j6J43gMqmg/fhWJyAqet7cUIxdnAtqKSt8EgkNE5KbofCucRYlaq
         GgVJXYl8r17NzYamkuzhCzx3daLh/svERFaCUlC7iG/TqhseFJfnV2twy+ALgNd60Ln+
         gMJOf3UyvIr/MwcxhNPQBx+FGzEku8hh8/IIgnUexjDVlV7hgg5byNE+O3BWOH+X+rN7
         Nqvroyn3r2nCJ5XEXTecZsY//ChS5WZrxNopy+1zdRdEvq9zlAS+YvWJmTQ0er390g+x
         tfYgal9rDdMB/Cxypcf2PB3kscUS0G1HdVfsbv5M4XvoF3PskN4ibpDsLt38VpYc8chk
         f5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773225377; x=1773830177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XnF+hwK6IN3lQvtKkrLMTEvYuvQLMpmBOoiGY5dThRg=;
        b=v0GhUAT+aW27IU0Dr6XNJbHA/2Szkg820K9RFut/IPdgXHXBhfSh7YyAnp5exfqZ7n
         3DrDznM9vS7U5lQw8TMd4JXgHtW3/RZyt1MCkk812mZ19AIygHmp4hbbFIrbxFopztY6
         9viICrsGPLM4asjq1TT087SZ+OUkTvi0LiQBw+63dWYyBkzxW5HiqGGFn1PkBNBqS/0a
         OHYh3JWfDZuGU0F4gZhxQO0p13bIE80fpu1eiA3B0KsBFr9i8ETVXTTm9SzWuHIud3ge
         BHp6ImKAnrcV9WZHfCLHUCSC8pOqgNierg+B5pTubQFNOtjXg9GzFbkIqToxZknoeE1p
         FCpw==
X-Forwarded-Encrypted: i=1; AJvYcCWFmjPUwZKgVwGuddEk5Rs1vCGmf09J7AiA/zmWkvxo6L6pqXp9iy9zTKZC9a9jiuhRV2veYyQ6pDK5dy0m@vger.kernel.org
X-Gm-Message-State: AOJu0YzEI3OeMJXmYeZMajABKIc2lx2k5/ln1bicA+XW9DKvdmsHjcGD
	SU/k/8MXWAGoZv0ik88EmGyQzSxxAShLptMK7r2W6rrY1+VRZyvhBLe8VNFoMPO2Wc25h70oRsp
	UmFLP25AwRSfqprLpQTjhoNKUrJJUi0+ZgoIF0fz7w46697uzCuRQPnqgy0lbeP91AiVHahG4VT
	xm
X-Gm-Gg: ATEYQzyzgK0cCf2YvB87Yvy534ZgWTuGvkA1nGGeNXK2A0/zQgKDFlnjJ1ZsjglPG9i
	+u0W+o8LTtdo/qKEUTTR35KEowjaf6O8yn6faT1+Ihy1pnTp2Jva4871DlEkyqEWoBiSRkCQy2n
	LwmUF+LSE/CDLfmtQyyaRt3jw+78uotQxz8ajID4fzRqn71WAL+oj05Xe6uflZy72rI51JhKXBA
	CkfcQOpf3T7g6SsqEHKzcvZZ67un/aYt1P/cWCRqi1qaeLaDmJgsBj8kX2ezOrqVn2RSauyAvCo
	l7Wwmmk3Bov9HBlesLx0anMKkb1yVSv8Dp1YSXhxXy1+NSjx3MwPfVDdH2BbhDV3jA+rO+VT8nF
	tFD5BBRZMKxzZp6S92CLT0NueSIobOZeu8yaE7vZ8PdzYomYwFBWZIZA=
X-Received: by 2002:a17:903:1249:b0:2ae:4fc8:3f5d with SMTP id d9443c01a7336-2aeae90b614mr21054475ad.48.1773225376881;
        Wed, 11 Mar 2026 03:36:16 -0700 (PDT)
X-Received: by 2002:a17:903:1249:b0:2ae:4fc8:3f5d with SMTP id d9443c01a7336-2aeae90b614mr21054065ad.48.1773225376299;
        Wed, 11 Mar 2026 03:36:16 -0700 (PDT)
Received: from hu-okukatla-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae378a28sm21042925ad.88.2026.03.11.03.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:36:16 -0700 (PDT)
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: interconnect: qcom,qcs615-rpmh: add clocks property to enable QoS
Date: Wed, 11 Mar 2026 16:05:46 +0530
Message-ID: <20260311103548.1823044-2-odelu.kukatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311103548.1823044-1-odelu.kukatla@oss.qualcomm.com>
References: <20260311103548.1823044-1-odelu.kukatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4OCBTYWx0ZWRfXzvwvnH3070HS
 n7ultX9WaHuXSrap1B4eH9zVUSK0fLwdGXaDHWjpM6otN9yTiA+dGagqbvsWnI/0UNdzEmF7/6Y
 eNB5V9zoBPLFkLAqUId2CI0hlsH81A1YcZS7VV9nRyy2HN8cv4PBhHtF1+0rn3FckaW+DOxvbkL
 cwETXFrMRinuHPyaRtqQM15+CZfva6cwBXlDRHYUfzz+w1TwYf7y+1HjhCXJIgOSxP+CRuY3Wcx
 QVkFFQMvMaFWuLZVC8wtEVqrVEKPVZSRiXpq66qWvRKSdzC0MVSWXNIrihQfiaM/L0MuhAMcjU8
 L1yhS96pcaktcm3+vRYJ0Rt7JH6GAHKt4sQCtYWHoBMzAj0ZDtHS3wib34BwCLLs3TN+hFYyQIF
 wbPxEDeFEjV5l+HHeP2WqqsRpwFT1Fehi11mOJbtswTT1q1IDA6cIm1d5u7KoZbHOMCYFcnU84d
 a6MXre3fAstqw0mg13g==
X-Proofpoint-GUID: 5-PfFFU2wYHXDqXYR3LAT5oWSr1wjqxJ
X-Proofpoint-ORIG-GUID: 5-PfFFU2wYHXDqXYR3LAT5oWSr1wjqxJ
X-Authority-Analysis: v=2.4 cv=Cq+ys34D c=1 sm=1 tr=0 ts=69b145a2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ulcEZqAivlg-R9bOFCgA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110088
X-Rspamd-Queue-Id: 0F9ED2628B5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96951-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.25.240.160:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[odelu.kukatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Aggre1-noc interconnect node on QCS615 has QoS registers located
inside a block whose interface is clock-gated. Accessing these
registers requires the corresponding clock(s) to be enabled.
Update the bindings to include the 'clocks' property.

Ensure that only aggre1-noc interconnect node uses this property
by explicitly forbidding it for all other interconnect nodes.

Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
---
 .../interconnect/qcom,qcs615-rpmh.yaml        | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,qcs615-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,qcs615-rpmh.yaml
index e06404828824..ada0bf15845d 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,qcs615-rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,qcs615-rpmh.yaml
@@ -34,6 +34,13 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    items:
+      - description: aggre UFS PHY AXI clock
+      - description: aggre USB2 SEC AXI clock
+      - description: aggre USB3 PRIM AXI clock
+      - description: RPMH CC IPA clock
+
 required:
   - compatible
 
@@ -53,6 +60,22 @@ allOf:
       required:
         - reg
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcs615-camnoc-virt
+              - qcom,qcs615-config-noc
+              - qcom,qcs615-dc-noc
+              - qcom,qcs615-gem-noc
+              - qcom,qcs615-mc-virt
+              - qcom,qcs615-mmss-noc
+              - qcom,qcs615-system-noc
+    then:
+      properties:
+        clocks: false
+
 unevaluatedProperties: false
 
 examples:
@@ -69,3 +92,14 @@ examples:
         #interconnect-cells = <2>;
         qcom,bcm-voters = <&apps_bcm_voter>;
     };
+
+    aggre1_noc: interconnect@1700000 {
+        compatible = "qcom,qcs615-aggre1-noc";
+        reg = <0x1700000 0x3f200>;
+        #interconnect-cells = <2>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+        clocks = <&gcc_aggre_ufs_phy_axi_clk>,
+                 <&gcc_aggre_usb2_sec_axi_clk>,
+                 <&gcc_aggre_usb3_prim_axi_clk>,
+                 <&rpmhcc_rpmh_ipa_clk>;
+    };
-- 
2.43.0


